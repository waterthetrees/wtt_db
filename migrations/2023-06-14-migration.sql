CREATE TABLE treeimages(
    id_image integer NOT NULL generated always as identity (start with 30 increment by 1),
    image_description character varying(255),
    image_url character varying(255),
    image_filename character varying(255),
    photographer character varying(255),
    image_type character varying(255),
    image_number integer NOT NULL default 0,
    id character varying(255),
    email character varying(255) NOT NULL,
    -- We want to join with the treedata table - one image to many different tree ids locations
    -- TODO: one image to one unique tree in tree_taxonomy - ths is not built yet
    id character varying(255),

    -- We want to join with the user table - one image to one user
    email character varying(255) NOT NULL,
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);



-- CREATE TABLE treedata_images (
--   id_treedata_images integer NOT NULL generated always as identity (start with 30 increment by 1),
--   id_image bigint REFERENCES tree_images (id_image) ON UPDATE CASCADE ON DELETE CASCADE,
--   id int REFERENCES treedata (id),
--   CONSTRAINT treedata_images_pkey PRIMARY KEY (id, id_image)  -- explicit pk
-- );

ALTER TABLE ONLY public.tree_images
    ADD CONSTRAINT tree_image_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);

ALTER TABLE ONLY public.treedata
    ADD CONSTRAINT tree_image_fkey FOREIGN KEY (id) REFERENCES public.treedata(id);


ALTER TABLE ONLY public.treedata
    ADD CONSTRAINT tree_image_fkey FOREIGN KEY (tree_image_id) REFERENCES public.users(tree_image_id);

