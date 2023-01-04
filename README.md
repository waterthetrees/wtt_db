# waterthetrees

Water The Trees is a platform that crowd sources tree planting and maintenance. We believe in the power of trees to restore natural habitat for animals, insects, and fauna. We are interesting in continuous massive tree planting events to help sequester carbon and stabilize climate change extremes.

## Join Us!

https://docs.google.com/document/d/1L5Hc8_K_NhVhAejdE05C_Y__CgqeBWFrFYFoNqBSBbQ/edit
Water the Trees is an open source project run by tree planting volunteers at Sierra Club, Public Works, and developers at Code for America.


### INSTALL GIT
-------------
1. install git https://git-scm.com/downloads

### INSTALL DOCKER
-------------
1. install docker https://www.docker.com/get-started
2. install docker-compose (only on linux, on osx this installs with docker)

### CLONE REPOS
-------------
1. Open terminal and run this
```shell
$ git clone https://github.com/waterthetrees/waterthetrees.git
$ cd waterthetrees
$ ./clone_repos.sh
```

### BUILD AND START THE DOCKER
--------------- 
```shell
$ docker-compose up
```

### TO access DB via command line if you need to
---------------
1. Command T (on osx) for new terminal tab
```shell
$ psql -U trees -d treedb -h 127.0.0.1
```


### TO MAKE CHANGES TO THE treedb.sql FILE
---------------
FOLLOW DIRECTIONS HERE: https://git-lfs.github.com/ 
The treedb.sql file is over 100MB that is allowed on git

Example for mac:
```shell
$ brew install git-lfs
$ git lfs install
$ git lfs track "treedb.sql"
$ git add .gitattributes
$ git add treedb.sql
$ git commit -m "database changes"
$ git push origin dbfixes (or whatever branch you are working in)
```

### HOW TO MAKE DATABASE CHANGES
---------------
Add database changes should be made as migration files in the `migrations/` directory.
The migration file should follow the format `yyyy-mm-dd-migration.sql`.
These files should be run against a local version of postgres for testing.

After running the migration, we want to keep the database table files up-to-date.
All schema changes and pull requests with migrations should run the
`scipts/fetch-tables.sh` script. This will update all table files in the `tables/` directory.
The script can be run against a local postgres instance.

