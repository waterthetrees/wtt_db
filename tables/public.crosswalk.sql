
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
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    class character varying(255),
    longitude character varying(255),
    latitude character varying(255),
    who character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    country character varying(255),
    neighborhood character varying(255),
    url character varying(255),
    urlimage character varying(255),
    status character varying(255),
    email character varying(255),
    volunteer character varying(255),
    notes character varying(255),
    legal_status character varying(255),
    irrigation character varying(255),
    water_freq character varying(255),
    watering_end_date character varying(255),
    last_watered character varying(255),
    count character varying(255),
    dbh_min character varying(255),
    dbh_max character varying(255),
    height_min character varying(255),
    height_max character varying(255),
    crown_min character varying(255),
    crown_max character varying(255)
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



