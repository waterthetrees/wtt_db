
CREATE TABLE public.treelikes (
    id_liked integer NOT NULL,
    id_tree integer NOT NULL,
    common character varying(255) NOT NULL,
    nickname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified timestamp without time zone,
    id bigint NOT NULL
);


ALTER TABLE public.treelikes OWNER TO trees;


ALTER TABLE public.treelikes ALTER COLUMN id_liked ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treelikes_id_liked_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.treelikes
    ADD CONSTRAINT treelikes_pkey PRIMARY KEY (id_liked);



CREATE INDEX treelikes_id_idx ON public.treelikes USING btree (id);



CREATE INDEX treelikes_id_idx1 ON public.treelikes USING btree (id);



CREATE INDEX treelikes_id_liked_idx ON public.treelikes USING btree (id_liked);



ALTER TABLE ONLY public.treelikes
    ADD CONSTRAINT id_tree_fkey FOREIGN KEY (id_tree) REFERENCES public.treedata(id_tree) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY public.treelikes
    ADD CONSTRAINT treelikes_id_fkey FOREIGN KEY (id) REFERENCES public.treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;



