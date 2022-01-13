alter table countries add lng double precision;
alter table countries add lat double precision;
update countries set country_code = 'united-states' where country = 'United States';
update countries set country_short = 'us' where country = 'United States';

update countries set lng = -97.9222112121185, lat = 39.3812661305678 where country = 'United States';
update countries set lng = 10.0183432948567,	lat = 51.1334813439932 where country = 'Germany';
update countries set lng = 134.489562606981,	lat =	-25.7349684916223 where country = 'Australia';
update countries set lng = 14.3001435907641,	lat =	47.6077978292689 where country = 'Austria';
update countries set lng = -105.750595856519,	lat =	55.5859012851966 where country = 'Canada';
update countries set lng = 2.61878695312962,	lat =	47.8249046208979 where country = 'France';
update countries set lng = 5.61349061168593,	lat =	51.9724664894952 where country = 'Netherlands';
update countries set lng = -4.05568501525488,	lat =	41.2948556295683 where country = 'Spain';
update countries set lng = 17.6754094331351,	lat =	64.9648751621697 where country = 'Sweden';
update countries set lng = -2.36966957036279,	lat =	54.2379333607472 where country = 'United Kingdom';

-- 1	United States	280422	2021-05-06 11:30:00	2021-08-25 11:30:00	0	us	united-states	-97.9222112121185	39.3812661305678
-- 9	Germany	0	2021-05-06 11:30:00	2021-08-25 11:30:00	0	germany	germany	10.0183432948567	51.1334813439932
-- 10	Australia	0	2021-05-06 11:30:00	2021-08-25 11:30:00	0	australia	australia	134.489562606981	-25.7349684916223
-- 11	Austria	0	2021-05-06 11:30:00	2021-08-25 11:30:00	0	austria	austria	14.3001435907641	47.6077978292689
-- 12	Canada	0	2021-05-06 11:30:00	2021-08-25 11:30:00	0	canada	canada	-105.750595856519	55.5859012851966
-- 13	France	0	2021-08-25 11:30:00	2021-08-25 11:30:00	0	france	france	2.61878695312962	47.8249046208979
-- 14	Netherlands	0	2021-08-25 11:30:00	2021-08-25 11:30:00	0	netherlands	netherlands	5.61349061168593	51.9724664894952
-- 15	Spain	0	2021-08-25 11:30:00	2021-08-25 11:30:00	0	spain	spain	-4.05568501525488	41.2948556295683
-- 16	Sweden	0	2021-08-25 11:30:00	2021-08-25 11:30:00	0	sweden	sweden	17.6754094331351	64.9648751621697
-- 17	United Kingdom	0	2021-08-25 11:30:00	2021-08-25 11:30:00	0	uk	united-kingdom	-2.36966957036279	54.2379333607472