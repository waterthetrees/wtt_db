# POSTGIS cheatsheet

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