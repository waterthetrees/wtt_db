alter table treedata RENAME COLUMN id_wtt TO id;


-- update treedata set id = replace(id,'WTT','');
update treedata set id = null;
ALTER TABLE treedata ALTER COLUMN id TYPE integer USING id::integer;

select distinct(common) from treedata where common is null or scientific is null or lat is null or lng is null or city is null order by common asc;

update treedata set scientific = 'Ceanothus ''Ray Hartman''', common = 'California Lilac' where common = 'Ceanothus ''Ray Hartman''' AND scientific is null;
update treedata set scientific = 'Cercis canadensis', common = 'Eastern Redbud' where common = 'Eastern Redbud' AND scientific is null;
update treedata set scientific = 'Pyrus kawakamii' where common = 'Evergreen Pear' AND scientific is null;
update treedata set scientific = 'Lagerstroemia x ''Tuscarora''', common = 'Crapemyrtle ''Tuscarora''' where common = 'Lagerstroemia x ''Tuscarora''' AND scientific is not null;
update treedata set scientific = 'Persea americana', common = 'Avocado Hass' where scientific = 'Avocado Hass' AND scientific is not null;
update treedata set scientific = 'Cornus ''Eddie''s White Wonder''', common = 'dogwood ''Eddie''s White Wonder''' where scientific = 'Cornus ''Eddie''s White Wonder''' AND scientific is not null;
update treedata set scientific = 'Betula nigra ''Heritage''', common = 'Black Birch' where scientific = 'Betula nigra ''Heritage''' AND scientific is not null;
update treedata set scientific = 'Gymnocladus dioica ''Espresso''', common = 'Espresso Kentucky coffeetree' where scientific = 'Gymnocladus dioica ''Espresso''' AND scientific is not null;
update treedata set scientific = 'Prunus cerasifera', common = 'Purple Leaf Plum' where common = 'Purple Leaf Plum' AND common is not null;
update treedata set scientific = 'Diospyros kaki', common = 'Fuyu Persimmon' where scientific = 'Fuyu Persimmon' AND scientific is not null;
update treedata set scientific = 'Ulmus americana ''Colonial Spirit''', common = 'American Elm' where scientific = 'Ulmus americana ''Colonial Spirit''' AND scientific is not null;
update treedata set scientific = 'Koelreuteria paniculata ''Fastigiata''', common = 'Goldenrain tree' where scientific = 'Koelreuteria paniculata ''Fastigiata''' AND scientific is not null AND common is null;
update treedata set scientific = 'Arbutus ''Marina''', common = 'Strawberry tree' where scientific = 'Arbutus ''Marina''' AND scientific is not null AND common is null;
update treedata set scientific = 'Ceiba speciosa', common = 'Silk Floss Tree' where scientific = 'Ceiba speciosa' AND scientific is not null AND common is null;
update treedata set scientific = 'Diospyros kaki ''Fuyu''', common = 'Fuyu Persimmon' where scientific = 'Diospyros kaki ''Fuyu''' AND scientific is not null AND common is null;
update treedata set scientific = 'Platanus acerifolia ''Columbia''', common = 'American sycamore' where scientific = 'Platanus acerifolia ''Columbia''' AND scientific is not null AND common is null;
update treedata set scientific = 'Acer buergerianum' WHERE common = 'Trident Maple' AND scientific is NULL;
update treedata set scientific = 'Tilia tomentosa ''Sterling''', common = 'Sterling Silver Linden' WHERE common = 'Tilia tomentosa ''Sterling''' AND scientific is NULL;
update treedata set scientific = 'Sequoia sempervirens ''Aptos Blue''', common = 'Coastal Redwood' WHERE common = 'Sequoia sempervirens ''Aptos Blue''' AND scientific is NULL;
update treedata set scientific = 'Acer rubrum ''October Glory''', common = 'Red Maple' WHERE common = 'Acer rubrum ''October Glory''' AND scientific is NULL;
update treedata set scientific = 'Acer rubrum ''October Glory''', common = 'Red Maple' WHERE common = 'Acer rubrum ?October Glory? Red maple October glory.' AND scientific is NULL;
update treedata set scientific = 'Afrocarpus gracilior' WHERE common = 'African Fern Pine' AND scientific is NULL;
update treedata set scientific = 'Platanus acerifolia ''Columbia''' WHERE common = 'Columbia Plane Tree' AND scientific is NULL;
update treedata set scientific = 'Lagerstroemia indica' WHERE common = 'Crape Myrtle' AND scientific is NULL;
update treedata set scientific = 'Lagerstroemia indica', common = 'Crape Myrtle' WHERE common = 'Crepe Myrtle' AND scientific is NULL;
update treedata set scientific = 'Ginkgo biloba' WHERE common = 'Ginkgo' AND scientific is NULL;
update treedata set scientific = 'Searsia lancea' WHERE common = 'African Sumac' AND scientific is NULL;
update treedata set scientific = 'Geijera parviflora' WHERE common = 'Australian Willow' AND scientific is NULL;
update treedata set scientific = 'Pistacia chinensis' WHERE common = 'Chinese Pistache' AND scientific is NULL;
update treedata set scientific = 'Ginkgo biloba', common = 'Ginkgo' WHERE common = 'Ginkgo biloba' AND scientific is NULL;
update treedata set scientific = 'Ginkgo biloba ''Fairmont''',common = 'Ginkgo' WHERE common = 'Ginkgo biloba ''Fairmont''' AND scientific is NULL;
update treedata set scientific = 'Espresso Kentucky Coffeetree' WHERE common = 'Gymnocladus dioica ''Espresso''' AND scientific is NULL;
update treedata set scientific = 'Lagerstroemia indica x L. fauriei ''Muskogee''', common = 'Crape Myrtle ''indica x L. fauriei Muskogee''' WHERE common = 'Lagerstroemia indica x L. fauriei ''Muskogee''' AND scientific is NULL;
update treedata set scientific = 'Lagerstroemia x ''Muskogee''', common = 'Crape Myrtle ''Muskogee''' WHERE common = 'Lagerstroemia x ''Muskogee''' AND scientific is NULL;
update treedata set scientific = 'Lagerstroemia x ''Tuscarora''', common = 'Crape Myrtle ''Tuscarora''' WHERE common = 'Lagerstroemia x ''Tuscarora''' AND scientific is NULL;
update treedata set scientific = 'Magnolia' WHERE common = 'Magnolia' AND scientific is NULL;
update treedata set scientific = 'Magnolia' WHERE common = 'Magnolia grandiflora' AND scientific is NULL;
update treedata set scientific = 'Magnolia' WHERE common = 'Magnolia Little Gem' AND scientific is NULL;
update treedata set scientific = 'Metrosideros excelsa' WHERE common = 'New Zealand Christmas Tree' AND scientific is NULL;
update treedata set scientific = 'Fraser photinia' WHERE common = 'Photinia fraseri' AND scientific is NULL;
update treedata set scientific = 'Quercus shumardii',common = 'Shumard oak' WHERE common = 'Quercus shumardii' AND scientific is NULL;
update treedata set scientific = 'Quercus rubra' WHERE common = 'Red oak' AND scientific is NULL;
update treedata set scientific = 'Quercus rubra', common = 'Red Oak' WHERE common = 'Red Oak' AND scientific is NULL;
update treedata set scientific = 'Laurus nobilis ''Saratoga''' WHERE common = 'Saratoga Laurel' AND scientific is NULL;
update treedata set scientific = 'Acer macrophyllum', common = 'Bigleaf Maple' WHERE common = 'Acer macrophyllum' AND scientific is NULL;

SELECT scientific,  SUBSTR(scientific,1, POSITION(' ' IN scientific)) FROM treedata where genus is null limit 5;

UPDATE treedata SET genus = SUBSTR(scientific,1, POSITION(' ' IN scientific)) WHERE genus IS NULL;