CREATE TABLE treesources(
    id_sources integer NOT NULL generated always as identity (start with 30 increment by 1),
    id character varying(255),
    short character varying(255),
    city character varying(255),
    long character varying(255),
    id_city_name character varying(255),
    primary_source character varying(255),
    center character varying(255),
    lng double precision,
    lat double precision,
    email character varying(255),
    contact character varying(255),
    who character varying(255),
    country text,
    trees_per_source_count integer DEFAULT 0,
    country_code character varying(10),
    broken_download boolean DEFAULT false,
    info text,
    download text,
    download_extension character varying(255),
    download_filename character varying(255),
    gdal_options character varying(255),
    license character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE crosswalk(
  id_sources integer NOT NULL generated always as identity (start with 30 increment by 1),
  id character varying(255),
  common character varying(255),
  species character varying(255),
  genus character varying(255),
  scientific character varying(255),
  dbh float,
  height float,
  planted character varying(255),
  notes character varying(255),
  address character varying(255),
  reference_id character varying(255),
  owner character varying(255)
);

CREATE UNIQUE INDEX id_source ON sources (id);
ALTER TABLE ONLY crosswalk ADD CONSTRAINT crosswalk_id_fkey FOREIGN KEY (id) REFERENCES sources(id) ON UPDATE CASCADE ON DELETE CASCADE;