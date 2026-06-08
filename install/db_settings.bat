@rem Имена БД и файлов бэкапа для скриптов install/

@rem PG_DUMP_PATH - Установить, если команды pg_dump, createdb не видны в CMD
set PG_DUMP_PATH="C:\Program Files\PostgreSQL\18\bin\"

@rem DB_SUPER_USER - пользователь владелец БД PostgreSQL
set DB_SUPER_USER=postgres
set DB_USER=%DB_USER%
set DB_USER_DEV=%DB_USER%

@rem DB_NAME     - Название БД (PROD контур)
@rem DB_NAME_DEV - Название БД (DEV контур)
set DB_NAME=ktgs_maxdb4
@rem set DB_NAME=postgres
set DB_NAME_DEV=ktgs_maxdb4_dev

@rem BACKUP_FILE     - Название файла бэкапа (PROD контур)
@rem BACKUP_FILE_DEV - Название файла бэкапа (DEV контур)
set BACKUP_FILE=backup-ktgs_maxdb-prod.sql
set BACKUP_FILE_DEV=backup-ktgs_maxdb-dev.sql
