#!/bin/bash
set -e

/usr/local/bin/docker-entrypoint.sh postgres &

until psql -U postgres -c '\l'; do
	echo "PostgeSQL is starting ..."
	sleep 1
done

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE DATABASE superset_db;
    CREATE USER superset_user WITH ENCRYPTED PASSWORD 'example';
    GRANT ALL PRIVILEGES ON DATABASE superset_db TO superset_user;

    \c superset_db

    GRANT CREATE ON SCHEMA public TO superset_user;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO superset_user;
    GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO superset_user;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO superset_user;
EOSQL


wait
