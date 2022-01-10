CREATE TABLE city_downloads (
    id_city_downloads integer NOT NULL generated always as identity (start with 10 increment by 1),
     id_city_name character varying(255)
    email character varying(255),
    who character varying(255),
    country text,
    modified timestamp without time zone,
    id character varying(255),
    short character varying(255),
    info text,
    download text,
    format character varying(255),
    filename character varying(255),
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified int(11) DEFAULT NULL,
);