
CREATE UNLOGGED TABLE public.treedata_staging (
    id_treedata_staging bigint NOT NULL,
    geom public.geometry(Point,4326),
    id character varying(255),
    id_reference character varying(255),
    id_source_name character varying(255),
    city character varying(255),
    country character varying(255),
    email character varying(255),
    download character varying(255),
    info character varying(255),
    lat double precision,
    lng double precision,
    count integer,
    scientific character varying(255),
    genus character varying(255),
    species character varying(255),
    variety character varying(255),
    common character varying(255),
    dbh character varying(255),
    health character varying(255),
    height character varying(255),
    crown character varying(255),
    spread character varying(255),
    ule character varying(255),
    updated character varying(255),
    planted character varying(255),
    note character varying(255),
    address character varying(255),
    created timestamp without time zone
);


ALTER TABLE public.treedata_staging OWNER TO trees;


CREATE SEQUENCE public.treedata_staging_id_treedata_staging_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.treedata_staging_id_treedata_staging_seq OWNER TO trees;


ALTER SEQUENCE public.treedata_staging_id_treedata_staging_seq OWNED BY public.treedata_staging.id_treedata_staging;



ALTER TABLE ONLY public.treedata_staging ALTER COLUMN id_treedata_staging SET DEFAULT nextval('public.treedata_staging_id_treedata_staging_seq'::regclass);



ALTER TABLE ONLY public.treedata_staging
    ADD CONSTRAINT treedata_staging_pkey PRIMARY KEY (id_treedata_staging);



