
CREATE TABLE public.treedata (
    id_tree integer NOT NULL,
    id_wtt character varying(255),
    id_reference character varying(255),
    who character varying(255),
    common character varying(255),
    scientific character varying(255),
    genus character varying(255),
    lng double precision,
    lat double precision,
    date_planted timestamp without time zone,
    address character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    country character varying(255),
    neighborhood character varying(255),
    health character varying(255),
    dbh character varying(255),
    height character varying(255),
    owner character varying(255),
    url character varying(255),
    urlimage character varying(255),
    status character varying(255),
    notes text,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email character varying(255),
    volunteer character varying(255),
    modified timestamp without time zone,
    planting_opt1 character varying(255),
    planting_opt1_com character varying(255),
    planting_opt2 character varying(255),
    planting_opt3 character varying(255),
    side_type character varying(50),
    location_tree_count character varying(10),
    geom public.geometry(Point,4326),
    legal_status character varying,
    irrigation boolean,
    water_freq integer DEFAULT 14,
    watering_end_date timestamp without time zone,
    last_watered timestamp without time zone,
    id bigint NOT NULL,
    source_id character varying(255),
    species character varying(255),
    family character varying(255),
    class character varying(255),
    red character varying(255),
    ref character varying(255),
    iso_alpha_2 character varying(2),
    iso_alpha_3 character varying(3),
    numeric_country_code integer DEFAULT 0,
    info text,
    download text,
    count integer DEFAULT 1,
    planted character varying(255),
    variety character varying(255),
    location character varying(255),
    dbh_min integer,
    dbh_max integer,
    height_min integer,
    height_max integer,
    crown_min integer,
    crown_max integer
);


ALTER TABLE public.treedata OWNER TO trees;


ALTER TABLE public.treedata ALTER COLUMN id_tree ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treedata_id_tree_seq
    START WITH 3000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.treedata
    ADD CONSTRAINT treedata_pk PRIMARY KEY (id_tree);



CREATE UNIQUE INDEX id_geohash ON public.treedata USING btree (id);



CREATE INDEX treedata_geom_idx ON public.treedata USING gist (geom);



CREATE INDEX treedata_id_idx ON public.treedata USING btree (id);



CREATE INDEX treedata_id_tree_idx ON public.treedata USING btree (id_tree);



CREATE TRIGGER geom_update AFTER INSERT ON public.treedata FOR EACH ROW EXECUTE FUNCTION public.add_geom();



ALTER TABLE ONLY public.treedata
    ADD CONSTRAINT treedata_planted_by_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);



ALTER TABLE ONLY public.treedata
    ADD CONSTRAINT treedata_planted_by_nickname_fkey FOREIGN KEY (volunteer) REFERENCES public.users(nickname);



