alter table treelikes add column id integer;
alter table treehistory add column id integer;
alter table treeadoption add column id integer;

update treelikes tl set id = td.id from treedata td where td.id_tree = tl.id_tree;
update treeadoption ta set id = td.id from treedata td where td.id_tree = ta.id_tree;
update treehistory th set id = td.id from treedata td where td.id_tree = th.id_tree;

update treehistory th set id = td.id from treedata td where td.id_tree = th.id_tree;
select created,modified,id_tree,id,id_treehistory,volunteer from treehistory where id is null;
ALTER TABLE treedata ALTER COLUMN id SET  NOT NULL;
ALTER TABLE treelikes ALTER COLUMN id SET  NOT NULL;
ALTER TABLE treehistory ALTER COLUMN id SET  NOT NULL;
ALTER TABLE treeadoption ALTER COLUMN id SET  NOT NULL;

select id,count(1) from treedata group by id having count(1) > 1;

UPDATE treedata SET location_tree_count = subquery.is_duplicate_of_count
FROM  (SELECT id, count(id) AS is_duplicate_of_count FROM treedata GROUP  BY id) AS subquery
WHERE treedata.id = subquery.id;

UPDATE treedata SET notes = subquery.old_reference_numbers
FROM  (select string_agg(id_reference, ', ' order by id_reference) AS old_reference_numbers FROM treedata GROUP BY id) AS subquery
WHERE treedata.id = subquery.id AND treedata.notes is null AND location_tree_count > 1;

DELETE FROM treedata a USING treedata b WHERE a.id_reference < b.id_reference AND a.id = b.id;

CREATE UNIQUE INDEX id_geohash ON treedata (id);

ALTER TABLE treelikes ADD FOREIGN KEY (id) REFERENCES treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE treehistory ADD FOREIGN KEY (id) REFERENCES treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE treeadoption ADD FOREIGN KEY (id) REFERENCES treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE INDEX ON treelikes (id);
CREATE INDEX ON treehistory (id);
CREATE INDEX ON treeadoption (id);
