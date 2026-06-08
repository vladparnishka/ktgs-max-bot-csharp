-- create_db.sql
-- SQL-скрипт создания базы данных ktgs_maxdb4
-- Статус: заглушка, в разработке
-- Финальный вариант заменит скрипт create_db.bat

-- Это целевой скрипт-инструкция.

-- Промежуточный путь - установка через 
--   /install/create_db.bat
--   /install/create_db_backup_file.bat

----------------------------------------------------------
-- 1. Подключиться к PostgreSQL DB
CMD
psql -U postgres

-- 2. Создать БД
CREATE DATABASE ktgs_maxdb4;
  -- CREATE DATABASE
  
-- 3. Создать пользователя
CREATE USER ktgs_maxdb_admin WITH PASSWORD 'ПАРОЛЬ_ПОЛЬЗОВАТЕЛЯ';
  -- CREATE ROLE
  
-- 4. Выдать права
GRANT ALL PRIVILEGES ON DATABASE ktgs_maxdb4 TO ktgs_maxdb_admin;
  -- GRANT

-- 5. Подключиться к ktgs_db
\c ktgs_maxdb4
  -- Вы подключены к базе данных "ktgs_maxdb4" как пользователь "ktgs_maxdb_admin".
  
-- 6. Права на схему
GRANT ALL ON SCHEMA public TO ktgs_maxdb_admin;
  -- GRANT
  
-- Консоль не закрывать пока  

----------------------------------------------------------
-- Создать в DBeaver новое подключение 
  jdbc:postgresql://localhost:5432/ktgs_maxdb4
  user ktgs_maxdb_admin
  pas ***
  
-- Проверка. В новом окне DBeaver создать скриптом таблицу
-- 7. Создать таблицу в DBeaver
CREATE TABLE test_table (
  id         SERIAL PRIMARY KEY,
  name       VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW()
);

----------------------------------------------------------
-- Вернуться в консоль PostgreSQL
CMD
psql -U postgres
\c ktgs_maxdb

-- Проверить в КОНСОЛИ PostgreSQL

-- Посмотреть список таблиц 
\dt

ktgs_maxdb=# \dt
                Список отношений
     Схема  |   Имя   |   Тип   |  Владелец
    --------+---------+---------+------------
     public | content | таблица | ktgs_maxdb_admin
    (1 строка)


-- Посмотреть список пользователей 
\dt
ktgs_maxdb=# \du
                                         Список ролей
      Имя роли        |                                Атрибуты
    ------------      +-------------------------------------------------------------------------
     ktgs_admin       |
     ktgs_admin2      |
     ktgs_maxdb_admin |
     postgres         | Суперпользователь, Создаёт роли, Создаёт БД, Репликация, Пропускать RLS

----------------------------------------------------------
-- Вернустья в DBeaver удалить таблицу

-- drop table test_table;

-- Проверить в консоли
ktgs_maxdb=# \dt
Отношения не найдены
