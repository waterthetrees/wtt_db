-- We need to make sure that new cities 
-- get inserted if someone adds a tree within a new city
CREATE OR REPLACE FUNCTION fn_tree_count_per_city() RETURNS TRIGGER AS $$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            UPDATE cities 
            SET cities.city_count_trees = cities.city_count_trees - 1 
            FROM public.treedata T
            WHERE cities.city = NEW.city
            AND NEW.city IS NOT NULL;
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE' 
          AND NEW.common = 'vacant'
          AND (OLD.common != 'vacant')) THEN
            UPDATE cities
            SET cities.city_count_trees = cities.city_count_trees - 1
            FROM public.treedata T
            WHERE cities.city = NEW.city
            AND NEW.city IS NOT NULL
            AND NEW.common = 'vacant'
            AND OLD.common != 'vacant';
            RETURN NEW;
        ELSIF (TG_OP = 'UPDATE'
          AND NEW.common != 'vacant'
          AND OLD.common = 'vacant') THEN
            UPDATE cities
            SET cities.city_count_trees = cities.city_count_trees + 1
            FROM public.treedata T
            WHERE cities.city = NEW.city
            AND NEW.city IS NOT NULL
            AND NEW.common != 'vacant'
            AND OLD.common = 'vacant';
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            UPDATE cities
            SET cities.city_count_trees = cities.city_count_trees + 1
            FROM public.treedata T
            WHERE cities.city = NEW.city
            AND NEW.city IS NOT NULL
            AND NEW.common != 'vacant';
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER treedata_count
AFTER INSERT OR UPDATE OR DELETE ON treedata
FOR EACH ROW EXECUTE PROCEDURE fn_tree_count_per_city();
