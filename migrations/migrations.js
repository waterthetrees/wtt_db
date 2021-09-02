const { db } = require('../../db');
const {QueryFile} = require('pg-promise');
const {join: joinPath} = require('path');
const { format } = require('date-fns');

format(new Date(2014, 1, 11), 'MM/dd/yyyy')


// Helper for linking to external query files:
function sql(file) {
  const fullPath = joinPath(__dirname, file); // generating full path;
  return new QueryFile(fullPath, {minify: true});
}

function migrations(query) {
  const today = format(new Date(), 'yyyy-mm-dd')
  const query = pgp.helpers.concat([sql(`${today}-migration.sql`)
]);
}


/*
TODO
ASK BART NOT TO ADD WIERDO DATES
ITERATE through queries and run
4 make query to delete all the oakland trees that have not been modified in last however long minutes?

FS read sql file
*/




