UPDATE treedata SET genus = split_part(scientific,' ' ,1) WHERE genus is null;

SELECT id, scientific, genus, lng, lat, modified from treedata order by modified desc limit 20;