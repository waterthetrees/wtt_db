
CREATE TABLE treeadoption (
  id_adopted INT GENERATED ALWAYS AS IDENTITY,
  id_tree INT NOT NULL,
  common CHAR varying(255) NOT NULL,
  nickname CHAR varying(255) NOT NULL,
  email CHAR varying(255) NOT NULL,
  created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
  modified timestamp without time zone,
  PRIMARY KEY(id_adopted),
  CONSTRAINT email_fkey FOREIGN KEY(email) REFERENCES users(email) ON DELETE CASCADE ON UPDATE CASCADE ,
  CONSTRAINT id_tree_fkey FOREIGN KEY(id_tree) REFERENCES treedata(id_tree) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE treelikes (
  id_liked INT GENERATED ALWAYS AS IDENTITY,
  id_tree INT NOT NULL,
  common CHAR varying(255) NOT NULL,
  nickname CHAR varying(255) NOT NULL,
  email CHAR varying(255) NOT NULL,
  created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
  modified timestamp without time zone,
  PRIMARY KEY(id_liked),
  CONSTRAINT email_fkey FOREIGN KEY(email) REFERENCES users(email) ON DELETE CASCADE ON UPDATE CASCADE ,
  CONSTRAINT id_tree_fkey FOREIGN KEY(id_tree) REFERENCES treedata(id_tree) ON DELETE CASCADE ON UPDATE CASCADE 
);

ALTER TABLE users ADD CONSTRAINT users_pk PRIMARY KEY (id_user);
ALTER TABLE treedata ADD CONSTRAINT treedata_pk PRIMARY KEY (id_tree);
ALTER TABLE treehistory ADD CONSTRAINT treehistory_pk PRIMARY KEY (id_treehistory);
ALTER TABLE users ADD CONSTRAINT email_uk UNIQUE (email);

ALTER TABLE public.treeusers ALTER COLUMN id_treeusers ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treeusers_id_tree_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


ALTER TABLE public.treeusers OWNER TO trees;
