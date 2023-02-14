ALTER TABLE "sources" RENAME COLUMN "id" to id_source_name;
ALTER TABLE "crosswalk" RENAME COLUMN "id" to id_source_name;
ALTER TABLE "cities" RENAME COLUMN "id" to id_source_name;
ALTER TABLE "crosswalk" RENAME COLUMN "ref" to id_reference;

ALTER TABLE "sources" DROP COLUMN id_city_name;
ALTER TABLE "cities" DROP COLUMN id_source;
ALTER TABLE "sources" DROP COLUMN id_name2;

ALTER TABLE "treedata" ADD dbh_min INTEGER;
ALTER TABLE "treedata" ADD dbh_max INTEGER;
ALTER TABLE "treedata" ADD height_min INTEGER;
ALTER TABLE "treedata" ADD height_max INTEGER;
ALTER TABLE "treedata" ADD crown_min INTEGER;
ALTER TABLE "treedata" ADD crown_max INTEGER;



ALTER TABLE "treedata" DROP COLUMN iso_alpha_2;
ALTER TABLE "treedata" DROP COLUMN iso_alpha_3;
ALTER TABLE "treedata" DROP COLUMN numeric_country_code;
ALTER TABLE "treedata" DROP COLUMN info;
ALTER TABLE "treedata" DROP COLUMN download;
ALTER TABLE "treedata" RENAME COLUMN "source_id" to id_source_name;


-- MAKE SURE YOU RUN THIS BEFORE YOU RUN THE NEXT ONE
UPDATE "treedata" SET id_reference = ref WHERE ref IS NOT NULL;
ALTER TABLE "treedata" DROP COLUMN ref;
ALTER TABLE "treedata" DROP COLUMN red;