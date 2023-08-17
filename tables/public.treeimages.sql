
CREATE TABLE public.treeimages (
    id_image integer NOT NULL,
    image_description character varying(255),
    image_url character varying(255),
    image_filename character varying(255),
    photographer character varying(255),
    image_type character varying(255),
    image_number integer DEFAULT 0 NOT NULL,
    id character varying(255),
    email character varying(255) NOT NULL,
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.treeimages OWNER TO trees;


ALTER TABLE public.treeimages ALTER COLUMN id_image ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treeimages_id_image_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



