ALTER TABLE treedata ALTER COLUMN id SET DATA TYPE bigint;
ALTER TABLE treelikes ALTER COLUMN id SET DATA TYPE bigint;
ALTER TABLE treehistory ALTER COLUMN id SET DATA TYPE bigint;
ALTER TABLE treeadoption ALTER COLUMN id SET DATA TYPE bigint;

UPDATE treehistory th set id_tree = td.id_tree from treedata td where td.id = th.id and th.id_tree is null;
UPDATE treeadoption ta set id_tree = td.id_tree from treedata td where td.id = ta.id and ta.id_tree is null;
UPDATE treelikes tl set id_tree = td.id_tree from treedata td where td.id = tl.id and tl.id_tree is null;
DROP INDEX id_geohash CASCADE;

UPDATE treehistory th set id = td.id from treedata td where td.id_tree = th.id_tree;
UPDATE treeadoption ta set id = td.id from treedata td where td.id_tree = ta.id_tree;
UPDATE treelikes tl set id = td.id from treedata td where td.id_tree = tl.id_tree;


CREATE UNIQUE INDEX id_geohash ON treedata (id);

ALTER TABLE treelikes ADD FOREIGN KEY (id) REFERENCES treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE treehistory ADD FOREIGN KEY (id) REFERENCES treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE treeadoption ADD FOREIGN KEY (id) REFERENCES treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE INDEX ON treedata (id);
CREATE INDEX ON treelikes (id);
CREATE INDEX ON treehistory (id);
CREATE INDEX ON treeadoption (id);

SELECT  l.* FROM    treehistory l LEFT JOIN treedata r ON r.id = l.id WHERE   r.id IS NULL;
