CREATE TABLE badges(
    id_badges integer NOT NULL generated always as identity (start with 30 increment by 1),
    badge_name character varying(255),
    badge_type character varying(255),
    badge_level character varying(255),
    badge_action character varying(255),
    image_type character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- ALTER TABLE ONLY public.badges
--     ADD CONSTRAINT id_tree_taxonomy_fkey 
--     FOREIGN KEY (id_tree_taxonomy) 
--     REFERENCES tree_taxonomy(id_tree_taxonomy) 
--     ON UPDATE CASCADE ON DELETE CASCADE;