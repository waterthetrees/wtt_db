/*
    Insert current trees into new tree table
*/
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
        state,
        zip,
        country,
        neighborhood,
        health,
        dbh_raw,
        height,
        owner,
        url,
        urlimage,
        status,
        notes,
        email,
        volunteer,
        side_type,
        location_tree_count,
        legal_status,
        irrigation,
        water_freq,
        sourceid
)
SELECT  id_reference,
        geom,
        common,
        scientific,
        genus,
        lng,
        lat,
        date_planted,
        address,
        city,
        state,
        zip,
        country,
        neighborhood,
        health,
        dbh as dbh_raw,
        height,
        owner,
        url,
        urlimage,
        status,
        notes,
        email,
        volunteer,
        side_type,
        location_tree_count,
        legal_status,
        irrigation,
        water_freq,
        source_id as sourceid
FROM    public.treedata
;
