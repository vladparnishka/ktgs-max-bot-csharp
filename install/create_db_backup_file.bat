@echo off 
@chcp 65001 > nul

@rem Меняем директорию на папку с исполняемым файлом
@cd /d %~dp0
call "%~dp0db_settings.bat"

@echo Create backup file from PostgreSQL DB - %DB_NAME%
@rem pg_dump -U postgres %DB_NAME% > %BACKUP_FILE%
%PG_DUMP_PATH%pg_dump -U %DB_SUPER_USER% %DB_NAME% > %BACKUP_FILE%


@echo Резервная копия создана - %BACKUP_FILE%

pause