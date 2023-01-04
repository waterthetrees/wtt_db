
CREATE TABLE public.tree_taxonomy (
    id_tree_taxonomy integer NOT NULL,
    id character varying(255),
    common character varying(255),
    scientific character varying(255),
    genus character varying(255),
    species character varying(255),
    family character varying(255),
    class character varying(255),
    phylum character varying(255),
    kingdom character varying(255),
    fia_code character varying(255),
    conservation_status character varying(255),
    max_height integer,
    max_diameter_trunk integer,
    max_diameter_crown integer,
    native_country character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tree_taxonomy OWNER TO trees;


ALTER TABLE public.tree_taxonomy ALTER COLUMN id_tree_taxonomy ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tree_taxonomy_id_tree_taxonomy_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



