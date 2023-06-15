CREATE TABLE treesprites(
    id_treesprite integer NOT NULL generated always as identity (start with 30 increment by 1),
    sprite_name character varying(255),
    species character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX sprite_name_idx ON sources (sprite_name);
ALTER TABLE ONLY treesprites ADD CONSTRAINT species_fkey FOREIGN KEY (species) REFERENCES treedata(species) ON UPDATE CASCADE ON DELETE CASCADE;
