--
-- PostgreSQL database dump
--

\restrict VsSaoF1lshMliVDAnzykuEON1r1usW7SKbsT8G3RhgXHLJathTR9ASjHAEXWcgV

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admission_faq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admission_faq (
    id integer NOT NULL,
    admission_id integer,
    question text,
    answer text,
    display_order integer
);


ALTER TABLE public.admission_faq OWNER TO postgres;

--
-- Name: admission_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admission_faq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admission_faq_id_seq OWNER TO postgres;

--
-- Name: admission_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admission_faq_id_seq OWNED BY public.admission_faq.id;


--
-- Name: admission_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admission_info (
    id integer NOT NULL,
    open_door_id integer,
    top_text text,
    contacts_link text
);


ALTER TABLE public.admission_info OWNER TO postgres;

--
-- Name: admission_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admission_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admission_info_id_seq OWNER TO postgres;

--
-- Name: admission_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admission_info_id_seq OWNED BY public.admission_info.id;


--
-- Name: basic_education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basic_education (
    id integer NOT NULL,
    education_info text
);


ALTER TABLE public.basic_education OWNER TO postgres;

--
-- Name: TABLE basic_education; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.basic_education IS 'Периоды обучения';


--
-- Name: basic_education__filling_in_data_for_specializations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basic_education__filling_in_data_for_specializations (
    id integer CONSTRAINT basic_education__filling_in_data_for_specialization_id_not_null NOT NULL,
    specialization_id integer,
    basic_education_id integer
);


ALTER TABLE public.basic_education__filling_in_data_for_specializations OWNER TO postgres;

--
-- Name: TABLE basic_education__filling_in_data_for_specializations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.basic_education__filling_in_data_for_specializations IS 'Периоды обучения для специальностей';


--
-- Name: basic_education__filling_in_data_for_specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basic_education__filling_in_data_for_specializations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.basic_education__filling_in_data_for_specializations_id_seq OWNER TO postgres;

--
-- Name: basic_education__filling_in_data_for_specializations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basic_education__filling_in_data_for_specializations_id_seq OWNED BY public.basic_education__filling_in_data_for_specializations.id;


--
-- Name: basic_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basic_education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.basic_education_id_seq OWNER TO postgres;

--
-- Name: basic_education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basic_education_id_seq OWNED BY public.basic_education.id;


--
-- Name: branch_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch_schedule (
    branch_id integer NOT NULL,
    open_door_id integer NOT NULL
);


ALTER TABLE public.branch_schedule OWNER TO postgres;

--
-- Name: college_branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.college_branches (
    id integer NOT NULL,
    branch_name text,
    adress text,
    metro_station text
);


ALTER TABLE public.college_branches OWNER TO postgres;

--
-- Name: college_branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.college_branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.college_branches_id_seq OWNER TO postgres;

--
-- Name: college_branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.college_branches_id_seq OWNED BY public.college_branches.id;


--
-- Name: education_loan_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education_loan_content (
    id integer NOT NULL,
    specialty_id integer,
    content text NOT NULL
);


ALTER TABLE public.education_loan_content OWNER TO postgres;

--
-- Name: TABLE education_loan_content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.education_loan_content IS 'Условия образовательного кредита';


--
-- Name: education_loan_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.education_loan_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.education_loan_content_id_seq OWNER TO postgres;

--
-- Name: education_loan_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.education_loan_content_id_seq OWNED BY public.education_loan_content.id;


--
-- Name: education_loan_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education_loan_media (
    id integer NOT NULL,
    loan_content_id integer,
    file_url text NOT NULL,
    "position" integer
);


ALTER TABLE public.education_loan_media OWNER TO postgres;

--
-- Name: education_loan_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.education_loan_media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.education_loan_media_id_seq OWNER TO postgres;

--
-- Name: education_loan_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.education_loan_media_id_seq OWNED BY public.education_loan_media.id;


--
-- Name: filling_in_data_for_specializations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filling_in_data_for_specializations (
    id integer NOT NULL,
    specialty_id integer,
    content_type integer,
    content text NOT NULL
);


ALTER TABLE public.filling_in_data_for_specializations OWNER TO postgres;

--
-- Name: TABLE filling_in_data_for_specializations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.filling_in_data_for_specializations IS 'Карточка специальности';


--
-- Name: filling_in_data_for_specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filling_in_data_for_specializations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.filling_in_data_for_specializations_id_seq OWNER TO postgres;

--
-- Name: filling_in_data_for_specializations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filling_in_data_for_specializations_id_seq OWNED BY public.filling_in_data_for_specializations.id;


--
-- Name: information_stat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.information_stat (
    id integer NOT NULL,
    specialty_id integer,
    title text,
    content text
);


ALTER TABLE public.information_stat OWNER TO postgres;

--
-- Name: information_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.information_stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.information_stat_id_seq OWNER TO postgres;

--
-- Name: information_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.information_stat_id_seq OWNED BY public.information_stat.id;


--
-- Name: open_door_time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.open_door_time (
    id integer NOT NULL,
    even_date date NOT NULL,
    event_time time without time zone DEFAULT '13:00:00'::time without time zone NOT NULL
);


ALTER TABLE public.open_door_time OWNER TO postgres;

--
-- Name: open_door_time_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.open_door_time_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.open_door_time_id_seq OWNER TO postgres;

--
-- Name: open_door_time_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.open_door_time_id_seq OWNED BY public.open_door_time.id;


--
-- Name: specialties_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialties_list (
    id integer NOT NULL,
    cod text NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.specialties_list OWNER TO postgres;

--
-- Name: TABLE specialties_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.specialties_list IS 'Специальности';


--
-- Name: specialties_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specialties_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specialties_list_id_seq OWNER TO postgres;

--
-- Name: specialties_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specialties_list_id_seq OWNED BY public.specialties_list.id;


--
-- Name: target_education_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target_education_media (
    id integer NOT NULL,
    admission_id integer,
    file_path text NOT NULL,
    display_order integer
);


ALTER TABLE public.target_education_media OWNER TO postgres;

--
-- Name: target_education_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.target_education_media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.target_education_media_id_seq OWNER TO postgres;

--
-- Name: target_education_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_education_media_id_seq OWNED BY public.target_education_media.id;


--
-- Name: transfer_page_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfer_page_content (
    id integer NOT NULL,
    specialty_id integer,
    top_content text,
    middle_text text,
    bottom_content text
);


ALTER TABLE public.transfer_page_content OWNER TO postgres;

--
-- Name: TABLE transfer_page_content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.transfer_page_content IS 'Условия перевода из другого учебного заведению';


--
-- Name: transfer_page_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transfer_page_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transfer_page_content_id_seq OWNER TO postgres;

--
-- Name: transfer_page_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transfer_page_content_id_seq OWNED BY public.transfer_page_content.id;


--
-- Name: type_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_content (
    id integer NOT NULL,
    content_type text
);


ALTER TABLE public.type_content OWNER TO postgres;

--
-- Name: type_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_content_id_seq OWNER TO postgres;

--
-- Name: type_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_content_id_seq OWNED BY public.type_content.id;


--
-- Name: admission_faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admission_faq ALTER COLUMN id SET DEFAULT nextval('public.admission_faq_id_seq'::regclass);


--
-- Name: admission_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admission_info ALTER COLUMN id SET DEFAULT nextval('public.admission_info_id_seq'::regclass);


--
-- Name: basic_education id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_education ALTER COLUMN id SET DEFAULT nextval('public.basic_education_id_seq'::regclass);


--
-- Name: basic_education__filling_in_data_for_specializations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_education__filling_in_data_for_specializations ALTER COLUMN id SET DEFAULT nextval('public.basic_education__filling_in_data_for_specializations_id_seq'::regclass);


--
-- Name: college_branches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college_branches ALTER COLUMN id SET DEFAULT nextval('public.college_branches_id_seq'::regclass);


--
-- Name: education_loan_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_loan_content ALTER COLUMN id SET DEFAULT nextval('public.education_loan_content_id_seq'::regclass);


--
-- Name: education_loan_media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_loan_media ALTER COLUMN id SET DEFAULT nextval('public.education_loan_media_id_seq'::regclass);


--
-- Name: filling_in_data_for_specializations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filling_in_data_for_specializations ALTER COLUMN id SET DEFAULT nextval('public.filling_in_data_for_specializations_id_seq'::regclass);


--
-- Name: information_stat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_stat ALTER COLUMN id SET DEFAULT nextval('public.information_stat_id_seq'::regclass);


--
-- Name: open_door_time id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_door_time ALTER COLUMN id SET DEFAULT nextval('public.open_door_time_id_seq'::regclass);


--
-- Name: specialties_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties_list ALTER COLUMN id SET DEFAULT nextval('public.specialties_list_id_seq'::regclass);


--
-- Name: target_education_media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_education_media ALTER COLUMN id SET DEFAULT nextval('public.target_education_media_id_seq'::regclass);


--
-- Name: transfer_page_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_page_content ALTER COLUMN id SET DEFAULT nextval('public.transfer_page_content_id_seq'::regclass);


--
-- Name: type_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_content ALTER COLUMN id SET DEFAULT nextval('public.type_content_id_seq'::regclass);


--
-- Data for Name: admission_faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admission_faq (id, admission_id, question, answer, display_order) FROM stdin;
2	1	Можно ли поступить с 2 ОГЭ?	В рамках Федерального закона от 01.04.2025 г. №40-ФЗ «О проведении эксперимента по расширению доступности среднего профессионального образования» Колледж туризма и прикладных технологий Санкт-Петербурга ведет прием на обучение по профессии "Повар, кондитер".	1
3	1	Есть ли при Колледже общежитие?	Общежития нет. В соответствии с законодательством граждане обязаны регистрироваться по месту временного пребывания.	2
4	1	По какому адресу можно подавать документы?	Приемная комиссия находится по адресу: ст. метро Нарвская, наб. Обводного канала, д. 154-а. [Режим работы приемной комиссии](https://www.ktgs.ru/inspection/rejim_raboti_pk.php)	3
5	1	Что нужно для подачи документов?	Все этапы подачи и перечень документов подробно указаны в документе [Перечень документов для поступления](https://www.ktgs.ru/upload/1site/priem/perechen_priem2025-2026.pdf)	4
6	1	Обязательно ли присутствие родителя/законного представителя при подаче документов?	Если Вам нет 18 лет, то заявление на зачисление и согласие на обработку персональных данных несовершеннолетнего подписывает родитель/законный представитель. Прием документов на договорную форму обучения осуществляется только в присутствии законного представителя несовершеннолетнего.	5
7	1	По каким специальностям осуществляется прием?	[Перечень специальностей на 2025 - 2026 уч. год](https://www.ktgs.ru/upload/2025/perechen-specialnostej-na-2025-2026-upd-24-02-2025.pdf)	6
8	1	Есть ли бюджетные места для обучения?	Количество бюджетных мест указано в документе [План приема на 2025-2026 уч.г.](https://www.ktgs.ru/upload/2025/plan-priyoma-na-2025-2026-uch-god-byudzhet-upd-24-02-2025.pdf)	7
9	1	Можно ли поступить в ваш колледж на базе 8 классов?	Прием в колледже осуществляется только на базе 9 или 11 классов.	8
10	1	Какие документы необходимы при подаче заявления?	Все этапы подачи и перечень документов подробно указаны в документе [Перечень документов для поступления](https://www.ktgs.ru/upload/1site/priem/perechen_priem2025-2026.pdf)	9
11	1	Нужно ли заверять копии документов у нотариуса?	Копии документов заверять не нужно, если в Приемной комиссии Вы предъявите лично оригинал документа об образовании. В этом случае сотрудник Приемной комиссии заверяет копию самостоятельно. Без предъявления оригинала незаверенная копия документа об образовании не будет принята к рассмотрению. При отсутствии оригинала аттестата при подаче документов предоставляется нотариально заверенная копия документа об образовании.Напоминаем, что зачисление возможно только при наличии оригинала документа об образовании.	10
12	1	Могут ли подать/забрать документы вместо абитуриента его родственники/знакомые?	Подать/забрать документы за Вас могут ваши родственники или друзья только при наличии у них паспорта, расписки и нотариальной доверенности	11
13	1	Каким способом можно подать документы в Ваш Колледж?	Порядок подачи документов подробно прописан в [Правилах приема на 2025-2026 уч.год, пункт 4.8](https://www.ktgs.ru/upload/2025/pravila-priyoma-2025-2026-upd-06-03-2025.pdf)	12
14	1	Можно ли подать заявление на несколько специальностей?	Заявление о зачислении подается на одну специальность/профессию.	13
15	1	Какие экзамены/ЕГЭ/ОГЭ необходимы для поступления?	• Прием по всем специальностям в нашем колледже осуществляется без экзаменов, без учета ЕГЭ/ОГЭ. Учитывается только средний балл аттестата [Вступительные испытания](https://www.ktgs.ru/inspection/trainings.php)	14
16	1	Как считается средний балл?	Средний балл аттестата/диплома представляет собой сумму оценок по предметам общеобразовательного цикла из приложения к аттестату/диплому, разделенную на количество дисциплин	15
17	1	Каким должен быть средний балл для зачисления?	Проходной балл зависит от количества поданных документов и среднего балла этих документов. Предсказать его никто не может.В соответствии со средним баллом аттестата абитуриенты распределяются по рейтингу (по списку от высшего среднего балла - к низшему). Рейтинговые списки публикуются на сайте в течение всего приема документов. После окончания приема к зачислению представляются абитуриенты, прошедшие по конкурсу и представившие оригинал документа об образовании.	16
18	1	Есть ли льготы при поступлении?	Поступающий представляет оригинал документа об образовании и (или) документа об образовании и о квалификации, а также документа, подтверждающего право преимущественного или первоочередного приема в соответствии с частью 4 статьи 68 Федерального закона "Об образовании в Российской Федерации" (при наличии), в сроки, установленные образовательной организацией.	17
19	1	Предоставляется ли отсрочка от службы в армии?	В соответствии с законом «О воинской обязанности и военной службе» от 28.03.1998г. №53-ФЗ право на отсрочку от призыва на военную службу имеют граждане: обучающиеся по очной форме обучения в образовательных организациях по имеющим государственную аккредитацию образовательным программам среднего профессионального образования, - в период освоения указанных образовательных программ, но не свыше сроков получения среднего профессионального образования, установленных федеральными государственными образовательными стандартами (статья 24, п. 2, а, пп 2).	18
20	1	Можно ли подать документы иногородним гражданам, не имеющим временной регистрации по месту пребывания	Отсутствие регистрация в Санкт-Петербурге или Ленинградской области для граждан РФ не является препятствием для подачи документов на обучение. Но необходимо знать, что в соответствии с законодательством граждане Российской Федерации могут пребывать без регистрации по месту пребывания на территории Российской Федерации не более 90 дней. Документы, регламентирующие права, обязанности и ответственность граждан по регистрационному учету: 1. Правила Регистрации и снятия граждан Российской Федерации с регистрационного учета по месту пребывания и по месту жительства в пределах Российской Федерации, п. 9. 2. Приказ Министерства внутренних дел Российской Федерации от 31 декабря 2017 г. N 984 3. Кодекс Административных Правонарушений РФ часть 2 ст. 19.15.1., 19.15.2	19
21	1	На каких условиях могут поступить иностранные граждане?	[Прием иностранных граждан](https://www.ktgs.ru/inspection/foreigners_pk.php)	20
22	1	В каком учебном корпусе будет проходить обучение?	Обучающиеся 1 курса, поступившие на базе 9 классов, проходят программу среднего общего образования (10-11 кл.) на [Отделении общеобразовательная подготовки](https://www.ktgs.ru/OtdeleniaKolledzha/departments/general2/) (ст. м. Озерки, пр. Луначарского, д. 66). По окончании освоения программы, обучающиеся переходят на отделение, соответствующее выбранной специальности/профессии.\r\nОбучающиеся, поступившие на базе 11-ти классов, обучаются на соответствующих отделениях с 1 курса.\r\n[Отделение туризма и прикладных технологий](https://www.ktgs.ru/OtdeleniaKolledzha/departments/tour/) (ст. м. Петроградская, наб. реки Карповки, д. 11-а):\r\n- Туризм и гостеприимство (направление «Предоставление туроператорских, турагентских и экскурсионных услуг»)\r\n- Операционная деятельность в логистике\r\n- Информационные системы и программирование\r\n[Отделение гостиничного сервиса](https://www.ktgs.ru/OtdeleniaKolledzha/departments/gostservis/) (ст. м. Удельная, пр. Энгельса, д. 42):\r\n- Туризм и гостеприимство (направление «Предоставление гостиничных услуг»)\r\n[Отделение ресторанного сервиса](https://www.ktgs.ru/OtdeleniaKolledzha/departments/restoranservis/) (ст. м. Нарвская, наб. Обводного кан., д. 154-а):\r\n- Поварское и кондитерское дело/ Повар, кондитер\r\n- Официант, бармен\r\n- Туризм и гостеприимство (направление «Предоставление услуг предприятий питания»)\r\n[Отделение прикладных программ и цифровых технологий](https://www.ktgs.ru/OtdeleniaKolledzha/departments/commerce/) (ст. м. Озерки, пр. Луначарского, д. 66):\r\n- Строительство и эксплуатация зданий и сооружений\r\n- Торговое дело\r\n- Прикладная геодезия\r\n- Картография\r\n- Информационные системы и программирование\r\n- Сетевое и системное администрирование	21
23	1	Если я хочу поступить (перевестись) на второй курс из другого колледжа, что для этого нужно сделать?	[Перевод из другого учебного заведения](https://www.ktgs.ru/inspection/change_pk.php)	22
24	1	На какой курс ВУЗа может поступить выпускник колледжа?	Прием на обучение по программам бакалавриата и программам специалитета лиц, имеющих среднее профессиональное образование, проводится как по результатам ЕГЭ, так и по результатам вступительных испытаний, форма и перечень которых определяются образовательной организацией высшего образования (ст. 70, п. 6 ФЗ «Об образовании»). При зачислении в ВУЗ на направление подготовки бакалавриата соответствующего профиля, срок обучения может быть сокращен за счет перезачета дисциплин, изученных в колледже. Решение об ускоренном обучении обучающегося принимается организацией на основании его личного заявления.	23
25	1	Ваш Колледж сотрудничает с каким-нибудь ВУЗом?	[Сотрудничество с ВУЗами](https://www.ktgs.ru/inspection/university_pk.php)	24
26	1	Как поступить на обучение на коммерческую (платную) основу, если не поступил на бюджет?	Зачисление граждан в Колледж для обучения по договорам с оплатой стоимости обучения осуществляется в рамках предельной численности контингента, установленной лицензией на право ведения образовательной деятельности. Граждане, поступающие на места по договорам с оплатой стоимости обучения, зачисляются в Колледж только после заключения договора и внесения оплаты в соответствии с условиями договора.	25
27	1	Где можно ознакомиться с Уставом, лицензией, аккредитацией и другими локальными актами?	[Общие документы: Устав, лицензия, аккредитация](https://www.ktgs.ru/about/Documenty/docs/obschie-dokumenty.php) и [Общие документы Локальные акты](https://www.ktgs.ru/about/Documenty/docs/lokalnye-akty.php)	26
28	1	Какие предметы я буду изучать?	[Образовательные стандарты и требования](https://www.ktgs.ru/about/ObrazovatelnyeStandarty/); [Учебные планы](https://www.ktgs.ru/study/study_work/uchplan.php)	27
\.


--
-- Data for Name: admission_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admission_info (id, open_door_id, top_text, contacts_link) FROM stdin;
1	1	Уважаемые абитуриенты! Обучение ведется на русском языке по каждой специальностиВступительные испытания при приеме на обучение по профессиям и специальностям колледжа не предусмотрены ОБЩЕЖИТИЯ ПРИ КОЛЛЕДЖЕ НЕТ! Приём заявлений от абитуриентов на очную форму обучения (бюджет) завершён. Продолжается приём заявлений от абитуриентов на заочную форму обучения (прием на заочное обучение)	https://www.ktgs.ru/inspection/rejim_raboti_pk.php
\.


--
-- Data for Name: basic_education; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basic_education (id, education_info) FROM stdin;
1	На базе 9 класса: 3 года и 10 месяцев
2	На базе 9 класса: 2 года и 10 месяцев
3	На базе 9 класса: 1 год и 10 месяцев
4	На базе 11 класса: 2 года и 10 месяцев
5	На базе 11 класса: 1 год и 10 месяцев
\.


--
-- Data for Name: basic_education__filling_in_data_for_specializations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basic_education__filling_in_data_for_specializations (id, specialization_id, basic_education_id) FROM stdin;
154	1	1
155	1	4
156	2	1
157	2	4
158	3	1
159	4	1
160	5	4
161	6	4
162	7	1
163	7	4
164	8	2
165	8	5
166	9	1
167	10	2
168	10	5
169	11	2
170	11	5
171	12	2
172	13	3
173	14	2
174	14	5
\.


--
-- Data for Name: branch_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch_schedule (branch_id, open_door_id) FROM stdin;
1	1
2	1
3	1
4	1
1	2
2	2
3	2
4	2
1	3
2	3
3	3
4	3
1	4
2	4
3	4
4	4
1	5
2	5
3	5
4	5
\.


--
-- Data for Name: college_branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.college_branches (id, branch_name, adress, metro_station) FROM stdin;
1	Отделение туризма и прикладных технологий	Наб. реки Карповки, д. 11	Петроградская
2	Отделение гостиничного сервиса	Пр. Энгельса, д. 42	Удельная
3	Отделение ресторанного сервиса	Наб. Обводного кан., 154-а	Нарвская
4	Отделение общеобразовательной подготовки и Отделение прикладных программ и цифровых технологий	Пр. Луначарского, д. 66, корп. 1	Озерки
\.


--
-- Data for Name: education_loan_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.education_loan_content (id, specialty_id, content) FROM stdin;
1	\N	В нашей стремительно меняющейся экономике среднее профессиональное образование открывает перед молодыми людьми двери в мир высокооплачиваемого и квалифицированного труда. При этом с каждым годом колледжи и техникумы все более востребованы у абитуриентов. Но что делать, если бюджетного места не хватило, а финансовые обстоятельства становятся препятствием на пути к получению желаемого образования? Решением этой проблемы может стать использование образовательного кредита с государственной поддержкой.\r\n\r\nПодробную информацию об условиях программы вы можете изучить в специальном пособии, а также в разделе [«Вопросы и ответы»](https://open.edu.gov.ru/faq/#type=73) на сайте Минпросвещения России.\r\n\r\n**Условия предоставления**\r\nОбразовательный кредит может получить любой гражданин Российской Федерации. При этом, потенциальному заемщику должно быть не меньше 14 лет. Чтобы воспользоваться государственной поддержкой необходимо:\r\n\r\n1. Подписать договор на платное обучение с колледжем;\r\n2. Прийти с паспортом, договором и счетом на оплату в офис банков-партнеров (ПАО Сбербанк или РНКБ Банк);\r\n3. Ознакомиться с условиями кредита и подпиисать договор;\r\n4. Получить подтверждение от учебного заведения. Пошаговая инструкция в [чек-листе](https://vk.com/doc-224704750_675251199).\r\n\r\n**Материалы для студентов и абитуриентов**\r\n* Образовательное кредитование: [пособие для студентов СПО](https://vk.com/doc-224704750_675216781);\r\n* [Чек-лист](https://vk.com/doc-224704750_675251199) о получении кредита на образование по программе СПО с господдержкой.
\.


--
-- Data for Name: education_loan_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.education_loan_media (id, loan_content_id, file_url, "position") FROM stdin;
1	1	https://www.ktgs.ru/upload/medialibrary/7cf/2024-05-20_12-24-23.png	1
2	1	https://www.ktgs.ru/upload/medialibrary/6d5/Informatsionny_plakat_Prichiny_izmenenia_dogovora_po_obrkreditu_page-0001.jpg	2
\.


--
-- Data for Name: filling_in_data_for_specializations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filling_in_data_for_specializations (id, specialty_id, content_type, content) FROM stdin;
1	1	10	Техник
2	1	20	Занимается деятельностью по строительству, эксплуатации и реконструкции жилых, общественных и промышленных объектов
3	1	30	Строительство и жилищно-коммунальное хозяйство
4	1	40	Жилищно-коммунальные хозяйства (ЖКХ), строительные компании города
5	1	50	Геодезические и офисные приборы, чертежно-графические редакторы, автоматизированная программа выпуска сметной документации, ПК 
6	1	60	• участие в проектировании зданий и сооружений\\n • выполнение тех. процессов  на объекте капитального строительства\\n • организация деятельности структурных подразделений при выполнении строительно-монтажных, в том числе отделочных работ, эксплуатации, ремонте и реконструкции зданий и сооружений\\n • организация видов работ при эксплуатации и реконструкции строительных объектов\\n • вспомогательная деятельность по сбору и хранению информации, необходимой для обеспечения строительного производства строительными и вспомогательными материалами и оборудованием\\n • организация работы складского хозяйства
7	1	70	• хорошая координация движений\\n • отличное зрение и слух\\n • крепкие нервы; аккуратность\\n • ответственность\\n • хороший глазомер\\n • физическая выносливость\\n • техническое мышление\\n • ловкость\\n • внимание\\n • память\\n • коммуникативные и организаторские способности
8	1	80	Специалист по технике безопасности, техник-проектировщик, агент по работе с недвижимостью, техник жилищно-коммунального хозяйства, менеджер, геодезист в строительстве, специалист сметного дела, техник по материально-техническому обеспечению, консультант-продавец строительных материалов, мастер, прораб, начальник строительного участка, начальник планово-технического отдела, главный инженер
9	2	10	Программист
10	2	20	Моделирование, разработка, отладка, проверка работоспособности, модификация программного обеспечения
11	2	30	Разработка и аналитика компьютерных систем, автоматизированные системы обработки информации и управления, программное обеспечение компьютерных систем (программы, программные комплексы и системы), математическое, информационное, техническое, эргономическое, организационное и правовое обеспечение компьютерных систем, обработка данных, первичные трудовые коллективы
12	2	40	Работа в отделах информатизации, информационных вычислительных центрах, отделах технического обслуживания вычислительной техники организаций (предприятий) различной отраслевой направленности
13	2	50	Вычислительная техника и сетевое оборудование, средства программирования –Python,Visual Basic, СУБД Access, FoxPro, C++, C#, HTML, JavaScript, MySQL, Java
14	2	60	• разработка модулей программного обеспечения для компьютерных систем\\n • осуществление интеграции программных модулей\\n • сопровождение и обслуживание программного обеспечения компьютерных систем\\n • администрирование и защита баз данных
15	2	70	• высокая эмоциональная устойчивость\\n • высокая концентрация и переключение внимания, усидчивость\\n • быстрая реакция\\n • аккуратность\\n • самостоятельность\\n • исполнительность\\n • целеустремленность, упорство \\n • умение предвидеть результат и умение работать в коллективе 
16	2	80	Специалист по информационным системам, специалист по информационным ресурсам, системный администратор, web-программист, администратор баз данных, консультант программного обеспечения, программист, web-дизайнер, специалист по техническому сопровождению, разработчик баз данных, разработчик приложений, техник по ремонту и обслуживанию ВТ, менеджер проекта, управление проектами, web-мастер, интернет PR -менеджер, верстальщик
17	3	10	Специалист по информационным системам
18	3	20	Разработка и внедрение передовых информационных технологий с целью автоматизации управления предприятием в современных бизнес-условиях; организация инфраструктуры информационных технологий предприятия; использование минимума IT-средств (IT – Information Technologies) для достижения целей автоматизации; формирование культуры корпоративной работы пользователей
37	5	50	Геодезические и офисные приборы, ПК
19	3	30	Разработка и аналитика компьютерных систем; автоматизированные системы обработки информации и управления; программное обеспечение компьютерных систем (программы, программные комплексы и системы); математическое, информационное, техническое, эргономическое, организационное и правовое обеспечение компьютерных систем; обработка данных; первичные трудовые коллективы.
20	3	40	Работа в отделах информатизации, информационных вычислительных центрах, отделах технического обслуживания вычислительной техники организаций (предприятий) различной отраслевой направленности
21	3	50	Вычислительная техника и сетевое оборудование; средства программирования – СУБД Access, FoxPro, C++, C#, HTML, JavaScript, MySQL
22	3	60	• осваивать и применять средства автоматизированного проектирования, разработки, тестирования и сопровождения проектов\\n • проводить тестирование по, оценивать экономическую эффективность и качество проектов\\n • взаимодействовать с заказчиком в процессе выполнения программного проекта\\n • планировать и координировать работы по управлению IT-проектами 
23	3	70	• аналитический ум, системное мышление\\n • коммуникабельность, способность работать с группами людей\\n • умение выстраивать конструктивное взаимодействие it-специалистов и пользователей системы\\n • внимание к деталям\\n • ответственность\\n • дисциплинированность\\n • знание английского языка для чтения технической литературы  
24	3	80	Специалист по информационным системам, специалист по информационным ресурсам, системный администратор, web-программист, администратор баз данных, консультант программного обеспечения, программист, web-дизайнер, специалист по техническому сопровождению, разработчик баз данных, разработчик приложений, техник по ремонту и обслуживанию ВТ, менеджер проекта, управление проектами, web-мастер, интернет pr-менеджер, верстальщик
25	4	10	Сетевой и системный администратор
26	4	20	Сетевой и системный администратор – это специалист, который обеспечивает штатную работу парка компьютерной техники в компании или организации, правильную работу компьютерной сети и имеющегося программного обеспечения, а также отвечает за сетевую безопасность организации
27	4	30	Связь, информационные и коммуникационные технологии
28	4	40	Должность системного администратора присутствует практически во всех компаниях и учреждениях, где используется большое количество компьютерной техники (IT-отделы крупных и средних компаний, банки, учебные центры). Небольшие организации часто пользуются услугами внештатных специалистов
29	4	50	Вычислительная техника и сетевое оборудование
30	4	60	• выполнение работ по проектированию и обслуживанию сетевой инфраструктуры\\n • организация сетевого администрирования\\n • эксплуатация объектов сетевой инфраструктуры 
31	4	70	• высокая концентрация и переключение внимания, усидчивость\\n • аналитический ум, системное мышление, логическое мышление\\n • высокий уровень развития памяти\\n • технические способности\\n • математические способности\\n • развитая моторика пальцев\\n • стрессоустойчивость 
32	4	80	Сетевой и системный администратор, специалист по администрированию, техник
33	5	10	Техник-картограф
34	5	20	Выполнение картографических работ, подбор исходных данных для составления карт, планов и других графических материалов, вычерчивание топографических основ, согласно составительскому оригиналу, подготовленному картографом, а также специальную нагрузку геологических, геофизических, геоморфологических и издание топографических, общегеографических, тематических, специальных карт и атласов компьютерными способами в производстве картографической продукции
35	5	30	Редактирование, составление, подготовка к изданию и издание топографических, общегеографических, тематических, специальных карт и атласов компьютерными способами в производстве картографической продукции
36	5	40	Картографические бюро, НИИ, проектные институты, издательские учреждения, IT-компании, отдел системы точного позиционирования, а также ― конструкторские бюро, где строят техническое оснащение, используемое при проведении космической и аэросъемки
38	5	60	• подготовка геодезической и математической основ для создания топографических и общегеографических карт\\n • определение взаимосвязей между природными и социально-экономическими явлениями, представленными в тематических атласах, для подготовки географической основы карт\\n • создание карт и атласов различного назначения, содержания, территориального охвата, масштабов компьютерными способами\\n • участие в организации и проведении опытно-экспериментальных картографических работ с элементами картографического дизайна
39	5	70	• наблюдательность\\n • методичность\\n • ответственность\\n • скрупулёзность\\n • внимательность\\n • аналитический склад ума\\n • склонность к изучению точных наук\\n • владение информационными технологиями\\n • постоянное совершенствование своих знаний\\n • оперативность в работе 
40	5	80	Техник-картограф, техник-землеустроитель, техник-геодезист, картограф
41	6	10	Специалист по землеустройству
42	6	20	Специалист по землеустройству – это специалист по топографической съёмке, измерениям и межеванию земельных угодий. Он занимается организацией эффективного использования земель и их охраной, ведет контроль за соблюдением земельного законодательства; составляет экспликации, составляет проекты межхозяйственного и внутрихозяйственного землеустройства с экономическим обоснованием, ведет земельно-учетную документацию, проводит мероприятия по землеустройству, обеспечивает безопасное проведение работ
43	6	30	Основные направления развития вопросов землепользования и землеустройства, руководящие материалы в области землепользования, технология проведения землеустроительных работ, устройство геодезических и аэрофотографических инструментов и приборов, способы освоения и улучшения земель, системы противоэрозийных мероприятий, законодательство об охране природы
44	6	40	Комитет имущественных отношений Санкт-Петербурга (КИО) и 16 районных отделов, управление городского кадастра Санкт-Петербурга, управление землеустройства Санкт-Петербурга, государственная жилищная инспекция Санкт-Петербурга, комитет по градостроительству и архитектуре Санкт-Петербурга, комитет по земельным ресурсам и землеустройству Санкт-Петербурга, служба государственного строительного надзора и экспертизы Санкт-Петербурга, министерство земельных и имущественных отношений РФ, коммерческие фирмы (проектировочные, строительные), банки, агентства недвижимости
45	6	50	Геодезические и офисные приборы, ПК
46	6	60	• свободное ориентирование в вопросах права собственности на землю и имущества\\n • занятие оценкой имущества\\n • с помощью геодезических и фотографических инструментов осуществление съемки земельных наделов, установление их границы\\n • составление планов земельных участков\\n • оформление документов для постановки земельных участков на государственный кадастровый учет\\n • проведение межевания объектов землеустройства, инвентаризация земель
47	6	70	• высокое чувство ответственности\\n • коммуникабельность• развитое логическое мышление\\n • самостоятельность\\n • владение информационными технологиями\\n • оперативность в работе
48	6	80	Специалист по технической инвентаризации и кадастровому учету, оценщик, специалист в управляющих ЖКХ, специалист земельных комитетов, риелтор, геодезист (техник), сотрудник инвестиционных строительных компаний, специалист в земельно-кадастровой палате и бюро технической инвентаризации
49	7	10	Техник-геодезист
50	7	20	Основные знания, которые получают студенты, связаны с процессами изменения ландшафта на локальном и глобальном уровнях. Будущие техники-геодезисты учатся выполнять измерения на поверхности земли, составлять топографические карты и планы, создавать земельные, лесные, водные и другие разновидности кадастров, производить определения и обозначения государственных границ. Получают навыки работы с нивелиром, теодолитом, дальномером, компасом, лазерным сканером для сканирования местности. Работают с трехмерным изображением мостов, эстакад, элементов надземных коммуникаций
68	9	40	Предприятиях общественного питания различных типов и форм собственности
69	9	50	Кухонное оборудование, продовольственные товары
51	7	30	получение измерительной пространственной информации о поверхности Земли и ее недрах, отображение поверхности Земли или отдельных ее территорий на планах и картах, организация и осуществление работ по сбору и распространению топографо-геодезических данных на территории как Российской Федерации в целом, так и отдельных ее регионов
52	7	40	Система Роскартографии, Роснедвижимости, организации и подразделения Госземкадастрсъемка (ВИСХАГИ), отделы архитектуры и градостроительства, проектные организации, местные органах исполнительной власти
53	7	50	Беспилотные самолеты, лазерные сканеры, электронные геодезические приборы, ПК.
54	7	60	• выполнение работ по проектированию, созданию и обработке опорных геодезических сетей, нивелирных сетей и сетей специального назначения\\n • выполнение топографических съемок различными методами, графическое и цифровое оформление результатов\\n • организация работы коллектива исполнителей\\n • проведение работ по геодезическому сопровождению строительства и эксплуатации зданий и инженерных сооружений
55	7	70	• хорошие пространственное воображение и зрительная память\\n • логическое мышление\\n • склонность к математическим и техническим наукам\\n • высокая стрессоустойчивость\\n • организованность\\n • ответственность\\n • самостоятельность\\n • готовность работать в полевых условиях\\n • отличная физическая подготовка, крепкое здоровье
56	7	80	Землеустроитель, маркшейдер, инженер городского кадастра, проектировщик, картограф, топограф, фотограмметрист
57	8	10	Операционный логист
58	8	20	Специальность направлена на решение вопросов планирования, организации, выполнения и контроля движения и размещения материальных (товарных, финансовых, кадровых) и нематериальных (информационных) потоков; оптимизации процессов снабжения, производства, транспортировки, складирования, и распределения
59	8	30	Основы логистической деятельности; Информационное обеспечение логистических процессов; Иностранный язык в профессиональной деятельности; Экономика организации; Статистика; Менеджмент; Правовое обеспечение профессиональной деятельности; Финансы, денежное обращение и кредит; Бухгалтерский учет логистических операций; Налоги и налогообложение; Моделирование логистических систем; Планирование и организация логистических процессов в закупках и складировании, в производстве и распределении, в транспортировке и сервисном обслуживании; Планирование и оценка эффективности работы логистических систем, контроль логистических операций
60	8	40	Частные и государственные предприятия, индивидуальных предпринимателей, которые занимаются деятельностью, связанной с логистическими операциями 
61	8	50	Персональный компьютер, комплект лицензионного программного обеспечения в области транспортной логистики и управления складом
62	8	60	• планирование и организация логистических процессов в закупках и складировании\\n • планирование и организация логистических процессов в производстве и распределении\\n • планирование и организация логистических процессов в транспортировке и сервисном обслуживании\\n • планирование и оценка эффективности работы логистических систем, контроль логистических операций
63	8	70	• честность\\n • ответственность\\n • выносливость\\n • пунктуальность\\n • предупредительность\\n • трудолюбие\\n • доброжелательность\\n • креативность\\n • коммуникабельность\\n • творческий подход к делу\\n • гибкость\\n • дисциплинированность
64	8	80	Менеджер (управляющий) по логистике, логист, менеджер-логист, аналитик-статист; руководитель структурных подразделений, супервайзер (координатор), аналитик, топ-менеджер: вице-президент или директор по логистике, начальник отдела логистики, интегральный логистический менеджер
65	9	10	Специалист по поварскому и кондитерскому делу
66	9	20	Организатор процесса приготовления блюд, кондитерских изделий сложного ассортимента и квалифицированный повар. Входит в ТОП-50 наиболее востребованных на рынке труда, новых и перспективных профессий, которые требуют среднего профессионального образования (приказ Минтруда России №831 от 2.11.2015 г.)
67	9	30	Химия, технология, микробиология, контроль качества
70	9	60	• получение исходных продуктов\\n • организация и ведение процессов приготовления и подготовки к реализации (полуфабрикатов для блюд, кулинарных изделий сложного ассортимента; горячих блюд, кулинарных изделий, закусок сложного ассортимента; холодных блюд, кулинарных изделий, закусок сложного ассортимента; холодных и горячих десертов, напитков сложного ассортимента; хлебобулочных, мучных кондитерских изделий сложного ассортимента с учетом потребностей различных категорий потребителей, видов и форм обслуживания)\\n • обеспечение процесса приготовления блюд - подготовка необходимого оборудования, заготовка полуфабрикатов\\n • правильная эксплуатация технологического оборудования\\n • обеспечение должного учета и хранения продуктов в соответствии с санитарно–гигиеническими нормами\\n • организация и контроль текущей, деятельности подчиненного персонала
71	9	70	• зрительная, обонятельная и вкусовая чувствительность\\n • хорошо развитое внимание (такие его параметры как объем, распределение и переключение)\\n • склонность к анализу и прогнозу\\n • наглядно-действенное мышление, образная память\\n • творческие способности\\n • эстетический вкус\\n • аккуратность\\n • требовательность\\n • коммуникабельность
72	9	80	Су-шеф, шеф-повар, технолог, повар, кондитер
73	10	10	Специалист по туризму и гостеприимству
74	10	20	Оказание услуг в сфере туризма, в том числе турагентских, туроператорских, экскурсионных, в качестве специалиста по туризму
75	10	30	Сервис, оказание услуг населению. Туристское регионоведение, Технология предоставления туроператорских и турагентских услуг , Организация экскурсионных услуг, Предоставление анимационных услуг и услуг по сопровождению туристов, Экономика предприятий туризма и гостиничного дела, История, Правовое и документационное обеспечение в туризме и гостеприимстве, Информационные технологии в профессиональной деятельности, Предпринимательская деятельность в сфере туризма и гостиничного бизнеса, Психология делового общения и конфликтология, Маркетинговые технологии в туризме, Сервисная деятельность, Иностранные языки: английский язык (в сфере профессиональной коммуникации), немецкий язык (базовый уровень)
76	10	40	Частные и государственные предприятия, индивидуальных предпринимателей, которые занимаются туристской деятельностью
77	10	50	Компьютер, автоматизированные системы управления (АСУ)
78	10	60	• предоставление туроператорских, турагентских, экскурсионных услуг\\n • взаимодействие с потребителями, туроператорами, администраторами и персоналом гостиниц\\n • изучение потребности клиентов, информирование их о продуктах, услугах, выгодных предложениях\\n • формирование групп туристов и гостей, информирование их о правилах безопасности (во время путешествия) и поведения (в гостиничном комплексе)\\n • организация собственной деятельности, координация сотрудников служб и предприятий в сфере туризма и гостеприимства\\n • работа с документами на государственном и английском языках, ведение переговоров, решение конфликтных ситуаций и проблем клиентов, соблюдение этики делового общения\\n • составление программы отдыха, организация и проведение экскурсии в соответствии с видами туризма\\n • применение знаний нормативных правовых актов в сфере туризма и экскурсионного дела, защиты прав потребителя
79	10	70	• самостоятельность\\n • ответственность\\n • стремление к новым знаниям\\n • любовь к своему городу стране и людям\\n • выносливость\\n • пунктуальность\\n • трудолюбие\\n • доброжелательность\\n • креативность\\n • коммуникабельность 
80	10	80	Специалист по продажам турпродукта, специалист по формированию турпродукта, специалист по бронированию, специалист по организации экскурсионных и туристских услуг, специалист по сопровождению туристских групп в туристских фирмах, менеджер по туризмуп
81	11	10	Специалист по туризму и гостеприимству
82	11	20	Сервис, оказание услуг населению (торговля, техническое обслуживание, ремонт, предоставление персональных услуг, услуги гостеприимства, общественное питание и прочее)
83	11	30	Сервис, оказание услуг населению. Гостиничный бизнес, рыночная экономика, маркетинг, иностранные языки: английский язык (в сфере профессиональной коммуникации), немецкий язык (базовый уровень)
84	11	40	Сервис, оказание услуг населению. Гостиничный бизнес, рыночная экономика, маркетинг, иностранные языки: английский язык (в сфере профессиональной коммуникации), немецкий язык (базовый уровень)
85	11	50	Автоматизированная система управления (в том числе на английском языке) для отелей («Эдельвейс», «Opera»; ККМ «Эватор 10»); техническое оборудование; правовые, нормативные и учетные документы; уборочный инвентарь
86	11	60	• организовывать и осуществлять бронирование и продажу гостиничных услуг\\n • организовывать и осуществлять прием и размещение гостей\\n • организовывать и осуществлять эксплуатацию номерного фонда гостиничного предприятия\\n • организовывать и осуществлять деятельность службы питания\\n • выполнять санитарно-эпидемиологические требования к предоставлению гостиничных услуг  
87	11	70	• честность\\n • ответственность\\n • пунктуальность\\n • предупредительность\\n • коммуникабельность\\n • трудолюбие\\n • доброжелательность\\n • стрессоустойчивость\\n • гостеприимство\\n • выносливость\\n • творческий подход к делу 
88	11	80	Работа в крупных отелях:\\n • служба бронирования: руководитель, бронист\\n • служба приема и размещения: руководитель, консьерж, портье, guest relation (менеджер по работе с гостями)\\n • служба room service: официант\\n • отдел продаж: координатор\\n • служба обслуживания и эксплуатации номерного фонда: руководитель горничная, супервайзер 
89	12	10	Специалист по туризму и гостеприимству
90	12	20	Сервис, оказание услуг населению (услуги гостеприимства, услуги организации выпуска продукции и обслуживания в предприятиях питания)
91	12	30	Сервис, оказание услуг населению.Гостиничный бизнес, рыночная экономика, снабжение и учет, два иностранных языка, работа с современной оргтехникой и ПО
92	12	40	Сфера услуг гостеприимства (кафе, рестораны, бары, рестораны и т.д.)
93	12	50	Торгово-технологическое и холодильное оборудование, посуда, приборы, инвентарь и другие предметы материально-технического оснащения организаций общественного питания; продукты питания; нормативная учетно-отчетная документация; фронт-офис, оргтехника автоматизированная система управления для отелей и ресторанов (1С: Ресторан)
94	12	60	• организация, управление и контроль текущей деятельности служб предприятий туризма и гостеприимства\\n • предоставление услуг предприятия питания\\n • осуществлять расчет с потребителями за предоставленные услуги\\n • организовывать выпуск продукции в предприятиях общественного питания\\n • организовывать деятельность и осуществлять обслуживание в организациях питания в соответствии с санитарными нормами и правилами\\n • контролировать качество продукции и услуг общественного питания
95	12	70	• организаторские способности\\n • самостоятельность\\n • ответственность\\n • трудолюбие\\n • аккуратность\\n • честность\\n • пунктуальность, предупредительность\\n • доброжелательность, коммуникабельность, гостеприимство\\n • стрессоустойчивость, выносливость\\n • креативность мышления, творческий подход к делу
96	12	80	Руководитель специализированных подразделений в крупных ресторанах и отелях; начальник отдела; официант; бармен; администратор зала; сомелье; метрдотель ресторанной службы, координатор отдела продаж
97	13	10	Официант, бармен, буфетчик
98	13	20	Официанты, бармены занимаются обслуживанием населения в организациях общественного питания. В процессе обучения студенты знакомятся с правилами и способами расстановки мебели в торговом зале, сервировки столов, подготовки столового белья, посуды и приборов к работе, изучают основы физиологии питания, санитарии и гигиены. Учащиеся получают навыки приема, оформления заказа на продукцию организаций общественного питания, подачи заказанных блюд и напитков к столу, подготовки залов к обслуживанию банкетных мероприятий. Студенты учатся готовить и подавать горячие напитки, коктейли, простые закуски, давать пояснения потребителям по продукции бара, буфета. Будущие специалисты должны знать правила культуры обслуживания, этикета при взаимодействии с гостями баров, буфетов и ресторанов
99	13	30	Реализация процесса обслуживания в организациях общественного питания
100	13	40	Сфера услуг гостеприимства (кафе, бары, рестораны, в том числе при отелях, домах отдыха, санаториях, развлекательных комплексах, клубах, на транспорте (судно, поезд) и прочих предприятиях питания и кейтеринговых компаниях, работники которых осуществляют обслуживание различных категорий гостей
101	13	50	Торгово-технологическое и холодильное оборудование, посуда, приборы, инвентарь и другие предметы материально-технического оснащения организаций общественного питания; нормативная учетно-отчетная документация; кулинарная и кондитерская продукция, покупные товары и винно-водочные изделия
102	13	60	• выполнять подготовку залов к обслуживанию в соответствии с его характером, типом и классом организации общественного питания\\n • обслуживать потребителей организаций общественного питания всех форм собственности, различных видов, типов и классов\\n • обслуживать массовые банкетные мероприятия\\n • обслуживать потребителей при использовании специальных форм организации питания\\n • выполнять подготовку бара, буфета к обслуживанию\\n • обслуживать потребителей бара, буфета\\n • эксплуатировать инвентарь, весоизмерительное и торгово-технологическое оборудование в процессе обслуживания\\n • вести учетно-отчетную документацию в соответствии с нормативными требованиями\\n • изготавливать определенный ассортимент кулинарной продукции\\n • производить расчет с потребителем, используя различные формы расчета\\n • изготавливать смешанные напитки, в том числе коктейли, различными методами, горячие напитки 
103	13	70	• доброжелательность\\n • аккуратность\\n • уверенность в себе\\n • ответственность\\n • дисциплинированность\\n • хорошо развитые коммуникативные качества\\n • энергичность, инициативность, развитая интуиция
104	13	80	Официант, бармен, буфетчик
105	14	10	Повар, кондитер
106	14	20	Изучение состава пищи, ее калорийности, хранении продуктов, о физиологии питания, правилах составления меню, технологии приготовления пищи.
107	14	30	Приготовление широкого ассортимента простых и основных блюд и основных хлебобулочных и кондитерских мучных изделий с учетом потребностей различных категорий потребителей
108	14	40	Предприятиях общественного питания различных типов и форм собственности
109	14	50	Кухонное оборудование, продовольственные товары
110	14	60	• приготовление и подготовка к реализации полуфабрикатов для блюд, кулинарных изделий разнообразного ассортимента\\n • приготовление, оформление и подготовка к реализации горячих блюд, кулинарных изделий, холодных блюд, закусок разнообразного ассортимента, холодных и горячих сладких блюд, десертов, напитков, хлебобулочных, мучных кондитерских изделий\\n • подготавливать рабочее место, оборудование, сырье, исходные материалы для приготовления холодных и горячих сладких блюд, десертов, напитков разнообразного ассортимента в соответствии с инструкциями и регламентами 
111	14	70	• исполнительность\\n • организованность\\n • аккуратность\\n • креативность мышления
112	14	80	Повар, кондитер
113	1	80	asdasd
116	15	10	123
117	15	20	
\.


--
-- Data for Name: information_stat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.information_stat (id, specialty_id, title, content) FROM stdin;
1	1	Прием иностранных граждан	Приём иностранных граждан в Колледж туризма и прикладных технологий Санкт-Петербурга осуществляется на основании действующих \r\nПравил приёма в Колледж туризма и прикладных технологий Санкт-Петербурга и Федерального закона от 24 мая 1999 № 99-ФЗ «О государственной политике Российской Федерации в отношении соотечественников за рубежом».\r\n\r\nДокументы, необходимые для иностранных граждан\r\n\r\n1. Документ об образовании (аттестат за 9 или 11 класс, диплом об окончании техникума (училища, колледжа), вуза)\r\n2. Нотариально заверенная ксерокопия документа об образовании при необходимости со свидетельством его эквивалентности и с переводом на русский язык.\r\n3. Ксерокопия паспорта (все страницы)\r\n4. Ксерокопия нотариально заверенного перевода паспорта (все страницы).\r\n5. Копия документа, подтверждающую регистрацию иностранного гражданина на территории Санкт-Петербурга или Ленинградской области.\r\n6. Цветные фотографии (3*4 см) 4 шт. без уголка\r\n7. Ксерокопия СНИЛС\r\n8. Медицинские документы (предоставляются при зачислении до 25.08.2025):\r\n\t• справка ф-086-у за текущий год (включая отметку стоматолога, окулиста и лор-врача, а также клинические анализы крови и мочи)\r\n\t• ксерокопия сертификата о прививках\r\n\t• справка от нарколога; справки из туберкулезного, психоневрологического и кожно-венерологического диспансеров\r\n\t• ксерокопия медицинского страхового полиса (с двух сторон)\r\n\t• данные о ФЛГ (флюорографии) обследовании за текущий год\r\n\t• результат лабораторного исследования материала на COVID-19 методом полимеразной цепной реакции (ПЦР), отобранного не позднее 72 часов\r\n9. Документы подтверждающих прохождение медицинского освидетельствования, обязательной государственной дактилоскопической регистрации и фотографирования.
2	1	Сотрудничество с ВУЗами	В нашем Колледже с 1994 года успешно реализуется программа непрерывного образования по системе: Колледж – ВУЗ. Абитуриенты с соответствующим набором ЕГЭ, прошедшие по конкурсу аттестатов учатся в Колледже бесплатно и могут поступить на параллельное обучение по профильной специальности (заочно) в Санкт-Петербургский институт гостеприимства (СПИГ). Направление обучения в ВУЗе зависит от набора соответствующих предметов ЕГЭ.\r\n\r\nПо окончании обучения в Колледже остаток срока обучения в ВУЗе составляет 2-3 года с сохранением скидок по оплате за обучение. Преимущества параллельного обучения – за 5 лет место работы и два образования.
\.


--
-- Data for Name: open_door_time; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.open_door_time (id, even_date, event_time) FROM stdin;
1	2026-01-31	13:00:00
2	2026-02-28	13:00:00
4	2026-04-25	13:00:00
5	2026-05-30	13:00:00
6	2025-04-25	13:00:00
7	2026-04-26	13:00:00
3	2026-03-28	13:45:00
8	2026-06-07	13:00:00
9	2026-06-06	13:00:00
\.


--
-- Data for Name: specialties_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialties_list (id, cod, title) FROM stdin;
1	08.02.01	Строительство и эксплуатация зданий и сооружений
2	09.02.07	Информационные системы и программирование (Программист)
3	09.02.07	Информационные системы и программирование (Специалист по информационным системам)
4	09.02.06	Сетевое и системное администрирвоание
5	05.02.01	Картография
6	21.02.19	Землеустройство
7	21.02.20	Прикладная геодезия
8	38.02.03	Операционная деятельность в логистике
9	43.02.15	Поварское и кондитеское дело
10	43.02.16	Туризм и гостеприимство (направление «Предоставление туроператорских, турагентских и экскурсионных услуг»)
11	43.02.16	Туризм и гостеприимство (направление «Предоставление гостиничных услуг»)
12	43.02.16	Туризм и гостеприимство (направление «Предоставление услуг предприятий питания»)
13	43.01.01	Официант, бармен
14	43.01.09	Повар, кондитер
15	123	Тестовая
\.


--
-- Data for Name: target_education_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_education_media (id, admission_id, file_path, display_order) FROM stdin;
1	1	https://www.ktgs.ru/upload/2025/img/2025/05-2025/celevoe-obuchenie/1.png	1
2	1	https://www.ktgs.ru/upload/2025/img/2025/05-2025/celevoe-obuchenie/2.jpg	2
3	1	https://www.ktgs.ru/upload/2025/img/2025/05-2025/celevoe-obuchenie/3.jpg	3
4	1	https://www.ktgs.ru/upload/2025/img/2025/05-2025/celevoe-obuchenie/4.jpg	4
\.


--
-- Data for Name: transfer_page_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfer_page_content (id, specialty_id, top_content, middle_text, bottom_content) FROM stdin;
2	\N	По состоянию на 01.05.2026 вакантных мест для перевода на второй и последующие курсы в 2025/2026 учебном году НЕТ.\r\n\r\nКонкурс для перевода на второй и последующие курсы в 2026/2027 учебном году откроется с 10 августа 2026 года.\r\n\r\nКонтактные данные для уточнения информации по переводу из других образовательных учреждений: 8 (812) 252-05-61 (Учебная часть)\r\n\r\nОбучающийся вправе перевестись из организации, осуществляющей образовательную деятельность, в Колледж, а также из Колледжа в иную организацию, осуществляющую образовательную деятельность.\r\n\r\n• Перевод обучающегося может осуществляться на те же специальности, уровень СПО и форму обучения, по которым обучается в Колледже или организации, осуществляющей образовательную деятельность.\r\n\r\nПри переводе обучающегося в Колледж на места, финансируемые за счет средств бюджета СПб, для освоения ОПОП СПО, общая продолжительность обучения не должна превышать более 1 года.\r\n\r\n• Перевод обучающихся осуществляется на ([вакантные места для приема (перевода) обучающихся](http://ktgs.ru/about/VakantnyeMesta/)) на соответствующем курсе по специальности, уровню среднего профессионального образования (базовый, повышенный) и форме обучения, на которые обучающийся хочет перейти.\r\n\r\nПеревод обучающегося осуществляется в соответствии с итогами прохождения аттестации. Процедура перевода проводится путем рассмотрения копии зачетной книжки и/или академической справки и собеседования.\r\n\r\n• Заведующий отделением определяет разницу в учебных планах;\r\n• Допустимая разница в часах может составлять не более 10% учебного времени.	Абитуриент, претендующий на перевод на обучение в Колледж с копией зачетной книжки и/или академической справкой должен обратиться к руководителю отделения, на которое он переводится или в учебную часть Колледжа	Учебная часть Колледжа расположена по адресу: СПб, Наб. Обводного канала, д. 154-а, 3 этаж; телефон: 252-0561; E-mail: ubtk@mail.ru\r\n\r\nПосле установления разницы в учебных планах, абитуриент должен представить на Комиссии следующие документы:\r\n\r\n• копию зачетной книжки, заверенную исходной образовательной организацией;\r\n• академическую справку, заверенную исходной образовательной организацией;\r\n• копии аккредитации и лицензии, заверенные исходной образовательной организацией;\r\n• другие документы могут быть представлены абитуриентом, если он претендует на льготы, установленные законодательством Российской Федерации, или затребованы от поступающего при наличии ограничений на обучение по специальностям среднего профессионального образования, установленных законодательством Российской Федерации.
\.


--
-- Data for Name: type_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_content (id, content_type) FROM stdin;
10	Квалификация
20	Краткое описание специальности
30	Область профессиональной деятельности
40	Где работает
50	Средства труда
60	Основные виды деятельности
70	Какими качествами должен обладать
80	Должности в организациях
\.


--
-- Name: admission_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admission_faq_id_seq', 28, true);


--
-- Name: admission_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admission_info_id_seq', 1, true);


--
-- Name: basic_education__filling_in_data_for_specializations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basic_education__filling_in_data_for_specializations_id_seq', 174, true);


--
-- Name: basic_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basic_education_id_seq', 1, false);


--
-- Name: college_branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.college_branches_id_seq', 6, true);


--
-- Name: education_loan_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_loan_content_id_seq', 1, true);


--
-- Name: education_loan_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_loan_media_id_seq', 2, true);


--
-- Name: filling_in_data_for_specializations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filling_in_data_for_specializations_id_seq', 117, true);


--
-- Name: information_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.information_stat_id_seq', 2, true);


--
-- Name: open_door_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.open_door_time_id_seq', 9, true);


--
-- Name: specialties_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specialties_list_id_seq', 3, true);


--
-- Name: target_education_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_education_media_id_seq', 4, true);


--
-- Name: transfer_page_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transfer_page_content_id_seq', 5, true);


--
-- Name: type_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_content_id_seq', 1, false);


--
-- Name: admission_faq admission_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admission_faq
    ADD CONSTRAINT admission_faq_pkey PRIMARY KEY (id);


--
-- Name: admission_info admission_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admission_info
    ADD CONSTRAINT admission_info_pkey PRIMARY KEY (id);


--
-- Name: basic_education__filling_in_data_for_specializations basic_education__filling_in_data_for_specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_education__filling_in_data_for_specializations
    ADD CONSTRAINT basic_education__filling_in_data_for_specializations_pkey PRIMARY KEY (id);


--
-- Name: basic_education basic_education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_education
    ADD CONSTRAINT basic_education_pkey PRIMARY KEY (id);


--
-- Name: branch_schedule branch_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_schedule
    ADD CONSTRAINT branch_schedule_pkey PRIMARY KEY (branch_id, open_door_id);


--
-- Name: college_branches college_branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college_branches
    ADD CONSTRAINT college_branches_pkey PRIMARY KEY (id);


--
-- Name: education_loan_content education_loan_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_loan_content
    ADD CONSTRAINT education_loan_content_pkey PRIMARY KEY (id);


--
-- Name: education_loan_media education_loan_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_loan_media
    ADD CONSTRAINT education_loan_media_pkey PRIMARY KEY (id);


--
-- Name: filling_in_data_for_specializations filling_in_data_for_specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filling_in_data_for_specializations
    ADD CONSTRAINT filling_in_data_for_specializations_pkey PRIMARY KEY (id);


--
-- Name: information_stat information_stat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_stat
    ADD CONSTRAINT information_stat_pkey PRIMARY KEY (id);


--
-- Name: open_door_time open_door_time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_door_time
    ADD CONSTRAINT open_door_time_pkey PRIMARY KEY (id);


--
-- Name: specialties_list specialties_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties_list
    ADD CONSTRAINT specialties_list_pkey PRIMARY KEY (id);


--
-- Name: target_education_media target_education_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_education_media
    ADD CONSTRAINT target_education_media_pkey PRIMARY KEY (id);


--
-- Name: transfer_page_content transfer_page_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_page_content
    ADD CONSTRAINT transfer_page_content_pkey PRIMARY KEY (id);


--
-- Name: type_content type_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_content
    ADD CONSTRAINT type_content_pkey PRIMARY KEY (id);


--
-- Name: admission_faq admission_faq_admission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admission_faq
    ADD CONSTRAINT admission_faq_admission_id_fkey FOREIGN KEY (admission_id) REFERENCES public.admission_info(id) ON DELETE CASCADE;


--
-- Name: admission_info admission_info_open_door_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admission_info
    ADD CONSTRAINT admission_info_open_door_id_fkey FOREIGN KEY (open_door_id) REFERENCES public.open_door_time(id);


--
-- Name: basic_education__filling_in_data_for_specializations basic_education__filling_in_data_for_sp_basic_education_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_education__filling_in_data_for_specializations
    ADD CONSTRAINT basic_education__filling_in_data_for_sp_basic_education_id_fkey FOREIGN KEY (basic_education_id) REFERENCES public.basic_education(id);


--
-- Name: basic_education__filling_in_data_for_specializations basic_education__filling_in_data_for_spec_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_education__filling_in_data_for_specializations
    ADD CONSTRAINT basic_education__filling_in_data_for_spec_id_fkey FOREIGN KEY (specialization_id) REFERENCES public.specialties_list(id);


--
-- Name: branch_schedule branch_schedule_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_schedule
    ADD CONSTRAINT branch_schedule_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.college_branches(id) ON DELETE CASCADE;


--
-- Name: branch_schedule branch_schedule_open_door_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_schedule
    ADD CONSTRAINT branch_schedule_open_door_id_fkey FOREIGN KEY (open_door_id) REFERENCES public.open_door_time(id) ON DELETE CASCADE;


--
-- Name: education_loan_content education_loan_content_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_loan_content
    ADD CONSTRAINT education_loan_content_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES public.specialties_list(id);


--
-- Name: education_loan_media education_loan_media_loan_content_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_loan_media
    ADD CONSTRAINT education_loan_media_loan_content_id_fkey FOREIGN KEY (loan_content_id) REFERENCES public.education_loan_content(id) ON DELETE CASCADE;


--
-- Name: filling_in_data_for_specializations filling_in_data_for_specializations_content_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filling_in_data_for_specializations
    ADD CONSTRAINT filling_in_data_for_specializations_content_type_fkey FOREIGN KEY (content_type) REFERENCES public.type_content(id);


--
-- Name: filling_in_data_for_specializations filling_in_data_for_specializations_spec_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filling_in_data_for_specializations
    ADD CONSTRAINT filling_in_data_for_specializations_spec_id_fkey FOREIGN KEY (specialty_id) REFERENCES public.specialties_list(id);


--
-- Name: information_stat information_stat_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_stat
    ADD CONSTRAINT information_stat_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES public.admission_info(id);


--
-- Name: target_education_media target_education_media_admission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_education_media
    ADD CONSTRAINT target_education_media_admission_id_fkey FOREIGN KEY (admission_id) REFERENCES public.admission_info(id);


--
-- Name: transfer_page_content transfer_page_content_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_page_content
    ADD CONSTRAINT transfer_page_content_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES public.specialties_list(id);


--
-- PostgreSQL database dump complete
--

\unrestrict VsSaoF1lshMliVDAnzykuEON1r1usW7SKbsT8G3RhgXHLJathTR9ASjHAEXWcgV

