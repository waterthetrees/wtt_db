CREATE TABLE newoaklandtable AS SELECT * FROM treedata WHERE false;

\COPY newoaklandtable FROM '/Users/aa/Desktop/APPS/wtt/wtt_data/csv_data_dump_august.csv' DELIMITER ',' CSV HEADER;

UPDATE newoaklandtable set created = '2021-09-01 00:00:00.000000' where created IS NULL;
UPDATE newoaklandtable set modified = '2021-09-01 00:00:00.000000';

UPDATE treedata s 
SET 
id_wtt = o.id_wtt, id_reference = o.id_reference, who = o.who, common = o.common, 
scientific = o.scientific, genus = o.genus, lng = o.lng, lat = o.lat, date_planted = o.date_planted, 
address = o.address, city = o.city, state = o.state, zip = o.zip, country = o.country, neighborhood = o.neighborhood, 
health = o.health, dbh = o.dbh, height = o.height, owner = o.owner, url = o.url, urlimage = o.urlimage, 
status = o.status, notes = o.notes, created = o.created, 
email = o.email, volunteer = o.volunteer, modified = o.modified, 
planting_opt1 = o.planting_opt1, planting_opt1_com = o.planting_opt1_com, 
planting_opt2 = o.planting_opt2, planting_opt3 = o.planting_opt3, 
side_type = o.side_type, location_tree_count = o.location_tree_count, geom = o.geom, legal_status = o.legal_status
FROM newoaklandtable o 
WHERE s.id_tree = o.id_tree
AND s.city = 'Oakland' 
AND o.date_planted IS NOT NULL;

select count(*) from treedata where modified > current_timestamp - interval '2 days';
select count(*) from treedata where modified < current_timestamp - interval '2 days' AND city = 'Oakland';