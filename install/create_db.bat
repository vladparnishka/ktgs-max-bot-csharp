@echo off 
@chcp 65001 > nul

@rem Меняем директорию на папку с исполняемым файлом
@cd /d %~dp0
call "%~dp0db_settings.bat"

@echo Создает БД PostgreSQL - %DB_NAME% / User - %DB_SUPER_USER%
%PG_DUMP_PATH%createdb -U %DB_SUPER_USER% %DB_NAME%
@rem createdb -U postgres %DB_NAME%
@rem createdb -h YOUR_HOST -p YOUR_PORT -U YOUR_USER YOUR_DATABASE

@echo База данных (%DB_NAME%) создана
pause
