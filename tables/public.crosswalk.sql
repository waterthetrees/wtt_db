
CREATE TABLE public.crosswalk (
    id_crosswalk integer NOT NULL,
    id_source_name character varying(255),
    common character varying(255),
    species character varying(255),
    genus character varying(255),
    scientific character varying(255),
    family character varying(255),
    variety character varying(255),
    dbh character varying(255),
    height character varying(255),
    structure character varying(255),
    trunks character varying(255),
    age character varying(255),
    health character varying(255),
    crown character varying(255),
    spread character varying(255),
    planted character varying(255),
    updated character varying(255),
    location character varying(255),
    note character varying(255),
    address character varying(255),
    id_reference character varying(255),
    owner character varying(255),
    ule character varying(255),
    ule_min character varying(255),
    ule_max character varying(255),
    cost character varying(255),
    gps_date character varying(255),
    audited character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.crosswalk OWNER TO trees;


ALTER TABLE public.crosswalk ALTER COLUMN id_crosswalk ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.crosswalk_id_crosswalk_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.crosswalk
    ADD CONSTRAINT crosswalk_id_fkey FOREIGN KEY (id_source_name) REFERENCES public.sources(id_source_name) ON UPDATE CASCADE ON DELETE CASCADE;



