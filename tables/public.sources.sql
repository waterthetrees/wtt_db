
CREATE TABLE public.sources (
    id_sources integer NOT NULL,
    id_source_name character varying(255),
    short character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    iso_alpha_2 character varying(2),
    iso_alpha_3 character varying(3),
    numeric_country_code integer DEFAULT 0,
    long character varying(255),
    main character varying(255),
    center character varying(255),
    longitude double precision,
    latitude double precision,
    email character varying(255),
    contact character varying(255),
    who character varying(255),
    phone character varying(255),
    trees_per_source_count integer DEFAULT 0,
    country_code character varying(10),
    broken boolean DEFAULT false,
    notes character varying(255),
    info text,
    download text,
    format character varying(255),
    filename character varying(255),
    gdal_options character varying(255),
    license character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.sources OWNER TO trees;


ALTER TABLE public.sources ALTER COLUMN id_sources ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sources_id_sources_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE UNIQUE INDEX id_idx ON public.sources USING btree (id_source_name);



