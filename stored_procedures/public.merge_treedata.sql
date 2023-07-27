
create or replace procedure public.merge_treedata (
    c_id_source_name character varying(255)
)
language plpgsql
as $$
begin

    DROP TABLE IF EXISTS _tree;

    CREATE TEMPORARY TABLE _tree AS
    SELECT  geom,
            id,
            id_reference,
            id_source_name,
            city,
            country,
            email,
            download,
            info,
            lat,
            lng,
            count,

            -- crosswalk fields, as per opentrees schema
            scientific,
            genus,
            species,
            variety,
            common,
            dbh,
            health,
            height,
            crown,
            spread,
            ule,
            updated,
            planted,
            note,
            address
    FROM    treedata_staging ts
    WHERE   1=1
    AND     (c_id_source_name is null or ts.id_source_name = c_id_source_name);

    /*
        Insert with a left join based on the id_tree column
    */
    INSERT INTO treedata (
        id_tree,
        id_reference,
        id_source_name,
        geom,
        city,
        country,
        email,
        lat,
        lng,
        count,
        scientific,
        genus,
        species,
        variety,
        common,
        dbh,
        health,
        height,
        date_planted,
        note,
        address
    )
    SELECT  id as id_tree,
            id_reference,
            id_source_name,
            geom,
            city,
            country,
            email,
            lat,
            lng,
            count,
            scientific,
            genus,
            species,
            variety,
            common,
            dbh,
            health,
            height,
            date_planted,
            note,
            address
    FROM    _tree
    LEFT JOIN treedata on (
            treedata.id_source_name = _tree.id_source_name
        AND treedata.id_tree = _tree.id
    )
    WHERE   1=1
    AND     treedata.id_tree is null
    ;
    
    /*
        Update with a join. Add more columns.
    */
    UPDATE treedata
    SET     dbh = _tree.dbh,
            address = _tree.address,
            health = _tree.health
    FROM    _tree
    WHERE   1=1
    AND     _tree.id = treedata.id_tree
    -- check any columns that changed
    -- FIXME add more columns
    AND     (
            _tree.dbh <> treedata.dbh
        OR  _tree.address <> treedata.address
        OR  _tree.health <> treedata.health
    )
    ;

    /*
        For the delete, we will probably want to keep track of old treedata rows.
        Do we want some sort of audit trail for deleted trees?
        Maybe an "active" column that we can use.
        We probably want an "active" column because of foreign key constraints
    */

    /*
        Delete the rows from the staging table based on the
        id_source_name
    */
    DELETE
    FROM    treedata_staging
    WHERE   1=1
    AND     c_id_source_name is null or id_source_name = c_id_source_name
    ;

end; $$
;
