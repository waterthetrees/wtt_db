CREATE TABLE tree_taxonomy(
    id_tree_taxonomy integer NOT NULL generated always as identity (start with 30 increment by 1),
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

INSERT INTO tree_taxonomy (scientific) SELECT DISTINCT scientific FROM treedata;
UPDATE tree_taxonomy tt SET common = (SELECT DISTINCT common FROM treedata td WHERE tt.scientific = td.scientific AND td.common IS NOT NULL limit 1);
UPDATE tree_taxonomy tt SET genus = (SELECT DISTINCT genus FROM treedata td WHERE tt.scientific = td.scientific AND td.genus IS NOT NULL limit 1);