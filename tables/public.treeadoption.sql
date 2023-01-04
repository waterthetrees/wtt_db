
CREATE TABLE public.treeadoption (
    id_adopted integer NOT NULL,
    id_tree integer NOT NULL,
    common character varying(255) NOT NULL,
    nickname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified timestamp without time zone,
    id bigint NOT NULL
);


ALTER TABLE public.treeadoption OWNER TO trees;


ALTER TABLE public.treeadoption ALTER COLUMN id_adopted ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treeadoption_id_adopted_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.treeadoption
    ADD CONSTRAINT treeadoption_pkey PRIMARY KEY (id_adopted);



CREATE INDEX treeadoption_id_adopted_idx ON public.treeadoption USING btree (id_adopted);



CREATE INDEX treeadoption_id_idx ON public.treeadoption USING btree (id);



CREATE INDEX treeadoption_id_idx1 ON public.treeadoption USING btree (id);



ALTER TABLE ONLY public.treeadoption
    ADD CONSTRAINT id_tree_fkey FOREIGN KEY (id_tree) REFERENCES public.treedata(id_tree) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY public.treeadoption
    ADD CONSTRAINT treeadoption_id_fkey FOREIGN KEY (id) REFERENCES public.treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;



