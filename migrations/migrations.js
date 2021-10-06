
const {resolve, join: joinPath} = require('path');
require('dotenv').config({ path: resolve(__dirname, '../.env') });
const { db, pgPromise, } = require('./db');
const { format } = require('date-fns');

format(new Date(2014, 1, 11), 'MM/dd/yyyy')


// Helper for linking to external query files:
function sql(file) {
  const fullPath = joinPath(__dirname, file); // generating full path;
  console.log('fullPath', fullPath);
  return new pgPromise.QueryFile(fullPath, {minify: true});
}

async function migrations(specificDate, queryArray) {
  try {
    const migrationDate = (specificDate) 
    ? specificDate
    : format(new Date(), 'yyyy-MM-dd');

    const queriesThatAreInTheMigrationFile = [sql(`${migrationDate}-migration.sql`)];
    const queriesThatAreNotInTheMigrationFile = [];
    
    const queryArray = [...queriesThatAreNotInTheMigrationFile, ...queriesThatAreInTheMigrationFile];

    const query = pgPromise.helpers.concat(queryArray);
    return await db.manyOrNone(query);
  } catch (e) {
    console.log('CATCH', e);
  }
}

migrations('2021-09-01');


/*
TODO
ASK BART NOT TO ADD WIERDO DATES
ITERATE through queries and run
4 make query to delete all the oakland trees that have not been modified in last however long minutes?

FS read sql file
*/




