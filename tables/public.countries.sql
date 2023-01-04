
CREATE TABLE public.countries (
    id_country integer NOT NULL,
    country character varying(255) NOT NULL,
    country_count_trees integer DEFAULT 0,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified timestamp without time zone,
    country_count_cities integer DEFAULT 0,
    country_short character varying(64),
    country_code character varying(64),
    lng double precision,
    lat double precision
);


ALTER TABLE public.countries OWNER TO trees;


ALTER TABLE public.countries ALTER COLUMN id_country ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.countries_id_country_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_unique UNIQUE (country);



