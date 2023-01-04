
CREATE TABLE public.treehistory (
    id_treehistory integer NOT NULL,
    id_tree integer,
    watered character varying(255),
    mulched character varying(255),
    pruned character varying(255),
    staked character varying(255),
    braced character varying(255),
    weeded character varying(255),
    comment text,
    volunteer character varying(255),
    date_visit timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified timestamp without time zone,
    adopted boolean,
    liked boolean,
    id bigint NOT NULL
);


ALTER TABLE public.treehistory OWNER TO trees;


ALTER TABLE public.treehistory ALTER COLUMN id_treehistory ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treehistory_id_treehistory_seq
    START WITH 3000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.treehistory
    ADD CONSTRAINT treehistory_pk PRIMARY KEY (id_treehistory);



CREATE INDEX treehistory_id_idx ON public.treehistory USING btree (id);



CREATE INDEX treehistory_id_idx1 ON public.treehistory USING btree (id);



CREATE INDEX treehistory_id_treehistory_idx ON public.treehistory USING btree (id_treehistory);



