# POSTGIS cheatsheet

## TO COPY LARGE CSV

1. Disable geom trigger 
2. Copy data from csv 
3. update geom column 
4. enable geom trigger

```shell
$ psql -U trees -d treedb
treedb=> ALTER TABLE treedata DISABLE TRIGGER geom_update;
treedb=> \COPY treedata FROM '/home/trees/oakland_tree_survey_massaged.csv' DELIMITER ',' CSV HEADER;
treedb=> UPDATE treedata SET geom = ST_SetSRID(ST_MakePoint(lng, lat), 4326);
treedb=> ALTER TABLE treedata ENABLE TRIGGER geom_update;
```

ALTER TABLE treedata DISABLE TRIGGER geom_update;

\COPY treedata FROM '/home/trees/Alameda_street_trees_clean_min_geom.csv' DELIMITER ',' CSV HEADER;

UPDATE treedata SET geom = ST_SetSRID(ST_MakePoint(lng, lat), 4326);

ALTER TABLE treedata ENABLE TRIGGER geom_update;

## If you MESS UP the DATA import
DELETE FROM treedata WHERE id_tree >= 141000;

## In db data massaging
UPDATE treedata SET who = 'City of Oakland Survey 2020' WHERE id_tree >= 70000 AND id_tree <= 140997;

## Add city users

insert into users ( volunteer,nickname,name,email,zipcode,created) values ('sfdpw','sfdpw','San Francisco Public Works','urbanforestry@sfdpw.org','94103','2021-04-19 11:11:11.111111' );

## Add extra city columns

ALTER TABLE treedata ADD COLUMN legal_status VARCHAR;

## Add Indexes geom
DROP INDEX treedata_geom_idx;
CREATE INDEX treedata_geom_idx ON treedata USING GIST (geom);

## Add regular btree index
CREATE INDEX ON treedata (geom);

## Show triggers
\dS <tablename>

## how trigger-function
\df+ <functionname>

https://postgresql.r2schools.com/how-to-install-postgis-in-ubuntu/

https://postgis.net/install/ for osx/ubuntu

CREATE EXTENSION postgis;

ALTER TABLE treedata ADD COLUMN geom geometry(Point,4326);

UPDATE treedata SET geom = ST_SetSRID(ST_MakePoint(lng, lat), 4326);

<!-- UPDATE treedata SET geom = ST_Transform(ST_SetSRID(ST_MakePoint(lng, lat), 4326),26913); -->

select common, st_astext( ST_Transform( geom, 4326 ) )  from treedata;

select common, st_astext( ST_Transform( geom, 4326 ) ) AS geom from treedata;

<!-- 
SELECT ST_AsText(ST_AsMVTGeom(
	ST_GeomFromText('POLYGON ((0 0, 10 0, 10 5, 0 -5, 0 0))'),
	ST_MakeBox2D(ST_Point(0, 0), ST_Point(4096, 4096)),
	4096, 0, false));
@37.0625,-95.677068,4z
SELECT ST_AsMVT(q, 'testlayer', 4096, 'geom')
    FROM (
      SELECT
          common,
          ST_AsMVTGeom(
              geom,
              ST_MakeEnvelope(${bbox[0]}, ${bbox[1]}, ${bbox[2]}, ${bbox[3]}, 4326),
              4096,
              256,
              false
          ) geom
      FROM treedata c
    ) q
  `; -->


CREATE OR REPLACE FUNCTION countCityTrees() RETURNS TRIGGER AS $example_table$
   BEGIN
      INSERT INTO AUDIT(EMP_ID, ENTRY_DATE) VALUES (new.ID, current_timestamp);
      RETURN NEW;
   END;
$example_table$ LANGUAGE plpgsql;

CREATE FUNCTION public.count_city_trees() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        NEW.count = now();
        RETURN NEW;
    END;
$$;

CREATE FUNCTION count_increment() RETURNS TRIGGER AS $_$
BEGIN
UPDATE cities SET count = count + 1 WHERE treedata = TG_RELID;
RETURN NEW;
END $_$ LANGUAGE 'plpgsql';

CREATE FUNCTION count_decrement() RETURNS TRIGGER AS $_$
BEGIN
UPDATE cities SET count = count - 1  WHERE treedata = TG_RELID;
RETURN NEW;
END $_$ LANGUAGE 'plpgsql';

CREATE TRIGGER cities_increment_trig AFTER INSERT ON treedata FOR EACH ROW EXECUTE PROCEDURE count_increment();
CREATE TRIGGER cities_decrement_trig AFTER DELETE ON treedata FOR EACH ROW EXECUTE PROCEDURE count_decrement();
DROP TRIGGER update_treedata_modtime on public.treedata;
CREATE TRIGGER update_treedata_modtime AFTER UPDATE ON public.treedata FOR EACH ROW EXECUTE FUNCTION public.update_modified_column();
