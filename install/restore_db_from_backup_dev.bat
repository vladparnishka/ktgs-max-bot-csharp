@echo off 
@chcp 65001 > nul

@rem Меняем директорию на папку с исполняемым файлом
@cd /d %~dp0
call "%~dp0db_settings.bat"

@echo Восстановление БД из резервной копии - %BACKUP_FILE_DEV%
@rem psql -U postgres %DB_NAME_DEV% < %BACKUP_FILE_DEV%
%PG_DUMP_PATH%psql -U %DB_SUPER_USER% %DB_NAME_DEV% < %BACKUP_FILE_DEV%

@echo Состояние БД восстановлено
pause
