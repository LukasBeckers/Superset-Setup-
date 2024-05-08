Run "docker-compose up -d" to create a superset and a postgresql instance.

The admin username and password for the superset instance are "admin", "admin".
The user for the database is "superset_user" with password "example".

In superset (localhost:8088) you can connect to the superset_db on "postgres" port "5432"
To upload csv to the database first activate file-uploads in "Settings/Database Connections", then edid your database, go to "advanced/Security" and check Allow fileupload to database. 
