
CREATE TABLE public.badges (
    id_badges integer NOT NULL,
    badge_name character varying(255),
    badge_type character varying(255),
    badge_level character varying(255),
    badge_action character varying(255),
    image_type character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.badges OWNER TO trees;


ALTER TABLE public.badges ALTER COLUMN id_badges ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.badges_id_badges_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



