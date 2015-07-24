---
title: Connect to and query Postgres
---

# Connect to Postgres and run a SQL query

Connecting to Postgres in Nim can be frustrating because currently [the default Postgres library](http://nim-lang.org/docs/postgres.html) is very poorly documented because it is just a wrapper around the C library and it is probably too low level. Instead of `import postgres` use `import db_postgres` instead:

```nim
import db_postgres

var conn = "password= host=localhost port=5432 dbname=db"
var pg = open("", "username", "", conn)
var result = pg.getAllRows(sql"SELECT email FROM users")

echo result
```

Note that for an empty password it is currently required to place `password=` in the connection string.

See the [db_postgres module](http://nim-lang.org/docs/db_postgres.html) for more information.
