# PostgresApp

Консольное приложение на .NET 10 (C#) для работы с базой данных колледжа КТГС (Колледж туризма и гостиничного сервиса, Санкт-Петербург).

Приложение подключается к PostgreSQL и выводит:

- Дни открытых дверей (ближайшие даты и время)
- Филиалы колледжа (адреса, метро)
- FAQ по поступлению
- Список специальностей и карточки специальностей
- Информацию о переводе из другого учебного заведения

---

## Структура проекта

```
PostgresApp/
├── install/                           # Скрипты установки и резервного копирования БД
│   ├── db_settings.bat                # Настройки: имя БД, пользователь, пути
│   ├── create_db.bat                  # Создание рабочей БД (prod)
│   ├── create_db_dev.bat              # Создание БД разработки (dev)
│   ├── restore_db_from_backup.bat     # Восстановление prod-БД из дампа
│   ├── restore_db_from_backup_dev.bat # Восстановление dev-БД из дампа
│   ├── create_db_backup_file.bat      # Создание резервной копии prod
│   ├── create_db_backup_file_dev.bat  # Создание резервной копии dev
│   ├── backup-ktgs_maxdb-prod.sql     # Дамп prod-базы для восстановления
│   └── sql/
│       └── create_db.sql             # Инструкция создания БД через psql (в разработке)
├── docs/                             # Дополнительная документация
│   ├── db-connection-architecture.md # Архитектура подключения к БД
│   ├── max-bot-guide.md              # Руководство по боту
│   └── nuget-packages-guide.md       # Описание пакетов NuGet
├── res/                              # Ресурсные файлы
│   └── SqlLog YYYY-MM-DD.sql         # Логи SQL-сессий
├── tests/                            # Логи тестовых запусков
│   └── test_YYYY-MM-DD.txt
├── Program.cs                        # Точка входа, основная логика
├── ktgs_bot.csproj                   # Файл проекта .NET
├── bat_settings.bat                  # Общие настройки для bat-скриптов
├── build.bat                         # Сборка проекта
├── run.bat                           # Запуск приложения
├── publish.bat                       # Публикация (self-contained exe)
├── clean.bat                         # Очистка артефактов сборки (bin, obj, .vs)
├── install_net.bat                   # Установка .NET SDK и пакетов зависимостей
├── appsettings.json                  # Конфигурация подключения (не в git)
└── appsettings.example.json          # Пример конфигурации
```

---

## Системные требования

| Компонент | Версия |
|-----------|--------|
| ОС | Windows 10 / Windows 11 |
| .NET SDK | 10.0 или новее |
| PostgreSQL | 16 или новее |
| IDE (опционально) | VS Code или Visual Studio 2022+ |

---

## Пакеты NuGet

| Пакет | Версия | Назначение |
|-------|--------|-----------|
| [Npgsql](https://www.npgsql.org/) | 10.0.3 | Драйвер PostgreSQL для .NET |
| [Dapper](https://github.com/DapperLib/Dapper) | 2.1.35 | Лёгкий ORM для маппинга запросов |
| Microsoft.Extensions.Hosting | 9.* | Внедрение зависимостей и хостинг |

---

## Конфигурация

Приложение читает настройки из файла `appsettings.json` (создаётся на основе `appsettings.example.json`).  
Файл `appsettings.json` не хранится в репозитории — добавлен в `.gitignore`.

Пример конфигурации (`appsettings.json`):

```json
{
  "Bot": {
    "Token": "ВАШ_ТОКЕН_БОТА"
  },
  "Database": {
    "Host": "localhost",
    "Port": 5432,
    "DBName": "ktgs_maxdb4",
    "Username": "postgres",
    "Password": "ВАШ_ПАРОЛЬ"
  }
}
```

Подробная инструкция по установке и настройке — в [INSTALL.md](INSTALL.md).
