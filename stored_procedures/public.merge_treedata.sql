
create or replace procedure public.merge_treedata (
    c_sourceid character varying(255)
)
language plpgsql
as $$
begin

    drop table if exists _tree;

    create temporary table _tree as
    SELECT  t.id as id_tree,
            ts.id as id_tree_staging,
            ts.ref as id_reference,
            ts.geom,
            ts.common,
            ts.scientific,
            ts.genus,
            ts.lng,
            ts.lat,
            ts.planted as date_planted,
            ts.address,
            ts.city,
            -- state,
            -- zip,
            ts.country,
            -- neighborhood,
            ts.health,
            case when ts.dbh ~ '^[0-9\.]+$' then ts.dbh::double precision else null end as dbh,
            ts.dbh as dbh_raw,
            ts.height,
            ts.owner,
            -- status,
            ts.note as notes,
            ts.sourceid
    FROM    public.tree_staging ts
    FULL OUTER JOIN    public.tree t on (t.id_reference = ts.ref and ts.sourceid = t.sourceid)
    WHERE   1=1
    AND     ts.sourceid = c_sourceid;

    insert into public.tree (
        id_reference,
        geom,
        common,
        scientific,
        genus,
        lng,
        lat,
        date_planted,
        address,
        city,
        country,
        health,
        dbh,
        dbh_raw,
        height,
        owner,
        notes,
        -- email,
        sourceid
    )
    select  id_reference,
            geom,
            common,
            scientific,
            genus,
            lng,
            lat,
            date_planted,
            address,
            city,
            country,
            health,
            dbh,
            dbh_raw,
            height,
            owner,
            notes,
            -- email,
            sourceid
    FROM    _tree
    WHERE   1=1
    AND     _tree.id_tree is null;

    -- update anything that is in both and has fields changed
    update tree
    SET     dbh_raw = t.dbh_raw,
            dbh = case when t.dbh_raw ~ '^[0-9\.]+$' then t.dbh_raw::double precision else null end
    FROM    (
        select  t.id,
                ts.dbh_raw
        from	_tree as ts
        JOIN    tree as t on ts.id_tree = t.id
        where	1=1
        AND     coalesce(ts.dbh_raw, '') != coalesce(t.dbh_raw, '')
    ) t
    where   1=1
    and     t.id = tree.id;

    -- set the removed field for any that are not in staging
    -- but in the regular table
    /*
        What do we want to do about trees that were
        deleted from the source?
    */


    -- DELETE
    -- FROM    public.tree_staging
    -- WHERE   1=1
    -- AND     sourceid = c_sourceid;

end; $$
;
