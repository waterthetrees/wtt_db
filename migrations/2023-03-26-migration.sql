
-- drop table public.tree_sources_staging;
CREATE UNLOGGED TABLE treedata_staging (
    id_treedata_staging bigserial not null primary key,
    geom         geometry(Point,4326),
    id           character varying(255),
    ref          character varying (255),
    idname       character varying(255),
    city         character varying(255),
    country      character varying(255),
    email        character varying(255),
    download     character varying(255),
    info         character varying(255),
    lat          double precision,
    lng          double precision,
    count        integer,

    -- crosswalk fields, as per opentrees schema
    scientific   character varying(255),
    genus       character varying(255),
    species     character varying(255),
    variety     character varying(255),
    common      character varying(255),
    dbh         character varying(255),
    health      character varying(255),
    height      character varying(255),
    crown       character varying(255),
    spread      character varying(255),
    ule         character varying(255),
    updated     character varying(255),
    planted     character varying(255),
    note        character varying(255),

    address     character varying(255),
    created     timestamp without time zone
);


ALTER TABLE tree_sources_staging OWNER TO trees;
