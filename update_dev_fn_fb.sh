#!/bin/sh
PG=`docker ps | grep postgres`
echo "thats PG: $PG"
if [ -z "$PG" ]
then
    echo 'postgres is not running'
    docker start postgres
else
    echo 'found postgres'
fi
cd /mnt/100ext4/
sftp aganzha@10.88.114.93:/home/aganzha/arch/current.sql.tar.gz
gzip -d current.sql.tar.gz 
sudo mv current.sql.tar postgres_data/current.sql.tar
echo 'drop database if exists app;create database app;grant all privileges on database app to app;' | docker exec -i postgres psql -U postgres
docker exec -i postgres pg_restore -v -d app -U postgres /var/lib/postgresql/data/current.sql.tar
sudo rm postgres_data/current.sql.tar

