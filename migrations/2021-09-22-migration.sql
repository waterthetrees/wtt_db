alter table treedata add column water_freq integer DEFAULT 14;
alter table treedata add column watering_end_date timestamp without time zone;
alter table treedata add column last_watered timestamp without time zone;


UPDATE treedata SET last_watered = treehistory.date_visit FROM treehistory WHERE treehistory.id_tree = treedata.id_tree AND treehistory.watered = 'yes';
