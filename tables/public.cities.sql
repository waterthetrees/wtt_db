
CREATE TABLE public.cities (
    id_city integer NOT NULL,
    city character varying(255),
    lng double precision,
    lat double precision,
    email character varying(255),
    who character varying(255),
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    count integer,
    country text,
    city_count_trees integer DEFAULT 0,
    modified timestamp without time zone,
    id character varying(255),
    short character varying(255),
    info text,
    download text,
    format character varying(255)
);


ALTER TABLE public.cities OWNER TO trees;


ALTER TABLE public.cities ALTER COLUMN id_city ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_city_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_city_key UNIQUE (city);



CREATE INDEX cities_city_idx ON public.cities USING btree (city);



CREATE INDEX cities_id_city_idx ON public.cities USING btree (id_city);



