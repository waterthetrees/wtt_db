ALTER TABLE treedata ADD COLUMN source_id character varying(255);
UPDATE treedata SET source_id = 'san_francisco' WHERE city = 'San Francisco';
UPDATE treedata SET source_id = 'alameda' WHERE city = 'Alameda';
UPDATE treedata SET source_id = 'oakland' WHERE city = 'Oakland';
UPDATE treedata SET source_id = 'canyon' WHERE city = 'Canyon';
UPDATE treedata SET source_id = 'freemont' WHERE city = 'Freemont';
UPDATE treedata SET city = 'Alameda' WHERE city = 'alameda';

UPDATE treedata SET city = 'San Francisco' where id_tree = 30463;
UPDATE treedata SET source_id = 'san_francisco' where id_tree = 30463;