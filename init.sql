CREATE USER trees WITH ENCRYPTED PASSWORD 'trees3r4t';
CREATE DATABASE treedb;
GRANT ALL PRIVILEGES ON DATABASE treedb TO trees;
CREATE EXTENSION IF NOT EXISTS uuid-ossp WITH SCHEMA public;
-- CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
-- COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';

