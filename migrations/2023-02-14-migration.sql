ALTER TABLE "sources" RENAME COLUMN "id" to id_source_name;
ALTER TABLE "crosswalk" RENAME COLUMN "id" to id_source_name;
ALTER TABLE "cities" RENAME COLUMN "id" to id_source_name;
ALTER TABLE "crosswalk" RENAME COLUMN "ref" to id_reference;

ALTER TABLE "sources" DROP COLUMN id_city_name;
ALTER TABLE "cities" DROP COLUMN id_source;


ALTER TABLE "treedata" ADD dbh_min INTEGER;
ALTER TABLE "treedata" ADD dbh_max INTEGER;
ALTER TABLE "treedata" ADD height_min INTEGER;
ALTER TABLE "treedata" ADD height_max INTEGER;
ALTER TABLE "treedata" ADD crown_min INTEGER;
ALTER TABLE "treedata" ADD crown_max INTEGER;