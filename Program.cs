using Npgsql;
using Dapper;
using Microsoft.Extensions.Configuration;


class Program
{

    // -----------------------------------------------------
    // MAIN
    static async Task Main(string[] args)
    {
        // Проверяем конфигурацию (appsettings.json...) и загружаем её
        if (!CheckConfig(out var config)) {
            // Если ошибка - выход
            // TODO Логировать ошибку в файл
            return;
        }

        var versionStr = GetVersionStr();
        var botToken = config!["Bot:Token"];
        var dbName = config!["Database:DBName"];

        // Покажем версию и среду в консоли
        Console.WriteLine($"ktgs_bot {versionStr} запущен.");
        Console.WriteLine($"Bot Token: {botToken}");
        Console.WriteLine($"Database Name: {dbName}");


        // Готовим данные для подключения к БД
        var connectionString = new NpgsqlConnectionStringBuilder
        {
            Host = config["Database:Host"]!,
            Port = int.Parse(config["Database:Port"]!),
            Database = config["Database:DBName"]!,
            Username = config["Database:Username"]!,
            Password = config["Database:Password"]!
        }.ConnectionString;

        // Проверяем подключение к БД один раз при старте.
        // Бот запускается в любом случае — кнопки с данными просто вернут ошибку.
        await CheckDatabaseAsync(connectionString);

        try
        {
            // Соединение с базой данных
            // TODO Позже соединение будет не постоянное, а открываться 
            //   при каждом запросе к БД и закрываться после него
            //  (или использовать пул соединений)

            await using var connection = new NpgsqlConnection(connectionString);
            await connection.OpenAsync();
            // Console.WriteLine("Соединение с базой данных установлено!");

            // Вывод данных 

            Console.WriteLine($"------------------------------------------------------------");
            // Показать дни открытых дверей
            var filterDay = new DateTime(DateTime.Now.Year, 1, 1); // Начало текущего года
            // Console.WriteLine($"filterDay - {filterDay}"); // Для отладки
            await Show_Open_Door_Time_Async(connection, filterDay);


            Console.WriteLine($"------------------------------------------------------------");
            // Учебные корпуса
            await Show_COLLEGE_BRANCHES_Async(connection);

            Console.WriteLine($"------------------------------------------------------------");
            // Часто задаваемые вопросы
            var faq_limit = 5;
            var admission_id = 1;
            await Show_ADMISSION_FAQ_Async(connection, admission_id, faq_limit);

            Console.WriteLine($"------------------------------------------------------------");
            // Список специальностей
            await Show_Specialties_List_Asyncs(connection);

            Console.WriteLine($"------------------------------------------------------------");
            // Карточка специальности
            int? specialtyId = 1;
            await Show_All_Specializations_Async(connection, specialtyId);
            // await Show_All_Specializations_Async(connection, null); // Для отладки - Не найдено описание специальности.

            Console.WriteLine($"------------------------------------------------------------");
            // Сроки и правила перевода
            int? specialty_id = null; // Раздел по-умолчанию
            // int? specialty_id = 1; // Раздел для отладки
            // int? specialty_id = -1; // Раздел для отладки
            await Show_Transfer_Page_Content_Asyncs(connection, specialty_id);

        }
        catch (NpgsqlException dbEx)
        {
            Console.WriteLine($"Ошибка базы данных: {dbEx.Message}");
            // Console.WriteLine($"Детали: {dbEx.InnerException?.Message}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Общая ошибка: {ex.Message}");
        }
    } // MAIN

    // -----------------------------------------------------
    // Проверка подключения к БД при старте.
    // Бот стартует в любом случае; если БД недоступна — кнопки с данными вернут ошибку пользователю.
    private static async Task CheckDatabaseAsync(string connectionString)
    {
        try
        {
            // Подключаемся к БД
            await using var conn = new NpgsqlConnection(connectionString);
            await conn.OpenAsync();
            Console.WriteLine("[DB] Подключение к базе данных: OK");
        }
        catch (NpgsqlException ex) // Если ошибка подключения, логируем её и продолжаем — бот будет работать без БД.
        {   
            // TODO Логировать ошибку в файл
            Console.WriteLine($"[DB] Нет подключения к БД: {ex.Message}");
            Console.WriteLine("[DB] Бот запущен без БД — кнопки с данными будут недоступны.");
        }
    }

    // -----------------------------------------------------
    // Получение строки с версией приложения из атрибута сборки
    static string GetVersionStr()
    {
        // Получаем версию из атрибута сборки (указано в .csproj в теге <Version>)
        var v = typeof(Program).Assembly.GetName().Version; 
        return $"v{v?.Major}.{v?.Minor}.{v?.Build}";
    }
    
    // -----------------------------------------------------
    /*
     * Проверяет наличие и корректность конфигурационных файлов
     * Возвращает true, если конфигурация валидна, и false с выводом ошибок, если что-то не так.
     * Параметры:
     * - config - выходной параметр для загруженной конфигурации (null при ошибке)
     */
    static bool CheckConfig(out IConfiguration? config)
    {
        config = null; // Пока нет конфигурации
        if (!File.Exists("appsettings.json"))
        {
            Console.WriteLine("Файл appsettings.json не найден.");
            return false;
        }
        config = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: false)
            .Build();
        // Проверяем наличие всех параметров
        if (!CheckParam(config,  "Bot:Token")) { return false; }
        if (!CheckParam(config,  "Database:Host")) { return false; }
        if (!CheckParam(config,  "Database:Port")) { return false; }
        if (!CheckParam(config,  "Database:DBName")) { return false; }    
        if (!CheckParam(config,  "Database:Username")) { return false; }
        if (!CheckParam(config,  "Database:Password")) { return false; }
        return true; // Если дошли до сюда, значит всё ок
    }
    
    // -----------------------------------------------------
    /* Проверяет наличие конкретного параметра в конфигурации */
    static bool CheckParam(IConfiguration config, string checkParam)
    {
        if (string.IsNullOrWhiteSpace(config[checkParam!])) {
            Console.WriteLine($"Параметр {checkParam} не задан в конфиге.");
            return false;
        }
        return true;
    }
    

    // -----------------------------------------------------
    // Выводит список - Дни открытых дверей
    // * filterDate - Дата начиная с которой выводится список
    static async Task Show_Open_Door_Time_Async(NpgsqlConnection connection, DateTime? filterDate = null)
    {   
        string sqlQuery = @"SELECT even_date, event_time 
                              FROM open_door_time dt 
                             WHERE even_date >= @filterDate
                             ORDER BY even_date, event_time;";
        
        await using var command = new NpgsqlCommand(sqlQuery, connection);
        command.Parameters.AddWithValue("@filterDate", filterDate.HasValue ? filterDate.Value : DBNull.Value);
        
        await using var reader = await command.ExecuteReaderAsync();

        if (reader.HasRows)
        {
            Console.WriteLine($"\nДни открытых дверей:\n");
            
            int evenDateIndex = reader.GetOrdinal("even_date");
            int eventTimeIndex = reader.GetOrdinal("event_time");
            
            while (await reader.ReadAsync())
            {
                DateTime evenDate = reader.GetDateTime(evenDateIndex);
                TimeSpan eventTime = reader.GetTimeSpan(eventTimeIndex);
                Console.WriteLine($"{evenDate:dd.MM.yyyy} начало {eventTime:hh\\:mm}");
            }
        }
        else
        {
            Console.WriteLine($"Дни открытых дверей не найдены.");
        }
    }

    // -----------------------------------------------------
    // Вывод списка учебных корпусов
    static async Task Show_COLLEGE_BRANCHES_Async(NpgsqlConnection connection)
    {
        string sqlQuery = @"select bt.id, bt.branch_name, bt.adress, bt.metro_station
                              from COLLEGE_BRANCHES bt
                             order by bt.branch_name;";
        
        // Dapper: QueryAsync автоматически маппит колонки в объекты
        var branches = await connection.QueryAsync(sqlQuery);

        if (branches.Any())
        {
            Console.WriteLine("\nУчебные корпуса:\n");
            
            int counter = 1;
            foreach (var branch in branches)
            {
                // Обращаемся к полям по имени колонки (регистр важен!)
                string branchName = branch.branch_name ?? "Без названия";
                string address = branch.adress ?? "Не указан";
                string metroStation = branch.metro_station ?? "-";
                
                Console.WriteLine($"{counter}. {branchName}");
                Console.WriteLine($"   Адрес: {address}");
                Console.WriteLine($"   Метро: {metroStation}");
                
                Console.WriteLine();
                counter++;
            }
        }
        else { 
            Console.WriteLine("Данные об учебных корпусах не найдены.");
        }
    }

    // -----------------------------------------------------
    // Вывод списка специальностей
    static async Task Show_Specialties_List_Asyncs(NpgsqlConnection connection)
    {
        string sqlQuery = @"
            SELECT sl.title
            FROM specialties_list sl
            ORDER BY sl.title;";
        
        await using var command = new NpgsqlCommand(sqlQuery, connection);
        await using var reader = await command.ExecuteReaderAsync();
        if (reader.HasRows)
        {
            Console.WriteLine("\nСПЕЦИАЛЬНОСТИ КОЛЛЕДЖА:\n");
            while (await reader.ReadAsync())
            {
                string title = reader.GetString(0);
                Console.WriteLine($"- {title}");
            }
        }
        else {
            Console.WriteLine("Список специальностей не найден.");
        }
    }

    
    // -----------------------------------------------------
    // Раздел - Карточка специальности
    // * specialtyId - Код специальности (по-умолчанию - NULL)
    static async Task Show_All_Specializations_Async(NpgsqlConnection connection, int? specialtyId = null)
    {
        string sqlQuery = @"
            SELECT t.id
                  ,t.specialty_id 
                  ,sp.title AS specialty_nm
                  ,sp.cod AS specialty_code
                  ,t.content_type
                  ,CASE -- Словоформы для пустых значений
                     WHEN t.content_type = 10 THEN 'Не указана' -- 'Квалификация'
                     WHEN t.content_type = 20 THEN 'Не указано' -- 'Краткое описание специальности'
                     WHEN t.content_type = 30 THEN 'Не указана' -- 'Область профессиональной деятельности'
                     WHEN t.content_type = 40 THEN 'Не указано' -- 'Где работает'
                     WHEN t.content_type = 50 THEN 'Не указаны' -- 'Средства труда'
                     WHEN t.content_type = 60 THEN 'Не указаны' -- 'Основные виды деятельности'
                     WHEN t.content_type = 70 THEN 'Не указано' -- 'Какими качествами должен обладать'
                     WHEN t.content_type = 80 THEN 'Не указаны' -- 'Должности в организациях'
                     ELSE 'Не указано' 
                   END AS body_empty
                  ,ct.content_type AS title
                  ,t.content AS body
              FROM FILLING_IN_DATA_FOR_SPECIALIZATIONS t
              LEFT JOIN TYPE_CONTENT ct ON ct.id = t.content_type
              LEFT JOIN SPECIALTIES_LIST sp ON sp.id = t.specialty_id 
             WHERE t.specialty_id = @specialty_id
             ORDER BY t.specialty_id, t.content_type, t.id;";

        var rows = await connection.QueryAsync(sqlQuery, new { specialty_id = specialtyId });
        // Если есть вообще данные        
        if (rows.Any())
        {
            // Обработка первой строки
            // Получение заголовка специальности
            var firstRow = rows.First();
            string specialtyName = firstRow.specialty_nm?.ToString() ?? "Не указано";
            string specialtyCode = firstRow.specialty_code?.ToString() ?? "Не указан";
            
            Console.WriteLine($"ОПИСАНИЕ СПЕЦИАЛЬНОСТИ:\n");
            Console.WriteLine($"Специальность: {specialtyName}");
            Console.WriteLine($"Код: {specialtyCode}");
            // Перебоор разделов
            foreach (var row in rows)
            {
                string title = row.title?.ToString() ?? "Раздел не определен";
                string body = row.body?.ToString() ?? row.body_empty?.ToString();
                body = body.Replace("\\n", "\n"); // Заменяем \n на реальный перевод строки
                Console.WriteLine($"\n{title}:");
                Console.WriteLine($"{body}");
            }
        }
        else
        {
            Console.WriteLine($"Не найдено описание специальности.");
        }
    }


    // -----------------------------------------------------
    // Часто задаваемые вопросы
    static async Task Show_ADMISSION_FAQ_Async(NpgsqlConnection connection, int admission_id, int faq_limit)
    {
        string sqlQuery = @"SELECT af.question, af.answer, af.display_order 
                              FROM ADMISSION_FAQ af 
                             WHERE af.admission_id = @admission_id 
                               AND af.display_order > 0
                               AND af.answer IS NOT NULL
                             ORDER BY af.display_order 
                             LIMIT @faq_limit;";
        
        await using var command = new NpgsqlCommand(sqlQuery, connection);
        command.Parameters.AddWithValue("@admission_id", admission_id);
        command.Parameters.AddWithValue("@faq_limit", faq_limit);
        
        await using var reader = await command.ExecuteReaderAsync();

        if (reader.HasRows)
        {
            // Получаем индексы колонок по имени (один раз)
            int questionIndex = reader.GetOrdinal("question");
            int answerIndex = reader.GetOrdinal("answer");
            
            Console.WriteLine("\nЧАСТО ЗАДАВАЕМЫЕ ВОПРОСЫ:\n");
            
            int counter = 1;
            while (await reader.ReadAsync())
            {
                // Чтение по индексу (но индекс получен из имени колонки)
                string question = reader.GetString(questionIndex);
                string answer = reader.GetString(answerIndex);
                
                Console.WriteLine($"Вопрос {counter}: {question}");
                Console.WriteLine($"Ответ: {answer}");
                Console.WriteLine();
                counter++;
            }
        }
        else
        {
            Console.WriteLine($"Раздел вопросов и ответов пуст.");
        }
    }

    
    // -----------------------------------------------------
    // Раздел - Сроки и правила перевода
    // * specialtyId - Код специальности (по-умолчанию - NULL)
    static async Task Show_Transfer_Page_Content_Asyncs(NpgsqlConnection connection, int? specialtyId = null)
    {   
        // Получим информацию о правилах одной строкой
        string sqlQuery = @"select tpc.top_content, tpc.middle_text, tpc.bottom_content
                                  ,tpc.id,tpc.specialty_id
                              from TRANSFER_PAGE_CONTENT tpc
                             where (@specialty_id is null and tpc.specialty_id is null 
                                    or (@specialty_id is not null and tpc.specialty_id = @specialty_id))
                             order by case when @specialty_id is not null then tpc.specialty_id else 0 end
                             limit 1;"; // TODO Пока берем только один
        
        // QueryFirstOrDefaultAsync - возвращает первую запись или null
        var row = await connection.QueryFirstOrDefaultAsync(sqlQuery, new { specialty_id = specialtyId });
        
        if (row != null)
        {
            // Безопасное получение значений с защитой от NULL
            string topContent = row.top_content ?? "";
            string middleText = row.middle_text ?? "";
            string bottomContent = row.bottom_content ?? "";
            
            // Выводим TOP_CONTENT
            Console.WriteLine("\n## Информация о сроках, правилах и условиях перевода\n");
            Console.WriteLine(topContent);
            Console.WriteLine();
            // Выводим MIDDLE_TEXT (только если не пустой)
            if (!string.IsNullOrWhiteSpace(middleText))
            {
                Console.WriteLine("## Действия абитуриента при переводе\n");
                Console.WriteLine(middleText);
                Console.WriteLine();
            }
            // Выводим BOTTOM_CONTENT (только если не пустой)
            if (!string.IsNullOrWhiteSpace(bottomContent))
            {
                Console.WriteLine("## Контакты и список необходимых документов\n");
                Console.WriteLine(bottomContent);
                Console.WriteLine();
            }
        }
        else
        {
            Console.WriteLine($"Информация о правилах перевода не найдена." );
        }
    }


}