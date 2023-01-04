
CREATE TABLE public.users (
    volunteer character varying(255),
    nickname character varying(255) NOT NULL,
    name character varying(255),
    picture character varying(255),
    email character varying(255) NOT NULL,
    zipcode character varying(255),
    created timestamp without time zone DEFAULT now() NOT NULL,
    modified timestamp without time zone,
    id_user integer NOT NULL,
    phone text,
    url text
);


ALTER TABLE public.users OWNER TO trees;


ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_check UNIQUE (email);



ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_uk UNIQUE (email);



ALTER TABLE ONLY public.users
    ADD CONSTRAINT nickname_check UNIQUE (nickname);



ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id_user);



CREATE INDEX users_id_user_idx ON public.users USING btree (id_user);



