SELECT  1;

-- drop table public.tree_staging;
CREATE UNLOGGED TABLE public.tree_staging (
    id           bigserial not null primary key,
    geom         geometry(Point,4326),
    ref          character varying (255),
    dbh          character varying (255),
    scientific   character varying(255),
    common       character varying(255),
    health       character varying(255),
    sourceid     character varying(255),
    city         character varying(255),
    country      character varying(255),
    email        character varying(255),
    download     character varying(255),
    info         character varying(255),
    lat          double precision,
    lng          double precision,
    count        integer,
    address      character varying(255),
    family       character varying(255),
    variety      character varying(255),
    species      character varying(255),
    genus        character varying(255),
    owner        character varying(255),
    planted      timestamp without time zone,
    note         character varying(255),
    height       character varying(255),
    crown        character varying(255),
    spread       character varying(255),
    ule          character varying(255),
    updated      timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created      timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tree_staging OWNER TO trees;
