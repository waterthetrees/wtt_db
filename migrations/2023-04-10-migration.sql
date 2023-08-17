-- INSERT INTO cities(city, country, id_source_name, info, download, format, who, email, lng, lat) 
-- SELECT city, country, id_source_name, info, download, format, who, email, longitude, latitude
-- FROM sources
-- WHERE NOT EXISTS (Select city From cities WHERE cities.city = sources.city) ON CONFLICT DO NOTHING;

-- -- faster over 50,000,000
-- INSERT INTO cities(city, country, id_source_name, info, download, format, who, email, lng, lat) 
-- SELECT city, country, id_source_name, info, download, format, who, email, longitude, latitude from sources
-- EXCEPT
-- SELECT city, country, id_source_name, info, download, format, who, email, lng, lat from cities ON CONFLICT DO NOTHING;

-- faster for less than 50,000,000
INSERT INTO cities(city, country, id_source_name, info, download, format, who, email, lng, lat) 
SELECT sources.city, sources.country, sources.id_source_name, sources.info, sources.download, sources.format, sources.who, sources.email, sources.longitude, sources.latitude
FROM sources
LEFT JOIN cities ON cities.city = sources.city
WHERE cities.city IS NULL 
ON CONFLICT DO NOTHING;


INSERT INTO cities(city, country, id_source_name, info, download, format, who, email, lng, lat) 
SELECT sources.city, sources.country, sources.id_source_name, sources.info, sources.download, sources.format, sources.who, sources.email, sources.longitude, sources.latitude
FROM sources
LEFT JOIN cities ON cities.city = sources.city
WHERE cities.city IS NULL 
ON CONFLICT DO NOTHING;

INSERT INTO countries(country) 
SELECT sources.country
FROM sources
LEFT JOIN countries ON countries.country = sources.country
WHERE countries.country IS NULL 
ON CONFLICT DO NOTHING;


--  id_country integer NOT NULL,
--     country character varying(255) NOT NULL,
--     country_count_trees integer DEFAULT 0,
--     created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
--     modified timestamp without time zone,
--     country_count_cities integer DEFAULT 0,
--     country_short character varying(64),
--     country_code character varying(64),
--     lng double precision,
--     lat double precision