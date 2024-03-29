--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: add_geom(); Type: FUNCTION; Schema: public; Owner: trees
--

CREATE FUNCTION public.add_geom() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        UPDATE treedata SET geom = ST_SetSRID(ST_MakePoint(lng, lat), 4326) where id_tree=NEW.id_tree;
        RETURN NEW;   
    END;
$$;


ALTER FUNCTION public.add_geom() OWNER TO trees;

--
-- Name: update_modified_column(); Type: FUNCTION; Schema: public; Owner: trees
--

CREATE FUNCTION public.update_modified_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        NEW.modified = now();
        RETURN NEW;   
    END;
$$;


ALTER FUNCTION public.update_modified_column() OWNER TO trees;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.cities (
    id_city integer NOT NULL,
    city character varying(255),
    lng double precision,
    lat double precision,
    email character varying(255),
    who character varying(255),
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    count integer,
    country text,
    city_count_trees integer DEFAULT 0,
    modified timestamp without time zone,
    id character varying(255),
    short character varying(255),
    info text,
    download text,
    format character varying(255)
);


ALTER TABLE public.cities OWNER TO trees;

--
-- Name: cities_id_city_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.cities ALTER COLUMN id_city ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_city_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.countries (
    id_country integer NOT NULL,
    country character varying(255) NOT NULL,
    country_count_trees integer DEFAULT 0,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified timestamp without time zone,
    country_count_cities integer DEFAULT 0,
    country_short character varying(64),
    country_code character varying(64),
    lng double precision,
    lat double precision
);


ALTER TABLE public.countries OWNER TO trees;

--
-- Name: countries_id_country_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.countries ALTER COLUMN id_country ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.countries_id_country_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: crosswalk; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.crosswalk (
    id_crosswalk integer NOT NULL,
    id character varying(255),
    common character varying(255),
    species character varying(255),
    genus character varying(255),
    scientific character varying(255),
    family character varying(255),
    variety character varying(255),
    dbh character varying(255),
    height character varying(255),
    structure character varying(255),
    trunks character varying(255),
    age character varying(255),
    health character varying(255),
    crown character varying(255),
    spread character varying(255),
    planted character varying(255),
    updated character varying(255),
    location character varying(255),
    note character varying(255),
    address character varying(255),
    ref character varying(255),
    owner character varying(255),
    ule character varying(255),
    ule_min character varying(255),
    ule_max character varying(255),
    cost character varying(255),
    gps_date character varying(255),
    audited character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.crosswalk OWNER TO trees;

--
-- Name: crosswalk_id_crosswalk_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.crosswalk ALTER COLUMN id_crosswalk ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.crosswalk_id_crosswalk_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sources; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.sources (
    id_sources integer NOT NULL,
    id character varying(255),
    short character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    iso_alpha_2 character varying(2),
    iso_alpha_3 character varying(3),
    numeric_country_code integer DEFAULT 0,
    long character varying(255),
    id_city_name character varying(255),
    main character varying(255),
    center character varying(255),
    longitude double precision,
    latitude double precision,
    email character varying(255),
    contact character varying(255),
    who character varying(255),
    phone character varying(255),
    trees_per_source_count integer DEFAULT 0,
    country_code character varying(10),
    broken boolean DEFAULT false,
    broken_reason character varying(255),
    info text,
    download text,
    format character varying(255),
    filename character varying(255),
    gdal_options character varying(255),
    license character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.sources OWNER TO trees;

--
-- Name: sources_id_sources_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.sources ALTER COLUMN id_sources ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sources_id_sources_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tree_taxonomy; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.tree_taxonomy (
    id_tree_taxonomy integer NOT NULL,
    id character varying(255),
    common character varying(255),
    scientific character varying(255),
    genus character varying(255),
    species character varying(255),
    family character varying(255),
    class character varying(255),
    phylum character varying(255),
    kingdom character varying(255),
    fia_code character varying(255),
    conservation_status character varying(255),
    max_height integer,
    max_diameter_trunk integer,
    max_diameter_crown integer,
    native_country character varying(255),
    modified timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tree_taxonomy OWNER TO trees;

--
-- Name: tree_taxonomy_id_tree_taxonomy_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.tree_taxonomy ALTER COLUMN id_tree_taxonomy ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tree_taxonomy_id_tree_taxonomy_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: treeadoption; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.treeadoption (
    id_adopted integer NOT NULL,
    id_tree integer NOT NULL,
    common character varying(255) NOT NULL,
    nickname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified timestamp without time zone,
    id bigint NOT NULL
);


ALTER TABLE public.treeadoption OWNER TO trees;

--
-- Name: treeadoption_id_adopted_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.treeadoption ALTER COLUMN id_adopted ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treeadoption_id_adopted_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: treedata; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.treedata (
    id_tree integer NOT NULL,
    id_wtt character varying(255),
    id_reference character varying(255),
    who character varying(255),
    common character varying(255),
    scientific character varying(255),
    genus character varying(255),
    lng double precision,
    lat double precision,
    date_planted timestamp without time zone,
    address character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    country character varying(255),
    neighborhood character varying(255),
    health character varying(255),
    dbh character varying(255),
    height character varying(255),
    owner character varying(255),
    url character varying(255),
    urlimage character varying(255),
    status character varying(255),
    notes text,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email character varying(255),
    volunteer character varying(255),
    modified timestamp without time zone,
    planting_opt1 character varying(255),
    planting_opt1_com character varying(255),
    planting_opt2 character varying(255),
    planting_opt3 character varying(255),
    side_type character varying(50),
    location_tree_count character varying(10),
    geom public.geometry(Point,4326),
    legal_status character varying,
    irrigation boolean,
    water_freq integer DEFAULT 14,
    watering_end_date timestamp without time zone,
    last_watered timestamp without time zone,
    id bigint NOT NULL,
    source_id character varying(255)
);


ALTER TABLE public.treedata OWNER TO trees;

--
-- Name: treedata_id_tree_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.treedata ALTER COLUMN id_tree ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treedata_id_tree_seq
    START WITH 3000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: treehistory; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.treehistory (
    id_treehistory integer NOT NULL,
    id_tree integer,
    watered character varying(255),
    mulched character varying(255),
    pruned character varying(255),
    staked character varying(255),
    braced character varying(255),
    weeded character varying(255),
    comment text,
    volunteer character varying(255),
    date_visit timestamp without time zone,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified timestamp without time zone,
    adopted boolean,
    liked boolean,
    id bigint NOT NULL
);


ALTER TABLE public.treehistory OWNER TO trees;

--
-- Name: treehistory_id_treehistory_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.treehistory ALTER COLUMN id_treehistory ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treehistory_id_treehistory_seq
    START WITH 3000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: treelikes; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.treelikes (
    id_liked integer NOT NULL,
    id_tree integer NOT NULL,
    common character varying(255) NOT NULL,
    nickname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified timestamp without time zone,
    id bigint NOT NULL
);


ALTER TABLE public.treelikes OWNER TO trees;

--
-- Name: treelikes_id_liked_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.treelikes ALTER COLUMN id_liked ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.treelikes_id_liked_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: trees
--

CREATE TABLE public.users (
    volunteer character varying(255),
    nickname character varying(255) NOT NULL,
    name character varying(255),
    picture character varying(255),
    email character varying(255) NOT NULL,
    zipcode character varying(255),
    created timestamp without time zone DEFAULT now() NOT NULL,
    modified timestamp without time zone,
    id_user integer NOT NULL,
    phone text,
    url text
);


ALTER TABLE public.users OWNER TO trees;

--
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: trees
--

ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cities cities_city_key; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_city_key UNIQUE (city);


--
-- Name: countries country_unique; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_unique UNIQUE (country);


--
-- Name: users email_check; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_check UNIQUE (email);


--
-- Name: users email_uk; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_uk UNIQUE (email);


--
-- Name: users nickname_check; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT nickname_check UNIQUE (nickname);


--
-- Name: treeadoption treeadoption_pkey; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treeadoption
    ADD CONSTRAINT treeadoption_pkey PRIMARY KEY (id_adopted);


--
-- Name: treedata treedata_pk; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treedata
    ADD CONSTRAINT treedata_pk PRIMARY KEY (id_tree);


--
-- Name: treehistory treehistory_pk; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treehistory
    ADD CONSTRAINT treehistory_pk PRIMARY KEY (id_treehistory);


--
-- Name: treelikes treelikes_pkey; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treelikes
    ADD CONSTRAINT treelikes_pkey PRIMARY KEY (id_liked);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id_user);


--
-- Name: cities_city_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX cities_city_idx ON public.cities USING btree (city);


--
-- Name: cities_id_city_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX cities_id_city_idx ON public.cities USING btree (id_city);


--
-- Name: id_geohash; Type: INDEX; Schema: public; Owner: trees
--

CREATE UNIQUE INDEX id_geohash ON public.treedata USING btree (id);


--
-- Name: id_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE UNIQUE INDEX id_idx ON public.sources USING btree (id);


--
-- Name: treeadoption_id_adopted_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treeadoption_id_adopted_idx ON public.treeadoption USING btree (id_adopted);


--
-- Name: treeadoption_id_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treeadoption_id_idx ON public.treeadoption USING btree (id);


--
-- Name: treeadoption_id_idx1; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treeadoption_id_idx1 ON public.treeadoption USING btree (id);


--
-- Name: treedata_geom_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treedata_geom_idx ON public.treedata USING gist (geom);


--
-- Name: treedata_id_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treedata_id_idx ON public.treedata USING btree (id);


--
-- Name: treedata_id_tree_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treedata_id_tree_idx ON public.treedata USING btree (id_tree);


--
-- Name: treehistory_id_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treehistory_id_idx ON public.treehistory USING btree (id);


--
-- Name: treehistory_id_idx1; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treehistory_id_idx1 ON public.treehistory USING btree (id);


--
-- Name: treehistory_id_treehistory_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treehistory_id_treehistory_idx ON public.treehistory USING btree (id_treehistory);


--
-- Name: treelikes_id_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treelikes_id_idx ON public.treelikes USING btree (id);


--
-- Name: treelikes_id_idx1; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treelikes_id_idx1 ON public.treelikes USING btree (id);


--
-- Name: treelikes_id_liked_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX treelikes_id_liked_idx ON public.treelikes USING btree (id_liked);


--
-- Name: users_id_user_idx; Type: INDEX; Schema: public; Owner: trees
--

CREATE INDEX users_id_user_idx ON public.users USING btree (id_user);


--
-- Name: treedata geom_update; Type: TRIGGER; Schema: public; Owner: trees
--

CREATE TRIGGER geom_update AFTER INSERT ON public.treedata FOR EACH ROW EXECUTE FUNCTION public.add_geom();


--
-- Name: crosswalk crosswalk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.crosswalk
    ADD CONSTRAINT crosswalk_id_fkey FOREIGN KEY (id) REFERENCES public.sources(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: treelikes id_tree_fkey; Type: FK CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treelikes
    ADD CONSTRAINT id_tree_fkey FOREIGN KEY (id_tree) REFERENCES public.treedata(id_tree) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: treeadoption id_tree_fkey; Type: FK CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treeadoption
    ADD CONSTRAINT id_tree_fkey FOREIGN KEY (id_tree) REFERENCES public.treedata(id_tree) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: treeadoption treeadoption_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treeadoption
    ADD CONSTRAINT treeadoption_id_fkey FOREIGN KEY (id) REFERENCES public.treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: treedata treedata_planted_by_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treedata
    ADD CONSTRAINT treedata_planted_by_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- Name: treedata treedata_planted_by_nickname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treedata
    ADD CONSTRAINT treedata_planted_by_nickname_fkey FOREIGN KEY (volunteer) REFERENCES public.users(nickname);


--
-- Name: treelikes treelikes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: trees
--

ALTER TABLE ONLY public.treelikes
    ADD CONSTRAINT treelikes_id_fkey FOREIGN KEY (id) REFERENCES public.treedata(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

