ALTER TABLE "sources" RENAME COLUMN "id" to id_name;
ALTER TABLE "crosswalk" RENAME COLUMN "id" to id_name;
ALTER TABLE "crosswalk" RENAME COLUMN "ref" to id_reference;
ALTER TABLE "sources" DROP COLUMN id_city_name;