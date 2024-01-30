## Simple script to safe all data in .tar file and a separated .sql for the DB

( Example using mariadb )

Simple tar the data folder for a docker instance, dump a sql using mariadb-dump, get the sql from the folder to the backup folder

```
backupItem=
folderDocker=
tar -czvf archive/$backupItem.tar.gz --exclude=db $folderDocker/$backupItem
docker exec $backupItem_db mariadb-dump -uUser -pPassword Database --result-file=/var/lib/mysql/dump.sql
mv $folderDocker/$backupItem/db/dump.sql dbs/$backupItem.sql
```
