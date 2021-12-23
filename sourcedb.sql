--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: course_t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_t (
    ccourseid character varying(15) NOT NULL,
    ccoursename character varying(200),
    nnumofcred integer,
    cdepartmentid character varying(50)
);


ALTER TABLE public.course_t OWNER TO postgres;

--
-- Name: department_t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_t (
    cdepartmentid character varying(50) NOT NULL,
    cdepartmentname character varying(70),
    cschoolid character varying(10)
);


ALTER TABLE public.department_t OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: faculty_t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty_t (
    cfacultyid character varying(200) NOT NULL,
    cdepartmentid character varying(50)
);


ALTER TABLE public.faculty_t OWNER TO postgres;

--
-- Name: room_t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_t (
    croomid character varying(50) NOT NULL,
    nroomcapacity integer
);


ALTER TABLE public.room_t OWNER TO postgres;

--
-- Name: school_t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.school_t (
    cschoolid character varying(10) NOT NULL,
    cschoolname character varying(70)
);


ALTER TABLE public.school_t OWNER TO postgres;

--
-- Name: section_t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.section_t (
    usectionid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    tstarttime time without time zone,
    cdays character varying(2),
    cblocked character varying(5),
    nstudentenrolled integer,
    csectionnum integer,
    csemesterid character varying(10),
    ccourseid character varying(15),
    cfacultyid character varying(100),
    croomid character varying(50)
);


ALTER TABLE public.section_t OWNER TO postgres;

--
-- Name: semester_t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semester_t (
    csemesterid character varying(20) NOT NULL,
    csemestername character varying(8),
    cyearid character varying(4),
    nsemesternum integer
);


ALTER TABLE public.semester_t OWNER TO postgres;

--
-- Name: year_t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.year_t (
    cyearid character varying(4) NOT NULL
);


ALTER TABLE public.year_t OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add class size_1	1	add_classsize_1
2	Can change class size_1	1	change_classsize_1
3	Can delete class size_1	1	delete_classsize_1
4	Can view class size_1	1	view_classsize_1
5	Can add revenue	2	add_revenue
6	Can change revenue	2	change_revenue
7	Can delete revenue	2	delete_revenue
8	Can view revenue	2	view_revenue
9	Can add dummy	3	add_dummy
10	Can change dummy	3	change_dummy
11	Can delete dummy	3	delete_dummy
12	Can view dummy	3	view_dummy
13	Can add log entry	4	add_logentry
14	Can change log entry	4	change_logentry
15	Can delete log entry	4	delete_logentry
16	Can view log entry	4	view_logentry
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add example	10	add_example
38	Can change example	10	change_example
39	Can delete example	10	delete_example
40	Can view example	10	view_example
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$G8lcngqTM07tmXOcwEAtRq$vKRdyIuYXk/wIDlLvP3c8foGliQ4LBlcyZ2IoFtgc9o=	\N	f	something				f	t	2021-11-09 12:13:16.600527+06
3	pbkdf2_sha256$260000$JTsxjRJQFROaivNZZ7224Q$8S1wDYna4wo4AVLPQy3F3yBPECQqtaFqeFxHQ0rIrng=	\N	f	testa			testa@example.com	f	t	2021-11-09 13:00:04.518483+06
1	pbkdf2_sha256$260000$7AY8YnhcJjyEjmNEdHYcPk$MYVbtviZ2UVqmBQuvDgd5aM/YcX5CB/0X2MFNP1XdCw=	2021-12-16 12:55:40.273381+06	t	test				t	t	2021-11-02 02:05:56.72655+06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: course_t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_t (ccourseid, ccoursename, nnumofcred, cdepartmentid) FROM stdin;
AAT101	Art and Aesthetics	3	SLASS
ACN201	Principles of Accounting	3	SBE
ACN202	Management of Accounting	3	SBE
ACN301	Intermediate Accounting	3	SBE
ACN305	Financial Accounting	3	SBE
ACN402	Income Tax Accounting	3	SBE
ACN403	Auditing	3	SBE
ACN405	Cost Accounting 1	3	SBE
ACN441	Accounting Information System	3	SBE
ANT101	Introduction to Anthropology	3	SLASS
ANT103	Methodology in Anthropology	3	SLASS
ANT205	Theories in Anthropology I	3	SLASS
ANT206	Business Anthropology	3	SLASS
ANT210	Anthropology of Symbol & Religion	3	SLASS
ANT307	Anthropology of Gender	3	SLASS
ANT403	Applied Anthropology	3	SLASS
BBA499	Internship/ Senior Project	12	SBE
BIO101	Environmental Biology	3	SELS
BIO101L	Environmental Biology Lab	1	SELS
BIO102	Biology & Society	3	SELS
BIO102T	Biology & Society Tutorial	1	SELS
BLA101	Bangla Literature and Art	3	SLASS
BNG201	Bangla Literature	3	SLASS
BPH101	Bangladesh Political History	3	SLASS
BUS201	Introduction to Business	3	SBE
BUS202	Business Mathematics	3	SBE
BUS315	Business Communication	3	SBE
BUS360	Introduction to Business Law	3	SBE
BUS485	Business Research Methods	3	SBE
CHE101	Concepts in Chemistry	3	SELS
CHE101L	Concepts in Chemistry Lab	1	SELS
CHE102	Chemistry and Society	3	SELS
CHE102T	Chemistry and Society Tutorial	1	SELS
CIS101	Fundamentals of Computer System	3	CSE
CIS210	Introduction to Information Systems	3	CSE
CIS442	Management Inf. System	3	CSE
CIS480	Information Systems Development Project	3	CSE
CMN201	Introduction to Communication	3	SLASS
CMN202	Public Speaking	3	SLASS
CMN203	Mass Communication: Structure and Process	3	SLASS
CMN205	Introduction to Interactive Media	3	SLASS
CMN301	Development Communication	3	SLASS
CMN302	Media, Culture and Society	3	SLASS
CMN303	Graphic Design and Production	3	SLASS
CMN306	Script Writing	3	SLASS
CMN307	Film and Television in Bangladesh	3	SLASS
CMN308	Newspaper Reporting and Editing	3	SLASS
CMN309	Shooting and Lighting	3	SLASS
CMN310	Marketing Communication	3	SLASS
CMN311	Computer and Society	3	SLASS
CMN315	Video communication	3	SLASS
CMN318	TV Reporting	3	SLASS
CMN321	Advertising Business Practice	3	SLASS
CMN322	Creative Advertising	3	SLASS
CMN323	Copywriting	3	SLASS
CMN324	Art Direction	3	SLASS
CMN402	Electronic Journalism	3	SLASS
CMN403	Rural Development and Communication	3	SLASS
CMN404	Documentary Video Production	3	SLASS
CMN407	Methods in Media Research	3	SLASS
CMN411	Media Business Planning	3	SLASS
CMN499A	Internship / Senior Project - I	6	SLASS
CNC501	Computer Networks	3	CSE
CNC505	Wireless Networks	3	CSE
CNC507	Network Planning, Management & Administration	3	CSE
CNC511	Network Operating Systems	3	CSE
CNC606	Satellite Communication Systems	3	CSE
CNC697	Graduate Project	2	CSE
CSC101	Introduction to Computer Science	3	CSE
CSC204	Intro to Comp. Hardware	3	CSE
CSC204L	Labwork for CSC204	1	CSE
CSC205	Programming Concepts	3	CSE
CSC205L	Prog. & Data Structure Lab	1	CSE
CSC212	Micropro. & Ass. Language	3	CSE
CSC212L	Labwork for CSC212	1	CSE
CSC305	Object-Oriented Programming	3	CSE
CSC305L	Labwork for CSC305	1	CSE
CSC413	Design of Operating System	3	CSE
CSC415	Object Oriented Prog.- II	3	CSE
CSC455	Web Applications and Internet	3	CSE
CSC501	Theory of Programming Languages	3	CSE
CSC630	Advanced Topics in Computer Networks	3	CSE
CSC647	Software Engineering Process	3	CSE
CSC698	Student Seminar	1	CSE
CSC699	Thesis Work	8	CSE
DST501	Introduction to Development Studies	3	SLASS
DST503	Executive Skills for Development Professionals	3	SLASS
DST504	Research Methodology	3	SLASS
DST615	Globalization Issues	3	SLASS
ECN200	Introduction to Economics	3	SBE
ECN201	Principles of Microeconomics	3	SBE
ECN202	Principles of Macroeconomics	3	SBE
ECN301	Intermediate Microeconomics	3	SBE
ECN302	Intermediate Macroeconomics	3	SBE
ECN303	Agricultural Economics	3	SBE
ECN308	International Trade Theory	3	SBE
ECN310	Money and Banking	3	SBE
ECN330	Development Economics	3	SBE
ECN350	Environmental Economics	3	SBE
ECN351	Labor Economics	3	SBE
ECN385	Industrial Organization	3	SBE
ECR101	Intro. to Electrical Engg.	3	EEE
ECR101L	Labwork for ECR101	1	EEE
ECR205	Digital Circuits	3	EEE
ECR205L	Labwork based on ECR205	1	EEE
ECR206	Circuits & Systems	3	EEE
ECR206L	Labwork based on ECR206	1	EEE
ECR207	Electronics - I	3	EEE
ECR207L	Labwork based on ECR207	1	EEE
ECR209	Microprocessor & Interf.	3	EEE
ECR209L	Labwork based on ECR209	1	EEE
ECR305	Intro to Digital Signal Processing	3	EEE
ECR305L	Labwork on ECR305	1	EEE
ECR433	Engineering Economics and Finance	3	EEE
EEE303	Electrical Energy	3	EEE
EEE303L	Labwork for EEE303	1	EEE
EEE304	Electromagnetic Theory & Applications	3	EEE
EEE404	Optical Communication	3	EEE
EEE406	Telecomm. Systems II	3	EEE
EEE413	Solid State Electronics	3	EEE
EEE413L	Labwork for EEE413	1	EEE
EEE498	Senior Project	6	EEE
EEE499	Internship Program	6	EEE
ENG099	Remedial English	3	SLASS
ENG101	English Listening & Speaking Skills	3	SLASS
ENG102	English Reading Skills	3	SLASS
ENG104	English Writing Skills	3	SLASS
ENG105	Business English	3	SLASS
ENG106	Advanced Academic Skills	3	SLASS
ENG201	Introduction to English Literature	3	SLASS
ENV101	Introduction to Environmental science	3	SELS
ENV102	World Geography	3	SELS
ENV102T	World Geography Tutorial	1	SELS
ENV201	Environmental Chemistry	3	SELS
ENV202	Environmental Biology, Ecology and Conservation	3	SELS
ENV202L	Environmental Biology, Ecology and Conservation Laboratory Practicum	1	SELS
ENV203	Application of Chemistry	3	SELS
ENV206	Basic Concepts in Environmental Pollution	3	SELS
ENV212	Environmental Geography	3	SELS
ENV220	Introduction to Aquatic Science	3	SELS
ENV303	Peoples Participation in Environmental Management	3	SELS
ENV310	Silviculture and Forest Management	3	SELS
ENV316	Environmental Management System	3	SELS
ENV325	Waste Management	3	SELS
ENV348	Environmental Chemical Analysis	3	SELS
ENV403	Environmental Toxicology	3	SELS
ENV411	Forest Ecology and Management	3	SELS
ENV415	Air Pollution and Climate	3	SELS
ENV498	Senior Research Project	6	SELS
ENV601	Wastewater Management	3	SELS
ENV607	Solar Energy and its Application	3	SELS
ENV610	Global Climate Change and Application	3	SELS
ENV620	Air Quality Management	3	SELS
ENV630	Student's Sceminar	1	SELS
ENV640	Thesis	8	SELS
ETE304	Telecomm. Networks II	3	EEE
ETE309	High Frequency Electromagnetic Waves	3	EEE
ETE403	Network Management	3	EEE
ETE406L	Labwork for ETE406	1	EEE
ETE499A	Unknown	6	EEE
ETE500	Modern Electronics & Telecomm. Systems	3	EEE
ETE501	Digital Communication Systems	3	EEE
ETE509	Telecommunication Switching & Networks	3	EEE
ETE610	Wireless Networking	3	EEE
ETE620	Switching System Design	3	EEE
ETE626	Advanced Computer Networks	3	EEE
ETE628	Satellite Communications Systems	3	EEE
ETE658	Embedded System Design & Real Time Interfacing	3	EEE
FIN201	Introduction to Finance	3	SBE
FIN301	Business Finance I	3	SBE
FIN302	Business Finance II	3	SBE
FIN401	Banking and Finance	3	SBE
FIN440	Risk and Insurance Management	3	SBE
FIN460	Investment Management	3	SBE
FIN461	Financial Derivatives	3	SBE
FIN480	International Financial Management	3	SBE
FIN545	Options, Future & Other Derivatives	3	SBE
FIN547	Corporate Governance	3	SBE
FRN101	Elementary French I	3	SLASS
HEA101	Health and Society	3	SLASS
HRM301	Introduction to Human Resource Management	3	SBE
HRM360	Manpower Planning and Forecasting	3	SBE
HRM370	Labor Economics and Compensation Theory	3	SBE
HRM380	Industrial Law and Relations	3	SBE
HRM390	Strategic Human Resource Management	3	SBE
HRM410	Contemporary Human Resource Practices in Bangladesh	3	SBE
HRM460	International Human Resource Management	3	SBE
HRM543	Labor Relations & Collective Bargaining in a Global Economy	3	SBE
HRM545	Personnel Training & Development	3	SBE
HST103	History & Civilization	3	SLASS
LFE201A	Live-in-Field Experience (Inter-Term Course)	4	SLASS
MAT101	Intermediate University Mathematics II	3	PhySci
MAT101T	Intermediate University Mathematics II Tutorial	0	PhySci
MAT102	Introduction to Linear Algebra & Calculus	3	PhySci
MAT102T	Introduction to Linear Algebra & Calculus Tutorial	0	PhySci
MAT103	Math. Foundation of CSC	3	PhySci
MAT201	Calculus-I	3	PhySci
MAT211	Probability & Statistics	3	PhySci
MAT212	Probability & Statistics for Science & Engineering	3	PhySci
MAT212T	Probability & Statistics for Science & Engineering Tutorial	0	PhySci
MAT251	Calculus-II	3	PhySci
MAT303	Linear Algebra & Diff. Equ.	3	PhySci
MAT305	Boundary Value Problems	3	PhySci
MAT410	Numerical Methods	3	PhySci
MAT501	Advanced Engineering Mathematics	3	PhySci
MBA501	Principles of Management and Organizational Behavior	3	SBE
MBA505	Managerial Economics	3	SBE
MBA506	Marketing Management	3	SBE
MBA507	Business Communications	3	SBE
MBA508	Management Information Systems	3	SBE
MBA509	Human Resources Management	3	SBE
MBA510	Macro Economics	3	SBE
MBA510E	Business Economics	3	SBE
MBA511	Financial Management	3	SBE
MBA512	Operations Management	3	SBE
MBA513	Management Accounting	3	SBE
MBA514	International Business	3	SBE
MBA515	Legal & Ethical Issues in Business	3	SBE
MBA550	Strategic Management	3	SBE
MGT201	Principles of Management	3	SBE
MGT301	Organizational Behavior	3	SBE
MGT330	Introduction to Product and Operation Management	3	SBE
MGT340	Introduction to Management Science	3	SBE
MGT380	Intercultural Aspects of Business	3	SBE
MGT390	Bank Management	3	SBE
MGT401	Corporate Social Responsibility	3	SBE
MGT405	Entrepreneurship & Small Business Management	3	SBE
MIS341	Computers in Business	3	SBE
MIS405	MIS and System Analysis	3	SBE
MIS442	Management Information System	3	SBE
MKT201	Principles of Marketing	3	SBE
MKT302	Advanced Marketing Management	3	SBE
MKT340	Advertising	3	SBE
MKT350	Service Marketing	3	SBE
MKT360	Marketing Research	3	SBE
MKT401	International Marketing	3	SBE
MKT450	Product and Pricing Policies	3	SBE
MKT481	Consumer Behavior	3	SBE
MKT544	Strategic Marketing	3	SBE
NCH101	National Culture & Heritage I	3	SLASS
PHY101	University Physics-I	3	PhySci
PHY101L	University Physics-I Lab	1	PhySci
PHY102	University Physics-II	3	PhySci
PHY102L	University Physics-II Lab	1	PhySci
PHY201	Perspectives of Mod. Physics	3	PhySci
POP201	Population and Environment	3	SELS
POP305	Population Environment and Development Planning	3	SELS
SEN565	Software Architecture & Component-Based Design	3	CSE
SEN690	Software Engineering Project	6	CSE
SOC101	Introductory Sociology	3	SLASS
SOC202	Social Psychology	3	SLASS
SOC204	Femininity, Masculinity and Sociology (Sociology of Gender)	3	SLASS
SOC207	Urban Planning and Society	3	SLASS
SOC301	Social Science Research Methodology	3	SLASS
SOC303	Environmental Sociology	3	SLASS
SOC307	Modern Economics and Global Society	3	SLASS
CMN396	Development Support Communication	3	SLASS
CMN399	Language of Film	3	SLASS
CMN498	Internship	3	SLASS
ECN309	International Finance	3	SBE
ECR301	Telecommunication Systems-I	3	EEE
ECR301L	Lab Work Based on ECR301	1	EEE
EEE418	Embedded Systems	3	EEE
FIN405	Management of Financial Institution	3	SBE
MGT450	Total Quality Management	3	SBE
MKT380	Distribution Management	3	SBE
MUS101	Music Appreciation	3	SLASS
ANT306	Peasant Society	3	SLASS
ANT401	Anthropology and Development	3	SLASS
ANT404	Economic Anthropology	3	SLASS
CEN330	Data Communication	3	CSE
CEN412	Wireless Networking and Mobile Comm.	3	CSE
CMN207	Introduction to Media Writing	3	SLASS
CMN305	Media and Development	3	SLASS
CMN313	Video Editing	3	SLASS
CMN314	Depth Reporting	3	SLASS
CMN316	Development-Support Communication	3	SLASS
CMN317	Newspaper Editing	3	SLASS
CMN325	Organizational Communication	3	SLASS
CMN326	Health and Population Communication Strategies	3	SLASS
CMN406	Theories of Media and Communication	3	SLASS
CMN408	Political Communication	3	SLASS
CMN414	Communication Policy and Planning	3	SLASS
CSC201	Discrete Mathematics	3	CSE
CSC203	Data Structure	3	CSE
CSC301	Finite Automata and Computability	3	CSE
CSC465	E-commerce & Web App.	3	CSE
ECN203	Mathematics for Economics	3	SBE
ECN220	Economy of Bangladesh	3	SBE
ECN485	Mathematical Economics	3	SBE
ECR407	Electronics-II	3	EEE
ECR407L	Lab Work Based on ECR407	1	EEE
EEE402	Power Transmission and Distribution	3	EEE
ELT201	English Language	3	SLASS
ENG202	History of England	3	SLASS
ENG203	Understanding Poetry	3	SLASS
ENG404	Creative Writing	3	SLASS
ENV201L	Environmental Chemistry Lab	1	SELS
ENV205	Energy and Environment	3	SELS
ENV307	Risk Assessment & Disaster Management	3	SELS
ENV312	Nature Conservation and Ecotourism	3	SELS
ENV315	Air Pollution and Control	3	SELS
ENV330	Agriculture and Land Resource Management	3	SELS
ENV346	Water Quality Environment	3	SELS
ENV350	Coastal Ecology	3	SELS
ENV360	Agro-Social Forestry	3	SELS
ENV401	Environmental and Social impact Assessment	3	SELS
ENV406	Environmental Information System	3	SELS
ENV409	Industrial Effluent Management	3	SELS
ETE303L	Lab Work Based on ETE303	1	EEE
ETE414	Electrical Drive Systems	3	EEE
HEA202	Methods in Epidemiology and Demography-I	3	SLASS
HRM430	Human Resource Information Systems	3	SBE
MAT100	Basic University Mathematics I	3	PhySci
MAT403	Introduction to Mathematical Modeling	3	PhySci
MAT407	Complex Variables	3	PhySci
MIS430	Data Communication and Networking	3	SBE
MKT330	Sales Force Management	3	SBE
POP301	Data Analysis in Epidemiology and Demography-I	3	SELS
ACN408	Advanced Accounting	3	SBE
ANT309	Ethnicity and Indigenous People in Bangladesh and South Asia	3	SLASS
ANT315	Local Knowledge and Development	3	SLASS
CEN210	Electronic Devices & Circuits	3	CSE
CMN204	Principle of Journalism	3	SLASS
CMN319	Radio Reporting	3	SLASS
CMN405	Environmental Communication	3	SLASS
CMN409	Cinema and Cultural Identity	3	SLASS
CMN413	Computer Mediated Communication	3	SLASS
CMN415	Global Communication and National Culture	3	SLASS
CMN419	Feature Writing	3	SLASS
CMN422	Packaging and Print Promotions	3	SLASS
CMN426	Gender and Communication	3	SLASS
CMN429	New Media Communications	3	SLASS
CSC306	Algorithms	3	CSE
CSC306L	Algorithms Lab	1	CSE
CSC311	Computer Organization and Architecture	3	CSE
CSC401	Database Management	3	CSE
CSC401L	Database Management Lab	1	CSE
CSC405	MIS and Systems Analysis	3	CSE
CSC430L	Data Communication and Networking Lab	1	CSE
CSC445	Software Engineering	3	CSE
ECN320	Econometrics	3	SBE
ECN401	Microeconomic Theory	3	SBE
ECN402	Macroeconomic Theory	3	SBE
ECN490	Research Project/ Thesis	3	SBE
EEE308	Systems and Control	3	EEE
EEE308L	Lab Work Based on EEE308	1	EEE
EEE406L	Labwork for EEE406	1	EEE
EEE450	Very Large-Scale Integration Technology	3	EEE
ENG305	Introduction to Drama	3	SLASS
ENV208	Freshwater Ecology	3	SELS
HEA304	Methods in Epidemiology and Demography-II	3	SLASS
MIS441	Accounting Information Systems	3	SBE
MKT470	Brand Management	3	SBE
POP311	Data Analysis in Epidemiology and Demography-II	3	SELS
POP403	Migration and Urbanization	3	SELS
CMN320	Newscasting and Announcing	3	SLASS
CMN412	Narrative Video Production	3	SLASS
CMN417	Film-TV Business Practice	3	SLASS
CMN418	Sports Reporting	3	SLASS
CMN420	Development Reporting	3	SLASS
CMN421	Business Journalism	3	SLASS
CMN423	TV Commercials	3	SLASS
CMN425	Writing for Marketing Communication	3	SLASS
CMN427	Development Reporting in South Asia	3	SLASS
ECN340	Public Finance	3	SBE
ENV302	Geographic Information System, Remote Sensing and Cartography	3	SELS
ENV302L	Geographic Information System, Remote Sensing and Cartography Lab	1	SELS
ACN406	Cost Accounting II	3	SBE
ANT303	Theories in Anthropology II	3	SLASS
ANT312	Ecological Anthropology	3	SLASS
ANT410	Advance Research Methods in Anthropology	3	SLASS
CSC420	Image Processing and Pattern Recognition	3	CSE
ECN361	History of Economic Thoughts	3	SBE
ECN420	Applied Econometrics	3	SBE
ENG204	Varieties of Prose	3	SLASS
ENG301	Introduction to Linguistics	3	SLASS
ENG303	English Language Training: Approaches and Methods	3	SLASS
ENG304	The History of English	3	SLASS
ENG306	Romantic Literature	3	SLASS
ENG311	English Literature: Chaucer to Fielding	3	SLASS
ENV340	Advanced Geographic Information System	3	SELS
ETE303	Telecommunication Network-I	3	EEE
ETE412	Mobile and Satellite Communication Systems	3	EEE
MIS102	Advanced Computer Skills	3	SBE
MIS203	Data Structures	3	SBE
ANT201	South Asia: Tradition & Contemporary Experience	3	SLASS
ANT211	Politics and Power in Anthropology	3	SLASS
ANT301	Anthropology of Bangladesh	3	SLASS
ANT308	Globalization, Urbanization and Migration	3	SLASS
ANT412	Selected Ethnographic Tex Readings	3	SLASS
ANT416	Medical Anthropology	3	SLASS
CCR413	Design and Operating System	3	CSE
CEN430L	Computer Networks Lab	1	CSE
CMN327	Environmental Communication: Theories and Practice	3	SLASS
ECN435	Game Theory	3	SBE
ELT204	Advanced English Grammar	3	SLASS
ELT311	Introduction to Applied Linguistics	3	SLASS
ENG312	English Literature: The Victorians	3	SLASS
ENV320	Water Resources Management	3	SELS
ETE416	Microwave Engineering	3	EEE
INB303	International Management	3	SBE
LIN311	Phonetics and Phonology	3	SLASS
MAT401	Graph Theory	3	PhySci
ANT405	Archaeology	3	SLASS
ANT407	Language, Culture and Society	3	SLASS
CMN410	Media Laws and Ethics	3	SLASS
ELT303	Second Language Acquisition	3	SLASS
INB304	Bangladesh in International Business	3	SBE
ANT209	Kinship and Social Organization	3	SLASS
ANT499	Senior Project/Internship	6	SLASS
CEN432	Electrical Drives and Instrumentation	3	CSE
CSC411	Compiler Construction	3	CSE
CSC425	Artificial Intelligence	3	CSE
ECN431	Welfare Economics	3	SBE
ECN442	Gender and Development	3	SBE
ELT302	Applied Linguistics for Teachers	3	SLASS
ELT304	English Language Teaching: Approaches and Methods	3	SLASS
ELT312	Syllabuses and Course Design	3	SLASS
ENG314	American Literature: Bradford to Dickinson	3	SLASS
ENG316	Shakespeare and his Contemporaries	3	SLASS
ENV216	Water Pollution and Control	3	SELS
CMN416	TV Drama Production	3	SLASS
CSC470	Introduction to Parallel Programming	3	CSE
CSC490	Special Topic in Computer Science	3	CSE
EEE403	Electrical Energy Systems	3	EEE
EEE412	Mobile and Satellite Communication System	3	EEE
ELT305	Discourse in ELT	3	SLASS
ELT314	Materials Evaluation and Preparation	3	SLASS
ELT412	Teaching Pronunciation	3	SLASS
ENG405	South Asian Fiction in English	3	SLASS
ENV410	Environmental Law	3	SELS
CMN312	Sound Theory and Practice	3	SLASS
ELT411	Teaching and Learning Grammar	3	SLASS
ELT413	Teaching Listening and Speaking Skills	3	SLASS
ELT415	Teaching and Learning Vocabulary	3	SLASS
ELT416	Testing	3	SLASS
ENG313	English Literature: The Twentieth Century	3	SLASS
ENG315	American Literature: Twain to Mukherjee	3	SLASS
ENG416	Women and Literature	3	SLASS
ENV309	Noise Pollution and Control	3	SELS
MAT100T	Basic University Mathematics I Tutorial	0	PhySci
MAT210	Basic University Mathematics II	3	PhySci
MAT210T	Basic University Mathematics II Tutorial	0	PhySci
CMN424	Radio Commercials	3	SLASS
EEE490	Special Topics in Electrical & Electronic Engineering	3	EEE
ELT402	World Englishes	3	SLASS
ELT414	Teaching Reading and Writing Skills	3	SLASS
ENG403	Introduction to Literary Theory	3	SLASS
ENG414	Other Literatures in English	3	SLASS
ENV314	Management of Natural Resources	3	SELS
IMT301	Financial Markets and Institution	3	SBE
SOC102	Sociological Imaginations	3	SLASS
SOC206	Gender and Society	3	SLASS
CSC435	Computer Graphics	3	CSE
ELT403	Teaching English for Specific Purposes	3	SLASS
ELT405	Teacher Education and Supervision For ELT	3	SLASS
ENG415	Literature in Translation	3	SLASS
ENG698	Teaching Practice/Internship	3	SLASS
INB403	Negotiation and Diplomacy	3	SBE
ANT314	Communication and Cultural Politics	3	SLASS
BIO103	Biochemistry I	3	SELS
BIO105	General Chemistry	3	SELS
BIO105L	General Chemistry Lab	1	SELS
BIO106	Introductory Chemistry I	3	SELS
BIO106L	Introductory Chemistry I Lab	1	SELS
EEE435	Robotics	3	EEE
ENG699	Project/Thesis	3	SLASS
MCB101	General Microbiology	3	SELS
MCB102	Microbial Chemistry	3	SELS
ANT311	Gender Issues in Anthropology	3	SLASS
ENG413	Classics in Translation	3	SLASS
MCB103	Basic Techniques in Microbiology	3	SELS
MCB103L	Basic Techniques in Microbiology Lab	1	SELS
PHL101	Introduction to Philosophy	3	SLASS
ECN441	Natural Resource Economics	3	SBE
ENG412	English Drama from Congreve to Churchill	3	SLASS
MCB201	General Microbiology II	3	SELS
MCB204	Human Physiology	3	SELS
MCB301	Environmental Microbiology	3	SELS
BIO107	Introductory Chemistry II	3	SELS
BIO107L	Introductory Chemistry II Lab	1	SELS
BIO203	Cell Biology I	3	SELS
BIO207	Genetics	3	SELS
ELT315	Introduction to CALL (Computer Assisted Language Learning)	3	SLASS
ELT498	Teaching Practice / Internship	3	SLASS
ENV345	Biogeography	3	SELS
MCB202	Microbial Genetics	3	SELS
MCB302	Microbial Ecology	3	SELS
MCB304	Microbial Biotechnology	3	SELS
MCB305	Enzymology	1	SELS
SOC201	Statistics for Sociology	3	SLASS
SOC201L	Statistics for Sociology Lab	1	SLASS
BIO104	Biochemistry II	3	SELS
BIO201	Organic Chemistry I	3	SELS
BIO204	Cell Biology II	3	SELS
BIO205	Biochemistry Laboratory	3	SELS
CEN104	Electrical Circuit Analysis	3	CSE
CEN104L	Lab work based on CEN104	1	CSE
CSC101L	Lab for CSC101	1	CSE
CSC203L	Data Structure Lab	1	CSE
CSC317L	Labwork based on CSC317	1	CSE
EEE417	Switchgear and Protection	3	EEE
LAW101	Jurisprudence	3	SLASS
MAT104	Calculus and analytical geometry	3	PhySci
MCB303	Biochemistry and Molecular Biology	3	SELS
MCB303L	Biochemistry and Molecular Biology Lab	1	SELS
MCB307	Mycology	3	SELS
MCB308	Immunology	3	SELS
PHL206	Philosophy of Religion	3	SLASS
BIO108	Human Physiology & Diseases	3	SELS
BIO202	Organic Chem II	3	SELS
BIO208	Microbiology	3	SELS
CHE102L	Chemistry and Society Laboratory	1	SELS
CIS101L	Labwork for CIS101	1	CSE
LAW102	Legal History and Legal System of Bangladesh	3	SLASS
MCB306	Molecular Biology and Genetic Engineering	3	SELS
MCB309	Virology	3	SELS
MCB310	Microbial Physiology and Metabolism	3	SELS
POP306	Reproductive Biology and Family Planning	3	SPPH
BDS109	Bangladesh 1971 through the Lenses	3	SLASS
BIO100	Discoveries in Biology	3	SELS
BIO206	Organic Chemistry Laboratory	3	SELS
BIO303	Molecular Biology	3	SELS
BIO306	Concepts in Biotechnology	3	SELS
CHI101	Elementary Chinese-I	3	SLASS
CSC100	Introduction to Basic Programming	0	CSE
CSC421	Machine learning	3	CSE
INB302	International Trade and Investment Theory	3	SBE
LAW103	Law of Contract	3	SLASS
LAW303	Business Law	3	SLASS
LAW306	Environmental Law of Bangladesh	3	SLASS
MAT203	Linear Algebra- vectors and matrices	3	PhySci
MCB401	Pharmaceutical Microbiology	3	SELS
MCB402	Agricultural Microbiology	3	SELS
MCB403	Food Microbiology and QC of Food, Fish and Beverage	3	SELS
SOC205	Society and Identity	3	SLASS
ANT414	Material Culture	3	SLASS
BIO110	Experiments of Life: Introductory Biology Laboratory	3	SELS
BIO301	Experimental Design, Research Methods and Biostatistics	3	SELS
BIO304	Molecular Biology Laboratory	3	SELS
BIO305	Molecular Biology of Diseases	3	SELS
BIO307	Genetic Engineering	3	SELS
CSC450	Computer and Network Security	3	CSE
CSC453	Software Requirement Engineering	3	CSE
CSC458	Software Quality and Testing	3	CSE
KRN112	Korean Cinema and Society	3	SLASS
LAW104	Law of Tort	3	SLASS
LAW105	Criminal Law	3	SLASS
MCB404	Analytical Microbiology	3	SELS
MCB406	Medical Microbiology	3	SELS
MUS102	Nazrul and Abbasuddin's Contribution	3	SLASS
SOC312	Society and Environment	3	SLASS
BIO210	Departmental Seminar Series in Biotechnology, Health and Development	1	SELS
BIO401	Readings in Biochemistry	3	SELS
BIO402	Student Symposium in Biochemistry	3	SELS
BIO414	Endocrinology	3	SELS
BIO415	Clinical Biochemistry	3	SELS
CSC417	Data Mining and Warehouse	3	CSE
LAW106	Constitutional Law	3	SLASS
LAW107	Land Law	3	SLASS
LAW108	Company Law	3	SLASS
MAT100A	Basic Algebra	3	PhySci
MCB311	Microbiology II Laboratories	3	SELS
MCB405	Fermentation Technology	3	SELS
MCB407	Clinical and Diagnostic Microbiology	3	SELS
MKT460	Apparel Marketing and Merchandising	3	SBE
SOC208	Social Problems	3	SLASS
SOC404	Sociology of Globalization	3	SLASS
BIO302	Genomics, Proteomics and Bioinformatics	3	SELS
BIO452	Internship in Biochemistry	3	SELS
CSE104L	Lab work based on CSE 104	1	CSE
CSE204	Digital Logic Design	3	CSE
CSE204L	Labwork based on CSE 204	1	CSE
CSE210	Electronics I	3	CSE
CSE210L	Labwork based on CSE 210	1	CSE
CSE211L	Labwork based on CSE 211	1	CSE
CSE213	Object Oriented Programming	3	CSE
CSE213L	Labwork based on CSE 213	1	CSE
CSE214	Computer Organization & Architecture	3	CSE
CSE216	Microprocessor Interfacing & Assembly Language	3	CSE
CSE216L	Labwork based on CSE 216	1	CSE
CSE303L	Labwork based on CSE303	1	CSE
CSE307	System Analysis and Design	3	CSE
CSE309	Web Application & Internet	3	CSE
CSE316	Data Communication & Computer Networks	3	CSE
CSE316L	Labwork based on CSE 316	1	CSE
CSE317L	Labwork based on CSE317	1	CSE
CSE424	Neural Networks	3	CSE
EEE316L	Engineering Drawing and Electrical Services Design Lab	1	EEE
ETE409	Energy Conversion	3	EEE
ETE424	System and Control	3	EEE
LAW109	Law of Civil Procedure	3	SLASS
LAW201	Law of Criminal Procedure	3	SLASS
LAW202	Law of Evidence	3	SLASS
LAW203	Equity, Trust and Specific Relief Act	3	SLASS
MAT111	Mathematics-I	3	PhySci
MAT120	Fundamentals of Mathematics	3	PhySci
MCB409	Industrial Microbiology	3	SELS
MCB410	Student Symposium in Microbiology	3	SELS
MCB411	Microbiology III Laboratories	3	SELS
PHY111	Physics-I	3	PhySci
SOC318	City and City Life	3	SLASS
BIO417	Cellular and Molecular Neurobiology	3	SELS
BIO421	Epigenetics	3	SELS
CSC426	Introduction to Robotics	3	CSE
CSE490	Special Topics in Computer Science & Engineering	3	CSE
ECN335	Political Economy of Development	3	SBE
LAW205	Law of Transfer of Property & Registration	3	SLASS
LAW206	Legal Writing, Research, General Clauses Act and Interpretation of Statute	3	SLASS
LAW207	Muslim Law	3	SLASS
MAT121	Probability & Statistics for Science and Engineering	3	PhySci
MAT125	Calculus with Analytic Geometry-I	3	PhySci
MAT301	Ordinary Diff Equations	3	PhySci
MCB408	Readings in Microbiology	3	SELS
MCB451	Internship in Microbiology	3	SELS
PHY121	Physics-II	3	PhySci
PHY121L	Physics Lab	1	PhySci
SOC209	Marriage and Family	3	SLASS
SOC210	Social Structure of Bangladesh: Structure and processes	3	SLASS
SOC313	Politics and Society	3	SLASS
BIO419	Developmental Biology	3	SELS
CSC121	Introduction to Computer Programming Language	3	CSE
CSC121L	Lab for CSC121	1	CSE
CSE310	Electronics II	3	CSE
CSE310L	Labwork based on CSE 310	1	CSE
CSE441	Instrumentation & measurements	3	CSE
EEE131	Electrical Circuit - I	3	EEE
EEE132	Introduction to Materials and Chemistry	3	EEE
GSG101	Introduction to Global Studies	3	SLASS
LAW204	Fiscal Laws of Bangladesh	3	SLASS
LAW209	Labour Law	3	SLASS
LAW301	Comparative Law	3	SLASS
LAW302	Public International Law	3	SLASS
MAT131	Mathematics-II	3	PhySci
MAT222	Linear Algebra-I	3	PhySci
MAT225	Calculus with Analytic Geometry-II	3	PhySci
PHY103	Waves; Oscillations and Optics	3	PhySci
PHY103L	Waves; Oscillations and Optics Lab-III	3	PhySci
PSY201	Principles of Psychology	3	SLASS
SOC302	Classical Sociological Theory	3	SLASS
SOC320	Sociology of Religion	3	SLASS
SOC406	Sociology of Health and illness	3	SLASS
ANT418	Contemporary Issues in Anthropology	3	SLASS
BIO413	Nutrition, Metabolism and Disease	3	SELS
CSC472	Cloud Computing	3	CSE
CSE464	Mobile Application Development	3	CSE
EEE211	Electrical Circuit-II	3	EEE
EEE211L	Electrical Circuit Lab	1	EEE
LAW208	Hindu Law	3	SLASS
LAW304	Drafting and Conveyancing	3	SLASS
LAW307	Cyber Law	3	SLASS
MAT213	Mathematics-III	3	PhySci
MAT220	Real Analysis I	3	PhySci
MAT230	Ordinary Differential Equations with applications-I	3	PhySci
PHY104	Heat and Thermodynamics	3	PhySci
PHY104L	Heat and Thermodynamics Lab-IV	1	PhySci
SOC322	Designing Sociological Research	3	SLASS
SOC401	Contemporary Sociological Theories	3	SLASS
SOC402	Social Inequalities	3	SLASS
SOC408	Migration and Population	3	SLASS
BIO418	Molecular Biology of Cancer	3	SELS
EEE221	Electronics - I	3	EEE
EEE222L	Electrical & Electronic Circuits Simulation Lab	1	EEE
EEE223	Mechanical Engineering Fundamentals	3	EEE
GSG102	Introduction to Governance Studies	3	SLASS
GSG201	Theories of International Relations/International Political Economy	3	SLASS
LAW308	Intellectual Property Law	3	SLASS
LAW309	Alternative Dispute Resolution (ADR) and Arbitration	3	SLASS
LAW401	Administrative Law	3	SLASS
LAW402	Laws on Insurance	3	SLASS
MAT215	Algebraic Structures	3	PhySci
MAT221	Mathematics-IV	3	PhySci
MAT320	Real Analysis II	3	PhySci
PHY202	Atomic; Molecular and Laser Physics	3	PhySci
PHY308	Mathematical Methods for Physicist	3	PhySci
SOC314	Sociology of Rural Life	3	SLASS
SOC403	Advanced Statistics and their Applications	3	SLASS
SOC403L	Multivariate Analysis Lab.	1	SLASS
SOC411	Qualitative Research Method	3	SLASS
SOC414	Contemporary Bangladesh Society	3	SLASS
CSE434	Advance Programming in UNIX	3	CSE
EEE231	Signals and Systems	3	EEE
EEE232L	Digital Logic Design Lab	1	EEE
EEE233	Energy Conversion - I	3	EEE
EEE234L	Electronics Lab	1	EEE
ETE235L	Circuits, Signals and Systems Simulation Lab	1	EEE
GSG103	Theories and Methods of Inter-disciplinary/Trans-disciplinary Studies	3	SLASS
GSG202	Global History: 20th Century and beyond	3	SLASS
GSG203	Security Studies: military, economic, political, social, human	3	SLASS
GSG220	Theories of War and Conflict	3	SLASS
GSG221	Surveillance, Intelligence and National Security	3	SLASS
GSG320	Ethnic Conflict and Counterinsurgencies	3	SLASS
GSG321	International Terrorism and Counterterrorism	3	SLASS
LAW305	Moot Court Sessions	3	SLASS
LAW404	Banking and Securities Law	3	SLASS
LAW407	Human Rights	3	SLASS
LAW409	Media and Telecommunication Law	3	SLASS
MAT321	Abstract Algebra	3	PhySci
MAT325	Multivariable and Vector Calculus	3	PhySci
MAT330	Ordinary Differential Equations with applications -II	3	PhySci
MGT370	Social Entrepreneurship	3	SBE
MGT400	Introduction to Supply Chain Management	3	SBE
PHY203	Solid State Physics - I	3	PhySci
PHY204	Nuclear Physics - I	3	PhySci
PHY303	Radiation and Statistical Mechanics	3	PhySci
SOC317	Social Demography	3	SLASS
SOC319	Economy and Society	3	SLASS
BIO406	Evolutionary Biology	3	SELS
BIO410	Industrial Biotechnology	3	SELS
BIO411	Drugs and the Body	3	SELS
EEE225	Energy Conversion Engineering	3	EEE
EEE312L	Energy Conversion Lab	1	EEE
EEE313	Electromagnetic Fields and Waves	3	EEE
EEE314L	Numerical Technique Lab	1	EEE
EEE315L	Electrical and Electronic Project Lab	1	EEE
ETE311	Communication Engineering - I	3	EEE
GSG301	Research Methodology: qualitative	3	SLASS
LIN412	Psycholinguistics	3	SLASS
MAT345	Complex Analysis	3	PhySci
MAT350	Computational Methods-I	3	PhySci
PHY301	Classical Mechanics - I	3	PhySci
PHY302	Classical Electrodynamics	3	PhySci
SEN645	Software Project Management	3	CSE
SOC316	Sociology of Culture	3	SLASS
SOC407	Sociology of Disaster	3	SLASS
BBA499B	Advance Research	6	SBE
BIO412	The Ethics of Biological Research and Technology	3	SELS
CSC620	Image Analysis and Pattern Recognition	3	CSE
EEE323	Microprocessor and Interfacing	3	EEE
EEE323L	Microprocessor and Interfacing Lab	1	EEE
ETE312L	Communication Engineering Fundamentals Lab	1	EEE
ETE315L	Electronic and Telecommunication Project Lab	1	EEE
GSG210	Foreign Policy Analysis	3	SLASS
GSG302	Research Methodology: quantitative	3	SLASS
GSG303	Global Culture and International Communications	3	SLASS
GSG483	Peace And Conflict Studies	3	SLASS
INB405	Managing and Integrating E-Business	3	SBE
LIN411	Sociolinguistics	3	SLASS
MAT199L	Software Tools for Mathematics	1	PhySci
MAT340	Partial Differential Equations	3	PhySci
MAT426	Functional Analysis	3	PhySci
PHA101	Introduction to Pharmacy	3	SELS
PHA102	Pharmacognosy and Nutraceuticals	3	SELS
PHA102L	Pharmacognosy and Nutraceuticals Lab	1	SELS
PHY430	Relativity: Special & General	3	PhySci
PHY432	Introduction to Astrophysics	3	PhySci
SOC405	Social Movement and Collective Behavior	3	SLASS
SOC413	Sociology of Islam	3	SLASS
BIO405	Principles of Recombinant DNA Technology	3	SELS
EEE419L	Power System Lab	1	EEE
EEE423L	Sensor and Instrumentation Lab	1	EEE
EEE465	Biomedical Signal Processing	3	EEE
ETE333	Telecommunication Networks and Switching Systems	3	EEE
ETE335	Wireless Communications	3	EEE
ETE335L	Wireless Communications and Microwave Engineering Lab	1	EEE
ETE411	Optical Fiber Communications	3	EEE
ETE411L	Optical Fiber Communications Lab	1	EEE
GSG230	Comparative Public Policy	3	SLASS
GSG311	Political Ideologies	3	SLASS
GSG331	Public Policy Making in Bangladesh	3	SLASS
GSG380	Middle Eastern Studies	3	SLASS
GSG484	Mass Violence, Genocide and Social Memory	3	SLASS
LIN313	Syntax	3	SLASS
MAT460	Astrophysics	3	PhySci
MAT464	Statistical Mechanics	3	PhySci
MAT475	Financial Mathematics	3	PhySci
PHA201L	Inorganic Pharmacy-II Lab	1	SPPH
PHA202	Organic Pharmacy-II	3	SPPH
PHA202L	Organic Pharmacy-II Lab	1	SPPH
PHA203	Human Anatomy & Physiology-II	3	SPPH
PHA203L	Human Anatomy & Physiology-II lab	1	SPPH
PHA204	Pharmaceutical Microbiology-I	3	SPPH
PHA207	Pharmacology-I	3	SPPH
PHA303	GMP & Pharmaceutical Industrial Practice	3	SPPH
PHA304	Pharmacy Practice-I	3	SPPH
PHA311	Pharmaceutical Engineering-II	3	SPPH
PHA413	Project and Dissertation	4	SPPH
POP411	Population Policy and Planning	3	SELS
BCB103	Introductory Chemistry I Lecture	3	SELS
BCB103L	Introductory Chemistry I Lecture Lab	1	SELS
BCB104	Introductory Chemistry II Lecture	3	SELS
BCB104L	Introductory Chemistry II Lecture Lab	1	SELS
BCB202	Organic Chemistry II Lecture        	3	SELS
BCB202L	Organic Chemistry II Lecture Lab    	1	SELS
BCB304	Recombinant DNA Technology	3	SELS
BCB305	Molecular Biology Lab	3	SELS
BCB309	Plant Biochemistry and Biotechnology	3	SELS
CSE484	Intelligent System Engineering	3	CSE
EEE400	Final Year Design Project	6	EEE
EEE438	Renewable Energy Technology	3	EEE
ETE332	RF and Microwave Engineering	3	EEE
ETE413	Sensor and Instrumentation	3	EEE
ETE423	Network Operating System & Administration	3	EEE
FRN102	Elementary French II	3	SLASS
GSG410	Political Institutions	3	SLASS
GSG420	Strategic Studies & Human Security	3	SLASS
GSG481	Religion and Politics	3	SLASS
GSG497	Language Study	3	SLASS
INB406	International Law	3	SBE
MAT428	Mathematical Logic	3	PhySci
MAT432	Differential Geometry	3	PhySci
MAT436	Mathematical Statistics	3	PhySci
MAT459	Astronomy	3	PhySci
MAT469	Atmospheric Physics and Meteorology	3	PhySci
MAT489	Special Topics	3	PhySci
PHA205	Physical Pharmacy	3	SPPH
PHA208	Pharmaceutical Microbiology-II	3	SPPH
PHA208L	Pharmaceutical Microbiology-II Lab	1	SPPH
PHA302	Pharmaceutical Dosage Form-II	3	SPPH
PHA305	Pharmaceutical Analysis-I	3	SPPH
PHA306	Pharmacology-II	3	SPPH
PHA308	Pharmacology-III	3	SPPH
PHA309	Medicinal Chemistry-I	3	SPPH
PHA401	Biopharmaceutics & Clinical Pharmacokinetic-I	3	SPPH
PHA402	Pharmaceutical Marketing & Management	3	SPPH
PHA410	Pharmaceutical Regulatory Affairs	3	SPPH
PHA411	Pharmacy Practice-II	3	SPPH
PHY436	Solid State Physics-II	3	PhySci
BCB410	Food Technology	3	SELS
EEE469	Robotics and Mechatronics	3	EEE
GSG241	Public Diplomacy and Communications	3	SLASS
GSG381	North American Studies	3	SLASS
GSG383	European Studies	3	SLASS
GSG492	Citizenship, Statelessness and Refugee Crisis	3	SLASS
LIN314	Semantics	3	SLASS
MAT450	Computational Methods II	3	PhySci
BCB409	Nutrition, Metabolism and Diseases	3	SELS
BCB450	Senior Project and Internship	3	SELS
CSC471	Introduction to High Performance Computing	3	CSE
EEE432	Power Plant Engineering	3	EEE
GSG306	Dynamics of International Organizations	3	SLASS
GSG387	Southeast Asian Studies	3	SLASS
GSG440	Global Communication and National Cultures	3	SLASS
MAT350L	Labwork based on MAT350	1	PhySci
MAT399L	Computer Assisted Mathematical Problem Solving II	1	PhySci
MAT463	Theory of Relativity	3	PhySci
PHA307	Pharmaceutical Dosage Form-III	3	SPPH
PHA407	Pharmaceutical Industrial Training	1	SPPH
PHY207	Basic Electronics	3	PhySci
SOC309	Education and Society	3	SLASS
CCS106	Cyber Space, Cyber Crime, & Cyber Security	4	SLASS
CFS105	Criminalistics & Forensic Science	3	SLASS
EEE463	Analog and Digital Integrated Circuits	3	EEE
ELL101	Legal Terminology and Phrases	3	SLASS
FIN305	Financial Reporting Environment	3	SBE
GSG240	International Journalism	3	SLASS
GSG260	Human Geography & Global Demography	3	SLASS
GSG330	Human Rights and Law	3	SLASS
GSG450	International Economic Institutions & Global Poverty	3	SLASS
ITC103	Introduction to Criminology	3	SLASS
LEL102	Law in Everyday Life	3	SLASS
MAT461	Classical Mechanics	3	PhySci
PHA310	Pharmaceutical Analysis-II	3	SPPH
PHA312	Biochemistry & Molecular Biology	3	SPPH
PHA403	Pharmacology-IV	3	SPPH
PHA404	Advanced Pharmaceutical Analysis	3	SPPH
PHA409	Biopharmaceutics & Clinical Pharmacokinetic-II	3	SPPH
PHA412	Pharmaceutical Biotechnology	3	SPPH
PHY305	Digital Electronics	3	PhySci
SOC306	Ethnic and Cultural Minorities	3	SLASS
TCL104	Tax Calculation	3	SETS
GSG251	Gender, Equality and Development	3	SLASS
GSG282	China in International System	3	SLASS
GSG304	Research Methodology: Qualitative& Quantitativ	3	SLASS
GSG305	Politics and Government in third World Countries with Special Reference to Bangladesh	3	SLASS
GSG485	Ethics and Morality in Politics	3	SLASS
PHY437	Non-linear Optics	3	PhySci
BBA499A	Internship/ Senior Project	6	SBE
BCB203	Cell Biology	3	SELS
BCB205	Metabolism	3	SELS
BCB302	Enzymology	3	SELS
BCB303	Experimental Design, Research Methods and Biostatistics	3	SELS
BCB306	Genomics, Proteomics and Bioinformatics	3	SELS
BCB308	Endocrinology	3	SELS
BCB401	Readings in Biochemistry	3	SELS
BCB402	Student Symposium in Biochemistry	3	SELS
BCB405	Virology	3	SELS
BCB411	Clinical Biochemistry	3	SELS
BCB412	Cellular and Molecular Neurobiology	3	SELS
BIO102L	Biology & Society Lab	1	SELS
CMN304	Language of Film	3	SLASS
CMN499	Senior Project	6	SLASS
CSE104	Electrical Circuit Analysis	3	SETS
CSE203	Data Structure	3	SETS
CSE203L	Data Structure Lab	1	SETS
CSE211	Algorithms	3	SETS
CSE303	Database Management	3	SETS
CSE313	Compiler Construction	3	SETS
CSE315	Design of Operating System	3	SETS
CSE317	Numerical Methods	3	SETS
CSE406	Cryptography and Network Security	3	SETS
CSE417	Data Mining and Warehouse	3	SETS
CSE420	Image Processing	3	SETS
CSE425	Artificial Intelligence	3	SETS
CSE433	Introduction to Parallel Programming	3	SETS
CSE451	Software Engineering	3	SETS
CSE454	Software Engineering Process Management	3	SETS
CSE457	Project Management	3	SETS
CSE498	Senior Project	6	SETS
CSE499	Internship Program	3	SETS
ECN425	Mathematical Economics	3	SBE
ECN470	International Finance	3	SBE
ECN486	Research Methodology	3	SBE
EEE232	Digital Logic Design	3	SETS
EEE234	Electronics-II	3	SETS
EEE312	Energy Conversion – II	3	SETS
EEE321	Digital Signal Processing	3	SETS
EEE321L	Digital Signal Processing Lab	1	SETS
EEE332	Power Electronics and Drives	3	SETS
EEE332L	Power Electronics and Drives Lab	1	SETS
EEE333	Power System - I	3	SETS
EEE334	Embedded Systems	3	SETS
EEE411	Control Systems	3	SETS
EEE411L	Control Systems Lab	1	SETS
EEE419	Power System - II	3	SETS
EEE422	Ethics, Engineering Economics and Management	3	SETS
EEE436	Switchgear and Protection	3	SETS
EEE466	VLSI Design	3	SETS
EEE497	Internship	3	SETS
ELT203	The History of English	3	SLASS
ELT301	Introduction to Linguistics	3	SLASS
ELT401	Research Methodology	3	SLASS
ELT499	Project/Thesis	3	SLASS
ENG499	Project/Thesis	3	SLASS
ENV100	Basics of Climate Change	3	SELS
ENV301	Environmental Economics	3	SELS
ENV304	Environmental Microbiology	3	SELS
ENV304L	Environmental Microbiology Lab	1	SELS
ENV499	Internship Program	3	SELS
ETE312	Communication Engineering Fundamentals	3	SETS
ETE322	Communication Engineering - II	3	SETS
ETE322L	Communication Engineering Lab	1	SETS
ETE331	Computer Networks	3	SETS
ETE331L	Computer Networks Lab	1	SETS
ETE448	Cryptography and Network Security	3	SETS
GSG480	Contemporary Bangladesh Society	3	SLASS
GSG482	Cinema and Cultural Identity	3	SLASS
GSG498	Internship	3	SLASS
GSG499	Senior Project	3	SLASS
INB301	International Business	3	SBE
LFE201	Live-in-Field Experience (Inter-Term Course)	3	SLASS
LIN312	Morphology and Lexicology	3	SLASS
MAT499	Senior Project	6	SETS
MCB210	Departmental Seminar Series in Biotechnology, Health and Development	1	SELS
MCB450	Senior Project	3	SELS
MGT490	Strategic Management	3	SBE
MIS401	Database Management	3	SBE
MIS455	Web Applications and Internet	3	SBE
MIS465	E-commerce & Web App.	3	SBE
PHY304	Quantum Mechanics –I	3	SETS
PHY433	Computational Physics	3	SETS
PHY435	Nuclear Physics-II	3	SETS
SOC499	Senior Project/Internship	6	SLASS
BCB201	Organic Chemistry I Lecture	3	SELS
BCB201L	Organic Chemistry I Lecture Lab	1	SELS
BCB204	Molecular Genetics	3	SELS
BCB206	Molecular Biology	3	SELS
BCB207	Biochemical Techniques Lab	3	SELS
BCB301	Immunology	3	SELS
BCB307	Biotechnology and Genetic Engineering: Concepts and Applications	3	SELS
BCB413	Molecular Biology of Cancer	3	SELS
BCB415	Epigenetics	3	SELS
CSE201	Discrete Mathematics	3	SETS
CSE403	Network Management	3	SETS
CSE408	Advanced Computer Network	3	SETS
CSE416	Distributed Database Systems	3	SETS
CSE452	Software Marketing	3	SETS
CSE459	Software Architecture and Component-Based Design	3	SETS
ENG401	Research Methodology	3	SLASS
ETE323	Digital Communications	3	SETS
ETE323L	Digital Communication Lab	1	SETS
GSG231	Cultural Governance and Soft power	3	SLASS
GSG430	Communication Policy and Planning	3	SLASS
MAT453	Special Functions and Transforms	3	SETS
PHA100	Viva voce	1	SPPH
PHA103	Human Anatomy & Physiology-I	3	SPPH
PHA104	Inorganic Pharmacy-I	3	SPPH
PHA105	Organic Pharmacy-I	3	SPPH
PHA106	Pharmaceutical Statistics	3	SPPH
PHA200	Viva voce	1	SPPH
PHA201	Inorganic Pharmacy-II	3	SPPH
PHA206	Human Anatomy & Physiology-III	3	SPPH
PHA209	Pharmaceutical Dosage Form-I	3	SPPH
PHA300	Viva voce	1	SPPH
PHA301	Pharmaceutical Engineering-I	3	SPPH
PHA400	Viva voce	1	SPPH
PHY100	Physics for the Next Generation	3	SETS
CSE402	Wireless Networking & Mobile Communication	3	SETS
CSE421	Machine learning	3	SETS
CSE426	Introduction to Robotics	3	SETS
CSE453	Software Requirement Engineering	3	SETS
CSE458	Software Quality and Testing	3	SETS
CSE461	Advance topics for Application Development	3	SETS
GSG211	Regional and International Organizations	3	SLASS
GSG360	Environmental Consciousness-building	3	SLASS
GSG402	Theories of Socio-political Economy of Development	3	SLASS
GSG403	Global Ecology: Culture, Communications, & Demography	3	SLASS
MAT405	Optimization Techniques	3	SETS
PHA105L	Organic Pharmacy-I Lab	1	SPPH
PHA306L	Pharmacology-II Lab	1	SPPH
PHA307L	Pharmaceutical Dosage Form-III Lab	1	SPPH
PHA312L	Biochemistry & Molecular Biology Lab	1	SPPH
PHA405	Medicinal Chemistry-II	3	SPPH
PHA406	Cosmetology	3	SPPH
PHA408	Basic Pathology & Toxicology	3	SPPH
PHY207L	Basic Electronics Lab-V	1	SETS
PHY305L	Digital Electronics Lab-VI	1	SETS
PHY499	Project in Physics	6	SETS
BCB407	Microbial Biotechnology	3	SELS
BCB414	Developmental Biology	3	SELS
BIO450	Senior Project	3	SELS
ECN382	Health Economics	3	SBE
GSG401	Global Ecology: environment, demography, resources	3	SLASS
CSE478	Object Oriented Programming	3	SETS
ENG406	Classics in Translation	3	SLASS
GSG310	Introduction to International Law	3	SLASS
SOC409	Social Policy and Planning	3	SLASS
\.


--
-- Data for Name: department_t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department_t (cdepartmentid, cdepartmentname, cschoolid) FROM stdin;
SLASS	School of Liberal Arts & Social Sciences	SLASS
SBE	School of Business & Entrepreneurship	SBE
SELS	School of Environment and Life Sciences	SELS
CSE	Computer Science and Engineering	SETS
EEE	Electrical and Electronic Engineering 	SETS
PhySci	Physical Sciences	SETS
SPPH	School of Pharmacy and Public Health	SPPH
SETS	School of Engineering, Technology and Sciences	SETS
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-11-02 02:29:04.39936+06	1	Example object (1)	1	[{"added": {}}]	10	1
2	2021-11-02 02:29:17.531573+06	2	Example object (2)	1	[{"added": {}}]	10	1
3	2021-11-02 02:29:36.263448+06	3	Example object (3)	1	[{"added": {}}]	10	1
4	2021-11-02 02:29:44.719045+06	4	Example object (4)	1	[{"added": {}}]	10	1
5	2021-11-02 02:35:56.558851+06	4	Example object (4)	3		10	1
6	2021-11-02 02:35:56.568844+06	3	Example object (3)	3		10	1
7	2021-11-02 02:35:56.569843+06	2	Example object (2)	3		10	1
8	2021-11-02 02:35:56.571842+06	1	Example object (1)	3		10	1
9	2021-11-20 00:23:02.449464+06	14	Paracetamol - 50	3		10	1
10	2021-11-20 00:25:53.189924+06	21	  - None	3		10	1
11	2021-11-20 00:25:57.407886+06	19	  - None	3		10	1
12	2021-11-20 00:26:02.634104+06	18	Montelukast - 23	3		10	1
13	2021-11-20 00:29:20.159825+06	23	  - None	3		10	1
14	2021-11-20 00:29:26.277395+06	20	Montelukast - 23	3		10	1
15	2021-11-20 00:32:39.514252+06	25	  - None	3		10	1
16	2021-11-20 00:32:43.426006+06	27	  - None	3		10	1
17	2021-11-20 00:32:47.250779+06	24	Montelukast - 23	3		10	1
18	2021-11-20 00:32:50.924897+06	22	Montelukast - 23	3		10	1
19	2021-11-20 00:35:51.584847+06	30	  - None	3		10	1
20	2021-11-20 00:35:56.300787+06	29	Montelukast - 23	3		10	1
21	2021-11-20 00:50:36.694945+06	31	  - None	3		10	1
22	2021-11-20 00:51:40.354634+06	32	  - None	3		10	1
23	2021-11-20 01:02:08.530821+06	33	oral saline - 20	3		10	1
24	2021-11-20 01:03:31.142978+06	34	oral saline - 20	3		10	1
25	2021-11-20 01:04:12.482124+06	35	Savlon - 31	3		10	1
26	2021-11-20 01:04:16.951868+06	36	oral saline - 20	3		10	1
27	2021-11-20 01:04:27.282481+06	37	Savlon - 31	3		10	1
28	2021-11-20 01:04:31.865815+06	38	oral saline - 20	3		10	1
29	2021-11-20 01:22:42.573469+06	40	oral saline - 20	3		10	1
30	2021-11-20 01:22:47.028691+06	39	Savlon - 31	3		10	1
31	2021-11-20 01:23:30.428311+06	46	oral saline - 20	3		10	1
32	2021-11-20 01:23:30.439305+06	45	Savlon - 31	3		10	1
33	2021-11-20 01:23:30.441306+06	44	oral saline - 20	3		10	1
34	2021-11-20 01:23:30.442303+06	43	Savlon - 31	3		10	1
35	2021-11-20 01:25:24.21699+06	41	Savlon - 31	3		10	1
36	2021-11-20 01:25:28.338351+06	42	oral saline - 20	3		10	1
37	2021-11-20 01:28:55.399752+06	47	Savlon - 31	3		10	1
38	2021-11-20 01:29:00.317837+06	48	oral saline - 20	3		10	1
39	2021-11-20 01:29:14.609305+06	50	oral saline - 20	3		10	1
40	2021-11-20 01:29:18.438795+06	49	Savlon - 31	3		10	1
41	2021-11-20 01:30:14.107435+06	52	oral saline - 20	3		10	1
42	2021-11-20 01:30:14.118425+06	51	Savlon - 31	3		10	1
43	2021-11-22 02:23:12.92721+06	1	ClassSize_1 object (1)	1	[{"added": {}}]	1	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	base	classsize_1
2	base	revenue
3	base	dummy
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
10	base	example
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-02 02:04:02.813341+06
2	auth	0001_initial	2021-11-02 02:04:03.000235+06
3	admin	0001_initial	2021-11-02 02:04:03.0622+06
4	admin	0002_logentry_remove_auto_add	2021-11-02 02:04:03.089183+06
5	admin	0003_logentry_add_action_flag_choices	2021-11-02 02:04:03.122167+06
6	contenttypes	0002_remove_content_type_name	2021-11-02 02:04:03.179133+06
7	auth	0002_alter_permission_name_max_length	2021-11-02 02:04:03.20212+06
8	auth	0003_alter_user_email_max_length	2021-11-02 02:04:03.229104+06
9	auth	0004_alter_user_username_opts	2021-11-02 02:04:03.25709+06
10	auth	0005_alter_user_last_login_null	2021-11-02 02:04:03.279075+06
11	auth	0006_require_contenttypes_0002	2021-11-02 02:04:03.286071+06
12	auth	0007_alter_validators_add_error_messages	2021-11-02 02:04:03.310057+06
13	auth	0008_alter_user_username_max_length	2021-11-02 02:04:03.344075+06
14	auth	0009_alter_user_last_name_max_length	2021-11-02 02:04:03.369144+06
15	auth	0010_alter_group_name_max_length	2021-11-02 02:04:03.398174+06
16	auth	0011_update_proxy_permissions	2021-11-02 02:04:03.432155+06
17	auth	0012_alter_user_first_name_max_length	2021-11-02 02:04:03.460139+06
18	sessions	0001_initial	2021-11-02 02:04:03.492635+06
19	base	0001_initial	2021-11-02 02:19:44.925496+06
20	base	0002_example	2021-11-02 02:27:51.037163+06
21	base	0003_remove_classsize_1_freespace	2021-11-22 02:00:55.174947+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
69byov1abp9ahqev1w7dy7b6vnmnhngx	.eJxVjDsOwjAQBe_iGlkG1mZNSc8ZrP3YOIAcKU4qxN0hUgpo38y8l0m0zDUtPU9pUHM2e7P73ZjkkdsK9E7tNloZ2zwNbFfFbrTb66j5edncv4NKvX5rhiPEwkAaMkvw3gtFDYqFizp2HhCLHoIwCnIWCJnQnTxFLgHAm_cHFJg5Bg:1mhdZT:ei-xTR53BUb-ut9Id2_pK1eujIj9EmYvapNhSSfEzAQ	2021-11-16 02:06:19.687118+06
wqz28kwp1hasig3n73zkwbjurdiwhncl	.eJxVjDsOwjAQBe_iGlkG1mZNSc8ZrP3YOIAcKU4qxN0hUgpo38y8l0m0zDUtPU9pUHM2e7P73ZjkkdsK9E7tNloZ2zwNbFfFbrTb66j5edncv4NKvX5rhiPEwkAaMkvw3gtFDYqFizp2HhCLHoIwCnIWCJnQnTxFLgHAm_cHFJg5Bg:1mnx7i:b3LqW8p7afgHN1ox5t8xd7uMnT4YXh91zB3JyTXg3eU	2021-12-03 12:11:46.302242+06
har98spvkogbv0ivruie3ikcyxvf56xe	.eJxVjDsOwjAQBe_iGlkG1mZNSc8ZrP3YOIAcKU4qxN0hUgpo38y8l0m0zDUtPU9pUHM2e7P73ZjkkdsK9E7tNloZ2zwNbFfFbrTb66j5edncv4NKvX5rhiPEwkAaMkvw3gtFDYqFizp2HhCLHoIwCnIWCJnQnTxFLgHAm_cHFJg5Bg:1mxkg0:86aPk4Zb9DDqmsiTvEjIWXeGdgi2_bTdmkDnThVxd7E	2021-12-30 12:55:40.278378+06
\.


--
-- Data for Name: faculty_t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty_t (cfacultyid, cdepartmentid) FROM stdin;
T001-00 TBA TBA	SLASS
3269-MR Zeeshan Abedin	SBE
3147-DR Rushdi Rezaur Razzaque	SBE
3244-DR Sajjad Hossain Bhuiyan	SBE
2152-DR Mahbub Alam	SLASS
2113-DR Manzurul Mannan	SLASS
2202-MS Afroza Sultana	SLASS
2194-MR Mohammad Mahfuzul Islam	SLASS
5182-MS Shohana Huq	SELS
2220-PROF Abdul Monim Chowdhury	SLASS
3195-MR Mohammad Ali Arafat	SBE
3135-MR Abul Bashar	SBE
3125-MR Momtaj Khanam	SBE
3159-BAR Sarah Hassan	SBE
3267-MR M. Redwan Hossain	SBE
3243-BAR Aysha Dawood Akhter	SBE
5169-DR Palash Kumar Sarker	SELS
5129-MR Khondkar Ayaz Rabbani	SELS
5177- Ms. Shahzerin Bashar	SELS
4201-MS Sameena Hossain	CSE
4137-MR Mohammad Noor Nabi	CSE
4142-MS Afroza Sultana	CSE
4234- Ms. Sinthia Shabnam Mou	CSE
4161-MR Subrata Kumar Dey	CSE
4233-MS Farhana Binte Sufi	CSE
2164-MR Mohammad Masud Chowdhury	SLASS
4171-Ms. Ms. Syeda Tonima Hadi	SLASS
2171-MS Fariya Hossain Khan	SLASS
2245-MS Aditi Ahmed	SLASS
2231-MS Humaira Bilkis	SLASS
2212-MS Sabrina Fatma Ahmed	SLASS
2157-MR Shams Bin Quader	SLASS
2236-MR Md. Sayem Alahi	SLASS
2211-MR Muntaser Rahman	SLASS
2213-MS Jessica Tartila Suma	SLASS
2195-MR Junaid Ahmed Halim	SLASS
2178-DR G. M. Shahidul Alam	SLASS
4194- Ms. Farhana Afroz	SLASS
4215-DR Ali Shihab Sabbir	CSE
3102-MR Aminur Rahman	SBE
3266-MS Tamanna Afreen Rimi	SBE
3226-DR Mohammad Osman Gani	SBE
4229-Ms. Ms. Tasnuva Ashrafee	EEE
4238- Mr. Golam Tangim	EEE
4231- Mr. Mohammad Rajiullah	EEE
4199-DR Feroz Ahmed	EEE
4237- Mr. Rezwanul Haque Khondaker	EEE
4190-DR Khosru Mohammad Salim	EEE
2126-MS Sayyeda-tun-Noor Sameera	SLASS
2136-MR Md. Shaiful Islam	SLASS
2221-DR Shamsad Moartuza	SLASS
2234-MS Naureen Rahnuma	SLASS
2235-MR Saifuz Zaman	SLASS
2239-MR Salma Rahman	SLASS
2001-MS Musharrat Hossain	SLASS
2002-MS Mithila Mahfuz	SLASS
2133-MS Saara Zabeen	SLASS
2225-MR Syed Badrul Ahsan	SLASS
2222-MR Mashrur Shahid Hossain	SLASS
2132-MS Rezina Nazneen Rimi	SLASS
2116-MR Haroonuzzaman	SLASS
2237-MS Ishrat Jahan	SLASS
2193-MS Syeda Tabassum Hayat	SLASS
2218-MS Shakila Nur	SLASS
5101-PROF Haroun Er Rashid	SELS
3249-MR S.M. Arifuzzaman	SBE
3175-MS Sylvana Maheen Ahmed	SBE
3223-MR Chowdhury Rajkin Mohsin	SBE
3239-MS Shawgat S. Kutubi	SBE
3184-MR Abdullah Al Aabed	SBE
2160-DR Rifat Rashid	SLASS
2143-MR Bipul Chandra Debnath	SLASS
3251-MS Farzana Chowdhury	SBE
3238-MR Zubair Ahmed Shimon	SBE
3154-MR Md Amlan Jahid Haque	SBE
4223- Mr. Md. Shariful Islam	PhySci
4119-MS Dr. Rifat Ara Rouf	PhySci
1163-MR Md. Mostafa Kamal	PhySci
4228-DR Habib Bin Muzaffar	PhySci
4124-DR Shipra Banik	PhySci
4222- Ms. Farzanaa Sultana	PhySci
4198-Mr. Md. Saifuddin Khalid	PhySci
3193-MR Hanif Mahtab	SBE
3228-MR Abu Bakar Emran Salahuddin	SBE
3130-MR Rumman Hasan	SBE
3263-MR Nawshad I. Naqueeb	SBE
3131-MR Md. Munir Hossain	SBE
3185-MR Mohammed Sohel Islam	SBE
3141-MR Md. Muzahid Akbar	SBE
2115-MR Nazir Ahmed	SLASS
2129-DR Talim Hossain	SLASS
4235- Ms. Fatema Tanjia	PhySci
4158-MR Dr. Farhad Alam	PhySci
V011- Dr. Zebun Nahar Ahmed	SLASS
2208-MS Tabassum Amina	SLASS
3247-MS Rehana Ismail (BBA Program Manager)	SBE
5167-DR Rita Yusuf	SELS
2114-DR Akimun Rahman	SLASS
3216-MR Samir Mainuddin	SBE
3260-BAR Ashikur Rahman	SBE
3275-PROF Muhammad Mahboob Ali	SBE
4221-DR AKM Baki	CSE
5186-DR Shahana Afrose Chowdhury	SELS
5102-PROF M Ali Hossain	SELS
4174- Ms.Sanzida Akhter	CSE
T007- Ms. Nadia Akhter Nitu	SLASS
T008- Ms. Abontee Mehtaj	SLASS
T009- Mr. Imtias Yasic	SLASS
T025- Mr. SK Rizve Hasan	SLASS
T010-DR Fahmidul Haque	SLASS
4164-Mr. Prof. Khodadad Khan	CSE
3268-DR A.K. Monaw-War Uddin Ahmed	SBE
3265-DR Syed Nayeemul Huda	SBE
4200-DR Shahriar Khan	EEE
T021- MS. Rumana Hossain	EEE
2106-MR Towhid Bin Muzaffar	SLASS
2247-MS Sumaiya Islam	SLASS
2243-MS Rukshana Habib	SLASS
2104-MR Syed Mazharul Islam	SLASS
T019- MS. Ishrat Jahan	SLASS
T013- Mr. Abdus Selim	SLASS
T023- Ms. Sanjana Shahnaj	SLASS
2240-MS Rafia Tahseen	SLASS
2229-PROF Razia Sultana Khan	SLASS
2166-PROF Niaz Zaman	SLASS
2209-MS Sifat-E- Azam	SELS
5179- Mr. Kazi Ahmed Kabir	SELS
5164- Rahat Bari Tooheen	SELS
5114-MS Dil Rowshan	SELS
5189-PROF M. Z. Abedin	SELS
5152-Mr. Prof. Zahurul Karim	SELS
5162-PROF Mohammad Lutfor Rahman	SELS
5183- Shampa Biswas	SELS
5504-DR Shah Ehsan Habib	SLASS
4122-MR Kazi Md. Abul Kalam Azad	SLASS
3225-DR Mohammad Abdur Rashid	SBE
3254-DR A.N.M. Shibly Noman Khan	SBE
3255-MR Mizanur Rahman	SBE
T020- Mr. Kafiul Islam	PhySci
4112-DR Mostafa Kamal	PhySci
T024- Ms. Rumana Hossan	PhySci
4102-DR Mohammed Anwer	PhySci
1274-DR Shoaib Ahmed	SBE
3232-DR Md. Zahidul Islam	SBE
5103-DR Nashid Kamal	SELS
2179-PROF Nazrul Islam	SLASS
2200-MS Sharmeen Ahmed	SLASS
2198-MS Mahbuba Dewan	SLASS
3152-DR Dilip Kumar Sen	SBE
V019-MR Md. Safayat Hossain	SBE
V021- Md. Musfique Rahman	SBE
2114-DR Akimun Rahman 2115-NazirAhmed	SLASS
V020-Mr. Barister Redwan Hossain	SBE
3149-DR Nadim Jahangir	SBE
4206-Mr. Prof. M. Abdus Sobhan	CSE
5192-Ms. Shahnoor Hasan	SELS
2250-MS Abonti Mehtaj	SLASS
2249-MS Nadia Akhter Nitu	SLASS
T035- Mr. Masihuddin Shaker	SLASS
T038- Ms. Tasneem Shahrukh	SLASS
2255-MS Momtaz Parvin Mumu	SLASS
T036- Mr. Philip Gain	SLASS
4241-DR Md. Ashraful Amin	CSE
4242-MR Prof. Farruk Ahmed	CSE
4242-MR Prof. Farruk Ahmed 4234-Ms. Sinthia Shabnam Mou	CSE
4206-Mr. Prof. M. Abdus Sobhan 4237-Mr. Rezwanul HaqueKhondaker	CSE
V008- Prof. Amin Muhammad Ali	SBE
T026-DR Khandakar Q. Elahi	SBE
4242-MR Prof. Farruk Ahmed 4229-Ms. TasnuvaAshrafee	EEE
4239-Ms. Rumana Hossain	EEE
2259-MR G. M. A Mainuddin Chowdhury	SLASS
2260-MS Andaleeb N. Chowdhury	SLASS
2242-MS Sarah A Zaman	SLASS
T041- Ms. Kazi Sunzida Lisa	SELS
5166-MR Ahmed Shahnewaj Chowdhury	SELS
T032- Ms. Nasreen Rafiq	SELS
T033- Mr. Farid Uddin Ahmed	SELS
T034- Proff. Shafiul H. Chowdhury	SELS
T039-PROF K.B. Sajjadur Rasheed	SELS
3229-DR Sarwar Uddin Ahmed	SBE
3284-MR Monzoor Murshed	SBE
4243-MR Jewel Kumar Saha	PhySci
4240-DR Kafiul Islam	PhySci
T031-PROF Prof. Ali Ahsan	SBE
V022- Mr. Zonaid Hossain	SBE
T044-Ms. Armeen Khan	SBE
V029-Mr. Soaib Ahmed	SBE
V028-PROF Mahbubur Rahman	SBE
V030-Ms. Tanzila Sarwar	SBE
V039-Mr. Safayet Hossain	SBE
2256-MR Nabil Ahmed	SLASS
V031-Ms. Samantha Christiansen	SLASS
V032-Mr. Faisal Dastagir	SBE
2174-MS Monami Haque	SLASS
2230-MR Anis Parvez	SLASS
V033-Mr. Minhaz Uddin Anwar	SLASS
V034-Mr. Khaled Muhiuddin	SLASS
3298-Mr. Shamil M Al-Islam	SBE
V025- Dr. Ashraf Uddin Chowdhury	SBE
V027- Dr. Khasruzzaman Chowdhury	SBE
V042-Ms. Sayeda Sanjida Islam	SLASS
V043-Mr. G. M. Moinuddin Chowdhury	SLASS
V044-Ms. Munira Nasreen Khan	SLASS
V045-MS Jackie Kabir	SLASS
V046-MR Mohammad Raihan Sharif	SLASS
2268-MR Md. Ziaul Karim	SLASS
V036-Ms. Hafiza Nilofar Khan	SLASS
5191-MS Kazi Sunzida Lisa	SELS
V040-Mr. Saquib Shahriar	SBE
3292-MR Parvez Ahmed Sharif	SBE
4226-MR Md. Asheque Imran	PhySci
4236-Mr. Gazi Md. Sharif	PhySci
V002- Dr. Osman H. Chowdhury	SBE
3287-MS Armeen Khan	SBE
2162-MR Abantee Harun	SLASS
T049-BAR Barrister Sajed A. Sami	SBE
TC28-Mr. Advocate Bhareen Khan	SBE
5142-DR Md. Abdul Khaleque	SELS
4160-Ms. Ishrat Jahan Quader	CSE
T045-Ms. Raisa Rasheeka	SLASS
4146-DR Zakir Hossain Raju	SLASS
2258-MS Tasneem Shahrukh	SLASS
3277-DR Amin Muhammad Ali	SBE
T051-DR Satyen Biswas	EEE
4200-DR Shahriar Khan 4226-Md. AshequeImran	EEE
4238- Mr. Golam Tangim 4240-KafiulIslam	EEE
4242-MR Prof. Farruk Ahmed 4238-Mr. Golam Tangim	EEE
4242-MR Prof. Farruk Ahmed 4137-Mohammad NoorNabi	EEE
4199-DR Feroz Ahmed 4237-Mr. Rezwanul HaqueKhondaker	EEE
4237- Mr. Rezwanul Haque Khondaker 4240-KafiulIslam	EEE
4244-Mr. Yasir Arafat	EEE
4244-Mr. Yasir Arafat 4240-KafiulIslam	EEE
4190-DR Khosru Mohammad Salim T001-TbaTba	EEE
4200-DR Shahriar Khan 4229-Ms. TasnuvaAshrafee	EEE
TC24-Ms. Lessa Khalid Islam	SLASS
TC25-Mr. Mehedi Kayser Pabitra	SLASS
TC27-Mr. Ziaul Karim	SLASS
2262-MS Hafiza Nilofar Khan	SLASS
T050-Ms. Shahima Islam	SELS
4206-Mr. Prof. M. Abdus Sobhan 4226-Md. AshequeImran	EEE
4200-DR Shahriar Khan 4240-KafiulIslam	EEE
4248-DR Satyen Biswas	EEE
5519-DR Nafisa Huq	SLASS
3299-MR Latiful Khabir	SBE
4247-Mr. A. N. M. Mushfiqul Haque	PhySci
4246-MS Proma Anwar Khan	PhySci
T047-Mr. John Christiansen	SLASS
T061-Mr. Shoaib Ahmed	SBE
3300-MR Saquib Shahriar	SBE
V054-MR Lutful Hasan	SBE
T055-Mr. Palash Kamruzzaman	SLASS
V061-PROF Abdul Momin Chowdhury	SLASS
T059-Ms. Rezwana Huq	SBE
V055-Mr. Tarafder Rafiqul Islam	SBE
T058-Mr. Sheikh Hafizur Rahman	SBE
4184-DR Mahady Hasan	CSE
4253-MR Mirza Mursalin Iqbal	CSE
4252-Ms. Ms.Nurunnahar Islam Mou	CSE
V058-Ms. Elita Karim	SLASS
T056-Ms. Tazeen Ahmed	SLASS
V059-Mr. Sayem Alahi	SLASS
V063-Ms. Rezai Karim Khondker	SBE
4226-MR Md. Asheque Imran 4226-Md. AshequeImran	EEE
4247-Mr. A. N. M. Mushfiqul Haque 4247-A. N. M. MushfiqulHaque	EEE
4212-DR Abdur Razzak	EEE
4229-Ms. Ms. Tasnuva Ashrafee 4229-Ms. TasnuvaAshrafee	EEE
4137-MR Mohammad Noor Nabi 4137-Mohammad NoorNabi	EEE
4253-MR Mirza Mursalin Iqbal 4242-Prof. FarrukAhmed	EEE
4252-Ms. Ms.Nurunnahar Islam Mou 4252-Ms.NurunnaharIslam Mou	EEE
4250-DR Asma Begum	EEE
V072-Ms. Noora Shamsi Bahar	SLASS
V073-Ms. Rukshana Habib	SLASS
V074-Ms. Shaila Shams	SLASS
V075-Mr. Mohammad Shamsuzzaman	SLASS
5199-Ms. Shahima Islam	SELS
5160-Mr. Shaqer R. Rashid	SELS
5101-PROF Haroun Er Rashid 5166-Ahmed ShahnewajChowdhury	SELS
5101-PROF Haroun Er Rashid 5191-Kazi SunzidaLisa	SELS
V084-Mr. Prof. Zainal Abedin	SELS
T057-Ms. Nadia A. Shams	SBE
4249-MS Shukti Sharita	PhySci
8975-MR Md. Rajib Rahman	SBE
T062-Mr. Mirza Ahsanul Hossain	SBE
5198-Ms. Nushrat Nazia	SELS
T066-MR Md. Didarul Alam	SBE
3297-MR Md. Shoaib Ahmed	SBE
2115-MR Nazir Ahmed 2114-AkimunRahman	SLASS
T067-Mr. Nurul Mozumder	SBE
3306-MS Rezwana Huq	SBE
3307-Mr. Tarafder Rafiqul Islam	SBE
T064-Mr. Abureza Mohammed Muzareba	SBE
T068-Mr. Sheikh Hafizur Rahman	SBE
T069-MS Qantara Khaleda Khan	SBE
2270-MS Raisa Rasheeka	SLASS
V089-Mr. Mahmud Hasan kayesh	SLASS
V090-Mr. Md. Minhaz Uddin	SLASS
T065-Ms. Mithila Farzana	SLASS
T070-Mr. SK. Tanjeeb Islam	SBE
T071-Mr. N.N. Tarun Chakraborty	SBE
V087- Dr. Khashruzzaman Choudhury	SBE
2275-MS Shaila Shams	SLASS
T015-2283 Mr. Golam Rabbani	SLASS
T075-Mr. Mohammad Shamsuzzaman	SLASS
T016- Ms. Nabila Haque	SLASS
T072-Ms. Silvia Akter	SBE
T076-MS Zainab Lutfun Nahar	PhySci
T077-Mr. Munawwar Mahmud Sohun	PhySci
T074-MR Salahuddin Ahamed	SBE
V094-Mr. Suman Saha	SBE
T080-Ms. Nimita Farzeen Azam	SBE
T081-Ms. Sabina Yesmine	SBE
T082-Mr. Parvez Mia	SBE
T083-Mr. Md. Badruzzaman Bhuiyan	SBE
2277-MR Palash Kamruzzaman	SLASS
T084-Ms. Nadia Bashnin	SBE
3333-Mr. A.F.N. Mainul Ahsan	SBE
5203-Mr. Mr. Rafiqul Islam	SELS
2278-MS Tazeen Ahmed	SLASS
2284-MR Azizul Islam Bhuiyan	SLASS
T079-Mr. Rezaur Rahman Khan	SLASS
3305-DR Rezai Karim Khondker	SBE
4259-MR Md. Shoaib Shahriar	EEE
4258-MS Fatima Binte Zia	EEE
2276-MS Noora Shamsi Bahar	SLASS
T089-Mr. Ahmed Shamim	SLASS
T078-Mr. Dr. Tareq Bin Yusuf	SELS
T090-Mr. Mohammed Ataur Rahman	SLASS
T086-Mr. Dewan Jahidul Hasan	SBE
T087-Ms. Elma Zahir	SBE
4257-Mr. K M Ariful Kabir	PhySci
T088-Mr. Abul Khair Jyote	SBE
3330-MS Sabina Yesmine	SBE
T108-Mr. Maqbul Quraisi	SBE
T093-MR Mohammad Fahad Noor	SBE
T092-Mr. Syed Abdullah Al Mamun	SBE
V086-Mr. Dr. Md. Mahbubur Rahman	SBE
T109-Mr. Tonmoy Toufic Chowdhury	SBE
T110-DR Sadid A. Nuremowla	SLASS
T100-Mr. Jahid Hasan	SBE
T095-Mr. Prof. Mahboob Ali	SBE
T104-DR M.H. Rahman	SELS
5212-MR Chowdhury Kamrul Hasan	SELS
5213-MR Syed Abu Shoaib	SELS
4260-Mr. Farasatul Adnan	CSE
4261-Ms. Nitu Syed	CSE
T112-MR AKA Reza Ghalib	SLASS
V103-Mr. Mr. Reaz Ahmad	SLASS
T098-Mr. Vashkar Abedin	SLASS
T096-Mr. Dr. AJM Shafiul Alam	SLASS
T097-Mr. Ozair Ibne Omar	SLASS
T099-Mr. Helal Uddin	SBE
5208-MR Abdul Baten	SELS
5207-MR Tanvir Ahmed Haroon	SELS
3328-MS Elma Zahir	SBE
3329-MR Abul Khair Jyote	SBE
V093-Prof. Prof. A. I. Mahbub Ahmed	SLASS
T111-MS Farhana Kadir	SLASS
T127-Ms. Nusrat Farah	SBE
T118-DR N.H. Abul Mansur	SLASS
T126-MS Ms. Shahzia Rashid Chowdhury	SBE
T128-MR Iftekhar Mahfuz	SBE
T129-Ms. Nusaibah Alam	SBE
T130-Mr. Tapas Kumar Paul	SBE
T114-Mr. Mohammed Moin U Hasan	SLASS
T115-MS Naila Azad Nupur	SLASS
T116-Mr. S.M. Sumon	SLASS
T131-Ms. Nusrat Jahan	SBE
2292-MS Tanzeel Chowdhury	SLASS
2283-MR Golam Rabbani	SLASS
2291-MS Roksana Akhter Rupee	SLASS
T120-Mr. Abdullah Al Mamun	SLASS
T117-Mr. Momena Khatun Mimi	SLASS
T121-Ms. Farjana Hafsa	SLASS
TC33-Mr. M. Forkan	SELS
5213-MR Syed Abu Shoaib 5208-AbdulBaten	SELS
5101-PROF Haroun Er Rashid 5102-M AliHossain	SELS
2286-MR Mohammed Ataur Rahman	SLASS
T132-Ms. Sabin Rahman	SBE
T133-Ms. Sadia Haque	SBE
V070-MR Farazul Haque Bhuiyan	SBE
T122-MR Sumon Saha	SBE
2165-PROF A. I. Mahbub Uddin Ahmed	SLASS
3347-MR Maqbool Kader Quraishi	SBE
3355-MS Nusrat Farah	SBE
T150-MS Riaheen Farzana	SBE
2113-DR Manzurul Mannan 2152-MahbubAlam	SLASS
3353-Ms. Ms. Nusaibah Alam	SBE
3354-MS Sadia Haque	SBE
3357-MR Tapas Kumar Paul	SBE
5215-DR M. H. Rahman	SELS
T156-MR Saumya Biswas	CSE
T157-Ms. Ifana Mahbub	CSE
T158-MR Sameer Ahmed Khan Majlish	CSE
2154-MR Philip Gain	SLASS
2281-MR Mahmud Hasan Kayesh	SLASS
T152-Mr. Mr. AKA Reza Ghalib	SLASS
T155-MR Mahbub Murshed	CSE
3356-Ms. Ms. Nusrat Jahan	SBE
5209-MR Abdul Baten	SELS
T113-MR Faizul Latif Chowdhury	SBE
V106-MR S. Aminul Islam	SLASS
T168-MR Molla Ehsanul Majid	SBE
T161-MR Mahbub-E- Farid	SBE
8950-DR Mahbub Murshed	CSE
T166-MR Md. Mostafizur Rahman	SLASS
T163-MR Ratan Kumar Paul	SLASS
T167-MR Khawaja Saifur Rahman	SBE
T169-MR Jamil Sayed	SBE
4264-MR Sameer Ahmed Khan Majlish	EEE
2265-MS Jackie Kabir	SLASS
T164-MS Fariah Hassan	SLASS
T162-MS Nusrat Jareen Ahmed	SELS
5101-PROF Haroun Er Rashid 5162-Mohammad LutforRahman	SELS
T165-MS Samia Aziz	SLASS
4263-MR Saumya Biswas	PhySci
V092-PROF Prof. S. Aminul Islam	SLASS
T174-MR Naheem Mahtab	SBE
T175-MS Tahmina Ahmed	SBE
V108-PROF Helal Uddin Khan S. Arefin	SLASS
6002-MR Syed A. K. Shifat Ahmed	SELS
6008-MR Md. Monirujjaman	SELS
6001-MS Mariz Sintaha T185-TasnimulFerdous	SELS
6006-MR Ahsan Habib Polash T184-Mahina TabassumMitul	SELS
3358-MR Mr. Iftekhar Mahfuz	SBE
T176-MR Iftekhairul Islam	SBE
T177-MR Mushfique Ahmed	SELS
T177-MR Mushfique Ahmed 5203-Mr. RafiqulIslam	SELS
5215-DR M. H. Rahman 5203-Mr. RafiqulIslam	SELS
5142-DR Md. Abdul Khaleque 5203-Mr. RafiqulIslam	SELS
5169-DR Palash Kumar Sarker 5203-Mr. RafiqulIslam	SELS
T178-MR Zahed-Ur- Rahman	SLASS
3288-MR Shahnoor Wahid	SLASS
T187-MR Shariful Islam	SLASS
V109-DR Shafiq Rahman	SLASS
T160-MR Muhammad Zamir	SLASS
T153-MR Syed Ali Haider Rizvi	SLASS
T188-MR Rafi Mohammad	SLASS
3370-MR Jamil Sayeed	SBE
3369-MR Khawaja Saifur Rahman	SBE
T171-DR Samiul Parvez Ahmed	SBE
4183-DR M. Rokonuzzaman	EEE
T189-MS Ms. Sadra Nishwar Siddiky	SLASS
T190-MR Mr. Md. Ali Rezwan Talukdar	SLASS
T179-MR Debashish Biswas	SLASS
V115-BAR Mohammad Hafijul Islam Khan	SELS
5101-PROF Haroun Er Rashid 5102-M AliHossain 5162-Mohammad LutforRahman 5189-M. Z.Abedin	SELS
5528-MS Samia Aziz	SLASS
T183-MS Naureen Khan	SBE
T181-DR Sardana Islam	SBE
T182-MR Md. Nazmus Shakib	SBE
T191-DR Dr. A B M Shahdat Hossain	PhySci
6007-MS Zajeba Tabashum 6005-NazratanNaeem	SELS
6009-DR Ashrafus Safa	SELS
3318-MR Suman Prosad Saha	SBE
2307-MR Obydullah Al Marjuk	SLASS
T193-MR Mr. Showvonick Datta	SBE
T199-MR Mr. Iftear Ahmed Chowdhury	SBE
3377-MS Tahmina Ahmed	SBE
3286-MR Md. Safayat Hossain	SBE
3381-MR A. K. M. Anisuzzaman	SBE
3376-MR Naheem Mahtab	SBE
3295-PROF Mahbubur Rahman	SBE
3386-MS Farahnaz Mehrin Quader	SBE
3380-MR Ahmed Ataul Hakeem	SBE
2161-PROF Helal Uddin Khan S. Arefin	SLASS
6001-MS Mariz Sintaha	SELS
6006-MR Ahsan Habib Polash 6011-Ms. Mahina TabassumMitul	SELS
6005-MS Nazratan Naeem 6010-TasnimulFerdous	SELS
3384-MR Hasibul Alam Chowdhury	SBE
3378-MR Iftekhairul Islam	SBE
4265-DR A.B.M. Shahadat Hossain	SBE
3319-MR Salahuddin Ahmed	SBE
3379-DR Abul H. Azam	SBE
3383-MR Zeeshan Mohsen	SBE
5217-MR Musfique Ahmed	SELS
5222-MS Nabila Rahman	SELS
4232-MR Syed Mahfuz Ahmed	CSE
4219-MR Mosharraf Hossain	CSE
2299-MS Naila Azad Nupur	SLASS
2295-MR AKA Reza Ghalib	SLASS
2316-MR Rafi Mohammad	SLASS
4251-MR Md. Raihan Bin Rafique	EEE
2322-MS Shaheen Ara	SLASS
2311-MR Debashish Biswas	SLASS
2323-MS Shahnaj Sultana Kaisar	SLASS
2309-MS Fariah Hassan	SLASS
2224-MR Asifur Rahman	SLASS
2324-MR Kazi Ashraf Uddin	SLASS
5212-MR Chowdhury Kamrul Hasan 5203-Mr. RafiqulIslam	SELS
5102-PROF M Ali Hossain 5142-Md. AbdulKhaleque 5162-Mohammad LutforRahman 5189-M. Z.Abedin	SELS
3344-MR Mohammad Fahad Noor	SBE
3372-DR Samiul Parvez Ahmed	SBE
3143-DR Sardana Islam Khan	SBE
3374-MR Md. Nazmus Shakib	SBE
3375-MS Naureen Khan	SBE
3385-MR Rashedur Rahman	SBE
4255-MS Zainab Lutfun Nahar	PhySci
6007-MS Zajeba Tabashum	SELS
3382-MR Mahmud Zubayer	SBE
3362-MS Riaheen Farzana	SBE
3394-MS Rumana Ahmed	SBE
3402-MR Mohammad Monirul Islam	SBE
1107-MR Lutful Hasan	SBE
2326-MR Maidul Alam Chaklader	SLASS
6011-MS Ms. Mahina Tabassum Mitul	SELS
6010-MS Tasnimul Ferdous	SELS
6006-MR Ahsan Habib Polash	SELS
2115-MR Nazir Ahmed 2115-NazirAhmed	SLASS
3401-MR Iftear Ahmed Chowdhury	SBE
3397-DR Mohammed Kamrul Hasan	SBE
4267-MR Md. Rakibul Alam	CSE
4266-MS Shabnam Shahreen Sifat	CSE
2310-MR Md. Mostafizur Rahman	SLASS
2302-MR Ratan Kumar Paul	SLASS
2328-MR Md Harisur Rahman	SLASS
2308-MR Syed Ali Haider Rizvi	SLASS
2205-DR A.S.M. Asaduzzaman	SLASS
2318-MR Khaled Md Shariful Islam	SLASS
2331-MS Tazin Ahmed	SLASS
2333-MS Khadiza Akhter	SLASS
2332-MS Fatina Sarwar	SLASS
2329-MS Raina Abu Zafar	SLASS
2330-MR Md. Nurul Anwar	SLASS
5224-MS Rayana Rahman	SELS
5531-DR S M Raysul Haque	SELS
5530-DR Shabareen Tisha	SELS
5219-BAR Mohammad Hafijul Islam Khan	SELS
5101-PROF Haroun Er Rashid 5142-Md. AbdulKhaleque 5162-Mohammad LutforRahman 5189-M. Z.Abedin	SELS
5142-DR Md. Abdul Khaleque 5142-Md. AbdulKhaleque 5162-Mohammad LutforRahman 5189-M. Z.Abedin	SELS
2334-MR Jeremy Lechartier	SLASS
5532-MS Tarzia Choudhury	SLASS
3396-MR Shah Ridwan Chowdhury	SBE
3403-MR Awal Al Kabir	SBE
3400-MR Md. Harun Ur Rashid	SBE
4268-MS Suriya Begum	PhySci
3398-MR Mohammad Abdur Rod Dewan	SBE
3399-MR Md. Monirujjaman	SBE
9007-MR Rajmoni Singha	SLASS
3405-MS Sumita Das	SBE
3404-MR Md. Aynul Hoque	SBE
3409-MR Mohammad Tanvir Sarwar	SBE
5222-MS Nabila Rahman 5203-Mr. RafiqulIslam	SELS
4213-MR Khaled Mahmud Sujan	CSE
2340-MR Mahmood Menon Khan	SLASS
4272-MR Javed Hossain	CSE
4271-MR Md.Shariful Islam	CSE
3421-MS Anita Fairuz	SBE
3410-MS Tasneem Bareen Hasan	SBE
3303-DR S. M. Ikhtiar Alam	SBE
3341-DR Chowdhury Saleh Ahmed	SBE
4261-Ms. Nitu Syed 4212-AbdurRazzak	EEE
4259-MR Md. Shoaib Shahriar 4200-ShahriarKhan	EEE
2336-MS Camellia Ahmed	SLASS
2337-MS Shatabdi Dasgupta	SLASS
2254-MR Abdus Selim	SLASS
5225-DR Md. Nadiruzzaman	SELS
5142-DR Md. Abdul Khaleque 5142-Md. AbdulKhaleque 5162-Mohammad LutforRahman 5189-M. Z.Abedin 5215-M. H.Rahman	SELS
5142-DR Md. Abdul Khaleque 5162-Mohammad LutforRahman	SELS
3395-MR G. M. Wali Ullah	SBE
3416-MR Syed Asif Hossain	SBE
3412-MR Ramjanul Ahsan	SBE
3413-MR Shafiqul Alam	SBE
3411-MS Asma Banu	SBE
3414-MR Arif Rana	SBE
3406-MS Zakia Binte Jamal	SBE
4269-DR Mohammed Nazrul Islam KHan	PhySci
4270-MR Sajal Chandra Mazumder	PhySci
3427-MS Nimat Zarin	SBE
3338-MR Mohammad Badruzzaman Bhuiyan	SBE
2289-DR Sadid A. Nuremowla	SLASS
6014-MR Md. Habibur Rahaman	SELS
2348-MR Imran Firdaus	SLASS
3359-MS Shahzia Rashid Chowdhury	SBE
3310-MR Mirza Ahsanul Hossain	SBE
2350-MR Syeed Zayadul Ahsan	SLASS
4273-MR Sarwar Shahidi	CSE
3430-MR Amin Masud Ali	SBE
3425-MR Moin Uddin Ahmed	SBE
4276-MS Shougat Nazbin Khan	EEE
4275-MS Tahsin F. Ara Nayna	EEE
4274-MS Saila Ishrat Annie	EEE
2343-MS Nusrat Jahan Jyote	SLASS
2342-MS Nasima Haider	SLASS
2344-MS Nadira Sultana Mirza	SLASS
2345-DR Mian Md. Naushaad Kabir	SLASS
2347-MS Nazua Idris	SLASS
2219-MR Md. Ziaul Karim	SLASS
2346-MR Md. Nesar Uddin	SLASS
3429-MS Jesmin Mannan	SBE
2335-MS Parsa S. Sajid	SLASS
2338-MR Liton Chandra Biswas	SLASS
4277-DR Md. Hanif Murad	PhySci
6013-MS Noshin Azra Rahman	SELS
6010-MS Tasnimul Ferdous 6007-ZajebaTabashum	SELS
3323-MS Qantara Khaleda Khan	SBE
3428-MS Nazmunnessa Mahtab	SBE
3426-MS Zarin Zeba Khan	SBE
3424-MR Abu Sayeed Arif	SBE
3423-MR Arifur Rahman Khan	SBE
3438-MR Md. Tapan Mahmud	SBE
3439-MR Sajal Kumar Dey	SBE
3440-MR Afzal Hossain	SBE
3417-MS Asma Banu	SBE
6017-MS Safinaj Arju Ara Alam	SELS
6016-MR Mohammed Mahboob Morshed	SELS
2351-MR Mohammad Sajjadur Rahman	SLASS
3441-MR Chinmoy Das Gupta	SBE
3451-MR S. M. Khaiurul Islam	SBE
3442-MR Anwar Zahid	SBE
3443-MS Anika Nasir	SBE
3444-DR Ikramul Hasan	SBE
5537-MR Siddhartho Shekhar Paul	SELS
5536-MS Karishma Sinha	SELS
4282-MR Ahammed Ullah	CSE
4280-MS Nujhat Nahar	CSE
4283-MS Sarifa Sultana	CSE
2327-DR ASM Asaduzzaman	SLASS
2287-MR Reaz Ahmed	SLASS
2359-MR Shaikh Nazrul Islam	SLASS
2358-MS Fatema Amin	SLASS
2341-MS Syeda Sakina Mumtaz Huq	SLASS
3452-MR Jamal Hossain	SBE
3453-MR Rezwanul Haque	SBE
3454-MR Salauddin Tauseef	SBE
2354-MR Ahmed Shamim	SLASS
2352-MR Mehedi Kayser Pabitra	SLASS
2353-MR A. T. M. Sofiul Azam	SLASS
2355-MR Sohel Rana	SLASS
2356-MS Ruksana Islam	SLASS
2357-MR Mohammad Israil Hoque	SLASS
4279-MR Muhammad Morshed Alam	EEE
3445-MS Sonia Mallick	SBE
3446-MS Bushra Sanjana	SBE
3447-MR Mohammed Kamruzzaman	SBE
3448-MR Mehadi Mansur	SBE
2339-MS Nahid Sultana Jenny	SLASS
4281-MR Md. Alfaz Hossain	PhySci
6015-MS Kazi Sabrina Afreen	SELS
3449-MS Nafiza Islam	SBE
3450-MR Jamil Siddique	SBE
2321-DR Zahir Uddin Ahmed	SLASS
4146-DR Zakir Hossain Raju 2270-RaisaRasheeka 2348-ImranFirdaus	SLASS
6006-MR Ahsan Habib Polash 6006-Ahsan HabibPolash	SELS
6016-MR Mohammed Mahboob Morshed 6016-Mohammed MahboobMorshed	SELS
6018-MR Md. Moinul Islam	SELS
2115-MR Nazir Ahmed 2348-ImranFirdaus	SLASS
3462-MS Sariat Rafa Khan	SBE
3465-MS Kashfia Ameen	SBE
3470-MR Abdullah Al Mamun	SBE
3466-MS Tasmia Ekram	SBE
4285-DR Ferdows Zahid	CSE
2367-DR Salehuddin Ahmed	SLASS
4295-MR Aunnoy K Mutasim	CSE
2317-MR Shafiqur Rahman	SLASS
2327-DR ASM Asaduzzaman 2213-Jessica TartilaSuma	SLASS
2278-MS Tazeen Ahmed 2348-ImranFirdaus	SLASS
3463-MR Md. Kamrul Islam	SBE
3461-MS Mumtahina Islam	SBE
3467-MS Nabila Maruf	SBE
4286-DR Mustafa Habib Chowdhury	EEE
2362-MS Sakira Islam	SLASS
2365-MS Mehtaz Islam Salauddin	SLASS
2366-MS Tahmina Ferdous	SLASS
2363-MR Md. Jamal Hossain	SLASS
2364-MS Fariah Hassan	SLASS
4287-MR Ali Ashraf Molla	EEE
3468-MS Sumaya Zesmin	SBE
3469-MR Habibullah Bahar	SBE
4289-MS Shanta Deb	PhySci
4292-MR Nizhum Rahman	PhySci
4291-MR Sheikh Rufsan Reza	PhySci
4290-MR Abul Fazal Mahmudunnabi	PhySci
4288-DR Mohammad Forhad Uddin	PhySci
4293-MS Roushanara Begum	PhySci
4294-MR Milon Kundar	PhySci
2371-MR Md. Saimum Parvez	SLASS
6022-MS Shaila Eamen	SELS
6021-MR Md. Moyen Uddin PK	SELS
2370-MS Shamima Nasreen	SLASS
3473-MS Alima Akter	SBE
3474-MR Mir Mujibur Rahman	SBE
5540-MR Zoheb Mahmud Khan	SELS
2373-MS Mahmuda Sikder	SLASS
2206-MR Manzare Haseen Marud	SLASS
2372-MS Shameema Binte Rahman	SLASS
4297-MR M. Ishtiaque Rahman	EEE
4296-MR Sajib Chakraborty	EEE
2369-MS Katy McAlary	SLASS
5541-MR Syed Masud Reza	SELS
3476-MR K. M. Rohan Ahmed	SBE
4300-MR Md. Rezwan Ahmed Fahim	PhySci
4299-MR Shohel Ahmed	PhySci
6020-MS Syeda Farhana Afroz	SELS
1597-MR Mustafa Zaman Abbasi	SLASS
4298-DR Mohammad Jellur Rahman	PhySci
3478-MR Md. Safiuddin	SBE
2377-MS Unaiza Harris	SLASS
6024-MR Ornob Alam	SELS
3479-MS Zaima Ahmed	SBE
3486-MR Hasan Md. Mahmood Ul Haque	SBE
2382-MS Raiyana Rahman	SLASS
2381-MS Sharjita Islam	SLASS
2380-MR Showkat Hossain Masum	SLASS
4317-MR Siddiqur Rahman	CSE
3480-MS Murshed Jahan	SBE
4307-MS Wahida Taskin Bhuiyan	EEE
2375-MR Iqbal-e_ Rasul	SLASS
3481-MRS Shormina Jahan	SBE
2376-BAR Md. Abdul Halim	SLASS
2374-MR Ahmed Ehsanul Kabir	SLASS
4314-MR G.M. Fahad Bin Mostafa	PhySci
4313-MR Md. Rabiul Awal	PhySci
4312-MS Purobi Rani Kundu	PhySci
4318-MS Tahmina Tabassum	PhySci
4316-MS Faizunnesa Khondaker	PhySci
4315-MR Mir Shariful Islam	PhySci
4310-PROF Md. Abu Naim Sheikh	PhySci
4311-DR Md. Shafiqul Islam	PhySci
4308-PROF Laek Sazzad Andallah	PhySci
4309-PROF Md. Shafiqul Islam	PhySci
3482-MS Siffat Shabnam	SBE
3485-MS Farzana Yasmin	SBE
3483-DR Md. Atiqul Islam	SBE
3484-MR Zubayer Zakir Khan	SBE
4320-MR Md. Sazzad Hossain	PhySci
4319-MR Bablu Chandra Das	PhySci
2378-MR Nazmul Huda	SLASS
3493-MR Ashraful Arefin	SBE
2389-DR Ranjan Saha Partha	SLASS
6024-MR Ornob Alam 5167-RitaYusuf	SELS
6026-MR Kaif Rashid Khan	SELS
2388-DR Lutfor Rahman	SLASS
5231-MR Saquib Ahmad Khan	SELS
5230-MR Md. Ekhtekharul Islam	SELS
2390-MR Sourav Banerjee	SLASS
2383-MS Shobnam Azim	SLASS
4329-MR Ashish M. Hossain	CSE
3489-MS Fahmida Islam	SBE
3490-MS Nuzhat Sharmeen	SBE
3491-MS Nuren Nirvana Brishti	SBE
3494-DR Md. Shahnawaz Karim	SBE
4321-MR Emranul Haque	EEE
2385-MS Nazah Farhat	SLASS
2386-MR Saleheen Ahmed	SLASS
5232-MS Shahreen Muntaha Nawfee	SELS
5508-DR Dipak Kumar Mitra	SPPH
2391-MS Nabila Tahsin Farah 2341-Syeda Sakina MumtazHuq	SLASS
4325-MR Nur Elahi Razin	PhySci
4322-PROF Nilufar Farhat Hossain	PhySci
4323-DR Taposh Kumar Das	PhySci
4324-MR Fokhruz Zaman	PhySci
6025-MS Sabrin Bashar	SELS
6027-MS Shakila sultana	SELS
5167-DR Rita Yusuf 5167-RitaYusuf	SELS
3492-MS Nusrat Jahan	SBE
4327-MS Amrita Khan	PhySci
4326-MS Nilima Jannat	PhySci
3503-MS Faria Islam	SBE
6032-MR Zain Omar Ali	SELS
6029-MS Afreen Zaman Khan	SELS
6030-MS Babry Fatema	SELS
6031-MS Sarah Sarker	SELS
6029-MS Afreen Zaman Khan 6029-Afreen ZamanKhan	SELS
2398-MR Sayed Abu Touab Shakir	SLASS
4330-MR AKM Monzurul Islam	CSE
4331-MS Sabrina Alam	CSE
2393-MS Janina Islam Abir	SLASS
2395-MR Imran Hossain	SLASS
2396-MR Md. Mahmoodor Rahman	SLASS
2394-MS Priyanka Khan Hamid	SLASS
2252-DR Fahmidul Haq	SLASS
4301-MR Ahmed Adeeb Sultan	CSE
4335-MR Md. Shahadet Hossain	CSE
4332-DR Moinul I. Zaber	CSE
4333-MR Abul Al Arabi	CSE
4336-DR Amin Ahsan Ali	CSE
4334-MR Sanad Saha	CSE
4337-MR Md. Saeed Siddik	CSE
4302-MR Md. Mehedee Hasan	CSE
4338-PROF M Arshad Momen	CSE
4339-MR Riasat Islam	CSE
4343-MS Sushmita Joardar	EEE
4344-MS Subaha Mahmuda	EEE
4342-MS Annatoma Arif	EEE
4345-MS Shagorika Mukherjee	EEE
4278-MR Saurav Das	EEE
5235-DR Mohammad Feisal Rahman	SELS
4341-DR Khondokar Habibul Kabir	EEE
2401-MRS Shahnaz Mita	SLASS
2391-MS Nabila Tahsin Farah	SLASS
4346-MR Md Rezaul Islam	PhySci
4347-PROF Md. Abdul Bari Mia	PhySci
6033-DR Jebunnahar Khandakar	SELS
6028-MS Kazi Naziba Tahshin	SELS
2404-MR Shohail Rayhan Muhammad Tarek	SLASS
3511-MS Susmita Mandal	SBE
3514-MR Hasib Reza	SBE
2403-MR Mohammad Masud Rana	SLASS
5236-DR Mohammad Sorowar Hossain	SELS
5238-DR Mohammad Abdus Salam	SELS
6035-MS Tasmia Farzana	SELS
5167-DR Rita Yusuf 6029-Afreen ZamanKhan	SELS
3507-MS Niyonta Islam	SBE
3512-MR Kazi Md. Jamshed	SBE
3508-MR K.M. Nasiruddin	SBE
4348-MR Md. Abu Sayed	CSE
4350-MR Shibbir Ahmed	CSE
4349-MS Shama Hoque	CSE
3509-MS Rafiu Ibrahim	SBE
3510-MR Taswar F. Rahman	SBE
4352-MS Zaima Tasneem	EEE
4353-MS Maria Moosa	EEE
4359-MR Md. Ahsan Kabir	EEE
4351-MS Navila Rahman Nadi	EEE
2402-MS Shahnaz Akhter	SLASS
2408-MS Rumana Amin	SLASS
2407-MS Sayeeda Sharmin	SLASS
2406-MS Mehnaz Tabassum	SLASS
2409-MS Sanjida Akhter	SLASS
2411-MS Lameya Alma Amin	SLASS
2410-DR Numair Choudhury	SLASS
2405-MS Jasmine Ferdous	SLASS
5237-DR SharifAhmed Mukul	SELS
5239-DR Zubair Hasan	SELS
2392-PROF Imtiaz A. Hussain	SLASS
5551-DR Khandaker Ezazul Haque	SPPH
5557-MR Hasnain Sabih Nayak	SPPH
4358-MR Mustafa Mohammad Shaky	PhySci
4354-PROF Nirmal Kanti Mitra	PhySci
5167-DR Rita Yusuf 6013-Noshin AzraRahman	SELS
6013-MS Noshin Azra Rahman 5167-RitaYusuf	SELS
3515-MR M. Redwan Zinan Siddiqui	SBE
3513-PROF Dr. Aminul Karim	SBE
2397-DR Shahnaz Nasrin	SLASS
4355-DR Muhammad Rakibul Islam	PhySci
4356-MR Md. Mijanur Rahman	PhySci
4357-MR Andalib Nizam	PhySci
2415-MS Sharmi Barua	SLASS
6038-MS Fairooj Naina Rashid	SELS
6024-MR Ornob Alam 6029-Afreen ZamanKhan 6032-Zain OmarAli	SELS
3525-MS Afnan Ashfaque	SBE
3524-MS Isma Khan	SBE
3527-MR Nafiz Ul Fahad	SBE
3528-MR Md. Mamunur Rashid	SBE
5240-MS Sadeka Tasmin	SELS
4366-MR Rayhanul Islam	CSE
4367-DR Syed Hasibul Hassan	CSE
4368-DR Md Kamrujjaman	CSE
4365-DR M Asif Hossain Khan	CSE
4362-MR Bijoy Rahman Arif	CSE
4364-DR Razib Hayat Khan	CSE
3523-MS Ambreen Khan	SBE
4361-MR Shovasis Kumar Biswas	EEE
4360-MR Mohammad Nasfikur Rahman Khan	EEE
2418-MR Md. Ashikuzzaman	SLASS
1105-MR Kamal Uddin	SLASS
2417-MR Mohammad Serajuddin	SLASS
5558-DR Mamtaz Mariam Asha	SPPH
2379-DR Rezaul Haque	SBE
4370-MS Tasnim Mafiz	PhySci
4369-MS Yasmin Akter	PhySci
6010-MS Tasnimul Ferdous 6009-AshrafusSafa	SELS
3526-MR Md. Golam Kibria	SBE
5559-MR Kuhel Faizul Islam	SPPH
2399-DR Sheikh A. Baten	SLASS
2207-MR S. Aminul Islam	SLASS
2422-MR Md. Mujibul Anam	SLASS
2420-MS Saba Nuzhat	SLASS
2419-PROF Prashanta Tripura	SLASS
6045-MR Sumaiya Afrin Soha	SELS
6044-MS Najath Quamrul Anam	SELS
6042-DR M Kabir Uddin	SELS
6043-MS Shaila Haque	SELS
6029-MS Afreen Zaman Khan 5167-RitaYusuf	SELS
2427-MR Shaikh Mahfuzur Rahman	SLASS
3538-MR Md. Shah Ridwan Chowdhury	SBE
3534-DR Md. Abdus Salam Akanda	SBE
5243-DR Naima Sharmin	SELS
5244-DR Mohammad Ismail	SELS
4372-MS Radiah Haque	CSE
4373-MS Romasa Qasim	CSE
4374-MR Wahidul Hasan	CSE
4375-MR Mustafa Nizamul Aziz	CSE
4371-MS Sadia Sharmin	CSE
4381-MR Mohammed Shafiul Alam Khan	CSE
4376-MR Sanzar Adnan Alam	CSE
2425-MS Saira Nazneen Ahsan	SLASS
2426-MR Nurulla Patwary	SLASS
5245-DR Md Tanvir Ahmed Chowdhury	SELS
5242-DR Ferdous Ahmed	SELS
5560-DR S.M. Yasir Arafat	SPPH
2432-DR Md. Nazmuzzaman Bhuiyan	SLASS
2429-DR Borhan Uddin Khan	SLASS
2433-DR Md. Mahbubur Rahman	SLASS
2428-DR Md Parvez Sattar	SLASS
6040-MS Sadika Rahman	SELS
6041-MS Deena Mehjabeen	SELS
6033-DR Jebunnahar Khandakar 6002-Syed A. K. ShifatAhmed	SELS
2424-MS Samia Hemayet Diba	SLASS
4378-DR Md. Readul Mahmud	PhySci
4377-MR Md Akhlak Bin Aziz	PhySci
4379-MR Md. Imam Hossain	PhySci
2421-DR M. A. Matin	SLASS
3541-MR Rezwanul Mumtahin Husain	SBE
3553-MS Roksana Aktar	SBE
2444-MS Ibtesum Afrin	SLASS
2443-MS Tazin Rahman Ananya	SLASS
2442-MS Mushfeqa Islam	SLASS
6049-DR Syed Saleheen Qadri	SELS
2446-DR Muhammad Shajjad Ahsan	SLASS
3540-MR Masnoon Salehin	SBE
3539-MR SM Yusuf Mallick	SBE
3545-DR Mohammad Osman Gani	SBE
3544-MR Mina Mahbub Hossain	SBE
5252-DR Sadia Nazneen Karobi	SELS
5248-MS Tahmina Sultana	SELS
2441-MS Refat Ara Jerin	SLASS
4389-MR Mohammad Shibli Kaysar	CSE
4382-DR Tarem Ahmed	CSE
4383-DR Faisal Uddin	CSE
4390-MS Afra Nawar Kabir	CSE
2439-MR Adilur Rahman	SLASS
2438-MS Israt Taslim	SLASS
2440-MS Vikarun Nessa	SLASS
2447-MS Anika Shah	SLASS
5575-MR M. Manzurul Hassan	SELS
5247-DR Tawhid Monzur	SELS
5249-DR Md. Amin Uddin Mridha	SELS
5250-DR Md. Nasir Uddin	SELS
5251-DR A.N.M. Fakhruddin	SELS
2448-MS Gulshan Ara	SLASS
2436-MS Zerine Tanzim	SLASS
2437-MR Hossain Ahmed Taufiq	SLASS
5576-MS Natasha Khurshid	SPPH
5578-MR Imam Nahil	SPPH
5579-DR Shafiul Islam	SPPH
3550-DR Farhana Ferdousi	SBE
3548-MS Papia Sultana	SBE
2445-MR Md Abdul Awal Khan	SLASS
4385-DR Amanul Alam	PhySci
4386-DR Talal Ahmed Chowdhury	PhySci
6048-MS Iztiba Mallik Deeba	SELS
6010-MS Tasnimul Ferdous 5167-RitaYusuf	SELS
3546-MR Mohammad Hasibul Islam	SBE
3542-MR Md. Aminul Islam	SBE
3549-MS Tasnia Fatin	SBE
3547-MS Kazi Sharmin Pamela	SBE
4384-DR S N M Azizul Hoque	PhySci
4388-MR Md. Hedayet Ullah	PhySci
5577-MS Zohora Parveen	SLASS
2435-MS Hasna Hena Sara	SLASS
3554-MR Rokon Alam	SBE
3556-DR Muhammad Shahin Miah	SBE
6053-MS Saadia Shareen	SELS
6051-MR Adhip Rahman	SELS
6045-MR Sumaiya Afrin Soha 6044-Najath QuamrulAnam	SELS
6050-DR K. B. M. Mamun Rashid Chowdhury	SELS
6052-MR F. M. Nazmul Hassan	SELS
T001-00 TBA TBA 6016-Mohammed MahboobMorshed	SELS
2453-MR MMA Rahman Nahid	SLASS
4396-MR Mamun Sirajul Majid	CSE
4397-MR Mohammad Motiur Rahman	CSE
4398-MR Md. Ashiqur Rahman	CSE
2451-DR Tanveer Faruq	SLASS
4401-MR AKM Mahbubur Rahman	CSE
4399-DR Saker Tanveer Ahmed Rumee	CSE
4400-MR Faisal Abdul Kadir	CSE
4393-DR Md. Anwar Hossain	EEE
4394-MR MD. ZIAUL HAQUE	EEE
2452-MS Mir Sadia Siddequa Sifat	SLASS
5255-MS Taspiya Hamid	SELS
5256-DR Md. Nazrul Islam	SELS
2449-MR Shanto Kairy	SLASS
4395-PROF Mohammad Ferdows	PhySci
6027-MS Shakila sultana 6002-Syed A. K. ShifatAhmed	SELS
6010-MS Tasnimul Ferdous 6048-Iztiba MallikDeeba	SELS
3559-DR Md. Rakibul Hoque	SBE
3557-DR Shamsun Nahar Momotaz	SBE
3558-MS Farhana Akter	SBE
3562-MR Kali Shankar Roy	SBE
3563-MR Mohammed Naveed Siddiquee	SBE
6056-DR Muntasir Billah	SELS
6054-DR Sabrina Moriom Elias	SELS
6024-MR Ornob Alam 5167-RitaYusuf 6024-OrnobAlam	SELS
6059-DR Chowdhury Rafiqul Ahsan	SELS
3570-MS Maria Muntahin	SBE
3571-DR Syed Shahdat Hossain	SBE
5259-DR Md. Anamul Haque	SELS
4404-DR Hasina Mamtaz	CSE
4405-MS Sarah Tahsin	CSE
2457-MS Syeda Jaferi Husain	SLASS
2368-MR Al Kamal Md. Ziaul Haq	SLASS
2456-DR Shah Nister Kabir	SLASS
4407-MR Rajib Hossain Pavel	CSE
4406-MR Mohammad Rejwan Uddin	CSE
3565-DR Shahriar Kabir	SBE
2463-PROF Rabeya Begum	SLASS
2462-MR Md. Ohidujjaman	SLASS
2460-DR Hosna Shewly	SLASS
2461-MR F. M. Arafat	SLASS
3569-MR Abdullah Al Ahad	SBE
3568-MR Tareq Mahbub	SBE
3567-DR Raisul Awal Mahmood	SBE
2459-DR Assaduzzaman	SLASS
6055-DR Rashed Noor	SELS
6058-DR Shah M Faruque	SELS
6057-MS Sara Sadia Chowdhury	SELS
6010-MS Tasnimul Ferdous 5167-RitaYusuf 6010-TasnimulFerdous	SELS
3573-DR Ziaul Haq Adnan	SBE
3566-DR Rezwanul Alam	SBE
3572-MR Md. Muzahidul Islam	SBE
5254-PROF J M A Hannan	SELS
3585-MR Nafees Reza	SBE
2472-MS Tahsina Ferdous	SLASS
2471-MR MD Ashraful Kabir	SLASS
3579-MS Seeratus Sabah	SBE
4408-MR Asif Bin Khaled	CSE
2464-MR Amitabh Reza Chowdhury	SLASS
4416-MR Md. Fahad Monir	CSE
4418-MR Nashid Ali	CSE
4417-MR Md. Thesun Al- Amin	CSE
4409-MS Ajmiri Sabrina Khan	CSE
4411-MS Fauzia Hoque Shorna	EEE
2473-DR AKM Waliul Islam	SLASS
2266-DR Mohammad Raihan Sharif	SLASS
5585-MR Mohammad Arifuzzaman	SELS
5270-DR Sayma Akhter	SELS
5271-DR Arif Jamil	SELS
3581-MS Prawma Tapashi Khan	SBE
3582-MR Mashfique Ibne Akbar	SBE
2469-MR Md. Amjad Hossain	SLASS
1698-MR Sarwar Jahan Minar	SLASS
4410-DR Mohammad Babul Hasan	PhySci
4414-MR Noor Muhammad Khan	PhySci
4412-MS Mahmuda Jahan	PhySci
4413-MS Nigar Sultana	PhySci
6002-MR Syed A. K. Shifat Ahmed 5167-RitaYusuf	SELS
3584-MS Dhritiparna Kundu	SBE
3580-MS Habiba Kibria	SBE
3583-MR Sheikh Mohammad Fauzul Azim	SBE
5263-MR Abdullah Faruque	SELS
5268-MS Sarah Zaheen	SELS
5266-MR Md. Abdul Muhit	SELS
5264-MR Masum Shahriar	SELS
5262-MR M. Shahabuddin K. Choudhuri	SELS
5260-MR Mehdi Bin Samad	SELS
5261-MS Syeda Naureen Ahmed	SELS
5265-MS Saquiba Yesmine	SELS
5267-MR Mohammad Kaisarul Islam	SELS
4415-DR Mohammad Rasel Parvez	PhySci
3600-MR Prahallad Chandra Das	SBE
2477-MR Md. Mahady Hasan	SLASS
6062-MS Anika Tahsin Rahman	SELS
6063-MR Richard Malo	SELS
2475-MS Khandaker Nayeema Haque	SLASS
5279-DR Tanjinul Hoque Mollah	SELS
5277-DR Afzal Ahmed	SELS
5278-PROF Md. Mizanur Rahman	SELS
3588-MR Md. Sajedul Islam	SBE
3589-MS Farzana Huda	SBE
5591-MS Tasnuva Faruk	SPPH
5592-MR Humayun Kabir	SPPH
5593-MS Fayeza Sultana	SPPH
3601-MR Md. Touhid Hossain	SBE
4419-MS Nurjahan Akter Nepa	PhySci
3598-MR Rashid Anzoom	SBE
3599-MR Md. Tamzidul Islam	SBE
3594-MR Mohammed Sajedur Rahman	SBE
3597-MS Nastaran Nazrul Tui	SBE
3595-MR Towkir Islam Khan	SBE
3596-MR Mohammad Rajib Uddin	SBE
5275-PROF Mohammad Mafruhi Sattar	SELS
5274-DR Md. Saiful Islam	SELS
2476-DR Shah Ehsan Habib	SLASS
3604-MS Marjouka Binte Shams	SBE
3611-MR Mohammad Tasadduk Ali Miah	SBE
3603-MR Md. Rezaul Karim	SBE
6064-MR Md. Daud Hossain Khan	SELS
2481-DR Zahed-Ur- Rahman	SLASS
5199-DR Shahima Islam	SELS
3135-DR Abul Bashar	SBE
4426-MR Nazmul Hossain	CSE
2423-MR Golam Mostafa	SLASS
4223-MR Mr. Md. Shariful Islam	CSE
3602-DR Mohammad Ali Taslim	SBE
2478-DR Sukanto Roy	SLASS
2483-MR Kazi Mubinul Hasan Shanto	SLASS
2482-MR S M Mahfuzur Rahman	SLASS
5294-DR M. M. Majedul Islam	SELS
5291-DR Abu SMG Kibria	SELS
1747-MR Md. Rayatul Islam	SBE
2479-DR Marufa Akter	SLASS
2480-MR Mohammad Ashab Uddin	SLASS
5591-DR Tasnuva Faruk	SPPH
5596-MS Zareen Tasnim Tapti	SPPH
3607-DR Safayet Rahman	SBE
3568-DR Tareq Mahbub	SBE
3610-MR Md. Shah Newaz	SBE
4423-MS Nabila Jaman Tripti	PhySci
4424-MR Nazmul Hossain	PhySci
4425-MR Md. Meshbahur Rahman	PhySci
6065-PROF Majibur Rahman	SELS
3428-DR Dr. Nazmunnessa Mahtab	SBE
3606-DR Md. Kharshiduzzaman	SBE
3609-MR Wahidul Sheikh	SBE
3614-MR Md. Mujibul Hoque	SBE
3599-DR Dr. Md. Tamzidul Islam	SBE
3605-DR Mohammad Anisur Rahman	SBE
3612-MR Syed Imamuzzaman	SBE
5282-PROF A. B. M. Faroque	SPPH
5280-DR Rajib Bhattacharjee	SPPH
5283-DR Md. Raihan Sarkar	SPPH
5286-MR M. Salahuddin Bhuiya	SPPH
5288-DR Sheikh Zahir Raihan	SPPH
5287-DR Nazmul Ahsan Khan	SPPH
5281-PROF Amir Hussain Khan	SPPH
5284-MR K. M. Yasif Kayes Sikdar	SPPH
5290-MR A. R. M. Zahidur Rahman	SPPH
5289-MR Nazmus Saqueeb	SPPH
5295-MS Sadia Tasfina	SELS
2484-MR Mahbub Quaisar	SLASS
3616-MR Mohammed Abu Yousuf	SBE
2194-MR Mohammad Mahfuzul Islam 2326-Maidul AlamChaklader	SLASS
2492-MS Naureen Rahim	SLASS
4434-MS Sadita Ahmed	CSE
4435-MR Shahed Alam	CSE
4433-MR Hamidur Rahman	CSE
4432-DR Al-Sakib Khan Pathan	CSE
2487-DR AKM Zakaria	SLASS
2488-MR Imtiaz Uddin Sikder	SLASS
2489-MS Zarin Tasnim Rahman	SLASS
2490-MS Pikasha Imam	SLASS
2491-MR Kamrul Hasan Dinar	SLASS
2486-DR Ahmed Ahsanuzzaman	SLASS
5302-DR Abdus Sabur	SELS
5310-DR Sunil Kumar Kundu	SELS
3617-MR Anis A. Khan	SBE
4430-MR Ifte Khairul Alam Bhuiyan	PhySci
4431-DR Mohammad Nazrul Islam	PhySci
4428-PROF Anandamayee Majumdar	PhySci
4429-DR Khan Muhammad Bin Asad	PhySci
3615-DR Md. Mamun Habib	SBE
5304-DR Md. Elias-Al- Mamun	SPPH
5611-DR Prawej Ansari	SPPH
5312-DR A. B. M. Mahfuz Ul Alam	SPPH
5306-MR Zobaer Al Mahmud	SPPH
5300-MS Mashmum Shababa Shahid	SPPH
5309-DR Sitesh Chandra Bachar	SPPH
5320-MR Md. Abdul Aziz	SPPH
5301-DR Md. Amran Howlader	SPPH
5303-DR Arif Matin	SPPH
5604-DR Iffat Ara Sonia Rahman	SPPH
5305-DR Muhammad Asaduzzaman	SPPH
5307-DR Md. Selim Reza	SPPH
5308-MR Ehsan Aziz	SPPH
2485-MR A. K. M Nurun Nabi	SLASS
2493-MS Anika Nawar	SLASS
3620-DR Zoha Rahman	SBE
3624-MR Iqtesab Haider	SBE
2497-MR Hamza Kamal Mostafa	SLASS
4446-DR Yusuf Mahbubul Islam	CSE
4450-MS Farzana Bente Alam	CSE
4447-PROF A. R. Azimul Hoque	CSE
4427-MR Rubayed Mehedi	CSE
4449-MR Sheikh Abujar	CSE
4448-DR Farzana Rahman	CSE
3621-DR Md. Khaled Saifullah	SBE
2494-MR Prodhan Mahbub Ibna Seraj	SLASS
5321-DR Qazi Zahed Iqbal	SELS
3625-MR Md. Mehedi Hasan	SBE
2495-DR Shima Zaman	SLASS
2496-DR Shanawez Hossain	SLASS
3626-MS Nujhat Anjum Ani	SBE
3628-MR Syed Numan Chowdhury	SBE
2505-DR Kazi Mahmudur Rahman	SLASS
6072-MR A.B.M. Rezwanul Kabir	SELS
6073-MR Aftab Uz Zaman Noor	SELS
6070-MR Salman Khan Promon	SELS
6036-MS Nazratun Nayeem Choudhury	SELS
2498-PROF Taiabur Rahman	SLASS
3630-MR Ariful Islam	SBE
2506-MR Quazi Mahfujul Hoque Supan	SLASS
4453-MS Moumita Asad	CSE
2507-MR Hasan Razzak	SLASS
3430-DR Amin Masud Ali	SBE
4455-DR Touhidur Rahman	EEE
2502-MS Afroza Bilkis	SLASS
2504-MR Raian Hossain	SLASS
5606-MR Rabiul Islam	SELS
3629-MS Nabila Kamal Promy	SBE
2501-MR Md. Al Ifran Hossain Mollah	SLASS
2500-DR Zahidul Islam	SLASS
4454-DR Jewel Kumar Ghosh	PhySci
3631-MR Md. Rubel	SBE
3435-DR M. Habib	SBE
5603-MS Parisa Tamannur Rashid	SPPH
5607-DR A. S. M. Monjur-Al- Hossain	SPPH
5609-MR Md. Ashraful Alam	SPPH
5608-DR S. M. Abdur Rahman	SPPH
5610-DR Shimul Halder	SPPH
T004-DR Serajul Hoque	SELS
2517-DR Soumitra Sekhar	SLASS
3637-MR Osman Gani	SBE
3635-DR Md. Shamimul Islam	SBE
4465-MR Eusha Kadir	CSE
4468-MS Nazia Nishat	CSE
2215-DR S.M Rezwan-Ul-Alam	SLASS
2511-MR Rafee Muhammad Tamjid	SLASS
4475-DR Sejuti Rahman	CSE
4467-MS Nashid Sultana	CSE
4473-MS Farzana Sadia	CSE
4472-MR Azfar Hossain	CSE
4474-DR Mst. Najnin Sultana	CSE
4466-DR Md. Mehedi Hasan	CSE
3632-DR Meherun Ahmed	SBE
4457-MR Md. Iftadul Islam Sakib	EEE
4462-MR Nazmus Sakib	EEE
4458-MR Md. Tawhid Islam Opu	EEE
4459-MR Md. Rezanul Haque	EEE
2515-DR Mahmud Hasan Khan	SLASS
2518-MS Mubash-Shera Karishma Mobarok	SLASS
2516-DR Sarker Hasan Al Zayed	SLASS
5326-MS Taspiea Mostofa	SELS
4461-MR Abdullah Al Noman	EEE
4460-DR Tanbir Ibne Anowar	EEE
4464-MR Md. Rayhan Ahmed	EEE
3633-DR Imtiaz Ahmed Nevin	SBE
3636-MS Tahmina Ahmed	SBE
5605-MS Zenat Zebin Hossain	SELS
2510-MR Md Anisur Rahman	SLASS
4471-PROF Muhammed Siddique Hossain Farayzi	PhySci
4257-DR K M Ariful Kabir	PhySci
3634-DR Muhammad Azizur Rahman	SBE
3638-DR S M Sohel Rana	SBE
2512-DR Md. Masood Imran	SLASS
6009-DR Ashrafus Safa 6010-TasnimulFerdous	SELS
2508-MR Hasan Razzak	SLASS
2503-MR Nuran Choudhury	SLASS
5329-DR Jakir Ahmed Chowdhury	SPPH
2519-DR A H M Zehadul Karim	SLASS
2521-DR Md. Faruk Shah	SLASS
5334-MR Md. Ali Hossain	SPPH
5327-DR Akib Bin Rahman	SPPH
5330-DR Mohammad Rashedul Haque	SPPH
5331-DR Muhammad Rashedul Islam	SPPH
5328-MR Mr. Ahmed Kamrul Alam	SPPH
2522-MR Asif Mahtab Utsha	SLASS
2524-MR Asif Bin Ali	SLASS
2312-MR Muhammad Zamir	SLASS
2525-MR Md Abid Mallick	SLASS
4483-MR Abdus Sattar	SETS
4486-MR Shad Ahmed	SETS
4487-MR Md.Safiul Islam Leon	SETS
4484-MR Sadekur Rahman	SETS
4478-MR Md. Nazmul Haque	SETS
4477-MR Md. Aquib Azmain	SETS
4485-MR Md. Shirazim Munir	SETS
4480-DR Md. Samiullah	SETS
4481-MS Kaniz Fatema	SETS
4482-MR Kaushik Sarker	SETS
4476-MR Mohammad Hasanr Rahman	SETS
4488-MR Md. Mahmudur Rahman	SETS
4489-MR Murad Kabir Nipun	SETS
4490-MR Md. Munir Hasan	SETS
6076-MS Sharazad Hassan	SELS
5324-MS Sareeta Haidar	SELS
2503-MR Nuran Choudhury Choudhury	SLASS
\.


--
-- Data for Name: room_t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_t (croomid, nroomcapacity) FROM stdin;
BC7002-S	50
BC2009-S	50
BC2021-S	50
BC3008-S	50
BC3010-S	50
BC2020-S	50
BC3009-S	50
BC3011-S	50
BC3012-S	50
BC7015-S	50
BC8012-S	50
BC8011-S	50
BC6008-S	50
BC9014-S	50
BC8014-S	25
BC4010-S	25
BC7025-S	50
BC4014-S	25
C2003-S	20
BC4013-S	25
BCTBA4-S	50
BC4017A-S	25
BC4017B-S	25
C3006-S	20
BC9016-S	25
C2007-S	40
BC10014-S	50
C2006-S	20
C5005-S	40
BC10017-S	25
C4006-S	20
BC10018-S	50
BC3002-S	50
BC5002-S	50
BC8013-S	25
C3003-S	30
BC9015-S	25
C4002-S	20
C4003-S	20
BC7016-S	50
BC4011-S	25
BC2010-S	50
C2004-S	40
C3004-S	40
C4005-S	40
C5004-S	40
BC9017-S	50
BC8015-S	25
BC2011-S	50
C6004-S	40
BC4012-S	25
ESLAB-S	50
BC10015-S	50
BC4043-S	30
GPLab-S	40
C6005-S	40
C3002-S	20
C3007-S	20
C5003-S	20
BC6023-S	50
BCTBA1-S	50
BCTBA2-S	50
CSCLab1-S	35
CSCLab4-S	25
CSCLab2-S	35
BC6009-S	50
BC6013-S	50
BC6012-S	50
C3005-S	40
CENLAB-S	36
CSCLab3-S	35
C4004-S	40
BC7026-S	50
BC5014-S	50
BC6007-S	50
BC5012-S	50
BC5013-S	50
BC001-S	50
A4L04-S	20
C2005-S	40
CirLab-S	35
SIMLAB1-S	30
PowLab-S	35
TelLab-S	35
MACLAB1-S	30
ESLAB2-S	50
BLab-S	50
BC7019-S	50
BCTBA3-S	50
BC2012-S	50
BC2013-S	50
C2002-S	20
C6006-S	20
BC2014-S	50
C4007-S	20
C5006-S	20
C5002-S	20
C5007-S	40
C6002-S	20
FT-S	50
BC4017C-S	25
BC9013-S	50
PLab-S	25
PLab2-S	25
C6007-S	20
C9002-S	40
C6003-S	20
BC3015D-S	35
BC4017D-S	25
BC3015A-S	35
BC3015E-S	35
BC3015C-S	35
BC3015B-S	35
BC3015F-S	35
GIS-LAB-S	25
\.


--
-- Data for Name: school_t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.school_t (cschoolid, cschoolname) FROM stdin;
SETS	School of Engineering, Technology and Sciences
SLASS	School of Liberal Arts & Social Sciences
SBE	School of Business & Entrepreneurship
SELS	School of Environment and Life Sciences
SPPH	School of Pharmacy and Public Health
\.


--
-- Data for Name: section_t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.section_t (usectionid, tstarttime, cdays, cblocked, nstudentenrolled, csectionnum, csemesterid, ccourseid, cfacultyid, croomid) FROM stdin;
00f69875-663d-49fd-b931-5f6c93b58bb7	11:00:00	MW	0	33	1	Autumn2021	AAT101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
7149a319-0cae-489a-9925-78bd7a536f28	08:00:00	MW	0	51	1	Autumn2021	ACN201	3269-MR Zeeshan Abedin	BC2020-S
a7a56dde-53bd-4050-a44b-2d5410a85f87	09:30:00	MW	0	50	2	Autumn2021	ACN201	3427-MS Nimat Zarin	BC3010-S
995791c8-5150-41a2-8ac6-f5da76e4bb95	11:00:00	ST	0	50	3	Autumn2021	ACN201	3478-MR Md. Safiuddin	BC3012-S
7d96a9f6-b2ee-4db9-a604-40bd8800d889	11:00:00	MW	0	50	4	Autumn2021	ACN201	3493-MR Ashraful Arefin	BC3010-S
b623dcf9-49e7-4eb2-8151-c1be032651db	12:30:00	ST	0	50	5	Autumn2021	ACN201	3600-MR Prahallad Chandra Das	BC3010-S
093de868-9057-4cfa-b3e4-95369bc4c78b	08:00:00	ST	0	50	6	Autumn2021	ACN201	3600-MR Prahallad Chandra Das	BC2020-S
81d321d5-cbcd-40ca-ac66-c769cb8d138a	17:00:00	ST	0	50	7	Autumn2021	ACN201	3585-MR Nafees Reza	BC2020-S
f63c4d96-dd37-4512-8b1d-facce422a233	08:00:00	MW	0	50	8	Autumn2021	ACN201	3493-MR Ashraful Arefin	BC2021-S
d0e8d2ce-9aaa-492d-adfb-a33c48480ab2	09:30:00	ST	0	50	9	Autumn2021	ACN201	3563-MR Mohammed Naveed Siddiquee	BC3009-S
07187aac-428c-4108-b5dd-ef8cf5275f3c	11:00:00	MW	-1	39	1	Summer2021	AAT101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
e5f8c4ce-72a2-4b18-a7b8-9a7bd2d8db14	08:00:00	ST	-1	48	1	Summer2021	ACN201	3269-MR Zeeshan Abedin	BC2009-S
bb420c20-558e-465a-9778-edb3f8a93ce8	09:30:00	MW	-1	48	2	Summer2021	ACN201	3563-MR Mohammed Naveed Siddiquee	BC2021-S
f60c9b97-db49-4b63-aada-3a2a4e676c90	11:00:00	ST	-1	48	3	Summer2021	ACN201	3478-MR Md. Safiuddin	BC3008-S
44e1c7cc-401f-4c6a-ac75-0c83b39a1d1f	11:00:00	MW	-1	48	4	Summer2021	ACN201	3493-MR Ashraful Arefin	BC3010-S
4ab50a64-96fa-4c91-a40c-e551aed3b003	12:30:00	ST	-1	49	5	Summer2021	ACN201	3600-MR Prahallad Chandra Das	BC2020-S
dc640ee1-6f6b-422a-b6f0-5892c338d8e0	15:30:00	MW	-1	47	6	Summer2021	ACN201	3628-MR Syed Numan Chowdhury	BC3008-S
e1d8210e-4c5a-46ae-b9d2-121ee9c61fcc	17:00:00	ST	-1	46	7	Summer2021	ACN201	3628-MR Syed Numan Chowdhury	BC3010-S
860c263d-4b6c-456e-85fe-57cabecd118a	08:00:00	MW	-1	48	8	Summer2021	ACN201	3493-MR Ashraful Arefin	BC2021-S
953430ee-991b-4e7b-b49f-c36051180bbc	09:30:00	ST	-1	48	9	Summer2021	ACN201	3563-MR Mohammed Naveed Siddiquee	BC3008-S
0dee2b4e-c7b1-481e-b4f0-60ae8ab8c164	14:00:00	ST	-1	48	10	Summer2021	ACN201	3585-MR Nafees Reza	BC3008-S
4cbfb3e5-8966-4887-9603-94f6dd0f91e7	08:00:00	MW	-1	47	1	Summer2021	ACN202	3427-MS Nimat Zarin	BC3008-S
eb6d6c3a-9d09-454a-80f7-55c2d3adde20	09:30:00	ST	-1	49	2	Summer2021	ACN202	3478-MR Md. Safiuddin	BC3009-S
9de13e9e-1882-458a-b737-6a77bf0636cb	11:00:00	MW	-1	48	3	Summer2021	ACN202	3628-MR Syed Numan Chowdhury	BC3011-S
5334fac5-5781-476c-ad4f-a43e97d37bb1	09:30:00	ST	-1	48	4	Summer2021	ACN202	3600-MR Prahallad Chandra Das	BC3010-S
100b2f87-ba36-4121-b77f-06f6b93e4151	14:00:00	MW	-1	48	5	Summer2021	ACN202	3563-MR Mohammed Naveed Siddiquee	BC2021-S
c4b45665-f57f-4522-9119-4ad3c0bb2910	14:00:00	ST	-1	48	6	Summer2021	ACN202	3478-MR Md. Safiuddin	BC3009-S
f6fb8a6b-d48c-4730-9d9f-720c4c0080ef	11:00:00	ST	-1	48	7	Summer2021	ACN202	3347-MR Maqbool Kader Quraishi	BC3009-S
fa508193-8415-4501-8b55-84e6f030231d	09:30:00	MW	-1	26	1	Summer2021	ACN301	3147-DR Rushdi Rezaur Razzaque	BC3008-S
5b125825-70f3-4e3e-8b12-4b7ca4914703	09:30:00	ST	-1	19	2	Summer2021	ACN301	3347-MR Maqbool Kader Quraishi	BC3011-S
bd20f738-26a9-4535-8f4f-38e23831ca5b	09:30:00	ST	-1	15	1	Summer2021	ACN305	3147-DR Rushdi Rezaur Razzaque	BC3012-S
96e7e2e4-0c42-44da-a094-79115c6b53f2	12:30:00	MW	-1	39	2	Summer2021	ACN305	3478-MR Md. Safiuddin	BC3008-S
ff4cb606-4ca0-43db-be83-15b10b21784d	09:30:00	MW	-1	42	1	Summer2021	ACN402	3478-MR Md. Safiuddin	BC3009-S
b79e0688-4ee4-4d36-a2c2-297889970e32	12:30:00	MW	-1	26	1	Summer2021	ACN403	3347-MR Maqbool Kader Quraishi	BC3009-S
536f93c9-306c-406e-9427-6c7da985efe5	08:00:00	ST	-1	7	2	Summer2021	ACN403	3427-MS Nimat Zarin	BC3008-S
7c5a3caf-3d46-4542-a318-ed87c1364faa	08:00:00	ST	-1	26	1	Summer2021	ACN405	3376-MR Naheem Mahtab	BC3009-S
398e578b-7358-4a66-b6a1-7fa7c619b9c9	11:00:00	ST	-1	21	2	Summer2021	ACN405	3563-MR Mohammed Naveed Siddiquee	BC3010-S
15108dfe-a34b-4cc2-8cb7-58bbd4408f20	08:00:00	MW	-1	10	1	Summer2021	ACN406	3376-MR Naheem Mahtab	BC3012-S
c536db51-590b-4814-bf8e-2b3d24a4165b	17:00:00	MW	-1	45	1	Summer2021	ACN441	3563-MR Mohammed Naveed Siddiquee	BC2021-S
72d4216e-00cb-4b4e-9a66-273e463cdb0a	14:00:00	ST	-1	43	2	Summer2021	ACN441	3628-MR Syed Numan Chowdhury	BC3010-S
c2b1fde1-2a35-4ab6-8c11-5eee7a4449fd	15:30:00	ST	-1	35	1	Summer2021	ANT101	2326-MR Maidul Alam Chaklader	BC7015-S
2a545253-2813-441d-9436-c2a9603bddd7	15:30:00	MW	-1	38	2	Summer2021	ANT101	2326-MR Maidul Alam Chaklader	BC7015-S
22725238-48b5-4842-adc0-683442a25811	14:00:00	ST	-1	39	3	Summer2021	ANT101	2194-MR Mohammad Mahfuzul Islam	BC8012-S
19be321f-64f3-4ee2-a76c-f31b4d63ab97	14:00:00	MW	-1	38	4	Summer2021	ANT101	2194-MR Mohammad Mahfuzul Islam	BC8011-S
158fa732-0eaf-48e1-b432-15d07f543f0a	08:00:00	ST	-1	12	5	Summer2021	ANT101	2443-MS Tazin Rahman Ananya	BC6008-S
a992b214-863a-40cc-b3fe-87cff50722dd	09:30:00	ST	-1	27	6	Summer2021	ANT101	2443-MS Tazin Rahman Ananya	BC7015-S
7ab799b6-509e-4292-924b-b39b475e3a54	11:00:00	MW	-1	10	7	Summer2021	ANT101	2443-MS Tazin Rahman Ananya	BC9014-S
892f7da3-cc28-4eec-956c-e98fde5a86d8	08:00:00	MW	B-0	0	8	Summer2021	ANT101	2420-MS Saba Nuzhat	BC7015-S
3c2df8b8-fac3-4fd1-b295-0df2f1eeccc4	09:30:00	MW	0	0	9	Summer2021	ANT101	2420-MS Saba Nuzhat	C6002-S
acb3a363-77bc-4d12-a419-ca4ef1029303	14:00:00	ST	-1	24	1	Summer2021	ANT103	2326-MR Maidul Alam Chaklader	BC8014-S
a7a1cecf-14fb-476a-aa9b-cc1f2007049b	15:30:00	ST	-1	6	1	Summer2021	ANT205	2194-MR Mohammad Mahfuzul Islam	BC4010-S
a009330e-93bb-4cf9-bb26-fdc83c142c79	17:00:00	MW	-1	11	1	Summer2021	ANT206	2389-DR Ranjan Saha Partha	BC7025-S
366d51ed-7b25-4f27-8d2b-1a15869d09ec	15:30:00	MW	-1	6	1	Summer2021	ANT303	2194-MR Mohammad Mahfuzul Islam	BC8014-S
fab501a4-7753-44d0-8882-dfc6f796fa2e	09:30:00	MW	-1	14	1	Summer2021	ANT314	2443-MS Tazin Rahman Ananya	BC4014-S
e2208625-2b4b-48da-9388-668e889409eb	12:30:00	MW	-1	3	1	Summer2021	ANT404	2389-DR Ranjan Saha Partha	C2003-S
9bdffa80-6ff7-4d36-ad36-9843b58a9ece	14:00:00	MW	-1	13	1	Summer2021	ANT418	2326-MR Maidul Alam Chaklader	BC4013-S
ce5ed7cb-c0d6-4987-8ad1-cb0ad418183c	08:00:00	MW	0	0	1	Summer2021	ANT499	2194-MR Mohammad Mahfuzul Islam 2326-Maidul AlamChaklader	BC001-S
d9947aa2-984d-4253-b3f1-81b755e447ea	08:00:00	F	-1	234	1	Summer2021	BBA499A	3329-MR Abul Khair Jyote	BCTBA4-S
eec3bacf-1aa3-4592-aca8-861171b04ffd	08:00:00	A	0	0	1	Summer2021	BBA499B	T001-00 TBA TBA	BCTBA4-S
6055fa69-17e8-4475-9a11-a6b77652aa2f	15:30:00	ST	-1	8	1	Summer2021	BCB103	6072-MR A.B.M. Rezwanul Kabir	C2003-S
2773b00d-216c-48c6-9ce3-7218a9146f9e	14:00:00	M	0	8	1	Summer2021	BCB103L	6072-MR A.B.M. Rezwanul Kabir	BC4017A-S
5d073ca6-e84a-4c95-bf10-33c60fc94d59	09:30:00	ST	-1	11	1	Summer2021	BCB104	6072-MR A.B.M. Rezwanul Kabir	BC4014-S
32bc93ce-b036-4d4b-912f-8378e0cc1d1f	14:00:00	W	0	11	1	Summer2021	BCB104L	6072-MR A.B.M. Rezwanul Kabir	BC4017B-S
662abba0-719b-42bc-b754-33b0e6dbfb57	11:00:00	ST	-1	11	1	Summer2021	BCB202	6073-MR Aftab Uz Zaman Noor	C3006-S
5e8b9bb6-9eb0-4dd3-a454-2962375e865a	12:30:00	R	-1	17	1	Summer2021	BCB202L	6073-MR Aftab Uz Zaman Noor	BC4017A-S
87997f4b-a093-4acf-b904-51659b64285d	12:30:00	ST	-1	22	1	Summer2021	BCB203	6070-MR Salman Khan Promon	BC9016-S
70c49a9d-8039-4ebb-b161-f3f5e65d7fb0	14:00:00	ST	-1	10	1	Summer2021	BCB205	6064-MR Md. Daud Hossain Khan	C2007-S
2e04e09e-aad7-4d16-bd5f-3fe1e4fb4021	15:30:00	MW	-1	27	1	Summer2021	BCB302	6010-MS Tasnimul Ferdous	BC10014-S
89702b4d-33a6-421c-8baa-974a6c7ac5b5	08:00:00	ST	B-0	0	1	Summer2021	BCB303	T004-DR Serajul Hoque	BC10017-S
26dc766b-b6d6-4ca6-94c4-d8d542ae6ef4	15:30:00	ST	-1	18	1	Summer2021	BCB304	6070-MR Salman Khan Promon	C2006-S
19b79355-cbdf-4ff0-baa5-3b740f2a9375	12:30:00	ST	-1	14	1	Summer2021	BCB305	6054-DR Sabrina Moriom Elias	BC4017A-S
bbc1fe8b-642e-4d82-bdde-c657a7e0735d	12:30:00	MW	-1	18	1	Summer2021	BCB306	6054-DR Sabrina Moriom Elias	C5005-S
557a8404-22c4-430d-9d17-61b553b7a03e	14:00:00	MW	-1	22	1	Summer2021	BCB308	6064-MR Md. Daud Hossain Khan	BC10014-S
cd285a14-e65b-45ef-ba1c-93bfd032abaf	09:30:00	MW	-1	10	1	Summer2021	BCB309	6073-MR Aftab Uz Zaman Noor	BC10017-S
77afdd84-4164-4be6-b785-f46ddb4a849a	14:00:00	ST	B-0	0	1	Summer2021	BCB401	T001-00 TBA TBA	C3002-S
2d4fb786-b7a3-403a-a6d1-16fe7799840f	17:00:00	ST	-1	11	1	Summer2021	BCB402	6070-MR Salman Khan Promon	BC10014-S
cd769edb-64a5-4bdf-bde3-3903e640a318	11:00:00	MW	-1	7	1	Summer2021	BCB405	6073-MR Aftab Uz Zaman Noor	C4006-S
7d10e8da-7dea-4ebe-804c-3549fe2b9a21	17:00:00	ST	B-0	0	1	Summer2021	BCB409	T001-00 TBA TBA	BC10015-S
f71dcfe2-2763-42a0-b63e-b5e1237e7ed7	15:30:00	MW	-1	13	1	Summer2021	BCB411	6073-MR Aftab Uz Zaman Noor	BC9016-S
8abfed41-426a-4312-91f7-243fe162e105	17:00:00	MW	-1	7	1	Summer2021	BCB412	6064-MR Md. Daud Hossain Khan	BC10018-S
c7ac12e1-ec35-4d4a-9da7-29a386ccf8d1	15:30:00	MW	-1	26	1	Summer2021	BDS109	2281-MR Mahmud Hasan Kayesh	BC3002-S
5edf6c03-6a94-4d68-9b63-8079e640b4b9	09:30:00	ST	-1	28	2	Summer2021	BDS109	2255-MS Momtaz Parvin Mumu	BC3002-S
2ca47a89-db33-46c7-a0e0-fc2f49600422	11:00:00	ST	-1	29	3	Summer2021	BDS109	2281-MR Mahmud Hasan Kayesh	BC5002-S
b78c3651-c6b5-47ea-9bef-9809d5676585	14:00:00	MW	-1	30	4	Summer2021	BDS109	2481-DR Zahed-Ur- Rahman	BC5002-S
5a4c2112-d98c-4caa-8b3c-7353dc33ed62	14:00:00	ST	-1	29	5	Summer2021	BDS109	2497-MR Hamza Kamal Mostafa	BC8013-S
9d23f62b-a7d9-4d2a-9918-7401cef851ed	17:00:00	MW	-1	30	6	Summer2021	BDS109	2481-DR Zahed-Ur- Rahman	BC5002-S
53455c48-751c-48e1-8c1e-f6096928c98b	11:00:00	MW	-1	29	7	Summer2021	BDS109	2278-MS Tazeen Ahmed	BC3002-S
3765d8e1-79ff-475c-b07b-e4d3d83d615f	11:00:00	ST	-1	29	1	Summer2021	BIO100	6053-MS Saadia Shareen	C3003-S
efc12359-9eac-40da-8279-e25e1540a9bb	12:30:00	ST	-1	29	2	Summer2021	BIO100	6036-MS Nazratun Nayeem Choudhury	BC9015-S
9285e4d0-dca3-42de-9c58-84c2d22dbb7d	11:00:00	MW	-1	28	3	Summer2021	BIO100	6036-MS Nazratun Nayeem Choudhury	C4002-S
692a4074-3905-441a-a336-a3a150fe1c1c	12:30:00	MW	-1	30	4	Summer2021	BIO100	6036-MS Nazratun Nayeem Choudhury	C2007-S
85b16164-8d30-4e7c-bc84-3c7528ba5f4b	14:00:00	ST	-1	30	5	Summer2021	BIO100	6053-MS Saadia Shareen	BC10017-S
3ec1c80e-5230-487f-80d0-3063ac700187	14:00:00	MW	-1	37	6	Summer2021	BIO100	6053-MS Saadia Shareen	BC9015-S
94df1d2b-e72f-4b9c-a660-89df7bc454c0	14:00:00	MW	B-0	0	7	Summer2021	BIO100	T001-00 TBA TBA	BC10017-S
5c6ce85a-9381-4f80-aa71-89d5883f6c36	11:00:00	MW	-1	36	1	Summer2021	BIO102	6053-MS Saadia Shareen	C4003-S
638b04a1-d531-463f-9f2b-74b3c6d79c3c	12:30:00	W	-1	36	1	Summer2021	BIO102L	6053-MS Saadia Shareen	BC4017A-S
d31313e3-f88a-4170-baca-ca1d66cbac38	09:30:00	MW	-1	18	1	Summer2021	BIO105	6072-MR A.B.M. Rezwanul Kabir	C2006-S
4a5517ef-fc96-4508-a875-dbdd6ff5ce30	12:30:00	T	0	18	1	Summer2021	BIO105L	6072-MR A.B.M. Rezwanul Kabir	BC4017B-S
bbe9bffa-0ad9-410c-b18c-12b1c939faec	15:30:00	ST	-1	14	1	Summer2021	BLA101	2446-DR Muhammad Shajjad Ahsan	BC7002-S
8ee7398c-c81d-44ea-baa6-04e0fe14b15d	17:00:00	ST	-1	10	2	Summer2021	BLA101	2446-DR Muhammad Shajjad Ahsan	BC7002-S
1ca8d44b-fdc8-4ee4-9bea-1b3d40087a96	11:00:00	ST	-1	33	1	Summer2021	BNG201	2388-DR Lutfor Rahman	BC8013-S
3fc46813-4d70-46f7-a54a-e8248260cdad	12:30:00	ST	-1	33	2	Summer2021	BNG201	2388-DR Lutfor Rahman	BC7016-S
553a0792-a81b-4454-a4b0-4e9965ae8393	11:00:00	MW	-1	28	3	Summer2021	BNG201	2427-MR Shaikh Mahfuzur Rahman	BC4011-S
827362a1-4cde-43e2-a7a7-2db8f5c1914a	15:30:00	MW	-1	9	4	Summer2021	BNG201	2517-DR Soumitra Sekhar	BC8012-S
a891be7d-7f24-4b48-9b69-294fb74eca45	14:00:00	MW	-1	34	1	Summer2021	BPH101	2398-MR Sayed Abu Touab Shakir	BC7002-S
6fca7b4e-5562-42ef-a3d4-b77ce4874c23	15:30:00	MW	-1	23	2	Summer2021	BPH101	2398-MR Sayed Abu Touab Shakir	BC5002-S
1aa0f232-d4b0-47e0-affe-9942d717f160	17:00:00	MW	-1	15	3	Summer2021	BPH101	2398-MR Sayed Abu Touab Shakir	BC7002-S
4b3d62b7-09a3-4417-b8ca-64b428063ed5	14:00:00	ST	0	0	4	Summer2021	BPH101	2498-PROF Taiabur Rahman	BC7002-S
bb0bb481-26d8-4eb0-885b-2c948b5271f9	12:30:00	ST	-1	20	5	Summer2021	BPH101	2505-DR Kazi Mahmudur Rahman	BC3002-S
48bded66-13e3-4c66-959f-c212306b5a23	08:00:00	ST	-1	43	1	Summer2021	BUS201	3251-MS Farzana Chowdhury	BC2010-S
482a56be-7296-445f-99c9-3d2a4d67052c	11:00:00	ST	-1	47	2	Summer2021	BUS201	3251-MS Farzana Chowdhury	BC2010-S
a1e8261e-8e15-434a-8d61-79d6049a90ac	14:00:00	ST	-1	46	3	Summer2021	BUS201	3423-MR Arifur Rahman Khan	BC2009-S
309c7f73-c9e0-4972-a521-e88c6355fbeb	14:00:00	MW	-1	47	4	Summer2021	BUS201	3539-MR SM Yusuf Mallick	BC2009-S
e295f829-5ad9-4e6a-ab48-8b4b8227eb78	15:30:00	MW	-1	48	5	Summer2021	BUS201	3344-MR Mohammad Fahad Noor	BC2009-S
8139fd9e-8447-4b07-98ad-48d03bc9c55c	08:00:00	MW	-1	37	6	Summer2021	BUS201	3569-MR Abdullah Al Ahad	BC2009-S
2cf3d565-112b-4bf6-9bcb-80fc71d35bd0	17:00:00	ST	-1	36	7	Summer2021	BUS201	3570-MS Maria Muntahin	BC2009-S
91e26a45-3fc6-4b1b-87a0-c3cc0f076404	12:30:00	MW	-1	48	8	Summer2021	BUS201	3525-MS Afnan Ashfaque	BC2009-S
434e0560-fdea-4812-abec-13816b6baa77	15:30:00	ST	-1	32	9	Summer2021	BUS201	3637-MR Osman Gani	BC2009-S
b528fa3c-0b71-44f9-b90d-b57d001a150f	08:00:00	ST	-1	50	1	Summer2021	BUS202	3545-DR Mohammad Osman Gani	C2004-S
922c56d9-141b-4753-97fa-bd5602b9ea39	11:00:00	ST	-1	50	2	Summer2021	BUS202	3579-MS Seeratus Sabah	C3004-S
484e50fc-06bd-44c3-9d55-4c8c7dd1af11	08:00:00	MW	-1	51	3	Summer2021	BUS202	3534-DR Md. Abdus Salam Akanda	BC3010-S
f2537bf8-ab18-407e-bf8e-63edfd489ced	09:30:00	ST	-1	49	4	Summer2021	BUS202	3579-MS Seeratus Sabah	C4005-S
1b570848-50a0-4287-9a9c-1cb6386466f1	09:30:00	MW	-1	49	5	Summer2021	BUS202	3534-DR Md. Abdus Salam Akanda	C3004-S
3d4ad98b-824c-4eca-9c00-d23eabeedb1e	09:30:00	ST	-1	50	6	Summer2021	BUS202	3545-DR Mohammad Osman Gani	C5004-S
cae74581-bed6-4a35-abd9-37c5b5387d76	14:00:00	ST	-1	50	7	Summer2021	BUS202	3579-MS Seeratus Sabah	BC9017-S
0e0f7cff-b02b-433c-9ad4-c1a598a2fbf2	15:30:00	MW	-1	48	8	Summer2021	BUS202	3606-DR Md. Kharshiduzzaman	BC8015-S
f10e93a8-2316-45ab-909a-4f573752ef65	09:30:00	ST	-1	48	1	Summer2021	BUS360	3159-BAR Sarah Hassan	BC2010-S
339b73f0-57e7-4879-b793-f4e679f8ecba	15:30:00	MW	-1	48	2	Summer2021	BUS360	3323-MS Qantara Khaleda Khan	BC2010-S
b5f1308d-8e23-4f40-a562-432320b7e82d	09:30:00	MW	-1	49	3	Summer2021	BUS360	3512-MR Kazi Md. Jamshed	BC2009-S
0920b90c-88f5-4877-bcec-a22935cdf487	11:00:00	MW	-1	46	4	Summer2021	BUS360	3525-MS Afnan Ashfaque	BC2009-S
bb5c8b95-1b2a-46bd-910a-c5c01c620d45	12:30:00	ST	-1	47	5	Summer2021	BUS360	3358-MR Mr. Iftekhar Mahfuz	BC2009-S
0ecde257-3e14-41e0-afaa-448450a086af	15:30:00	ST	-1	47	6	Summer2021	BUS360	3358-MR Mr. Iftekhar Mahfuz	BC2010-S
4083b945-47fb-46be-a771-d4a89b2a75fe	08:00:00	ST	-1	47	7	Summer2021	BUS360	3159-BAR Sarah Hassan	BC2011-S
5868816f-f170-4c35-871f-2c78d699bc53	14:00:00	ST	-1	39	1	Summer2021	BUS485	3635-DR Md. Shamimul Islam	BC2010-S
37cc22ec-a138-44b2-9541-b472bccf35d3	14:00:00	MW	-1	47	2	Summer2021	BUS485	3185-MR Mohammed Sohel Islam	BC2010-S
9c1d695d-f89c-42d9-a332-2f6cfb4a0ce0	11:00:00	ST	-1	45	3	Summer2021	BUS485	3444-DR Ikramul Hasan	BC2011-S
21b7d8ec-8a17-4542-b0ff-9526eacc5f56	15:30:00	ST	-1	28	4	Summer2021	BUS485	3635-DR Md. Shamimul Islam	BC2011-S
74448cea-ce49-41e9-8074-694f4b4376ba	09:30:00	ST	-1	45	5	Summer2021	BUS485	3344-MR Mohammad Fahad Noor	BC2011-S
8a5bde33-90e9-4cf2-942e-ea3a7bc2d5db	12:30:00	MW	-1	39	6	Summer2021	BUS485	3372-DR Samiul Parvez Ahmed	BC2010-S
53e30a18-c89f-4a00-8467-0855d8ff0184	11:00:00	MW	-1	17	1	Summer2021	CCS106	2506-MR Quazi Mahfujul Hoque Supan	C2007-S
77b89af7-6f6b-4428-a539-88b181fb79ea	09:30:00	MW	-1	25	1	Summer2021	CFS105	2506-MR Quazi Mahfujul Hoque Supan	C6004-S
8fda1d44-a1a6-46de-8984-c4e470f00c0e	14:00:00	MW	-1	13	1	Summer2021	CHE101	5252-DR Sadia Nazneen Karobi	BC4012-S
d07f7cd5-319a-426f-b8d5-1a464cc0b34b	14:00:00	ST	-1	20	2	Summer2021	CHE101	5252-DR Sadia Nazneen Karobi	BC9015-S
6df9b82b-9f29-4bda-9174-fff582b859d9	14:00:00	R	B-0	0	1	Summer2021	CHE101L	5231-MR Saquib Ahmad Khan	ESLAB-S
bdb484c0-5521-43a5-9d2f-623f87d7cb70	12:30:00	R	B-0	0	2	Summer2021	CHE101L	5231-MR Saquib Ahmad Khan	ESLAB-S
9162b923-13df-4798-9076-893d15a74109	11:00:00	R	-1	8	3	Summer2021	CHE101L	5231-MR Saquib Ahmad Khan	ESLAB-S
021c87fb-d4b9-4e5a-a917-48eef993bed5	08:00:00	ST	-1	28	1	Summer2021	CHI101	2453-MR MMA Rahman Nahid	BC10015-S
1ef7ccca-4585-4b3b-8e40-0c6920f36886	08:00:00	ST	-1	37	1	Summer2021	CIS101	4465-MR Eusha Kadir	BC4043-S
2c7807b8-cc18-4972-bda8-7f9c0d39403d	11:00:00	ST	-1	39	2	Summer2021	CIS101	4371-MS Sadia Sharmin	BC4043-S
159e38ea-e581-47b2-bb27-145c8c2fb374	12:30:00	ST	-1	38	3	Summer2021	CIS101	4348-MR Md. Abu Sayed	BC4043-S
cf878c6f-c2c8-48cd-94d8-615ab6f13f88	15:30:00	ST	-1	38	4	Summer2021	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
463ed9e3-91ed-4539-a829-29f776955761	08:00:00	MW	-1	40	5	Summer2021	CIS101	4465-MR Eusha Kadir	BC4043-S
642d955c-2a0a-48be-a70a-3b925ecf315e	11:00:00	MW	-1	38	6	Summer2021	CIS101	4348-MR Md. Abu Sayed	BC4043-S
136b09ac-d106-410b-a197-bf03a9af35bf	12:30:00	MW	-1	39	7	Summer2021	CIS101	4404-DR Hasina Mamtaz	BC4043-S
75cac625-95c1-4ea6-8247-59542d8c2a98	15:30:00	MW	-1	39	8	Summer2021	CIS101	4468-MS Nazia Nishat	BC4043-S
e0d46e3c-3044-4e52-a771-0cc880aac5d5	17:00:00	ST	-1	37	9	Summer2021	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
1cbe88a8-fd0b-4728-b236-64f8b655827a	11:00:00	ST	-1	40	10	Summer2021	CIS101	4374-MR Wahidul Hasan	GPLab-S
9624df9d-2295-4473-b35a-3b4ae4d7130c	08:00:00	MW	-1	37	11	Summer2021	CIS101	4404-DR Hasina Mamtaz	GPLab-S
392b3de7-3bb1-4b6b-a7f0-d05fe3b552bc	09:30:00	S	0	37	1	Summer2021	CIS101L	4465-MR Eusha Kadir	BC4043-S
0bff7bdf-a447-4ce4-a800-c37797d211f4	09:30:00	T	0	39	2	Summer2021	CIS101L	4371-MS Sadia Sharmin	BC4043-S
7cbf5732-6835-4ebe-9923-63c25a170ad6	14:00:00	S	0	38	3	Summer2021	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
e6e3a993-c380-43ee-8996-8f8b39cd6dbd	14:00:00	T	-1	39	4	Summer2021	CIS101L	4330-MR AKM Monzurul Islam	BC4043-S
5f8f63b5-9106-4a26-9202-9e31af0f6701	09:30:00	M	0	40	5	Summer2021	CIS101L	4465-MR Eusha Kadir	BC4043-S
5926f1dc-6918-40cc-8ca4-19302a7b054f	09:30:00	W	0	38	6	Summer2021	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
24ecf85d-e472-4057-a0b0-20e009eff1cd	14:00:00	M	0	39	7	Summer2021	CIS101L	4404-DR Hasina Mamtaz	BC4043-S
ea131a53-afaf-4696-a3da-5ade17b0ca1e	14:00:00	W	-1	39	8	Summer2021	CIS101L	4468-MS Nazia Nishat	BC4043-S
56e6d6c9-7720-4493-833d-3cf16eea5834	17:00:00	M	0	37	9	Summer2021	CIS101L	4330-MR AKM Monzurul Islam	BC4043-S
5f34a871-420c-4b34-9037-60ecd87d21ab	09:30:00	T	0	40	10	Summer2021	CIS101L	4374-MR Wahidul Hasan	GPLab-S
711c7090-9807-43e9-83bf-39ae841d93c8	09:30:00	M	0	37	11	Summer2021	CIS101L	4404-DR Hasina Mamtaz	GPLab-S
2369c324-0a19-489f-a502-cb4a45097d4c	15:30:00	ST	-1	24	1	Summer2021	CMN201	2164-MR Mohammad Masud Chowdhury	BC9016-S
e4e84c85-45bf-4d5b-a17d-93bce7819269	12:30:00	ST	-1	27	2	Summer2021	CMN201	2258-MS Tasneem Shahrukh	BC4011-S
1fdb021e-e4b4-4494-b920-55a983ee73b4	08:00:00	MW	-1	19	3	Summer2021	CMN201	2171-MS Fariya Hossain Khan	BC8014-S
b08c63ba-7c00-42ac-a44c-0301afacdc10	14:00:00	ST	-1	24	4	Summer2021	CMN201	2171-MS Fariya Hossain Khan	BC4014-S
3654942a-1366-4a2d-8353-a4a6d98e9d5f	14:00:00	MW	-1	30	5	Summer2021	CMN201	2255-MS Momtaz Parvin Mumu	BC7025-S
5efffe80-822c-42b6-a381-e3a730c7e540	09:30:00	MW	-1	26	6	Summer2021	CMN201	2255-MS Momtaz Parvin Mumu	BC4012-S
59e8c5da-a4e0-4a83-881b-446aecc91339	11:00:00	MW	-1	27	7	Summer2021	CMN201	2270-MS Raisa Rasheeka	C6005-S
04b48ab6-50dc-4cb1-a18b-17e17c77ad8e	17:00:00	ST	-1	20	8	Summer2021	CMN201	2281-MR Mahmud Hasan Kayesh	BC4011-S
13c5fa64-eaa6-4697-9188-30aa8eeeb0d8	11:00:00	ST	-1	27	9	Summer2021	CMN201	2382-MS Raiyana Rahman	BC4013-S
6e58c541-eb1a-4019-9742-ce80e2489061	09:30:00	MW	-1	27	10	Summer2021	CMN201	2382-MS Raiyana Rahman	BC4013-S
d85bcf34-e4d9-43a3-bd80-758e2dd43e95	17:00:00	MW	-1	16	11	Summer2021	CMN201	2382-MS Raiyana Rahman	BC7016-S
e3803f3f-2672-4d49-bde3-a5fcedf4743d	12:30:00	MW	-1	23	12	Summer2021	CMN201	2497-MR Hamza Kamal Mostafa	BC8014-S
c860bfba-8701-4c5d-be42-665183238d48	11:00:00	ST	-1	10	13	Summer2021	CMN201	2278-MS Tazeen Ahmed	BC10015-S
a9bb06f6-6a11-4365-90ca-6ae0c6739a4c	09:30:00	ST	-1	20	1	Summer2021	CMN202	2171-MS Fariya Hossain Khan	C2007-S
a2b55512-cd3a-4e4e-be56-7c624a0fe41c	15:30:00	ST	-1	20	2	Summer2021	CMN202	2382-MS Raiyana Rahman	C3002-S
fbf1821c-3798-4048-9e91-ea0cd3a20641	11:00:00	MW	-1	35	1	Summer2021	CMN203	2258-MS Tasneem Shahrukh	BC10017-S
44e441c4-b481-466b-b7e5-6f54aa5024c4	09:30:00	MW	-1	11	1	Summer2021	CMN205	2164-MR Mohammad Masud Chowdhury	C3007-S
1f699c4a-3e41-4789-af11-22a5056e7964	14:00:00	MW	-1	16	1	Summer2021	CMN207	2382-MS Raiyana Rahman	C2003-S
ad90b322-ae2a-4f92-9e6b-d4c5f6125feb	15:30:00	ST	-1	10	2	Summer2021	CMN207	2270-MS Raisa Rasheeka	C3003-S
030d2b93-77df-4bd0-9b52-a613a4922046	17:00:00	ST	-1	10	1	Summer2021	CMN301	2215-DR S.M Rezwan-Ul-Alam	BC4013-S
929e76bc-9dd5-4b63-9306-1aba335cbd64	17:00:00	MW	-1	20	1	Summer2021	CMN302	2278-MS Tazeen Ahmed	BC9014-S
5977088c-d3d9-48e9-8fe9-3ab84b3f336a	15:30:00	ST	-1	21	1	Summer2021	CMN304	2278-MS Tazeen Ahmed	BC4012-S
e64a4945-231c-4d58-ac98-d3298cba3c6d	15:30:00	MW	-1	15	1	Summer2021	CMN306	2299-MS Naila Azad Nupur	BC4013-S
9dee3b04-85cd-4eed-b32f-81dca4ade4fd	11:00:00	ST	-1	16	1	Summer2021	CMN308	2350-MR Syeed Zayadul Ahsan	C6004-S
8ca651ac-7542-43aa-8e8a-50e5f5a4c637	11:00:00	MW	-1	14	1	Summer2021	CMN313	2281-MR Mahmud Hasan Kayesh	C5003-S
152f3a84-17ba-403f-abde-b33a80adc596	09:30:00	MW	-1	15	1	Summer2021	CMN314	2368-MR Al Kamal Md. Ziaul Haq	BC6023-S
96482764-0463-4c7d-a6b5-0382ab2d34a1	14:00:00	ST	-1	11	1	Summer2021	CMN318	2255-MS Momtaz Parvin Mumu	C4002-S
fa0eba1e-dd10-4a82-ab41-215cab4e3184	14:00:00	MW	-1	20	1	Summer2021	CMN323	2258-MS Tasneem Shahrukh	C2006-S
6b490e6f-ce14-4d4f-9aed-b2d40859cf14	17:00:00	ST	-1	20	1	Summer2021	CMN324	2308-MR Syed Ali Haider Rizvi	BC4012-S
761dd1ca-1961-4af8-98f9-9c87d08719a3	12:30:00	MW	-1	14	1	Summer2021	CMN325	2171-MS Fariya Hossain Khan	BC4014-S
43cc4585-67bf-441c-b6a3-69505f30cfd6	11:00:00	ST	-1	23	1	Summer2021	CMN403	2270-MS Raisa Rasheeka	C4006-S
0cb0aeb5-bc52-4a93-9385-c34e766a5a54	15:30:00	ST	-1	26	1	Summer2021	CMN407	2456-DR Shah Nister Kabir	BC9015-S
70cac8e5-f34d-4973-be02-af4daaa307d5	14:00:00	ST	-1	8	1	Summer2021	CMN412	2511-MR Rafee Muhammad Tamjid	C3007-S
761eb58e-670a-4b86-8cdb-88dff198b79b	11:00:00	ST	-1	11	1	Summer2021	CMN414	2164-MR Mohammad Masud Chowdhury	BC4014-S
320c24cc-0bb5-4b80-ac3c-7dfb6e5b6a9f	12:30:00	ST	-1	8	1	Summer2021	CMN420	2154-MR Philip Gain	BC4014-S
939fe63a-2ee7-464b-bbde-52708b76defc	12:30:00	MW	-1	5	1	Summer2021	CMN421	2340-MR Mahmood Menon Khan	BC4013-S
54e36c83-6e91-491d-b40a-9075932829d4	11:00:00	ST	-1	24	1	Summer2021	CMN422	2258-MS Tasneem Shahrukh	C4003-S
1a6cd9eb-1bf7-4011-aacc-d095f0f41d86	14:00:00	MW	-1	17	1	Summer2021	CMN429	2164-MR Mohammad Masud Chowdhury	C2007-S
156f162f-516b-4173-a180-26f3926c0126	15:30:00	A	-1	9	1	Summer2021	CMN498	2171-MS Fariya Hossain Khan	BCTBA1-S
92c561f0-1028-4097-8646-f4acb93f3f42	15:30:00	A	-1	1	1	Summer2021	CMN499	2270-MS Raisa Rasheeka	BCTBA2-S
c9e9c051-e41d-4824-b31e-c14e9d6916b3	08:00:00	ST	B-0	-1	1	Summer2021	CSC101	T001-00 TBA TBA	CSCLab2-S
62954fc9-b593-47e2-8c6e-e939cdca222e	17:00:00	ST	-1	36	2	Summer2021	CSC101	4449-MR Sheikh Abujar	CSCLab1-S
b47af9d4-c73c-43e3-9287-341f2996d62a	12:30:00	ST	-1	36	3	Summer2021	CSC101	4408-MR Asif Bin Khaled	CSCLab1-S
8df3f955-e8ac-46e8-8884-e1f81c8a7e41	14:00:00	ST	-1	35	4	Summer2021	CSC101	4408-MR Asif Bin Khaled	CSCLab1-S
1ec891da-914e-4cb7-9bb7-5d5cefae4d58	15:30:00	MW	-1	36	5	Summer2021	CSC101	4449-MR Sheikh Abujar	CSCLab1-S
36c8e9e0-ac1e-41d9-b0ee-9329fb599a5a	09:30:00	MW	-1	29	6	Summer2021	CSC101	4446-DR Yusuf Mahbubul Islam	CSCLab4-S
a1e86ebb-0fa1-4119-aa4a-e549b0b74800	12:30:00	MW	-1	35	7	Summer2021	CSC101	4416-MR Md. Fahad Monir	CSCLab4-S
0730100e-58dd-432b-b27b-8a0dd007bf96	15:30:00	MW	-1	33	8	Summer2021	CSC101	4416-MR Md. Fahad Monir	GPLab-S
2ac5e52f-ae07-4f09-9927-1dc9a97f16ae	11:00:00	ST	B-0	0	9	Summer2021	CSC101	T001-00 TBA TBA	CSCLab2-S
7936185b-7aaa-4a17-9db2-42ac24075d4f	09:30:00	ST	-1	34	10	Summer2021	CSC101	4102-DR Mohammed Anwer	CSCLab4-S
37201e56-e167-4236-813f-1ef47d7b3166	09:30:00	S	B-0	-1	1	Summer2021	CSC101L	T001-00 TBA TBA	CSCLab2-S
802be5cb-dbc6-400d-9818-4e96d717c43a	15:30:00	T	0	36	2	Summer2021	CSC101L	4449-MR Sheikh Abujar	CSCLab1-S
573b2715-7661-4562-83f4-4cb9b873c1e1	11:00:00	S	0	36	3	Summer2021	CSC101L	4408-MR Asif Bin Khaled	CSCLab1-S
81ec0ac7-bb14-4039-a99d-6f385302e757	15:30:00	S	0	35	4	Summer2021	CSC101L	4408-MR Asif Bin Khaled	CSCLab1-S
988021e5-209d-4925-bf5a-e849032729cb	17:00:00	M	0	36	5	Summer2021	CSC101L	4449-MR Sheikh Abujar	CSCLab1-S
ae547efd-c5a0-4c7a-9e68-cd8270b3f474	11:00:00	M	0	29	6	Summer2021	CSC101L	4446-DR Yusuf Mahbubul Islam	CSCLab2-S
f2cdb355-309a-4339-b904-f21ff1003a81	11:00:00	M	0	35	7	Summer2021	CSC101L	4416-MR Md. Fahad Monir	CSCLab4-S
00495e36-1677-42cf-8c3c-29e24da8e7fc	14:00:00	M	0	33	8	Summer2021	CSC101L	4416-MR Md. Fahad Monir	GPLab-S
621ca5a5-61f9-418c-8ff4-21f17f25e017	09:30:00	T	B-0	0	9	Summer2021	CSC101L	T001-00 TBA TBA	CSCLab2-S
78e1bcfc-6bc9-4697-992d-a08c9791325f	11:00:00	S	0	34	10	Summer2021	CSC101L	4102-DR Mohammed Anwer	CSCLab4-S
d865384a-3b35-4d2e-9bfa-cfe110f33b71	08:00:00	ST	-1	16	1	Summer2021	CSC121	4161-MR Subrata Kumar Dey	GPLab-S
49b59d62-e506-4df4-a889-6f7321ebdd3d	09:30:00	S	0	18	1	Summer2021	CSC121L	4161-MR Subrata Kumar Dey	GPLab-S
1272f4c2-b58d-4c7c-ab08-7673f34982d1	08:00:00	ST	-1	46	1	Summer2021	CSC201	4228-DR Habib Bin Muzaffar	BC6009-S
d9b4a208-a10b-4a06-978c-f1be6026afc7	09:30:00	MW	-1	46	2	Summer2021	CSC201	4228-DR Habib Bin Muzaffar	BC7016-S
efe12f25-4f0f-4f97-8bf2-35d8a98fc336	08:00:00	MW	-1	47	3	Summer2021	CSC201	4375-MR Mustafa Nizamul Aziz	BC6009-S
88441e16-55cd-47d3-be77-fd34438d43d9	09:30:00	MW	-1	46	4	Summer2021	CSC201	4475-DR Sejuti Rahman	BC7025-S
3004b0fa-3e54-43fe-bfdb-e27490db5603	18:30:00	T	-1	46	1	Summer2021	CSC301	4447-PROF A. R. Azimul Hoque	BC6013-S
23d777fe-58ff-4c0c-b610-d12b037f0e27	18:30:00	M	-1	41	2	Summer2021	CSC301	4241-DR Md. Ashraful Amin	BC6012-S
5f3d2f43-481c-4349-8700-02af88cc488b	17:00:00	MW	-1	41	3	Summer2021	CSC301	4362-MR Bijoy Rahman Arif	BC6008-S
a1b29133-1179-484d-97ee-04c8fee70998	08:00:00	ST	-1	50	1	Summer2021	CSE104	4467-MS Nashid Sultana	BC6012-S
5c67f45d-6ceb-450c-8d25-4e23ad73e6e5	09:30:00	ST	-1	48	2	Summer2021	CSE104	4297-MR M. Ishtiaque Rahman	C3005-S
a9e63c10-a072-4f69-bc8d-780cfde752cf	14:00:00	ST	-1	50	3	Summer2021	CSE104	4285-DR Ferdows Zahid	BC6012-S
4e6dd243-e7c5-42b0-80e1-b5b828d84d0a	08:00:00	MW	-1	49	4	Summer2021	CSE104	4467-MS Nashid Sultana	BC6012-S
b895d870-4b54-45b9-b509-87b3eb9e1a4a	09:30:00	S	-1	45	1	Summer2021	CSE104L	4467-MS Nashid Sultana	CENLAB-S
f1deaeb8-3696-4a32-acd6-eb8b62b50620	08:00:00	S	-1	44	2	Summer2021	CSE104L	4297-MR M. Ishtiaque Rahman	CENLAB-S
908b71d8-5620-4232-a76e-b0f385254284	12:30:00	S	-1	50	3	Summer2021	CSE104L	4467-MS Nashid Sultana	CENLAB-S
16b19351-5f1f-4244-84b4-d31e16006bd3	09:30:00	M	-1	47	4	Summer2021	CSE104L	4467-MS Nashid Sultana	CENLAB-S
b5842012-7c3d-4a20-a38a-c47c94ec5475	08:00:00	ST	-1	33	1	Summer2021	CSE203	4397-MR Mohammad Motiur Rahman	CSCLab3-S
72a2c567-dbe6-4970-9f82-5ee05ff4de26	11:00:00	ST	-1	34	2	Summer2021	CSE203	4453-MS Moumita Asad	CSCLab3-S
8da4a030-9f33-452f-be3d-351fe6f9e26f	08:00:00	MW	-1	37	3	Summer2021	CSE203	4453-MS Moumita Asad	CSCLab3-S
5e36b698-ed42-4981-985c-4e7cbd4786b9	11:00:00	MW	-1	29	4	Summer2021	CSE203	4397-MR Mohammad Motiur Rahman	CSCLab3-S
268d9063-a54e-4e80-9f99-af297f0939c2	11:00:00	MW	-1	35	5	Summer2021	CSE203	4449-MR Sheikh Abujar	GPLab-S
ff6f6417-adae-4008-acda-8015bf69cd95	14:00:00	ST	-1	37	6	Summer2021	CSE203	4453-MS Moumita Asad	CSCLab3-S
b797f7cc-7c17-487e-afd9-734b5a339432	09:30:00	S	0	33	1	Summer2021	CSE203L	4397-MR Mohammad Motiur Rahman	CSCLab3-S
aaaecf4a-0972-461c-ae40-932ed669f8c2	09:30:00	T	0	34	2	Summer2021	CSE203L	4453-MS Moumita Asad	CSCLab3-S
65aefea4-1fc1-4775-b3c6-86cb1bbde3f8	09:30:00	M	0	37	3	Summer2021	CSE203L	4453-MS Moumita Asad	CSCLab3-S
d9f2f0e1-1f12-4170-b53e-a2835ae649cc	09:30:00	W	0	29	4	Summer2021	CSE203L	4397-MR Mohammad Motiur Rahman	CSCLab3-S
fc5d4525-764b-446d-b396-ee96d65c3da5	09:30:00	W	0	35	5	Summer2021	CSE203L	4449-MR Sheikh Abujar	GPLab-S
f4236e3e-0dfd-4b5a-9278-13f3523c3ab9	15:30:00	S	0	37	6	Summer2021	CSE203L	4453-MS Moumita Asad	CSCLab3-S
d295fc62-29f5-4c6d-805e-6068d0621611	11:00:00	ST	-1	34	1	Summer2021	CSE204	4433-MR Hamidur Rahman	BC6013-S
188ccce3-7d12-43f1-9c83-6e25b123bbb7	12:30:00	ST	-1	36	2	Summer2021	CSE204	4251-MR Md. Raihan Bin Rafique	BC7025-S
21bcb2fb-cb82-499c-8381-59651b18504c	11:00:00	MW	B-0	0	3	Summer2021	CSE204	T001-00 TBA TBA	C5005-S
f9f3ff86-2ea1-4956-abd7-b5846125eb2a	12:30:00	MW	-1	36	4	Summer2021	CSE204	4433-MR Hamidur Rahman	C4004-S
cddc57c2-7620-479e-859c-2ee810bea9a3	09:30:00	T	0	34	1	Summer2021	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
1268d8fb-adfa-4b5e-9446-2f2fcd104db6	14:00:00	T	0	36	2	Summer2021	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
8a83c15c-3f1a-411b-bbfe-97aac99671a8	09:30:00	W	B-0	0	3	Summer2021	CSE204L	T001-00 TBA TBA	CENLAB-S
623129c5-6dc8-45b9-bb03-cb16b4895d33	14:00:00	W	0	36	4	Summer2021	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
5f933d2f-0b6f-412e-8813-3ac350837a02	11:00:00	ST	0	0	1	Summer2021	CSE210	4273-MR Sarwar Shahidi	C2005-S
630dd280-475e-4b2a-8c52-c4419729ba3f	12:30:00	ST	-1	36	2	Summer2021	CSE210	4406-MR Mohammad Rejwan Uddin	BC7026-S
aa4a56e2-48ea-42f3-8c71-9cbdfd372820	12:30:00	MW	-1	37	3	Summer2021	CSE210	4374-MR Wahidul Hasan	C4005-S
79dd4908-51ec-4860-bbf0-5c03e721dd9c	12:30:00	T	0	0	1	Summer2021	CSE210L	4273-MR Sarwar Shahidi	CENLAB-S
617734c1-6a92-4a14-80b6-7fccf58ec06d	14:00:00	S	-1	43	2	Summer2021	CSE210L	4406-MR Mohammad Rejwan Uddin	CENLAB-S
5ed320d5-bc87-466b-bc2f-21bc7bee927e	11:00:00	M	-1	34	3	Summer2021	CSE210L	4374-MR Wahidul Hasan	CENLAB-S
a8b2c01c-8411-477d-a0df-8857750f02f2	12:30:00	ST	B-0	0	1	Summer2021	CSE211	T001-00 TBA TBA	CSCLab2-S
644c39d4-3988-4394-96c5-b7446ce8de87	12:30:00	ST	0	40	2	Summer2021	CSE211	4448-DR Farzana Rahman	CSCLab3-S
e4a11eb5-a1ea-4433-9f8e-854e8a4d22d7	12:30:00	MW	-1	35	3	Summer2021	CSE211	4408-MR Asif Bin Khaled	CSCLab2-S
2f1698e9-66a0-4b12-a9ba-00ef08716856	14:00:00	MW	-1	31	4	Summer2021	CSE211	4408-MR Asif Bin Khaled	CSCLab2-S
4a2b1879-1d4a-452f-aefb-75d8d4af3e9f	12:30:00	MW	0	14	5	Summer2021	CSE211	4448-DR Farzana Rahman	GPLab-S
db6e66b4-83a7-4194-8a52-3a243d14926d	14:00:00	T	B-0	0	1	Summer2021	CSE211L	T001-00 TBA TBA	CSCLab2-S
aeb68bf5-ec72-4b71-8042-80e298adaa55	14:00:00	T	0	40	2	Summer2021	CSE211L	4448-DR Farzana Rahman	CSCLab4-S
15951928-774d-4765-b13f-5933d0a829b1	11:00:00	W	0	35	3	Summer2021	CSE211L	4408-MR Asif Bin Khaled	CSCLab2-S
b81f2b57-b94d-4240-b65c-945a479ef134	15:30:00	W	0	31	4	Summer2021	CSE211L	4408-MR Asif Bin Khaled	CSCLab2-S
d51949ed-7b1f-44c1-9d48-7cf326089095	14:00:00	W	0	14	5	Summer2021	CSE211L	4448-DR Farzana Rahman	GPLab-S
b8cc7895-6b0c-4c6a-a371-c9630e3d63db	15:30:00	ST	B-0	0	1	Summer2021	CSE213	T001-00 TBA TBA	CSCLab2-S
57c191fa-2a55-4979-9df3-7c7c8df47596	14:00:00	ST	-1	37	2	Summer2021	CSE213	4161-MR Subrata Kumar Dey	GPLab-S
0505bcb5-1d86-471c-9ad0-e9a7c2453e0f	12:30:00	MW	-1	37	3	Summer2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab3-S
4ac43fd4-995b-4532-b74e-493b116d168d	15:30:00	MW	-1	37	4	Summer2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab3-S
f9e88165-deab-42fe-a76e-15f71fb51a62	17:00:00	S	0	0	1	Summer2021	CSE213L	T001-00 TBA TBA	CSCLab2-S
6977cb4a-c3a8-4420-9716-22c4803f423d	12:30:00	S	0	37	2	Summer2021	CSE213L	4161-MR Subrata Kumar Dey	GPLab-S
609bfa0d-11ff-45b4-9983-7bc7096c2b0b	14:00:00	M	0	37	3	Summer2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab3-S
20b690ff-d10d-4916-9d8c-05faee80a6e2	14:00:00	W	0	37	4	Summer2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab3-S
920bd7ab-fa5d-4775-872e-f39c46c2c708	11:00:00	ST	-1	38	1	Summer2021	CSE214	4137-MR Mohammad Noor Nabi	BC4011-S
bf8275e8-bd37-451e-a4c3-0d2c1bb89bb9	12:30:00	ST	-1	36	2	Summer2021	CSE214	4137-MR Mohammad Noor Nabi	C4004-S
de6cf1f0-6c2e-428e-b65f-f1bea801941d	14:00:00	MW	B-0	0	3	Summer2021	CSE214	T001-00 TBA TBA	BC6013-S
050603d6-11dc-4960-8d64-50ef8d84ad88	09:30:00	ST	-1	39	1	Summer2021	CSE216	4242-MR Prof. Farruk Ahmed	BC6009-S
59aa9b41-bf22-46b4-987c-9d4a7abc23ef	12:30:00	ST	-1	28	2	Summer2021	CSE216	4242-MR Prof. Farruk Ahmed	BC6008-S
e4f1d981-3028-4624-8a59-18194ecb88af	14:00:00	MW	0	-2	3	Summer2021	CSE216	4273-MR Sarwar Shahidi	BC7015-S
b41b6343-5345-4f84-9188-9a94bc545332	11:00:00	S	-1	34	1	Summer2021	CSE216L	4427-MR Rubayed Mehedi	CENLAB-S
3cbdb859-cad4-4833-a240-4ff51c91c116	15:30:00	S	-1	21	2	Summer2021	CSE216L	4427-MR Rubayed Mehedi	CENLAB-S
14f64e26-b342-4875-b07e-9bb248d4f0a6	12:30:00	M	-1	10	3	Summer2021	CSE216L	4273-MR Sarwar Shahidi	CENLAB-S
076e9bbd-3258-463d-8eb5-6de791a27157	09:30:00	ST	-1	35	1	Summer2021	CSE303	4348-MR Md. Abu Sayed	CSCLab1-S
74d7cf0a-f96e-4689-9ea5-3461c98b2b17	11:00:00	MW	-1	40	2	Summer2021	CSE303	4434-MS Sadita Ahmed	CSCLab1-S
11891d08-80fb-4e1f-a38a-67777cc88d88	14:00:00	MW	-1	35	3	Summer2021	CSE303	4348-MR Md. Abu Sayed	CSCLab1-S
c40d4cfb-1f26-4e79-8958-cdec2bee0255	08:00:00	S	0	35	1	Summer2021	CSE303L	4348-MR Md. Abu Sayed	CSCLab1-S
8d5c668d-a95f-4c94-83ad-d8e8d1cb9d02	12:30:00	M	0	40	2	Summer2021	CSE303L	4434-MS Sadita Ahmed	CSCLab1-S
8f5d3820-b158-4498-8fd8-e52cbddd6110	12:30:00	W	0	35	3	Summer2021	CSE303L	4348-MR Md. Abu Sayed	CSCLab1-S
efcacc27-2b86-4bf1-91d1-af014247daf0	11:00:00	ST	-1	35	1	Summer2021	CSE307	4473-MS Farzana Sadia	BC4012-S
ab4d57bc-8905-442b-8109-3946a381ccfe	17:00:00	MW	-1	29	2	Summer2021	CSE307	4434-MS Sadita Ahmed	BC6009-S
abb8198a-b9a7-4aec-a4a2-804e820f763c	08:00:00	ST	-1	27	3	Summer2021	CSE307	4280-MS Nujhat Nahar	C4005-S
140e2b56-c2f1-44e5-9560-07b64c25bb41	17:00:00	ST	-1	38	1	Summer2021	CSE309	4251-MR Md. Raihan Bin Rafique	CSCLab3-S
a03b83eb-a014-4d27-8cb2-824c9529b863	08:00:00	MW	-1	38	2	Summer2021	CSE309	4251-MR Md. Raihan Bin Rafique	CSCLab1-S
d1501163-e928-4134-89c4-5dad5eaf4813	15:30:00	ST	-1	35	1	Summer2021	CSE310	4285-DR Ferdows Zahid	BC6012-S
42c73037-7724-422f-9249-9098cce5dc12	17:00:00	ST	-1	26	2	Summer2021	CSE310	4285-DR Ferdows Zahid	BC5014-S
b9211dc1-df45-405f-83ca-e34ea8083e0d	17:00:00	T	-1	32	1	Summer2021	CSE310L	4472-MR Azfar Hossain	CENLAB-S
ee783000-459f-4502-83f2-efca14b37c88	15:30:00	M	-1	32	2	Summer2021	CSE310L	4472-MR Azfar Hossain	CENLAB-S
33096426-2624-443b-99a7-597dda91beb4	14:00:00	ST	-1	53	1	Summer2021	CSE313	4362-MR Bijoy Rahman Arif	BC6013-S
908dc83e-fb05-4096-86df-5d6df6e72bd9	15:30:00	ST	-1	53	2	Summer2021	CSE313	4362-MR Bijoy Rahman Arif	BC6009-S
4175ab1d-7942-4b2a-9998-01d2a6c6d104	17:00:00	ST	-1	50	1	Summer2021	CSE315	4137-MR Mohammad Noor Nabi	BC6007-S
75185133-5a75-4d45-986d-373893964550	15:30:00	MW	-1	46	2	Summer2021	CSE315	4137-MR Mohammad Noor Nabi	BC6008-S
bae82230-95f7-4702-9a4f-4052c384b788	09:30:00	ST	B-0	0	1	Summer2021	CSE316	T001-00 TBA TBA	C3007-S
b5c6a562-7a6f-47b4-8b67-48419e6a6dc8	12:30:00	ST	0	33	2	Summer2021	CSE316	4383-DR Faisal Uddin	C4005-S
b0f13559-8eb4-4452-8216-2a53e4380442	08:00:00	MW	0	46	3	Summer2021	CSE316	4474-DR Mst. Najnin Sultana	BC6013-S
68f9b947-40ba-4175-a8ca-e0fc0284bf69	11:00:00	MW	0	46	4	Summer2021	CSE316	4474-DR Mst. Najnin Sultana	BC5002-S
6bb90b74-df48-49d8-9add-eec0b12c492e	08:00:00	T	B-0	0	1	Summer2021	CSE316L	T001-00 TBA TBA	CSCLab1-S
182cc213-7e78-44ed-8e6f-6f89747c1d01	11:00:00	T	0	33	2	Summer2021	CSE316L	4474-DR Mst. Najnin Sultana	CSCLab1-S
781b38ee-f56e-492f-a4a8-23dd708d3a42	09:30:00	M	0	46	3	Summer2021	CSE316L	4474-DR Mst. Najnin Sultana	CSCLab1-S
f2a8e3eb-e60f-46dd-8170-36dd8162f66d	09:30:00	W	0	46	4	Summer2021	CSE316L	4474-DR Mst. Najnin Sultana	CSCLab1-S
b35441f1-bcab-4b4d-b4c9-93c0d85e4c40	15:30:00	ST	-1	23	1	Summer2021	CSE317	4401-MR AKM Mahbubur Rahman	BC6013-S
8685f934-236a-4899-917a-71c858511033	15:30:00	MW	-1	38	2	Summer2021	CSE317	4375-MR Mustafa Nizamul Aziz	BC6009-S
0086dc06-773d-43b3-8888-bdbfdfe71e8f	09:30:00	MW	-1	21	3	Summer2021	CSE317	4336-DR Amin Ahsan Ali	C6005-S
a423f555-211e-4177-bf86-0616e4e53756	14:00:00	S	0	23	1	Summer2021	CSE317L	4401-MR AKM Mahbubur Rahman	CSCLab2-S
a6f3e1a8-35f1-41d1-a10e-56542e0bbc5d	17:00:00	M	0	38	2	Summer2021	CSE317L	4375-MR Mustafa Nizamul Aziz	CSCLab2-S
65b4a242-b0e5-438a-b69e-d5ff47f8233e	08:00:00	W	0	21	3	Summer2021	CSE317L	4336-DR Amin Ahsan Ali	CSCLab4-S
2844bdd3-495c-4450-b81f-3f8622b7b4a6	18:30:00	S	-1	50	1	Summer2021	CSE406	4432-DR Al-Sakib Khan Pathan	BC5012-S
9ed66f4d-71d6-4989-8b7f-cffc22d18e1f	18:30:00	S	-1	51	1	Summer2021	CSE417	4389-MR Mohammad Shibli Kaysar	BC5013-S
f6833841-fd57-4e91-93a6-587e1f2d3755	18:30:00	M	-1	17	1	Summer2021	CSE420	4466-DR Md. Mehedi Hasan	BC5012-S
eed159be-3137-42fd-9a0b-95d07ed5350f	18:30:00	W	-1	24	1	Summer2021	CSE425	4336-DR Amin Ahsan Ali	BC5012-S
1a627f04-8291-4e03-993a-003dcee5cbb4	18:30:00	T	-1	16	1	Summer2021	CSE433	3620-DR Zoha Rahman	BC5013-S
8ad1beba-7be5-4f89-a73c-2c3d7e931e47	18:30:00	W	-1	50	1	Summer2021	CSE434	4137-MR Mohammad Noor Nabi	BC5013-S
7ad4597d-bf46-4f6b-b55f-7ba643920e69	18:30:00	M	-1	46	1	Summer2021	CSE451	4280-MS Nujhat Nahar	BC5013-S
bddaeb31-0393-4c93-a1db-cdb6b61070a2	18:30:00	S	-1	25	1	Summer2021	CSE454	4473-MS Farzana Sadia	BC5014-S
46979e53-7250-40a9-a684-5635e69aa4f4	18:30:00	T	-1	39	1	Summer2021	CSE457	4280-MS Nujhat Nahar	BC5014-S
ebcd5e04-34f7-46bf-9cd7-e4dd14d9f11f	18:30:00	W	B-0	0	1	Summer2021	CSE464	T001-00 TBA TBA	BC5014-S
7ec29a95-1784-4660-b8a8-cbf2fd3272be	18:30:00	F	0	0	1	Summer2021	CSE498	4184-DR Mahady Hasan	BCTBA1-S
210a7b26-289f-46e0-91fd-49afe7be799a	18:30:00	F	0	2	2	Summer2021	CSE498	4242-MR Prof. Farruk Ahmed	BCTBA2-S
851c8fad-ba59-4634-98f7-9644b2bbf689	18:30:00	F	0	0	3	Summer2021	CSE498	4241-DR Md. Ashraful Amin	BCTBA4-S
00d8e1a8-5aa8-480f-b3e9-fefb38cb32e6	18:30:00	F	0	0	4	Summer2021	CSE498	4285-DR Ferdows Zahid	BC001-S
bd414595-639c-4f11-bb05-2d02df1decf8	18:30:00	A	-1	4	5	Summer2021	CSE498	4382-DR Tarem Ahmed	BCTBA1-S
370764f2-7aee-4c91-95b3-a75e818419ef	18:30:00	A	0	1	6	Summer2021	CSE498	4336-DR Amin Ahsan Ali	BCTBA4-S
0b4fbcb0-5b72-4e00-be12-aff5619afe9f	18:30:00	R	0	0	7	Summer2021	CSE498	4383-DR Faisal Uddin	BCTBA4-S
a2d16617-b1d5-4ed4-be29-e0c704471f95	18:30:00	F	0	0	8	Summer2021	CSE498	4401-MR AKM Mahbubur Rahman	A4L04-S
4d419e0c-df36-486b-a4a2-e380def4bbcc	18:30:00	R	0	0	9	Summer2021	CSE498	4448-DR Farzana Rahman	A4L04-S
fbc9a16a-8b64-4750-a1f3-c031db3e1eae	18:30:00	A	-1	9	1	Summer2021	CSE499	4137-MR Mohammad Noor Nabi	BC001-S
a5d9501e-b4e9-4a33-ae47-27ac7011a825	08:00:00	A	0	0	2	Summer2021	CSE499	4161-MR Subrata Kumar Dey	BC001-S
ac8559ad-42de-45d6-9aad-4c75ab84335c	09:30:00	A	-1	10	3	Summer2021	CSE499	4453-MS Moumita Asad	BC001-S
ef6c87f7-38e7-45b9-a393-35718c3ae68d	11:00:00	A	0	0	4	Summer2021	CSE499	4362-MR Bijoy Rahman Arif	BC001-S
0daf0a4c-e9cc-4ec4-b4ca-8b3fbba53338	12:30:00	A	-1	7	5	Summer2021	CSE499	4348-MR Md. Abu Sayed	BC001-S
916d0b6b-d7ba-4d3b-8b63-8e5a272aa1b4	14:00:00	A	0	0	6	Summer2021	CSE499	4397-MR Mohammad Motiur Rahman	BC001-S
4ca41415-4954-4859-922a-e4e5baaa3b7b	15:30:00	A	-1	10	7	Summer2021	CSE499	4449-MR Sheikh Abujar	BC001-S
dd922fa0-7bf9-4dde-96d2-d346fdbdad54	17:00:00	A	B-0	0	8	Summer2021	CSE499	4376-MR Sanzar Adnan Alam	A4L04-S
d6b412af-e810-4e9c-b461-ca1dbed7bca0	18:30:00	A	-1	8	9	Summer2021	CSE499	4416-MR Md. Fahad Monir	A4L04-S
b5cde0cf-e85d-409e-b97c-171d6afb9cc5	08:00:00	A	-1	10	10	Summer2021	CSE499	4408-MR Asif Bin Khaled	A4L04-S
6e4c7b36-99b4-4c33-8bee-f59246a4c88e	09:30:00	A	B-0	0	11	Summer2021	CSE499	4409-MS Ajmiri Sabrina Khan	A4L04-S
315de079-f38d-428d-922a-3efa4a513d2f	11:00:00	A	0	0	12	Summer2021	CSE499	4449-MR Sheikh Abujar	A4L04-S
8afb0f04-c045-4122-854e-3a3ee54c7285	12:30:00	A	-1	1	13	Summer2021	CSE499	4453-MS Moumita Asad	A4L04-S
34683899-1a05-4507-a66f-b96618473c8f	09:30:00	ST	-1	24	1	Summer2021	ECN200	3491-MS Nuren Nirvana Brishti	C5005-S
eeb4b6d6-814f-49a8-8587-f4b91c9a8dee	17:00:00	ST	-1	30	2	Summer2021	ECN200	3489-MS Fahmida Islam	BC3012-S
70c604d3-8676-4c82-896f-2a36ce05fbbc	09:30:00	MW	-1	17	3	Summer2021	ECN200	3490-MS Nuzhat Sharmeen	C4004-S
9bdd3bbf-8a49-4646-a490-0a05d9f9d316	08:00:00	ST	-1	43	1	Summer2021	ECN201	3463-MR Md. Kamrul Islam	BC8011-S
7ef2d790-d750-48e9-b1f6-092646a969ba	17:00:00	MW	-1	44	2	Summer2021	ECN201	3491-MS Nuren Nirvana Brishti	BC3012-S
c3874862-f501-4897-8a98-afbdd100adab	11:00:00	ST	-1	45	3	Summer2021	ECN201	3467-MS Nabila Maruf	BC3012-S
865bcce8-761b-4f7d-9848-e7d4bb2b1330	12:30:00	ST	-1	44	4	Summer2021	ECN201	3632-DR Meherun Ahmed	BC3010-S
a1e78a2d-babb-471a-b07b-fcf728449333	14:00:00	ST	-1	44	5	Summer2021	ECN201	3461-MS Mumtahina Islam	BC3012-S
60567773-088a-46c1-8dae-68061488b784	17:00:00	ST	-1	45	6	Summer2021	ECN201	3369-MR Khawaja Saifur Rahman	BC3011-S
616cf1a0-9a55-47de-ba02-0baaf2c51209	09:30:00	MW	-1	45	7	Summer2021	ECN201	3463-MR Md. Kamrul Islam	BC10018-S
ebee3868-32f9-4578-9d03-f66bc3164cfe	11:00:00	MW	-1	44	8	Summer2021	ECN201	3490-MS Nuzhat Sharmeen	C2005-S
6c53dd75-c73c-43ad-a91a-625b555b9aa0	12:30:00	MW	-1	44	9	Summer2021	ECN201	3467-MS Nabila Maruf	BC3011-S
896a26b5-2497-4a12-a69a-fe07c3f18d3c	14:00:00	MW	-1	44	10	Summer2021	ECN201	3461-MS Mumtahina Islam	BC3011-S
b9dfef16-cb69-452c-af2a-522db876489d	15:30:00	MW	-1	45	11	Summer2021	ECN201	3461-MS Mumtahina Islam	BC7016-S
46bf71ea-73d1-4054-aab5-3d23f554ae61	08:00:00	ST	-1	41	1	Summer2021	ECN202	3490-MS Nuzhat Sharmeen	BC8012-S
b7982746-c06f-497c-83a4-75435acd01a9	09:30:00	ST	-1	40	2	Summer2021	ECN202	3298-Mr. Shamil M Al-Islam	C4004-S
3317f2ae-a061-41ec-9071-585d8de9a0e5	12:30:00	ST	-1	42	3	Summer2021	ECN202	3621-DR Md. Khaled Saifullah	BC3011-S
cb2372cc-2e79-4ccc-9819-ab642d004050	14:00:00	ST	-1	42	4	Summer2021	ECN202	3467-MS Nabila Maruf	BC8015-S
bada2ce3-324c-4e31-994e-cfc89a37a7d9	09:30:00	MW	-1	40	5	Summer2021	ECN202	3298-Mr. Shamil M Al-Islam	C2005-S
d858a603-42d7-41ec-937a-7f4f7d8082df	11:00:00	MW	-1	42	6	Summer2021	ECN202	3463-MR Md. Kamrul Islam	C3004-S
cc5e23ab-7d20-4fc4-a976-7af7754434b2	12:30:00	MW	-1	42	7	Summer2021	ECN202	3369-MR Khawaja Saifur Rahman	BC3012-S
7c20b336-aba8-4e40-af07-570d21c1b505	14:00:00	MW	-1	42	8	Summer2021	ECN202	3369-MR Khawaja Saifur Rahman	BC3012-S
a03f0645-9514-4f8e-8132-68c71438e733	15:30:00	MW	-1	38	9	Summer2021	ECN202	3494-DR Md. Shahnawaz Karim	BC7025-S
cb7e57a3-ebd3-497f-982e-7609222bf2ca	09:30:00	ST	-1	11	1	Summer2021	ECN203	3461-MS Mumtahina Islam	BC4010-S
85fe89b0-8004-4120-9e74-a3ccff97706a	11:00:00	MW	-1	19	1	Summer2021	ECN220	3621-DR Md. Khaled Saifullah	BC4012-S
3eb302f5-7d59-4fcc-9ec0-364d6fdd8738	09:30:00	MW	-1	20	1	Summer2021	ECN301	3467-MS Nabila Maruf	C4005-S
98c1a8b1-724d-4696-9edd-f2f8ee8d422a	14:00:00	MW	-1	17	1	Summer2021	ECN302	3463-MR Md. Kamrul Islam	BC4011-S
78f243ff-505f-4a4f-b124-e08b56349d79	17:00:00	MW	-1	24	1	Summer2021	ECN320	3565-DR Shahriar Kabir	BC3011-S
71a8516d-9cf6-424d-b4d8-63dc1c8cc15f	12:30:00	ST	-1	28	1	Summer2021	ECN330	3490-MS Nuzhat Sharmeen	C2004-S
3dcf4fd0-7409-4cf3-92c4-d7165729ae9f	09:30:00	ST	-1	7	1	Summer2021	ECN340	3463-MR Md. Kamrul Islam	BC4011-S
e72a2063-7d2f-4158-91bb-2ec4367c8df6	11:00:00	ST	-1	16	1	Summer2021	ECN401	3298-Mr. Shamil M Al-Islam	C3005-S
0fb134e1-3ff8-45cb-9122-e073dfe9892e	14:00:00	ST	-1	9	1	Summer2021	ECN402	3494-DR Md. Shahnawaz Karim	BC4010-S
a2bb2fae-7d92-4837-bd98-55bb3c094a13	17:00:00	ST	-1	10	1	Summer2021	ECN425	3565-DR Shahriar Kabir	BC4010-S
1f4bb816-a792-4896-9b5a-25708a9bf180	08:00:00	MW	-1	11	1	Summer2021	ECN435	3298-Mr. Shamil M Al-Islam	BC3011-S
1bf1f7fb-fb57-4a6b-bee6-ec824ff8beef	15:30:00	MW	B-0	0	1	Summer2021	ECN441	T001-00 TBA TBA	BC4010-S
cb33cf4e-4404-4719-a054-3641b212736a	15:30:00	ST	-1	30	1	Summer2021	ECN470	3369-MR Khawaja Saifur Rahman	BC3009-S
72a7b22b-fda8-4113-9fbe-c3ebdd13519b	12:30:00	MW	-1	10	1	Summer2021	ECN486	3494-DR Md. Shahnawaz Karim	BC4010-S
6977b38b-6c10-483e-9b3a-9a37ee22e8f9	08:00:00	ST	-1	10	1	Summer2021	ECN490	3565-DR Shahriar Kabir	C2005-S
0a571508-b70d-4874-bd9f-7e531b8ecf37	11:00:00	ST	-1	30	1	Summer2021	EEE131	4275-MS Tahsin F. Ara Nayna	C4004-S
b5a2efeb-131a-4c56-91d4-480d0a628711	11:00:00	MW	-1	11	2	Summer2021	EEE131	4275-MS Tahsin F. Ara Nayna	BC4013-S
814ffbcd-0f1e-4716-9512-0c8c0a590279	14:00:00	MW	-1	31	1	Summer2021	EEE132	4286-DR Mustafa Habib Chowdhury	BC6008-S
ea99183a-7259-4c9a-aea9-b89cfb986ab1	09:30:00	ST	-1	42	1	Summer2021	EEE211	4240-DR Kafiul Islam	BC6013-S
40fc7417-7b8d-4c41-992d-f946490f3461	12:30:00	S	-1	20	1	Summer2021	EEE211L	4457-MR Md. Iftadul Islam Sakib	CirLab-S
55d34c45-b5d1-414e-b2ab-5d5d5e7b6435	14:00:00	W	-1	18	2	Summer2021	EEE211L	4457-MR Md. Iftadul Islam Sakib	CirLab-S
ef21e8df-9f87-4c06-9311-335318d2e38f	15:30:00	ST	-1	39	1	Summer2021	EEE221	4142-MS Afroza Sultana	BC5014-S
7f209d21-c34d-4cc5-891d-dc1e20a90805	12:30:00	T	-1	24	1	Summer2021	EEE222L	4462-MR Nazmus Sakib	SIMLAB1-S
625008cb-c747-4d61-9f5a-81c12804fa1e	14:00:00	M	-1	19	2	Summer2021	EEE222L	4462-MR Nazmus Sakib	SIMLAB1-S
08b31518-bc3a-4220-a232-3f9ac8aa6106	09:30:00	ST	-1	40	1	Summer2021	EEE223	4351-MS Navila Rahman Nadi	BC6012-S
d76a280f-202f-4534-b069-4d947b003296	09:30:00	MW	-1	26	1	Summer2021	EEE231	4361-MR Shovasis Kumar Biswas	BC6012-S
dd55f2db-fee8-4fd2-8af5-7e7de6b2b9d2	14:00:00	ST	-1	30	1	Summer2021	EEE232	4142-MS Afroza Sultana	BC6007-S
313adef9-9027-401e-b9f8-a6b66f9c4b11	15:30:00	T	-1	19	1	Summer2021	EEE232L	4458-MR Md. Tawhid Islam Opu	CirLab-S
daadc2e5-17eb-402b-beb3-989b1d810d2a	15:30:00	M	-1	18	2	Summer2021	EEE232L	4458-MR Md. Tawhid Islam Opu	CirLab-S
ee6b6710-d9d3-4ae1-9230-8512d7c39ace	14:00:00	MW	-1	40	1	Summer2021	EEE233	4200-DR Shahriar Khan	BC6009-S
c95a5ce5-706e-4eff-8c42-ffd3f044b925	08:00:00	MW	-1	41	1	Summer2021	EEE234	4361-MR Shovasis Kumar Biswas	BC6007-S
d3bd04a9-7ed1-47bb-9fc7-439243ce3784	08:00:00	T	-1	14	1	Summer2021	EEE234L	4361-MR Shovasis Kumar Biswas	CirLab-S
5a84acca-60b9-42c1-bf96-cac9754782f4	09:30:00	T	-1	26	2	Summer2021	EEE234L	4361-MR Shovasis Kumar Biswas	CirLab-S
bd10751e-3c11-4951-91e5-1bfb9aa3e054	15:30:00	MW	-1	26	1	Summer2021	EEE312	4190-DR Khosru Mohammad Salim	BC5013-S
f2a70aed-a7b9-49c8-8500-ea7b442b6ab4	09:30:00	W	-1	15	1	Summer2021	EEE312L	4352-MS Zaima Tasneem	PowLab-S
75d70987-b6f4-49f4-8dca-58885a656cc3	08:00:00	M	-1	8	2	Summer2021	EEE312L	4352-MS Zaima Tasneem	PowLab-S
c53ca659-6c03-43f1-b482-5f95cb0d17b3	14:00:00	ST	-1	34	1	Summer2021	EEE313	4286-DR Mustafa Habib Chowdhury	BC6008-S
ec90dda4-4734-42cd-bedd-0d04d4b372e1	15:30:00	T	-1	26	1	Summer2021	EEE314L	4360-MR Mohammad Nasfikur Rahman Khan	SIMLAB1-S
72de5f5d-d4f4-49bd-90b3-5d1a5574b897	11:00:00	W	B-0	0	2	Summer2021	EEE314L	T001-00 TBA TBA	SIMLAB1-S
448dedc8-ab79-4a3e-bc19-861b20e6f01b	12:30:00	W	-1	28	1	Summer2021	EEE315L	4406-MR Mohammad Rejwan Uddin	PowLab-S
188193bc-bbf5-4145-988d-d404ffabe530	09:30:00	T	-1	11	2	Summer2021	EEE315L	4406-MR Mohammad Rejwan Uddin	PowLab-S
ca78e2f7-3eeb-40f4-a097-903afa9679b3	17:00:00	T	-1	17	1	Summer2021	EEE316L	4360-MR Mohammad Nasfikur Rahman Khan	SIMLAB1-S
c7a193ec-e002-46a3-a416-2cd36a2387a6	09:30:00	M	B-0	0	2	Summer2021	EEE316L	T001-00 TBA TBA	SIMLAB1-S
4d22c52b-8486-4378-8e37-b77868bfb021	08:00:00	MW	-1	31	1	Summer2021	EEE321	4240-DR Kafiul Islam	BC6008-S
a641d588-3c59-44a9-8f3b-f06f8920faac	09:30:00	M	-1	19	1	Summer2021	EEE321L	4411-MS Fauzia Hoque Shorna	TelLab-S
298d85f7-54f0-4230-80b1-a6d32ab62276	09:30:00	W	-1	18	2	Summer2021	EEE321L	4411-MS Fauzia Hoque Shorna	TelLab-S
bb104496-9708-4a3d-a3b0-9b513aa63a6d	17:00:00	MW	-1	25	1	Summer2021	EEE323	4360-MR Mohammad Nasfikur Rahman Khan	BC5014-S
e25a9b61-98e0-45e7-b143-f717574e6c02	11:00:00	S	-1	20	1	Summer2021	EEE323L	4351-MS Navila Rahman Nadi	SIMLAB1-S
ad8289c5-5864-4463-8b0d-852fd86919da	11:00:00	T	-1	19	2	Summer2021	EEE323L	4351-MS Navila Rahman Nadi	SIMLAB1-S
3b82ed94-26ec-4e9c-abfe-713634d79851	15:30:00	MW	-1	17	1	Summer2021	EEE332	4212-DR Abdur Razzak	BC5014-S
9d431211-8d9c-464b-a592-85b2a5431a7e	14:00:00	S	-1	10	1	Summer2021	EEE332L	4459-MR Md. Rezanul Haque	PowLab-S
69a9693b-3da2-4b03-bd04-18165cab2f83	14:00:00	W	-1	17	2	Summer2021	EEE332L	4459-MR Md. Rezanul Haque	PowLab-S
f27d92f3-1f0f-4150-ad40-35451ad78cf9	11:00:00	MW	-1	29	1	Summer2021	EEE333	4351-MS Navila Rahman Nadi	BC7026-S
f1be6bc1-5623-4db2-99ea-ccde5ec7aa2c	17:00:00	ST	-1	15	1	Summer2021	EEE334	4406-MR Mohammad Rejwan Uddin	MACLAB1-S
fc022211-bbfa-490e-a2a7-cabbf7283544	17:00:00	MW	-1	24	2	Summer2021	EEE334	4406-MR Mohammad Rejwan Uddin	SIMLAB1-S
2a8b708a-4ef8-47fb-8de7-c20a2af6a829	08:00:00	R	-1	8	1	Summer2021	EEE400	4212-DR Abdur Razzak	BCTBA1-S
235bd441-d2ac-48f9-818c-4bd1e6a5ebcf	09:30:00	R	0	0	2	Summer2021	EEE400	4200-DR Shahriar Khan	BCTBA1-S
0a434de2-37a7-4acf-8ba6-e4fa4b7d3a0c	11:00:00	R	-1	13	3	Summer2021	EEE400	4190-DR Khosru Mohammad Salim	BCTBA1-S
e0740f39-b673-48b4-9686-96ee9257401a	12:30:00	R	-1	2	4	Summer2021	EEE400	4199-DR Feroz Ahmed	BCTBA1-S
7d7bee31-be5f-4997-b94c-7db1b0a4313b	14:00:00	R	-1	1	5	Summer2021	EEE400	4240-DR Kafiul Islam	BCTBA1-S
0ec62f9a-fb65-4eea-96aa-b1855fc69413	15:30:00	R	-1	3	6	Summer2021	EEE400	4286-DR Mustafa Habib Chowdhury	BCTBA1-S
21c36312-28e9-4be0-ac94-c6a4ce81e898	17:00:00	R	0	0	7	Summer2021	EEE400	4455-DR Touhidur Rahman	BCTBA1-S
deb67eab-7bd8-4326-9f3c-dcb078c8c1d6	15:30:00	ST	-1	14	1	Summer2021	EEE411	4212-DR Abdur Razzak	BC6007-S
1554242c-f206-416c-9bf4-52c116cb11bf	08:00:00	T	-1	14	1	Summer2021	EEE411L	4352-MS Zaima Tasneem	PowLab-S
a634a9fc-e96f-4520-a32b-527838dbb1d9	08:00:00	W	-1	8	2	Summer2021	EEE411L	4352-MS Zaima Tasneem	PowLab-S
9a574c76-58c3-4d7c-8f41-d465659083e0	14:00:00	ST	-1	38	1	Summer2021	EEE419	4200-DR Shahriar Khan	BC6009-S
831d5076-321f-4e76-975c-97961c8f9308	15:30:00	W	-1	29	1	Summer2021	EEE419L	4297-MR M. Ishtiaque Rahman	PowLab-S
fb62cf81-d6e1-4cd1-bdf3-7332615d3aa8	08:00:00	ST	0	16	1	Summer2021	EEE422	4324-MR Fokhruz Zaman	BC5014-S
0dbcd51a-db75-493f-9c0c-d1eb511f7401	11:00:00	M	-1	32	1	Summer2021	EEE423L	4352-MS Zaima Tasneem	PowLab-S
c4c2afe2-2120-4b95-b64f-d6d6ef8b6fff	09:30:00	MW	-1	26	1	Summer2021	EEE436	4351-MS Navila Rahman Nadi	BC6013-S
216754bb-12cc-4b96-b55d-ab742f50fe03	08:00:00	ST	-1	26	1	Summer2021	EEE438	4190-DR Khosru Mohammad Salim	BC6007-S
5bb68407-a889-4a8d-addc-1c3ba0f06558	12:30:00	MW	-1	5	1	Summer2021	EEE466	4455-DR Touhidur Rahman	BC7015-S
6595fea7-d0b4-47a8-825b-ab1e6c889ee6	15:30:00	MW	-1	25	1	Summer2021	EEE469	4360-MR Mohammad Nasfikur Rahman Khan	BC6007-S
479e435b-6139-4763-a7c6-33e7338986e7	08:00:00	A	0	0	1	Summer2021	EEE497	4142-MS Afroza Sultana	BCTBA3-S
0ca57d91-de5e-44a3-a397-aaca1b4ffec2	11:00:00	A	0	0	2	Summer2021	EEE497	4275-MS Tahsin F. Ara Nayna	BCTBA1-S
a600e303-4e09-413d-b4d4-1216070be1eb	12:30:00	A	0	0	3	Summer2021	EEE497	4351-MS Navila Rahman Nadi	BCTBA1-S
380a577e-130e-4bb3-82d3-8f3c1fe92eb9	08:00:00	F	0	0	1	Summer2021	EEE499	4142-MS Afroza Sultana	BCTBA2-S
30294f40-e5d9-4f7a-a7c1-0eb67aa9c468	11:00:00	F	0	0	2	Summer2021	EEE499	4275-MS Tahsin F. Ara Nayna	BCTBA2-S
2c007e4d-f182-427d-becb-306a5dbd36a4	12:30:00	F	0	0	3	Summer2021	EEE499	4351-MS Navila Rahman Nadi	BCTBA2-S
13cdbfa2-564c-4f73-bd5c-cfcc0f35b16e	11:00:00	ST	-1	21	1	Summer2021	ELL101	2502-MS Afroza Bilkis	C5005-S
6a597119-93d0-4772-8986-a7015082da27	15:30:00	MW	-1	27	2	Summer2021	ELL101	2391-MS Nabila Tahsin Farah	C2004-S
bb903576-ddda-4fd7-bef0-20268a237019	14:00:00	ST	-1	9	3	Summer2021	ELL101	2503-MR Nuran Choudhury	C2005-S
b20a4a4f-d412-4a33-81fc-5ee0db514293	08:00:00	ST	-1	21	1	Summer2021	ELT201	2132-MS Rezina Nazneen Rimi	C3005-S
de41fc05-34d6-430f-914d-9f8314141776	14:00:00	ST	-1	23	1	Summer2021	ELT203	2106-MR Towhid Bin Muzaffar	BC10015-S
6abff536-1909-485a-b1f7-4a37b2e9315d	09:30:00	ST	-1	11	1	Summer2021	ELT204	2002-MS Mithila Mahfuz	BC9015-S
45197d48-8405-4865-a866-7eba7f905770	17:00:00	ST	-1	24	1	Summer2021	ELT301	2106-MR Towhid Bin Muzaffar	C2004-S
947a253b-2cb1-4bfc-9d3c-68dbac8220dc	11:00:00	ST	-1	17	1	Summer2021	ELT303	2136-MR Md. Shaiful Islam	BC8014-S
b853d5dd-fe96-4fce-8b1c-1757c8133f66	09:30:00	MW	-1	28	1	Summer2021	ELT304	2132-MS Rezina Nazneen Rimi	BC4011-S
3b9f8640-a1a1-4508-ac41-116c428e9895	12:30:00	MW	-1	26	1	Summer2021	ELT312	2002-MS Mithila Mahfuz	BC9015-S
f5465bd1-7b7b-465d-aa9c-1ffb1ab7330c	15:30:00	MW	-1	6	1	Summer2021	ELT401	2515-DR Mahmud Hasan Khan	BC4014-S
157fcf2d-1aa2-4e5a-b711-b2d9d4578d15	11:00:00	MW	-1	19	1	Summer2021	ELT411	2002-MS Mithila Mahfuz	BC8014-S
59d4a872-296c-43ee-896c-85f2c3f66684	14:00:00	ST	-1	14	1	Summer2021	ELT414	2136-MR Md. Shaiful Islam	C4005-S
9a09fce3-fbc2-4615-aa0c-db97e2f06519	12:30:00	ST	-1	21	1	Summer2021	ELT416	2002-MS Mithila Mahfuz	C3005-S
5cddc3ca-56bd-4185-954e-7b1fa181c4a9	17:00:00	R	-1	10	1	Summer2021	ELT499	2234-MS Naureen Rahnuma	BCTBA4-S
8e6bd868-fac3-4737-afef-924037017307	08:00:00	MW	-1	41	1	Summer2021	ENG101	2344-MS Nadira Sultana Mirza	BC7016-S
05d4fd29-0198-44e0-a2d8-a9ab22391805	09:30:00	MW	-1	44	2	Summer2021	ENG101	2259-MR G. M. A Mainuddin Chowdhury	BC10014-S
3be346f4-1f71-411a-9495-1c6b5bff3aaf	09:30:00	ST	-1	41	3	Summer2021	ENG101	2483-MR Kazi Mubinul Hasan Shanto	BC8015-S
2a9181e5-6130-4d7f-bc14-072b7d642134	09:30:00	MW	-1	41	4	Summer2021	ENG101	2438-MS Israt Taslim	BC10015-S
cd784eb7-71b9-4a4f-94b8-518f9c926dc2	11:00:00	MW	-1	45	5	Summer2021	ENG101	2344-MS Nadira Sultana Mirza	BC9017-S
fdd005d5-7b9f-48dc-88d1-310ee9545e91	11:00:00	ST	-1	42	6	Summer2021	ENG101	2483-MR Kazi Mubinul Hasan Shanto	BC7016-S
80d295d1-7f92-43a7-8421-90b13399145d	11:00:00	MW	-1	40	7	Summer2021	ENG101	2362-MS Sakira Islam	BC10014-S
21569e4f-d2ed-4e06-b436-28f829adcd6c	11:00:00	ST	-1	41	8	Summer2021	ENG101	2438-MS Israt Taslim	BC7025-S
2889060f-de4c-4bef-947f-a91b7570807f	09:30:00	ST	-1	42	9	Summer2021	ENG101	2452-MS Mir Sadia Siddequa Sifat	BC9014-S
0373d9df-0fc5-49c7-8b6a-c0e9cfcc288d	09:30:00	ST	-1	43	10	Summer2021	ENG101	2493-MS Anika Nawar	BC9017-S
9288150b-6100-4e93-b61d-6c8a2b4a2d8d	12:30:00	MW	-1	43	11	Summer2021	ENG101	2475-MS Khandaker Nayeema Haque	BC7025-S
a975dbae-8a3c-48f1-ab44-9b8103cfb197	12:30:00	MW	-1	37	12	Summer2021	ENG101	2518-MS Mubash-Shera Karishma Mobarok	BC7026-S
227a4fb7-01b0-4e66-a680-b9f5baeda8bd	17:00:00	MW	-1	44	13	Summer2021	ENG101	2332-MS Fatina Sarwar	BC8012-S
431175d1-dbe3-4111-904e-3bc34725970d	17:00:00	MW	-1	43	14	Summer2021	ENG101	2247-MS Sumaiya Islam	BC8015-S
978723ad-53ef-47d8-bdf2-4f39ef278686	08:00:00	ST	-1	42	15	Summer2021	ENG101	2418-MR Md. Ashikuzzaman	BC8015-S
594c9f09-05ec-47c5-824a-6a5a730df69f	14:00:00	ST	-1	42	16	Summer2021	ENG101	2475-MS Khandaker Nayeema Haque	BC7026-S
1e67a7da-c23e-4415-a3f6-85cfa289773c	14:00:00	ST	-1	42	17	Summer2021	ENG101	2518-MS Mubash-Shera Karishma Mobarok	BC7025-S
417e387c-8abf-4bf5-9b14-bac115a7d41c	11:00:00	ST	-1	41	1	Summer2021	ENG102	2133-MS Saara Zabeen	BC7026-S
1f904af5-90b3-4a41-ad44-3cdd3be92f45	11:00:00	MW	-1	39	2	Summer2021	ENG102	2133-MS Saara Zabeen	BC10015-S
8cd09789-439c-4bda-84fa-bb13fac03e2d	12:30:00	MW	-1	36	3	Summer2021	ENG102	2438-MS Israt Taslim	BC8015-S
7e5aa37b-34ce-4313-9b8f-3ba61328df44	11:00:00	ST	-1	40	4	Summer2021	ENG102	2418-MR Md. Ashikuzzaman	BC8015-S
6e12ebab-1304-45c6-af7f-82f874cda19f	08:00:00	MW	-1	35	5	Summer2021	ENG102	2132-MS Rezina Nazneen Rimi	BC7025-S
00c2dea3-2732-4e06-8241-34314a0b7e86	12:30:00	MW	-1	40	6	Summer2021	ENG102	2247-MS Sumaiya Islam	BC9014-S
2a63df9f-cac8-4a7d-86c7-b7b3ca0176aa	08:00:00	ST	-1	22	7	Summer2021	ENG102	2342-MS Nasima Haider	BC9014-S
d99df515-25dd-4c15-9c54-690a74377200	09:30:00	ST	-1	33	8	Summer2021	ENG102	2342-MS Nasima Haider	BC10014-S
1f7159d4-6361-4bad-8174-4d5c1cae223f	15:30:00	ST	-1	31	9	Summer2021	ENG102	2219-MR Md. Ziaul Karim	BC7016-S
fe058730-45b6-443c-b702-43153f5e4d50	14:00:00	ST	-1	39	10	Summer2021	ENG102	2219-MR Md. Ziaul Karim	BC7016-S
46e2a275-b0cc-432f-b11d-05cce64dddd1	08:00:00	MW	-1	40	11	Summer2021	ENG102	2133-MS Saara Zabeen	BC7026-S
96fd7626-2685-42c5-91d0-c4f4e54308b5	09:30:00	ST	-1	40	12	Summer2021	ENG102	2438-MS Israt Taslim	BC10015-S
238e13fb-89ed-4347-be07-38cc2285d46a	12:30:00	MW	B-0	0	13	Summer2021	ENG102	T001-00 TBA TBA	BC9017-S
20d864e9-a34c-45f2-a4ef-8e0bf1eb8b07	15:30:00	MW	-1	39	14	Summer2021	ENG102	2332-MS Fatina Sarwar	BC7026-S
06338f3e-646c-47eb-af2a-7319b71b71cb	14:00:00	ST	-1	39	15	Summer2021	ENG102	2452-MS Mir Sadia Siddequa Sifat	BC7015-S
5b17bdd5-c77f-42ad-b586-9aacc745154a	15:30:00	ST	-1	39	16	Summer2021	ENG102	2362-MS Sakira Islam	BC7025-S
4660abaf-500c-49e8-b1d0-142ebd1806c9	15:30:00	MW	-1	37	17	Summer2021	ENG102	2439-MR Adilur Rahman	BC8011-S
d0bbde0d-0faa-4abc-b93b-a4e8d62c1c64	08:00:00	MW	-1	36	1	Summer2021	ENG105	2259-MR G. M. A Mainuddin Chowdhury	BC8011-S
205a7ae1-821b-4e4d-9e36-2b1599fffc28	08:00:00	ST	-1	15	2	Summer2021	ENG105	2405-MS Jasmine Ferdous	BC9017-S
d9a567c2-5ced-467c-a43c-a960e19bf75b	08:00:00	ST	-1	40	3	Summer2021	ENG105	1105-MR Kamal Uddin	BC10014-S
8f844066-21b7-4492-8354-376066b1b690	09:30:00	ST	-1	25	4	Summer2021	ENG105	2405-MS Jasmine Ferdous	BC10018-S
22f8544e-3ac9-4867-a1fa-e1a54285fd0b	11:00:00	MW	-1	40	5	Summer2021	ENG105	2417-MR Mohammad Serajuddin	BC10018-S
7341bb28-aeb1-4989-bc4a-cfbfe0f3e31e	12:30:00	MW	-1	35	6	Summer2021	ENG105	2357-MR Mohammad Israil Hoque	BC10014-S
166b4859-8709-41cc-9915-cb6bc2963f8a	11:00:00	MW	-1	40	7	Summer2021	ENG105	2463-PROF Rabeya Begum	BC4010-S
b50a21b9-9235-4b3e-9e7c-ba833c99e355	12:30:00	MW	-1	38	8	Summer2021	ENG105	2463-PROF Rabeya Begum	BC10015-S
178d2f82-5e5a-493f-bb0f-36d0fd2c6342	08:00:00	MW	-1	20	9	Summer2021	ENG105	2487-DR AKM Zakaria	BC8012-S
09bd4834-ae4d-4dcd-9f86-efa8caa2c9a2	09:30:00	MW	-1	28	10	Summer2021	ENG105	2487-DR AKM Zakaria	BC8012-S
0fd911b9-5503-49b6-ba22-afddcc325c9d	15:30:00	ST	-1	40	11	Summer2021	ENG105	2408-MS Rumana Amin	BC7026-S
8dc7f52b-5b83-4cb9-a08d-c51fd13780a5	14:00:00	MW	-1	40	12	Summer2021	ENG105	1105-MR Kamal Uddin	BC8015-S
1daacefb-0d42-4dc1-9995-0734fa7d947c	17:00:00	ST	-1	40	13	Summer2021	ENG105	2408-MS Rumana Amin	BC7015-S
2db0e17a-f6c0-4cf2-8862-64824b67ff54	17:00:00	ST	-1	40	14	Summer2021	ENG105	2407-MS Sayeeda Sharmin	BC7016-S
07dc434b-01f2-49f2-98cf-83366589adef	09:30:00	MW	-1	39	15	Summer2021	ENG105	2417-MR Mohammad Serajuddin	BC8015-S
14952d40-c6c8-4b39-8d18-2f9e2b6a9f29	14:00:00	MW	-1	16	16	Summer2021	ENG105	2357-MR Mohammad Israil Hoque	BC8012-S
2988287c-84ae-4ae5-a39f-a0290e841656	15:30:00	ST	-1	38	17	Summer2021	ENG105	2407-MS Sayeeda Sharmin	BC8012-S
965294f1-9fc8-4be5-8af2-ffddfe9a7ebc	09:30:00	ST	-1	30	1	Summer2021	ENG201	2126-MS Sayyeda-tun-Noor Sameera	BC4012-S
6bf30ea6-6aa1-4640-a7ed-c21300164a42	15:30:00	ST	-1	29	1	Summer2021	ENG203	2260-MS Andaleeb N. Chowdhury	BC8014-S
41066715-e6b1-4095-9596-9685e55406db	14:00:00	ST	-1	19	1	Summer2021	ENG204	2126-MS Sayyeda-tun-Noor Sameera	BC4011-S
6934a100-5c75-4b79-8f6d-b671dec405a6	17:00:00	ST	-1	7	1	Summer2021	ENG305	2260-MS Andaleeb N. Chowdhury	C2005-S
f20eec70-1e68-4b7d-ba82-e4b281479d3a	14:00:00	MW	-1	15	1	Summer2021	ENG312	2260-MS Andaleeb N. Chowdhury	C6004-S
6c48da8f-9a2c-4052-b341-e0ad70870869	12:30:00	MW	-1	1	1	Summer2021	ENG313	2516-DR Sarker Hasan Al Zayed	C5004-S
ab33f1e7-b6ac-4c64-a8cd-a6134ce866ab	15:30:00	MW	-1	5	1	Summer2021	ENG316	2260-MS Andaleeb N. Chowdhury	C4006-S
b0678be8-a644-4623-a3ea-4fb68f0a8f47	11:00:00	MW	-1	7	1	Summer2021	ENG403	2516-DR Sarker Hasan Al Zayed	BC9015-S
159f8867-13a0-4d4d-bafb-19f6bd4ffc60	15:30:00	MW	-1	23	1	Summer2021	ENG404	2229-PROF Razia Sultana Khan	BC8013-S
3e099270-4e06-4c0c-998c-018ad0cd2d43	17:00:00	MW	-1	6	1	Summer2021	ENG412	2486-DR Ahmed Ahsanuzzaman	BC8014-S
694ea1e8-18f2-471e-9242-bb115fd46d47	17:00:00	A	-1	7	1	Summer2021	ENG499	2486-DR Ahmed Ahsanuzzaman	BC001-S
9b4278a7-b300-44a7-8ba4-34c43091a53b	14:00:00	ST	-1	33	1	Summer2021	ENV100	5230-MR Md. Ekhtekharul Islam	BC8011-S
d9dab6dc-752f-4f75-b565-5d81b253b079	12:30:00	MW	-1	33	2	Summer2021	ENV100	5536-MS Karishma Sinha	BC7016-S
b840885a-b678-4557-87a0-0d22d9954bb4	11:00:00	MW	-1	38	1	Summer2021	ENV101	5231-MR Saquib Ahmad Khan	BC8012-S
13579676-4dcf-455e-afe2-30f73af62432	17:00:00	MW	-1	33	2	Summer2021	ENV101	5248-MS Tahmina Sultana	BC8011-S
095f322b-7af3-40eb-94bb-6d97989007d2	11:00:00	ST	-1	37	3	Summer2021	ENV101	5230-MR Md. Ekhtekharul Islam	BC8011-S
49044fcc-545e-405d-98b8-1b9738d2e92f	12:30:00	ST	-1	37	4	Summer2021	ENV101	5248-MS Tahmina Sultana	BC8012-S
f6404227-e88b-48b6-bf7f-f700791a1d2a	12:30:00	MW	-1	39	5	Summer2021	ENV101	5207-MR Tanvir Ahmed Haroon	BC8011-S
24fa7802-bbff-4003-a1af-06f9c56419ff	15:30:00	ST	-1	40	6	Summer2021	ENV101	5207-MR Tanvir Ahmed Haroon	BC8011-S
99e48f64-9a4c-4d23-b3c4-10dd207ec3ca	12:30:00	ST	-1	32	7	Summer2021	ENV101	5252-DR Sadia Nazneen Karobi	BC8011-S
659ae2e2-6e27-4dc5-9fcf-0b3b65d22bef	09:30:00	MW	B-0	-1	8	Summer2021	ENV101	5252-DR Sadia Nazneen Karobi	BC8011-S
15c082c5-ca21-45d3-92b2-be82e62198bc	11:00:00	MW	B-0	0	1	Summer2021	ENV102	T001-00 TBA TBA	BC8015-S
a65f5b0d-56b7-420c-8b1d-948b98c8865b	11:00:00	MW	-1	32	1	Summer2021	ENV201	5252-DR Sadia Nazneen Karobi	BC4014-S
62a4929d-635c-436a-9561-577114c027e5	09:30:00	R	-1	11	1	Summer2021	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
a23fb2d4-11a0-440f-b061-502e9ac1d42d	11:00:00	R	B-0	0	2	Summer2021	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
28e17de7-3445-4bbd-bcea-5f9ececd623c	12:30:00	R	B-0	0	3	Summer2021	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
6f028a50-6cee-4861-8f9c-731159133607	11:00:00	ST	-1	16	1	Summer2021	ENV202	5199-DR Shahima Islam	BC9016-S
fee92954-f372-4710-bc5a-658708e78631	09:30:00	MW	-1	21	2	Summer2021	ENV202	5236-DR Mohammad Sorowar Hossain	BC9016-S
840174fe-90f2-47a4-a403-452230953220	11:00:00	R	B-0	0	1	Summer2021	ENV202L	5199-DR Shahima Islam	BLab-S
03c44fc5-8cfa-4fd8-aac2-adb50e4d08ce	12:30:00	R	-1	21	2	Summer2021	ENV202L	5236-DR Mohammad Sorowar Hossain	BLab-S
c33398c6-374e-4003-8bf7-405deeeee4bb	11:00:00	ST	-1	14	1	Summer2021	ENV203	5252-DR Sadia Nazneen Karobi	C6005-S
825a3a08-81ea-4391-bda5-c6038b0b352a	09:30:00	ST	-1	22	1	Summer2021	ENV205	5231-MR Saquib Ahmad Khan	BC8013-S
f0f1b962-bc42-4509-803f-c9563bb7f89a	17:00:00	ST	-1	29	1	Summer2021	ENV206	5248-MS Tahmina Sultana	BC8011-S
8e2427b7-1053-49fd-971c-65785ee563f3	15:30:00	MW	-1	30	2	Summer2021	ENV206	5248-MS Tahmina Sultana	BC4011-S
9579165b-e08b-41b6-bfbe-438e398009db	14:00:00	MW	-1	27	1	Summer2021	ENV208	5236-DR Mohammad Sorowar Hossain	BC4014-S
1a6ae7f3-05b2-4416-9cab-25c29f1ac6b7	11:00:00	MW	-1	49	1	Summer2021	ENV212	5207-MR Tanvir Ahmed Haroon	BC7015-S
326aa715-3f5a-46d7-8342-d9a0e5742daf	11:00:00	ST	-1	29	2	Summer2021	ENV212	5247-DR Tawhid Monzur	C4005-S
f00d86f7-6a7b-49de-8f47-11bbe30051e9	11:00:00	MW	B-0	0	1	Summer2021	ENV216	5212-MR Chowdhury Kamrul Hasan	BC8013-S
a06dabb7-4da9-4708-830f-3e4afeb1cc52	14:00:00	ST	B-0	0	2	Summer2021	ENV216	5212-MR Chowdhury Kamrul Hasan	BC10014-S
13a75bf2-e73b-4608-ba73-2e52fe9506e8	14:00:00	MW	-1	28	1	Summer2021	ENV301	5230-MR Md. Ekhtekharul Islam	BC9014-S
ce7f8234-1cca-4e51-84d9-993d009537d1	17:00:00	ST	-1	30	1	Summer2021	ENV302	5247-DR Tawhid Monzur	BC7019-S
e42591d7-b51e-44f5-833c-1e1a778a45c6	11:00:00	R	B-0	0	1	Summer2021	ENV302L	5247-DR Tawhid Monzur	BC7019-S
3b0c1f38-eee1-486b-9239-6acddda732fd	15:30:00	R	B-0	0	2	Summer2021	ENV302L	5247-DR Tawhid Monzur	BC7019-S
616e617a-c6cd-41f4-85fb-751ddc50d587	14:00:00	R	-1	11	3	Summer2021	ENV302L	5247-DR Tawhid Monzur	BC7019-S
ba6bb7d2-d58a-4849-90c4-718bcf27cc4f	12:30:00	ST	B-0	0	1	Summer2021	ENV303	5207-MR Tanvir Ahmed Haroon	BC8015-S
1c6a79b3-9131-40df-9b26-68182ca90e2d	11:00:00	MW	-1	8	1	Summer2021	ENV304	5236-DR Mohammad Sorowar Hossain	C3003-S
1bf1ef0a-6c1f-4c52-b670-ea3aff2fc187	14:00:00	R	-1	6	1	Summer2021	ENV304L	5236-DR Mohammad Sorowar Hossain	BLab-S
8c817916-8d06-4f4f-ac1a-21a7e41a8749	15:30:00	ST	-1	13	1	Summer2021	ENV307	5230-MR Md. Ekhtekharul Islam	BC8015-S
1197507b-0ab8-4733-8052-309fe53afea5	12:30:00	ST	-1	37	1	Summer2021	ENV310	5199-DR Shahima Islam	C2005-S
7cac1822-0776-4860-99cc-e731e243500c	11:00:00	ST	-1	32	1	Summer2021	ENV312	5207-MR Tanvir Ahmed Haroon	BC10014-S
c5ae200d-b581-4de7-829e-1248b71e26fa	08:00:00	MW	-1	36	1	Summer2021	ENV315	5129-MR Khondkar Ayaz Rabbani	BC8015-S
e054cbbb-dc69-4daa-ba5b-38b57996c5c3	08:00:00	ST	-1	36	1	Summer2021	ENV316	5142-DR Md. Abdul Khaleque	C3004-S
840787b1-0791-47c0-89b8-1bc4c0bf88a1	15:30:00	MW	-1	30	2	Summer2021	ENV316	5142-DR Md. Abdul Khaleque	C3004-S
f52f50c9-c052-4679-ab64-0e3462fcd5f9	15:30:00	ST	-1	35	1	Summer2021	ENV320	5536-MS Karishma Sinha	BC4014-S
42ac1355-2814-48ca-a505-c7cc627008de	08:00:00	MW	B-0	0	1	Summer2021	ENV325	5142-DR Md. Abdul Khaleque	BC8013-S
3906d7e1-c0a9-47e7-9d10-a4cbe00d5489	17:00:00	ST	-1	30	2	Summer2021	ENV325	5142-DR Md. Abdul Khaleque	BC8012-S
0360cc30-540f-479e-8cf4-c34d33a09d87	17:00:00	ST	-1	40	1	Summer2021	ENV330	5256-DR Md. Nazrul Islam	BC8013-S
7b16b03f-e422-447a-8037-20722aaa5fa6	17:00:00	MW	-1	15	1	Summer2021	ENV340	5247-DR Tawhid Monzur	BC7019-S
b82c07d8-fcfd-4808-85d8-78ea443897c4	09:30:00	ST	-1	34	1	Summer2021	ENV346	5215-DR M. H. Rahman	BC8014-S
614a856b-fbb3-42e4-8645-6565ddc2910f	14:00:00	MW	-1	18	1	Summer2021	ENV348	5215-DR M. H. Rahman	BC8013-S
92b432ef-43ae-40b9-85f3-c4edad2dc75c	14:00:00	MW	-1	34	1	Summer2021	ENV350	5536-MS Karishma Sinha	BC9017-S
20d48a29-e918-4862-921e-fb36aa192081	14:00:00	ST	-1	21	1	Summer2021	ENV360	5199-DR Shahima Islam	BC9016-S
117f43a1-6dca-44b5-9820-7b6bb331aa93	12:30:00	MW	-1	47	1	Summer2021	ENV401	5189-PROF M. Z. Abedin	BC8012-S
c0a74731-1e89-41d1-9ab8-b75b03b6b9a6	12:30:00	ST	B-0	0	2	Summer2021	ENV401	T001-00 TBA TBA	C6005-S
f580a643-ef6e-4239-8b91-f671bdeaf3c1	09:30:00	MW	-1	32	1	Summer2021	ENV403	5215-DR M. H. Rahman	BC4010-S
81c81c64-b300-4573-b100-7ffd2bf099a6	17:00:00	ST	-1	29	1	Summer2021	ENV409	5189-PROF M. Z. Abedin	BC8014-S
32ed5b40-5e10-4219-a3ae-f2ef2c09db3d	17:00:00	MW	-1	43	1	Summer2021	ENV410	5326-MS Taspiea Mostofa	BC8013-S
eba569ba-ce8d-432d-b1c3-f5f1c431f455	08:00:00	ST	-1	35	1	Summer2021	ENV415	5129-MR Khondkar Ayaz Rabbani	C4004-S
6ea1507e-de37-4c57-8315-7eec576270a0	08:00:00	R	0	0	1	Summer2021	ENV498	5142-DR Md. Abdul Khaleque	BCTBA3-S
5b0e8f60-0c81-4881-8ab9-c7674a386083	09:30:00	R	-1	3	2	Summer2021	ENV498	5215-DR M. H. Rahman	BCTBA3-S
4cdac536-4ae9-4ac1-b0e7-db922ae66e55	11:00:00	R	0	4	3	Summer2021	ENV498	5236-DR Mohammad Sorowar Hossain	BCTBA3-S
750cba3e-3665-4986-98c2-f91d83fcfc1d	12:30:00	R	-1	4	4	Summer2021	ENV498	5129-MR Khondkar Ayaz Rabbani	BCTBA3-S
96d7176b-fbc8-40ad-91da-46e1b0502a96	14:00:00	R	-1	3	5	Summer2021	ENV498	5199-DR Shahima Islam	BCTBA3-S
6277d707-1229-4edc-b8f9-4e71dfa17220	15:30:00	R	0	0	6	Summer2021	ENV498	5189-PROF M. Z. Abedin	BCTBA3-S
6850576b-bb4b-4a1b-89ab-25d4c0df3903	17:00:00	R	-1	1	7	Summer2021	ENV498	5252-DR Sadia Nazneen Karobi	BCTBA3-S
d5606385-522e-4485-b7a3-730bb3cabd23	08:00:00	R	-1	1	8	Summer2021	ENV498	5247-DR Tawhid Monzur	BCTBA2-S
7a8bcfc2-98ce-41cf-8610-bcc274047a21	17:00:00	R	-1	5	9	Summer2021	ENV498	5230-MR Md. Ekhtekharul Islam	BCTBA2-S
fcf33173-518e-40bd-825c-8e31aad2b5dd	15:30:00	R	-1	5	10	Summer2021	ENV498	5231-MR Saquib Ahmad Khan	BCTBA2-S
69abb9ce-31be-445b-9b0d-942b0f69520f	14:00:00	F	0	4	11	Summer2021	ENV498	5207-MR Tanvir Ahmed Haroon	BCTBA2-S
c4c76b23-b58c-4b98-82b0-065986bc848f	12:30:00	R	0	3	12	Summer2021	ENV498	5536-MS Karishma Sinha	BCTBA2-S
70121960-ad9b-40aa-8799-384c0f096fc4	11:00:00	R	0	0	13	Summer2021	ENV498	5248-MS Tahmina Sultana	BCTBA2-S
bd7335db-e9c5-4c16-8f5a-b43af1915de3	09:30:00	R	-1	21	1	Summer2021	ENV499	5129-MR Khondkar Ayaz Rabbani	BC001-S
cdc6b987-6e91-4425-9d51-72e742bf490c	11:00:00	ST	-1	25	1	Summer2021	ETE312	4199-DR Feroz Ahmed	BC6012-S
3c439785-08fa-4222-bbe7-1589b37e43fd	15:30:00	S	-1	7	1	Summer2021	ETE315L	4461-MR Abdullah Al Noman	TelLab-S
9398e284-df9f-44d0-a2b9-cca386c9bdf4	11:00:00	MW	-1	18	1	Summer2021	ETE322	4199-DR Feroz Ahmed	BC8011-S
c941e73f-b206-434e-be40-780a9466bc79	12:30:00	W	-1	26	1	Summer2021	ETE322L	4275-MS Tahsin F. Ara Nayna	TelLab-S
2e0687ef-49bb-4f94-968f-70442eebd7d4	15:30:00	W	B-0	0	2	Summer2021	ETE322L	4275-MS Tahsin F. Ara Nayna	TelLab-S
74bc5190-3821-46b6-82ed-139987ee5e8b	12:30:00	ST	-1	51	1	Summer2021	ETE331	4275-MS Tahsin F. Ara Nayna	BC6013-S
8e823eb2-a4f5-4279-a7ae-7ff963982243	12:30:00	M	-1	29	1	Summer2021	ETE331L	4275-MS Tahsin F. Ara Nayna	TelLab-S
54f098de-90c4-4f5b-8f65-28610851df8e	15:30:00	M	-1	10	2	Summer2021	ETE331L	4275-MS Tahsin F. Ara Nayna	TelLab-S
6427a3e8-9e1e-472b-bf19-732d95d56aed	15:30:00	ST	-1	6	1	Summer2021	ETE332	4460-DR Tanbir Ibne Anowar	BC6008-S
87aa8cd7-0acc-4655-9fda-71eda8bee8bd	14:00:00	MW	-1	10	1	Summer2021	ETE333	4142-MS Afroza Sultana	BC6012-S
82f3be63-9a1c-4342-a442-5fcb61374ca3	11:00:00	S	-1	10	1	Summer2021	ETE335L	4461-MR Abdullah Al Noman	TelLab-S
1f7251b6-472a-4d7e-9c2c-551db6baf6f1	17:00:00	ST	-1	13	1	Summer2021	ETE413	4297-MR M. Ishtiaque Rahman	BC5013-S
0674f9df-9cf4-42b4-bbcd-5f3aea36808f	08:00:00	MW	-1	12	1	Summer2021	ETE448	4464-MR Md. Rayhan Ahmed	BC5002-S
1efcb8b2-832e-415e-a973-7c5b0d2b086d	09:30:00	ST	-1	50	1	Summer2021	FIN201	3442-MR Anwar Zahid	BC2012-S
db0cd0d1-19fd-4a85-a600-012e52744b32	11:00:00	MW	-1	50	2	Summer2021	FIN201	3479-MS Zaima Ahmed	BC2010-S
4a73fe9f-0266-4c8d-abf9-f92bc94ea595	17:00:00	ST	-1	50	3	Summer2021	FIN201	3588-MR Md. Sajedul Islam	BC2010-S
eda9a054-f1bf-433c-8a84-4aba1d18f88c	12:30:00	MW	-1	48	4	Summer2021	FIN201	3633-DR Imtiaz Ahmed Nevin	BC3010-S
9c02c04a-5e3d-46f2-94c8-7ea604291403	14:00:00	MW	-1	48	5	Summer2021	FIN201	3429-MS Jesmin Mannan	BC2012-S
13a96d4b-1ebf-4ebb-bedc-6d21c95e3b33	12:30:00	MW	-1	49	6	Summer2021	FIN201	3442-MR Anwar Zahid	BC2011-S
fef8ff91-7e89-4dbc-b231-657820291e72	09:30:00	MW	-1	50	7	Summer2021	FIN201	3636-MS Tahmina Ahmed	BC2010-S
ad75e100-63f7-4fbc-8f16-ae2f4dab4ff2	15:30:00	MW	-1	50	8	Summer2021	FIN201	3468-MS Sumaya Zesmin	BC2011-S
fde3f64f-c5f0-4edd-ac8b-e9a4de0cb86b	12:30:00	ST	-1	49	1	Summer2021	FIN301	3442-MR Anwar Zahid	BC2010-S
e5d4af43-a50b-4661-8bbc-c698f2ed352b	08:00:00	MW	-1	50	2	Summer2021	FIN301	3442-MR Anwar Zahid	BC2010-S
a22598bf-fe00-48f2-a6e8-bfee14fdb981	11:00:00	ST	-1	48	1	Summer2021	FIN302	3344-MR Mohammad Fahad Noor	BC2012-S
ed96953b-e876-4a8c-b535-84afa29bfdc9	14:00:00	MW	-1	49	2	Summer2021	FIN302	3344-MR Mohammad Fahad Noor	BC2011-S
cd6e8dcc-90b4-4773-b0cb-776baa61e177	09:30:00	ST	-1	31	1	Summer2021	FIN305	3479-MS Zaima Ahmed	BC2013-S
59ca5cfb-a580-4528-940b-c4441e50b00e	08:00:00	ST	-1	37	1	Summer2021	FIN401	3479-MS Zaima Ahmed	BC2012-S
0a75d504-7a57-4371-8ad3-31f4c2b85549	17:00:00	ST	-1	49	2	Summer2021	FIN401	3617-MR Anis A. Khan	BC2011-S
6072f794-4083-4f19-ac93-83e724a72da2	17:00:00	ST	-1	49	1	Summer2021	FIN405	1747-MR Md. Rayatul Islam	BC2012-S
e4bca22e-fbfe-4492-805f-2b73473e5712	12:30:00	ST	-1	29	1	Summer2021	FIN460	3344-MR Mohammad Fahad Noor	BC2012-S
0e25641b-6a85-4be9-be5a-ccd807e538a1	11:00:00	MW	-1	45	2	Summer2021	FIN460	3442-MR Anwar Zahid	BC2011-S
3dccefc5-9d46-4f90-a320-d9b298893982	12:30:00	MW	B-0	0	1	Summer2021	FIN461	3229-DR Sarwar Uddin Ahmed	BCTBA1-S
be4c039b-5d4c-4ed0-8021-f0ef383cc393	09:30:00	MW	-1	43	1	Summer2021	FIN480	3479-MS Zaima Ahmed	BC7026-S
bb479ba2-52d9-46e4-a968-8dde674b7b4a	08:00:00	MW	-1	33	1	Summer2021	FRN101	2160-DR Rifat Rashid	BC9014-S
ee8d773c-0ab6-4953-9a23-12b9b489be07	09:30:00	MW	-1	33	2	Summer2021	FRN101	2160-DR Rifat Rashid	BC9017-S
34442728-b5f7-41b7-8b94-eed6ce550b78	08:00:00	ST	-1	23	3	Summer2021	FRN101	2286-MR Mohammed Ataur Rahman	BC7015-S
6f552f22-e012-49e7-b400-2a6398b1ce35	09:30:00	ST	-1	30	4	Summer2021	FRN101	2286-MR Mohammed Ataur Rahman	C2005-S
0f7c82e6-8a27-4f69-9255-710d9ba3ada4	09:30:00	ST	-1	23	1	Summer2021	GSG101	2479-DR Marufa Akter	C6004-S
8e7df21f-02fa-4537-b9ce-5f8e26576d3f	14:00:00	ST	B-0	0	2	Summer2021	GSG101	2496-DR Shanawez Hossain	C5004-S
36fe96e7-8eb3-40f9-a287-252db502acc8	09:30:00	MW	0	0	3	Summer2021	GSG101	2213-MS Jessica Tartila Suma	C5004-S
47c32f82-b074-4722-837b-68aeaf120189	14:00:00	MW	-1	14	4	Summer2021	GSG101	2462-MR Md. Ohidujjaman	C4004-S
03301fa2-da43-472a-8e59-7aa86cc23349	11:00:00	MW	B-0	0	5	Summer2021	GSG101	2504-MR Raian Hossain	C2002-S
ba942757-d6f6-4a77-af81-bcdc34505cb0	09:30:00	ST	-1	6	1	Summer2021	GSG102	2496-DR Shanawez Hossain	C2002-S
39c965a9-b674-422b-92fa-3ef161bf863c	11:00:00	ST	-1	6	1	Summer2021	GSG201	2479-DR Marufa Akter	C2002-S
6c4c6534-0bf3-413f-9e67-81bfc06b795c	14:00:00	MW	-1	7	1	Summer2021	GSG203	2504-MR Raian Hossain	C2002-S
d7d40d70-3922-449f-892e-5230b59f31dc	12:30:00	ST	-1	2	1	Summer2021	GSG210	2392-PROF Imtiaz A. Hussain	BC4010-S
894e97c2-46b9-4d3a-9075-2dc0f64b97cb	11:00:00	ST	0	0	1	Summer2021	GSG220	2504-MR Raian Hossain	C2006-S
480abecd-a5df-4525-a8c5-03cd422e0a00	11:00:00	ST	-1	6	1	Summer2021	GSG241	2213-MS Jessica Tartila Suma	C2007-S
7a623498-4602-4dc8-b651-5ad59ddd4bd2	09:30:00	MW	-1	7	1	Summer2021	GSG251	2479-DR Marufa Akter	C2002-S
76547b7e-a866-454c-874d-8270d2d12d7a	15:30:00	MW	-1	2	1	Summer2021	GSG260	2392-PROF Imtiaz A. Hussain	C3007-S
2b58474d-64f0-449a-a63b-6fad1bcfc14f	09:30:00	MW	-1	8	1	Summer2021	GSG282	2504-MR Raian Hossain	C2003-S
2a5ec091-6439-4969-8df1-183f4b4de331	15:30:00	ST	-1	7	1	Summer2021	GSG304	2496-DR Shanawez Hossain	C2002-S
479f24e2-b440-40be-a635-f52117ab817f	11:00:00	ST	-1	3	1	Summer2021	GSG305	2462-MR Md. Ohidujjaman	C2003-S
2d2105fc-0622-45dc-ab17-63e6fe5d3e3c	11:00:00	MW	-1	7	1	Summer2021	GSG306	2462-MR Md. Ohidujjaman	C3007-S
12dbc1a4-1d89-4d0d-a4ef-c1c785f8837d	12:30:00	MW	-1	3	1	Summer2021	GSG311	2392-PROF Imtiaz A. Hussain	C2006-S
3a893aea-c2d2-4032-941d-237a2f9d3797	14:00:00	ST	-1	5	1	Summer2021	GSG480	2462-MR Md. Ohidujjaman	C2003-S
63772912-a5cb-4b05-99f2-74cc27eb2629	09:30:00	ST	-1	5	1	Summer2021	GSG482	2213-MS Jessica Tartila Suma	C6006-S
be9b0853-12ee-4cfc-a126-ab16394a4519	14:00:00	ST	-1	2	1	Summer2021	GSG485	2392-PROF Imtiaz A. Hussain	C2002-S
1d273d0c-7c22-472e-bb04-de10c2644881	15:30:00	R	-1	2	1	Summer2021	GSG498	2479-DR Marufa Akter	BCTBA4-S
247ae60f-0f37-4cd5-8946-ae6ba81bcd45	17:00:00	F	0	0	1	Summer2021	GSG499	2392-PROF Imtiaz A. Hussain	BCTBA1-S
cf53a35b-f6ae-483b-9bc4-eb1ce280afae	11:00:00	MW	-1	34	1	Summer2021	HEA101	5605-MS Zenat Zebin Hossain	C3005-S
a92f82cb-aada-485f-99f1-fb64edd28103	11:00:00	ST	-1	33	2	Summer2021	HEA101	5530-DR Shabareen Tisha	BC9014-S
71ec97f8-347d-487a-a2c5-5ad56ec6dff9	09:30:00	MW	-1	32	3	Summer2021	HEA101	5530-DR Shabareen Tisha	BC9014-S
a9f023d5-62b2-498e-98d3-04679b02ddfc	11:00:00	MW	-1	35	4	Summer2021	HEA101	5530-DR Shabareen Tisha	C4004-S
8729beb6-1d1e-453d-ae0f-d38b19525737	12:30:00	MW	-1	33	5	Summer2021	HEA101	5530-DR Shabareen Tisha	BC10018-S
5d7091b3-c2d7-4c43-b5f1-efe39a7783d2	11:00:00	ST	-1	23	6	Summer2021	HEA101	5591-DR Tasnuva Faruk	BC9017-S
cddfb44b-7329-4300-95dc-630e93a61114	12:30:00	ST	-1	7	7	Summer2021	HEA101	5591-DR Tasnuva Faruk	BC9014-S
0e920047-6245-404e-91ad-cd7847524874	11:00:00	MW	-1	21	8	Summer2021	HEA101	5591-DR Tasnuva Faruk	C4005-S
72e884e6-6571-4f52-8b43-47eb914bd84f	12:30:00	MW	-1	9	9	Summer2021	HEA101	5591-DR Tasnuva Faruk	C3004-S
eeba4da1-c3fd-41a7-b757-0597eae89faa	12:30:00	ST	-1	30	10	Summer2021	HEA101	5606-MR Rabiul Islam	BC9017-S
46125b30-114f-4199-8240-237ba3ede93b	11:00:00	MW	-1	11	11	Summer2021	HEA101	5606-MR Rabiul Islam	C5004-S
049c9aaa-1cfa-4de3-bf20-fde37217b923	12:30:00	MW	B-0	0	12	Summer2021	HEA101	5606-MR Rabiul Islam	C3005-S
df8afb45-b387-4fad-8007-ae7e38084e87	08:00:00	ST	B-0	-2	13	Summer2021	HEA101	5528-MS Samia Aziz	BC7016-S
27be8e2f-601e-4020-8d55-5a7fb5aa53a4	09:30:00	ST	-1	14	14	Summer2021	HEA101	5528-MS Samia Aziz	C3004-S
f538c7f2-75a7-45b0-9c81-99ee9c67bc5c	12:30:00	ST	B-0	0	15	Summer2021	HEA101	5528-MS Samia Aziz	BC10014-S
2d2645f9-77f0-4ace-8af8-a22468dd620c	12:30:00	ST	B-0	0	1	Summer2021	HEA202	T001-00 TBA TBA	BCTBA4-S
ef9a3303-f125-4332-95b7-732449102eab	15:30:00	ST	-1	48	1	Summer2021	HRM301	3444-DR Ikramul Hasan	BC2021-S
68bcbc37-9785-463d-a5d3-5935a9b99206	08:00:00	ST	-1	48	2	Summer2021	HRM301	3413-MR Shafiqul Alam	BC3010-S
84ed80db-1cca-440f-81f2-4db7c0dc2231	09:30:00	ST	-1	46	3	Summer2021	HRM301	3413-MR Shafiqul Alam	BC7026-S
7a9a882f-abb7-4c48-87e9-7f4eea9df7b4	17:00:00	MW	-1	45	4	Summer2021	HRM301	3629-MS Nabila Kamal Promy	BC3008-S
6240ac8f-ab44-41fd-aa5a-115df6d13867	12:30:00	ST	-1	47	5	Summer2021	HRM301	3569-MR Abdullah Al Ahad	BC2021-S
b6a3b571-bc0d-4c8c-92a5-6b213491a9aa	15:30:00	MW	B-0	0	6	Summer2021	HRM301	3446-MS Bushra Sanjana	BC3009-S
5a8490c7-cdb7-46bc-98b4-4f60eca2393f	17:00:00	MW	-1	48	7	Summer2021	HRM301	3403-MR Awal Al Kabir	BC3009-S
170cff9b-6b32-4130-87e4-e195d7653b57	11:00:00	MW	-1	54	1	Summer2021	HRM360	3569-MR Abdullah Al Ahad	BC2012-S
f65ad8d9-78a2-4691-b721-ae356b7d0771	17:00:00	MW	-1	53	2	Summer2021	HRM360	3413-MR Shafiqul Alam	BC2009-S
19001ebc-a9ae-400c-9d69-8467addd97d5	15:30:00	ST	-1	52	1	Summer2021	HRM370	3629-MS Nabila Kamal Promy	BC2012-S
dc412521-e179-4bc8-841a-54156d7410bd	08:00:00	ST	-1	51	2	Summer2021	HRM370	3254-DR A.N.M. Shibly Noman Khan	BC2013-S
e5d127e3-eba1-4a2b-9fdb-e98d6b97f562	17:00:00	ST	-1	52	1	Summer2021	HRM380	3569-MR Abdullah Al Ahad	BC2013-S
de24e421-a760-4c05-9587-373fdb6f72dc	15:30:00	MW	-1	52	2	Summer2021	HRM380	3413-MR Shafiqul Alam	BC2012-S
f80bf18b-c2b9-4739-83cb-f497685008ca	09:30:00	MW	-1	51	1	Summer2021	HRM390	3254-DR A.N.M. Shibly Noman Khan	BC2011-S
88eb06a2-979a-4be1-b8f1-420d7367dde1	14:00:00	ST	-1	52	2	Summer2021	HRM390	3403-MR Awal Al Kabir	BC2011-S
0e080304-e11e-49f3-93ce-662f790d55f0	08:00:00	MW	-1	52	1	Summer2021	HRM410	3254-DR A.N.M. Shibly Noman Khan	BC2011-S
6d2d2f8b-b312-4fb3-b03c-738841bd0fee	14:00:00	MW	-1	52	1	Summer2021	HRM430	3444-DR Ikramul Hasan	BC2013-S
ed16fc9a-ed15-4d5a-80d6-58462dc45416	17:00:00	MW	-1	51	1	Summer2021	HRM460	3569-MR Abdullah Al Ahad	BC2010-S
918f4fcb-f2d0-41dd-b7ff-40171e531341	12:30:00	MW	-1	50	2	Summer2021	HRM460	3413-MR Shafiqul Alam	BC2012-S
3f7b1c91-5516-420c-aa71-07d8ae6e164a	11:00:00	ST	-1	45	1	Summer2021	INB301	3539-MR SM Yusuf Mallick	BC2013-S
112c130e-5d15-469e-9e9f-9d0146cbe289	08:00:00	ST	-1	39	2	Summer2021	INB301	3193-MR Hanif Mahtab	BC2014-S
2dd21c6d-9d4e-4b4a-9432-ec68309801d2	12:30:00	MW	-1	42	3	Summer2021	INB301	3486-MR Hasan Md. Mahmood Ul Haque	BC2013-S
b21ecd49-55e7-4fae-a4d4-cd8f877a7d8b	09:30:00	MW	-1	41	4	Summer2021	INB301	3448-MR Mehadi Mansur	BC2012-S
d63dbc2f-f93a-4159-b7dc-02cd20500d4c	14:00:00	ST	-1	45	5	Summer2021	INB301	3486-MR Hasan Md. Mahmood Ul Haque	BC2012-S
2bae64c8-3747-4ab0-bffc-343bd15ffe26	11:00:00	MW	-1	45	6	Summer2021	INB301	3539-MR SM Yusuf Mallick	BC2013-S
498f551e-7908-4539-b476-45a0cd859353	15:30:00	ST	-1	42	7	Summer2021	INB301	3548-MS Papia Sultana	BC2013-S
a1cb465a-3889-404d-a3a9-ec5868f26115	08:00:00	MW	B-0	0	8	Summer2021	INB301	3299-MR Latiful Khabir	BC2012-S
b5d45fbc-fe33-433a-9d36-2d34ec9efe28	17:00:00	MW	-1	26	9	Summer2021	INB301	3512-MR Kazi Md. Jamshed	BC2011-S
dbc63dd9-ee03-4acd-9674-12062fa72561	15:30:00	MW	-1	40	1	Summer2021	INB302	3607-DR Safayet Rahman	BC3010-S
ad47e9d3-289c-41db-99c2-324f91a707a1	09:30:00	ST	-1	40	2	Summer2021	INB302	3193-MR Hanif Mahtab	BC8012-S
0f09ee87-957c-4b28-91b0-96eda6c9191a	12:30:00	ST	-1	40	1	Summer2021	INB303	3539-MR SM Yusuf Mallick	BC3008-S
22002422-6eac-4886-a877-9e9bd0f389f1	09:30:00	MW	-1	34	2	Summer2021	INB303	3486-MR Hasan Md. Mahmood Ul Haque	BC3010-S
a9d36822-6a04-4146-bc55-e43a0b2bfde6	11:00:00	ST	-1	42	1	Summer2021	INB304	3567-DR Raisul Awal Mahmood	BC2009-S
b90c35d1-5789-4b6b-aded-81d9946294b9	14:00:00	MW	-1	39	2	Summer2021	INB304	3567-DR Raisul Awal Mahmood	BC3008-S
ccd49b13-1762-4502-8825-0588a1be99df	09:30:00	ST	B-0	0	1	Summer2021	INB403	T001-00 TBA TBA	BC2009-S
37f30f72-0776-4882-9326-988ee7ea2c38	12:30:00	ST	-1	48	2	Summer2021	INB403	3607-DR Safayet Rahman	BC3009-S
c5148899-8c22-465b-a4c5-b93c74320c38	15:30:00	MW	-1	38	1	Summer2021	INB405	3423-MR Arifur Rahman Khan	BC2013-S
0df1e6bd-ddc4-4875-b9ef-b9676d14478a	09:30:00	ST	-1	24	1	Summer2021	ITC103	2510-MR Md Anisur Rahman	C6005-S
ea8e0891-c499-4cc0-a74f-7552f5f2080e	14:00:00	ST	-1	30	2	Summer2021	ITC103	2391-MS Nabila Tahsin Farah	C3004-S
f4d6fbb2-1966-4e6e-8169-e8489fa97b83	09:30:00	ST	-1	14	1	Summer2021	LAW101	2445-MR Md Abdul Awal Khan	C3002-S
aec98f85-b5ce-434c-b56a-44fd4ce942f1	14:00:00	ST	-1	18	1	Summer2021	LAW102	2510-MR Md Anisur Rahman	C3005-S
fbdda0ed-9029-4de8-ae9c-a14761f25bd6	09:30:00	ST	-1	19	1	Summer2021	LAW103	2501-MR Md. Al Ifran Hossain Mollah	C3003-S
bf4d4e62-2173-4e4d-a20a-a6c14d0260d7	11:00:00	ST	-1	20	1	Summer2021	LAW104	2445-MR Md Abdul Awal Khan	C4007-S
364c5fd5-6ac8-4f5f-9ac5-04a3a0df3477	14:00:00	MW	-1	19	1	Summer2021	LAW105	2433-DR Md. Mahbubur Rahman	C2004-S
1bf6f13e-0b3d-45c9-b35c-e6facde589ce	12:30:00	MW	-1	25	1	Summer2021	LAW106	2500-DR Zahidul Islam	C3003-S
e6b07d3e-9eaf-4cb7-9fe2-f0da2701ea92	12:30:00	MW	-1	20	1	Summer2021	LAW108	2502-MS Afroza Bilkis	C3006-S
e1ae554e-7a82-482b-ae19-be0138f144b2	11:00:00	MW	-1	19	1	Summer2021	LAW109	2501-MR Md. Al Ifran Hossain Mollah	C5006-S
15c7f6ee-9b49-42cf-8a91-19c6fecfab0f	15:30:00	MW	-1	22	1	Summer2021	LAW201	2433-DR Md. Mahbubur Rahman	C2005-S
d5da2922-c875-4b3b-a290-df62667d1016	11:00:00	ST	-1	20	1	Summer2021	LAW203	2501-MR Md. Al Ifran Hossain Mollah	C5002-S
fdd33289-1687-48e6-96f8-22287d640ab1	09:30:00	ST	-1	13	1	Summer2021	LAW204	2459-DR Assaduzzaman	C3006-S
9ea2532d-f7a9-4893-b583-e5b010723e67	09:30:00	MW	-1	20	1	Summer2021	LAW205	2500-DR Zahidul Islam	C2007-S
38719d97-41ab-4677-9cdc-0be3576c35c7	11:00:00	ST	-1	20	1	Summer2021	LAW207	2510-MR Md Anisur Rahman	C5003-S
9ede0dfa-a214-499b-b6d0-7875b1b87119	12:30:00	MW	-1	24	1	Summer2021	LAW208	2501-MR Md. Al Ifran Hossain Mollah	C3007-S
d95fd99e-d3e0-4ca6-a52b-501c6b57f375	12:30:00	MW	-1	20	1	Summer2021	LAW209	2503-MR Nuran Choudhury	C4002-S
2d9bb8a9-8a8f-4c09-a27a-bd95297e342a	11:00:00	MW	-1	9	1	Summer2021	LAW301	2428-DR Md Parvez Sattar	C5007-S
1f13cc64-3c91-487b-819c-dc9ada6cb25f	14:00:00	ST	-1	19	1	Summer2021	LAW302	2428-DR Md Parvez Sattar	C4004-S
f4dc0cfb-0b7c-4ac5-8a66-fc9757782682	12:30:00	MW	-1	20	1	Summer2021	LAW303	2391-MS Nabila Tahsin Farah	C4003-S
f84a1e0f-4808-4bb5-8267-e82e9a4762ff	11:00:00	ST	-1	9	1	Summer2021	LAW305	2503-MR Nuran Choudhury	C5006-S
bfc7c1ce-fe9c-476d-b8a4-b79110235722	11:00:00	MW	-1	19	1	Summer2021	LAW306	2445-MR Md Abdul Awal Khan	C6002-S
ef012cfa-3b82-4d09-a4b2-4e6b98e905c4	09:30:00	MW	-1	8	1	Summer2021	LAW307	2503-MR Nuran Choudhury	C3002-S
4b1741f6-26ee-4651-8adf-a3bc383215c7	14:00:00	MW	-1	12	1	Summer2021	LAW308	5271-DR Arif Jamil	C2005-S
d15b9f24-9a0b-44e9-abf8-642673764605	12:30:00	ST	-1	19	1	Summer2021	LAW401	2391-MS Nabila Tahsin Farah	C2002-S
327e4e04-3b46-4042-9527-27a746349ab1	14:00:00	ST	-1	7	1	Summer2021	LAW402	2502-MS Afroza Bilkis	C4003-S
fb5e7591-98de-4517-a6dc-6958260d807b	14:00:00	MW	-1	17	1	Summer2021	LAW404	2500-DR Zahidul Islam	C3004-S
f266ad0b-0b29-48ef-97a4-50babf360757	11:00:00	MW	-1	25	1	Summer2021	LEL102	2502-MS Afroza Bilkis	C2003-S
979975b9-c6f6-4528-8111-677a3a5ff036	17:00:00	MW	-1	22	2	Summer2021	LEL102	2432-DR Md. Nazmuzzaman Bhuiyan	C2004-S
51f63b25-40c7-4aad-a456-2ab034c7419d	12:30:00	ST	-1	27	3	Summer2021	LEL102	2428-DR Md Parvez Sattar	BC4012-S
b82b1243-06e6-4929-a031-30dda87e2b81	08:00:00	R	-1	40	1	Summer2021	LFE201	5528-MS Samia Aziz	FT-S
e9422aa5-8bc8-48ad-9887-95b998b07e83	09:30:00	R	-1	40	2	Summer2021	LFE201	5528-MS Samia Aziz	FT-S
e6bfcd5d-ea54-42ec-994a-070f55a0b59f	11:00:00	R	-1	40	3	Summer2021	LFE201	5606-MR Rabiul Islam	FT-S
f794b6f1-a14e-4cdb-bcf2-cb7c1fefe794	12:30:00	R	-1	44	4	Summer2021	LFE201	5606-MR Rabiul Islam	FT-S
3541a9ff-3129-4c5d-a9e1-1fba4e2ff038	14:00:00	R	-1	40	5	Summer2021	LFE201	5207-MR Tanvir Ahmed Haroon	FT-S
43f68659-2f15-4f35-a3fe-93dd9750793c	15:30:00	R	-1	40	6	Summer2021	LFE201	5207-MR Tanvir Ahmed Haroon	FT-S
24e862d0-a7c6-4ba1-9c2b-797283c255e3	17:00:00	R	-1	40	7	Summer2021	LFE201	5605-MS Zenat Zebin Hossain	FT-S
2243a0a7-95d8-4e92-b638-8b93bca1fe1e	18:30:00	R	-1	40	8	Summer2021	LFE201	3467-MS Nabila Maruf	FT-S
ce244015-dccc-49a2-bffd-eb136b4738a5	20:00:00	R	-1	45	9	Summer2021	LFE201	2258-MS Tasneem Shahrukh	FT-S
a7a9abde-ea48-4c2a-8e83-29f4e2e9cc27	09:30:00	ST	-1	3	1	Summer2021	LIN312	2132-MS Rezina Nazneen Rimi	BC9016-S
5757f520-1486-4cac-a526-8857fda4fcd8	14:00:00	MW	-1	5	1	Summer2021	LIN314	2106-MR Towhid Bin Muzaffar	BC8014-S
6f841953-1a1d-49d4-b9dc-a6b0939713d9	15:30:00	ST	-1	4	1	Summer2021	LIN412	2439-MR Adilur Rahman	BC8013-S
67b87e0e-ef08-45ac-90d3-b05ffad43f85	12:30:00	ST	-1	31	1	Summer2021	MAT100	4423-MS Nabila Jaman Tripti	BC5012-S
7d77c7b8-b33d-4e89-8f5c-c73afafc1394	11:00:00	ST	-1	23	2	Summer2021	MAT100	4423-MS Nabila Jaman Tripti	BC5012-S
11c06422-7e59-4042-9c34-4c244cbcce16	11:00:00	MW	-1	7	1	Summer2021	MAT100A	4297-MR M. Ishtiaque Rahman	BC5012-S
0e1b8938-3ec2-4454-af68-b961fadd6ec3	17:00:00	ST	-1	46	1	Summer2021	MAT101	4430-MR Ifte Khairul Alam Bhuiyan	BC5012-S
6f45b330-fe18-427e-a841-f149cdcdfcf3	17:00:00	MW	-1	55	2	Summer2021	MAT101	4255-MS Zainab Lutfun Nahar	BC5012-S
630b1ffd-de16-49b0-8f75-9d226cbfd7a4	11:00:00	MW	-1	51	3	Summer2021	MAT101	4419-MS Nurjahan Akter Nepa	BC5013-S
8c92ad59-585f-4587-968f-b8d801e3dc9d	11:00:00	ST	-1	51	4	Summer2021	MAT101	4327-MS Amrita Khan	BC5013-S
33dda64b-8102-4b94-b147-0dd6c30ccd3a	14:00:00	MW	-1	44	5	Summer2021	MAT101	4327-MS Amrita Khan	BC5012-S
8bfbfdd8-4758-44b9-a3d4-fc1d51c010ae	12:30:00	MW	-1	39	6	Summer2021	MAT101	4430-MR Ifte Khairul Alam Bhuiyan	BC5012-S
d3e4e0fa-444c-4cb7-933e-f7d8d2bb0d5b	12:30:00	MW	-1	49	7	Summer2021	MAT101	4423-MS Nabila Jaman Tripti	BC5013-S
07c553f0-8258-4625-8d92-b3b02f974032	11:00:00	MW	-1	41	8	Summer2021	MAT101	4423-MS Nabila Jaman Tripti	BC5014-S
ef354698-5333-44c4-b5b5-f54d4d907dc1	09:30:00	ST	-1	48	9	Summer2021	MAT101	4318-MS Tahmina Tabassum	BC5012-S
38579e43-6c96-46c2-b53c-2290955843e4	14:00:00	ST	-1	57	10	Summer2021	MAT101	4312-MS Purobi Rani Kundu	BC5012-S
fd391681-4d9f-42cb-ab99-3871eb23f68d	17:00:00	ST	-1	57	11	Summer2021	MAT101	4255-MS Zainab Lutfun Nahar	BC6008-S
50fa8115-453c-4b6b-9bc6-0f13768ba5f0	08:00:00	ST	-1	16	12	Summer2021	MAT101	4312-MS Purobi Rani Kundu	BC6013-S
264e8063-626c-4f44-8606-f5be8bffba71	14:00:00	ST	-1	42	1	Summer2021	MAT104	4378-DR Md. Readul Mahmud	BC5013-S
6291138c-26c3-4eb8-b784-bae9ba80ed8c	09:30:00	ST	-1	29	2	Summer2021	MAT104	4378-DR Md. Readul Mahmud	BC5013-S
92b132c7-8573-4788-9bef-6bdeee230906	09:30:00	MW	-1	40	3	Summer2021	MAT104	4250-DR Asma Begum	BC5012-S
f744be38-53d9-4035-8238-a6fe405e5a35	12:30:00	ST	-1	41	4	Summer2021	MAT104	4419-MS Nurjahan Akter Nepa	BC5013-S
957db7ef-3275-42ec-bce5-b4243c7c1d66	12:30:00	MW	-1	24	5	Summer2021	MAT104	4419-MS Nurjahan Akter Nepa	BC5014-S
42a98d70-9250-42e1-9bf1-32a36cd016d2	11:00:00	MW	-1	47	6	Summer2021	MAT104	4384-DR S N M Azizul Hoque	BC6007-S
86f46920-7fa6-4322-b6b5-c456559a372e	11:00:00	ST	-1	40	1	Summer2021	MAT111	4419-MS Nurjahan Akter Nepa	BC5014-S
3f7f2172-0d9f-4a54-8a32-aa65fc5f2e03	15:30:00	ST	-1	26	1	Summer2021	MAT131	4431-DR Mohammad Nazrul Islam	BC5012-S
06f7a625-3b32-4763-87e8-597f14a809af	11:00:00	ST	-1	52	1	Summer2021	MAT203	4454-DR Jewel Kumar Ghosh	BC6007-S
e9fc472f-1412-4b54-af2a-cf5d7c3aca17	12:30:00	ST	-1	54	2	Summer2021	MAT203	4223-MR Mr. Md. Shariful Islam	BC5014-S
8835981d-0252-430c-a028-3403dd65685f	12:30:00	MW	-1	46	3	Summer2021	MAT203	4119-MS Dr. Rifat Ara Rouf	BC6007-S
0474ed2e-301b-459e-aa54-3ab764a43c2d	09:30:00	MW	-1	18	4	Summer2021	MAT203	4318-MS Tahmina Tabassum	BC5013-S
8af277f4-bfa0-4888-9991-314cef3fea5e	12:30:00	ST	-1	42	1	Summer2021	MAT210	4312-MS Purobi Rani Kundu	BC6007-S
582bda33-c282-4566-b32c-62179fdacc4e	09:30:00	MW	-1	44	1	Summer2021	MAT211	4370-MS Tasnim Mafiz	BC5014-S
ddd45ace-a335-48be-bfe7-44f4cbd02653	11:00:00	ST	-1	56	2	Summer2021	MAT211	4358-MR Mustafa Mohammad Shaky	BC6008-S
78aeb41e-68f7-47de-b674-09cde8e6ba62	11:00:00	MW	-1	53	3	Summer2021	MAT211	4471-PROF Muhammed Siddique Hossain Farayzi	BC6008-S
97fbed3f-9ef3-44af-93df-a69e250aa694	14:00:00	ST	-1	55	4	Summer2021	MAT211	4358-MR Mustafa Mohammad Shaky	BC5014-S
d51a1171-48b1-4e3a-a849-ef1dc438da04	14:00:00	MW	-1	55	5	Summer2021	MAT211	4124-DR Shipra Banik	BC5013-S
5d6b4a7e-eabd-4e11-8448-6dfac818dbaa	09:30:00	ST	-1	55	6	Summer2021	MAT211	4124-DR Shipra Banik	BC5014-S
837acc9d-3019-4505-807d-23f20c73beb4	12:30:00	MW	-1	55	7	Summer2021	MAT211	4311-DR Md. Shafiqul Islam	BC6008-S
e3a7a566-5cfc-4637-8d68-d17f2d301fe5	11:00:00	MW	-1	55	8	Summer2021	MAT211	4411-MS Fauzia Hoque Shorna	BC6009-S
e86e378f-5193-47dd-b91e-98167cc38e4e	11:00:00	ST	-1	55	9	Summer2021	MAT211	4370-MS Tasnim Mafiz	BC6009-S
c36d77cd-d656-4831-b39d-041b76d9c74a	08:00:00	ST	-1	41	10	Summer2021	MAT211	4471-PROF Muhammed Siddique Hossain Farayzi	BC5012-S
0f32d1a3-155a-40e5-a7b5-0441648c9fc9	09:30:00	ST	-1	45	1	Summer2021	MAT212	4358-MR Mustafa Mohammad Shaky	BC6007-S
506becbf-3d3e-405c-a3be-8b5a621151b6	11:00:00	MW	-1	16	2	Summer2021	MAT212	4102-DR Mohammed Anwer	BC6012-S
621effbf-8474-4d60-9353-c521a775ad52	12:30:00	MW	-1	50	3	Summer2021	MAT212	4413-MS Nigar Sultana	BC6009-S
b4bcdb96-5ebf-47db-822e-2e80ee6a3cd2	09:30:00	MW	-1	48	4	Summer2021	MAT212	4124-DR Shipra Banik	BC6007-S
24319160-462b-4854-a004-5fec8087f3f5	08:00:00	MW	-1	27	5	Summer2021	MAT212	4370-MS Tasnim Mafiz	BC5012-S
30260226-b696-4c28-b0e2-fa593a0a0673	09:30:00	ST	-1	49	6	Summer2021	MAT212	4370-MS Tasnim Mafiz	BC6008-S
b7be7a1b-b119-484e-b745-fbcd85fa9727	09:30:00	MW	-1	56	1	Summer2021	MAT213	4308-PROF Laek Sazzad Andallah	BC6008-S
a8ec968c-df7a-4d81-a088-011bf3c18989	17:00:00	MW	-1	21	1	Summer2021	MAT221	4310-PROF Md. Abu Naim Sheikh	BC5013-S
c70befd7-128e-4249-98e3-c553a55e6eab	09:30:00	ST	-1	11	1	Summer2021	MAT225	4119-MS Dr. Rifat Ara Rouf	BC4013-S
a70aba94-1135-41d2-a98a-8034959e52e4	09:30:00	MW	-1	51	1	Summer2021	MAT230	4102-DR Mohammed Anwer	BC6009-S
eb0ad659-e2fd-4cc6-8df2-09c877776258	15:30:00	MW	-1	29	2	Summer2021	MAT230	4318-MS Tahmina Tabassum	BC5012-S
31fc5f48-7948-4851-a473-b24415319409	08:00:00	MW	-1	8	3	Summer2021	MAT230	4318-MS Tahmina Tabassum	BC5013-S
9880159e-01a7-4d0b-933b-76a85d11a74d	11:00:00	MW	-1	56	4	Summer2021	MAT230	4322-PROF Nilufar Farhat Hossain	BC6013-S
893cc443-971e-4954-98f2-d6cee2323dc4	11:00:00	MW	-1	13	1	Summer2021	MAT303	4454-DR Jewel Kumar Ghosh	C3002-S
17afe280-db8e-43ef-b2b2-e216d284a93e	14:00:00	MW	-1	5	1	Summer2021	MAT345	4228-DR Habib Bin Muzaffar	BC9016-S
f748833c-7cd8-468c-98dc-1cf9dc2dd479	12:30:00	S	-1	1	1	Summer2021	MAT399L	4124-DR Shipra Banik	C3002-S
30688771-1146-429a-bb0f-f5896c7c4ac7	17:00:00	MW	-1	13	1	Summer2021	MAT403	4223-MR Mr. Md. Shariful Islam	BC6012-S
f53a509b-b4ca-4e16-91f4-32d75056dae4	09:30:00	MW	-1	1	1	Summer2021	MAT450	4119-MS Dr. Rifat Ara Rouf	C3003-S
4f75e12a-8502-4d60-b4fc-8fcf34e4f254	17:00:00	MW	-1	1	1	Summer2021	MAT489	4257-DR K M Ariful Kabir	BC10017-S
adf69ca3-1b5c-4d62-8dfe-a819f8de8ec8	08:00:00	A	B-0	0	1	Summer2021	MAT499	4228-DR Habib Bin Muzaffar	BCTBA1-S
9734ecfa-91b0-4a00-bc55-02e65589d82e	11:00:00	MW	-1	10	1	Summer2021	MCB101	6010-MS Tasnimul Ferdous	C4007-S
cd5b0416-cafd-424d-bd9c-65c3c292c196	14:00:00	ST	-1	9	1	Summer2021	MCB102	6036-MS Nazratun Nayeem Choudhury	C3003-S
c34f2fa0-02e5-4bba-b53f-e3ea423cc9b8	09:30:00	ST	0	0	1	Summer2021	MCB103	6002-MR Syed A. K. Shifat Ahmed	C2003-S
9a0d5778-b930-46b4-ac15-c189e87df7cd	11:00:00	M	0	0	1	Summer2021	MCB103L	6002-MR Syed A. K. Shifat Ahmed	BC4017A-S
ac9b60ec-64ca-489a-b1a2-e8ddc91842d5	14:00:00	ST	-1	11	1	Summer2021	MCB201	6013-MS Noshin Azra Rahman	C2006-S
79f5847f-eb6b-4f95-80c6-7a7eaa2b685a	15:30:00	ST	-1	20	1	Summer2021	MCB202	6009-DR Ashrafus Safa	BC4017B-S
96235c3a-f8fc-4f5a-8a71-d0a33bd01a27	12:30:00	MW	-1	23	1	Summer2021	MCB204	6070-MR Salman Khan Promon	BC9016-S
ff2cd316-f06b-415f-a395-71504cb2bee6	08:00:00	MW	-1	19	1	Summer2021	MCB210	6002-MR Syed A. K. Shifat Ahmed	BC9016-S
ee1dbfd0-ce07-4eab-b392-f8913a7fb4aa	17:00:00	MW	-1	26	1	Summer2021	MCB301	6033-DR Jebunnahar Khandakar	BC10014-S
b7b642e0-2ba5-4f80-9fb7-b58a5a779aed	15:30:00	ST	-1	11	1	Summer2021	MCB302	6055-DR Rashed Noor	C2007-S
712bc291-584a-49e5-b52f-398674047632	09:30:00	ST	-1	13	1	Summer2021	MCB303	6010-MS Tasnimul Ferdous	C2006-S
fcc0e286-3b4d-4085-a274-e05522bc9366	11:00:00	R	0	13	1	Summer2021	MCB303L	6010-MS Tasnimul Ferdous	BC4017B-S
fc546ced-e8f5-4830-9e86-0a457edef84d	09:30:00	MW	-1	15	1	Summer2021	MCB304	6002-MR Syed A. K. Shifat Ahmed	C3006-S
de6d8d5c-2e1d-4b4d-8fce-e161d75314ec	12:30:00	MW	-1	10	1	Summer2021	MCB309	6010-MS Tasnimul Ferdous	C3002-S
286ecf77-b26b-4dbb-aea2-a33b743723ed	15:30:00	MW	B-0	0	1	Summer2021	MCB311	T001-00 TBA TBA	BC4017A-S
ea06944d-f8ef-43d8-ad69-5eaede9e23fe	12:30:00	ST	-1	16	1	Summer2021	MCB401	6013-MS Noshin Azra Rahman	BC10017-S
03519202-15e7-4db4-92c6-b534ffd47be7	17:00:00	ST	-1	11	1	Summer2021	MCB402	6033-DR Jebunnahar Khandakar	BC10018-S
7e0fb73e-a561-406f-82ba-4cc518ea3102	14:00:00	ST	-1	6	1	Summer2021	MCB403	6033-DR Jebunnahar Khandakar	C3006-S
51c38e0c-f690-4663-bbbd-bb3f6973afa3	15:30:00	MW	-1	21	1	Summer2021	MCB405	6055-DR Rashed Noor	BC10018-S
5e9a1cf1-4ab3-488b-890a-20b63ff83289	11:00:00	ST	-1	12	1	Summer2021	MCB407	6009-DR Ashrafus Safa	C3007-S
7a9db9fe-6036-4f23-a64e-8577f50fbb2a	08:00:00	ST	B-0	0	1	Summer2021	MCB408	T001-00 TBA TBA	BC9016-S
2e7e57a5-b4e5-499f-9e3f-8bf2f20d04ab	14:00:00	MW	-1	14	1	Summer2021	MCB409	6013-MS Noshin Azra Rahman	BC10015-S
2764957c-54d3-4de3-9b9d-d2e78ed21caf	11:00:00	ST	-1	10	1	Summer2021	MCB410	6002-MR Syed A. K. Shifat Ahmed	C4002-S
12571a22-52fc-418d-b009-0af3e6538714	09:30:00	MW	-1	5	1	Summer2021	MCB411	6013-MS Noshin Azra Rahman	BC4017A-S
1762de58-58a2-46e1-b59c-1261ef2551a4	08:00:00	MW	-1	2	1	Summer2021	MCB450	6055-DR Rashed Noor	BC10017-S
33ee373a-1023-45d0-ae6e-e27c07ae14ae	08:00:00	R	-1	1	2	Summer2021	MCB450	6009-DR Ashrafus Safa	BC4017A-S
24f242b9-b94e-4a42-97be-fbb616fa4bc6	08:00:00	R	-1	1	3	Summer2021	MCB450	6033-DR Jebunnahar Khandakar	BC4017C-S
2b7a7c18-fea6-4d67-b519-9fe9e059f9df	09:30:00	R	-1	2	4	Summer2021	MCB450	6054-DR Sabrina Moriom Elias	BC4017A-S
2b2cb3ee-e3a3-4677-8711-b07b1a786014	09:30:00	R	-1	2	5	Summer2021	MCB450	6053-MS Saadia Shareen	BC4017B-S
4f91a622-8eee-4b8f-a4ae-125378ec03c9	08:00:00	F	-1	2	6	Summer2021	MCB450	6002-MR Syed A. K. Shifat Ahmed	BC4017A-S
74be9673-31aa-4bea-8fe7-c968ebee3760	08:00:00	F	-1	1	7	Summer2021	MCB450	6013-MS Noshin Azra Rahman	BC4017B-S
856a3927-bd15-4ecf-ab0a-41166e5fd012	09:30:00	F	-1	1	8	Summer2021	MCB450	6070-MR Salman Khan Promon	BC4017A-S
39e17e52-d4d0-4ac9-865d-b9f767635610	09:30:00	F	-1	1	9	Summer2021	MCB450	6053-MS Saadia Shareen	BC4017B-S
222c897b-8f90-4f23-9841-2165a87cd6e6	14:00:00	F	-1	2	10	Summer2021	MCB450	6073-MR Aftab Uz Zaman Noor	BC4017A-S
281f195b-651a-4697-bf75-2fb833d83144	14:00:00	F	-1	1	11	Summer2021	MCB450	6064-MR Md. Daud Hossain Khan	BC4017B-S
0e84676d-d816-4d96-ba2b-6964f69cb36b	15:30:00	F	B-0	0	12	Summer2021	MCB450	T001-00 TBA TBA	BC4017A-S
c9f94e10-12ca-4df8-90c8-f061409ca27f	17:00:00	F	B-0	0	13	Summer2021	MCB450	T001-00 TBA TBA	BC4017A-S
787f7a5f-38c7-4e2b-bddc-14250f946789	17:00:00	F	B-0	0	14	Summer2021	MCB450	T001-00 TBA TBA	BC4017B-S
28761c7d-cc0b-48b5-b058-c845628e6764	08:00:00	R	-1	1	1	Summer2021	MCB451	6055-DR Rashed Noor	BC4017B-S
cbfa48df-dcf0-46aa-a468-2b21b6188ec8	08:00:00	A	-1	1	2	Summer2021	MCB451	6013-MS Noshin Azra Rahman	BC4017A-S
d3da4586-4482-4e47-9bf6-443cf2bc3c82	08:00:00	A	-1	1	3	Summer2021	MCB451	6070-MR Salman Khan Promon	BC4017B-S
61b8a32d-297b-4d80-8f86-65ba63a4febc	17:00:00	A	-1	4	4	Summer2021	MCB451	6033-DR Jebunnahar Khandakar	BC4017A-S
92c2f00a-5847-43ec-8b2a-10105e766598	17:00:00	A	-1	1	5	Summer2021	MCB451	6009-DR Ashrafus Safa	BC4017B-S
04b679a9-201e-4055-aab7-36b74af271b0	12:30:00	A	B-0	0	6	Summer2021	MCB451	T001-00 TBA TBA	BC4017A-S
fa314b55-c9a1-44fb-a693-d4f6bc99e9e0	08:00:00	MW	-1	48	1	Summer2021	MGT201	3251-MS Farzana Chowdhury	BC2013-S
5c3282cd-6448-4be7-865e-ab35c56faeb5	11:00:00	MW	-1	49	2	Summer2021	MGT201	3251-MS Farzana Chowdhury	BC2014-S
33551369-87e6-4590-819f-84056ff6c30a	12:30:00	ST	-1	48	3	Summer2021	MGT201	3299-MR Latiful Khabir	BC2013-S
0e4c87d4-6578-442e-893c-8f976977476c	15:30:00	MW	-1	48	4	Summer2021	MGT201	3358-MR Mr. Iftekhar Mahfuz	BC2014-S
50d0f10a-473e-4f01-ba06-381dccf8c231	14:00:00	ST	-1	47	5	Summer2021	MGT201	3570-MS Maria Muntahin	BC2013-S
15cc5f35-5664-499d-acd8-73bfadc827f2	09:30:00	MW	-1	46	6	Summer2021	MGT201	3525-MS Afnan Ashfaque	BC2013-S
e83b0032-ae88-44dd-b9aa-f9381061c04e	17:00:00	MW	-1	47	7	Summer2021	MGT201	3323-MS Qantara Khaleda Khan	BC2012-S
ec7a559a-a372-40b9-b9e1-eebcb5f98a79	09:30:00	ST	-1	47	8	Summer2021	MGT201	3525-MS Afnan Ashfaque	BC2014-S
6354e9b1-3e37-42ec-966b-ed50ab844083	12:30:00	MW	-1	49	9	Summer2021	MGT201	3358-MR Mr. Iftekhar Mahfuz	BC2014-S
136f7cd7-d8e4-4ea6-9860-225eed8e17ba	14:00:00	MW	-1	40	1	Summer2021	MGT301	3251-MS Farzana Chowdhury	BC4010-S
f83ab47e-a6c8-4db5-bfd1-2300b4d6eefc	09:30:00	MW	-1	49	1	Summer2021	MGT330	3579-MS Seeratus Sabah	BC2014-S
77b76256-59b0-4cf4-9ad2-d11b2f448dba	17:00:00	MW	-1	48	2	Summer2021	MGT330	3606-DR Md. Kharshiduzzaman	BC2013-S
ab38b71e-69f4-4e8b-ab0c-dfc9460aac33	11:00:00	MW	-1	49	3	Summer2021	MGT330	3579-MS Seeratus Sabah	BC2020-S
035a3587-f0d8-42d9-a638-e8121baa84a0	09:30:00	ST	-1	49	4	Summer2021	MGT330	3615-DR Md. Mamun Habib	BC2020-S
db14f815-6403-403d-88fc-6e99b503ea38	11:00:00	ST	-1	46	5	Summer2021	MGT330	3615-DR Md. Mamun Habib	BC2014-S
a0c9764f-0f5a-4eab-b6ee-e151c95d71ab	17:00:00	ST	-1	47	6	Summer2021	MGT330	3634-DR Muhammad Azizur Rahman	BC2014-S
5400be2a-a6b0-4576-8f94-0e9edd16330e	11:00:00	MW	-1	46	1	Summer2021	MGT340	3135-DR Abul Bashar	C2004-S
89b08c74-a1ff-4c69-bc58-ec75a50da66b	11:00:00	ST	-1	34	1	Summer2021	MGT450	3135-DR Abul Bashar	C2004-S
7929a986-1139-4f50-bafb-480b5111eebb	11:00:00	ST	-1	26	1	Summer2021	MGT490	3525-MS Afnan Ashfaque	BC2020-S
1587829e-8500-47e5-9a15-80084c46e1ef	17:00:00	MW	-1	45	2	Summer2021	MGT490	3358-MR Mr. Iftekhar Mahfuz	BC2014-S
8490b2ad-1cbc-46cd-b1ec-5c12b356b165	11:00:00	MW	-1	39	3	Summer2021	MGT490	3513-PROF Dr. Aminul Karim	BC2021-S
f21d9d71-bbf4-4349-8463-18ef3a9f4757	14:00:00	MW	-1	21	4	Summer2021	MGT490	3403-MR Awal Al Kabir	BC2014-S
ea514e06-3070-4067-8fd7-c7b7bbfbe15a	12:30:00	ST	-1	30	5	Summer2021	MGT490	3486-MR Hasan Md. Mahmood Ul Haque	BC2014-S
d1c94ea6-fc0c-4d1b-bcda-a940ed4abd40	14:00:00	ST	B-0	0	6	Summer2021	MGT490	3299-MR Latiful Khabir	BC2014-S
dddb5273-1aa3-4253-a6be-5029e88dc5b9	09:30:00	MW	-1	44	1	Summer2021	MIS341	3542-MR Md. Aminul Islam	C2004-S
ec130e39-490c-4674-ab68-b831596ee6c2	17:00:00	MW	-1	44	1	Summer2021	MIS401	3559-DR Md. Rakibul Hoque	BC3010-S
e41bec19-c448-45fb-b2c7-d5b143835d58	15:30:00	MW	-1	43	1	Summer2021	MIS405	3605-DR Mohammad Anisur Rahman	BC3012-S
e6d04df2-3c59-4bb2-900b-c35e828648d1	09:30:00	ST	-1	45	1	Summer2021	MIS430	3542-MR Md. Aminul Islam	C2004-S
f4b12681-02a1-4aca-a36e-cd5aa976473b	11:00:00	MW	-1	49	1	Summer2021	MIS442	3566-DR Rezwanul Alam	BC3012-S
99d7ae24-7655-45f8-8aa2-8132fc8f8607	08:00:00	ST	-1	49	2	Summer2021	MIS442	4375-MR Mustafa Nizamul Aziz	BC3011-S
e03ecb8c-f298-4cff-96e8-cdaa36a48483	15:30:00	ST	-1	49	3	Summer2021	MIS442	3423-MR Arifur Rahman Khan	BC3008-S
d77e25dd-1b6d-468c-8bc9-f2fc1c5e839e	14:00:00	MW	-1	49	4	Summer2021	MIS442	3423-MR Arifur Rahman Khan	BC3009-S
8787ce85-2730-4465-85a9-5e62e21a12b2	15:30:00	MW	-1	47	5	Summer2021	MIS442	3542-MR Md. Aminul Islam	BC3011-S
ce53b0e7-9b36-42c9-ac52-3a6d535ae3c2	11:00:00	ST	-1	49	6	Summer2021	MIS442	3542-MR Md. Aminul Islam	BC3011-S
fc364c4b-f936-4eee-89ea-b400f3194c39	14:00:00	ST	-1	47	7	Summer2021	MIS442	3542-MR Md. Aminul Islam	BC3011-S
6a35a7f8-a8e0-4ba4-b731-2b1ae0f59550	09:30:00	MW	-1	48	8	Summer2021	MIS442	3631-MR Md. Rubel	BC3012-S
4744a971-2d2c-4481-935f-6842bbbe2967	14:00:00	MW	-1	32	1	Summer2021	MIS455	3566-DR Rezwanul Alam	BC3010-S
e187907d-4a9c-43bd-bfb0-1a1125dbe6b3	12:30:00	ST	-1	43	1	Summer2021	MIS465	3423-MR Arifur Rahman Khan	C5004-S
e5748644-8793-4ec5-8c6c-1523659afee0	17:00:00	ST	-1	49	1	Summer2021	MKT201	3547-MS Kazi Sharmin Pamela	BC2020-S
9be233b8-6b6a-4e48-be3b-1f240fda75a6	12:30:00	MW	-1	50	2	Summer2021	MKT201	3406-MS Zakia Binte Jamal	BC2020-S
4a34add4-d5c2-4417-af06-65fbc7f80003	15:30:00	ST	-1	49	3	Summer2021	MKT201	3406-MS Zakia Binte Jamal	BC2014-S
c56d0ce6-af50-4510-8c71-87c91cdd3810	11:00:00	MW	-1	50	4	Summer2021	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC3008-S
b7bed618-cdca-4db5-ac04-9a97f1836829	08:00:00	MW	-1	48	5	Summer2021	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC2014-S
250c545d-9ff3-4c85-bd56-35fd1a7b6e76	14:00:00	MW	-1	49	6	Summer2021	MKT201	3318-MR Suman Prosad Saha	BC2020-S
f3fd610e-543d-4623-9d9d-5873363ec90b	09:30:00	ST	-1	50	7	Summer2021	MKT201	3329-MR Abul Khair Jyote	BC2021-S
8329180c-7597-4917-abff-7396c24bbefd	08:00:00	ST	-1	50	8	Summer2021	MKT201	3612-MR Syed Imamuzzaman	BC2020-S
05c3a749-c252-4590-a7f0-11bd930f949c	08:00:00	ST	-1	43	1	Summer2021	MKT302	3638-DR S M Sohel Rana	BC2021-S
b496493a-f568-4d38-a15d-c608273b2040	17:00:00	ST	-1	45	2	Summer2021	MKT302	3583-MR Sheikh Mohammad Fauzul Azim	BC2021-S
271bd139-92c1-4a8f-854f-f597631b6c3c	17:00:00	MW	-1	45	3	Summer2021	MKT302	3612-MR Syed Imamuzzaman	BC2020-S
0e0ba329-8d35-4daa-8017-a8c770f5361f	12:30:00	MW	-1	45	1	Summer2021	MKT340	3583-MR Sheikh Mohammad Fauzul Azim	BC2021-S
e0552391-750c-4eab-a512-0f0df16e50c8	17:00:00	ST	-1	45	2	Summer2021	MKT340	3406-MS Zakia Binte Jamal	BC3008-S
df8a5d3a-f02f-46c7-9524-8c0880900f7d	08:00:00	MW	-1	31	3	Summer2021	MKT340	3638-DR S M Sohel Rana	BC2020-S
a35729b2-24fb-4077-8908-b85969b8c6cc	14:00:00	ST	-1	47	1	Summer2021	MKT350	3583-MR Sheikh Mohammad Fauzul Azim	BC2020-S
ebd1e11c-7404-499c-bc52-e8bb2fc15160	15:30:00	MW	-1	48	2	Summer2021	MKT350	3318-MR Suman Prosad Saha	BC2020-S
5de6b7b6-fefc-4abc-bd71-bed29d7239ce	09:30:00	MW	-1	47	3	Summer2021	MKT350	3435-DR M. Habib	BC2020-S
44128219-9663-4640-b640-77da05048710	17:00:00	ST	-1	48	1	Summer2021	MKT380	3318-MR Suman Prosad Saha	BC3009-S
a7335f59-0700-48ca-9c8f-765fdc40eef1	11:00:00	ST	-1	47	1	Summer2021	MKT401	3329-MR Abul Khair Jyote	BC2021-S
82108149-d649-4850-86ca-67fe39ecc98f	09:30:00	MW	-1	48	2	Summer2021	MKT401	3539-MR SM Yusuf Mallick	BC3011-S
c497f59e-b2f6-4ee4-9290-aec830e5dbfa	15:30:00	MW	-1	48	1	Summer2021	MKT460	3406-MS Zakia Binte Jamal	BC2021-S
5fb8504a-44cc-4de5-b655-8bf842134a5b	11:00:00	MW	-1	47	1	Summer2021	MKT470	3406-MS Zakia Binte Jamal	BC3009-S
d7db6a9b-743d-4a3c-936c-4f66aa8a0894	09:30:00	MW	-1	36	1	Summer2021	MKT481	3185-MR Mohammed Sohel Islam	C3005-S
4cc497cf-a766-469a-a689-a1555d163648	15:30:00	ST	-1	49	2	Summer2021	MKT481	3318-MR Suman Prosad Saha	BC2020-S
c7a2a87e-fa03-4172-876f-cc30bb2d09b2	14:00:00	ST	-1	49	3	Summer2021	MKT481	3329-MR Abul Khair Jyote	BC2021-S
786f930d-5ecc-486f-9885-52cff02e05d1	09:30:00	ST	-1	37	1	Summer2021	MUS101	2397-DR Shahnaz Nasrin	BC7002-S
555feab5-299d-44cf-b21a-f90ff1c8b1b3	09:30:00	MW	-1	27	2	Summer2021	MUS101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
b66e1d5f-3f15-4c85-9a42-9eba36785b4b	11:00:00	ST	-1	49	3	Summer2021	MUS101	2397-DR Shahnaz Nasrin	BC7002-S
8e96e4ef-ba75-498b-a2c3-fe1c6bf3f080	12:30:00	ST	-1	24	1	Summer2021	MUS102	2397-DR Shahnaz Nasrin	BC7002-S
02ce8b20-59e3-4e92-bf3c-534c67e521a1	15:30:00	MW	-1	60	1	Summer2021	NCH101	2389-DR Ranjan Saha Partha	BC7002-S
64f72ca4-3d84-4740-a9ba-d74e1c6b5004	08:00:00	ST	-1	57	2	Summer2021	NCH101	2403-MR Mohammad Masud Rana	BC7002-S
6a21f1a8-772a-4b7f-bb34-84b963be04ad	09:30:00	ST	-1	59	3	Summer2021	NCH101	2403-MR Mohammad Masud Rana	BC5002-S
1acd91ac-8ca8-48ef-b72d-6535f606ddb0	14:00:00	ST	-1	60	4	Summer2021	NCH101	2512-DR Md. Masood Imran	BC5002-S
b4f2c7bb-db52-417f-ae85-1915c43b96e7	15:30:00	ST	-1	59	5	Summer2021	NCH101	2512-DR Md. Masood Imran	BC5002-S
0c85b134-ba8f-4d47-80bd-87a115c1e5a2	17:00:00	ST	-1	36	1	Summer2021	PHA101	5274-DR Md. Saiful Islam	BC9013-S
543c24b0-83d0-49c3-90c1-32cb2635a73d	17:00:00	MW	-1	37	2	Summer2021	PHA101	5274-DR Md. Saiful Islam	BC9013-S
bc8552a0-f234-4e78-b8c8-10b9dcf09a16	15:30:00	MW	B-0	0	3	Summer2021	PHA101	T001-00 TBA TBA	BC9013-S
8a9ca13c-1512-4154-af89-2777e89d1b03	15:30:00	ST	B-0	0	4	Summer2021	PHA101	T001-00 TBA TBA	BC9013-S
66309922-f4b7-48c3-9f9c-8004115b0f57	09:30:00	MW	-1	28	1	Summer2021	PHL101	2307-MR Obydullah Al Marjuk	BC7015-S
8c9e82e3-9fce-4d70-9e8b-7f39b55a4bfe	11:00:00	ST	-1	20	2	Summer2021	PHL101	2335-MS Parsa S. Sajid	BC7015-S
eb205f69-3aba-491b-9e95-05293a2a26ca	08:00:00	ST	-1	36	1	Summer2021	PHY101	4384-DR S N M Azizul Hoque	BC5013-S
6ca397db-0fec-41fe-ac89-f37ffbc0dfe7	14:00:00	MW	-1	31	2	Summer2021	PHY101	4250-DR Asma Begum	BC5014-S
5768217e-6b51-499e-8017-7c5010ab490d	09:30:00	ST	-1	38	3	Summer2021	PHY101	4158-MR Dr. Farhad Alam	BC7025-S
9b0d1684-ed64-480f-aa9a-32cb17a765a0	08:00:00	MW	-1	31	4	Summer2021	PHY101	4429-DR Khan Muhammad Bin Asad	BC5014-S
038c13bd-f4d3-4b81-9eb4-b747e18f803b	11:00:00	MW	-1	36	5	Summer2021	PHY101	4327-MS Amrita Khan	BC7016-S
f56842da-fda4-405f-95da-6f358b040c7a	12:30:00	ST	B-0	0	6	Summer2021	PHY101	T001-00 TBA TBA	BC7015-S
12a35573-0308-47f0-83eb-c9ce71e2309d	12:30:00	S	-1	19	1	Summer2021	PHY101L	4384-DR S N M Azizul Hoque	PLab-S
2b02970b-68c0-415a-9ae7-294617aeb7fb	11:00:00	M	-1	20	2	Summer2021	PHY101L	4250-DR Asma Begum	PLab-S
8e95e8f4-573b-49eb-a659-76a56e12dc02	12:30:00	T	-1	20	3	Summer2021	PHY101L	4378-DR Md. Readul Mahmud	PLab-S
2e7b4f24-0edf-44e8-aefa-f7510a425b48	11:00:00	S	-1	20	4	Summer2021	PHY101L	4158-MR Dr. Farhad Alam	PLab-S
98829ef4-ca40-425d-8962-5b0a6a224998	09:30:00	M	-1	20	5	Summer2021	PHY101L	4327-MS Amrita Khan	PLab-S
d483f0a2-c3e3-47af-be97-a327888c08d2	09:30:00	W	-1	12	6	Summer2021	PHY101L	4378-DR Md. Readul Mahmud	PLab-S
b3d3e8b3-5223-41f7-ae7b-e57c27675122	11:00:00	W	-1	14	7	Summer2021	PHY101L	4250-DR Asma Begum	PLab-S
c0342113-3650-4090-911f-5ea049f893fc	11:00:00	T	-1	20	8	Summer2021	PHY101L	4430-MR Ifte Khairul Alam Bhuiyan	PLab-S
52126ef6-580a-4c1e-8d91-ea84cd901b0e	09:30:00	T	-1	19	9	Summer2021	PHY101L	4384-DR S N M Azizul Hoque	PLab-S
46df64af-1313-470d-a477-d82b744f7c0d	14:00:00	S	B-0	0	10	Summer2021	PHY101L	4430-MR Ifte Khairul Alam Bhuiyan	PLab-S
10e928e0-7fd3-4e5e-81b6-4122280f8221	09:30:00	S	-1	8	11	Summer2021	PHY101L	4430-MR Ifte Khairul Alam Bhuiyan	PLab-S
9ce52e5d-35b3-4a3b-998e-d5251544e172	14:00:00	W	B-0	0	12	Summer2021	PHY101L	T001-00 TBA TBA	PLab-S
012761fc-fb98-4ceb-98bb-c6581a2b8ab9	14:00:00	MW	-1	38	1	Summer2021	PHY102	4112-DR Mostafa Kamal	BC6007-S
091b4f67-1847-48ec-93a6-12f99aa5c87b	11:00:00	MW	-1	43	2	Summer2021	PHY102	4158-MR Dr. Farhad Alam	BC7025-S
93e57e16-c2b2-4410-acf4-be0560ebf7a8	12:30:00	ST	-1	41	3	Summer2021	PHY102	4112-DR Mostafa Kamal	BC6009-S
fc8a9c9c-861e-4701-9fa2-9b7f938129bc	09:30:00	ST	B-0	-2	4	Summer2021	PHY102	4327-MS Amrita Khan	BC7016-S
58dc7b2e-b1f0-4f66-a541-e55f047a2412	12:30:00	MW	-1	41	5	Summer2021	PHY102	4158-MR Dr. Farhad Alam	BC6012-S
01bf6702-ef6a-4a45-b8de-4b8b4db174f7	12:30:00	MW	B-0	0	6	Summer2021	PHY102	T001-00 TBA TBA	BC6013-S
fda421e9-0f88-483e-9405-469bcdc5cc0b	11:00:00	S	-1	21	1	Summer2021	PHY102L	4378-DR Md. Readul Mahmud	PLab2-S
40e127e8-4c7a-4494-a830-7a150f3e3f4f	09:30:00	W	-1	22	2	Summer2021	PHY102L	4158-MR Dr. Farhad Alam	PLab2-S
44381a94-9abe-4056-8d94-a129d1404dbe	12:30:00	T	-1	21	3	Summer2021	PHY102L	4327-MS Amrita Khan	PLab2-S
516b5821-1787-42f4-8614-44f583cc29f3	09:30:00	S	-1	22	4	Summer2021	PHY102L	4384-DR S N M Azizul Hoque	PLab2-S
1e906c77-d997-4608-8f6d-2e3247509ed2	11:00:00	T	-1	22	5	Summer2021	PHY102L	4158-MR Dr. Farhad Alam	PLab2-S
0cfdfa60-9515-4583-ba7e-6387b255fa8e	11:00:00	M	-1	22	6	Summer2021	PHY102L	4430-MR Ifte Khairul Alam Bhuiyan	PLab2-S
6c195c22-bff9-4469-b82c-592a49f14691	12:30:00	S	-1	22	7	Summer2021	PHY102L	4430-MR Ifte Khairul Alam Bhuiyan	PLab2-S
6ff53926-804f-4064-b2ff-fddbd40d35e5	12:30:00	M	B-0	0	8	Summer2021	PHY102L	4429-DR Khan Muhammad Bin Asad	PLab2-S
b86205de-d37f-4e23-bc38-1b5abc86b934	14:00:00	ST	-1	4	1	Summer2021	PHY103	4250-DR Asma Begum	BC4012-S
bdc0d65a-61e7-4568-8a37-913fddc9167d	12:30:00	M	B-0	0	1	Summer2021	PHY103L	T001-00 TBA TBA	PLab-S
fcdd9044-28fa-4899-b488-dabcbfa07617	12:30:00	ST	-1	33	1	Summer2021	PHY111	4429-DR Khan Muhammad Bin Asad	BC6012-S
44025dad-1e2b-43d5-b0d0-d09419d883b6	12:30:00	MW	B-0	0	2	Summer2021	PHY111	T001-00 TBA TBA	C2004-S
4a049fa4-2214-48ee-a6b3-1190e9990a5e	12:30:00	MW	-1	26	1	Summer2021	PHY121	4112-DR Mostafa Kamal	C2005-S
f3e27038-4ee9-4a2d-9977-e6e574fb51cc	15:30:00	ST	B-0	0	2	Summer2021	PHY121	T001-00 TBA TBA	BC5013-S
cb057212-adde-4ac6-8f47-5095aca3489f	09:30:00	M	-1	10	1	Summer2021	PHY121L	4430-MR Ifte Khairul Alam Bhuiyan	PLab2-S
7c222d29-f940-415f-8ba5-a0d09a84bf42	09:30:00	T	-1	9	2	Summer2021	PHY121L	4430-MR Ifte Khairul Alam Bhuiyan	PLab2-S
e2e5c2e5-454a-4585-87a0-5fa958334dd2	12:30:00	W	-1	20	3	Summer2021	PHY121L	4327-MS Amrita Khan	PLab2-S
af5c6a6d-9ab6-41bd-80af-91cada893072	12:30:00	MW	-1	15	1	Summer2021	PHY304	4454-DR Jewel Kumar Ghosh	BC10017-S
8a5f85bc-ed33-44d0-b9be-734aeb3f855d	14:00:00	ST	-1	4	1	Summer2021	PHY308	4338-PROF M Arshad Momen	C6006-S
f816c326-463f-4586-9e5c-893c07148a59	11:00:00	ST	-1	8	1	Summer2021	PHY433	4338-PROF M Arshad Momen	BC9015-S
fc6f4003-bab7-4023-b881-908b4e65d894	17:00:00	MW	-1	1	1	Summer2021	PHY435	4338-PROF M Arshad Momen	C5002-S
4a1885e3-5951-4a19-890c-f3e497422e01	14:00:00	MW	-1	1	1	Summer2021	PHY437	4378-DR Md. Readul Mahmud	C6002-S
f6c56dc1-607b-4fdb-9bc1-5920c1d811aa	11:00:00	ST	-1	27	1	Summer2021	POP201	5231-MR Saquib Ahmad Khan	C5004-S
131deff6-bffc-45b1-824b-bc08b7ed141e	12:30:00	MW	-1	36	1	Summer2021	POP305	5231-MR Saquib Ahmad Khan	BC4012-S
460e2930-b355-4dc5-94b7-e78eb9b8b57d	09:30:00	ST	-1	24	1	Summer2021	SOC101	2200-MS Sharmeen Ahmed	BC10017-S
17e9c4b2-8e4f-4c9b-9eb4-36400d081d5d	09:30:00	MW	-1	9	2	Summer2021	SOC101	2200-MS Sharmeen Ahmed	BC8014-S
784d4b8c-29b1-4b84-ac2d-672fd93996a7	14:00:00	ST	-1	11	3	Summer2021	SOC101	2198-MS Mahbuba Dewan	BC9014-S
c15704e6-a752-4209-91bd-3641a6067f25	11:00:00	ST	-1	14	4	Summer2021	SOC101	2198-MS Mahbuba Dewan	BC8012-S
bdc720df-0271-41f0-bd8d-b0334cfb9d84	11:00:00	MW	-1	14	5	Summer2021	SOC101	2307-MR Obydullah Al Marjuk	BC9016-S
7affa2b2-76f8-4fed-850f-614a3ca8bede	14:00:00	MW	-1	16	6	Summer2021	SOC101	2307-MR Obydullah Al Marjuk	BC7016-S
92e6b958-c9b5-4f77-a8ce-fcab58966c09	15:30:00	MW	-1	11	1	Summer2021	SOC201	2485-MR A. K. M Nurun Nabi	BC4012-S
1f930250-90dc-438f-b4cf-075167c3f9b1	17:00:00	MW	-1	11	1	Summer2021	SOC201L	2485-MR A. K. M Nurun Nabi	BC7015-S
5e307e66-9cc4-4b93-bc4a-61369ca5bdcb	09:30:00	MW	-1	28	1	Summer2021	SOC202	2198-MS Mahbuba Dewan	BC8013-S
125f39cf-a580-4bd5-b0df-cb830ea57606	12:30:00	MW	-1	4	1	Summer2021	SOC208	2198-MS Mahbuba Dewan	BC8013-S
1d081a6d-9d46-457c-8118-fdca6645d4d7	11:00:00	MW	B-0	0	1	Summer2021	SOC301	2200-MS Sharmeen Ahmed	C3006-S
162851a2-d669-4457-a5e5-a16e196ec599	15:30:00	ST	-1	4	1	Summer2021	SOC302	2207-MR S. Aminul Islam	BC4011-S
df544311-4c84-409f-aca6-4f603f064e8e	11:00:00	ST	-1	9	1	Summer2021	SOC312	2485-MR A. K. M Nurun Nabi	BC10017-S
fe8fbea9-4f5d-43c6-bbcf-f7c4fd2cdfec	17:00:00	ST	-1	7	1	Summer2021	SOC320	2165-PROF A. I. Mahbub Uddin Ahmed	BC9015-S
260069f6-ed55-4410-ad35-b041c743f7ed	15:30:00	MW	-1	4	1	Summer2021	SOC405	2207-MR S. Aminul Islam	BC9015-S
f470264a-2326-4037-b1d5-2868895a8b67	13:00:00	ST	0	2	1	Summer2021	SOC499	2200-MS Sharmeen Ahmed	BC001-S
7e56c190-6a83-437b-ab17-45398e437271	09:30:00	MW	-1	25	1	Summer2021	TCL104	2459-DR Assaduzzaman	C5005-S
fdff3daf-f05d-42ba-b472-6669939e9c20	11:00:00	MW	-1	16	2	Summer2021	TCL104	2459-DR Assaduzzaman	C2006-S
62eea733-97f6-4fa9-9224-560b7241f2f0	14:00:00	ST	0	50	10	Autumn2021	ACN201	3585-MR Nafees Reza	BC3008-S
87790b79-0295-42d4-a61a-e7044eb566cc	08:00:00	MW	0	48	1	Autumn2021	ACN202	3427-MS Nimat Zarin	BC3008-S
26eaa853-b8d3-40fc-a5ca-9816db0b49a5	09:30:00	ST	0	48	2	Autumn2021	ACN202	3478-MR Md. Safiuddin	BC3010-S
f557089d-a39c-4d9b-96d0-cdbe5e341420	14:00:00	MW	0	49	3	Autumn2021	ACN202	3493-MR Ashraful Arefin	BC3010-S
fd001763-2733-4d14-9d49-89360e699d4e	09:30:00	ST	0	49	4	Autumn2021	ACN202	3600-MR Prahallad Chandra Das	BC3011-S
05c41a74-4e4c-44d1-8551-d48d94ecb694	14:00:00	MW	0	51	5	Autumn2021	ACN202	3585-MR Nafees Reza	BC3011-S
5c88477f-80d6-4fae-a922-8f68e1a425e1	14:00:00	ST	0	50	6	Autumn2021	ACN202	3478-MR Md. Safiuddin	BC3009-S
c797bebc-877b-4fce-9eaf-5f8838336155	11:00:00	ST	0	42	7	Autumn2021	ACN202	3347-MR Maqbool Kader Quraishi	C3004-S
8b0fd9e0-ead8-4c5f-b57a-435559e83e76	08:00:00	ST	0	49	8	Autumn2021	ACN202	3269-MR Zeeshan Abedin	BC2021-S
b9e83c03-652c-4fbd-bc75-a3b30d3583b7	09:30:00	MW	0	12	1	Autumn2021	ACN301	3147-DR Rushdi Rezaur Razzaque	BC3011-S
cde6c9fa-e581-48a9-b97f-86f45bda2f91	09:30:00	ST	0	28	2	Autumn2021	ACN301	3347-MR Maqbool Kader Quraishi	BC3012-S
a3b31fd7-339b-4625-a409-87832c904418	09:30:00	ST	0	30	1	Autumn2021	ACN305	3147-DR Rushdi Rezaur Razzaque	BC10014-S
6e08108c-b107-46e8-ad79-f3c4ead957d1	12:30:00	MW	0	20	2	Autumn2021	ACN305	3478-MR Md. Safiuddin	BC3012-S
35ca89d9-a541-4451-a7bb-c4551d179cee	09:30:00	MW	0	49	1	Autumn2021	ACN402	3478-MR Md. Safiuddin	BC3012-S
9c83b711-be02-4c41-beab-cea5aad1dc1b	12:30:00	MW	0	23	1	Autumn2021	ACN403	3347-MR Maqbool Kader Quraishi	BC10014-S
fa36c953-0fec-4f55-8406-2bbb8b938096	08:00:00	ST	0	29	2	Autumn2021	ACN403	3427-MS Nimat Zarin	BC3008-S
44cee995-0407-4ed6-80ff-3b473338e3fc	08:00:00	ST	B-0	-1	1	Autumn2021	ACN405	3376-MR Naheem Mahtab	BC3009-S
43761d82-2784-461e-ad32-26bf8e27bf5c	11:00:00	ST	0	22	2	Autumn2021	ACN405	3563-MR Mohammed Naveed Siddiquee	C3005-S
2a446e16-d161-4b40-9a20-a58b654d0324	08:00:00	MW	0	11	1	Autumn2021	ACN406	3376-MR Naheem Mahtab	BC4010-S
4bdfaae7-414b-4721-a719-d8f32ceba46b	17:00:00	MW	0	52	1	Autumn2021	ACN441	3563-MR Mohammed Naveed Siddiquee	BC3008-S
f96051b2-4d20-4ffc-bcb5-c9c3269721f8	14:00:00	ST	0	52	2	Autumn2021	ACN441	3563-MR Mohammed Naveed Siddiquee	BC3010-S
ff152f61-f58c-4435-a354-6e16b80bd03d	14:00:00	ST	0	40	1	Autumn2021	ANT101	2194-MR Mohammad Mahfuzul Islam	BC8015-S
10a0924e-e887-4ba5-b9f1-8d73a827ca88	14:00:00	MW	0	40	2	Autumn2021	ANT101	2194-MR Mohammad Mahfuzul Islam	BC8011-S
4eca6f46-cb23-4b4b-8cd8-2791e68ab13d	12:30:00	MW	0	36	3	Autumn2021	ANT101	2472-MS Tahsina Ferdous	BC8012-S
518e5124-7e80-4ce0-8368-96c87f6b3844	11:00:00	MW	0	18	4	Autumn2021	ANT101	2472-MS Tahsina Ferdous	C4004-S
3c732920-2a09-45fc-9f56-347057fade3a	14:00:00	MW	0	7	5	Autumn2021	ANT101	2519-DR A H M Zehadul Karim	C3005-S
36bdd858-bea5-4b49-8ed9-72e2292840f1	11:00:00	ST	0	25	6	Autumn2021	ANT101	2521-DR Md. Faruk Shah	BC4011-S
15f35b8b-97ab-415c-b0ec-fa1c95465a04	12:30:00	ST	0	7	7	Autumn2021	ANT101	2521-DR Md. Faruk Shah	BC9014-S
f90db4d8-19ae-4690-a7d2-4b16c88e1779	11:00:00	MW	0	9	1	Autumn2021	ANT201	2519-DR A H M Zehadul Karim	C6006-S
1a838936-2fcb-4ad3-a790-49bd71cc6228	09:30:00	MW	0	7	1	Autumn2021	ANT209	2472-MS Tahsina Ferdous	C2003-S
c8b12fd7-025d-4922-a11b-21539868fee7	15:30:00	ST	0	10	1	Autumn2021	ANT210	2194-MR Mohammad Mahfuzul Islam	BC4013-S
894c8ed9-29f7-4e64-bdd8-faa2c2173f0c	17:00:00	MW	0	12	1	Autumn2021	ANT306	2389-DR Ranjan Saha Partha	BC8014-S
9a425f94-3bfd-490d-a71d-5beb96b762b2	15:30:00	MW	0	6	1	Autumn2021	ANT403	2194-MR Mohammad Mahfuzul Islam	BC9015-S
7d1f3f8e-31b2-42a9-b963-36a59428aba7	17:00:00	ST	0	10	1	Autumn2021	ANT405	2512-DR Md. Masood Imran	BC8014-S
682503ff-343a-4b2b-82d7-d15b5ac23841	12:30:00	ST	B-0	0	1	Autumn2021	ANT416	T001-00 TBA TBA	C2006-S
6658007b-d083-4242-a683-6315969e72aa	08:00:00	ST	0	4	1	Autumn2021	ANT499	2194-MR Mohammad Mahfuzul Islam	BC001-S
76a465b2-52ad-4ffb-8665-a8d3889d544a	08:00:00	F	0	238	1	Autumn2021	BBA499A	3329-MR Abul Khair Jyote	BCTBA1-S
d42ce08a-fcb4-4650-9a2a-772741d0bad5	09:30:00	F	0	1	1	Autumn2021	BBA499B	T001-00 TBA TBA	BCTBA1-S
ab98bcb5-98a4-4d2a-afdc-c0bbc1824790	12:30:00	ST	0	7	1	Autumn2021	BCB103	6072-MR A.B.M. Rezwanul Kabir	BC4012-S
9cddf6d8-7622-4cd2-a20e-20fe71aedf32	11:00:00	M	0	7	1	Autumn2021	BCB103L	6072-MR A.B.M. Rezwanul Kabir	BC4017A-S
2fae2d7b-f485-46e5-bea2-76b8d2e230db	12:30:00	MW	0	9	1	Autumn2021	BCB104	6072-MR A.B.M. Rezwanul Kabir	BC9016-S
f27d5d47-8488-41b2-9034-6095ee5f5dac	14:00:00	R	0	9	1	Autumn2021	BCB104L	6072-MR A.B.M. Rezwanul Kabir	BC4017B-S
71f99995-a1b4-49b0-a323-307cc426e31a	11:00:00	ST	0	25	1	Autumn2021	BCB201	6053-MS Saadia Shareen	C2002-S
3774e965-d3ab-46b1-856a-5cdd6cad2d1a	12:30:00	R	0	30	1	Autumn2021	BCB201L	6053-MS Saadia Shareen	BC4017A-S
0d8f3906-e24c-4d41-a909-d6e5b791be88	15:30:00	MW	0	19	1	Autumn2021	BCB204	6070-MR Salman Khan Promon	BC10017-S
8da9988d-5d43-4a62-80b2-95efe9a65927	14:00:00	MW	0	16	1	Autumn2021	BCB205	6064-MR Md. Daud Hossain Khan	C2002-S
a9226391-3ed4-48e6-bc21-c1d89e786128	17:00:00	MW	0	20	1	Autumn2021	BCB206	6036-MS Nazratun Nayeem Choudhury	C3006-S
1580057a-1857-43e7-97f2-4604a98890ad	12:30:00	ST	0	17	1	Autumn2021	BCB207	6073-MR Aftab Uz Zaman Noor	BC4017A-S
89ae8146-a704-4967-8336-183b8b2e16d0	15:30:00	ST	0	14	1	Autumn2021	BCB301	6073-MR Aftab Uz Zaman Noor	C2003-S
93d7e405-9843-4647-ac41-a6b7bf081e2e	08:00:00	MW	0	31	1	Autumn2021	BCB303	6054-DR Sabrina Moriom Elias	BC10015-S
dd50a536-3a36-41eb-8d53-8361085a6cec	14:00:00	ST	0	14	1	Autumn2021	BCB304	6070-MR Salman Khan Promon	C3002-S
17c0e8dd-a54e-4cba-b700-5acb949c0c95	17:00:00	ST	0	6	1	Autumn2021	BCB307	6070-MR Salman Khan Promon	BC10015-S
c97318cd-bfc6-4245-b786-03335bb99730	11:00:00	MW	0	18	1	Autumn2021	BCB309	6073-MR Aftab Uz Zaman Noor	C5007-S
b0298d4c-44d0-4b21-a838-8bb0e3426293	14:00:00	ST	B-0	0	1	Autumn2021	BCB401	T001-00 TBA TBA	C2003-S
2158fd9e-f4ed-4d9e-88ed-85a747193376	14:00:00	MW	0	12	1	Autumn2021	BCB405	6073-MR Aftab Uz Zaman Noor	C2003-S
10fb4af0-6c51-4159-8e14-286bce27d094	15:30:00	MW	B-0	0	1	Autumn2021	BCB409	T001-00 TBA TBA	C3006-S
98573fed-9709-4877-a549-be8aff61efd1	17:00:00	MW	0	13	1	Autumn2021	BCB413	6064-MR Md. Daud Hossain Khan	C3002-S
4ca14f5b-6941-4b43-a852-40a47f2f76a2	15:30:00	MW	0	24	1	Autumn2021	BDS109	2281-MR Mahmud Hasan Kayesh	BC7026-S
13e79c96-a6bd-4d34-81e6-90be08223d1c	09:30:00	ST	0	35	2	Autumn2021	BDS109	2255-MS Momtaz Parvin Mumu	BC7016-S
9a2d8b64-89d3-4eba-b615-40bc64690dd8	11:00:00	MW	0	35	3	Autumn2021	BDS109	2524-MR Asif Bin Ali	BC9017-S
b0c9d449-836e-444b-b964-e370ef90e8cf	11:00:00	ST	0	36	4	Autumn2021	BDS109	2442-MS Mushfeqa Islam	BC9017-S
3d8c0ed7-a71e-4706-8d06-6e9d30cc06b0	14:00:00	MW	0	35	5	Autumn2021	BDS109	2481-DR Zahed-Ur- Rahman	BC8015-S
31db9780-fea8-4b4f-a74b-81df28fe440a	17:00:00	MW	0	33	6	Autumn2021	BDS109	2481-DR Zahed-Ur- Rahman	BC9014-S
61902554-a72a-417c-bbdf-d83b4022c6c5	14:00:00	ST	0	17	7	Autumn2021	BDS109	2281-MR Mahmud Hasan Kayesh	BC7026-S
e02ec1a0-1e51-4b9e-8b72-f4379b80f655	17:00:00	ST	B-0	0	8	Autumn2021	BDS109	2497-MR Hamza Kamal Mostafa	BC7015-S
b3ff1a86-a402-4c12-9ff1-a54c5da49527	11:00:00	ST	0	37	1	Autumn2021	BIO100	6036-MS Nazratun Nayeem Choudhury	BC9015-S
75a94331-929f-4fb3-9276-caa45dbf9bd9	12:30:00	ST	0	30	2	Autumn2021	BIO100	6053-MS Saadia Shareen	BC4013-S
5426e41a-c096-40e3-a2a6-af986674e899	14:00:00	ST	0	36	3	Autumn2021	BIO100	6036-MS Nazratun Nayeem Choudhury	BC10014-S
4790b993-6c5b-4cba-b03a-843a57fe5ec7	11:00:00	MW	0	30	4	Autumn2021	BIO100	6036-MS Nazratun Nayeem Choudhury	BC8013-S
455ff0a8-e287-4e57-9861-ae3ca8be763c	12:30:00	MW	0	30	5	Autumn2021	BIO100	6036-MS Nazratun Nayeem Choudhury	C5004-S
a9393b6a-bd0d-4e2a-b13a-a8bf956b508d	14:00:00	MW	0	36	6	Autumn2021	BIO100	6053-MS Saadia Shareen	BC10014-S
707f449c-ba65-4010-bc46-e4cd57550cf1	08:00:00	MW	B-0	0	7	Autumn2021	BIO100	T001-00 TBA TBA	BC10014-S
b08e6477-f69e-4657-918c-f6461aec9828	08:00:00	ST	0	0	8	Autumn2021	BIO100	T001-00 TBA TBA	C2005-S
98115cda-d382-4b55-8b71-2e0a42e57e05	17:00:00	ST	B-0	0	9	Autumn2021	BIO100	T001-00 TBA TBA	BC10014-S
6649e412-0840-4209-bce2-d7a7efd17fe9	14:00:00	ST	B-0	-1	10	Autumn2021	BIO100	T001-00 TBA TBA	C5005-S
80e0512b-1843-499b-9521-9443aec3b4a7	14:00:00	MW	B-0	0	11	Autumn2021	BIO100	T001-00 TBA TBA	C4004-S
0b63a6fc-1935-4bb7-92b1-352b73a12851	12:30:00	MW	0	19	1	Autumn2021	BIO101	5536-MS Karishma Sinha	C4004-S
c4d2884a-8aac-42ee-8fe5-171f436459bd	11:00:00	MW	0	37	1	Autumn2021	BIO102	6053-MS Saadia Shareen	BC8014-S
0c3a339b-3cda-4d67-8210-6565c7879347	11:00:00	MW	0	25	2	Autumn2021	BIO102	6064-MR Md. Daud Hossain Khan	C6007-S
c08e361b-3cab-4d22-a441-5d6c9c23c3e9	12:30:00	W	0	37	1	Autumn2021	BIO102L	6053-MS Saadia Shareen	BC4017A-S
c91a7437-430e-4219-95f1-6ae20ad265e8	12:30:00	W	0	25	2	Autumn2021	BIO102L	6064-MR Md. Daud Hossain Khan	BC4017B-S
2d9d9b1a-07af-4c50-9a6b-f04a5d0c01de	11:00:00	ST	0	9	1	Autumn2021	BLA101	2446-DR Muhammad Shajjad Ahsan	BC5002-S
e623f2a4-dbd8-49dc-a00e-c564154927ef	14:00:00	ST	0	14	2	Autumn2021	BLA101	2446-DR Muhammad Shajjad Ahsan	BC3002-S
dc055c9a-6233-441a-83ed-e0b7ae82f9b0	11:00:00	ST	0	26	1	Autumn2021	BNG201	2388-DR Lutfor Rahman	BC4014-S
0c9821d2-829c-4853-b9db-00ded72369fa	12:30:00	ST	0	30	2	Autumn2021	BNG201	2388-DR Lutfor Rahman	BC10015-S
7c5b1c87-a8d0-4160-a845-368468485b9e	11:00:00	MW	0	32	3	Autumn2021	BNG201	2427-MR Shaikh Mahfuzur Rahman	BC4014-S
b219dbbf-29e1-4332-b388-41644ad90cde	15:30:00	MW	B-0	0	4	Autumn2021	BNG201	2517-DR Soumitra Sekhar	BC9014-S
f7e0edec-82ee-4f6a-b112-7cb15a82d0c4	14:00:00	ST	B-0	-1	1	Autumn2021	BPH101	2312-MR Muhammad Zamir	BC7002-S
e674196b-9fef-4c3a-8ec4-87c0d16228b0	17:00:00	ST	0	25	2	Autumn2021	BPH101	2498-PROF Taiabur Rahman	BC7002-S
93e5a7e3-3870-4cb3-98a6-7cce2d3e714a	15:30:00	MW	0	45	3	Autumn2021	BPH101	2398-MR Sayed Abu Touab Shakir	BC7002-S
58476ab9-ca69-4374-962e-b7ce930c20d0	17:00:00	MW	0	44	4	Autumn2021	BPH101	2398-MR Sayed Abu Touab Shakir	BC7002-S
c0f2744f-9a70-42af-a050-ade196d9434b	08:00:00	ST	0	39	1	Autumn2021	BUS201	3251-MS Farzana Chowdhury	BC2009-S
53bd96af-1f43-4cdc-8d40-b0bef35321b6	11:00:00	ST	0	41	2	Autumn2021	BUS201	3251-MS Farzana Chowdhury	BC2009-S
8fe94ea3-d3fe-46b7-b5b9-ccb36e2faf81	14:00:00	ST	0	40	3	Autumn2021	BUS201	3423-MR Arifur Rahman Khan	BC2009-S
033ed424-7b86-4986-875e-b58ed910f2f8	14:00:00	MW	0	40	4	Autumn2021	BUS201	3539-MR SM Yusuf Mallick	BC2009-S
5ec777a5-b17e-484e-aae2-178a7d3cefef	15:30:00	MW	B-0	0	5	Autumn2021	BUS201	T001-00 TBA TBA	BC2009-S
2c7317d6-ae2a-496f-a865-524b982b3f19	08:00:00	MW	0	37	6	Autumn2021	BUS201	3413-MR Shafiqul Alam	BC2009-S
11b29c2e-1fdd-4713-b88f-e6bcfc91518f	17:00:00	ST	0	40	7	Autumn2021	BUS201	3570-MS Maria Muntahin	BC2009-S
a7585eb8-da62-4a46-9673-292f4d51a588	12:30:00	MW	0	40	8	Autumn2021	BUS201	3525-MS Afnan Ashfaque	BC2009-S
b4fbf55b-e602-4a32-92c3-a815d00bf1fd	15:30:00	ST	B-0	0	9	Autumn2021	BUS201	T001-00 TBA TBA	BC2009-S
e5043d06-0fbc-4751-a419-b12d19eafe97	17:00:00	ST	0	40	10	Autumn2021	BUS201	3403-MR Awal Al Kabir	BC2010-S
e345655b-0413-49d0-8c90-4aa84ef85628	08:00:00	ST	0	40	1	Autumn2021	BUS202	3545-DR Mohammad Osman Gani	BC2010-S
1a56a00d-1378-4ffc-8ed0-0c40f9c77256	11:00:00	ST	0	40	2	Autumn2021	BUS202	3579-MS Seeratus Sabah	BC2010-S
7280c9b1-aca0-4ab2-af00-08817e320813	08:00:00	MW	0	41	3	Autumn2021	BUS202	3534-DR Md. Abdus Salam Akanda	BC2010-S
ad0a8ef2-d194-470b-bdcb-97b620f9a3f1	15:30:00	MW	0	41	4	Autumn2021	BUS202	3579-MS Seeratus Sabah	BC3012-S
91207e57-33a2-4087-80ff-c5d6d9ef70de	09:30:00	MW	0	41	5	Autumn2021	BUS202	3534-DR Md. Abdus Salam Akanda	BC2009-S
97db0e49-d737-4d97-a4eb-dbd80de69e7f	09:30:00	ST	0	40	6	Autumn2021	BUS202	3545-DR Mohammad Osman Gani	BC2010-S
26ef8ed9-f0c7-44ac-8f5a-e5f676792ac0	14:00:00	ST	0	40	7	Autumn2021	BUS202	3634-DR Muhammad Azizur Rahman	BC2010-S
ee348812-6692-4d28-988f-f8bdffd13cff	15:30:00	MW	0	41	8	Autumn2021	BUS202	3606-DR Md. Kharshiduzzaman	BC2010-S
c01f1390-5907-4e66-98e4-cedf1a170e23	17:00:00	MW	0	40	9	Autumn2021	BUS202	3606-DR Md. Kharshiduzzaman	BC2009-S
bdbdb99c-00c0-42fd-b3f5-105ea260ff60	09:30:00	ST	0	45	1	Autumn2021	BUS360	3159-BAR Sarah Hassan	BC2011-S
1cb630a3-55f9-4ac3-9741-7760e3b8f2c7	15:30:00	MW	0	46	2	Autumn2021	BUS360	3323-MS Qantara Khaleda Khan	BC2011-S
0d54fbda-5cf1-450f-9de5-ab12f356fb01	09:30:00	MW	0	45	3	Autumn2021	BUS360	3512-MR Kazi Md. Jamshed	BC2010-S
97913e64-98ef-42f9-83b1-023643377e2d	11:00:00	MW	0	45	4	Autumn2021	BUS360	3512-MR Kazi Md. Jamshed	BC2009-S
06b1d9f4-1d70-4472-9b39-aa7609dc07c8	12:30:00	ST	0	45	5	Autumn2021	BUS360	3159-BAR Sarah Hassan	BC2009-S
c31e33bd-848f-4e1c-a053-2174ca7723ea	15:30:00	ST	0	45	6	Autumn2021	BUS360	3358-MR Mr. Iftekhar Mahfuz	BC2010-S
f45854b8-e729-4349-ba00-268f05fca8d3	08:00:00	ST	0	44	7	Autumn2021	BUS360	3159-BAR Sarah Hassan	BC2011-S
c697a8d2-dfe1-4ad7-b0f5-b2512469b187	17:00:00	MW	B-0	0	8	Autumn2021	BUS360	T001-00 TBA TBA	BC2010-S
d3841840-05c4-443d-9988-b1c1062926e0	14:00:00	ST	0	52	1	Autumn2021	BUS485	3635-DR Md. Shamimul Islam	BC2011-S
8afb3159-22e4-400e-b07f-57d72bbaf98f	14:00:00	MW	0	54	2	Autumn2021	BUS485	3185-MR Mohammed Sohel Islam	BC2010-S
0f6cc993-fac2-4287-bfbe-a9ec65da8ca9	11:00:00	ST	0	53	3	Autumn2021	BUS485	3444-DR Ikramul Hasan	BC2011-S
10289171-e264-4b0a-b654-2d021be36195	15:30:00	ST	0	54	4	Autumn2021	BUS485	3615-DR Md. Mamun Habib	BC2011-S
343b72ca-2688-437d-8cc3-0050ec3eb3d9	09:30:00	ST	0	48	5	Autumn2021	BUS485	3344-MR Mohammad Fahad Noor	BC2012-S
86dcfdfb-f7f9-4e72-b54b-85fbd00f495f	12:30:00	MW	0	43	6	Autumn2021	BUS485	3372-DR Samiul Parvez Ahmed	BC2010-S
485130fc-3a32-4656-b8e9-c9af6b26714d	11:00:00	MW	0	20	1	Autumn2021	CCS106	2506-MR Quazi Mahfujul Hoque Supan	C5002-S
b30f11cc-6858-4b80-817e-f78e7e79dab8	09:30:00	MW	0	19	1	Autumn2021	CFS105	2506-MR Quazi Mahfujul Hoque Supan	C4003-S
d8bb10bb-7af2-4100-916b-5ec5147a713a	14:00:00	MW	0	19	1	Autumn2021	CHE101	5252-DR Sadia Nazneen Karobi	C2006-S
2417cc46-470b-4910-9f31-d9d8b22d0a65	11:00:00	ST	0	20	2	Autumn2021	CHE101	5252-DR Sadia Nazneen Karobi	C2006-S
c57a7d05-32b4-4e26-a5fa-fca09f121d07	14:00:00	R	0	4	1	Autumn2021	CHE101L	5252-DR Sadia Nazneen Karobi	ESLAB-S
148b4ebd-0d86-4aab-9ad6-9e56befe2013	08:00:00	ST	0	21	1	Autumn2021	CHI101	2453-MR MMA Rahman Nahid	BC4011-S
f114bd50-9a54-4d46-b4cb-c385ab126700	08:00:00	ST	0	32	1	Autumn2021	CIS101	4465-MR Eusha Kadir	BC4043-S
e627f772-ae28-4cf4-bb28-f00e0f71e7d5	11:00:00	ST	0	31	2	Autumn2021	CIS101	4465-MR Eusha Kadir	BC4043-S
699d5ab4-9b8f-41ea-a359-caa0776c3995	12:30:00	ST	0	31	3	Autumn2021	CIS101	4348-MR Md. Abu Sayed	BC4043-S
b5fb2698-69ee-45c6-985d-c9e1d930abe3	15:30:00	ST	0	30	4	Autumn2021	CIS101	4404-DR Hasina Mamtaz	BC4043-S
0569c905-de8e-43d7-8246-dd5e887fb13f	08:00:00	MW	0	30	5	Autumn2021	CIS101	4453-MS Moumita Asad	BC4043-S
333e3ea1-956c-4803-a49e-902e6259ad48	11:00:00	MW	0	30	6	Autumn2021	CIS101	4348-MR Md. Abu Sayed	BC4043-S
ddae2f07-5dd7-493a-be50-a2219672476c	12:30:00	MW	0	32	7	Autumn2021	CIS101	4374-MR Wahidul Hasan	BC4043-S
b4f1179f-8310-4e78-b096-a445c17a38b0	15:30:00	MW	0	30	8	Autumn2021	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
024003d7-324f-4fd4-9d6a-991c612bb67f	08:00:00	ST	0	40	9	Autumn2021	CIS101	4297-MR M. Ishtiaque Rahman	GPLab-S
1d6b82f9-3efb-4edb-89db-009a9b190337	11:00:00	ST	0	40	10	Autumn2021	CIS101	4453-MS Moumita Asad	GPLab-S
387aeacd-6ffd-4ace-b762-70ac5e6b6ca0	12:30:00	ST	0	41	11	Autumn2021	CIS101	4468-MS Nazia Nishat	GPLab-S
1e888574-5420-4044-9352-1e7373be66a7	11:00:00	MW	0	40	12	Autumn2021	CIS101	4453-MS Moumita Asad	GPLab-S
7cba83d2-b26f-482f-8289-50d0a3a2594f	17:00:00	ST	0	30	13	Autumn2021	CIS101	4404-DR Hasina Mamtaz	BC4043-S
c5223a5c-2f47-4d63-910d-6e92adf8dd8e	17:00:00	MW	0	31	14	Autumn2021	CIS101	4330-MR AKM Monzurul Islam	GPLab-S
6708db02-da65-4595-9fe2-58dbd357d27c	09:30:00	S	0	32	1	Autumn2021	CIS101L	4465-MR Eusha Kadir	BC4043-S
fedf36fe-7c26-42bf-bab2-761d7a9346e7	09:30:00	T	0	31	2	Autumn2021	CIS101L	4465-MR Eusha Kadir	BC4043-S
e8f26e14-ab16-486b-ad20-f743f6a0f925	14:00:00	S	0	31	3	Autumn2021	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
df2cbeb7-6702-4845-b70e-621421cb0ddc	14:00:00	T	0	30	4	Autumn2021	CIS101L	4404-DR Hasina Mamtaz	BC4043-S
17ba7ae6-db36-45c1-961d-dce9f34eca08	09:30:00	M	0	30	5	Autumn2021	CIS101L	4453-MS Moumita Asad	BC4043-S
0a43ba43-936f-4c3d-98da-2da6e4ced6a4	09:30:00	W	0	30	6	Autumn2021	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
062a6a1d-49ad-4834-90e7-433b3cfbd8c2	14:00:00	M	0	32	7	Autumn2021	CIS101L	4374-MR Wahidul Hasan	BC4043-S
ff633605-e43f-4b58-870a-976bbbdcc3f7	14:00:00	W	0	30	8	Autumn2021	CIS101L	4330-MR AKM Monzurul Islam	BC4043-S
cd4d5ddd-e338-4e18-bb3d-547ce837639d	09:30:00	S	0	40	9	Autumn2021	CIS101L	4297-MR M. Ishtiaque Rahman	GPLab-S
4a02f3b5-a204-4212-b3d0-1c15176b242e	09:30:00	T	0	40	10	Autumn2021	CIS101L	4453-MS Moumita Asad	GPLab-S
baccba07-488f-42f3-880c-5eb6b0303432	14:00:00	S	0	41	11	Autumn2021	CIS101L	4468-MS Nazia Nishat	GPLab-S
a8016908-5f86-4ecc-8679-29126fd4e7a3	09:30:00	W	0	40	12	Autumn2021	CIS101L	4453-MS Moumita Asad	GPLab-S
f096abe7-7312-4b24-bef7-3471278ca092	17:00:00	M	0	30	13	Autumn2021	CIS101L	4404-DR Hasina Mamtaz	BC4043-S
83372bcb-d0b9-4ec3-8903-d4a5af0f5716	17:00:00	S	0	31	14	Autumn2021	CIS101L	4330-MR AKM Monzurul Islam	GPLab-S
641cb4f5-030d-4094-b89b-cdc0fe1ec3b7	15:30:00	ST	0	36	1	Autumn2021	CMN201	2164-MR Mohammad Masud Chowdhury	BC7015-S
401f78a5-336c-4319-b253-357dca1ccf18	12:30:00	ST	0	36	2	Autumn2021	CMN201	2258-MS Tasneem Shahrukh	C3005-S
d19ced6b-767d-40e5-aaae-db7e7b2e47b4	08:00:00	MW	0	35	3	Autumn2021	CMN201	2171-MS Fariya Hossain Khan	BC7015-S
dde310b3-b192-497e-ada6-af7cf096413a	14:00:00	MW	0	35	4	Autumn2021	CMN201	2255-MS Momtaz Parvin Mumu	BC9014-S
8c91a452-43c4-4cfe-a43a-07141946ea61	09:30:00	MW	0	35	5	Autumn2021	CMN201	2497-MR Hamza Kamal Mostafa	C2005-S
9ccd5d89-24b3-48c5-bd51-065a73aa21f0	11:00:00	MW	0	36	6	Autumn2021	CMN201	2270-MS Raisa Rasheeka	C3005-S
6761522d-8567-4629-b36f-94fcc68fa6c0	17:00:00	ST	0	23	7	Autumn2021	CMN201	2281-MR Mahmud Hasan Kayesh	BC7016-S
12c48eae-003a-4fde-8ae5-b0703734e1ae	11:00:00	ST	0	35	8	Autumn2021	CMN201	2382-MS Raiyana Rahman	C5004-S
d606256c-6454-4ede-b261-a1196b981e53	09:30:00	MW	0	36	9	Autumn2021	CMN201	2441-MS Refat Ara Jerin	C3004-S
3adcb683-a253-45ee-b48c-be6283876749	12:30:00	MW	0	38	10	Autumn2021	CMN201	2441-MS Refat Ara Jerin	BC4010-S
a9449ca8-b70a-41f0-bc6f-8473f3f5fa18	11:00:00	ST	0	36	11	Autumn2021	CMN201	2164-MR Mohammad Masud Chowdhury	C5005-S
992ac5e6-fd52-4ecb-bb25-4a96d9742b49	17:00:00	MW	B-0	0	12	Autumn2021	CMN201	2164-MR Mohammad Masud Chowdhury	BC10014-S
c988cdf7-fad1-464a-95fd-da01776bc31d	12:30:00	MW	B-0	0	13	Autumn2021	CMN201	2171-MS Fariya Hossain Khan	BC4011-S
4140b6d7-1c98-477f-8704-630cafd0de18	09:30:00	ST	0	20	1	Autumn2021	CMN202	2171-MS Fariya Hossain Khan	BC9016-S
127b7861-9479-4c63-a783-4c0fd1fa9c3e	15:30:00	ST	0	19	2	Autumn2021	CMN202	2382-MS Raiyana Rahman	BC4010-S
84898441-2a20-42eb-9ced-0ed307e37fa4	11:00:00	MW	0	42	1	Autumn2021	CMN203	2258-MS Tasneem Shahrukh	BC6013-S
91e297cf-8500-4b72-af9b-14c8a2148ca1	09:30:00	MW	0	11	1	Autumn2021	CMN205	2164-MR Mohammad Masud Chowdhury	BC9016-S
08b40080-118f-47fb-afa1-eed41d90f5ab	15:30:00	MW	0	20	2	Autumn2021	CMN205	2441-MS Refat Ara Jerin	BC4012-S
78d7e273-432e-49d7-ba38-9d99b5695e75	14:00:00	MW	0	16	1	Autumn2021	CMN207	2382-MS Raiyana Rahman	C2007-S
c67fd2f1-2fcd-4f19-98be-a2745b9fa23e	17:00:00	ST	0	7	1	Autumn2021	CMN301	2215-DR S.M Rezwan-Ul-Alam	BC4013-S
abd78d49-f949-4bfa-9ad7-bfe9098a9650	12:30:00	MW	0	18	1	Autumn2021	CMN302	2382-MS Raiyana Rahman	C6007-S
18d6f43c-bbdc-46c9-b367-e87bdbf75f86	14:00:00	ST	0	26	1	Autumn2021	CMN303	2441-MS Refat Ara Jerin	BC4011-S
5df27293-414d-499f-905a-aeebedc02473	15:30:00	ST	0	20	1	Autumn2021	CMN304	2308-MR Syed Ali Haider Rizvi	BC4011-S
6d8f09f3-2eb1-425a-8bd4-3216dc0e56fb	12:30:00	MW	0	20	1	Autumn2021	CMN305	2270-MS Raisa Rasheeka	C2002-S
50698996-f593-4f00-bf52-df00b607a30e	12:30:00	ST	0	9	1	Autumn2021	CMN306	2299-MS Naila Azad Nupur	C2002-S
1582bf90-6f2a-4b96-9e75-67cbe0dd3243	11:00:00	ST	0	14	1	Autumn2021	CMN308	2350-MR Syeed Zayadul Ahsan	C2007-S
7ffbeaef-9bde-497f-82b8-f3c5a45c108e	17:00:00	ST	0	7	1	Autumn2021	CMN309	2525-MR Md Abid Mallick	BC4011-S
a05bdfcb-ca31-4c96-b1e7-c5e10f92e88e	11:00:00	MW	0	10	1	Autumn2021	CMN313	2281-MR Mahmud Hasan Kayesh	C3006-S
6fd2249c-9234-43a4-9705-794239b404e2	12:30:00	MW	0	7	1	Autumn2021	CMN314	2340-MR Mahmood Menon Khan	C2006-S
a0ff66cf-1d66-4a8e-8850-48092d347f6a	11:00:00	ST	0	11	1	Autumn2021	CMN316	2270-MS Raisa Rasheeka	C3003-S
b05a3720-a717-4bbf-a96d-7473592311d6	09:30:00	MW	0	11	1	Autumn2021	CMN317	2368-MR Al Kamal Md. Ziaul Haq	C2002-S
ad562d2d-4011-46dc-a186-85c127f1bbd7	11:00:00	ST	0	6	1	Autumn2021	CMN318	2255-MS Momtaz Parvin Mumu	C3002-S
dd0cccca-99ae-4207-8b3f-df8dacaf045d	17:00:00	ST	0	11	1	Autumn2021	CMN320	2255-MS Momtaz Parvin Mumu	BC4012-S
30318ea1-32a5-4876-85d2-a388e743638a	09:30:00	MW	0	23	1	Autumn2021	CMN322	2258-MS Tasneem Shahrukh	BC10017-S
bbd47271-0f09-4ab9-ab6d-f6fbb60fee36	14:00:00	MW	0	14	1	Autumn2021	CMN323	2442-MS Mushfeqa Islam	C3007-S
9e1a15db-174d-42f2-916d-f5a12cb7f366	12:30:00	ST	0	7	1	Autumn2021	CMN327	2154-MR Philip Gain	C2003-S
ffac7bb2-5972-48a2-b2c7-b2868897c690	15:30:00	ST	0	20	1	Autumn2021	CMN406	2456-DR Shah Nister Kabir	BC4012-S
c9123fec-52a9-45ed-bb75-4c75a60a089e	12:30:00	MW	0	14	1	Autumn2021	CMN408	2178-DR G. M. Shahidul Alam	C2003-S
c60afd38-fd86-4150-8dc5-b8146af05f33	15:30:00	MW	0	20	1	Autumn2021	CMN409	2299-MS Naila Azad Nupur	C2002-S
2708e589-22cb-4084-8de6-baa7fa7e41cf	14:00:00	MW	B-0	0	1	Autumn2021	CMN410	T001-00 TBA TBA	C3003-S
b4cf8b11-8c1a-4fd8-9dc1-dfe644c6f764	14:00:00	MW	0	17	1	Autumn2021	CMN413	2164-MR Mohammad Masud Chowdhury	C3006-S
f094b960-215e-4e6d-b6b8-08bd939807fb	17:00:00	ST	0	20	1	Autumn2021	CMN426	2442-MS Mushfeqa Islam	BC4014-S
3a2b656a-5ef7-4ee8-a232-7c901d7a423d	15:30:00	A	0	16	1	Autumn2021	CMN498	2171-MS Fariya Hossain Khan	BC001-S
fdc3a8a7-9db9-4aa7-a4bf-e82f0756d3cb	17:00:00	A	0	0	1	Autumn2021	CMN499	2270-MS Raisa Rasheeka	BC001-S
24bd4299-6718-438b-8a83-7849a75e8140	08:00:00	ST	0	24	1	Autumn2021	CSC101	4483-MR Abdus Sattar	CSCLab4-S
8d6847f7-b7d4-4197-8c25-2e995b784fa7	11:00:00	ST	0	26	2	Autumn2021	CSC101	4449-MR Sheikh Abujar	CSCLab4-S
f533df61-06b6-4cda-a638-ce2ef45777cc	09:30:00	ST	0	25	3	Autumn2021	CSC101	4102-DR Mohammed Anwer	CSCLab2-S
a344acdb-6350-435b-b001-da98f8cee6d8	15:30:00	ST	0	25	4	Autumn2021	CSC101	4449-MR Sheikh Abujar	CSCLab4-S
9ca76c03-d0c2-453d-a43b-0d9a49bdf575	08:00:00	MW	0	24	5	Autumn2021	CSC101	4251-MR Md. Raihan Bin Rafique	CSCLab4-S
b99cca73-90be-4cc4-8610-c5d0061fec2f	09:30:00	MW	0	25	6	Autumn2021	CSC101	4446-DR Yusuf Mahbubul Islam	BCTBA1-S
add90967-b09e-4678-837e-4cd3a6b023f1	14:00:00	MW	0	15	7	Autumn2021	CSC101	4251-MR Md. Raihan Bin Rafique	GPLab-S
0cf5bd1f-a3cb-4524-8421-e55b0c55ab41	15:30:00	MW	0	22	8	Autumn2021	CSC101	4449-MR Sheikh Abujar	CSCLab4-S
0535e667-d45c-48f0-888c-fa4003630889	17:00:00	ST	0	25	9	Autumn2021	CSC101	4483-MR Abdus Sattar	CSCLab4-S
a89161e7-4c6d-4fd1-a3f7-04ce75a968b7	12:30:00	ST	0	14	10	Autumn2021	CSC101	4251-MR Md. Raihan Bin Rafique	CSCLab2-S
b4f4d1ef-797a-492f-a13d-a1ee05c2c144	09:30:00	S	0	24	1	Autumn2021	CSC101L	4483-MR Abdus Sattar	CSCLab4-S
e0544a6e-607a-45d0-b543-35b5e0a04d84	09:30:00	T	0	26	2	Autumn2021	CSC101L	4449-MR Sheikh Abujar	CSCLab4-S
208ea539-8593-46e6-87f3-f2889e8e72e7	11:00:00	S	0	25	3	Autumn2021	CSC101L	4102-DR Mohammed Anwer	CSCLab2-S
2c940ce5-c9b5-4cd9-974b-7a6c1374dab7	14:00:00	T	0	25	4	Autumn2021	CSC101L	4449-MR Sheikh Abujar	CSCLab4-S
01f9c798-f73c-4c5f-adb6-7df79e5e33e1	09:30:00	W	0	24	5	Autumn2021	CSC101L	4251-MR Md. Raihan Bin Rafique	CSCLab4-S
ff759575-284c-4c4a-b887-e0dbf96b72c5	11:00:00	M	0	25	6	Autumn2021	CSC101L	4446-DR Yusuf Mahbubul Islam	CSCLab4-S
705ca418-9500-4181-bd53-fbbd36a28769	15:30:00	W	0	15	7	Autumn2021	CSC101L	4251-MR Md. Raihan Bin Rafique	GPLab-S
14d45484-dc59-4804-bf42-c297303f056e	14:00:00	W	0	22	8	Autumn2021	CSC101L	4449-MR Sheikh Abujar	CSCLab4-S
8b8d0577-07cb-4ab0-af8b-fd3584f8004c	17:00:00	M	0	25	9	Autumn2021	CSC101L	4483-MR Abdus Sattar	CSCLab4-S
a21afb0f-b8f0-48e9-90b9-e8c57f9eb4dc	14:00:00	S	0	14	10	Autumn2021	CSC101L	4251-MR Md. Raihan Bin Rafique	CSCLab2-S
d78959b1-4678-44bd-8a25-a12b48b92acc	17:00:00	MW	0	31	1	Autumn2021	CSC121	4375-MR Mustafa Nizamul Aziz	CSCLab3-S
c5fe8d0f-6903-4e03-b3dc-672c527116b2	15:30:00	M	0	31	1	Autumn2021	CSC121L	4375-MR Mustafa Nizamul Aziz	CSCLab3-S
a161a5e2-d13e-4ef8-8383-cf7e728307f9	18:30:00	S	0	35	1	Autumn2021	CSC301	4241-DR Md. Ashraful Amin	BC5012-S
2e44ef48-589c-4eaa-afeb-2ec45e3bf0bb	17:00:00	ST	B-0	0	2	Autumn2021	CSC301	T001-00 TBA TBA	BC5012-S
2d61e9f2-ecbd-40ab-bb79-4a5c3b5a1765	18:30:00	M	B-0	-1	3	Autumn2021	CSC301	4241-DR Md. Ashraful Amin	BC5012-S
308c6b1d-0d5c-4530-8d4b-7b767aac0df6	08:00:00	MW	0	46	4	Autumn2021	CSC301	4447-PROF A. R. Azimul Hoque	BC5012-S
1be06725-4128-4480-9ca8-b154d6d40d04	18:30:00	T	B-0	0	1	Autumn2021	CSC471	T001-00 TBA TBA	BC6007-S
22937437-5f30-41af-a4bf-7cfba2a36116	18:30:00	S	0	45	1	Autumn2021	CSC472	4418-MR Nashid Ali	BC6012-S
380bf4e8-570e-44e4-a8e1-0089dbd94ed7	18:30:00	T	0	43	2	Autumn2021	CSC472	4418-MR Nashid Ali	BC6009-S
a1468069-9c69-4a7a-9bed-3d55e345f3a4	14:00:00	ST	0	43	1	Autumn2021	CSE104	4285-DR Ferdows Zahid	BC6009-S
624443db-68ef-4e8d-9f77-2e7de0e5a4a4	08:00:00	ST	0	37	2	Autumn2021	CSE104	4409-MS Ajmiri Sabrina Khan	BC7015-S
23161ae6-6fc5-42ec-afa7-a1d042b4544c	09:30:00	ST	0	39	3	Autumn2021	CSE104	4409-MS Ajmiri Sabrina Khan	BC6013-S
5ffb8167-7564-4ed7-846a-c298af380abd	15:30:00	MW	0	41	4	Autumn2021	CSE104	4409-MS Ajmiri Sabrina Khan	BC6008-S
bd19552c-0912-45b9-bc11-d5096ddf1b60	12:30:00	MW	0	35	5	Autumn2021	CSE104	4409-MS Ajmiri Sabrina Khan	C2005-S
9b20134c-759d-411d-8018-1e2fb1d49de3	09:30:00	MW	B-0	0	6	Autumn2021	CSE104	T001-00 TBA TBA	A4L04-S
2c8b3b60-aaeb-4350-ba96-272821fa2339	12:30:00	S	0	42	1	Autumn2021	CSE104L	4486-MR Shad Ahmed	CENLAB-S
c2548e11-72c3-4716-92b7-3dc59f55f709	09:30:00	S	0	42	2	Autumn2021	CSE104L	4486-MR Shad Ahmed	CENLAB-S
648e98dc-dd61-40af-9eae-f731c6ad406d	08:00:00	S	0	27	3	Autumn2021	CSE104L	4487-MR Md.Safiul Islam Leon	CENLAB-S
1cf12508-a2d3-452c-a45f-fc6df9409643	14:00:00	W	0	29	4	Autumn2021	CSE104L	4486-MR Shad Ahmed	CENLAB-S
30a6eedc-bc21-47e4-ade5-e9bf5911277a	14:00:00	M	0	39	5	Autumn2021	CSE104L	4408-MR Asif Bin Khaled	CENLAB-S
40a54da0-ebfe-4c05-b80c-0b1858d7a62d	08:00:00	M	B-0	-3	6	Autumn2021	CSE104L	T001-00 TBA TBA	CENLAB-S
b7d456f7-0fd4-450d-b38a-b2dc7e2becfd	08:00:00	ST	0	47	1	Autumn2021	CSE201	4228-DR Habib Bin Muzaffar	BC5012-S
da98ef39-9985-4b3d-8de5-dff2ac526ab3	09:30:00	ST	0	47	2	Autumn2021	CSE201	4228-DR Habib Bin Muzaffar	BC5012-S
8b147d07-0a74-4395-83a2-133a73b12d0f	11:00:00	ST	B-0	0	3	Autumn2021	CSE201	T001-00 TBA TBA	BC5012-S
be003480-79f0-42f7-99a4-d98fa128693f	09:30:00	MW	0	48	4	Autumn2021	CSE201	4475-DR Sejuti Rahman	BC5012-S
524d80db-884e-4053-ae90-7e7d52743a2d	11:00:00	MW	0	45	5	Autumn2021	CSE201	4484-MR Sadekur Rahman	BC5012-S
b87d1612-f371-4ab2-8c36-1d09885dd552	15:30:00	ST	0	41	1	Autumn2021	CSE203	4478-MR Md. Nazmul Haque	GPLab-S
c33ae57f-5ecf-472f-be0a-cd94e166851c	12:30:00	ST	0	41	2	Autumn2021	CSE203	4478-MR Md. Nazmul Haque	CSCLab4-S
27e4d8bd-657e-4fa5-a3d5-4cc9550afaec	12:30:00	MW	0	40	3	Autumn2021	CSE203	4477-MR Md. Aquib Azmain	CSCLab4-S
1aac81d5-0c0f-4f5c-9dfc-08299bbc7588	08:00:00	MW	0	41	4	Autumn2021	CSE203	4477-MR Md. Aquib Azmain	GPLab-S
baeb27fc-b8f1-4c02-86b1-a4f5ea540755	09:30:00	ST	0	39	5	Autumn2021	CSE203	4397-MR Mohammad Motiur Rahman	CSCLab3-S
da70bc21-42b5-414b-a58c-3df8f3ddcf7a	12:30:00	ST	0	36	6	Autumn2021	CSE203	4397-MR Mohammad Motiur Rahman	CSCLab3-S
acd6a090-3384-4156-8f98-9db20dee20b6	11:00:00	MW	0	41	7	Autumn2021	CSE203	4449-MR Sheikh Abujar	CSCLab3-S
177777ad-272e-48e2-9ed7-07f08c81f194	14:00:00	T	0	41	1	Autumn2021	CSE203L	4478-MR Md. Nazmul Haque	GPLab-S
b26e95c7-84bf-48d5-84de-332251bf83f4	14:00:00	S	0	41	2	Autumn2021	CSE203L	4478-MR Md. Nazmul Haque	CSCLab4-S
ddfdfedc-f5d6-4617-9173-888f0672d916	14:00:00	M	0	40	3	Autumn2021	CSE203L	4477-MR Md. Aquib Azmain	CSCLab4-S
c00c36a5-0a36-4ce0-84dc-ccbb3aae5190	09:30:00	M	0	41	4	Autumn2021	CSE203L	4477-MR Md. Aquib Azmain	GPLab-S
701e6b1b-4353-498c-a557-ec972f17d414	11:00:00	S	0	39	5	Autumn2021	CSE203L	4397-MR Mohammad Motiur Rahman	CSCLab3-S
994a4735-c6d2-43c4-926d-fdfdaba22f1f	11:00:00	T	0	36	6	Autumn2021	CSE203L	4397-MR Mohammad Motiur Rahman	CSCLab3-S
395f4b1a-b7b4-48b3-af21-7e637aa62df1	09:30:00	W	0	41	7	Autumn2021	CSE203L	4449-MR Sheikh Abujar	CSCLab3-S
5873feba-0329-4f1f-8100-5f1052c2454a	14:00:00	MW	0	43	1	Autumn2021	CSE204	4467-MS Nashid Sultana	BC6013-S
409ceee6-ff86-4ec8-b740-22d51f1363b1	09:30:00	MW	0	40	2	Autumn2021	CSE204	4467-MS Nashid Sultana	C3005-S
6af90ed1-78bd-48e9-9bf1-45749a8b6242	11:00:00	ST	0	43	3	Autumn2021	CSE204	4417-MR Md. Thesun Al- Amin	BC9014-S
6911f6e8-d0be-4af3-a851-5105cde79798	14:00:00	ST	0	14	4	Autumn2021	CSE204	4374-MR Wahidul Hasan	BC6012-S
bd5daf25-1094-4f89-9b8f-35be5d26cf8b	15:30:00	M	0	43	1	Autumn2021	CSE204L	4485-MR Md. Shirazim Munir	CENLAB-S
b60ff31e-dc0b-4a10-a097-366516821a07	11:00:00	W	0	40	2	Autumn2021	CSE204L	4485-MR Md. Shirazim Munir	CENLAB-S
95d6bb32-b9b0-4b24-877f-59632903a4d1	12:30:00	T	0	43	3	Autumn2021	CSE204L	4485-MR Md. Shirazim Munir	CENLAB-S
15fafe0e-6281-4175-ba55-4c7d367e0bf5	15:30:00	T	0	14	4	Autumn2021	CSE204L	4374-MR Wahidul Hasan	CENLAB-S
e100d2f9-294c-45e2-8436-96126630cb85	15:30:00	ST	0	44	1	Autumn2021	CSE210	4285-DR Ferdows Zahid	BC6008-S
defaf503-e467-41ef-9c7c-6136952d2001	17:00:00	ST	0	42	2	Autumn2021	CSE210	4285-DR Ferdows Zahid	BC6008-S
c70b1532-670b-46b9-a0cf-67ec5d60ca9b	17:00:00	MW	0	45	3	Autumn2021	CSE210	4467-MS Nashid Sultana	BC7026-S
b59d1bf1-0145-4e7f-b413-deeb971b6f8f	14:00:00	T	0	37	1	Autumn2021	CSE210L	4487-MR Md.Safiul Islam Leon	CENLAB-S
162733c3-ee60-4880-9631-659e1e3e1b66	15:30:00	S	0	41	2	Autumn2021	CSE210L	4472-MR Azfar Hossain	CENLAB-S
c71b367e-bea8-4e0b-83c4-8df65f0e8080	15:30:00	W	0	45	3	Autumn2021	CSE210L	4472-MR Azfar Hossain	CENLAB-S
cc23aabc-93db-4c34-90cf-fca3d31a7097	08:00:00	MW	B-0	0	1	Autumn2021	CSE211	T001-00 TBA TBA	CSCLab2-S
45656950-4a30-4ef5-9316-c64e83e7ae22	11:00:00	MW	0	36	2	Autumn2021	CSE211	4408-MR Asif Bin Khaled	CSCLab2-S
3f7f0864-a727-4959-a67a-6d784b4f9e0e	11:00:00	ST	0	37	3	Autumn2021	CSE211	4408-MR Asif Bin Khaled	CSCLab1-S
b9cb6ae2-beac-4f26-845d-f3b79121673a	14:00:00	ST	0	34	4	Autumn2021	CSE211	4480-DR Md. Samiullah	CSCLab3-S
799351e5-598a-48e4-9f69-cdbdb29bb12c	12:30:00	MW	B-0	-1	5	Autumn2021	CSE211	T001-00 TBA TBA	GPLab-S
31cf8405-c770-4321-bdb3-6d6b28729d1d	09:30:00	M	B-0	0	1	Autumn2021	CSE211L	T001-00 TBA TBA	CSCLab2-S
2f0bf695-82e5-48bf-a8ab-9876b0cb9b12	09:30:00	W	0	36	2	Autumn2021	CSE211L	4408-MR Asif Bin Khaled	CSCLab2-S
ecccfcaa-1e93-4bfd-80bd-fcded2bd240a	09:30:00	S	0	38	3	Autumn2021	CSE211L	4408-MR Asif Bin Khaled	CSCLab1-S
8ef1b517-8daf-4a8a-a493-68d5202d2291	15:30:00	S	0	33	4	Autumn2021	CSE211L	4480-DR Md. Samiullah	CSCLab3-S
1290f31c-7429-4013-8c4a-e1a99863a6e8	14:00:00	M	B-0	-1	5	Autumn2021	CSE211L	T001-00 TBA TBA	BCTBA1-S
e8fc32a6-b19b-4172-ad28-d87a3c5ed8f3	12:30:00	ST	0	34	1	Autumn2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab1-S
3edc1aff-eb63-4f59-862d-bccc06afa217	11:00:00	MW	0	33	2	Autumn2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab1-S
7a0ab2e6-6716-4eb9-b506-3b47e01450a3	12:30:00	MW	0	33	3	Autumn2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab1-S
d6287fca-7a90-4ce4-8709-ec2e4422fb47	17:00:00	ST	0	31	4	Autumn2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab3-S
646e6a1b-d2e7-4256-8e52-845def2a6e42	14:00:00	S	0	34	1	Autumn2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab1-S
26495c0d-3274-40ef-b9c9-58b197d04a15	09:30:00	M	0	33	2	Autumn2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab1-S
49f5ddf4-60ca-4d06-84c0-0f73c6a8a6d9	14:00:00	W	0	33	3	Autumn2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab1-S
968e9317-2394-4980-bca4-ef9044286aa3	15:30:00	T	0	31	4	Autumn2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab3-S
8d5ec11a-ea50-48d9-88de-49916817ba39	11:00:00	ST	0	40	1	Autumn2021	CSE214	4474-DR Mst. Najnin Sultana	BC5013-S
0fa5f712-7919-44e1-a7ab-a938a9c31ee7	12:30:00	MW	B-0	0	2	Autumn2021	CSE214	T001-00 TBA TBA	C3005-S
5da28242-ea60-4715-a92c-3813ea2cb429	14:00:00	MW	0	37	3	Autumn2021	CSE214	4474-DR Mst. Najnin Sultana	BC5012-S
ebc03ff0-4548-4e9d-be10-df9707eaec6c	11:00:00	MW	0	32	1	Autumn2021	CSE216	4242-MR Prof. Farruk Ahmed	BC5013-S
f67ba6cd-0c8d-4d63-a029-9dde89e58eec	08:00:00	MW	B-0	0	2	Autumn2021	CSE216	4273-MR Sarwar Shahidi	BC8012-S
e7bbd567-dd96-4107-8999-418e1267b5c7	12:30:00	ST	0	35	3	Autumn2021	CSE216	4242-MR Prof. Farruk Ahmed	BC5012-S
69b36171-46df-44f0-8bbd-6fa1983dd05b	12:30:00	W	0	30	1	Autumn2021	CSE216L	4427-MR Rubayed Mehedi	CENLAB-S
507c59ec-37c7-4012-8f7d-848b48a1ace1	09:30:00	M	B-0	0	2	Autumn2021	CSE216L	4427-MR Rubayed Mehedi	CENLAB-S
ef981830-963a-427e-9d3f-fb0592e54ef5	14:00:00	S	0	33	3	Autumn2021	CSE216L	4273-MR Sarwar Shahidi	CENLAB-S
e3987b0f-8086-4baa-acd5-91c833ffc64e	12:30:00	MW	0	19	1	Autumn2021	CSE303	4348-MR Md. Abu Sayed	CSCLab3-S
e3a0f990-8d7b-43b2-935b-2482428e2926	08:00:00	MW	0	35	2	Autumn2021	CSE303	4280-MS Nujhat Nahar	CSCLab1-S
eba1ac37-0aa9-403b-9354-b36b1a47edbf	15:30:00	ST	B-0	-1	3	Autumn2021	CSE303	T001-00 TBA TBA	CSCLab1-S
62003acd-dba0-4e05-befa-c4fbf3a73f5b	15:30:00	MW	0	34	4	Autumn2021	CSE303	4434-MS Sadita Ahmed	CSCLab1-S
b44b60e5-a506-4c42-ba46-5223315007d1	14:00:00	M	0	20	1	Autumn2021	CSE303L	4348-MR Md. Abu Sayed	CSCLab3-S
f181aafa-0148-4bc3-b6dc-506c2d0ff6b9	09:30:00	W	0	35	2	Autumn2021	CSE303L	4280-MS Nujhat Nahar	CSCLab1-S
935a2e87-f854-4786-a2a0-7843674995f0	14:00:00	T	B-0	-2	3	Autumn2021	CSE303L	T001-00 TBA TBA	CSCLab1-S
b75b31f7-0b57-4427-8a83-5a94270d0bbf	14:00:00	M	0	34	4	Autumn2021	CSE303L	4434-MS Sadita Ahmed	CSCLab1-S
2c804259-a45d-4eb4-b7c1-0b6b8c552afa	08:00:00	ST	0	39	1	Autumn2021	CSE307	4184-DR Mahady Hasan	BC5013-S
1a762dc4-1693-497a-a3fc-ef5b51b36188	11:00:00	ST	0	41	2	Autumn2021	CSE307	4473-MS Farzana Sadia	BC5014-S
1efc3880-d3f6-4a05-a831-4bf7183f994e	17:00:00	MW	0	20	3	Autumn2021	CSE307	4434-MS Sadita Ahmed	BC5012-S
b8c4aeff-fb1e-4756-b2cc-1df218a0d8d9	17:00:00	ST	B-0	0	1	Autumn2021	CSE309	T001-00 TBA TBA	CSCLab1-S
de189c43-4f67-4815-9db4-3d260496147d	08:00:00	ST	0	46	2	Autumn2021	CSE309	4376-MR Sanzar Adnan Alam	CSCLab3-S
a578cadc-72a0-4ceb-95a1-f37ae0fd82ad	17:00:00	MW	0	47	3	Autumn2021	CSE309	4376-MR Sanzar Adnan Alam	CSCLab1-S
9d810d50-50d2-423c-9e2d-2327d3139eeb	12:30:00	ST	0	38	1	Autumn2021	CSE310	4248-DR Satyen Biswas	C3004-S
f360cb30-ba36-4d38-a703-a04033565b23	12:30:00	MW	0	38	2	Autumn2021	CSE310	4248-DR Satyen Biswas	C3004-S
cba92a53-76fb-468e-a8e2-80f0f5dc13d3	11:00:00	S	0	40	1	Autumn2021	CSE310L	4472-MR Azfar Hossain	CENLAB-S
f9f9f1d4-8cf5-42f8-845f-2f5d3b247012	11:00:00	M	0	40	2	Autumn2021	CSE310L	4472-MR Azfar Hossain	CENLAB-S
b1f17e44-11a9-4e61-a41a-61d9c28e9c2b	12:30:00	ST	0	41	1	Autumn2021	CSE313	4362-MR Bijoy Rahman Arif	BC5013-S
1f86266c-d891-4493-ba7a-0cbf3a70fcd7	12:30:00	MW	0	44	2	Autumn2021	CSE313	4362-MR Bijoy Rahman Arif	BC5012-S
3e5198e4-6a0e-4cee-bc08-87c8195bdf99	17:00:00	MW	0	37	3	Autumn2021	CSE313	4481-MS Kaniz Fatema	BC5013-S
68e46b1f-7574-4f48-b84f-47f56de08bff	09:30:00	ST	0	22	1	Autumn2021	CSE315	4362-MR Bijoy Rahman Arif	BC5013-S
150c4ece-2fe4-4135-87a7-990f2de70f48	11:00:00	MW	0	30	2	Autumn2021	CSE315	4481-MS Kaniz Fatema	BC5014-S
a74d2eeb-b493-4714-9f27-9d381e489658	17:00:00	MW	B-0	-3	3	Autumn2021	CSE315	T001-00 TBA TBA	BC5014-S
35e375e5-b204-4745-a2d8-87cd4f7d581b	14:00:00	ST	0	34	1	Autumn2021	CSE316	4382-DR Tarem Ahmed	BC6013-S
44a86dfd-4fbc-4075-9d73-5c6d773634ba	15:30:00	ST	0	33	2	Autumn2021	CSE316	4382-DR Tarem Ahmed	BC6009-S
db1d3faa-8d9d-47c9-82a9-77f4f3d0d2bd	14:00:00	MW	0	34	3	Autumn2021	CSE316	4416-MR Md. Fahad Monir	C3004-S
a111c788-1871-46ac-b781-c655bd9fcda2	15:30:00	MW	0	26	4	Autumn2021	CSE316	4416-MR Md. Fahad Monir	BC6009-S
67b4842c-c5cd-47fc-85eb-131772d6135b	17:00:00	S	0	34	1	Autumn2021	CSE316L	4383-DR Faisal Uddin	CSCLab2-S
8345b304-c190-4a22-b710-2af6fce487c4	17:00:00	T	0	33	2	Autumn2021	CSE316L	4383-DR Faisal Uddin	CSCLab2-S
ec352dae-a4b2-43f8-bc9f-6bbff97d09ab	17:00:00	M	0	34	3	Autumn2021	CSE316L	4416-MR Md. Fahad Monir	CSCLab2-S
66d2db7b-a0cf-4cfd-8ae7-a522d094c32b	17:00:00	W	0	26	4	Autumn2021	CSE316L	4383-DR Faisal Uddin	CSCLab2-S
4123e806-0d41-4ed6-ba3b-80513d14843b	17:00:00	ST	0	40	1	Autumn2021	CSE317	4408-MR Asif Bin Khaled	BC6009-S
a95d82f1-7dd4-4bb4-bc63-0e9523aff854	15:30:00	MW	0	34	2	Autumn2021	CSE317	4397-MR Mohammad Motiur Rahman	BC6012-S
41eb953e-fb93-4551-a9a4-141d0550e1cc	15:30:00	ST	0	33	3	Autumn2021	CSE317	4401-MR AKM Mahbubur Rahman	BC6012-S
b5d1c91f-459a-4245-a58f-41788703744c	15:30:00	S	0	40	1	Autumn2021	CSE317L	4408-MR Asif Bin Khaled	CSCLab2-S
6d4c77ef-f236-4a97-bb9a-60f597c5e583	14:00:00	W	0	34	2	Autumn2021	CSE317L	4397-MR Mohammad Motiur Rahman	CSCLab2-S
2352af68-8747-4852-a4f4-b3e3a8a4b1ba	14:00:00	T	0	33	3	Autumn2021	CSE317L	4401-MR AKM Mahbubur Rahman	CSCLab2-S
5df3ded6-1f22-4948-a50b-df9ba4a816df	18:30:00	W	0	45	1	Autumn2021	CSE402	4382-DR Tarem Ahmed	BC5012-S
d7e1b418-f4d0-4416-a715-a4c769503201	18:30:00	T	0	47	1	Autumn2021	CSE406	4432-DR Al-Sakib Khan Pathan	BC5012-S
7e7b6bf6-bf4b-46f1-87ee-052827c853fd	18:30:00	S	0	22	1	Autumn2021	CSE417	4401-MR AKM Mahbubur Rahman	BC5013-S
8f1b1883-e52c-43bf-8941-998e72cb7c8c	18:30:00	W	0	11	1	Autumn2021	CSE421	4336-DR Amin Ahsan Ali	BC6013-S
4c370607-ad84-42c3-8db3-87a8a910a269	18:30:00	M	0	20	1	Autumn2021	CSE425	4336-DR Amin Ahsan Ali	BC5013-S
bffe4404-63db-4e25-91b4-b53828252323	18:30:00	M	0	5	1	Autumn2021	CSE426	4482-MR Kaushik Sarker	BC5014-S
a5afb752-8cff-4f07-bb71-299f8aba62fb	18:30:00	W	0	38	1	Autumn2021	CSE453	4280-MS Nujhat Nahar	BC5014-S
1930fd44-37e1-4e02-bfea-cff722aac9a3	18:30:00	M	0	23	1	Autumn2021	CSE458	4473-MS Farzana Sadia	BC6007-S
54951568-0527-4bf8-87ca-f2be1bf4d636	18:30:00	T	0	0	1	Autumn2021	CSE461	4476-MR Mohammad Hasanr Rahman	BC6008-S
45f283bc-b1f4-4fc0-bd7f-25f8676204a2	18:30:00	W	0	53	1	Autumn2021	CSE464	4376-MR Sanzar Adnan Alam	BC5013-S
78a3595f-dce9-4bdd-a832-524ee763c270	18:30:00	S	0	42	1	Autumn2021	CSE490	4476-MR Mohammad Hasanr Rahman	BC6007-S
2810a023-78af-4f03-99d0-69bd4d4d6140	08:00:00	F	0	0	1	Autumn2021	CSE498	4184-DR Mahady Hasan	BCTBA2-S
3b4725a2-b378-4cd1-84d7-b63fd2e0ec48	09:30:00	F	0	7	2	Autumn2021	CSE498	4242-MR Prof. Farruk Ahmed	BCTBA2-S
8ba29e72-fd0d-4f6d-98c0-a76cdebb1f83	11:00:00	F	0	0	3	Autumn2021	CSE498	4241-DR Md. Ashraful Amin	BCTBA2-S
fa796c14-0665-41b7-a2d6-8c6cd7ec8943	12:30:00	F	0	0	4	Autumn2021	CSE498	4285-DR Ferdows Zahid	BCTBA2-S
3b5eca04-3a7a-411b-8861-142ed7c3ae89	14:00:00	F	0	2	5	Autumn2021	CSE498	4382-DR Tarem Ahmed	BCTBA2-S
3f7f4413-57a7-484d-ba6f-2e0ec1f3f0f1	15:30:00	F	0	0	6	Autumn2021	CSE498	4336-DR Amin Ahsan Ali	BCTBA2-S
f00fcab2-dd8f-4702-a46c-3b298a5f3457	17:00:00	F	0	0	7	Autumn2021	CSE498	4383-DR Faisal Uddin	BCTBA2-S
98940da5-c093-42b5-b363-d38045a99d3c	18:30:00	F	0	0	8	Autumn2021	CSE498	4401-MR AKM Mahbubur Rahman	BCTBA2-S
3921c162-bad1-41b0-b709-a9142c595096	20:00:00	F	B-0	0	9	Autumn2021	CSE498	4448-DR Farzana Rahman	BCTBA2-S
62b5fee6-189b-42b9-9aa4-c1abd03d6603	08:00:00	A	0	51	1	Autumn2021	CSE499	4184-DR Mahady Hasan	BCTBA2-S
bc5f2103-46bb-4015-ae74-0ff8b911280e	09:30:00	A	B-0	0	2	Autumn2021	CSE499	4137-MR Mohammad Noor Nabi	BCTBA2-S
1479bcb0-57d4-4fcb-acdc-63ee70949a69	11:00:00	A	B-0	0	3	Autumn2021	CSE499	4161-MR Subrata Kumar Dey	BCTBA2-S
e909fef8-4baa-4392-8e28-25c12ff3150b	12:30:00	A	B-0	0	4	Autumn2021	CSE499	4362-MR Bijoy Rahman Arif	BCTBA2-S
eecb0174-a040-4a2d-b4dc-22be21fca90b	14:00:00	A	B-0	0	5	Autumn2021	CSE499	4348-MR Md. Abu Sayed	BCTBA2-S
028435de-9658-46aa-94f2-7c7557e4fb40	15:30:00	A	B-0	0	6	Autumn2021	CSE499	4397-MR Mohammad Motiur Rahman	BCTBA2-S
705b246f-5ac8-4a95-9158-017f5e965270	17:00:00	A	B-0	0	7	Autumn2021	CSE499	4376-MR Sanzar Adnan Alam	BCTBA2-S
3dd3dd00-8604-494c-b974-4fddc680f8dd	18:30:00	A	B-0	0	8	Autumn2021	CSE499	4416-MR Md. Fahad Monir	BCTBA2-S
37c056e3-ac70-4a65-a7bf-34ea2132baaf	20:00:00	A	B-0	0	9	Autumn2021	CSE499	4408-MR Asif Bin Khaled	BCTBA2-S
4170594a-f174-41aa-8bc6-4a199f6febb5	08:00:00	A	B-0	0	10	Autumn2021	CSE499	4409-MS Ajmiri Sabrina Khan	BCTBA1-S
87b0934c-20aa-4ba9-bba6-00238f90a900	09:30:00	A	B-0	0	11	Autumn2021	CSE499	4449-MR Sheikh Abujar	BCTBA1-S
be2799c0-fa48-47bd-8f61-8161a3aafe7a	11:00:00	A	B-0	0	12	Autumn2021	CSE499	4453-MS Moumita Asad	BCTBA1-S
fb78bdab-fb63-422a-be78-cca455f5ec46	09:30:00	MW	0	31	1	Autumn2021	ECN200	3489-MS Fahmida Islam	C4004-S
08d8a6b7-d822-4823-828c-d22e14c8b3f5	17:00:00	ST	0	23	2	Autumn2021	ECN200	3489-MS Fahmida Islam	BC7025-S
4d86a77d-5e06-4e87-8068-fad32441cddc	09:30:00	ST	0	22	3	Autumn2021	ECN200	3461-MS Mumtahina Islam	C4005-S
af2ea89b-9d50-4288-9e05-31add35b0882	08:00:00	ST	0	35	1	Autumn2021	ECN201	3463-MR Md. Kamrul Islam	BC3012-S
03856e90-17f9-4fcb-971e-02c088d3bad0	09:30:00	ST	0	34	2	Autumn2021	ECN201	3357-MR Tapas Kumar Paul	C3005-S
3cffd791-6933-49d5-ba6d-82d538e17d46	11:00:00	ST	0	35	3	Autumn2021	ECN201	3467-MS Nabila Maruf	C2004-S
3f7c65e8-ead5-466e-bf18-2c6249356dcc	12:30:00	ST	0	36	4	Autumn2021	ECN201	3632-DR Meherun Ahmed	BC9017-S
95593dba-1fc2-4c2e-9974-8d45a940e08e	14:00:00	ST	0	36	5	Autumn2021	ECN201	3461-MS Mumtahina Islam	BC3012-S
c9bf6167-7986-43e3-8a2c-5372589a14c3	17:00:00	ST	0	24	6	Autumn2021	ECN201	3491-MS Nuren Nirvana Brishti	BC7026-S
30da91f2-9261-4543-9fae-f6ae64fb47a0	08:00:00	MW	0	0	7	Autumn2021	ECN201	3491-MS Nuren Nirvana Brishti	BC3010-S
8c1a2c34-94b2-4cf2-8bd7-151f9bc3b29c	09:30:00	MW	0	25	8	Autumn2021	ECN201	3357-MR Tapas Kumar Paul	C4005-S
7aacaf3b-8ca4-42fc-8252-6594bc7278b0	11:00:00	MW	0	19	9	Autumn2021	ECN201	3357-MR Tapas Kumar Paul	C5004-S
b7d6c2f6-d672-4d26-90f2-46ce8ae09f8f	12:30:00	MW	0	35	10	Autumn2021	ECN201	3467-MS Nabila Maruf	BC8015-S
9b583d54-67b1-478f-8b93-bd9eeee28244	14:00:00	MW	0	20	11	Autumn2021	ECN201	3461-MS Mumtahina Islam	BC9017-S
b3067dfe-a451-48cf-9048-3a471ebdeb41	15:30:00	MW	0	28	12	Autumn2021	ECN201	3491-MS Nuren Nirvana Brishti	BC4013-S
601e74fa-6414-40df-965d-ff7fc791fe96	08:00:00	ST	0	36	1	Autumn2021	ECN202	3494-DR Md. Shahnawaz Karim	BC7016-S
3b88f69c-b70d-47a3-9670-cae79bb9de0f	09:30:00	ST	0	29	2	Autumn2021	ECN202	3298-Mr. Shamil M Al-Islam	C3004-S
c268d5db-630d-472d-8ac9-0ff7467d1e81	11:00:00	ST	0	39	3	Autumn2021	ECN202	3463-MR Md. Kamrul Islam	C2005-S
fa7b9e9d-7e43-4288-b6de-89bf6fcae0f2	12:30:00	ST	0	39	4	Autumn2021	ECN202	3298-Mr. Shamil M Al-Islam	C6005-S
780fc362-9e79-49a3-b584-f7737751497b	14:00:00	ST	0	38	5	Autumn2021	ECN202	3369-MR Khawaja Saifur Rahman	C2004-S
328a06d6-e2d4-431d-b851-9fd535bda425	09:30:00	MW	0	37	6	Autumn2021	ECN202	3298-Mr. Shamil M Al-Islam	C5005-S
cdc30172-2fb4-48e6-a14b-d8aef9666de1	11:00:00	MW	0	40	7	Autumn2021	ECN202	3621-DR Md. Khaled Saifullah	BC4011-S
94160ee3-1695-41aa-baf8-6321fbeda2d4	12:30:00	MW	0	41	8	Autumn2021	ECN202	3369-MR Khawaja Saifur Rahman	BC9017-S
125796d5-3477-4f56-882d-1867c4cc30d3	14:00:00	MW	0	40	9	Autumn2021	ECN202	3369-MR Khawaja Saifur Rahman	C2005-S
57b59a5b-e15d-4cdd-b4bf-ac11bbabde5a	17:00:00	MW	B-0	-4	10	Autumn2021	ECN202	3494-DR Md. Shahnawaz Karim	BC3011-S
6cccb42b-8bd1-451a-a330-4f2608f12fc5	12:30:00	MW	0	9	1	Autumn2021	ECN203	3461-MS Mumtahina Islam	BC4012-S
edef63f5-69b6-4d5a-a7f6-0f332f04e873	09:30:00	MW	0	20	1	Autumn2021	ECN301	3467-MS Nabila Maruf	BC4011-S
bc3ef40f-3b5f-4e79-a816-ee4ef3aaa60d	11:00:00	MW	0	13	1	Autumn2021	ECN302	3463-MR Md. Kamrul Islam	BC4012-S
76b8ec03-a457-431b-8b67-87e9536c479a	17:00:00	ST	0	25	1	Autumn2021	ECN308	3369-MR Khawaja Saifur Rahman	C2005-S
bdd37a74-c605-44b4-bcd4-a3a80e025112	14:00:00	MW	0	14	1	Autumn2021	ECN310	3463-MR Md. Kamrul Islam	BC4010-S
e596ff65-a8b4-4efa-b4c3-39f016a870c1	15:30:00	MW	0	13	1	Autumn2021	ECN320	3357-MR Tapas Kumar Paul	BC4010-S
03f821eb-79a0-42ff-bec5-458f68b7dd06	17:00:00	MW	0	14	1	Autumn2021	ECN350	3621-DR Md. Khaled Saifullah	BC3012-S
3f297b00-fcd4-4bc9-90c0-163b6076baf1	15:30:00	ST	B-0	0	1	Autumn2021	ECN351	3357-MR Tapas Kumar Paul	C2005-S
446be17d-5693-4b75-93bd-075a3600c3f3	09:30:00	ST	0	11	1	Autumn2021	ECN385	3467-MS Nabila Maruf	BC4013-S
5585c658-13b2-4dbd-be75-6cf9694d3915	11:00:00	ST	0	5	1	Autumn2021	ECN401	3298-Mr. Shamil M Al-Islam	BC4010-S
5dcfaf4a-2176-494a-a6c4-4c9d53d55e6e	14:00:00	ST	0	11	1	Autumn2021	ECN402	3494-DR Md. Shahnawaz Karim	BC4010-S
4d34aa79-8c10-4f64-bdc7-6bdf77b3f381	15:30:00	MW	B-0	0	1	Autumn2021	ECN420	3494-DR Md. Shahnawaz Karim	BC4011-S
32b464bc-34ae-47f4-83ba-cda29bb8c900	12:30:00	ST	0	24	1	Autumn2021	ECN442	3621-DR Md. Khaled Saifullah	BC4010-S
03295b5b-5274-4f61-962f-29040f6202a1	12:30:00	MW	0	7	1	Autumn2021	ECN486	3494-DR Md. Shahnawaz Karim	BC4013-S
6f3506f1-ecfa-442f-8fad-b6db49a0fa5a	08:00:00	ST	0	5	1	Autumn2021	ECN490	3565-DR Shahriar Kabir	BC4010-S
19054f26-d7de-48c3-ae83-a548e2c857c4	11:00:00	ST	0	15	1	Autumn2021	EEE131	4275-MS Tahsin F. Ara Nayna	BC4013-S
263177c6-a5a6-4455-bcf5-6d816abe0916	11:00:00	MW	B-0	0	2	Autumn2021	EEE131	4275-MS Tahsin F. Ara Nayna	BC9015-S
13cdad14-edac-467d-8226-52b82cc620aa	14:00:00	MW	0	33	1	Autumn2021	EEE132	4286-DR Mustafa Habib Chowdhury	BC3012-S
738c3912-8517-4714-8e5f-ca39e3095b74	08:00:00	ST	0	31	1	Autumn2021	EEE211	4240-DR Kafiul Islam	BC6008-S
09ed6138-3b21-4ff4-9ab5-0156614894c7	12:30:00	S	0	19	1	Autumn2021	EEE211L	4457-MR Md. Iftadul Islam Sakib	CirLab-S
fcebf7ba-99b4-4705-9f80-a240568f79b8	14:00:00	W	0	12	2	Autumn2021	EEE211L	4457-MR Md. Iftadul Islam Sakib	CirLab-S
68d539a0-bab9-4721-b21a-b43a30b29231	15:30:00	ST	0	14	1	Autumn2021	EEE221	4142-MS Afroza Sultana	BC5013-S
04f1c600-9e51-4740-b057-c7bf4268698d	15:30:00	MW	0	15	2	Autumn2021	EEE221	4142-MS Afroza Sultana	BC5014-S
b44de6d0-fa2f-4d54-975b-bcf0150e1af1	12:30:00	T	0	21	1	Autumn2021	EEE222L	4462-MR Nazmus Sakib	SIMLAB1-S
4e91f763-11c6-4c58-af81-ddb97977efe8	14:00:00	M	0	13	2	Autumn2021	EEE222L	4462-MR Nazmus Sakib	SIMLAB1-S
03c8a723-305e-4ba3-a745-1faa22fc56c2	17:00:00	ST	0	45	1	Autumn2021	EEE223	4488-MR Md. Mahmudur Rahman	BC5014-S
1f13cdd0-f8b6-457f-9fc2-471802202fde	09:30:00	MW	0	37	1	Autumn2021	EEE231	4489-MR Murad Kabir Nipun	BC6013-S
35e39572-9964-4d92-9e69-a74dbb6bfcc3	14:00:00	ST	0	27	1	Autumn2021	EEE232	4142-MS Afroza Sultana	BC5013-S
316f1804-ff0f-441b-9690-41dc117e7b7f	15:30:00	T	0	20	1	Autumn2021	EEE232L	4458-MR Md. Tawhid Islam Opu	CirLab-S
f1b8bcd7-b7d2-44cd-9df6-f734139e182c	15:30:00	M	0	8	2	Autumn2021	EEE232L	4458-MR Md. Tawhid Islam Opu	CirLab-S
bc79daf8-60bb-49c9-98d2-01e1fd6a4da2	14:00:00	MW	0	24	1	Autumn2021	EEE233	4200-DR Shahriar Khan	BC6007-S
753fe2a1-9d66-4fb8-9062-d9f88c3bd3cf	09:30:00	MW	0	24	1	Autumn2021	EEE234	4460-DR Tanbir Ibne Anowar	BC5002-S
1c6736d9-c07b-44cc-bbe7-e39d9f9d84a5	08:00:00	T	0	9	1	Autumn2021	EEE234L	4457-MR Md. Iftadul Islam Sakib	CirLab-S
7e960448-0ea6-4eaf-9434-b797a39118c8	08:00:00	S	0	13	2	Autumn2021	EEE234L	4457-MR Md. Iftadul Islam Sakib	CirLab-S
9e2ff147-75cd-471b-8e42-d3db7877c33a	09:30:00	ST	0	45	1	Autumn2021	EEE312	4190-DR Khosru Mohammad Salim	BC6009-S
e6c454e3-b082-4ad9-a641-2626279d5618	08:00:00	M	0	16	1	Autumn2021	EEE312L	4352-MS Zaima Tasneem	PowLab-S
22c6d13b-db5b-4a03-b292-f899091569ed	11:00:00	M	0	27	2	Autumn2021	EEE312L	4352-MS Zaima Tasneem	PowLab-S
7fd5d26a-048f-400e-9570-dc81883865fa	14:00:00	ST	0	36	1	Autumn2021	EEE313	4286-DR Mustafa Habib Chowdhury	BC5014-S
6f6f28fd-04e0-4a78-bed6-e194bbc77a89	15:30:00	T	B-0	-1	1	Autumn2021	EEE314L	4462-MR Nazmus Sakib	SIMLAB1-S
7389683d-0043-4911-9615-a0e2cb1c9dee	11:00:00	W	0	22	2	Autumn2021	EEE314L	4462-MR Nazmus Sakib	SIMLAB1-S
d1094d65-8a3a-41a3-9dc6-8066e9b8e8e3	12:30:00	R	0	26	1	Autumn2021	EEE315L	4406-MR Mohammad Rejwan Uddin	PowLab-S
b79bfd59-a190-44b4-b525-8d1db14fd863	09:30:00	T	B-0	0	1	Autumn2021	EEE316L	4461-MR Abdullah Al Noman	SIMLAB1-S
d0b7aa26-8033-47cb-900e-6c413c8591ff	09:30:00	M	0	17	2	Autumn2021	EEE316L	4461-MR Abdullah Al Noman	SIMLAB1-S
e787a3ad-8032-4219-aa5b-0427db6b98f6	08:00:00	MW	0	26	1	Autumn2021	EEE321	4240-DR Kafiul Islam	BC6012-S
15e03c63-e951-41f0-a44d-58739c7d0ba0	09:30:00	S	0	13	1	Autumn2021	EEE321L	4458-MR Md. Tawhid Islam Opu	TelLab-S
b3f8b857-535e-436d-820c-9c6af5d7bc2c	09:30:00	W	0	19	2	Autumn2021	EEE321L	4411-MS Fauzia Hoque Shorna	TelLab-S
21e342f4-4cdd-4519-9124-2d1587242a4b	17:00:00	MW	0	24	1	Autumn2021	EEE323	4358-MR Mustafa Mohammad Shaky	BC6013-S
02bda83e-33c5-4a16-b4d2-94e90b00e8e9	11:00:00	S	0	2	1	Autumn2021	EEE323L	4458-MR Md. Tawhid Islam Opu	SIMLAB1-S
957bc228-0f6f-471d-8279-7ebdc73b15ab	11:00:00	T	0	16	2	Autumn2021	EEE323L	4458-MR Md. Tawhid Islam Opu	SIMLAB1-S
d34078bb-a568-439c-a85f-de7cc3dcd0fa	15:30:00	MW	0	42	1	Autumn2021	EEE332	4212-DR Abdur Razzak	BC6007-S
04a1357e-1471-4cbe-b237-b4c409002e48	14:00:00	S	0	19	1	Autumn2021	EEE332L	4459-MR Md. Rezanul Haque	PowLab-S
a2756d18-9256-4b92-b44a-73f52b620492	14:00:00	T	0	21	2	Autumn2021	EEE332L	4459-MR Md. Rezanul Haque	PowLab-S
6d206851-798f-4b54-9155-a6cef4ca1a96	17:00:00	MW	0	19	1	Autumn2021	EEE333	4352-MS Zaima Tasneem	BC7015-S
d65e7d0d-340f-4646-929d-66c2bc8c8a7a	17:00:00	ST	0	15	1	Autumn2021	EEE334	4406-MR Mohammad Rejwan Uddin	SIMLAB1-S
270acd26-3eef-4023-b269-731e29aeda7c	17:00:00	MW	0	21	2	Autumn2021	EEE334	4406-MR Mohammad Rejwan Uddin	SIMLAB1-S
902f5040-0c85-4cbf-b20a-04acbb2b268a	08:00:00	F	0	8	1	Autumn2021	EEE400	4212-DR Abdur Razzak	BCTBA3-S
1845602f-b851-4a94-97a8-6553f57be432	09:30:00	F	0	0	2	Autumn2021	EEE400	4200-DR Shahriar Khan	BCTBA3-S
9a004e3e-be6b-47f9-b331-d4763c27c3e3	11:00:00	F	0	9	3	Autumn2021	EEE400	4190-DR Khosru Mohammad Salim	BCTBA3-S
fd5a456b-b253-439c-85e4-7eb02fc278f6	12:30:00	F	0	3	4	Autumn2021	EEE400	4199-DR Feroz Ahmed	BCTBA3-S
22851386-d448-4e03-829b-90cf1012a3e4	14:00:00	F	0	0	5	Autumn2021	EEE400	4240-DR Kafiul Islam	BCTBA3-S
09ee9cc6-2040-4d19-b929-d48f97773c3c	15:30:00	F	0	0	6	Autumn2021	EEE400	4286-DR Mustafa Habib Chowdhury	BCTBA3-S
b347e8d1-3b15-4d5c-9bfb-e876c0517255	17:00:00	R	0	0	7	Autumn2021	EEE400	4455-DR Touhidur Rahman	BCTBA3-S
a909da91-78d2-4aac-a145-cdc742284a26	15:30:00	ST	0	43	1	Autumn2021	EEE411	4212-DR Abdur Razzak	BC5014-S
dc8ffea2-31c4-4442-9e0d-1baaab83a151	08:00:00	W	0	15	1	Autumn2021	EEE411L	4459-MR Md. Rezanul Haque	PowLab-S
a7c9a169-7347-4243-8f5a-aec66e4a15e7	08:00:00	T	0	19	2	Autumn2021	EEE411L	4459-MR Md. Rezanul Haque	PowLab-S
1004c800-e7df-4e6c-bea8-c358d7cb83bf	14:00:00	ST	0	26	1	Autumn2021	EEE419	4200-DR Shahriar Khan	BC6007-S
2fbdac11-6f03-4fd0-9124-90d7a26e8c1b	17:00:00	W	0	25	1	Autumn2021	EEE419L	4297-MR M. Ishtiaque Rahman	PowLab-S
b594ccf3-0191-457d-840a-11900f53cc05	08:00:00	MW	0	15	1	Autumn2021	EEE422	4490-MR Md. Munir Hasan	BC6013-S
e568373a-c199-4645-b848-936c3672f92e	14:00:00	M	0	32	1	Autumn2021	EEE423L	4352-MS Zaima Tasneem	PowLab-S
d0d486f7-984a-4a61-b541-1f36d7e64861	14:00:00	MW	B-0	0	1	Autumn2021	EEE438	4190-DR Khosru Mohammad Salim	BC6008-S
f89d65a5-df01-4f67-a300-19c83a7ee84a	12:30:00	MW	0	12	1	Autumn2021	EEE466	4455-DR Touhidur Rahman	C4006-S
55e3c94e-b8f8-45e4-9cb1-44f390d4e0df	12:30:00	F	0	0	1	Autumn2021	EEE497	4142-MS Afroza Sultana	BCTBA1-S
ec752d83-f3c8-4dca-a1bd-19f51f73357f	12:30:00	A	0	0	2	Autumn2021	EEE497	4275-MS Tahsin F. Ara Nayna	BCTBA1-S
2f74cb9e-7eda-44ec-a997-fde34a902022	09:30:00	F	0	1	1	Autumn2021	EEE499	4142-MS Afroza Sultana	BC001-S
ed2436b3-c3f1-4466-9ca3-a5af50c67ddc	11:00:00	ST	0	20	1	Autumn2021	ELL101	2502-MS Afroza Bilkis	C4007-S
45b04d67-7ec7-439f-8dd2-e3bbefd2dc6a	12:30:00	MW	0	20	2	Autumn2021	ELL101	2391-MS Nabila Tahsin Farah	C3007-S
95c9ca57-a27e-42cf-83a6-513e2687ff44	14:00:00	ST	0	20	3	Autumn2021	ELL101	2502-MS Afroza Bilkis	C3005-S
f52853b5-b794-4d62-ab5f-8f51ffa07833	11:00:00	ST	0	19	4	Autumn2021	ELL101	2503-MR Nuran Choudhury	C9002-S
b405b54b-c1e8-462f-8300-04da420538b9	09:30:00	ST	0	17	5	Autumn2021	ELL101	2500-DR Zahidul Islam	C3002-S
b9aacb95-0ec4-404d-acee-ca7455e4b2b0	15:30:00	ST	0	31	1	Autumn2021	ELT301	2106-MR Towhid Bin Muzaffar	BC7016-S
c64ec694-79c3-462d-a694-09b052126e26	11:00:00	MW	0	23	1	Autumn2021	ELT302	2002-MS Mithila Mahfuz	BC4013-S
f04440ec-2ee2-4ac2-8861-4bca9c4b6f4a	17:00:00	ST	0	17	1	Autumn2021	ELT304	2104-MR Syed Mazharul Islam	BC8013-S
d368fa60-6fb8-452c-b22d-af8a06003982	15:30:00	MW	0	22	1	Autumn2021	ELT305	2515-DR Mahmud Hasan Khan	BC8013-S
bcb387ae-f839-4e00-87c4-5d7a24f72f5b	11:00:00	ST	0	15	1	Autumn2021	ELT314	2136-MR Md. Shaiful Islam	BC9016-S
6a4f6e39-2259-4bf2-8676-4d5949972206	17:00:00	MW	0	8	1	Autumn2021	ELT401	2515-DR Mahmud Hasan Khan	BC8013-S
69b85332-5b9e-4e13-910d-db78ca4ef68f	12:30:00	ST	0	27	1	Autumn2021	ELT402	2002-MS Mithila Mahfuz	BC9015-S
bf1ca053-e2fd-4f1d-961f-a50525ea5f04	14:00:00	MW	0	15	1	Autumn2021	ELT403	2136-MR Md. Shaiful Islam	BC9015-S
47248c9b-9e67-4500-8692-46724e265322	12:30:00	MW	0	12	1	Autumn2021	ELT412	2002-MS Mithila Mahfuz	BC4014-S
268d80cf-edce-4188-a554-da7a3583a630	14:00:00	ST	0	19	1	Autumn2021	ELT414	2136-MR Md. Shaiful Islam	BC8013-S
fce3bbe1-4731-4f94-a597-534e4401c434	09:30:00	MW	0	12	1	Autumn2021	ELT415	2132-MS Rezina Nazneen Rimi	BC8014-S
bf9b072b-a8df-401d-80da-6eab7daf3c3a	17:00:00	R	0	10	1	Autumn2021	ELT499	2439-MR Adilur Rahman	BC001-S
ea80c540-7193-41db-87b7-5a2120962de5	08:00:00	MW	0	57	1	Autumn2021	ENG101	2344-MS Nadira Sultana Mirza	BC9017-S
1654364f-ec4c-4256-97e8-06136792db61	09:30:00	MW	0	57	2	Autumn2021	ENG101	2259-MR G. M. A Mainuddin Chowdhury	BC7015-S
d8f5a8fd-e36e-4972-82bb-375deaec8cec	09:30:00	ST	0	56	3	Autumn2021	ENG101	2362-MS Sakira Islam	BC7025-S
249bab6b-b3b2-46e7-8b3c-8f1fa4cb7e0f	09:30:00	MW	0	56	4	Autumn2021	ENG101	2438-MS Israt Taslim	BC7016-S
f0826202-2fd4-451b-bb1a-74922afa58d2	11:00:00	MW	0	57	5	Autumn2021	ENG101	2344-MS Nadira Sultana Mirza	BC7015-S
e9bb56ed-265c-4291-a76c-7360f0a48b9d	08:00:00	ST	0	55	6	Autumn2021	ENG101	2483-MR Kazi Mubinul Hasan Shanto	BC7025-S
6a8b1ffd-8567-439a-b458-0e67e486fb14	11:00:00	MW	0	57	7	Autumn2021	ENG101	2438-MS Israt Taslim	BC7016-S
f179fa6f-8468-4ca7-9253-31973267b64a	11:00:00	ST	0	58	8	Autumn2021	ENG101	2518-MS Mubash-Shera Karishma Mobarok	BC7015-S
394b334d-6679-43b8-91e7-fc70de265e22	09:30:00	ST	0	55	9	Autumn2021	ENG101	2483-MR Kazi Mubinul Hasan Shanto	BC7026-S
6fe840f5-87cc-47fb-bf68-b4323ccae111	09:30:00	ST	0	56	10	Autumn2021	ENG101	2247-MS Sumaiya Islam	BC8011-S
784bb913-d15f-455c-aa57-c0750b3a381a	12:30:00	MW	0	57	11	Autumn2021	ENG101	2475-MS Khandaker Nayeema Haque	BC7015-S
36daef07-37eb-40d7-9ea9-4bb444055295	12:30:00	ST	0	57	12	Autumn2021	ENG101	2518-MS Mubash-Shera Karishma Mobarok	BC7015-S
9c9ea507-2a1b-4db5-8a86-d5ec951c9032	17:00:00	MW	0	57	13	Autumn2021	ENG101	2490-MS Pikasha Imam	BC7016-S
c3732e23-7e4b-4b42-8859-fbc02364a9d7	17:00:00	MW	0	56	14	Autumn2021	ENG101	2493-MS Anika Nawar	BC7025-S
3722120c-54d7-4596-8219-d8f0923077d3	14:00:00	MW	0	57	15	Autumn2021	ENG101	2234-MS Naureen Rahnuma	BC7015-S
298afa7e-ab93-4349-81e7-72329961653e	08:00:00	ST	0	55	16	Autumn2021	ENG101	2247-MS Sumaiya Islam	BC7026-S
7bd62778-4406-4029-a13d-c9ee5f1cf95d	14:00:00	MW	0	56	17	Autumn2021	ENG101	2418-MR Md. Ashikuzzaman	BC7016-S
05b2d6de-b3bb-4400-bd8e-1c207ca9e359	09:30:00	ST	0	23	1	Autumn2021	ENG102	2342-MS Nasima Haider	BC8012-S
6aedb781-7e34-4169-be67-2a53f83fd5d3	12:30:00	ST	0	14	2	Autumn2021	ENG102	2440-MS Vikarun Nessa	BC7016-S
4231640c-82d2-46ad-b4a9-15c03aee3c3e	08:00:00	MW	0	35	3	Autumn2021	ENG102	2132-MS Rezina Nazneen Rimi	BC7016-S
85b0b937-f789-46d4-8ca0-dc7e5ba75336	11:00:00	ST	0	35	4	Autumn2021	ENG102	2002-MS Mithila Mahfuz	BC7016-S
4229e0bd-ca23-454f-8bf1-56674b56c704	11:00:00	MW	0	36	5	Autumn2021	ENG102	2439-MR Adilur Rahman	BC7025-S
8adcb4b9-37c1-4162-a804-f513e73bf9f4	12:30:00	ST	0	35	6	Autumn2021	ENG102	2439-MR Adilur Rahman	BC7025-S
70792448-77a2-4aa9-ac88-88ce94870adb	14:00:00	ST	0	35	7	Autumn2021	ENG102	2219-MR Md. Ziaul Karim	BC7015-S
a454bf6c-530b-4b66-bcf8-0c33332c1c33	11:00:00	ST	0	35	8	Autumn2021	ENG102	2133-MS Saara Zabeen	BC7025-S
43cf74c1-6442-4e36-b880-77eada8e237c	11:00:00	MW	0	36	9	Autumn2021	ENG102	2133-MS Saara Zabeen	BC7026-S
d845cd76-0ab9-40c9-bd65-2b9e9da84244	08:00:00	ST	0	20	10	Autumn2021	ENG102	2342-MS Nasima Haider	BC8011-S
610b3209-2998-41af-8f84-301e6bde90b9	12:30:00	MW	0	35	11	Autumn2021	ENG102	2133-MS Saara Zabeen	BC7016-S
cd778ab8-1825-4f10-bdf8-ebf5cdbb976b	14:00:00	MW	0	34	12	Autumn2021	ENG102	2475-MS Khandaker Nayeema Haque	BC7025-S
b453ee92-afc9-4d18-99f2-26a63ee04196	14:00:00	MW	0	35	13	Autumn2021	ENG102	2332-MS Fatina Sarwar	BC7026-S
5a409a0d-19ec-41ae-b57f-135a49a85a72	15:30:00	MW	0	24	14	Autumn2021	ENG102	2490-MS Pikasha Imam	BC7015-S
16d52172-1029-4863-8f68-85c086c619f9	15:30:00	MW	0	35	15	Autumn2021	ENG102	2332-MS Fatina Sarwar	BC7016-S
733ed26b-6a8e-40c3-b482-b0142bbb2a15	09:30:00	ST	0	35	16	Autumn2021	ENG102	2452-MS Mir Sadia Siddequa Sifat	BC8015-S
f16d654d-3d5a-4b26-90c7-349b3780ec20	15:30:00	ST	0	35	17	Autumn2021	ENG102	2407-MS Sayeeda Sharmin	BC8015-S
fa55742e-d8cc-47ac-85ef-befb25de15d9	08:00:00	MW	0	30	1	Autumn2021	ENG105	2487-DR AKM Zakaria	BC7025-S
f514729b-9f29-4186-b3b0-3344830e9f08	12:30:00	ST	0	32	2	Autumn2021	ENG105	2408-MS Rumana Amin	BC7026-S
d2bf0967-7db1-4463-8335-13197aa855f4	08:00:00	ST	0	27	3	Autumn2021	ENG105	2405-MS Jasmine Ferdous	BC8012-S
e10ca5f1-ff8a-418f-a4ec-6046915eaab4	09:30:00	ST	0	30	4	Autumn2021	ENG105	2405-MS Jasmine Ferdous	BC9014-S
0f127fd5-158d-406b-b8dc-09d4ec5a48db	11:00:00	MW	0	30	5	Autumn2021	ENG105	2357-MR Mohammad Israil Hoque	BC8011-S
0f4fdae9-2f0b-48e2-b8c7-b19c1da6d10a	12:30:00	MW	0	32	6	Autumn2021	ENG105	2357-MR Mohammad Israil Hoque	BC7025-S
fe1c89ee-4c93-494b-be9b-e3e9e7c8ebd6	11:00:00	ST	0	30	7	Autumn2021	ENG105	2219-MR Md. Ziaul Karim	BC7026-S
1ce6045b-91b5-4b0c-a41a-57dfe5696feb	12:30:00	MW	0	30	8	Autumn2021	ENG105	2463-PROF Rabeya Begum	BC8011-S
dd2fb280-d870-4306-bd53-5ecb8d737af5	08:00:00	MW	0	30	9	Autumn2021	ENG105	2259-MR G. M. A Mainuddin Chowdhury	BC7026-S
985bc5db-0439-4745-a026-c3af5c50f7ce	09:30:00	MW	0	31	10	Autumn2021	ENG105	2417-MR Mohammad Serajuddin	BC7025-S
b9a220c4-1a26-4026-8fee-d148945dba08	09:30:00	ST	0	29	11	Autumn2021	ENG105	2463-PROF Rabeya Begum	BC9017-S
36ca452f-3884-4b8e-b89f-4ad7676e496a	17:00:00	ST	0	30	12	Autumn2021	ENG105	2407-MS Sayeeda Sharmin	BC9014-S
27088b42-21fb-4ba9-9b7c-4b848732cfc2	17:00:00	ST	0	30	13	Autumn2021	ENG105	2408-MS Rumana Amin	BC9017-S
736e627f-8a39-45a0-b8f0-62dc332a7c25	15:30:00	MW	0	30	14	Autumn2021	ENG105	2418-MR Md. Ashikuzzaman	BC7025-S
d30b5e1a-cb89-465c-ba28-792fcf14752e	09:30:00	MW	0	30	15	Autumn2021	ENG105	2487-DR AKM Zakaria	BC7026-S
10930ecc-a396-4dbc-800e-d1722e8a63c0	14:00:00	ST	0	30	16	Autumn2021	ENG105	2362-MS Sakira Islam	BC7016-S
6c260841-30b8-417e-8916-01a79afcec66	15:30:00	ST	B-0	0	17	Autumn2021	ENG105	2408-MS Rumana Amin	BC7026-S
b9dc2c0d-d5c0-4c4b-ac5e-0c17c17e87f5	09:30:00	ST	0	32	1	Autumn2021	ENG201	2126-MS Sayyeda-tun-Noor Sameera	BC4010-S
2f629df3-adf2-4ebc-9466-e7b421dfc823	17:00:00	ST	0	12	1	Autumn2021	ENG202	2440-MS Vikarun Nessa	C2004-S
273cf69f-c171-4447-8bc8-326dee0b1de4	12:30:00	MW	0	12	1	Autumn2021	ENG305	2440-MS Vikarun Nessa	BC9015-S
dc637f64-4548-4fed-94d5-cebdf10819aa	17:00:00	MW	0	13	1	Autumn2021	ENG306	2486-DR Ahmed Ahsanuzzaman	BC4010-S
33a64c0b-a778-4596-b183-e116f3330e9c	11:00:00	ST	0	12	1	Autumn2021	ENG311	2438-MS Israt Taslim	BC10017-S
0bb179a4-b3fa-4217-8c34-ac82c9e1743e	14:00:00	ST	0	8	1	Autumn2021	ENG313	2126-MS Sayyeda-tun-Noor Sameera	BC8014-S
1881d2f2-82ef-49a9-9733-af849aa2a489	14:00:00	MW	0	14	1	Autumn2021	ENG315	2516-DR Sarker Hasan Al Zayed	BC9016-S
94f5bc07-ab8b-4b5d-9227-1b9f27ec74d0	12:30:00	ST	0	9	1	Autumn2021	ENG401	2438-MS Israt Taslim	BC9016-S
1b588a4b-f12b-4e7f-8acd-e2d9302f2056	15:30:00	MW	0	13	1	Autumn2021	ENG404	2229-PROF Razia Sultana Khan	BC8014-S
b9d9b029-bd80-4a6e-ae1e-a512a3b1efcb	14:00:00	MW	0	12	1	Autumn2021	ENG405	2126-MS Sayyeda-tun-Noor Sameera	BC4012-S
6cf4f545-1457-4546-ad3e-bae93155928e	09:30:00	MW	0	5	1	Autumn2021	ENG416	2440-MS Vikarun Nessa	BC4012-S
b18fca10-f226-487f-9412-59fd6e191bf1	14:00:00	R	0	8	1	Autumn2021	ENG499	2486-DR Ahmed Ahsanuzzaman	BC001-S
57e9f5b2-e6e2-412a-9daa-873a3c1f0af3	14:00:00	ST	0	31	1	Autumn2021	ENV100	5230-MR Md. Ekhtekharul Islam	BC8011-S
0d493e29-0672-43b5-8b33-2e29a61e6c92	11:00:00	MW	0	38	2	Autumn2021	ENV100	6076-MS Sharazad Hassan	C5005-S
0c44e056-219b-4e43-aa9a-c92f237faecf	11:00:00	MW	0	40	1	Autumn2021	ENV101	5231-MR Saquib Ahmad Khan	BC8015-S
a2a35225-86a3-4100-a8a1-23f3f046c9b3	17:00:00	MW	0	35	2	Autumn2021	ENV101	5248-MS Tahmina Sultana	BC8011-S
d8d80d5f-93e1-4393-bf39-ceb2189d6556	11:00:00	ST	0	41	3	Autumn2021	ENV101	5230-MR Md. Ekhtekharul Islam	BC8011-S
3c2ac7c5-5676-40c4-8b7d-8f3962a5d532	12:30:00	ST	0	41	4	Autumn2021	ENV101	5248-MS Tahmina Sultana	BC8015-S
b30a937c-d47a-4cbb-ba06-2e3804608c89	11:00:00	MW	0	40	5	Autumn2021	ENV101	5207-MR Tanvir Ahmed Haroon	BC9014-S
826aedf5-e401-4337-8e22-afb710b0abb0	15:30:00	ST	0	40	6	Autumn2021	ENV101	5207-MR Tanvir Ahmed Haroon	BC8011-S
292c024f-22e7-451a-9598-9d84192a135b	14:00:00	ST	0	23	7	Autumn2021	ENV101	6076-MS Sharazad Hassan	BC8012-S
d21a0ebb-433a-4ae6-bbc1-fc8d9a4c4a6f	09:30:00	MW	0	39	8	Autumn2021	ENV101	5230-MR Md. Ekhtekharul Islam	BC8015-S
60849a4f-1eee-4e26-b3bc-f47c78fb2622	11:00:00	MW	0	18	1	Autumn2021	ENV201	5252-DR Sadia Nazneen Karobi	BC9016-S
d33a75d6-6ec0-4873-888c-375517873ab2	14:00:00	ST	0	15	2	Autumn2021	ENV201	5252-DR Sadia Nazneen Karobi	C4003-S
40bfa81d-d26e-47b9-b34c-346c529deec3	09:30:00	R	0	11	1	Autumn2021	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
630b43c3-21c7-492b-94b1-e8ca4341d13a	11:00:00	ST	0	13	1	Autumn2021	ENV202	5199-DR Shahima Islam	C2003-S
1245239d-263c-4e38-86b7-3d3ecf68b907	09:30:00	MW	0	11	2	Autumn2021	ENV202	5236-DR Mohammad Sorowar Hossain	BC9015-S
3c600915-bee3-4336-a0b9-11172cb57254	11:00:00	R	0	8	1	Autumn2021	ENV202L	5199-DR Shahima Islam	BLab-S
f5c9205b-0181-493e-b4ea-4cfb9ff32ebe	09:30:00	ST	0	31	1	Autumn2021	ENV205	5231-MR Saquib Ahmad Khan	BC8013-S
0445de9e-4c63-4c91-b4d6-2b1405f490f5	17:00:00	ST	0	31	1	Autumn2021	ENV206	5248-MS Tahmina Sultana	BC8011-S
58f2a8de-d754-4cb1-ac34-008d708b0c89	15:30:00	MW	0	30	2	Autumn2021	ENV206	5248-MS Tahmina Sultana	BC8012-S
85075a7c-ebf9-455e-8d07-6c6568e54d5b	14:00:00	MW	0	29	1	Autumn2021	ENV208	5236-DR Mohammad Sorowar Hossain	BC4011-S
dee886b5-7872-4fa8-ae19-92732c22256f	11:00:00	ST	0	41	1	Autumn2021	ENV212	5207-MR Tanvir Ahmed Haroon	BC8012-S
af1d8013-941f-4781-9fef-88628b828377	11:00:00	ST	0	32	2	Autumn2021	ENV212	5247-DR Tawhid Monzur	BC8013-S
e196d510-f0ea-4d98-a895-c7c53118f6ac	14:00:00	MW	0	27	1	Autumn2021	ENV301	5230-MR Md. Ekhtekharul Islam	BC8013-S
88a3066d-4cad-4235-8f46-d6b08cba30a9	17:00:00	ST	0	31	1	Autumn2021	ENV302	5247-DR Tawhid Monzur	BC7019-S
1ed4e859-5ec0-4c19-9e79-e8b2095a559e	15:30:00	R	0	24	1	Autumn2021	ENV302L	5247-DR Tawhid Monzur	BC7019-S
66a5bee7-7ed8-4e69-95d7-45fe3b9ded03	12:30:00	MW	0	31	1	Autumn2021	ENV303	5207-MR Tanvir Ahmed Haroon	C4005-S
51826359-7798-4665-aab9-74c6cfe941c8	11:00:00	MW	0	7	1	Autumn2021	ENV304	5236-DR Mohammad Sorowar Hossain	C3002-S
2d878bc0-a31b-4fbf-bcc3-12caa435ac7f	14:00:00	R	0	2	1	Autumn2021	ENV304L	5236-DR Mohammad Sorowar Hossain	BLab-S
b90d860d-f6c2-4e2a-a6e2-ba6013aa9ab7	15:30:00	MW	B-0	0	1	Autumn2021	ENV307	5230-MR Md. Ekhtekharul Islam	BC8015-S
10841787-b2e4-4ccf-a059-c95f80adf9ad	12:30:00	ST	0	32	1	Autumn2021	ENV310	5199-DR Shahima Islam	BC4011-S
4486d260-aa7e-4086-b556-5f0e93869aca	09:30:00	MW	0	30	1	Autumn2021	ENV315	5129-MR Khondkar Ayaz Rabbani	BC4010-S
ff0ccc4d-3c85-4b46-84f6-1cfc5e01c791	08:00:00	ST	0	42	1	Autumn2021	ENV316	5142-DR Md. Abdul Khaleque	BC8013-S
b1b16c65-bb13-4c42-810f-45ab9ddf6515	15:30:00	ST	0	39	2	Autumn2021	ENV316	5142-DR Md. Abdul Khaleque	BC8012-S
33396bee-b80f-4984-8e89-93d48a48ed28	14:00:00	MW	0	37	1	Autumn2021	ENV320	5536-MS Karishma Sinha	BC8012-S
e799b680-d398-420d-ab71-b0fa51a88d72	08:00:00	MW	0	31	1	Autumn2021	ENV325	5142-DR Md. Abdul Khaleque	BC8015-S
f3e9dc95-f1c2-4ffb-9cd8-b82be9d8ab1f	17:00:00	ST	B-0	0	2	Autumn2021	ENV325	5142-DR Md. Abdul Khaleque	BC8012-S
f7a1cffb-06e5-4404-aa62-1d81f8af01d6	17:00:00	MW	0	11	1	Autumn2021	ENV340	5247-DR Tawhid Monzur	BC7019-S
f3df7ca8-08c5-48cd-906a-a3132c0fffc1	09:30:00	ST	0	20	1	Autumn2021	ENV346	5215-DR M. H. Rahman	BC8014-S
e4cbc2de-7494-4804-923c-42d7a32a0f45	14:00:00	MW	0	17	1	Autumn2021	ENV348	5215-DR M. H. Rahman	BC8014-S
f2221f3a-c322-4f9c-8fb8-11fc05811bf5	15:30:00	MW	0	19	1	Autumn2021	ENV350	5536-MS Karishma Sinha	BC8011-S
ecbeb940-d00c-4bb0-9b0e-f0da61f6ac1c	14:00:00	ST	0	17	1	Autumn2021	ENV360	5199-DR Shahima Islam	C4004-S
359546e8-1ab5-4ac3-ba39-1189cf3532a0	12:30:00	MW	0	50	1	Autumn2021	ENV401	5189-PROF M. Z. Abedin	BC8013-S
e8b2f513-2d7c-4d89-8091-89d585b05ac2	09:30:00	MW	0	34	1	Autumn2021	ENV403	5215-DR M. H. Rahman	BC8013-S
7c7a4782-f633-43f0-b5a5-019c8ffc5237	17:00:00	ST	0	26	1	Autumn2021	ENV409	5189-PROF M. Z. Abedin	BC8015-S
3dfa6504-c114-4119-b9da-d6978755d59b	17:00:00	MW	0	38	1	Autumn2021	ENV410	5326-MS Taspiea Mostofa	BC8012-S
d1cec807-7523-4533-9a6f-e894ea40f6b9	09:30:00	ST	0	43	1	Autumn2021	ENV415	5129-MR Khondkar Ayaz Rabbani	C2005-S
53ee1dcf-76d0-4d85-bf47-ec19ef2bd0f6	08:00:00	R	0	2	1	Autumn2021	ENV498	5142-DR Md. Abdul Khaleque	BCTBA4-S
d0a8c05c-09e3-403d-81c1-fba8b570fc98	09:30:00	R	0	1	2	Autumn2021	ENV498	5215-DR M. H. Rahman	BCTBA4-S
f52bcb4d-1a7f-41e6-be6b-e5e4fae695cb	11:00:00	R	0	1	3	Autumn2021	ENV498	5236-DR Mohammad Sorowar Hossain	BCTBA4-S
fe9773ef-c625-46dc-b664-dc60dde62b20	12:30:00	R	0	5	4	Autumn2021	ENV498	5129-MR Khondkar Ayaz Rabbani	BCTBA4-S
ac80adf0-05ea-4a09-b4d2-530e798de54b	14:00:00	R	0	3	5	Autumn2021	ENV498	5199-DR Shahima Islam	BCTBA4-S
95f13738-9a5b-43a1-8beb-30413245790e	15:30:00	R	0	1	6	Autumn2021	ENV498	5189-PROF M. Z. Abedin	BCTBA4-S
e2137c8d-72cf-44d1-a996-de7b99ef5563	17:00:00	R	0	4	7	Autumn2021	ENV498	5252-DR Sadia Nazneen Karobi	BCTBA4-S
b9175ccf-2228-4abd-bca1-a05cbd980078	18:30:00	R	0	2	8	Autumn2021	ENV498	5247-DR Tawhid Monzur	BCTBA4-S
fd16b8dc-5972-4303-b8f6-1a17be011e2b	20:00:00	R	0	3	9	Autumn2021	ENV498	5230-MR Md. Ekhtekharul Islam	BCTBA4-S
b5b91940-1663-4a2d-b224-22e4603ae829	08:00:00	F	0	5	10	Autumn2021	ENV498	5231-MR Saquib Ahmad Khan	BCTBA4-S
e4df677b-2e4d-4d11-b0ac-5968c63babb0	09:30:00	F	0	6	11	Autumn2021	ENV498	5207-MR Tanvir Ahmed Haroon	BCTBA4-S
d055f8ae-d609-4b90-99fd-5a68823ba043	11:00:00	F	0	4	12	Autumn2021	ENV498	5536-MS Karishma Sinha	BCTBA4-S
8578cd4f-a081-4eb2-b374-a6b26f231d9e	12:30:00	F	0	1	13	Autumn2021	ENV498	5248-MS Tahmina Sultana	BCTBA4-S
8e41ba48-096d-46b9-b59a-cf248f544992	14:00:00	F	B-0	0	14	Autumn2021	ENV498	5129-MR Khondkar Ayaz Rabbani	BCTBA4-S
0267d3e6-d587-41dc-90ce-568ab066557f	15:30:00	F	0	32	1	Autumn2021	ENV499	5129-MR Khondkar Ayaz Rabbani	BCTBA1-S
01b0d968-17f2-46a1-88db-744dae3a87ad	11:00:00	ST	0	36	1	Autumn2021	ETE312	4199-DR Feroz Ahmed	BC6013-S
2d69e3ac-4724-488c-952b-895dba05ffcb	15:30:00	S	0	0	1	Autumn2021	ETE315L	4461-MR Abdullah Al Noman	TelLab-S
8912ebf6-fb8f-4366-9d16-d98e18e53e67	11:00:00	MW	0	28	1	Autumn2021	ETE322	4199-DR Feroz Ahmed	BC3012-S
f5c46033-00bd-439c-9cd5-cece9f110d17	12:30:00	W	0	24	1	Autumn2021	ETE322L	4275-MS Tahsin F. Ara Nayna	TelLab-S
f2243b1c-9afc-40f7-b051-184c6dda0c48	12:30:00	ST	0	30	1	Autumn2021	ETE331	4275-MS Tahsin F. Ara Nayna	BC6013-S
46277ae7-30ae-4d91-86ca-cb35a713cf3b	12:30:00	M	0	20	1	Autumn2021	ETE331L	4275-MS Tahsin F. Ara Nayna	TelLab-S
a15a78b2-50af-44e0-8a86-5d28bc76443c	15:30:00	M	0	20	2	Autumn2021	ETE331L	4275-MS Tahsin F. Ara Nayna	TelLab-S
64cd16f5-2958-43c8-98bf-e26723426dc0	15:30:00	ST	0	9	1	Autumn2021	ETE335	4275-MS Tahsin F. Ara Nayna	BC6007-S
a8fb83e7-da32-4740-940c-d40fc3fd1b14	15:30:00	W	0	2	1	Autumn2021	ETE335L	4461-MR Abdullah Al Noman	TelLab-S
80e7b06b-86a9-4d78-ac22-76e2c8feae8e	09:30:00	ST	0	5	1	Autumn2021	ETE411	4460-DR Tanbir Ibne Anowar	BC7015-S
843d35a0-a17a-4ce9-b915-133d09e36541	12:30:00	S	0	4	1	Autumn2021	ETE411L	4461-MR Abdullah Al Noman	TelLab-S
5917e807-5bab-47d5-9148-196674cf2f6e	17:00:00	ST	0	36	1	Autumn2021	ETE413	4297-MR M. Ishtiaque Rahman	BC6007-S
0af90563-e543-4f86-bd93-0e3d7dd87bd6	08:00:00	ST	0	10	1	Autumn2021	ETE423	4287-MR Ali Ashraf Molla	BC6009-S
39e9b236-0984-4082-86a5-bf2c5c3f5fba	09:30:00	ST	0	51	1	Autumn2021	FIN201	3442-MR Anwar Zahid	BC2013-S
e0afb340-ba2f-433d-9a1b-52b9dc1857b7	11:00:00	MW	0	50	2	Autumn2021	FIN201	3479-MS Zaima Ahmed	BC2010-S
9b125a85-8a67-4590-b26f-4ad79ef88019	08:00:00	ST	0	50	3	Autumn2021	FIN201	3570-MS Maria Muntahin	BC3010-S
40a1c0de-0af7-42d5-9f48-6bf7569c076f	12:30:00	MW	0	51	4	Autumn2021	FIN201	3633-DR Imtiaz Ahmed Nevin	BC2011-S
cc225016-8f74-4e85-bbe5-14761172a79d	17:00:00	ST	0	51	5	Autumn2021	FIN201	3588-MR Md. Sajedul Islam	BC2021-S
b514fb65-6196-4c51-b9f0-12a2102e1c08	12:30:00	MW	0	52	6	Autumn2021	FIN201	3442-MR Anwar Zahid	BC2012-S
663b52d1-3b58-4765-8530-1304fb3a1b8a	09:30:00	MW	0	50	7	Autumn2021	FIN201	3636-MS Tahmina Ahmed	BC2011-S
d22df67c-952b-46cd-b66a-03af4cb8cbc4	15:30:00	MW	0	50	8	Autumn2021	FIN201	3468-MS Sumaya Zesmin	BC2013-S
bbf34e30-0ad0-4fa0-9321-ca1b4f3051c2	12:30:00	ST	0	51	1	Autumn2021	FIN301	3442-MR Anwar Zahid	BC2010-S
463a76ef-9f92-47b8-a5ba-d129b0118f8f	08:00:00	MW	0	50	2	Autumn2021	FIN301	3442-MR Anwar Zahid	BC2011-S
651b811a-0171-486f-9a04-69036b6a5d82	11:00:00	ST	0	50	1	Autumn2021	FIN302	3344-MR Mohammad Fahad Noor	BC2013-S
8c894e99-adbb-407a-8af6-e92f37193fcb	14:00:00	MW	0	50	2	Autumn2021	FIN302	3344-MR Mohammad Fahad Noor	BC2011-S
d794519f-7929-4928-8de6-536cc72dde46	09:30:00	ST	0	29	1	Autumn2021	FIN305	3479-MS Zaima Ahmed	BC10015-S
e8d0db9f-69e3-4a6b-8bcd-b6a5502caec4	08:00:00	ST	0	41	1	Autumn2021	FIN401	3479-MS Zaima Ahmed	BC2012-S
cacef436-1d4f-48e3-a61d-6fa56eff615c	17:00:00	ST	0	46	2	Autumn2021	FIN401	3617-MR Anis A. Khan	BC2011-S
d14150ce-190b-46c1-88e6-82a69d3bfad6	11:00:00	ST	0	50	1	Autumn2021	FIN405	3429-MS Jesmin Mannan	BC2012-S
de8ea19a-4716-46ce-b3eb-7c8911bfc016	12:30:00	ST	0	50	1	Autumn2021	FIN460	3344-MR Mohammad Fahad Noor	BC2011-S
36587705-248d-4537-b500-8ba3b62a6543	11:00:00	MW	0	48	2	Autumn2021	FIN460	3442-MR Anwar Zahid	BC2011-S
3b7f825b-b273-41c9-9d05-2e309b88e45e	15:30:00	MW	0	50	1	Autumn2021	FIN461	3344-MR Mohammad Fahad Noor	BC2012-S
68056456-0104-4668-a1e5-e9f317f6dd0c	09:30:00	MW	0	51	1	Autumn2021	FIN480	3479-MS Zaima Ahmed	BC8011-S
91eb3734-6cad-447c-bedb-ffbe464b0479	08:00:00	MW	0	30	1	Autumn2021	FRN101	2160-DR Rifat Rashid	BC8011-S
d0932592-d298-45ba-8d8a-9c094dcbb151	09:30:00	MW	0	31	2	Autumn2021	FRN101	2160-DR Rifat Rashid	BC4013-S
7702b115-55bf-468f-ad52-c65182474061	08:00:00	ST	0	29	3	Autumn2021	FRN101	2286-MR Mohammed Ataur Rahman	C2004-S
17663cbb-8d75-4a79-9b91-ccb428604739	09:30:00	ST	0	30	4	Autumn2021	FRN101	2286-MR Mohammed Ataur Rahman	BC4011-S
a8246195-a20c-4777-8b24-b17ae437b537	12:30:00	MW	0	18	1	Autumn2021	GSG101	2479-DR Marufa Akter	C5005-S
fcaa5160-55f4-4f6f-afc8-25932c9f22ee	11:00:00	ST	0	7	2	Autumn2021	GSG101	2496-DR Shanawez Hossain	C6003-S
6ae78ea1-f2be-499b-8032-a5b71611ceb1	15:30:00	MW	0	8	3	Autumn2021	GSG101	2480-MR Mohammad Ashab Uddin	C2004-S
7d4c0eab-0e0d-4227-8853-79da23577123	12:30:00	ST	0	6	4	Autumn2021	GSG101	2462-MR Md. Ohidujjaman	C4005-S
3ad023bd-0554-430b-9236-e00844499193	11:00:00	MW	0	5	5	Autumn2021	GSG101	2504-MR Raian Hossain	C2002-S
848ad5b8-b53f-46f9-964f-22cc0266d17e	12:30:00	MW	0	6	1	Autumn2021	GSG102	2496-DR Shanawez Hossain	C2007-S
ca73b026-2d9a-4710-8db3-035e9c853418	11:00:00	MW	0	8	1	Autumn2021	GSG103	2479-DR Marufa Akter	C3007-S
49e4a9f8-fba1-48b9-9eb9-6421065c5875	11:00:00	ST	0	3	1	Autumn2021	GSG202	2392-PROF Imtiaz A. Hussain	C3007-S
60d811ed-fc6f-45d4-8754-a047a262bc50	09:30:00	ST	0	3	1	Autumn2021	GSG203	2504-MR Raian Hossain	C2002-S
cfb7ec74-9fde-458a-bb0d-a6df3ffd56b7	14:00:00	MW	0	4	1	Autumn2021	GSG210	2392-PROF Imtiaz A. Hussain	C4006-S
f5a6263a-9288-4a68-ab79-849244c758cf	12:30:00	MW	0	2	1	Autumn2021	GSG211	2392-PROF Imtiaz A. Hussain	C5002-S
9026317b-1ad7-4459-a306-43f3d0c61a2d	11:00:00	ST	0	6	1	Autumn2021	GSG282	2504-MR Raian Hossain	C4002-S
6f35d0bd-753d-4d67-862f-a4969d7f590f	12:30:00	ST	0	9	1	Autumn2021	GSG304	2496-DR Shanawez Hossain	C2007-S
902be516-7b09-45a8-82eb-54b6c765450c	11:00:00	ST	0	6	1	Autumn2021	GSG305	2462-MR Md. Ohidujjaman	C3006-S
b7017604-6232-4a36-a5fb-f24abbea782a	17:00:00	MW	0	4	1	Autumn2021	GSG320	2480-MR Mohammad Ashab Uddin	C2003-S
af9e4e73-9679-4dd2-8ff2-aa39314fc5a8	14:00:00	MW	0	1	1	Autumn2021	GSG321	2504-MR Raian Hossain	C5003-S
3ac2f03d-a14f-4c7e-8f26-194cbd175a89	17:00:00	MW	0	2	1	Autumn2021	GSG330	2495-DR Shima Zaman	C2006-S
825201d4-150c-41fe-a38d-1abb438c03b7	11:00:00	MW	0	1	1	Autumn2021	GSG360	2462-MR Md. Ohidujjaman	C4003-S
10a7f71a-adb9-4dbb-943c-5f76c55b39bf	14:00:00	ST	0	4	1	Autumn2021	GSG402	2462-MR Md. Ohidujjaman	C2002-S
12c39843-7feb-487e-927c-d9681c8963f2	09:30:00	MW	0	3	1	Autumn2021	GSG403	2479-DR Marufa Akter	C2006-S
7c51aff2-25d3-40d6-a08a-b1869b5bbd1a	15:30:00	MW	0	2	1	Autumn2021	GSG410	2392-PROF Imtiaz A. Hussain	C2003-S
cfb73b3e-92d6-44c7-8f60-911c7fd65437	11:00:00	MW	0	6	1	Autumn2021	GSG450	2496-DR Shanawez Hossain	C4002-S
99de5b24-a576-4e5b-a5c3-cff738c76099	09:30:00	ST	0	4	1	Autumn2021	GSG485	2392-PROF Imtiaz A. Hussain	C5002-S
74415dd5-6dc6-4bbe-945d-fc797afc4607	09:30:00	ST	0	4	1	Autumn2021	GSG492	2479-DR Marufa Akter	C2003-S
b7aba4c9-073d-4067-9ddb-05724be49620	18:30:00	R	0	1	1	Autumn2021	GSG498	2479-DR Marufa Akter	BCTBA1-S
68514b35-5858-402b-9930-edfaa209e49d	20:00:00	R	0	2	1	Autumn2021	GSG499	2496-DR Shanawez Hossain	BCTBA1-S
3fd15233-ed1c-4634-8cae-e41cf3af1690	08:00:00	ST	0	35	1	Autumn2021	HEA101	5528-MS Samia Aziz	BC9014-S
b12da177-270e-46d9-8da4-acff790657a7	11:00:00	ST	0	36	2	Autumn2021	HEA101	5528-MS Samia Aziz	BC10014-S
f858f7a4-2d84-4da8-be1f-48a79dca56bd	12:30:00	ST	0	39	3	Autumn2021	HEA101	5528-MS Samia Aziz	BC8013-S
62b113d5-6d85-4ba8-a03d-7ba22c152099	11:00:00	ST	0	34	4	Autumn2021	HEA101	5591-DR Tasnuva Faruk	BC10015-S
92cd1947-e353-4bd8-b936-59ea9e12b996	12:30:00	ST	0	35	5	Autumn2021	HEA101	5591-DR Tasnuva Faruk	BC8014-S
10a4871a-884c-4fa3-ade8-57a5d1f3b939	11:00:00	MW	0	35	6	Autumn2021	HEA101	5591-DR Tasnuva Faruk	C2004-S
a4363ab6-f0b2-4c6e-9fdd-38e8e3178cd7	12:30:00	MW	0	35	7	Autumn2021	HEA101	5591-DR Tasnuva Faruk	BC10018-S
ed5ef7e1-fb64-4a41-9a74-e9eb0923eadc	11:00:00	MW	0	40	8	Autumn2021	HEA101	5606-MR Rabiul Islam	C2005-S
86dc745b-9c30-470d-96dc-b61c6778c4e1	12:30:00	MW	0	38	9	Autumn2021	HEA101	5606-MR Rabiul Islam	BC9014-S
6b60087a-77e7-4914-bc54-6cfbf68f0874	11:00:00	ST	0	35	10	Autumn2021	HEA101	5606-MR Rabiul Islam	BC10018-S
a66f1613-b9ff-4ac9-9518-1bea7c12b938	12:30:00	ST	0	35	11	Autumn2021	HEA101	5606-MR Rabiul Islam	C4004-S
047c8b94-8f7a-440c-aea5-6cb414833882	17:00:00	MW	0	23	12	Autumn2021	HEA101	5592-MR Humayun Kabir	C4004-S
7ab1e2c9-c72e-48ed-b9d7-2e1d4c90d6bb	15:30:00	ST	0	47	1	Autumn2021	HRM301	3444-DR Ikramul Hasan	BC3009-S
4dcdfe17-6b49-4a3c-8a12-8ce0c9b874d4	09:30:00	MW	0	50	2	Autumn2021	HRM301	3413-MR Shafiqul Alam	BC9017-S
56026258-d766-4b7d-a85e-26f76cf502a9	08:00:00	ST	0	49	3	Autumn2021	HRM301	3569-MR Abdullah Al Ahad	BC3011-S
3d6aa6d7-c2c5-4220-9fea-4b4d6dffc661	17:00:00	MW	0	50	4	Autumn2021	HRM301	3629-MS Nabila Kamal Promy	BC8015-S
93525c0b-f371-4855-af7d-ef0e79a9d7e0	12:30:00	ST	0	40	5	Autumn2021	HRM301	3569-MR Abdullah Al Ahad	C2004-S
be1e8674-3ec6-4534-b3ee-e4552d847f45	15:30:00	MW	0	51	6	Autumn2021	HRM301	3446-MS Bushra Sanjana	BC3011-S
cbdd635d-6c17-468e-8025-00557212dcc7	12:30:00	ST	0	40	7	Autumn2021	HRM301	3446-MS Bushra Sanjana	C2005-S
46d86696-aaef-4b21-b814-783215d1d24f	17:00:00	ST	B-0	0	8	Autumn2021	HRM301	T001-00 TBA TBA	BC3011-S
2536f47e-980b-4984-940f-9cf4053af3c5	17:00:00	MW	0	54	1	Autumn2021	HRM360	3403-MR Awal Al Kabir	BC3009-S
bbd57215-5386-4b86-9bcf-f4306cf4d1c1	08:00:00	MW	0	54	2	Autumn2021	HRM360	3254-DR A.N.M. Shibly Noman Khan	BC3009-S
2982f615-24b2-4d15-8eed-f2db67e3f872	17:00:00	ST	0	55	1	Autumn2021	HRM370	3413-MR Shafiqul Alam	BC3008-S
9ec96184-fa39-4e81-b1e2-db3f11e27c93	11:00:00	MW	0	55	2	Autumn2021	HRM370	3254-DR A.N.M. Shibly Noman Khan	BC3011-S
17778897-8c97-486c-9282-3fac121dfe4b	14:00:00	ST	0	55	1	Autumn2021	HRM380	3446-MS Bushra Sanjana	BC3011-S
30df5225-da04-4111-8609-fcd00b137503	17:00:00	MW	0	55	2	Autumn2021	HRM380	3569-MR Abdullah Al Ahad	BC3010-S
d32395ad-9f8e-4799-8b19-527fe6f66c95	17:00:00	ST	0	54	1	Autumn2021	HRM390	3444-DR Ikramul Hasan	BC3009-S
b9e92cc7-5c7a-411a-9010-14549be15a32	12:30:00	MW	0	54	2	Autumn2021	HRM390	3569-MR Abdullah Al Ahad	BC10015-S
c16a7816-9409-4aa2-8b77-ddba07051c80	09:30:00	MW	0	59	1	Autumn2021	HRM410	3254-DR A.N.M. Shibly Noman Khan	BC10014-S
e014d8d3-4c65-4f1f-981d-4677ad888f8b	15:30:00	ST	0	53	1	Autumn2021	HRM460	3413-MR Shafiqul Alam	BC3008-S
31312039-4561-445e-97c7-0ee01ab3397a	12:30:00	MW	0	40	2	Autumn2021	HRM460	3446-MS Bushra Sanjana	C2004-S
e13edf1a-1a45-4082-a7b0-10d2997f69a0	17:00:00	ST	0	51	3	Autumn2021	HRM460	3629-MS Nabila Kamal Promy	BC3010-S
088740e6-e198-42c6-a4da-6c51c26411ab	12:30:00	ST	0	46	1	Autumn2021	INB301	3539-MR SM Yusuf Mallick	BC2012-S
dbc5a7ac-d82a-4210-ac65-639254ac90d9	08:00:00	ST	0	26	2	Autumn2021	INB301	3193-MR Hanif Mahtab	BC2013-S
7012f2f6-7010-49c2-96cd-ed841678d6df	12:30:00	MW	0	45	3	Autumn2021	INB301	3448-MR Mehadi Mansur	BC2013-S
2d68ee62-ef2c-4525-b080-bd25bcc3b9ea	09:30:00	MW	0	40	4	Autumn2021	INB301	3448-MR Mehadi Mansur	C2004-S
66f31c3b-e15a-4634-a296-e9aa909bf98e	14:00:00	ST	B-0	0	5	Autumn2021	INB301	T001-00 TBA TBA	BC2012-S
35cf5bb3-0cf3-4405-b634-6a2825e9fc82	11:00:00	MW	0	45	6	Autumn2021	INB301	3539-MR SM Yusuf Mallick	BC2012-S
a3e6faf8-8ec1-462a-8694-ebd86f9815f5	15:30:00	ST	0	45	7	Autumn2021	INB301	3607-DR Safayet Rahman	BC2012-S
6dca7a62-28f1-4bc1-be7c-6a6df61fba24	11:00:00	ST	0	44	8	Autumn2021	INB301	3299-MR Latiful Khabir	BC2014-S
55f307be-6ceb-4413-b96f-9a30830298ed	14:00:00	MW	0	46	9	Autumn2021	INB301	3512-MR Kazi Md. Jamshed	BC2012-S
79ff5287-1940-4b8c-9ccd-11df421be0c6	15:30:00	MW	0	33	1	Autumn2021	INB302	3607-DR Safayet Rahman	BC3009-S
806470e9-9049-41d1-bfb5-467184cba2ff	09:30:00	ST	0	29	2	Autumn2021	INB302	3193-MR Hanif Mahtab	BC10018-S
ceaf1c8f-e247-42b9-8b64-560ca2cd589f	12:30:00	MW	0	47	1	Autumn2021	INB303	3539-MR SM Yusuf Mallick	BC2014-S
c1a65781-1860-41b3-95aa-3a47509f68d9	11:00:00	ST	0	33	1	Autumn2021	INB304	3567-DR Raisul Awal Mahmood	BC2020-S
c4c3d95b-10ae-4e91-a8ae-dea6cf63fa7e	14:00:00	MW	0	35	2	Autumn2021	INB304	3567-DR Raisul Awal Mahmood	BC2013-S
a7399945-0784-440a-9cf2-801dcbda7a01	11:00:00	ST	0	48	1	Autumn2021	INB403	3539-MR SM Yusuf Mallick	BC2021-S
9ecc183b-cd2d-46ce-b40c-cfbb24485bb5	12:30:00	ST	0	50	2	Autumn2021	INB403	3607-DR Safayet Rahman	BC2013-S
264bec65-4244-492a-974e-9d73f7b3487d	15:30:00	MW	0	42	1	Autumn2021	INB405	3423-MR Arifur Rahman Khan	BC3010-S
570bd4c9-94d2-421d-b0b8-c2ef57b5edba	09:30:00	ST	0	7	1	Autumn2021	ITC103	2510-MR Md Anisur Rahman	C2007-S
733f5c8f-841d-492a-854f-e231801d29b3	14:00:00	MW	0	20	2	Autumn2021	ITC103	2391-MS Nabila Tahsin Farah	C5006-S
f1fc690c-157f-40e0-abcb-654001aa6738	09:30:00	ST	0	25	1	Autumn2021	LAW101	2445-MR Md Abdul Awal Khan	BC10017-S
03f41cae-f839-4955-9cee-ba5cc8cdb9be	14:00:00	ST	0	14	1	Autumn2021	LAW102	2510-MR Md Anisur Rahman	C3004-S
110675aa-4f77-4b6e-a476-123401c80926	09:30:00	MW	0	19	1	Autumn2021	LAW103	2501-MR Md. Al Ifran Hossain Mollah	C2007-S
0222a8e2-92c1-4699-ad3a-9a292a48bff8	11:00:00	ST	0	20	1	Autumn2021	LAW104	2445-MR Md Abdul Awal Khan	C4003-S
cf4e3ec5-98ec-4dfa-baa3-7696434ddcbb	14:00:00	MW	0	20	1	Autumn2021	LAW105	2433-DR Md. Mahbubur Rahman	C4007-S
47fbb414-2272-44af-8d30-269d80105d9b	14:00:00	ST	B-0	0	2	Autumn2021	LAW105	T001-00 TBA TBA	C2007-S
3d3ba8f4-a4d6-4eb8-82fc-d383883ea5e4	12:30:00	MW	0	20	1	Autumn2021	LAW106	2500-DR Zahidul Islam	C3002-S
dc19da38-024e-4f3b-aeab-e72686dfcc07	09:30:00	ST	0	20	2	Autumn2021	LAW106	2502-MS Afroza Bilkis	C3003-S
3a6dba19-2a38-4658-b799-ba3ec0a7f26f	12:30:00	MW	0	20	1	Autumn2021	LAW107	5271-DR Arif Jamil	C3003-S
4030e75b-e664-404f-b3da-759c2bad943d	12:30:00	MW	0	20	1	Autumn2021	LAW108	2502-MS Afroza Bilkis	C3006-S
19012077-e980-49bb-8ca4-b6c288074129	15:30:00	MW	0	8	1	Autumn2021	LAW201	2433-DR Md. Mahbubur Rahman	C2006-S
eaac733c-b5b5-4c6d-b1de-a4b90a3303f8	11:00:00	ST	0	20	1	Autumn2021	LAW203	2501-MR Md. Al Ifran Hossain Mollah	C4006-S
79ef7abf-e9a1-4bb8-80ec-b50c9eba469e	09:30:00	ST	0	16	1	Autumn2021	LAW204	2459-DR Assaduzzaman	C2006-S
c48ae83c-293b-40d7-be41-5f57e49cb0fe	09:30:00	MW	0	20	1	Autumn2021	LAW205	2500-DR Zahidul Islam	C3006-S
093e3e20-6044-4f9f-8b97-9e4d2acd42c6	09:30:00	ST	B-0	0	2	Autumn2021	LAW205	2503-MR Nuran Choudhury	C4003-S
d273e84a-62e4-4a46-9c11-7174a8fcd82c	09:30:00	MW	0	20	1	Autumn2021	LAW206	2445-MR Md Abdul Awal Khan	C3007-S
57bdb212-3878-4e41-9af9-9577e56a26be	11:00:00	ST	0	20	1	Autumn2021	LAW207	2510-MR Md Anisur Rahman	C5003-S
6c28f66c-3a40-4235-abab-de1cd4f280c3	12:30:00	ST	0	20	1	Autumn2021	LAW208	2501-MR Md. Al Ifran Hossain Mollah	C4002-S
6565d596-0dc4-4746-b622-8e5e6210a56c	14:00:00	ST	0	19	2	Autumn2021	LAW208	2503-MR Nuran Choudhury	C5007-S
1f304eaf-3d2a-4586-b095-d973ea450d80	12:30:00	MW	0	20	1	Autumn2021	LAW209	2501-MR Md. Al Ifran Hossain Mollah	C4003-S
6465468d-cc36-439f-a6c4-f87cbd632f5e	12:30:00	MW	0	12	2	Autumn2021	LAW209	2503-MR Nuran Choudhury	C4002-S
250b3366-c210-4798-af59-b5dc76da0715	11:00:00	MW	0	9	1	Autumn2021	LAW301	2428-DR Md Parvez Sattar	C5003-S
ab7099e7-0548-4904-a823-2a39a96c5aff	15:30:00	MW	0	20	1	Autumn2021	LAW303	2391-MS Nabila Tahsin Farah	C2007-S
b0f5f44a-f479-4e1e-8ad9-c495975d1aee	14:00:00	ST	0	21	1	Autumn2021	LAW304	2391-MS Nabila Tahsin Farah	C4005-S
d67f3cee-67bb-4a8d-a6d0-8636e96bf3ca	11:00:00	MW	0	20	1	Autumn2021	LAW306	2445-MR Md Abdul Awal Khan	C5006-S
39e95588-6bb7-4e32-a078-9095b4cdb74f	14:00:00	MW	0	20	1	Autumn2021	LAW308	5271-DR Arif Jamil	C5002-S
829d6fd2-3e2c-4e27-a973-af3bd63470a0	11:00:00	ST	0	21	1	Autumn2021	LAW309	2459-DR Assaduzzaman	C5006-S
2527aa2c-4467-4c6a-b078-1dd9a6b3d3f4	17:00:00	MW	0	16	1	Autumn2021	LAW404	2500-DR Zahidul Islam	C4002-S
ff078b7a-fb96-44c6-8767-161ca9675534	12:30:00	ST	0	20	1	Autumn2021	LAW407	2428-DR Md Parvez Sattar	C3003-S
c5650298-fde7-4eb2-a504-55c7c64218ae	15:30:00	MW	0	22	1	Autumn2021	LAW409	2432-DR Md. Nazmuzzaman Bhuiyan	C3003-S
c42143eb-b7ea-42cc-9865-2df2284e65b6	11:00:00	ST	0	20	1	Autumn2021	LEL102	2428-DR Md Parvez Sattar	C5002-S
d3827836-b2d5-45af-9699-5a0492b867ae	11:00:00	MW	0	20	2	Autumn2021	LEL102	2502-MS Afroza Bilkis	C4006-S
89403ad0-a56a-413e-828f-a0230deaaf6d	17:00:00	MW	0	20	3	Autumn2021	LEL102	2432-DR Md. Nazmuzzaman Bhuiyan	C2007-S
69bb9e35-e316-4679-9498-7135ffa1d1fa	14:00:00	ST	0	20	4	Autumn2021	LEL102	2428-DR Md Parvez Sattar	C5003-S
717ef9fd-e8b1-4187-96ad-9f9e943c64f0	09:30:00	MW	0	19	5	Autumn2021	LEL102	2503-MR Nuran Choudhury	C4006-S
60193f6a-2f08-44db-a333-72fc56bf244a	08:00:00	A	0	50	1	Autumn2021	LFE201	4397-MR Mohammad Motiur Rahman	FT-S
cc4ea102-85e7-4132-9741-1c47d61d8441	09:30:00	A	0	50	2	Autumn2021	LFE201	5207-MR Tanvir Ahmed Haroon	FT-S
675cf8ee-67ae-4b50-8e58-d1fd6e651fef	11:00:00	A	0	50	3	Autumn2021	LFE201	3461-MS Mumtahina Islam	FT-S
f207ab13-ab31-4bca-ad22-b825d29e355a	12:30:00	A	0	50	4	Autumn2021	LFE201	3344-MR Mohammad Fahad Noor	FT-S
716880f7-025e-47d2-a961-0fa8ac98a718	14:00:00	A	0	50	5	Autumn2021	LFE201	3525-MS Afnan Ashfaque	FT-S
9571a90f-3bd9-4cda-b91b-6140835f093e	15:30:00	A	0	50	6	Autumn2021	LFE201	2459-DR Assaduzzaman	FT-S
20abdf31-e9c5-424d-88e5-3a973bb60946	17:00:00	A	0	51	7	Autumn2021	LFE201	2462-MR Md. Ohidujjaman	FT-S
bed18461-1352-4209-b3ba-87daf1a7e2ea	18:30:00	A	0	50	8	Autumn2021	LFE201	2438-MS Israt Taslim	FT-S
38657525-718b-4863-ab01-552366ccd2ee	08:00:00	F	0	40	9	Autumn2021	LFE201	5519-DR Nafisa Huq	FT-S
e5083041-889b-4a1e-add2-9999b43dca98	09:30:00	F	0	40	10	Autumn2021	LFE201	5519-DR Nafisa Huq	FT-S
cdb662e5-00c6-4f14-b8de-21fe631feb00	08:00:00	ST	0	4	1	Autumn2021	LIN313	2132-MS Rezina Nazneen Rimi	BC8014-S
b1da2eb4-2ae5-4eee-8cfb-6ac30d88169f	09:30:00	ST	0	2	1	Autumn2021	LIN411	2132-MS Rezina Nazneen Rimi	BC4014-S
488a9675-35cf-4fde-a493-959430e38559	12:30:00	ST	0	40	1	Autumn2021	MAT100	4423-MS Nabila Jaman Tripti	BC5014-S
b8601586-9937-472c-9e5e-d27599d73b54	11:00:00	ST	0	38	2	Autumn2021	MAT100	4423-MS Nabila Jaman Tripti	BC6007-S
f70391a3-3952-4286-8f31-929d06bf86c6	17:00:00	ST	0	55	1	Autumn2021	MAT101	4255-MS Zainab Lutfun Nahar	BC5013-S
49ef05ed-30be-4549-a5a8-c4ff7a774e27	17:00:00	MW	0	55	2	Autumn2021	MAT101	4255-MS Zainab Lutfun Nahar	BC6007-S
f66069ef-3715-4e75-8e46-8841d61cf364	12:30:00	ST	0	55	3	Autumn2021	MAT101	4312-MS Purobi Rani Kundu	BC6007-S
d83e138b-29c2-431d-8671-4c7e445efb35	11:00:00	ST	0	55	4	Autumn2021	MAT101	4327-MS Amrita Khan	BC6008-S
6464bc07-05b4-4574-a394-2a85b89de572	08:00:00	MW	0	54	5	Autumn2021	MAT101	4327-MS Amrita Khan	BC5013-S
480c8761-38d8-4bee-95a8-daf2270bc1d6	15:30:00	MW	0	54	6	Autumn2021	MAT101	4411-MS Fauzia Hoque Shorna	BC5012-S
7b6cfa35-699a-432c-ac7b-d25f49375112	12:30:00	MW	0	55	7	Autumn2021	MAT101	4423-MS Nabila Jaman Tripti	BC5013-S
782b37a7-abd1-47a2-a699-01b9673bdf0c	11:00:00	MW	0	54	8	Autumn2021	MAT101	4423-MS Nabila Jaman Tripti	BC6007-S
1767f476-ee72-417c-80f3-a11df7245ecc	09:30:00	ST	0	54	9	Autumn2021	MAT101	4411-MS Fauzia Hoque Shorna	BC5014-S
797fce3b-a85a-4479-9799-9ec96c9959d0	14:00:00	ST	0	55	10	Autumn2021	MAT101	4312-MS Purobi Rani Kundu	BC5012-S
d8dad4d4-fb58-4068-86f0-afedfcaeded4	09:30:00	ST	0	55	11	Autumn2021	MAT101	4312-MS Purobi Rani Kundu	BC3002-S
cdb1fe97-09ab-4080-999e-723f15170036	12:30:00	ST	0	51	1	Autumn2021	MAT104	4378-DR Md. Readul Mahmud	BC6008-S
5f46b34a-e8bc-4b86-a283-a70bff1c1dc0	17:00:00	MW	0	25	2	Autumn2021	MAT104	4257-DR K M Ariful Kabir	BC6008-S
e39718b6-04fc-48f5-8d28-9016a4adab68	14:00:00	MW	0	35	3	Autumn2021	MAT104	4250-DR Asma Begum	BC5013-S
4fbafdbd-5cd4-4a1c-a037-909f7b9d2d55	11:00:00	ST	0	25	4	Autumn2021	MAT104	4419-MS Nurjahan Akter Nepa	BC6009-S
d2080e6a-b1d9-4cf6-a3b3-aaaa7d67dba6	12:30:00	MW	0	22	5	Autumn2021	MAT104	4419-MS Nurjahan Akter Nepa	BC5014-S
27bcb775-ccfe-4361-aa74-5c8e933d44ab	11:00:00	MW	0	50	6	Autumn2021	MAT104	4431-DR Mohammad Nazrul Islam	BC6008-S
3848396e-78d8-4e40-94aa-bbe88a804c50	12:30:00	ST	0	35	1	Autumn2021	MAT111	4419-MS Nurjahan Akter Nepa	BC6009-S
05332fd7-8ace-46d4-9432-47fd1a99e0f6	11:00:00	MW	B-0	0	1	Autumn2021	MAT121	T001-00 TBA TBA	BC001-S
24f24796-a06b-40ee-8844-f1a671bac0c6	11:00:00	MW	0	30	2	Autumn2021	MAT121	4102-DR Mohammed Anwer	BC5002-S
c0a58624-d460-4156-b213-7c9df7fd8a31	12:30:00	MW	0	27	3	Autumn2021	MAT121	4413-MS Nigar Sultana	BC6008-S
1c52bb3c-bfe0-431c-86fe-c5bf8f22ba9a	09:30:00	MW	0	41	4	Autumn2021	MAT121	4246-MS Proma Anwar Khan	BC6008-S
c1c6871b-9265-4f59-9876-3e747621a922	11:00:00	ST	0	50	5	Autumn2021	MAT121	4246-MS Proma Anwar Khan	BC6012-S
d0cd3a5c-7eb4-4960-a620-d55a2199f902	08:00:00	MW	0	25	6	Autumn2021	MAT121	4370-MS Tasnim Mafiz	BC6007-S
76bb5b8a-5c53-46c4-bfea-759081973a14	11:00:00	MW	0	2	1	Autumn2021	MAT125	4419-MS Nurjahan Akter Nepa	C2006-S
a871ce66-1011-4eeb-aae7-daf489477356	15:30:00	ST	0	21	1	Autumn2021	MAT131	4431-DR Mohammad Nazrul Islam	BC5012-S
50e10437-b6e4-4abd-b687-0c66fc234308	12:30:00	W	0	2	1	Autumn2021	MAT199L	4124-DR Shipra Banik	C5006-S
7a9c2133-4e85-4311-8c97-f4460516607d	17:00:00	MW	0	53	1	Autumn2021	MAT203	4309-PROF Md. Shafiqul Islam	BC6009-S
9a39403f-adbe-4a5b-972a-a2f3bf9c2f71	12:30:00	ST	0	52	2	Autumn2021	MAT203	4119-MS Dr. Rifat Ara Rouf	BC6012-S
fd1382e2-b767-4203-a3b7-2509e67363ce	15:30:00	MW	0	54	3	Autumn2021	MAT203	4223-MR Mr. Md. Shariful Islam	BC5013-S
bb772228-460c-428c-9e2d-3124f0accc80	09:30:00	MW	0	55	4	Autumn2021	MAT203	4322-PROF Nilufar Farhat Hossain	BC5013-S
2dbbe978-f74d-4945-a059-0797d99b79bc	09:30:00	ST	0	29	1	Autumn2021	MAT210	4370-MS Tasnim Mafiz	BC6007-S
c29983f2-d234-47fc-ad82-668b1ef7ea72	09:30:00	MW	0	50	1	Autumn2021	MAT211	4370-MS Tasnim Mafiz	BC5014-S
b92dc991-2a5b-4357-91f3-06f3a2098476	09:30:00	MW	0	51	2	Autumn2021	MAT211	4358-MR Mustafa Mohammad Shaky	BC6007-S
7e43292a-16cf-47d1-a482-0a4df77e3851	11:00:00	MW	0	50	3	Autumn2021	MAT211	4413-MS Nigar Sultana	BC6009-S
47183720-4e25-41bb-a802-297105ed1b3e	08:00:00	MW	0	50	4	Autumn2021	MAT211	4358-MR Mustafa Mohammad Shaky	BC5014-S
7e65b885-4a61-4514-86b6-bb2768fcff05	14:00:00	MW	0	52	5	Autumn2021	MAT211	4124-DR Shipra Banik	BC5014-S
e29b62fd-b4c8-4381-954c-a138a7143869	09:30:00	ST	0	50	6	Autumn2021	MAT211	4124-DR Shipra Banik	BC6008-S
0526c79f-5713-4bbf-b526-36c994f6fd5e	08:00:00	ST	0	43	7	Autumn2021	MAT211	4370-MS Tasnim Mafiz	BC5014-S
00eabf39-a0ba-49e7-a705-4bb306a6ceda	11:00:00	MW	0	50	8	Autumn2021	MAT211	4246-MS Proma Anwar Khan	BC6012-S
016b1c74-9f70-4edd-97f1-87b495959388	12:30:00	MW	0	50	9	Autumn2021	MAT211	4471-PROF Muhammed Siddique Hossain Farayzi	BC6007-S
8bbc688e-286b-4143-a4a9-042b9b8592df	08:00:00	ST	0	51	10	Autumn2021	MAT211	4246-MS Proma Anwar Khan	BC6007-S
d209fd3a-3e82-465b-8fde-d811b4c005ff	09:30:00	MW	0	24	1	Autumn2021	MAT213	4308-PROF Laek Sazzad Andallah	BC6009-S
c44e7bad-65a5-4095-baff-24cc6f131695	17:00:00	MW	0	1	1	Autumn2021	MAT215	4223-MR Mr. Md. Shariful Islam	C2002-S
e024728c-131e-4363-8f63-aa9c9afe1d4f	17:00:00	MW	0	53	1	Autumn2021	MAT221	4310-PROF Md. Abu Naim Sheikh	BC6012-S
d340b6bd-e04f-4753-aebf-7a02da71a167	09:30:00	MW	0	56	1	Autumn2021	MAT230	4102-DR Mohammed Anwer	BC6012-S
e5f0954e-e868-4f5c-8c56-0bb062693343	11:00:00	MW	0	57	2	Autumn2021	MAT230	4119-MS Dr. Rifat Ara Rouf	BC10018-S
a94d92da-091e-4325-994a-8d3c3b4c0619	08:00:00	MW	0	56	3	Autumn2021	MAT230	4308-PROF Laek Sazzad Andallah	BC6008-S
c41392cd-aa21-4f29-9265-5695be78b9af	11:00:00	MW	0	56	4	Autumn2021	MAT230	4322-PROF Nilufar Farhat Hossain	BC10015-S
a0deb434-ca3a-4e4a-9036-2bb48e4be81c	11:00:00	MW	0	9	1	Autumn2021	MAT251	4454-DR Jewel Kumar Ghosh	C2007-S
9b920160-1796-4e49-b9a3-7b35b370ac2d	12:30:00	ST	0	1	1	Autumn2021	MAT330	4228-DR Habib Bin Muzaffar	BC10017-S
d0843fd2-441f-4b52-8275-c47babbdb346	15:30:00	MW	0	12	1	Autumn2021	MAT405	4257-DR K M Ariful Kabir	BC6013-S
0aec423d-9c7f-41c4-86e4-52d256640c3d	09:30:00	ST	0	7	1	Autumn2021	MAT410	4119-MS Dr. Rifat Ara Rouf	BC9015-S
65a175f6-44e8-47db-a918-01abd744c47f	08:00:00	A	0	1	1	Autumn2021	MAT499	4228-DR Habib Bin Muzaffar	BC5012-S
999d11d0-d664-47a7-bca0-0baca73c99a1	14:00:00	ST	0	24	1	Autumn2021	MCB101	6010-MS Tasnimul Ferdous	C2005-S
a47ff132-60cb-4957-9695-b52cef80af62	12:30:00	ST	0	15	1	Autumn2021	MCB102	6013-MS Noshin Azra Rahman	BC10018-S
f0de28c8-9396-4268-a0b0-df8b0a73a051	09:30:00	ST	0	19	1	Autumn2021	MCB103	6072-MR A.B.M. Rezwanul Kabir	C6006-S
5b873153-e53c-42a6-9f22-f0a50a07fbb1	17:00:00	MW	B-0	0	2	Autumn2021	MCB103	T001-00 TBA TBA	C3003-S
1548b70d-bb81-4546-a5d3-e094900b8b38	11:00:00	R	0	19	1	Autumn2021	MCB103L	6072-MR A.B.M. Rezwanul Kabir	BC4017A-S
ec661596-af62-493c-a50f-52317a41aec4	14:00:00	R	B-0	0	2	Autumn2021	MCB103L	T001-00 TBA TBA	BC4017A-S
b7267040-ef27-43ae-9889-d35109a3455e	15:30:00	MW	0	9	1	Autumn2021	MCB201	6013-MS Noshin Azra Rahman	C3007-S
3e7b4bf9-aca8-46f4-8ab0-785c1130c1d6	11:00:00	ST	0	14	1	Autumn2021	MCB202	6009-DR Ashrafus Safa	C5007-S
6f53a056-0d71-4777-af43-706551ea23bc	14:00:00	MW	0	14	1	Autumn2021	MCB204	6070-MR Salman Khan Promon	BC10017-S
c1e5eb31-ddab-42d6-85a8-5c785c5acaeb	08:00:00	ST	0	9	1	Autumn2021	MCB210	T001-00 TBA TBA	C2003-S
acb56186-8049-4250-a84c-3fbddf30a1ca	15:30:00	ST	0	19	1	Autumn2021	MCB301	6055-DR Rashed Noor	C2006-S
55165246-a7aa-40ba-8852-7a82c10be901	17:00:00	ST	0	12	1	Autumn2021	MCB302	6033-DR Jebunnahar Khandakar	BC10018-S
b2d9eeae-f11c-4b62-8a47-fea61a19621b	12:30:00	MW	0	16	1	Autumn2021	MCB305	6010-MS Tasnimul Ferdous	BC10017-S
bcf1181e-948f-497d-b2c0-c77a68424f7d	11:00:00	MW	0	9	1	Autumn2021	MCB306	6002-MR Syed A. K. Shifat Ahmed	C6002-S
687e750c-c701-4edb-91ca-6730a7edf187	12:30:00	ST	0	17	1	Autumn2021	MCB307	6033-DR Jebunnahar Khandakar	C3006-S
64bbce61-133a-4db6-9579-552e27d34012	17:00:00	ST	0	19	1	Autumn2021	MCB308	6055-DR Rashed Noor	C2002-S
b4bbfb24-50b1-4ef8-b5ee-a347554640aa	09:30:00	ST	0	12	1	Autumn2021	MCB310	6013-MS Noshin Azra Rahman	C4002-S
37615458-2685-4950-85b4-270873d0aad8	15:30:00	MW	0	14	1	Autumn2021	MCB311	6010-MS Tasnimul Ferdous	BC4017A-S
b1a68a59-3372-47a0-8d6c-3c8aa654f467	15:30:00	ST	0	11	1	Autumn2021	MCB404	6010-MS Tasnimul Ferdous	C2007-S
8e0d9bf1-961b-4088-9ad0-c3a2d77041aa	14:00:00	ST	0	16	1	Autumn2021	MCB406	6009-DR Ashrafus Safa	C2006-S
ed2ddf87-98a9-4b69-808a-08068edf0c93	12:30:00	MW	0	12	1	Autumn2021	MCB409	6002-MR Syed A. K. Shifat Ahmed	C5003-S
7e448c6a-da17-4179-a031-479b967e4714	11:00:00	ST	0	12	1	Autumn2021	MCB410	6002-MR Syed A. K. Shifat Ahmed	C6002-S
b3f8515d-62d0-4da6-a1d9-7d64e6b14d93	09:30:00	MW	0	12	1	Autumn2021	MCB411	6013-MS Noshin Azra Rahman	C4002-S
d8b84caa-e6ec-4d51-bc9a-02cfdeea7677	08:00:00	MW	B-0	0	1	Autumn2021	MCB450	T001-00 TBA TBA	BC9015-S
f14d464c-8ad9-4153-96c0-35e3ead27024	09:30:00	R	0	3	2	Autumn2021	MCB450	6055-DR Rashed Noor	BC4017A-S
6b3ca1eb-85cb-4f6d-b036-a4cedb053f7b	09:30:00	R	0	2	3	Autumn2021	MCB450	6009-DR Ashrafus Safa	BC4017B-S
2d3cdf76-35a6-418d-a67b-5583d1f41d96	09:30:00	R	0	2	4	Autumn2021	MCB450	6033-DR Jebunnahar Khandakar	BC4017C-S
d0b09d79-7351-4818-91bc-54e9eab5012e	09:30:00	R	0	2	5	Autumn2021	MCB450	6054-DR Sabrina Moriom Elias	BC4017D-S
a6799e31-8ef6-42f1-8813-049a59840abe	08:00:00	A	0	2	6	Autumn2021	MCB450	6002-MR Syed A. K. Shifat Ahmed	BC4017A-S
1d4d6595-013e-4ba9-ada0-f26c737b91b2	08:00:00	R	0	1	7	Autumn2021	MCB450	6013-MS Noshin Azra Rahman	BC4017B-S
ba601005-88a3-402b-952b-fa111f070f24	08:00:00	R	0	1	8	Autumn2021	MCB450	6010-MS Tasnimul Ferdous	BC4017C-S
466abcb3-5b02-4a10-a0f3-2594caaa702b	15:30:00	A	0	1	9	Autumn2021	MCB450	6053-MS Saadia Shareen	BC4017A-S
49bc57ec-e552-42b9-8ebc-e22bf3e4dc20	15:30:00	A	0	2	10	Autumn2021	MCB450	6070-MR Salman Khan Promon	BC4017B-S
2ca2b3e5-4a56-4125-9692-3d26e0c77224	15:30:00	A	0	1	11	Autumn2021	MCB450	6064-MR Md. Daud Hossain Khan	BC4017C-S
85818055-5bef-4b56-9dd6-f9a7c374e161	15:30:00	A	0	1	12	Autumn2021	MCB450	6073-MR Aftab Uz Zaman Noor	BC4017D-S
9f4c5cb9-9356-4cff-8a5e-c949d86404d4	09:30:00	A	B-0	0	13	Autumn2021	MCB450	T001-00 TBA TBA	BC4017A-S
a1bad902-118e-49e7-bfcc-ec6a3df48e45	09:30:00	A	B-0	0	14	Autumn2021	MCB450	T001-00 TBA TBA	BC4017B-S
52d86a44-11d3-4405-b7c7-b132589290ca	08:00:00	R	B-0	0	1	Autumn2021	MCB451	T001-00 TBA TBA	BC4017A-S
6e7272e1-0e1a-4c44-a4e0-f767736be6bf	17:00:00	R	0	6	2	Autumn2021	MCB451	6033-DR Jebunnahar Khandakar	BC4017A-S
4973b4f5-0de2-4889-892a-61bc209b187b	17:00:00	R	0	1	3	Autumn2021	MCB451	6013-MS Noshin Azra Rahman	BC4017B-S
3ec55ce8-3cad-4a00-a198-290462435aa9	17:00:00	R	0	1	4	Autumn2021	MCB451	6055-DR Rashed Noor	BC4017C-S
110a133f-4fe8-49b1-8bb3-58a3b76f7c50	12:30:00	A	B-0	0	5	Autumn2021	MCB451	T001-00 TBA TBA	BC4017A-S
b9a2269f-9038-437e-a38a-a5712abaa4b5	12:30:00	A	B-0	0	6	Autumn2021	MCB451	T001-00 TBA TBA	BC4017B-S
62ca53e7-3279-4876-858f-0ff03c6c5525	09:30:00	ST	B-0	0	1	Autumn2021	MGT201	3428-DR Dr. Nazmunnessa Mahtab	BC001-S
520964b1-b7de-44d2-aae7-fe35b56e89f7	08:00:00	MW	0	46	2	Autumn2021	MGT201	3251-MS Farzana Chowdhury	BC2012-S
505d0160-fd5c-4a91-a6c5-dcc5332d6243	12:30:00	ST	0	46	3	Autumn2021	MGT201	3299-MR Latiful Khabir	BC2014-S
86b53420-6988-4537-a841-6244c596949d	15:30:00	MW	0	45	4	Autumn2021	MGT201	3251-MS Farzana Chowdhury	BC2014-S
02350279-757f-45cc-bc7c-9ccf2052113f	14:00:00	ST	0	46	5	Autumn2021	MGT201	3570-MS Maria Muntahin	BC2013-S
d7ba9bca-2ce0-438f-a757-b487f495e530	09:30:00	MW	0	45	6	Autumn2021	MGT201	3525-MS Afnan Ashfaque	BC2012-S
4e904906-6caf-4de3-bf9b-0190ee6ea50d	17:00:00	MW	0	46	7	Autumn2021	MGT201	3323-MS Qantara Khaleda Khan	BC2011-S
cca1fc46-7db6-4d5b-b279-43658dd2b5b4	12:30:00	ST	0	44	8	Autumn2021	MGT201	3525-MS Afnan Ashfaque	BC2020-S
151e1b69-d277-4eeb-8e11-5e706bbee29a	12:30:00	MW	0	45	9	Autumn2021	MGT201	3358-MR Mr. Iftekhar Mahfuz	BC2020-S
a7307cc5-a5bf-451e-adf5-5c1af51be2d7	11:00:00	MW	0	40	10	Autumn2021	MGT201	3251-MS Farzana Chowdhury	C3004-S
6a6f25c0-a2ec-419e-8b8f-7d2758d2ffe1	08:00:00	ST	B-0	0	1	Autumn2021	MGT301	3428-DR Dr. Nazmunnessa Mahtab	BC2014-S
9e0b18bd-0c38-4704-b6dc-54e8e13d5246	09:30:00	MW	0	50	1	Autumn2021	MGT330	3579-MS Seeratus Sabah	BC2013-S
0454ef82-2f63-400b-bce5-6069b9b23b75	14:00:00	MW	0	50	2	Autumn2021	MGT330	3579-MS Seeratus Sabah	BC2014-S
91101c66-2383-49dc-a677-5ade8bc15f18	11:00:00	MW	0	50	3	Autumn2021	MGT330	3579-MS Seeratus Sabah	BC2013-S
2d15bd2e-b10d-4fb0-a81b-a4c3272388ed	09:30:00	ST	0	51	4	Autumn2021	MGT330	3615-DR Md. Mamun Habib	BC2020-S
d6e29c85-c24f-4cea-9b40-757ecb8915b4	11:00:00	ST	0	50	5	Autumn2021	MGT330	3615-DR Md. Mamun Habib	BC3008-S
93ed3499-02fc-41d2-9c75-aa20d2cb5264	17:00:00	ST	0	50	6	Autumn2021	MGT330	3634-DR Muhammad Azizur Rahman	BC2012-S
517eeafc-647b-4daa-b910-86177f91a08d	17:00:00	MW	0	51	7	Autumn2021	MGT330	3635-DR Md. Shamimul Islam	BC2012-S
b39ceb65-3cad-496e-af20-3bb70d855e5d	11:00:00	MW	0	41	1	Autumn2021	MGT340	3135-DR Abul Bashar	BC4010-S
86ffa3cf-b343-49df-beb5-0651278e889a	17:00:00	ST	0	35	1	Autumn2021	MGT380	3358-MR Mr. Iftekhar Mahfuz	BC3012-S
bad4a415-98c3-4c7e-8935-2d19b3b81394	09:30:00	ST	0	50	1	Autumn2021	MGT401	3525-MS Afnan Ashfaque	BC2014-S
c052bbac-ee41-4ed3-9ec2-4dba5830bd5e	14:00:00	MW	0	51	1	Autumn2021	MGT405	3358-MR Mr. Iftekhar Mahfuz	BC3002-S
2d11b591-c7d4-40ef-9dfd-f895d9ce1396	11:00:00	ST	B-0	0	1	Autumn2021	MGT450	3135-DR Abul Bashar	BC4012-S
17954daa-a336-45d7-8f7b-a49f8fbf016c	11:00:00	ST	0	51	1	Autumn2021	MGT490	3525-MS Afnan Ashfaque	BC3009-S
77c70a0b-9c4c-4b60-9b0d-9d4027f9d852	17:00:00	MW	0	50	2	Autumn2021	MGT490	3358-MR Mr. Iftekhar Mahfuz	BC2013-S
e519f736-2f36-44e3-83b8-0bb2e8bd4a91	11:00:00	MW	B-0	0	3	Autumn2021	MGT490	3513-PROF Dr. Aminul Karim	BC2014-S
5bb76976-4ba9-4b85-8ee1-033c1301d4f6	14:00:00	MW	0	51	4	Autumn2021	MGT490	3403-MR Awal Al Kabir	BC2020-S
5c9a0661-6fdf-4391-ac03-2f240e2630d3	12:30:00	ST	B-0	0	5	Autumn2021	MGT490	T001-00 TBA TBA	BC2021-S
37c09ad4-1e5b-4593-a7be-7c9f98fe9f9f	14:00:00	ST	0	40	6	Autumn2021	MGT490	3299-MR Latiful Khabir	BC2014-S
c9aa51d7-9a4d-4e8f-b1bc-3a1e10d3948c	09:30:00	MW	0	25	1	Autumn2021	MIS102	3542-MR Md. Aminul Islam	BC3009-S
c9ea0f3f-44ff-4984-b8e8-aeecfcbf4a39	09:30:00	MW	B-0	0	1	Autumn2021	MIS341	T001-00 TBA TBA	BC001-S
26fe16c1-1849-4748-bf01-b8c96f91878e	17:00:00	MW	0	51	1	Autumn2021	MIS401	3605-DR Mohammad Anisur Rahman	BC2021-S
2d421b9c-a5c3-4456-b588-6fd29f3b7483	15:30:00	MW	0	51	1	Autumn2021	MIS405	3605-DR Mohammad Anisur Rahman	BC3008-S
27867d43-90b9-4ca1-8ae7-1f8158a0afac	09:30:00	ST	0	51	1	Autumn2021	MIS430	3542-MR Md. Aminul Islam	BC3008-S
7c2f214d-b77d-4298-b814-0c6e18364640	11:00:00	MW	0	52	1	Autumn2021	MIS442	3566-DR Rezwanul Alam	BC3009-S
e1de42e0-cd5e-4a65-a54e-5a8bba3242e5	15:30:00	ST	0	51	2	Autumn2021	MIS442	3423-MR Arifur Rahman Khan	BC3011-S
5a198297-726c-414a-90bc-daed3fc0cf60	14:00:00	MW	0	51	3	Autumn2021	MIS442	3423-MR Arifur Rahman Khan	BC3008-S
3a4afea2-777f-41ab-9db4-801d11430513	15:30:00	MW	0	50	4	Autumn2021	MIS442	3542-MR Md. Aminul Islam	BC2021-S
9ea5297a-522a-467b-ba31-97f3644cd955	11:00:00	ST	0	50	5	Autumn2021	MIS442	3542-MR Md. Aminul Islam	BC3011-S
cfa6afaf-b1a2-4b99-988f-1a853847bb49	12:30:00	MW	0	51	6	Autumn2021	MIS442	3542-MR Md. Aminul Islam	BC3011-S
fd54efc2-87fa-4a01-a988-53ed33f5f5f0	09:30:00	ST	0	50	7	Autumn2021	MIS442	4375-MR Mustafa Nizamul Aziz	BC2021-S
f7e913fc-8cac-42ce-8bad-83a8aa102b43	09:30:00	MW	0	50	8	Autumn2021	MIS442	3631-MR Md. Rubel	BC3008-S
e6f1d367-bc3a-4512-8294-dc09f679efba	14:00:00	MW	0	23	1	Autumn2021	MIS455	3566-DR Rezwanul Alam	BC3009-S
2c9447cb-ad50-4428-834c-7523d492ed10	12:30:00	ST	0	50	1	Autumn2021	MIS465	3423-MR Arifur Rahman Khan	BC3009-S
15ffeb18-42a1-4fb2-9fbb-9c39d99fdc00	11:00:00	MW	0	50	1	Autumn2021	MKT201	3329-MR Abul Khair Jyote	BC2020-S
a9fb6e43-28bc-464b-b308-b1f0075a6186	12:30:00	MW	0	50	2	Autumn2021	MKT201	3406-MS Zakia Binte Jamal	BC2021-S
0bd56b2b-b8cf-40ea-9bc8-7fac555aa12c	15:30:00	ST	0	52	3	Autumn2021	MKT201	3406-MS Zakia Binte Jamal	BC2013-S
1a0ec1dd-c5e7-46bb-a23f-73c62672a6b9	11:00:00	MW	0	54	4	Autumn2021	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC2021-S
7138a68a-3da5-4635-bb29-8b0a81da8e71	08:00:00	MW	0	50	5	Autumn2021	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC2013-S
eff5fa4b-1c91-4612-b1d9-f37b443b5439	14:00:00	MW	0	50	6	Autumn2021	MKT201	3318-MR Suman Prosad Saha	BC2021-S
697526d1-cc00-47fc-99fb-3ecf9394faca	12:30:00	ST	0	50	7	Autumn2021	MKT201	3329-MR Abul Khair Jyote	BC3008-S
d9251e95-35dc-48d5-8f14-5eebd774afbd	17:00:00	MW	0	53	8	Autumn2021	MKT201	3547-MS Kazi Sharmin Pamela	BC2014-S
abb187ed-3ad5-44b4-9338-d2c6f6d1fc35	12:30:00	MW	0	50	1	Autumn2021	MKT302	3638-DR S M Sohel Rana	BC3008-S
88154b54-8131-4e50-8137-5b70416c0927	17:00:00	ST	0	50	2	Autumn2021	MKT302	3583-MR Sheikh Mohammad Fauzul Azim	BC2013-S
488e3f99-0a40-45c6-a105-be88b3c28b16	17:00:00	MW	0	50	3	Autumn2021	MKT302	3318-MR Suman Prosad Saha	BC2020-S
94ed58d3-fff7-4337-a4a1-671dfa65dff5	12:30:00	MW	0	45	1	Autumn2021	MKT340	3583-MR Sheikh Mohammad Fauzul Azim	BC3009-S
8dab8978-8388-47c0-ba9e-33e79ef28c8d	17:00:00	ST	0	45	2	Autumn2021	MKT340	3406-MS Zakia Binte Jamal	BC2014-S
8101850d-7588-485e-bda1-ea5e6282149e	08:00:00	MW	0	42	3	Autumn2021	MKT340	3638-DR S M Sohel Rana	BC2014-S
8004c3a4-a7e3-4bf9-9933-a97a04994820	14:00:00	ST	0	51	1	Autumn2021	MKT350	3583-MR Sheikh Mohammad Fauzul Azim	BC2020-S
8084b9c6-d219-4680-a0a8-0a1d830f74e5	12:30:00	MW	0	51	2	Autumn2021	MKT350	3318-MR Suman Prosad Saha	BC3010-S
862e2f52-d77c-4409-8f07-bcde3bbb2263	09:30:00	MW	0	48	3	Autumn2021	MKT350	3435-DR M. Habib	BC2014-S
8aa24e3c-f017-45cb-8f94-52c17fd11132	14:00:00	ST	0	49	1	Autumn2021	MKT380	3318-MR Suman Prosad Saha	BC2021-S
cdd74ee1-0d63-4790-b473-692ef6cfc820	11:00:00	ST	0	51	1	Autumn2021	MKT401	3329-MR Abul Khair Jyote	BC3010-S
1dd8da8e-e492-4e3f-adb1-a7d5321ff78f	09:30:00	MW	B-0	0	2	Autumn2021	MKT401	3539-MR SM Yusuf Mallick	BC2020-S
3d459b25-d201-48dc-98e2-eaa3a6c2bf69	15:30:00	MW	0	51	1	Autumn2021	MKT460	3406-MS Zakia Binte Jamal	BC2020-S
e64cf1e5-6c19-4e66-946e-8b25c4f0562b	11:00:00	MW	0	51	1	Autumn2021	MKT470	3406-MS Zakia Binte Jamal	BC3008-S
edb17769-1ced-4dd5-b5ec-03be6ead4228	09:30:00	MW	0	45	1	Autumn2021	MKT481	3185-MR Mohammed Sohel Islam	BC2021-S
04a2a720-232a-4822-bcc3-54c0ca80fffb	15:30:00	ST	0	50	2	Autumn2021	MKT481	3318-MR Suman Prosad Saha	BC2014-S
10eb0abc-1ead-43e6-b4d5-476aaf5bd1e6	15:30:00	ST	0	49	3	Autumn2021	MKT481	3329-MR Abul Khair Jyote	BC2021-S
7307fa8c-7b9a-48a7-a4df-8812b4590270	09:30:00	ST	0	46	1	Autumn2021	MUS101	2397-DR Shahnaz Nasrin	BC7002-S
2d653c22-d671-463f-9d3d-dac016eab4bb	09:30:00	MW	0	45	2	Autumn2021	MUS101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
457b44a6-ef49-4589-8699-addb7e017398	11:00:00	ST	0	45	3	Autumn2021	MUS101	2397-DR Shahnaz Nasrin	BC7002-S
77c15223-1cd6-4fbc-9bf1-fa62b9d45582	12:30:00	ST	0	15	1	Autumn2021	MUS102	2397-DR Shahnaz Nasrin	BC7002-S
97230017-1bb1-4211-938b-79f9ff002103	15:30:00	MW	0	51	1	Autumn2021	NCH101	2389-DR Ranjan Saha Partha	BC5002-S
32055b07-c1d8-462d-a2cd-ac802cb8fce3	12:30:00	MW	0	50	2	Autumn2021	NCH101	2389-DR Ranjan Saha Partha	BC7002-S
bf7d3221-d341-445d-955f-5cfd31a63e64	08:00:00	ST	0	50	3	Autumn2021	NCH101	2403-MR Mohammad Masud Rana	BC7002-S
43a02e0b-3795-4291-a28b-4e49b0348a48	09:30:00	ST	0	50	4	Autumn2021	NCH101	2403-MR Mohammad Masud Rana	BC5002-S
61602479-3d1e-48c2-9bd2-62c9604995f3	14:00:00	ST	0	49	5	Autumn2021	NCH101	2512-DR Md. Masood Imran	BC5002-S
160e8ba5-035d-4951-9197-437f30555e22	15:30:00	ST	0	49	6	Autumn2021	NCH101	2512-DR Md. Masood Imran	BC7002-S
79e1f86f-6948-4faa-8d08-de8bc1d82cdb	08:00:00	R	0	22	1	Autumn2021	PHA100	5261-MS Syeda Naureen Ahmed	C6002-S
a47a2775-9a85-4a5b-9cf1-bba9fb97dd09	09:30:00	R	0	22	2	Autumn2021	PHA100	5261-MS Syeda Naureen Ahmed	C6002-S
4f784cf2-0bf8-457e-b6b2-3ecb4eef1ace	11:00:00	R	0	21	3	Autumn2021	PHA100	5300-MS Mashmum Shababa Shahid	C6002-S
f475374d-e048-4f59-aaca-92a7c5ff9110	12:30:00	R	0	24	4	Autumn2021	PHA100	5300-MS Mashmum Shababa Shahid	C6002-S
d4bb460c-a4da-40d6-8f2c-c3b100b3e3fd	14:00:00	R	0	21	5	Autumn2021	PHA100	5320-MR Md. Abdul Aziz	C6002-S
cd2295d1-aacd-4a25-8983-e131f7dae541	15:30:00	R	0	22	6	Autumn2021	PHA100	5320-MR Md. Abdul Aziz	C6002-S
9f1a2ae1-af86-4162-a2e7-58766533ad8c	09:00:00	A	0	46	1	Autumn2021	PHA101	5334-MR Md. Ali Hossain	BC9013-S
0f80e156-38bf-4cf1-b081-5a024627d4e3	09:00:00	R	B-0	0	2	Autumn2021	PHA101	T001-00 TBA TBA	BC9013-S
8b4e82b7-b882-4252-9c84-604c8d0bb18c	12:30:00	MW	0	37	1	Autumn2021	PHA102	5282-PROF A. B. M. Faroque	C6004-S
c26c4ba3-524d-43c1-aa65-623af1200a44	12:30:00	R	B-0	0	1	Autumn2021	PHA102L	5611-DR Prawej Ansari	BC3015A-S
2b88d3ff-e639-413d-b614-51a83ee9dd04	14:00:00	R	B-0	0	2	Autumn2021	PHA102L	5611-DR Prawej Ansari	BC3015A-S
584b5d8e-c017-40d3-a336-05ddc21b0db8	15:30:00	R	B-0	0	3	Autumn2021	PHA102L	5611-DR Prawej Ansari	BC3015A-S
26aa658d-59e1-48aa-bd23-7d578d2436b6	17:00:00	R	0	16	4	Autumn2021	PHA102L	5611-DR Prawej Ansari	BC3015A-S
5d2e9588-353a-4a52-9b08-e1fbeadeecea	12:30:00	ST	0	24	1	Autumn2021	PHA103	5261-MS Syeda Naureen Ahmed	C6002-S
e2d63acd-cfa1-4f99-993c-a514275e3697	14:00:00	ST	0	15	2	Autumn2021	PHA103	5261-MS Syeda Naureen Ahmed	C6002-S
2d6df6d8-73e2-4010-aec4-c9709d52ca9a	11:00:00	MW	0	38	3	Autumn2021	PHA103	5261-MS Syeda Naureen Ahmed	C6004-S
697a4fa2-0f55-4699-b27c-71d0526b0963	17:00:00	ST	0	44	1	Autumn2021	PHA104	5312-DR A. B. M. Mahfuz Ul Alam	BC9013-S
668a6108-df28-4fca-ad1c-175b5d69bfdf	08:00:00	MW	0	38	1	Autumn2021	PHA105	5288-DR Sheikh Zahir Raihan	C6004-S
45582f3f-52b2-4bc8-bd84-be2653a32ad9	09:30:00	MW	0	43	2	Autumn2021	PHA105	5288-DR Sheikh Zahir Raihan	C6004-S
678f1dee-a214-47af-8a1e-bc4b756cb773	08:00:00	R	B-0	0	1	Autumn2021	PHA105L	5300-MS Mashmum Shababa Shahid	BC3015E-S
fde7d3b3-650a-457d-bf42-2c500056cbb5	09:30:00	R	0	16	2	Autumn2021	PHA105L	5300-MS Mashmum Shababa Shahid	BC3015E-S
00b85629-6fbe-42e1-82a4-26b1a8d23a50	14:00:00	R	0	15	3	Autumn2021	PHA105L	5300-MS Mashmum Shababa Shahid	BC3015E-S
3f1c5e7d-601e-4f7f-ae4b-c8d026eb78c4	15:30:00	R	0	15	4	Autumn2021	PHA105L	5300-MS Mashmum Shababa Shahid	BC3015E-S
61dc0417-07ec-48ae-b97a-8c0ad8b4d8db	09:30:00	ST	0	20	1	Autumn2021	PHA106	5320-MR Md. Abdul Aziz	C6002-S
cabd3d78-651c-40a9-93d2-277d489b2f6f	09:30:00	MW	0	17	2	Autumn2021	PHA106	5320-MR Md. Abdul Aziz	C6002-S
8e84681f-1cff-4a18-bd07-f01a382ca7a5	09:30:00	ST	0	34	3	Autumn2021	PHA106	5606-MR Rabiul Islam	C4004-S
cc62f369-b3d4-48cd-8594-2a2de55f6395	08:00:00	R	0	19	1	Autumn2021	PHA200	5254-PROF J M A Hannan	C6003-S
d0ab7054-d6e4-49c8-8468-8848008d7f68	09:30:00	R	0	20	2	Autumn2021	PHA200	5611-DR Prawej Ansari	C6006-S
7c403896-3340-43b9-947c-a011d06085e6	11:00:00	R	0	25	3	Autumn2021	PHA200	5611-DR Prawej Ansari	C6003-S
15946e45-d1d6-4d2d-83fd-721741e7fab6	12:30:00	R	0	22	4	Autumn2021	PHA200	5604-DR Iffat Ara Sonia Rahman	C6003-S
e8d17397-2227-4476-b272-be4e501cbd7a	14:00:00	R	0	16	5	Autumn2021	PHA200	5604-DR Iffat Ara Sonia Rahman	C6003-S
42273f12-ce96-4d43-9946-95dc8d97d163	15:30:00	R	0	7	6	Autumn2021	PHA200	5604-DR Iffat Ara Sonia Rahman	C6003-S
4d81b6e0-6654-46d6-b6ac-9c33a4b8bd85	08:00:00	MW	0	36	1	Autumn2021	PHA201	5266-MR Md. Abdul Muhit	C6005-S
a98e2a22-37c3-491f-8af0-ebc78f233e11	09:30:00	MW	0	16	2	Autumn2021	PHA201	5266-MR Md. Abdul Muhit	C6003-S
209d77f9-b368-4f54-8898-5866e2cc3726	15:30:00	ST	0	21	3	Autumn2021	PHA201	5289-MR Nazmus Saqueeb	C6002-S
5283561f-56ac-45eb-841e-9a9369079ce8	17:00:00	ST	0	33	4	Autumn2021	PHA201	5289-MR Nazmus Saqueeb	C6004-S
a504e6f2-0ee9-4881-8b2a-7b5b6587eea6	12:30:00	ST	0	15	1	Autumn2021	PHA202	5320-MR Md. Abdul Aziz	C6003-S
a23bc3c3-5e03-4192-86b4-75924000f101	14:00:00	ST	0	17	2	Autumn2021	PHA202	5320-MR Md. Abdul Aziz	C6003-S
2adcd0bc-d9ea-4d7e-ad1b-e8cf4823763d	11:00:00	MW	0	22	3	Autumn2021	PHA202	5320-MR Md. Abdul Aziz	C6003-S
d624fd2e-1fb7-40b9-a420-1b658ceb0894	14:00:00	MW	0	23	4	Autumn2021	PHA202	5320-MR Md. Abdul Aziz	C6003-S
d4902244-4d82-4c1d-a999-4bbd9ce045e5	08:00:00	R	B-0	0	1	Autumn2021	PHA202L	5320-MR Md. Abdul Aziz	BC3015D-S
a50a719c-0a2b-498c-b15c-e29782aac2a0	09:30:00	R	0	14	2	Autumn2021	PHA202L	5320-MR Md. Abdul Aziz	BC3015D-S
49c6c11f-1271-4aea-a555-91cd44fab826	11:00:00	R	0	15	3	Autumn2021	PHA202L	5320-MR Md. Abdul Aziz	BC3015D-S
1ae56f4b-025e-4ecd-b98e-58a5e9e88688	12:30:00	R	0	16	4	Autumn2021	PHA202L	5320-MR Md. Abdul Aziz	BC3015D-S
0d6685b3-06b8-4054-9155-c9341c2b0e5e	09:30:00	ST	0	16	1	Autumn2021	PHA203	5275-PROF Mohammad Mafruhi Sattar	C6003-S
dafa08be-3ba9-4905-aba7-600df756d1cf	09:30:00	MW	0	35	2	Autumn2021	PHA203	5265-MS Saquiba Yesmine	C6005-S
d3129b28-203c-4497-b46d-fd7e171399ab	11:00:00	MW	0	29	3	Autumn2021	PHA203	5265-MS Saquiba Yesmine	C6005-S
4e6dfb22-5fc5-4dcc-a911-80212fa3713f	14:00:00	R	0	10	1	Autumn2021	PHA203L	5261-MS Syeda Naureen Ahmed	BC3015C-S
7eaf20f3-198f-42d7-aed4-2b18753ca393	15:30:00	R	0	10	2	Autumn2021	PHA203L	5261-MS Syeda Naureen Ahmed	BC3015C-S
4455242d-bdde-4c94-94ca-ed86543da654	11:00:00	ST	0	45	1	Autumn2021	PHA204	5300-MS Mashmum Shababa Shahid	BC9013-S
8fa257cd-ed8e-448f-bb0d-a934752e12ba	12:30:00	ST	0	17	2	Autumn2021	PHA204	5300-MS Mashmum Shababa Shahid	C6006-S
e3f0ac49-ea8d-4d6c-901e-0e3923200b58	12:30:00	MW	0	19	3	Autumn2021	PHA204	5300-MS Mashmum Shababa Shahid	C6002-S
11125815-eb26-42d0-b32c-5593cace226b	14:00:00	MW	0	16	4	Autumn2021	PHA204	5300-MS Mashmum Shababa Shahid	BC9013-S
05c36e43-f236-4423-a1f6-fc902a5f7553	17:00:00	MW	0	17	1	Autumn2021	PHA205	5286-MR M. Salahuddin Bhuiya	BC9013-S
0ed99887-cd0a-43e1-83c1-b66348ea8d32	15:30:00	MW	0	24	2	Autumn2021	PHA205	5286-MR M. Salahuddin Bhuiya	C6004-S
1aeff2a3-488f-4cb1-b710-f91784df3e71	17:00:00	ST	0	6	3	Autumn2021	PHA205	5286-MR M. Salahuddin Bhuiya	C6005-S
3cee4b6b-ee4e-473a-ba6a-a236c02842a3	08:00:00	ST	0	44	4	Autumn2021	PHA205	5320-MR Md. Abdul Aziz	C6005-S
76b90ead-69d1-4ed5-b576-1ec42fd8eec7	12:30:00	ST	0	43	1	Autumn2021	PHA206	5611-DR Prawej Ansari	C6004-S
b4c22d8c-e0bb-403d-85cd-1a03af669f11	14:00:00	MW	0	20	2	Autumn2021	PHA206	5611-DR Prawej Ansari	C6002-S
616a0525-9fc1-44cf-bb7d-53e4d3bbb266	14:00:00	ST	0	16	3	Autumn2021	PHA206	5300-MS Mashmum Shababa Shahid	BC9013-S
b6970e12-73d1-4dbe-b81c-9d3069ae8d3d	11:00:00	MW	0	41	4	Autumn2021	PHA206	5300-MS Mashmum Shababa Shahid	BC9013-S
c32fca5f-4e65-41ea-89f2-a2d8ac7fee32	08:00:00	ST	0	26	1	Autumn2021	PHA207	5274-DR Md. Saiful Islam	BC9013-S
49c0bcd7-b920-4e85-9201-2c48b06dcf47	09:30:00	ST	0	44	2	Autumn2021	PHA207	5262-MR M. Shahabuddin K. Choudhuri	C6005-S
1e688aa3-dbe1-4b7d-8093-4c6801d4e7a2	11:00:00	ST	0	20	3	Autumn2021	PHA207	5262-MR M. Shahabuddin K. Choudhuri	C6007-S
86083659-55bc-4e3e-8123-e781e876d051	14:00:00	MW	0	32	1	Autumn2021	PHA208	5305-DR Muhammad Asaduzzaman	C6004-S
6841ccbe-e4d3-45af-a18e-50ec170b3b20	15:30:00	MW	0	13	2	Autumn2021	PHA208	5305-DR Muhammad Asaduzzaman	C6005-S
2e17c2f5-5397-4811-ba11-5919946aac2e	15:30:00	ST	0	45	3	Autumn2021	PHA208	5306-MR Zobaer Al Mahmud	C6005-S
53dd2b78-5e4a-4c9a-87d9-67697b3329c1	17:00:00	ST	0	46	4	Autumn2021	PHA208	5306-MR Zobaer Al Mahmud	C5004-S
c9ab99b4-ccef-4bac-ada6-6fa3edc18993	11:00:00	ST	0	22	1	Autumn2021	PHA209	5261-MS Syeda Naureen Ahmed	C6006-S
3489a97e-4df7-4735-ba67-cf6407182934	15:30:00	ST	0	23	2	Autumn2021	PHA209	5261-MS Syeda Naureen Ahmed	C6004-S
992f3dee-eba7-494c-895e-10da23e93419	12:30:00	MW	0	36	3	Autumn2021	PHA209	5261-MS Syeda Naureen Ahmed	C6005-S
e05caf08-0805-40db-821d-69d09f0929f7	14:00:00	MW	0	22	4	Autumn2021	PHA209	5261-MS Syeda Naureen Ahmed	C6007-S
e42534d5-4e53-4c74-8d6e-6f2b8bd7bdd6	11:00:00	A	0	31	5	Autumn2021	PHA209	5307-DR Md. Selim Reza	C6004-S
21cb269d-8c5e-401b-b59f-5da20cf3a461	08:00:00	R	0	20	1	Autumn2021	PHA300	5611-DR Prawej Ansari	C6007-S
e752beaa-27b5-4025-9d60-14d9b6e7da11	09:30:00	R	0	23	2	Autumn2021	PHA300	5254-PROF J M A Hannan	C6007-S
edc7f17b-993c-49bf-94ef-ee68a4825e99	14:00:00	ST	0	45	1	Autumn2021	PHA301	5283-DR Md. Raihan Sarkar	C6004-S
e0744926-37b6-40d5-a225-acfd478305e7	15:30:00	ST	0	46	2	Autumn2021	PHA301	5283-DR Md. Raihan Sarkar	C5005-S
fbea2fa8-7f05-4b43-8c6d-358ff8026530	15:30:00	MW	0	44	3	Autumn2021	PHA301	5607-DR A. S. M. Monjur-Al- Hossain	C5004-S
101ace80-9959-4c87-9e04-23e2ca31aa7b	17:00:00	MW	0	44	4	Autumn2021	PHA301	5607-DR A. S. M. Monjur-Al- Hossain	C6004-S
ba9737ad-cc37-4be7-9591-524a74adc2c5	15:00:00	F	0	35	1	Autumn2021	PHA302	5304-DR Md. Elias-Al- Mamun	BC9013-S
8891b419-ed4c-4887-b6d4-5c63d231aa8b	11:00:00	A	0	40	2	Autumn2021	PHA302	5304-DR Md. Elias-Al- Mamun	C6005-S
4ddac591-3656-4b9b-998a-b7d116547bf0	17:00:00	ST	0	16	3	Autumn2021	PHA302	5329-DR Jakir Ahmed Chowdhury	C5005-S
d33fa98f-77d6-4cc0-9a1f-f58250c899eb	17:00:00	MW	0	15	4	Autumn2021	PHA302	5329-DR Jakir Ahmed Chowdhury	C6005-S
4eb18598-0d5b-4fd7-aff2-dd6826f521b6	09:00:00	F	0	45	1	Autumn2021	PHA303	5609-MR Md. Ashraful Alam	BC9013-S
145f248e-0f97-468b-a4c3-5eb3d78e4d79	15:00:00	F	0	41	2	Autumn2021	PHA303	5609-MR Md. Ashraful Alam	C6004-S
582fdd6c-885f-4238-9ca0-ca51847e0c44	09:00:00	F	0	36	3	Autumn2021	PHA303	5312-DR A. B. M. Mahfuz Ul Alam	C6005-S
0f4b4731-e6ed-4ab4-a150-f260bacf28ad	14:00:00	ST	0	44	1	Autumn2021	PHA304	5264-MR Masum Shahriar	BC10018-S
991e159b-9c98-4c56-a141-7b7f428c6b7f	15:30:00	ST	0	39	2	Autumn2021	PHA304	5264-MR Masum Shahriar	C5004-S
0114dd7e-2f44-4bd1-acd8-fd381c6cc020	17:00:00	ST	0	35	3	Autumn2021	PHA304	5264-MR Masum Shahriar	C3004-S
61e18f8f-3707-49ed-a35f-1c2247f12d05	15:30:00	MW	0	33	4	Autumn2021	PHA304	5604-DR Iffat Ara Sonia Rahman	BC9013-S
db895097-fc91-478c-b013-5879992d3aab	11:00:00	ST	0	41	1	Autumn2021	PHA305	5281-PROF Amir Hussain Khan	BC8015-S
9d6b5650-8325-4cab-bbfc-2de8d8e5349a	15:30:00	ST	0	35	2	Autumn2021	PHA305	5327-DR Akib Bin Rahman	C6007-S
1df016cd-7151-4ecb-90f5-848ee2c04e39	08:00:00	MW	0	29	3	Autumn2021	PHA305	5327-DR Akib Bin Rahman	C4005-S
c0a6f9e5-6215-4e71-9259-64af62226272	09:30:00	MW	0	38	4	Autumn2021	PHA305	5327-DR Akib Bin Rahman	C5004-S
975e868d-ca2a-4cd1-b700-0b9710d9c71a	09:30:00	ST	0	43	1	Autumn2021	PHA306	5254-PROF J M A Hannan	BC9013-S
bf5abbe3-0216-4dc0-84d0-dafe1f56a09c	09:30:00	ST	0	19	2	Autumn2021	PHA306	5611-DR Prawej Ansari	C6004-S
355c537e-5e70-46dc-906a-a374ec9709d3	11:00:00	MW	0	37	3	Autumn2021	PHA306	5611-DR Prawej Ansari	C4005-S
7fe1f5d8-8b63-40ec-98ac-3bfd37bdbed7	14:00:00	R	0	12	1	Autumn2021	PHA306L	5254-PROF J M A Hannan	BC3015B-S
49b57bf4-8344-4723-a115-63e7b055c4bf	15:30:00	R	0	10	2	Autumn2021	PHA306L	5254-PROF J M A Hannan	BC3015B-S
c0e31c70-12d7-46a5-8601-0e44e3a7551a	08:00:00	ST	0	28	1	Autumn2021	PHA307	5263-MR Abdullah Faruque	C5005-S
191f2553-7b41-4682-b0ae-ec67bad200cb	15:30:00	MW	0	32	2	Autumn2021	PHA307	5329-DR Jakir Ahmed Chowdhury	BC10014-S
c63c42ce-63b2-4ace-a524-452022c2b979	14:00:00	A	0	16	1	Autumn2021	PHA307L	T001-00 TBA TBA	BC3015C-S
cb2445cb-f253-48cc-8f7b-61f5e4b1f188	15:30:00	ST	0	35	1	Autumn2021	PHA308	5611-DR Prawej Ansari	BC9013-S
1ac6e2d8-7890-4f91-b851-13da7a9f6c79	09:30:00	MW	0	44	2	Autumn2021	PHA308	5611-DR Prawej Ansari	BC9013-S
f630e8c7-c655-4585-9f41-d5620dbc0ea8	09:30:00	ST	0	21	1	Autumn2021	PHA309	5608-DR S. M. Abdur Rahman	C5005-S
b598091b-5139-462d-8a95-56bc3c569688	11:00:00	ST	0	50	2	Autumn2021	PHA309	5263-MR Abdullah Faruque	C6005-S
38cdd2e4-115f-4eab-8aae-a99cc0f40292	08:00:00	MW	0	8	3	Autumn2021	PHA309	5608-DR S. M. Abdur Rahman	C5004-S
55ffd4c2-ed22-459f-a3b3-f24c86b7f52b	11:00:00	MW	0	42	1	Autumn2021	PHA310	5281-PROF Amir Hussain Khan	BC8012-S
81914b13-1875-453d-8ee4-aa1e0505598e	12:30:00	ST	0	45	2	Autumn2021	PHA310	5610-DR Shimul Halder	BC10014-S
9d111661-1f4d-42c2-9724-b424d83025c8	17:00:00	ST	0	32	1	Autumn2021	PHA311	5330-DR Mohammad Rashedul Haque	C4005-S
2741ab58-c5bb-436b-b4ea-58cea91e026f	17:00:00	MW	0	12	2	Autumn2021	PHA311	5331-DR Muhammad Rashedul Islam	C5005-S
c8526a06-260e-407d-93c1-f39fcd348ab3	12:30:00	ST	0	8	1	Autumn2021	PHA312	5604-DR Iffat Ara Sonia Rahman	BC9013-S
73c2959d-5675-4398-8f95-f41bb0cdb1c2	12:30:00	MW	0	32	2	Autumn2021	PHA312	5604-DR Iffat Ara Sonia Rahman	BC9013-S
279eca32-ead4-4890-8e45-d2fc6fa55174	14:00:00	MW	0	16	3	Autumn2021	PHA312	5604-DR Iffat Ara Sonia Rahman	C6006-S
e44b2618-7abb-4acf-931d-212f1c414ee3	15:30:00	A	0	14	1	Autumn2021	PHA312L	T001-00 TBA TBA	BC3015B-S
e22668c8-7579-44be-af7a-120114dc2361	11:00:00	R	0	8	1	Autumn2021	PHA400	5254-PROF J M A Hannan	C6007-S
05ade4da-277d-4404-8d0d-5234d8cfae4f	08:00:00	MW	0	33	1	Autumn2021	PHA401	5275-PROF Mohammad Mafruhi Sattar	BC9013-S
ee637f50-8f36-43c7-80b2-b8f8414e5e8d	09:30:00	MW	0	25	2	Autumn2021	PHA401	5275-PROF Mohammad Mafruhi Sattar	C6007-S
990c5f86-b1ff-4c6b-8b10-0e8e5e199924	15:00:00	F	0	45	1	Autumn2021	PHA402	5328-MR Mr. Ahmed Kamrul Alam	BC9014-S
94c29c55-324c-49cf-818a-16602150e247	09:30:00	ST	B-0	0	1	Autumn2021	PHA403	T001-00 TBA TBA	C6007-S
589aa9ff-150c-4dd6-8c34-8d1fc5791c38	14:00:00	ST	0	33	1	Autumn2021	PHA404	5610-DR Shimul Halder	C5004-S
700c2e73-acf7-4f38-b7f0-8656e1615134	09:30:00	ST	0	42	1	Autumn2021	PHA405	5263-MR Abdullah Faruque	BC2009-S
6f36d59e-6a0d-4187-97d6-59d6d8d9fb13	11:00:00	A	0	51	1	Autumn2021	PHA406	5282-PROF A. B. M. Faroque	BC9014-S
f61e0c94-36d8-442d-8fa5-9f18f7b65241	12:30:00	R	0	5	1	Autumn2021	PHA407	T001-00 TBA TBA	C6007-S
343a0344-2b85-4c51-bc8f-ac0a4df55530	08:00:00	ST	0	39	1	Autumn2021	PHA408	5262-MR M. Shahabuddin K. Choudhuri	BC10014-S
03fbbf62-bb5f-4215-a534-37fc9ef44881	11:00:00	MW	B-0	0	1	Autumn2021	PHA409	T001-00 TBA TBA	BCTBA1-S
c39a8f81-9135-45a6-aed2-e44f773884b1	09:00:00	F	B-0	0	1	Autumn2021	PHA410	T001-00 TBA TBA	C6002-S
b6ad2431-f82d-49e3-91a2-33343f9f4366	17:00:00	MW	0	26	1	Autumn2021	PHA411	5274-DR Md. Saiful Islam	C4005-S
15e28737-ce6c-42f5-85ba-10eb4c4ad35d	15:30:00	ST	0	14	1	Autumn2021	PHA412	5604-DR Iffat Ara Sonia Rahman	C6003-S
b3fc71dc-fa9f-4862-934c-1d49d10f85e4	14:00:00	R	0	3	1	Autumn2021	PHA413	T001-00 TBA TBA	C6006-S
b7c96077-34c1-429a-b404-66f47cfb4bde	09:30:00	MW	0	41	1	Autumn2021	PHL101	2307-MR Obydullah Al Marjuk	BC9014-S
35691a76-6a5b-42d6-93de-92ed982d2e74	11:00:00	ST	0	30	2	Autumn2021	PHL101	2522-MR Asif Mahtab Utsha	C6004-S
9c0b172d-8aaf-47ed-932a-671534c3ccca	08:00:00	ST	0	56	1	Autumn2021	PHY101	4250-DR Asma Begum	BC6012-S
697a24ef-8863-4245-b6df-239a98fd0612	09:30:00	MW	0	56	2	Autumn2021	PHY101	4158-MR Dr. Farhad Alam	BC8012-S
204a510b-22c2-4e0d-a27e-e9daf388e8f0	12:30:00	MW	0	55	3	Autumn2021	PHY101	4429-DR Khan Muhammad Bin Asad	BC6009-S
b2153a9b-a747-4c84-8c80-7d69b64fb3e1	11:00:00	ST	0	45	4	Autumn2021	PHY101	4454-DR Jewel Kumar Ghosh	C4004-S
f5b2499e-4336-4793-bf77-44f76a04f0bf	14:00:00	MW	0	57	5	Autumn2021	PHY101	4378-DR Md. Readul Mahmud	BC6009-S
a218148c-af6c-477f-b163-8b51943a9c36	14:00:00	ST	0	56	6	Autumn2021	PHY101	4429-DR Khan Muhammad Bin Asad	BC6008-S
abfbc89c-dc4b-4113-bb67-c18d4ad247bb	12:30:00	S	0	27	1	Autumn2021	PHY101L	4158-MR Dr. Farhad Alam	PLab-S
0660095b-cae5-4fc2-b028-7d8303928675	12:30:00	M	0	26	2	Autumn2021	PHY101L	4250-DR Asma Begum	PLab-S
0964cb65-68d3-415f-b779-18caac04f877	12:30:00	T	0	25	3	Autumn2021	PHY101L	4158-MR Dr. Farhad Alam	PLab-S
f77a233f-8ceb-4475-a27f-03775f062343	09:30:00	S	0	26	4	Autumn2021	PHY101L	4327-MS Amrita Khan	PLab-S
bebfb866-935a-48f5-a8d5-5eb19e0a2eac	11:00:00	M	0	26	5	Autumn2021	PHY101L	4327-MS Amrita Khan	PLab-S
9101d020-7b96-40dd-b2cd-7f75f8f53023	14:00:00	T	0	25	6	Autumn2021	PHY101L	4454-DR Jewel Kumar Ghosh	PLab-S
e62741d9-bc83-4b0f-b4c7-2c1188e80069	12:30:00	W	0	27	7	Autumn2021	PHY101L	4454-DR Jewel Kumar Ghosh	PLab-S
f9a93e7a-0b25-480f-abd2-ae9f16dc5946	14:00:00	S	0	26	8	Autumn2021	PHY101L	4454-DR Jewel Kumar Ghosh	PLab-S
8018c80e-361c-4882-82f2-812b45380996	14:00:00	M	B-0	0	9	Autumn2021	PHY101L	T001-00 TBA TBA	PLab-S
b6462102-0124-4cf3-95c1-9796e9914415	15:30:00	T	B-0	0	10	Autumn2021	PHY101L	T001-00 TBA TBA	PLab-S
01a98a93-6e8f-4c32-9c49-a5683fc88c5c	14:00:00	MW	0	26	1	Autumn2021	PHY102	4112-DR Mostafa Kamal	BC6012-S
a7356e84-39ac-4b45-b593-a36d04912743	08:00:00	ST	0	35	2	Autumn2021	PHY102	4158-MR Dr. Farhad Alam	BC6013-S
7e7b833a-fdc8-4c45-be6b-aa9b63b31cd2	12:30:00	ST	0	31	3	Autumn2021	PHY102	4112-DR Mostafa Kamal	BC8011-S
208fea3a-3a65-49a5-96d0-1dcb3aeff562	11:00:00	MW	0	12	4	Autumn2021	PHY102	4378-DR Md. Readul Mahmud	BC10014-S
77afc110-7555-4e02-972e-ae155ab14574	09:30:00	ST	0	41	5	Autumn2021	PHY102	4158-MR Dr. Farhad Alam	BC6012-S
1a9c9c82-a4d2-46fd-ba9b-4b8d57465531	11:00:00	S	0	26	1	Autumn2021	PHY102L	4378-DR Md. Readul Mahmud	PLab2-S
96cc17ff-ddf0-4c5e-9c71-80ea9265998d	11:00:00	W	0	26	2	Autumn2021	PHY102L	4250-DR Asma Begum	PLab2-S
88db0ccc-3119-4c15-898b-7983e89560b9	12:30:00	W	0	25	3	Autumn2021	PHY102L	4378-DR Md. Readul Mahmud	PLab2-S
7f03fd7f-77ea-4fad-9309-f10679111dd5	09:30:00	M	0	26	4	Autumn2021	PHY102L	4327-MS Amrita Khan	PLab2-S
a3ea3e31-c031-4efe-95fd-1e4c8955e319	11:00:00	M	0	25	5	Autumn2021	PHY102L	4158-MR Dr. Farhad Alam	PLab2-S
41b5824a-7a4b-4648-ab17-27a180fbbd0d	08:00:00	S	0	21	6	Autumn2021	PHY102L	4327-MS Amrita Khan	PLab2-S
c348ced0-54d8-4699-bec2-28ff3d5680a1	12:30:00	T	B-0	0	7	Autumn2021	PHY102L	T001-00 TBA TBA	PLab2-S
873bf973-34d3-487a-af66-87724d072160	12:30:00	ST	0	9	1	Autumn2021	PHY104	4338-PROF M Arshad Momen	BC4014-S
9c540ec4-1a0a-4c43-9407-cefa1e794005	09:30:00	W	0	11	1	Autumn2021	PHY104L	4327-MS Amrita Khan	PLab-S
c697fbe2-1001-4235-8759-5991807bf09f	11:00:00	ST	0	42	1	Autumn2021	PHY111	4250-DR Asma Begum	C4005-S
56abc031-9ccd-4426-bb96-70d7e29c2852	12:30:00	MW	B-0	0	2	Autumn2021	PHY111	T001-00 TBA TBA	BC6012-S
e3bcafed-8323-4c5c-8b0b-f93e6aaa28e5	12:30:00	MW	0	33	1	Autumn2021	PHY121	4112-DR Mostafa Kamal	BC6013-S
8712144e-d76d-4788-b0e0-c1593d0a8529	12:30:00	ST	B-0	0	2	Autumn2021	PHY121	T001-00 TBA TBA	BC8012-S
37e3a09d-9d88-4abb-8fb7-6452f60c21d9	11:00:00	T	0	19	1	Autumn2021	PHY121L	4378-DR Md. Readul Mahmud	PLab2-S
ed473e9a-7950-4f67-b49d-eb444bf62fb0	09:30:00	T	0	12	2	Autumn2021	PHY121L	4327-MS Amrita Khan	PLab2-S
423e2c1b-37b4-45a7-a6f5-99fcd2e8a635	12:30:00	MW	0	5	1	Autumn2021	PHY204	4338-PROF M Arshad Momen	C4007-S
9220ad5c-9c66-4424-9da6-2e904f9627e3	17:00:00	S	0	7	1	Autumn2021	PHY207L	4250-DR Asma Begum	PLab2-S
7fafc5e5-7295-4e23-86c9-79db0aadccae	11:00:00	MW	0	5	1	Autumn2021	PHY302	4338-PROF M Arshad Momen	C2003-S
11051f1c-e622-4655-bab1-1a156e30c091	17:00:00	M	0	7	1	Autumn2021	PHY305L	4429-DR Khan Muhammad Bin Asad	PLab2-S
3b48ce07-465d-4a83-85fa-9799de562b9d	08:00:00	F	0	2	1	Autumn2021	PHY499	4158-MR Dr. Farhad Alam	A4L04-S
e215a0e8-0b28-4b91-b3e3-70ed779c8d61	11:00:00	ST	0	24	1	Autumn2021	POP201	5231-MR Saquib Ahmad Khan	BC8014-S
957fd0e4-e428-43fb-a030-b08b8616122b	12:30:00	MW	0	38	1	Autumn2021	POP305	5231-MR Saquib Ahmad Khan	BC8014-S
72ecdb44-bc27-439b-816f-b29ae8ef6e8c	09:30:00	MW	0	40	1	Autumn2021	PSY201	5519-DR Nafisa Huq	BC10018-S
5ee810c4-5496-4af8-b966-647201357344	09:30:00	ST	0	23	1	Autumn2021	SOC101	2200-MS Sharmeen Ahmed	BC4012-S
22f96328-0509-4467-92ff-05c7c6e41857	09:30:00	MW	0	28	2	Autumn2021	SOC101	2200-MS Sharmeen Ahmed	BC4014-S
daecb57f-49ad-47ec-9e8a-cc4665d7f719	14:00:00	ST	0	22	3	Autumn2021	SOC101	2198-MS Mahbuba Dewan	BC9014-S
4ca9a426-fa1c-4515-867d-5c5d176d84df	11:00:00	ST	0	14	4	Autumn2021	SOC101	2198-MS Mahbuba Dewan	BC3002-S
dc1c8f7d-427c-4e22-b7bf-1d2530f9d2da	11:00:00	MW	0	30	5	Autumn2021	SOC101	2307-MR Obydullah Al Marjuk	BC10017-S
700c01b0-8297-4776-801b-a1505e19a2f6	14:00:00	ST	0	17	6	Autumn2021	SOC101	2200-MS Sharmeen Ahmed	BC7025-S
df4aad84-6bd9-496c-b6f5-6c5d3d700ffe	09:30:00	MW	0	18	1	Autumn2021	SOC202	2198-MS Mahbuba Dewan	C3003-S
033d6de0-da87-468a-a5df-65789106501f	12:30:00	MW	0	7	1	Autumn2021	SOC209	2198-MS Mahbuba Dewan	BC7026-S
9229e72d-cc55-4cda-b5d1-3f0d10a04cd2	14:00:00	MW	0	4	1	Autumn2021	SOC210	2307-MR Obydullah Al Marjuk	C4002-S
942b4959-4097-4663-ae4b-4351181e4954	14:00:00	MW	0	11	1	Autumn2021	SOC301	2200-MS Sharmeen Ahmed	C4003-S
1803ed38-ae3e-4110-9b2e-d369ae6fae33	15:30:00	ST	0	6	1	Autumn2021	SOC316	2207-MR S. Aminul Islam	BC9016-S
32a52d3a-39b5-4d40-b9af-54326d7460f4	15:30:00	MW	0	2	1	Autumn2021	SOC401	2207-MR S. Aminul Islam	BC9016-S
369ceb06-67b8-424c-b7b1-02a7f29fbf20	15:30:00	MW	B-0	0	1	Autumn2021	SOC403	2485-MR A. K. M Nurun Nabi	BC4014-S
e64dc92d-6d04-467b-8363-4329cce2396a	17:00:00	MW	B-0	0	1	Autumn2021	SOC403L	2485-MR A. K. M Nurun Nabi	BC9015-S
0bda4f95-ce01-4b5d-9152-64ffe95570c5	17:00:00	ST	0	7	1	Autumn2021	SOC404	2165-PROF A. I. Mahbub Uddin Ahmed	BC9015-S
deca4011-daca-4a89-8546-fcc04f83ccb3	14:00:00	ST	0	4	1	Autumn2021	SOC407	2435-MS Hasna Hena Sara	BC4013-S
07e1fa2f-d4f9-4279-9533-61be406b626f	10:00:00	A	0	1	1	Autumn2021	SOC499	2200-MS Sharmeen Ahmed	A4L04-S
42254d7e-d486-4c19-b121-29ff8dfbae78	09:30:00	MW	0	7	1	Autumn2021	TCL104	2459-DR Assaduzzaman	C3002-S
1ce5e097-baa0-4ea6-861d-c0862be9873b	11:00:00	MW	0	21	2	Autumn2021	TCL104	2459-DR Assaduzzaman	C4007-S
033cbf40-d05c-44b2-9b94-1408d7b81a26	11:00:00	MW	0	36	1	Spring2021	AAT101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
204cd109-de23-45f0-bd93-07c8b2b34885	08:00:00	ST	0	48	1	Spring2021	ACN201	3269-MR Zeeshan Abedin	BC3008-S
56174f63-f9b9-4a13-83c4-5b68ce6f3fd2	09:30:00	MW	0	46	2	Spring2021	ACN201	3563-MR Mohammed Naveed Siddiquee	BC2009-S
a2e105fc-ef21-4f36-a16b-9976c334b6fe	11:00:00	ST	0	46	3	Spring2021	ACN201	3478-MR Md. Safiuddin	BC2010-S
fb9e0d02-5228-43d1-ac44-e2c84e8353f9	11:00:00	MW	0	46	4	Spring2021	ACN201	3600-MR Prahallad Chandra Das	BC2009-S
e30e6709-6cda-4229-a6da-fc0a5943fa2c	14:00:00	ST	0	46	5	Spring2021	ACN201	3493-MR Ashraful Arefin	BC2009-S
6f478d59-7f17-45cf-87be-08ea6dc6211e	15:30:00	MW	0	48	6	Spring2021	ACN201	3628-MR Syed Numan Chowdhury	BC2009-S
2b0f52f1-df79-4fd3-bca4-704e4357425f	17:00:00	ST	0	46	7	Spring2021	ACN201	3628-MR Syed Numan Chowdhury	BC2009-S
0e9323e7-6378-4e1e-89d9-9bf99b397077	08:00:00	MW	0	45	8	Spring2021	ACN201	3600-MR Prahallad Chandra Das	BC2009-S
4608202c-d3d7-4948-8ba5-05ef2a2195e0	09:30:00	ST	0	46	9	Spring2021	ACN201	3493-MR Ashraful Arefin	BC2010-S
6e5959dd-b0af-4fd6-9421-171921bfc4b2	08:00:00	MW	0	37	1	Spring2021	ACN202	3427-MS Nimat Zarin	BC3008-S
7b146f09-ff9b-4859-a8a4-32ce24e9fc54	09:30:00	ST	0	40	2	Spring2021	ACN202	3563-MR Mohammed Naveed Siddiquee	BC2011-S
5c3a6321-7ddd-4825-83d2-ecabce835091	11:00:00	MW	0	37	3	Spring2021	ACN202	3628-MR Syed Numan Chowdhury	BC3010-S
ec46b957-8aaa-4dd2-bcb6-034574468eae	08:00:00	ST	0	40	4	Spring2021	ACN202	3376-MR Naheem Mahtab	BC2009-S
ffb1d4b2-6dd9-48ff-8f77-a227da2430d2	14:00:00	MW	0	36	5	Spring2021	ACN202	3563-MR Mohammed Naveed Siddiquee	BC3011-S
a7eb6e40-29cc-4486-bae7-f0c14815ec8b	15:30:00	ST	0	41	6	Spring2021	ACN202	3478-MR Md. Safiuddin	BC2009-S
f13f2211-f7a7-44a1-b93b-5e86b05ba11b	11:00:00	ST	0	36	7	Spring2021	ACN202	3347-MR Maqbool Kader Quraishi	BC4010-S
e578447a-c6fb-43ce-8022-cc4162949d44	09:30:00	MW	0	18	1	Spring2021	ACN301	3147-DR Rushdi Rezaur Razzaque	BC2010-S
e9373599-b543-4902-9b20-4faa3a48503a	09:30:00	ST	0	39	2	Spring2021	ACN301	3347-MR Maqbool Kader Quraishi	BC2012-S
e4cfb6c9-20b7-497c-883d-4433ee3bd85c	09:30:00	ST	0	21	1	Spring2021	ACN305	3147-DR Rushdi Rezaur Razzaque	BC2013-S
307566f3-c6b1-4b3c-af56-dda8df409abb	12:30:00	MW	0	23	2	Spring2021	ACN305	3478-MR Md. Safiuddin	BC2009-S
eb96a688-a2fb-48a6-b158-b63d666248a0	09:30:00	MW	0	42	1	Spring2021	ACN402	3478-MR Md. Safiuddin	BC2011-S
5f43ebb7-23b8-4e80-a53d-b3a76d097150	12:30:00	ST	B-0	0	2	Spring2021	ACN402	T001-00 TBA TBA	BC2009-S
8b5554f8-64e5-4997-b9c5-cbf362de5bdc	12:30:00	MW	0	31	1	Spring2021	ACN403	3347-MR Maqbool Kader Quraishi	BC3010-S
49005713-9b5a-416d-af0d-78ae4220df82	08:00:00	ST	0	27	2	Spring2021	ACN403	3427-MS Nimat Zarin	BC3009-S
3f2331b4-fa13-460a-b91f-121c97a1b213	09:30:00	MW	0	12	1	Spring2021	ACN405	3600-MR Prahallad Chandra Das	BC3002-S
ba347aa5-7642-4299-9cdc-b7f9e652a100	11:00:00	ST	0	25	2	Spring2021	ACN405	3563-MR Mohammed Naveed Siddiquee	BC4011-S
b06f572c-d7cb-460c-bf41-5c80f3ae06bc	08:00:00	ST	B-0	0	1	Spring2021	ACN406	T001-00 TBA TBA	BC3012-S
1c51dd1e-8e95-45ab-87dc-c314263f3f34	17:00:00	MW	0	57	1	Spring2021	ACN441	3563-MR Mohammed Naveed Siddiquee	BC2009-S
0310d028-6097-4000-a285-3d2ce95df655	15:30:00	ST	0	42	1	Spring2021	ANT101	2326-MR Maidul Alam Chaklader	BC7015-S
76a6144e-9bc6-4ea4-8898-c898059cb776	15:30:00	MW	0	40	2	Spring2021	ANT101	2326-MR Maidul Alam Chaklader	BC7015-S
f138d915-b20f-4635-90ad-ea38276c892d	14:00:00	ST	0	40	3	Spring2021	ANT101	2194-MR Mohammad Mahfuzul Islam	BC7015-S
3bfdb180-47d6-4c2a-a8f8-eb3747d10c59	14:00:00	MW	0	41	4	Spring2021	ANT101	2194-MR Mohammad Mahfuzul Islam	BC7015-S
a954b74f-2d98-46cb-bc98-3ced4186fd55	08:00:00	ST	0	35	5	Spring2021	ANT101	2443-MS Tazin Rahman Ananya	BC7015-S
ac7eec25-a2cf-42ea-9068-fce44e541fb3	09:30:00	ST	0	40	6	Spring2021	ANT101	2443-MS Tazin Rahman Ananya	BC7025-S
ebcce01a-897b-4fa6-bafe-508cbd9f1b89	11:00:00	MW	0	40	7	Spring2021	ANT101	2443-MS Tazin Rahman Ananya	BC7016-S
c175281d-cdd4-4c24-8b40-2c0df2111f82	08:00:00	MW	0	6	8	Spring2021	ANT101	2420-MS Saba Nuzhat	BC7015-S
b9f5604a-3b45-4b2b-a2e3-ec70c5e9bd4a	09:30:00	MW	0	6	9	Spring2021	ANT101	2420-MS Saba Nuzhat	BC8012-S
a975ca56-d038-42cd-9aa2-ad61199f4035	09:30:00	MW	0	19	1	Spring2021	ANT209	2443-MS Tazin Rahman Ananya	C3002-S
628450d0-6a30-483b-aae5-a3d7ffafb4c7	15:30:00	ST	0	20	1	Spring2021	ANT211	2194-MR Mohammad Mahfuzul Islam	BC8013-S
693ca6b6-f2fa-4c36-aa3f-28e82085c98f	17:00:00	MW	0	11	1	Spring2021	ANT306	2389-DR Ranjan Saha Partha	BC4011-S
10402326-69d0-49f8-bf41-7d7be1a8ad1c	15:30:00	MW	0	13	1	Spring2021	ANT311	2194-MR Mohammad Mahfuzul Islam	BC4010-S
605dcae4-a0db-488f-a959-2aefc5a29864	11:00:00	ST	0	10	1	Spring2021	ANT401	2505-DR Kazi Mahmudur Rahman	C4007-S
c56612b0-ecc1-4174-a489-3a38ad0f86b8	14:00:00	ST	0	16	1	Spring2021	ANT403	2326-MR Maidul Alam Chaklader	BC8014-S
6af35d8e-155a-4268-96fd-c5cd76c7c2f1	14:00:00	MW	0	9	1	Spring2021	ANT410	2326-MR Maidul Alam Chaklader	BC4010-S
fc6ab005-a083-4d07-b418-36647902b104	08:00:00	ST	0	0	1	Spring2021	ANT499	2194-MR Mohammad Mahfuzul Islam 2326-Maidul AlamChaklader	BCTBA3-S
d658cc67-6dc5-4940-b549-e3ecd1daefcc	08:00:00	F	0	226	1	Spring2021	BBA499A	3329-MR Abul Khair Jyote	BC001-S
e84f4908-bfc4-4f21-be3b-611baeba76fb	08:00:00	A	0	0	1	Spring2021	BBA499B	T001-00 TBA TBA	BC001-S
0de13d5d-5767-41b2-b678-070ff676f5f5	15:30:00	ST	0	10	1	Spring2021	BCB103	6072-MR A.B.M. Rezwanul Kabir	BC9015-S
ca3a549e-69d1-42cd-a610-b29d5c1a6a08	12:30:00	ST	B-0	0	2	Spring2021	BCB103	T001-00 TBA TBA	BC9016-S
6d4d676b-9ad8-4855-aa67-609875536eb8	14:00:00	M	0	10	1	Spring2021	BCB103L	6072-MR A.B.M. Rezwanul Kabir	BC4017A-S
2bfb5a24-14b9-49a6-b795-30f19c885260	12:30:00	R	B-0	0	2	Spring2021	BCB103L	T001-00 TBA TBA	BC4017A-S
00428e31-080b-48b0-b200-93bfe22f76dd	09:30:00	ST	0	21	1	Spring2021	BCB104	6072-MR A.B.M. Rezwanul Kabir	BC10014-S
b14f9aea-09c1-48c1-9d20-e1013c82daf7	14:00:00	W	0	21	1	Spring2021	BCB104L	6072-MR A.B.M. Rezwanul Kabir	BC4017B-S
cc5017ae-e066-45b3-b02b-634d7fbb9fec	12:30:00	ST	0	22	1	Spring2021	BCB201	6073-MR Aftab Uz Zaman Noor	BC10018-S
ae41b1ff-2df6-4749-9c18-cc473726d171	11:00:00	R	0	27	1	Spring2021	BCB201L	6073-MR Aftab Uz Zaman Noor	BC4017B-S
d369b2a3-fb5f-4c8a-bd81-f16c49ae515a	11:00:00	MW	B-0	0	1	Spring2021	BCB202	T001-00 TBA TBA	FT-S
365df8ee-aec4-4ad8-b2b8-e35b58565825	14:00:00	T	B-0	0	1	Spring2021	BCB202L	T001-00 TBA TBA	FT-S
f637524b-4013-4668-ac4d-cda0a93840f8	12:30:00	MW	0	25	1	Spring2021	BCB204	6070-MR Salman Khan Promon	BC9016-S
8effe273-d877-4e7a-8afe-4fc38d085bb0	09:30:00	MW	0	13	1	Spring2021	BCB206	6073-MR Aftab Uz Zaman Noor	C2006-S
f736924b-d5c1-4da0-bcb4-5fda0f940be5	15:30:00	ST	0	9	1	Spring2021	BCB207	6054-DR Sabrina Moriom Elias	BC4017A-S
1133c05c-df8d-4c74-a865-d4a315bac3b2	11:00:00	ST	B-0	0	2	Spring2021	BCB207	T001-00 TBA TBA	BC4017C-S
0ba7e959-e421-4dd8-bb96-205f362dac22	11:00:00	MW	0	16	1	Spring2021	BCB301	6073-MR Aftab Uz Zaman Noor	C2002-S
dd7ce5ff-1994-4a75-83e1-216a99d6e2cd	08:00:00	ST	0	22	1	Spring2021	BCB303	6054-DR Sabrina Moriom Elias	C2002-S
bcc08ef2-5dae-4625-ae1f-e2f712f13772	08:00:00	MW	B-0	0	1	Spring2021	BCB304	T001-00 TBA TBA	A4L04-S
9f340038-bf8b-43b0-8428-8b6dcccf6448	14:00:00	MW	0	16	1	Spring2021	BCB307	6070-MR Salman Khan Promon	BC9015-S
9def308d-0d7f-498b-9833-6af911c53b4d	09:30:00	ST	B-0	0	1	Spring2021	BCB309	T001-00 TBA TBA	A4L04-S
58cd5bf5-913d-443e-b20d-bb6a43527b18	15:30:00	MW	0	16	1	Spring2021	BCB401	6064-MR Md. Daud Hossain Khan	BC9016-S
b3e5ea5f-3fa1-4a00-b457-3035587ecf90	17:00:00	ST	0	11	1	Spring2021	BCB409	6053-MS Saadia Shareen	BC9015-S
fae1f181-6212-4d89-99a2-f196ca059368	14:00:00	ST	0	10	1	Spring2021	BCB410	6073-MR Aftab Uz Zaman Noor	BC10017-S
322f6e5e-a348-4fe5-a6cb-50552c5891d7	11:00:00	MW	B-0	0	1	Spring2021	BCB412	T001-00 TBA TBA	BC001-S
a1ee345a-439e-433c-b2d5-cec0f49e50e6	12:30:00	ST	0	12	1	Spring2021	BCB413	6064-MR Md. Daud Hossain Khan	BC9015-S
8a63f62f-c127-4a96-9ef2-153480969e3c	17:00:00	MW	0	17	1	Spring2021	BCB415	6064-MR Md. Daud Hossain Khan	BC10014-S
b4837511-e67b-452f-bced-35847222170b	15:30:00	MW	0	30	1	Spring2021	BDS109	2281-MR Mahmud Hasan Kayesh	BC7002-S
973642a4-f68d-4efa-8971-596f939b6a61	17:00:00	ST	0	30	2	Spring2021	BDS109	2281-MR Mahmud Hasan Kayesh	BC7002-S
8c3cec63-d7da-4df0-9aeb-303f032e7088	11:00:00	ST	0	34	3	Spring2021	BDS109	2442-MS Mushfeqa Islam	BC5002-S
ca39cf30-06df-4162-9083-17ae43b77cf5	14:00:00	MW	0	35	4	Spring2021	BDS109	2481-DR Zahed-Ur- Rahman	BC7002-S
fb6ff668-db45-4977-9781-56c75f345cb3	17:00:00	MW	0	35	5	Spring2021	BDS109	2497-MR Hamza Kamal Mostafa	BC7002-S
4a636840-8234-4165-9b94-8fa073b85afc	14:00:00	ST	0	35	6	Spring2021	BDS109	2497-MR Hamza Kamal Mostafa	BC3002-S
ace5cfd1-b12e-4037-81d4-9f2025d8998a	12:30:00	MW	0	35	7	Spring2021	BDS109	2481-DR Zahed-Ur- Rahman	BC7002-S
86f8a68d-8b23-45e2-83ba-31c7e9ff531c	11:00:00	ST	0	36	1	Spring2021	BIO100	6053-MS Saadia Shareen	BC9015-S
7b4b6482-b41b-4a07-a729-8328b8f54e07	12:30:00	ST	0	28	2	Spring2021	BIO100	6053-MS Saadia Shareen	BC10015-S
0e7daf4f-1835-493a-a3a6-1a5bc3c1ec4f	11:00:00	MW	0	30	3	Spring2021	BIO100	6036-MS Nazratun Nayeem Choudhury	BC9015-S
750dcda7-f41e-4101-a41c-f9fd00c7ea43	12:30:00	MW	0	30	4	Spring2021	BIO100	6036-MS Nazratun Nayeem Choudhury	BC10017-S
d8e6fb10-39c7-4491-b211-dd610c5ab195	14:00:00	ST	0	25	5	Spring2021	BIO100	6036-MS Nazratun Nayeem Choudhury	BC10014-S
aeb8abe7-decb-46fd-b3e0-6b587388907e	15:30:00	ST	B-0	0	6	Spring2021	BIO100	6036-MS Nazratun Nayeem Choudhury	BC10014-S
6631b96a-21be-45c2-b3be-5712ab5d2cf5	14:00:00	MW	B-0	0	7	Spring2021	BIO100	T001-00 TBA TBA	BC10014-S
71ac9dc3-2cb4-423d-9160-5313b2a301bd	15:30:00	MW	B-0	0	8	Spring2021	BIO100	T001-00 TBA TBA	BC10014-S
ae986c1f-57f5-42d6-9b18-d8c402c07256	17:00:00	MW	B-0	0	9	Spring2021	BIO100	T001-00 TBA TBA	A4L04-S
b78e7eeb-7b08-4717-b051-b2a87c42ec64	08:00:00	ST	B-0	0	10	Spring2021	BIO100	T001-00 TBA TBA	A4L04-S
f0cfd1d0-f6e6-44bb-8cb7-e6b9d0dfd171	11:00:00	MW	0	17	1	Spring2021	BIO102	6053-MS Saadia Shareen	BC9016-S
73ac00d5-bd0d-48d3-9a3d-0e8c68a53a44	12:30:00	W	0	17	1	Spring2021	BIO102L	6053-MS Saadia Shareen	BC4017A-S
7100b615-58e0-40a7-aa61-b6835640bdd8	11:00:00	ST	0	20	1	Spring2021	BIO105	6072-MR A.B.M. Rezwanul Kabir	C3002-S
5cd638ef-b34d-4f2e-9c7a-3ffac5535ed5	14:00:00	R	0	20	1	Spring2021	BIO105L	6072-MR A.B.M. Rezwanul Kabir	BC4017A-S
3580319b-243a-4a9e-b277-b98089c7aa6c	15:30:00	ST	0	50	1	Spring2021	BLA101	2446-DR Muhammad Shajjad Ahsan	BC7002-S
b5bae0e0-a249-422e-9b4d-964324569270	17:00:00	ST	0	16	2	Spring2021	BLA101	2446-DR Muhammad Shajjad Ahsan	BC5002-S
cfeadd77-19c8-4cce-906e-410fc51e6ee1	11:00:00	ST	0	25	1	Spring2021	BNG201	2388-DR Lutfor Rahman	C2006-S
25c27180-a049-4515-be3b-439a538f8bff	12:30:00	ST	0	29	2	Spring2021	BNG201	2388-DR Lutfor Rahman	BC4012-S
88862e04-5c8a-4431-af8a-70ab6d06b42e	11:00:00	MW	0	30	3	Spring2021	BNG201	2427-MR Shaikh Mahfuzur Rahman	BC8014-S
59bde955-855e-45d1-bc39-00c8398463c1	15:30:00	MW	0	30	4	Spring2021	BNG201	2427-MR Shaikh Mahfuzur Rahman	BC10015-S
f3ee0314-43ec-49dc-b7a6-b29d1d4c46e6	14:00:00	MW	0	49	1	Spring2021	BPH101	2398-MR Sayed Abu Touab Shakir	BC5002-S
aea09237-818e-4090-931e-9815d1d49170	15:30:00	MW	0	50	2	Spring2021	BPH101	2398-MR Sayed Abu Touab Shakir	BC5002-S
7709d18b-6128-475f-8571-4a477a30e561	17:00:00	MW	0	45	3	Spring2021	BPH101	2398-MR Sayed Abu Touab Shakir	BC5002-S
2c5a4f4c-4c3b-4932-a473-015ea58b466c	14:00:00	ST	0	30	4	Spring2021	BPH101	2498-PROF Taiabur Rahman	BC10018-S
c0b179b8-d811-4506-8e11-a50f9552fb60	08:00:00	ST	0	49	1	Spring2021	BUS201	3251-MS Farzana Chowdhury	BC2010-S
516708ba-37fe-496a-9b86-7b782da63eef	11:00:00	ST	0	48	2	Spring2021	BUS201	3251-MS Farzana Chowdhury	BC2011-S
5c8e8589-b214-470c-9166-1ab87dbc17d5	14:00:00	ST	0	48	3	Spring2021	BUS201	3423-MR Arifur Rahman Khan	BC2010-S
198c5a1b-25f7-4a24-8a81-e9b7ceacf51b	14:00:00	MW	0	50	4	Spring2021	BUS201	3539-MR SM Yusuf Mallick	BC2009-S
b796cb0c-8373-4c70-8808-257989d3a79f	15:30:00	MW	0	48	5	Spring2021	BUS201	3442-MR Anwar Zahid	BC2010-S
aae49fa7-612c-49b2-b110-54e558d21672	08:00:00	MW	0	46	6	Spring2021	BUS201	3569-MR Abdullah Al Ahad	BC2010-S
54735c89-8d34-4c94-a612-b1bc89776984	17:00:00	ST	0	48	7	Spring2021	BUS201	3570-MS Maria Muntahin	BC2010-S
dc5141e7-870d-4059-9923-9f8fd3dbe473	12:30:00	MW	0	48	8	Spring2021	BUS201	3525-MS Afnan Ashfaque	BC2010-S
3a50385e-4651-48c1-ae3d-46287babd574	15:30:00	ST	0	48	9	Spring2021	BUS201	3630-MR Ariful Islam	BC2010-S
51f1eb19-2aa7-4b50-87d6-05f2c8ef6ea8	08:00:00	ST	0	37	1	Spring2021	BUS202	3545-DR Mohammad Osman Gani	BC2011-S
bb731782-6d0c-4e75-bfa9-d088748cb266	12:30:00	ST	0	38	2	Spring2021	BUS202	3135-DR Abul Bashar	BC2010-S
928be6ba-1ab9-4839-910a-96a6b5b519fc	08:00:00	MW	0	38	3	Spring2021	BUS202	3534-DR Md. Abdus Salam Akanda	BC2011-S
44174035-d09e-4758-b44e-06e2342129b4	17:00:00	ST	0	38	4	Spring2021	BUS202	3579-MS Seeratus Sabah	BC2011-S
a0d85c82-a358-415e-a67e-80a3e41152d0	09:30:00	MW	0	38	5	Spring2021	BUS202	3534-DR Md. Abdus Salam Akanda	BC2012-S
20f94eb2-d9dc-4bd6-9bd6-62e2da944316	09:30:00	ST	0	38	6	Spring2021	BUS202	3545-DR Mohammad Osman Gani	BC2014-S
9c894fa6-2249-428f-b7f9-e2995cf0a6b3	14:00:00	ST	0	38	7	Spring2021	BUS202	3579-MS Seeratus Sabah	BC2011-S
9663e6f4-2b14-45df-afd2-cb303c3f7231	15:30:00	MW	0	38	8	Spring2021	BUS202	3606-DR Md. Kharshiduzzaman	BC2011-S
4e8b7643-2fa2-4153-906b-59d5ea4e9aec	09:30:00	ST	0	48	1	Spring2021	BUS360	3159-BAR Sarah Hassan	BC2020-S
df8baaa6-1f42-4da5-a7f8-addfc99f5ff7	15:30:00	MW	0	48	2	Spring2021	BUS360	3323-MS Qantara Khaleda Khan	BC2012-S
be147c22-36dc-46a6-b5c4-c8a0accb152e	09:30:00	MW	0	49	3	Spring2021	BUS360	3579-MS Seeratus Sabah	BC2013-S
f7079b87-54fe-42be-bbaa-7ccda4096ad3	11:00:00	MW	0	48	4	Spring2021	BUS360	3579-MS Seeratus Sabah	BC2010-S
06ddab6f-8db7-4861-b89f-db07830375ac	12:30:00	ST	0	48	5	Spring2021	BUS360	3358-MR Mr. Iftekhar Mahfuz	BC2011-S
b4127e45-c2b1-4180-b15b-a24c6911ad6d	15:30:00	ST	0	48	6	Spring2021	BUS360	3358-MR Mr. Iftekhar Mahfuz	BC2011-S
88a4bd81-6ee9-40de-8f06-28296b23692a	08:00:00	ST	0	44	7	Spring2021	BUS360	3159-BAR Sarah Hassan	BC2012-S
8787c8b5-bc1f-4514-a3b7-cf4379c498fc	14:00:00	ST	0	51	1	Spring2021	BUS485	3615-DR Md. Mamun Habib	BC2012-S
907a8443-6739-43ef-b85e-265ebb7b3654	15:30:00	ST	0	51	2	Spring2021	BUS485	3615-DR Md. Mamun Habib	BC2012-S
baa151bb-1014-4b5e-9ea5-f0f88baab796	14:00:00	MW	0	49	3	Spring2021	BUS485	3185-MR Mohammed Sohel Islam	BC2010-S
bed8d194-cfee-4404-ba08-cbcdccb4c685	11:00:00	ST	0	44	4	Spring2021	BUS485	3444-DR Ikramul Hasan	BC2012-S
00743e00-49e9-4839-92f6-2b00e5570b49	09:30:00	MW	0	40	5	Spring2021	BUS485	3344-MR Mohammad Fahad Noor	BC2014-S
6b4397d5-dc17-41c1-9cb2-2991618fc578	12:30:00	MW	0	39	6	Spring2021	BUS485	3372-DR Samiul Parvez Ahmed	BC2011-S
5fb6f56d-184b-466d-bc0d-ad6f2f8d2c39	11:00:00	MW	0	10	1	Spring2021	CCS106	2506-MR Quazi Mahfujul Hoque Supan	C6007-S
ff817235-f194-4eb4-b856-a3cebff82599	09:30:00	MW	0	20	1	Spring2021	CFS105	2506-MR Quazi Mahfujul Hoque Supan	C4006-S
14974263-7e01-499c-89e9-98fd2386f014	14:00:00	MW	0	28	1	Spring2021	CHE101	5252-DR Sadia Nazneen Karobi	BC10017-S
021c226c-9a7c-4395-bba7-13440cf7b22f	14:00:00	R	B-0	0	1	Spring2021	CHE101L	5231-MR Saquib Ahmad Khan	ESLAB-S
a3435a5e-b45f-4520-87d6-a86bc91cd859	12:30:00	R	B-0	0	2	Spring2021	CHE101L	5231-MR Saquib Ahmad Khan	ESLAB-S
1360654e-fb63-4791-b366-0e6dc16c1158	08:00:00	ST	0	25	1	Spring2021	CHI101	2453-MR MMA Rahman Nahid	BC8014-S
5c005d61-11e6-4045-a35f-fba9206e08a7	08:00:00	ST	0	33	1	Spring2021	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
c6ed973d-9b38-407e-878d-13b429b0911b	11:00:00	ST	0	34	2	Spring2021	CIS101	4453-MS Moumita Asad	BC4043-S
7a24c4ef-50a1-4797-9091-7709c71d408b	12:30:00	ST	0	34	3	Spring2021	CIS101	4409-MS Ajmiri Sabrina Khan	BC4043-S
7c7619f2-7a2b-4ae1-9143-ba4b65c60904	15:30:00	ST	0	33	4	Spring2021	CIS101	4376-MR Sanzar Adnan Alam	BC4043-S
03367195-6f62-44f4-b125-1b2d5c01c8b4	08:00:00	MW	0	31	5	Spring2021	CIS101	4453-MS Moumita Asad	BC4043-S
d00f9e1d-998c-4d5e-a8e4-8678b8affbf3	11:00:00	MW	0	33	6	Spring2021	CIS101	4376-MR Sanzar Adnan Alam	BC4043-S
7c0a7f1a-c820-4b33-82e5-131fffa239f1	12:30:00	MW	0	33	7	Spring2021	CIS101	4348-MR Md. Abu Sayed	BC4043-S
021b2bf6-759f-4ddf-a9f4-0e512a8f4386	15:30:00	MW	0	33	8	Spring2021	CIS101	4348-MR Md. Abu Sayed	BC4043-S
5149c574-e539-45cd-bec7-95c70d39e753	08:00:00	ST	0	32	9	Spring2021	CIS101	4297-MR M. Ishtiaque Rahman	CSCLab2-S
e508c919-ff97-4bb1-b342-6465532b4570	11:00:00	ST	B-0	0	10	Spring2021	CIS101	T001-00 TBA TBA	CSCLab2-S
93f54a3d-fe67-49d8-95e0-99a02a6c24f9	08:00:00	MW	B-0	0	11	Spring2021	CIS101	T001-00 TBA TBA	CSCLab2-S
6aee716f-8d18-4e06-a24b-f8dc5dd118cc	09:30:00	S	0	33	1	Spring2021	CIS101L	4330-MR AKM Monzurul Islam	BC4043-S
283580b6-20fe-456f-90dd-f9618eb90911	09:30:00	T	0	34	2	Spring2021	CIS101L	4453-MS Moumita Asad	BC4043-S
047fd161-4e5c-4fa5-b4fd-63c85da8fa5d	14:00:00	S	0	34	3	Spring2021	CIS101L	4409-MS Ajmiri Sabrina Khan	BC4043-S
10d7de40-f2ef-45fd-acb3-881a83d35d9b	14:00:00	T	0	33	4	Spring2021	CIS101L	4376-MR Sanzar Adnan Alam	BC4043-S
e42e6d7b-7207-4662-9251-cb0705ecad7b	09:30:00	M	0	31	5	Spring2021	CIS101L	4453-MS Moumita Asad	BC4043-S
52bea9cb-bc42-4d19-9ee8-4fd8e2af2cfa	09:30:00	W	0	33	6	Spring2021	CIS101L	4376-MR Sanzar Adnan Alam	BC4043-S
4d425f3e-1a52-4e0e-8990-36ad96e5a4fa	14:00:00	M	0	33	7	Spring2021	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
8f174ef3-7d43-4ac1-a9f5-1fb473ef8b43	14:00:00	W	0	33	8	Spring2021	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
6ee1d148-44f1-4a6b-83fe-068f23731c88	09:30:00	S	0	32	9	Spring2021	CIS101L	4297-MR M. Ishtiaque Rahman	CSCLab2-S
62ab00cd-81a7-4711-9eae-fd3436f9cf10	09:30:00	T	B-0	0	10	Spring2021	CIS101L	T001-00 TBA TBA	CSCLab2-S
02906b0d-600f-436d-8482-a6a917293bea	09:30:00	M	B-0	0	11	Spring2021	CIS101L	T001-00 TBA TBA	CSCLab2-S
ad9b35ba-fa6a-4094-aaf8-5087353c4ca8	11:00:00	MW	0	35	1	Spring2021	CMN201	2164-MR Mohammad Masud Chowdhury	BC8015-S
6a0448be-87e9-4817-9047-8e4ab2302f13	08:00:00	ST	0	33	2	Spring2021	CMN201	2164-MR Mohammad Masud Chowdhury	BC3010-S
a1f516d4-8f86-441f-b649-7de8499e37c3	09:30:00	ST	0	35	3	Spring2021	CMN201	2258-MS Tasneem Shahrukh	BC9017-S
d390c195-553a-4938-b66f-20c904ee3770	09:30:00	MW	0	35	4	Spring2021	CMN201	2258-MS Tasneem Shahrukh	C3005-S
140a09eb-d046-45d1-9dff-5a88dd83d856	08:00:00	MW	0	32	5	Spring2021	CMN201	2171-MS Fariya Hossain Khan	BC8011-S
176b26da-2095-4157-91be-7f6e4621ecd1	15:30:00	ST	0	35	6	Spring2021	CMN201	2171-MS Fariya Hossain Khan	BC8015-S
4e0da9af-61fe-4761-885b-fe03b74ae576	11:00:00	ST	0	27	7	Spring2021	CMN201	2270-MS Raisa Rasheeka	BC4013-S
47825e04-0a5c-46e2-b777-60226a675ead	17:00:00	MW	0	9	8	Spring2021	CMN201	2281-MR Mahmud Hasan Kayesh	BC8011-S
1de23190-3543-4415-b547-2535bf3206ee	14:00:00	ST	0	35	9	Spring2021	CMN201	2382-MS Raiyana Rahman	BC7025-S
1814769a-45ff-4be3-9e69-6e650a30a1fd	14:00:00	MW	0	35	10	Spring2021	CMN201	2382-MS Raiyana Rahman	BC7026-S
bf79eca5-0a03-460a-aa3a-f064e02810d8	15:30:00	MW	0	34	11	Spring2021	CMN201	2442-MS Mushfeqa Islam	BC8015-S
cf13fbd7-56e7-40d1-8209-db8bb20dae7b	17:00:00	ST	0	6	12	Spring2021	CMN201	2497-MR Hamza Kamal Mostafa	BC7016-S
57c5291f-1985-4969-957e-fc30dfd48a4d	12:30:00	ST	0	17	1	Spring2021	CMN202	2171-MS Fariya Hossain Khan	BC8014-S
93f93c20-3f72-4aeb-892e-348fcb859c81	11:00:00	ST	0	15	2	Spring2021	CMN202	2382-MS Raiyana Rahman	C5002-S
362d0d73-4b3a-4671-8ffa-195840c61a8e	12:30:00	MW	0	30	1	Spring2021	CMN203	2258-MS Tasneem Shahrukh	BC8013-S
7b9dae0c-dc30-4a80-86dd-01f6e18c70c6	14:00:00	MW	B-0	0	2	Spring2021	CMN203	2270-MS Raisa Rasheeka	BC9017-S
6e69cd9f-50e5-434f-bb41-9527cecc454c	09:30:00	MW	0	14	1	Spring2021	CMN205	2164-MR Mohammad Masud Chowdhury	C3003-S
7fd84654-afaf-499b-adee-fbc68716e412	11:00:00	MW	0	15	1	Spring2021	CMN207	2382-MS Raiyana Rahman	C2007-S
1db0e2e4-7811-4512-840f-6c2c9d0e57d9	15:30:00	ST	0	12	2	Spring2021	CMN207	2442-MS Mushfeqa Islam	BC4010-S
d0920381-eaba-4052-9e12-c80b09b2da75	15:30:00	MW	0	22	1	Spring2021	CMN302	2299-MS Naila Azad Nupur	BC8014-S
d36376be-d38a-476e-b7b8-4834d12011f1	14:00:00	ST	0	30	1	Spring2021	CMN304	2308-MR Syed Ali Haider Rizvi	BC9014-S
76537817-b41c-4442-9559-dad2b4f2732d	12:30:00	ST	0	24	1	Spring2021	CMN305	2270-MS Raisa Rasheeka	BC4010-S
aeb68a9f-e897-44fc-95fb-0f9cf1a50b2e	11:00:00	ST	0	21	1	Spring2021	CMN308	2350-MR Syeed Zayadul Ahsan	BC9016-S
40f1584f-e0b3-4b1e-9370-c43d538ff187	15:30:00	MW	0	12	1	Spring2021	CMN309	2508-MR Hasan Razzak	BC4013-S
bdd0e102-8689-4b7a-aaa0-125d396f701b	12:30:00	MW	0	10	1	Spring2021	CMN316	2270-MS Raisa Rasheeka	BC4013-S
b66d62a0-f20f-4940-99bc-f07dfffc78a1	09:30:00	MW	0	9	1	Spring2021	CMN317	2368-MR Al Kamal Md. Ziaul Haq	BC6023-S
4c9b33ec-54f8-470b-bed0-1f0942d446e7	12:30:00	ST	0	10	1	Spring2021	CMN320	2213-MS Jessica Tartila Suma	BC4013-S
17b3e697-da80-449d-9624-3fec9d9e5dca	11:00:00	MW	0	22	1	Spring2021	CMN321	2171-MS Fariya Hossain Khan	C3002-S
e8a4db21-b88d-4fe8-a84b-a03661d8aafc	14:00:00	ST	0	20	1	Spring2021	CMN322	2258-MS Tasneem Shahrukh	BC4011-S
e0bff662-f76f-4636-80b0-30ed21ad4f54	09:30:00	MW	0	16	1	Spring2021	CMN326	2270-MS Raisa Rasheeka	C3006-S
c18abafa-e54a-47b2-9ca2-3ea7a9a64f81	11:00:00	ST	0	2	1	Spring2021	CMN327	2164-MR Mohammad Masud Chowdhury	C5003-S
52e89a83-0804-4599-be2e-8b4641653d99	15:30:00	ST	0	6	1	Spring2021	CMN404	2281-MR Mahmud Hasan Kayesh	BC4012-S
409e0b7e-2756-414e-8f39-873186456d61	17:00:00	MW	0	23	1	Spring2021	CMN406	2456-DR Shah Nister Kabir	BC8013-S
cbecc723-51f9-460a-9fc0-1e8e47b2b169	12:30:00	MW	0	27	1	Spring2021	CMN408	2178-DR G. M. Shahidul Alam	BC8014-S
cd9503cf-5ebd-4ca6-8409-5070ade6451a	14:00:00	MW	0	20	1	Spring2021	CMN415	2178-DR G. M. Shahidul Alam	BC8013-S
ae252b6f-273f-493b-9003-fd1653f70c08	14:00:00	ST	0	8	1	Spring2021	CMN417	2281-MR Mahmud Hasan Kayesh	BC4012-S
3e494928-f9a9-45f2-b6cc-9ea9a17c2744	11:00:00	MW	0	13	1	Spring2021	CMN419	2442-MS Mushfeqa Islam	C3003-S
4b6d7b4b-5bd9-4816-8e08-ffa3ace0b59f	09:30:00	ST	0	18	1	Spring2021	CMN423	2318-MR Khaled Md Shariful Islam	C4002-S
46903c6b-aa99-44f7-9471-4ab0f137c486	15:30:00	ST	0	23	1	Spring2021	CMN425	2382-MS Raiyana Rahman	BC4011-S
6d736a63-9c10-40e2-85dc-350c46369838	17:00:00	ST	0	4	1	Spring2021	CMN429	2335-MS Parsa S. Sajid	BC8014-S
91dd6103-a881-433d-b6a3-3cbbd3667cee	09:30:00	R	0	16	1	Spring2021	CMN498	2258-MS Tasneem Shahrukh	BCTBA4-S
55bc0ebb-7c42-42a6-8abd-c19183135c76	12:30:00	R	0	4	1	Spring2021	CMN499	2270-MS Raisa Rasheeka	BCTBA4-S
9181ebed-fff0-4be3-b869-2efb1461b933	08:00:00	ST	0	29	1	Spring2021	CSC101	4397-MR Mohammad Motiur Rahman	CSCLab4-S
6799b863-8045-4835-b19a-55a586cfb7f9	11:00:00	ST	B-0	0	2	Spring2021	CSC101	4373-MS Romasa Qasim	CSCLab4-S
c58e7f1d-24b8-42ca-b9b5-034332ffcbd7	12:30:00	ST	0	30	3	Spring2021	CSC101	4373-MS Romasa Qasim	CSCLab4-S
454bf601-17f9-44ad-852f-13c4b63fd8da	15:30:00	ST	0	42	4	Spring2021	CSC101	4416-MR Md. Fahad Monir	GPLab-S
217501e4-ae03-4a43-a9ce-871030b9931f	09:30:00	MW	0	34	5	Spring2021	CSC101	4446-DR Yusuf Mahbubul Islam	CSCLab1-S
bbe1da83-233e-485e-b3cb-4ecd8fafefd8	11:00:00	MW	0	26	6	Spring2021	CSC101	4373-MS Romasa Qasim	CSCLab4-S
98594d9a-32c6-46a1-8081-1ca1ca2e5734	12:30:00	MW	0	34	7	Spring2021	CSC101	4408-MR Asif Bin Khaled	GPLab-S
4fbaeb96-f396-4947-a2e0-3ca98abdb571	15:30:00	MW	0	34	8	Spring2021	CSC101	4449-MR Sheikh Abujar	CSCLab3-S
c5b3aedf-4a89-4c7a-990b-26f4cf0bb65c	11:00:00	ST	0	36	9	Spring2021	CSC101	4241-DR Md. Ashraful Amin	GPLab-S
4e4a6a98-c630-41f6-b411-7421a88797c5	08:00:00	MW	0	40	10	Spring2021	CSC101	4416-MR Md. Fahad Monir	GPLab-S
518dbf02-0d38-4d88-af32-71edaa87fd33	09:30:00	S	0	29	1	Spring2021	CSC101L	4397-MR Mohammad Motiur Rahman	CSCLab4-S
201c4d41-f001-487e-b92a-c48d67d86a02	09:30:00	T	B-0	0	2	Spring2021	CSC101L	4373-MS Romasa Qasim	CSCLab4-S
ff52e8a3-0544-4f85-9e26-00b32e38033b	14:00:00	S	0	30	3	Spring2021	CSC101L	4373-MS Romasa Qasim	CSCLab4-S
b22b9b2f-0421-41b9-bde3-97cfedb96db6	14:00:00	T	0	42	4	Spring2021	CSC101L	4416-MR Md. Fahad Monir	GPLab-S
83d0e38f-43db-44ef-a6d4-57086df5bb09	11:00:00	M	0	34	5	Spring2021	CSC101L	4446-DR Yusuf Mahbubul Islam	CSCLab1-S
bbb56af2-f26e-4b09-bbb2-c2402b0abed4	09:30:00	W	0	26	6	Spring2021	CSC101L	4373-MS Romasa Qasim	CSCLab4-S
9fb00425-2e7f-4d23-ba03-3363e8cbbd86	14:00:00	M	0	34	7	Spring2021	CSC101L	4408-MR Asif Bin Khaled	GPLab-S
efae76ff-72ff-47d8-9dc2-29b65200a811	14:00:00	W	0	34	8	Spring2021	CSC101L	4449-MR Sheikh Abujar	CSCLab3-S
1e8c508a-9986-44bf-b77c-ee5cca87022b	09:30:00	T	0	36	9	Spring2021	CSC101L	4241-DR Md. Ashraful Amin	GPLab-S
0cb487eb-3f3d-4c9f-8801-80fa9f975e0a	09:30:00	M	0	40	10	Spring2021	CSC101L	4416-MR Md. Fahad Monir	GPLab-S
534bac21-3b68-43f9-8abd-c5840ac91e46	08:00:00	ST	0	31	1	Spring2021	CSC121	4416-MR Md. Fahad Monir	GPLab-S
242abe41-66d2-4409-b858-31bfb8c11047	09:30:00	S	0	31	1	Spring2021	CSC121L	4416-MR Md. Fahad Monir	GPLab-S
f181d4ac-64e3-42d0-8baf-5319eea524fd	18:30:00	T	0	46	1	Spring2021	CSC301	4447-PROF A. R. Azimul Hoque	BC6009-S
c7f7dd66-e02c-4660-8e40-3088ae0ed5a4	09:30:00	ST	0	35	2	Spring2021	CSC301	4362-MR Bijoy Rahman Arif	BC4012-S
c85887e4-579d-4352-83cd-8533e1b610b4	18:30:00	W	0	44	3	Spring2021	CSC301	4241-DR Md. Ashraful Amin	BC5012-S
bd3f6d35-394e-4dd5-b215-405d03ee8619	11:00:00	ST	0	42	1	Spring2021	CSE104	4409-MS Ajmiri Sabrina Khan	C3004-S
a322cc6e-fc38-41d2-8199-ca61847e752e	14:00:00	ST	0	41	2	Spring2021	CSE104	4285-DR Ferdows Zahid	BC6009-S
fffac781-fe23-4e3d-b3a6-3b7d3356e0ec	11:00:00	MW	0	35	3	Spring2021	CSE104	4409-MS Ajmiri Sabrina Khan	BC4012-S
4f2c38dc-09da-44aa-9607-4f909ef6dadc	09:30:00	T	0	43	1	Spring2021	CSE104L	4409-MS Ajmiri Sabrina Khan	CENLAB-S
2a624bac-1168-4087-bdd5-09b587531d39	15:30:00	S	0	42	2	Spring2021	CSE104L	4285-DR Ferdows Zahid	CENLAB-S
c65c8440-4ebd-4554-8b4c-3f2b0b6a46eb	09:30:00	M	0	35	3	Spring2021	CSE104L	4409-MS Ajmiri Sabrina Khan	CENLAB-S
bda9abb8-9782-4785-9dd3-7a8e7c20d666	09:30:00	ST	0	51	1	Spring2021	CSE201	4228-DR Habib Bin Muzaffar	BC6012-S
e55f3b3f-d628-437b-9fe2-3ed2f8324b82	08:00:00	ST	0	46	2	Spring2021	CSE201	4434-MS Sadita Ahmed	BC6009-S
938ae17b-8d29-49ce-a64a-043816e66b71	08:00:00	MW	0	51	3	Spring2021	CSE201	4434-MS Sadita Ahmed	BC6008-S
198e49fe-128c-494d-a478-a6851e39d529	11:00:00	MW	0	34	4	Spring2021	CSE201	4375-MR Mustafa Nizamul Aziz	BC4013-S
33736239-305a-4ae5-9e7c-15c7b4bc5ec7	09:30:00	ST	0	36	1	Spring2021	CSE203	4449-MR Sheikh Abujar	CSCLab1-S
b830f675-4b69-410e-8160-d8ac975f2dec	12:30:00	ST	0	37	2	Spring2021	CSE203	4397-MR Mohammad Motiur Rahman	CSCLab1-S
574cc557-c60b-4cdc-9335-9f61913a8090	15:30:00	ST	0	36	3	Spring2021	CSE203	4449-MR Sheikh Abujar	CSCLab1-S
a65b43d3-be81-464d-9c81-0c4b7707edc0	12:30:00	MW	0	36	4	Spring2021	CSE203	4453-MS Moumita Asad	CSCLab1-S
a007aafc-223c-4344-9f4c-2501c4d0178f	11:00:00	MW	0	40	5	Spring2021	CSE203	4448-DR Farzana Rahman	GPLab-S
65f8b06c-e775-48b7-8466-32b1c34d213f	11:00:00	MW	B-0	0	6	Spring2021	CSE203	T001-00 TBA TBA	CSCLab3-S
78c54929-f8e7-43e0-aec6-6a9af89e0d20	11:00:00	S	0	36	1	Spring2021	CSE203L	4449-MR Sheikh Abujar	CSCLab1-S
b86d3ec3-b7d1-48b6-a94b-c0de6520dff9	11:00:00	T	0	37	2	Spring2021	CSE203L	4397-MR Mohammad Motiur Rahman	CSCLab1-S
96d1e44c-4f71-4e9f-82a2-90af9c9304a8	17:00:00	S	0	36	3	Spring2021	CSE203L	4449-MR Sheikh Abujar	CSCLab1-S
6415b1e7-b17f-4fc5-aa26-20414a011a46	11:00:00	W	0	36	4	Spring2021	CSE203L	4453-MS Moumita Asad	CSCLab1-S
61b7974c-07b6-4e2e-8d43-1dbed1eb4990	09:30:00	W	0	40	5	Spring2021	CSE203L	4448-DR Farzana Rahman	GPLab-S
4c8f8805-c109-443f-9907-47b9c836ff48	09:30:00	W	B-0	0	6	Spring2021	CSE203L	T001-00 TBA TBA	CSCLab3-S
3ccd79f9-9855-4156-9c7b-fcff418f1af7	11:00:00	ST	0	30	1	Spring2021	CSE204	4251-MR Md. Raihan Bin Rafique	C3005-S
55f60cad-a946-4590-afc7-bf8e6760ff6e	12:30:00	ST	0	31	2	Spring2021	CSE204	4251-MR Md. Raihan Bin Rafique	BC7016-S
1a51e5a4-afa6-40dd-9278-f95e33398d32	14:00:00	MW	0	30	3	Spring2021	CSE204	4251-MR Md. Raihan Bin Rafique	BC6012-S
7453db1d-841f-4528-b03a-f7624054fbcc	14:00:00	MW	B-0	0	4	Spring2021	CSE204	T001-00 TBA TBA	BC6013-S
d85f85ba-8e3b-4268-99d0-4facc8c59fd8	09:30:00	S	0	30	1	Spring2021	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
9f99375b-ee38-49d1-8e47-d8fb86eec6fa	14:00:00	S	0	31	2	Spring2021	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
762b2099-7a28-4e40-a60f-a6bc570b945b	12:30:00	W	0	30	3	Spring2021	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
31959519-7047-424d-a10a-81975fefb260	15:30:00	W	B-0	0	4	Spring2021	CSE204L	T001-00 TBA TBA	CENLAB-S
46841bc4-d9d1-4564-a4a4-628a7562b2a6	17:00:00	ST	0	31	1	Spring2021	CSE210	4285-DR Ferdows Zahid	BC5014-S
2db17129-9f2f-4662-8a6c-90d2ad45c439	09:30:00	MW	0	21	2	Spring2021	CSE210	4383-DR Faisal Uddin	C4004-S
30770278-c9d6-419e-8723-47a05cb8d845	15:30:00	T	0	32	1	Spring2021	CSE210L	4285-DR Ferdows Zahid	CENLAB-S
0e2dd975-7376-4d4f-91ba-31a55aa331f2	08:00:00	M	0	29	2	Spring2021	CSE210L	4435-MR Shahed Alam	CENLAB-S
b76731da-cd75-496e-961b-ed1ff661cfc7	08:00:00	ST	0	29	1	Spring2021	CSE211	4408-MR Asif Bin Khaled	CSCLab3-S
3eb92a5f-e581-4749-b0aa-eb7291fbbe8b	11:00:00	ST	0	32	2	Spring2021	CSE211	4408-MR Asif Bin Khaled	CSCLab3-S
b6415abb-eb59-4ca8-b949-d923c28d079f	08:00:00	MW	0	22	3	Spring2021	CSE211	4448-DR Farzana Rahman	CSCLab3-S
51689a95-a8fb-43fa-a8e3-f51cbf535d0c	11:00:00	MW	0	28	4	Spring2021	CSE211	4408-MR Asif Bin Khaled	CSCLab2-S
cbc1b84a-6c83-4673-be06-ca87a2eda652	09:30:00	S	0	29	1	Spring2021	CSE211L	4408-MR Asif Bin Khaled	CSCLab3-S
fc28800b-b7b5-46ac-96b1-50640f529295	09:30:00	T	0	32	2	Spring2021	CSE211L	4408-MR Asif Bin Khaled	CSCLab3-S
d055bd17-c4cb-4b6f-a71d-beb904f68810	09:30:00	M	0	22	3	Spring2021	CSE211L	4448-DR Farzana Rahman	CSCLab3-S
e013db69-9cb7-4dfa-95af-55140dd78b08	09:30:00	W	0	28	4	Spring2021	CSE211L	4408-MR Asif Bin Khaled	CSCLab2-S
950e2550-aded-42fd-96b5-2a317263676f	12:30:00	ST	0	35	1	Spring2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab2-S
7c9ddc83-d937-4faf-8447-6ad166a7437b	15:30:00	ST	0	35	2	Spring2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab2-S
42b05a49-6b28-463a-b412-56eb2c9340df	12:30:00	MW	0	36	3	Spring2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab2-S
7e308965-2fe3-4075-9a03-2535507bf786	15:30:00	MW	B-0	0	4	Spring2021	CSE213	4161-MR Subrata Kumar Dey	CSCLab2-S
a4b8da93-6922-4fb8-a6b3-7a1f9f12e38d	14:00:00	S	0	35	1	Spring2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab2-S
cb5c4c74-239c-40bc-95c0-6aae950ef693	14:00:00	T	0	35	2	Spring2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab2-S
d9fd2ecf-69fc-4b42-90a8-738b6a625cc7	14:00:00	M	0	36	3	Spring2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab2-S
2a915480-f948-4c71-9ed1-c030e9e739ca	14:00:00	W	B-0	0	4	Spring2021	CSE213L	4161-MR Subrata Kumar Dey	CSCLab2-S
fc066895-17b4-4aed-8030-873a6a7e3166	11:00:00	ST	B-0	0	1	Spring2021	CSE214	4137-MR Mohammad Noor Nabi	C4004-S
d53b6f98-e096-4daf-9887-74affd19629b	12:30:00	ST	0	28	2	Spring2021	CSE214	4137-MR Mohammad Noor Nabi	BC7025-S
e3e82e94-0438-4b9f-bf7d-1f57628725cb	15:30:00	MW	0	16	3	Spring2021	CSE214	4137-MR Mohammad Noor Nabi	BC5014-S
2f615f4c-9948-4d38-8ddc-3c04630c2290	09:30:00	MW	0	30	1	Spring2021	CSE216	4242-MR Prof. Farruk Ahmed	C4005-S
e1c22654-0206-4708-aa1b-436ac5b46ed4	12:30:00	MW	0	30	2	Spring2021	CSE216	4242-MR Prof. Farruk Ahmed	BC6012-S
1a7ce6a1-fd8d-4526-82dd-4d2b785213de	09:30:00	ST	0	25	3	Spring2021	CSE216	4433-MR Hamidur Rahman	BC6013-S
b836e930-13fd-4d07-8f72-fc3f1755de4b	12:30:00	M	0	30	1	Spring2021	CSE216L	4427-MR Rubayed Mehedi	CENLAB-S
42ed2ac1-d7bd-45e3-9e33-b1e4c75f00dc	11:00:00	M	0	30	2	Spring2021	CSE216L	4273-MR Sarwar Shahidi	CENLAB-S
e61175ce-45a3-4bc6-be1b-16dc3e1735f7	08:00:00	S	0	25	3	Spring2021	CSE216L	4273-MR Sarwar Shahidi	CENLAB-S
66818c9c-b246-4c52-8d0b-dd6dbd8e2c9f	12:30:00	ST	0	36	1	Spring2021	CSE303	4434-MS Sadita Ahmed	GPLab-S
6403cecd-11b1-4136-83a9-68b63144860b	12:30:00	ST	0	30	2	Spring2021	CSE303	4348-MR Md. Abu Sayed	CSCLab3-S
9865bd21-2344-458f-bc83-fd2e28db905f	14:00:00	MW	0	35	3	Spring2021	CSE303	4184-DR Mahady Hasan	CSCLab1-S
77b57c79-427c-4906-a6b7-bf6e5c670721	14:00:00	S	0	36	1	Spring2021	CSE303L	4434-MS Sadita Ahmed	GPLab-S
ba1bd14a-be31-49ff-b584-997542456640	14:00:00	S	0	30	2	Spring2021	CSE303L	4348-MR Md. Abu Sayed	CSCLab3-S
6a6035ba-f920-4e37-8cbd-9014f5971fa8	15:30:00	M	0	35	3	Spring2021	CSE303L	4184-DR Mahady Hasan	CSCLab1-S
75da2d1c-279b-4062-a77b-7f3e3d247df4	08:00:00	ST	0	26	1	Spring2021	CSE307	4331-MS Sabrina Alam	BC6012-S
3a21470e-a3dc-47cb-9558-330d49fca708	08:00:00	MW	0	32	2	Spring2021	CSE307	4331-MS Sabrina Alam	BC6009-S
bf003517-d25c-4bc8-83a4-167bc38a3501	11:00:00	ST	0	31	3	Spring2021	CSE307	4331-MS Sabrina Alam	C4005-S
ed6080d2-538c-41d7-929f-31533494a27a	08:00:00	ST	0	36	1	Spring2021	CSE309	4376-MR Sanzar Adnan Alam	CSCLab1-S
699a854e-bd30-454b-960e-328e87a0cfca	08:00:00	MW	0	35	2	Spring2021	CSE309	4376-MR Sanzar Adnan Alam	CSCLab1-S
0059243a-a273-4afb-a205-4a2970f71d3c	14:00:00	ST	0	23	1	Spring2021	CSE310	4435-MR Shahed Alam	BC6012-S
c0c0f058-a5c5-446d-80f8-07e412026049	15:30:00	MW	0	31	2	Spring2021	CSE310	4248-DR Satyen Biswas	BC6007-S
79897442-167c-4496-aaa3-c61bcffc5a92	12:30:00	S	0	29	1	Spring2021	CSE310L	4435-MR Shahed Alam	CENLAB-S
ffe556d9-0f0a-474b-bb19-311a7ad76763	14:00:00	M	0	32	2	Spring2021	CSE310L	4435-MR Shahed Alam	CENLAB-S
0d49a1f3-6667-41df-962f-1e281d64841a	15:30:00	ST	0	40	1	Spring2021	CSE313	4362-MR Bijoy Rahman Arif	C2004-S
b573cd51-2356-42f8-a384-fdd8290926c8	17:00:00	MW	0	45	2	Spring2021	CSE313	4362-MR Bijoy Rahman Arif	BC5014-S
72980298-cdac-413c-8059-d020016680c9	14:00:00	ST	0	39	1	Spring2021	CSE315	4137-MR Mohammad Noor Nabi	BC6013-S
55bc91bf-ccda-47eb-b562-ca200abc3cdf	17:00:00	MW	0	44	2	Spring2021	CSE315	4137-MR Mohammad Noor Nabi	BC6007-S
56b6a6c5-744c-4d81-90c2-2a200c1429a0	11:00:00	MW	0	21	1	Spring2021	CSE316	4383-DR Faisal Uddin	BC4014-S
6fb6a4a6-9b7c-4ce4-9af6-3c66bf0f1632	12:30:00	MW	0	25	2	Spring2021	CSE316	4383-DR Faisal Uddin	BC6013-S
1e4cbfce-978b-480f-aa66-a905513dd340	15:30:00	ST	B-0	0	3	Spring2021	CSE316	T001-00 TBA TBA	C2005-S
b14783d9-a14f-44d0-9af1-837bc5a4a684	17:00:00	ST	0	35	4	Spring2021	CSE316	4382-DR Tarem Ahmed	BC6008-S
034e5103-cce4-46fe-a8b9-552e48d7a938	12:30:00	M	0	21	1	Spring2021	CSE316L	4382-DR Tarem Ahmed	CSCLab3-S
c701cdd2-47f8-4f17-b003-81500fbd96a9	14:00:00	M	0	25	2	Spring2021	CSE316L	4382-DR Tarem Ahmed	CSCLab3-S
f4e3bc30-d64d-4eff-bf0e-fc90c54d451b	17:00:00	T	B-0	0	3	Spring2021	CSE316L	T001-00 TBA TBA	CSCLab1-S
dc171810-f9bb-4d42-82e9-0f94be11c9d0	15:30:00	S	0	35	4	Spring2021	CSE316L	4382-DR Tarem Ahmed	CSCLab3-S
5c3801d4-96a2-48eb-9f22-47d35d050576	12:30:00	ST	0	32	1	Spring2021	CSE317	4401-MR AKM Mahbubur Rahman	BC7026-S
399610ac-f305-432e-b79c-2057f7f7a71c	08:00:00	MW	0	35	2	Spring2021	CSE317	4447-PROF A. R. Azimul Hoque	CSCLab4-S
29f31261-d32a-436b-9873-0dcb2a194d3a	15:30:00	MW	0	26	3	Spring2021	CSE317	4336-DR Amin Ahsan Ali	BC6008-S
8e4b2cc5-43e4-47a5-8fb8-64ee24d955f7	14:00:00	S	0	32	1	Spring2021	CSE317L	4401-MR AKM Mahbubur Rahman	CSCLab1-S
c9b4ba34-7b7b-419e-b096-c19393a16760	09:30:00	M	0	35	2	Spring2021	CSE317L	4447-PROF A. R. Azimul Hoque	CSCLab4-S
8447d937-8d5e-4a08-93c9-82a86e32fedd	17:00:00	M	0	26	3	Spring2021	CSE317L	4336-DR Amin Ahsan Ali	CSCLab2-S
6dda9e9f-cb32-4c8b-8c83-fdd7e2d0f301	18:30:00	T	0	38	1	Spring2021	CSE403	4432-DR Al-Sakib Khan Pathan	BC5012-S
13766f22-8cbc-4036-8274-13f90629cede	18:30:00	S	0	33	1	Spring2021	CSE408	4382-DR Tarem Ahmed	BC5014-S
3b2cc090-8935-4aa6-b54c-a95b34da56da	18:30:00	M	0	43	1	Spring2021	CSE416	3620-DR Zoha Rahman	BC5013-S
bfd2984a-c328-43bd-afe2-bad17571da4e	18:30:00	M	0	51	2	Spring2021	CSE416	4389-MR Mohammad Shibli Kaysar	BC6012-S
0bc21337-790c-4907-b18b-15ae74d829bd	18:30:00	S	0	4	1	Spring2021	CSE424	4401-MR AKM Mahbubur Rahman	BC5013-S
96d94b56-7c6b-4efa-bf32-e61d14205336	18:30:00	M	0	23	1	Spring2021	CSE425	4336-DR Amin Ahsan Ali	BC5012-S
72dd9668-2b48-4df8-95e3-714c318ab31e	18:30:00	T	0	31	1	Spring2021	CSE441	4433-MR Hamidur Rahman	BC5014-S
118f4710-1eba-4d2a-a16b-03daf71aa7c3	18:30:00	W	0	50	1	Spring2021	CSE451	4280-MS Nujhat Nahar	BC5014-S
f3a75f18-27b8-4e22-9b72-b8aa72c560a1	18:30:00	T	0	20	1	Spring2021	CSE452	4184-DR Mahady Hasan	BC6007-S
b45d1f53-6c9a-4805-ad71-5c239f377151	18:30:00	W	0	30	1	Spring2021	CSE459	4331-MS Sabrina Alam	BC6007-S
2cc6d942-627a-4b7d-83fc-6dd8368d1300	08:00:00	F	0	2	1	Spring2021	CSE498	4184-DR Mahady Hasan	A4L04-S
08ef6735-3109-48e1-87bc-c1babd952637	09:30:00	F	0	10	2	Spring2021	CSE498	4242-MR Prof. Farruk Ahmed	A4L04-S
977ade18-07d8-4b09-bed9-3ce6cbc77f9e	11:00:00	F	0	0	3	Spring2021	CSE498	4241-DR Md. Ashraful Amin	A4L04-S
f328278f-e529-4d38-9d90-1796f2715aed	12:30:00	F	0	0	4	Spring2021	CSE498	4285-DR Ferdows Zahid	A4L04-S
7b69cf2b-5337-45b2-ae37-da4319d69cd0	14:00:00	F	0	1	5	Spring2021	CSE498	4382-DR Tarem Ahmed	A4L04-S
67157e46-c701-42b5-9a31-59114f38b4ed	15:30:00	F	0	0	6	Spring2021	CSE498	4336-DR Amin Ahsan Ali	A4L04-S
0a34af68-34cd-4291-80b8-fcbac8d721cd	17:00:00	F	0	0	7	Spring2021	CSE498	4383-DR Faisal Uddin	A4L04-S
dd842e12-3513-4657-8a10-17e862e9864c	18:30:00	F	0	1	8	Spring2021	CSE498	4401-MR AKM Mahbubur Rahman	A4L04-S
ad8bbbcc-5506-4335-be58-b3a26e9f010f	08:00:00	A	0	10	1	Spring2021	CSE499	4137-MR Mohammad Noor Nabi	A4L04-S
b24b1093-2207-4c52-a905-18684076a7c2	09:30:00	A	0	3	2	Spring2021	CSE499	4161-MR Subrata Kumar Dey	A4L04-S
e26ea8de-1b5b-4e04-b1e3-3ad7321fe43f	11:00:00	A	0	11	3	Spring2021	CSE499	4331-MS Sabrina Alam	A4L04-S
970d0900-88c1-44d2-b4c8-cbc4c7eb10a7	12:30:00	A	0	1	4	Spring2021	CSE499	4362-MR Bijoy Rahman Arif	A4L04-S
34f49650-9aa8-4293-9e7c-7a9a2f5aeddb	14:00:00	A	0	4	5	Spring2021	CSE499	4348-MR Md. Abu Sayed	A4L04-S
743ba4bd-4364-407f-acf7-dd8027264b22	15:30:00	A	0	0	6	Spring2021	CSE499	4397-MR Mohammad Motiur Rahman	A4L04-S
56b16b6c-eb86-4529-8ddb-c2feda7d7314	17:00:00	A	0	7	7	Spring2021	CSE499	4373-MS Romasa Qasim	A4L04-S
018388aa-888c-44b5-899d-39fca63b7251	18:30:00	A	0	19	8	Spring2021	CSE499	4376-MR Sanzar Adnan Alam	A4L04-S
7e0a9e50-ae10-46bd-8f0e-a3f5509eb0a1	20:00:00	A	0	5	9	Spring2021	CSE499	4416-MR Md. Fahad Monir	A4L04-S
246f0a8a-189f-426b-9032-5703de92669b	11:00:00	A	0	5	10	Spring2021	CSE499	4408-MR Asif Bin Khaled	BC001-S
85538509-7c43-4f39-b144-69338c5537de	12:30:00	A	B-0	0	11	Spring2021	CSE499	4409-MS Ajmiri Sabrina Khan	BC001-S
64fd70f8-860f-497c-9fcf-37fd2555380c	09:30:00	ST	0	28	1	Spring2021	ECN200	3491-MS Nuren Nirvana Brishti	C3004-S
1ff9c2e3-d6f4-4b62-bc0a-b22b41b87e36	17:00:00	ST	0	33	2	Spring2021	ECN200	3489-MS Fahmida Islam	BC3011-S
12dc8df5-fd03-406a-a38c-b369a3d2b8e5	08:00:00	MW	0	33	3	Spring2021	ECN200	3490-MS Nuzhat Sharmeen	BC3009-S
4ef8115f-6cf9-41d7-9222-15df5bc3a95d	08:00:00	ST	0	35	1	Spring2021	ECN201	3463-MR Md. Kamrul Islam	BC4010-S
243ac929-4533-4b3b-80d6-dee072a7574d	09:30:00	ST	0	40	2	Spring2021	ECN201	3463-MR Md. Kamrul Islam	C3005-S
b12b08b2-3c4d-44c3-b452-076a5b2d23ee	11:00:00	ST	0	40	3	Spring2021	ECN201	3467-MS Nabila Maruf	C2004-S
e791ba5b-0302-4fd7-aa5b-426f6fae03dd	12:30:00	ST	0	39	4	Spring2021	ECN201	3463-MR Md. Kamrul Islam	BC3012-S
8d733d8e-a9c5-477f-997f-79ee465d3b83	14:00:00	ST	0	39	5	Spring2021	ECN201	3461-MS Mumtahina Islam	BC3010-S
51f90628-4a14-4350-9f45-cfa95d8d959c	09:30:00	MW	0	41	6	Spring2021	ECN201	3489-MS Fahmida Islam	BC4010-S
3766eac6-2945-46c5-8161-cdd331f3d8ac	11:00:00	MW	0	27	7	Spring2021	ECN201	3298-Mr. Shamil M Al-Islam	BC3012-S
0ba64fe1-f82e-4371-8414-671d090ee050	12:30:00	MW	0	40	8	Spring2021	ECN201	3467-MS Nabila Maruf	BC3012-S
63c8d205-6631-4ac0-b645-3e82879f1b42	14:00:00	MW	0	41	9	Spring2021	ECN201	3410-MS Tasneem Bareen Hasan	BC8015-S
204bf855-2a71-40bf-b529-470077575739	15:30:00	MW	0	40	10	Spring2021	ECN201	3491-MS Nuren Nirvana Brishti	C2004-S
ccbb334b-61fc-4665-9354-1f3f8edcfeea	08:00:00	ST	0	40	1	Spring2021	ECN202	3490-MS Nuzhat Sharmeen	BC4011-S
a1aa73ff-4873-4d8a-a804-cbde0a0ed350	09:30:00	ST	0	39	2	Spring2021	ECN202	3298-Mr. Shamil M Al-Islam	BC3012-S
31bf2cfa-6cad-4b7d-ace9-233ba81e7838	14:00:00	ST	0	40	3	Spring2021	ECN202	3467-MS Nabila Maruf	BC3011-S
c8a97390-b36f-4d40-b52b-ed1b9cfa01bb	17:00:00	ST	0	39	4	Spring2021	ECN202	3621-DR Md. Khaled Saifullah	BC3012-S
4b845794-dea6-47de-bf15-451327888880	09:30:00	MW	0	41	5	Spring2021	ECN202	3298-Mr. Shamil M Al-Islam	BC4013-S
4f552048-3d86-410f-9f77-1d07836ca561	11:00:00	MW	0	40	6	Spring2021	ECN202	3490-MS Nuzhat Sharmeen	BC4010-S
b3885c5c-98b7-41d6-8e4f-68a189ab7c14	12:30:00	MW	0	40	7	Spring2021	ECN202	3461-MS Mumtahina Islam	BC4011-S
3fa8d0d9-0e5d-4663-80a6-abc91dfa94b5	15:30:00	MW	0	40	8	Spring2021	ECN202	3461-MS Mumtahina Islam	C2005-S
190260b0-6ecd-40f4-aa26-2afb395b8acd	09:30:00	ST	0	7	1	Spring2021	ECN203	3461-MS Mumtahina Islam	BC4011-S
5b6d4372-d8d2-48c2-bbea-647f8fef5a93	09:30:00	MW	0	25	1	Spring2021	ECN301	3467-MS Nabila Maruf	BC4014-S
cffd46dc-56f9-4972-91d3-d72b168ada05	14:00:00	MW	0	19	1	Spring2021	ECN302	3463-MR Md. Kamrul Islam	C2004-S
20f6bfa3-544a-4271-8674-3df00686bafb	08:00:00	ST	0	27	1	Spring2021	ECN308	3298-Mr. Shamil M Al-Islam	BC4012-S
f9a723c5-144c-4347-bcea-f1412afa7931	12:30:00	MW	0	21	1	Spring2021	ECN310	3463-MR Md. Kamrul Islam	BC4012-S
0c8c91d3-4d76-4ce6-8701-86d47356de1d	12:30:00	ST	0	30	1	Spring2021	ECN350	3490-MS Nuzhat Sharmeen	BC7015-S
fafac188-1d69-4b5d-868c-3b7976fcf493	17:00:00	ST	0	11	1	Spring2021	ECN351	3430-DR Amin Masud Ali	BC7025-S
a43b7698-5400-49bf-b529-f9f907bff4e8	11:00:00	ST	0	12	1	Spring2021	ECN401	3298-Mr. Shamil M Al-Islam	C2005-S
7a3bfa97-0ce3-4c25-80a8-dc377af0f64d	14:00:00	ST	0	9	1	Spring2021	ECN402	3494-DR Md. Shahnawaz Karim	BC3012-S
f651ee3d-0fb5-4b0e-9017-3d21aece0853	15:30:00	MW	0	6	1	Spring2021	ECN420	3494-DR Md. Shahnawaz Karim	BC4011-S
b1e8d605-f787-4df3-a190-a30a575f4b30	17:00:00	MW	0	17	1	Spring2021	ECN431	3565-DR Shahriar Kabir	BC4010-S
754ea400-1962-4e7b-9079-6612282f0a5a	11:00:00	MW	0	8	1	Spring2021	ECN486	3494-DR Md. Shahnawaz Karim	BC4011-S
efa39cff-0fc9-46a3-aec4-8582483f3b89	08:00:00	ST	0	5	1	Spring2021	ECN490	3565-DR Shahriar Kabir	BC4013-S
e5466b1e-7d2d-431b-a4b4-8e33e815028c	11:00:00	ST	0	29	1	Spring2021	EEE131	4275-MS Tahsin F. Ara Nayna	C5004-S
9ebbf404-5f12-4f47-9e69-7c9cf6e177b0	11:00:00	MW	0	24	2	Spring2021	EEE131	4275-MS Tahsin F. Ara Nayna	C2004-S
7903fd06-8fc1-4a47-9268-64af5668ad01	12:30:00	ST	B-0	0	1	Spring2021	EEE132	4286-DR Mustafa Habib Chowdhury	BC8015-S
b50f3166-7aa4-4839-bb5b-0067a55a6173	14:00:00	MW	0	39	2	Spring2021	EEE132	4286-DR Mustafa Habib Chowdhury	C2005-S
50b91e2d-bc36-4488-8cb7-84633884fab2	09:30:00	ST	B-0	0	1	Spring2021	EEE211	4240-DR Kafiul Islam	C4005-S
48e28a87-8be3-486d-b5bf-d4bbe3c9e775	09:30:00	MW	0	27	2	Spring2021	EEE211	4240-DR Kafiul Islam	C5004-S
40897f87-6d8f-4526-b424-dae8cbceaa02	14:00:00	S	0	16	1	Spring2021	EEE211L	4297-MR M. Ishtiaque Rahman	CirLab-S
92d25c90-65a4-4e29-830f-959ff9bc4f5c	12:30:00	W	0	12	2	Spring2021	EEE211L	4297-MR M. Ishtiaque Rahman	CirLab-S
3b5c69ad-3978-4fb9-b594-e607b32cf8af	15:30:00	ST	0	25	1	Spring2021	EEE221	4142-MS Afroza Sultana	C3005-S
3f0c1475-3497-4e95-8ae6-6bcea5cca111	15:30:00	MW	0	12	2	Spring2021	EEE221	4142-MS Afroza Sultana	BC6009-S
aafdf08f-7215-4dde-8954-a4eccf56f967	14:00:00	T	0	11	1	Spring2021	EEE222L	4278-MR Saurav Das	SIMLAB1-S
313f383b-4cdf-4772-88b6-1abc4b1326b3	14:00:00	M	0	16	2	Spring2021	EEE222L	4278-MR Saurav Das	SIMLAB1-S
2b8f106f-b4c1-44f7-8dce-81eda45a08f5	09:30:00	ST	0	19	1	Spring2021	EEE223	4351-MS Navila Rahman Nadi	BC4013-S
b7b8e6aa-bddb-43fa-a5a1-49aff56eebc6	12:30:00	MW	0	17	2	Spring2021	EEE223	4351-MS Navila Rahman Nadi	C2004-S
ee2c323a-b93e-46e5-b963-6399afabd9d2	09:30:00	ST	0	12	1	Spring2021	EEE231	4274-MS Saila Ishrat Annie	BC4014-S
c84c445a-757e-49e7-b011-4fa4e80f05e9	08:00:00	MW	0	5	2	Spring2021	EEE231	4274-MS Saila Ishrat Annie	BC6012-S
7bcb7334-c0cc-44fa-804d-475aedb46dac	14:00:00	ST	0	15	1	Spring2021	EEE232	4142-MS Afroza Sultana	C2004-S
ed100d6e-416f-454c-be1d-16e9617057cf	12:30:00	MW	0	22	2	Spring2021	EEE232	4142-MS Afroza Sultana	C2005-S
9ece4b7f-cb92-4800-9a6a-96f8b12d1ea5	15:30:00	T	0	11	1	Spring2021	EEE232L	4406-MR Mohammad Rejwan Uddin	CirLab-S
c7e1f19e-baf3-4d8b-9d68-fec9d3e3ef59	15:30:00	M	0	17	2	Spring2021	EEE232L	4406-MR Mohammad Rejwan Uddin	CirLab-S
e1b75eac-7148-4bb7-81d7-39c5b53f96a3	14:00:00	MW	0	38	1	Spring2021	EEE233	4200-DR Shahriar Khan	BC5014-S
045c2f61-139b-4a14-92d4-7fab276c653b	09:30:00	MW	0	26	1	Spring2021	EEE234	4455-DR Touhidur Rahman	BC6013-S
97e9baf9-5ff1-4aa4-8836-9a2b13572420	11:00:00	S	0	20	1	Spring2021	EEE234L	4406-MR Mohammad Rejwan Uddin	CirLab-S
f0210a61-5f8e-4f3e-b5b7-d966d52dcad8	12:30:00	T	B-0	0	2	Spring2021	EEE234L	T001-00 TBA TBA	CirLab-S
b383575a-bb5d-430d-8d4d-929737194368	14:00:00	MW	0	19	1	Spring2021	EEE312	4190-DR Khosru Mohammad Salim	BC6007-S
fc0974f5-dfed-4561-8f12-7e4c009f834f	08:00:00	S	0	11	1	Spring2021	EEE312L	4352-MS Zaima Tasneem	PowLab-S
3ce2f2e2-0af4-4ac3-afbe-166bf136a549	08:00:00	M	0	15	2	Spring2021	EEE312L	4352-MS Zaima Tasneem	PowLab-S
f3caa45d-2d69-43fd-a496-5c945344eb18	14:00:00	ST	0	50	1	Spring2021	EEE313	4286-DR Mustafa Habib Chowdhury	BC6007-S
164e220a-0913-4eca-9c56-f51c91af24da	11:00:00	T	0	23	1	Spring2021	EEE314L	4360-MR Mohammad Nasfikur Rahman Khan	SIMLAB1-S
2998bc48-4391-42db-bf99-1ea22d583e6f	12:30:00	S	0	22	1	Spring2021	EEE315L	4278-MR Saurav Das	PowLab-S
03b10d38-9317-493b-91d3-9db5dfed674f	11:00:00	S	0	22	1	Spring2021	EEE316L	4360-MR Mohammad Nasfikur Rahman Khan	SIMLAB1-S
a2c03bf9-a91b-4a8c-9b4c-21a4de821ba5	08:00:00	ST	0	50	1	Spring2021	EEE321	4274-MS Saila Ishrat Annie	BC5012-S
309afeb6-66a4-4ea4-998c-219d38cae06e	09:30:00	M	0	27	1	Spring2021	EEE321L	4274-MS Saila Ishrat Annie	TelLab-S
f0748997-86c3-4cde-aba7-3a6c0afc31f1	09:30:00	W	0	22	2	Spring2021	EEE321L	4274-MS Saila Ishrat Annie	TelLab-S
2bd0c3f7-6a42-4494-84ee-4c391032d372	15:30:00	ST	0	18	1	Spring2021	EEE323	4360-MR Mohammad Nasfikur Rahman Khan	BC5013-S
07ec10bb-d587-4979-a69a-bb4ccfb8d0a7	12:30:00	S	0	14	1	Spring2021	EEE323L	4351-MS Navila Rahman Nadi	SIMLAB1-S
57cb5626-d640-4592-90dc-0747f0670e7d	12:30:00	T	0	18	2	Spring2021	EEE323L	4351-MS Navila Rahman Nadi	SIMLAB1-S
1497b95c-66ec-4d4d-8ef4-55af3e9a3b79	15:30:00	MW	0	41	1	Spring2021	EEE332	4212-DR Abdur Razzak	BC5012-S
52260044-2293-49b5-ba83-136de1759740	14:00:00	T	0	16	1	Spring2021	EEE332L	4297-MR M. Ishtiaque Rahman	PowLab-S
f0959b2b-e7e3-47dd-9e79-de23ebe70de9	14:00:00	W	0	21	2	Spring2021	EEE332L	4297-MR M. Ishtiaque Rahman	PowLab-S
15ecc991-a00d-432a-8050-b32b4a465017	11:00:00	MW	0	37	1	Spring2021	EEE333	4351-MS Navila Rahman Nadi	BC6012-S
27494ab6-c848-4e50-ac24-9221d6502fe2	17:00:00	ST	0	30	1	Spring2021	EEE334	4406-MR Mohammad Rejwan Uddin	SIMLAB1-S
e5cf4f6a-4826-41db-8194-68dd267c27fa	17:00:00	MW	0	22	2	Spring2021	EEE334	4406-MR Mohammad Rejwan Uddin	SIMLAB1-S
3b6a602f-0b96-4bc6-ba1c-3f638735de1d	08:00:00	R	0	6	1	Spring2021	EEE400	4212-DR Abdur Razzak	BCTBA1-S
c806f0dd-2383-4653-b743-57409889570d	09:30:00	R	0	0	2	Spring2021	EEE400	4200-DR Shahriar Khan	BCTBA1-S
84d8ccef-98a3-4192-b792-91b65bc7c792	11:00:00	R	0	12	3	Spring2021	EEE400	4190-DR Khosru Mohammad Salim	BCTBA1-S
d96b8390-e9fb-4c95-9248-fbaf9726c8de	12:30:00	R	0	5	4	Spring2021	EEE400	4199-DR Feroz Ahmed	BCTBA1-S
4261453e-b5b3-4de7-a082-7c58cbe8eb3c	14:00:00	R	0	1	5	Spring2021	EEE400	4240-DR Kafiul Islam	BCTBA1-S
6edef938-776d-463d-a35e-982428d55837	15:30:00	R	0	0	6	Spring2021	EEE400	4286-DR Mustafa Habib Chowdhury	BCTBA1-S
4d9e627e-6785-4801-8c1d-7564d280bd29	17:00:00	R	0	7	7	Spring2021	EEE400	4361-MR Shovasis Kumar Biswas	BCTBA1-S
e609f579-0ec2-4864-930d-bda77c6e0b53	15:30:00	ST	0	18	1	Spring2021	EEE411	4212-DR Abdur Razzak	BC5014-S
d8a68c01-4556-4f4d-a0fb-da6914ffc8a1	08:00:00	T	0	13	1	Spring2021	EEE411L	4352-MS Zaima Tasneem	PowLab-S
29ec29e4-e72f-4e46-bce4-a03bcbb26248	08:00:00	W	0	17	2	Spring2021	EEE411L	4352-MS Zaima Tasneem	PowLab-S
7657ecc4-1c21-46b1-a571-cd2a500f7a15	14:00:00	ST	0	31	1	Spring2021	EEE419	4200-DR Shahriar Khan	BC6008-S
e91139b5-dd01-4273-951c-c236ba213dcb	15:30:00	W	0	26	1	Spring2021	EEE419L	4297-MR M. Ishtiaque Rahman	PowLab-S
cdbeb0da-0c24-49cf-a922-d57f601f724d	08:00:00	ST	0	30	1	Spring2021	EEE422	4324-MR Fokhruz Zaman	BC5013-S
0db9a5a1-a734-4ed9-9a93-66ff42879886	11:00:00	M	0	30	1	Spring2021	EEE423L	4352-MS Zaima Tasneem	PowLab-S
ee716f37-9b2c-4e1c-ae13-457c2dfe776d	12:30:00	MW	0	7	1	Spring2021	EEE463	4455-DR Touhidur Rahman	BC6007-S
47ef2114-f934-4ebb-84f0-256041079026	17:00:00	ST	B-0	0	1	Spring2021	EEE469	4360-MR Mohammad Nasfikur Rahman Khan	BC5013-S
9492bb48-fec8-4a64-a456-63ad048dd60d	09:30:00	MW	0	11	1	Spring2021	EEE490	4360-MR Mohammad Nasfikur Rahman Khan	BC7015-S
ec940c90-7588-4116-b2ce-d0945f5f33b8	08:00:00	A	0	0	1	Spring2021	EEE497	4142-MS Afroza Sultana	BCTBA2-S
4ae628f6-5dd9-4437-be27-df55fa3bf14f	09:30:00	A	0	0	2	Spring2021	EEE497	4274-MS Saila Ishrat Annie	BCTBA2-S
c1f73f20-1249-436c-929b-f4cc21510263	11:00:00	A	0	0	3	Spring2021	EEE497	4275-MS Tahsin F. Ara Nayna	BCTBA2-S
b23d3df9-a769-446d-aaf6-c0e30c563280	12:30:00	A	0	0	4	Spring2021	EEE497	4351-MS Navila Rahman Nadi	BCTBA2-S
21424063-09ac-4d2f-8b27-5f56be5830dc	14:00:00	A	0	0	5	Spring2021	EEE497	4361-MR Shovasis Kumar Biswas	BCTBA2-S
cb57136e-cfc0-43b4-aab3-60c5ee1dc92a	15:30:00	A	0	0	6	Spring2021	EEE497	4360-MR Mohammad Nasfikur Rahman Khan	BCTBA2-S
e814e0d4-dd82-4964-a76a-158234c4d6ef	08:00:00	F	0	0	1	Spring2021	EEE499	4142-MS Afroza Sultana	BCTBA2-S
a7398181-c694-4c9f-8091-c8905322bde1	09:30:00	F	0	0	2	Spring2021	EEE499	4274-MS Saila Ishrat Annie	BCTBA2-S
0fc7b50f-f8a1-4e0c-88f9-8027ce6d7ab0	11:00:00	F	0	0	3	Spring2021	EEE499	4275-MS Tahsin F. Ara Nayna	BCTBA2-S
70f8cf98-8420-4299-98fd-bbe0888ecd48	12:30:00	F	0	0	4	Spring2021	EEE499	4351-MS Navila Rahman Nadi	BCTBA2-S
935a1f89-1d49-4bab-835c-152afe30af42	14:00:00	F	0	0	5	Spring2021	EEE499	4361-MR Shovasis Kumar Biswas	BCTBA2-S
379ff6a5-3c60-4d14-ab1a-ed125e062d47	15:30:00	F	0	0	6	Spring2021	EEE499	4360-MR Mohammad Nasfikur Rahman Khan	BCTBA2-S
0cf4234a-3975-4f77-a38d-14b1a087595a	11:00:00	MW	0	16	1	Spring2021	ELL101	2502-MS Afroza Bilkis	C4006-S
4d3518e4-23cf-4e7d-8471-6bb2bfe36f53	12:30:00	ST	0	20	2	Spring2021	ELL101	2502-MS Afroza Bilkis	C2006-S
0cde8d7e-23b9-4126-93d8-a5ff6538535d	11:00:00	ST	0	18	1	Spring2021	ELT201	2002-MS Mithila Mahfuz	C2002-S
cfcf485f-83d5-4bb6-8e77-c2062ed8dac5	14:00:00	MW	0	27	1	Spring2021	ELT203	2106-MR Towhid Bin Muzaffar	C3004-S
ff25bbe5-c4a6-4154-945d-415b2a24fe03	09:30:00	ST	0	2	1	Spring2021	ELT204	2002-MS Mithila Mahfuz	BC9015-S
04d20886-a3e9-4321-999c-d0d716816bee	09:30:00	MW	0	15	1	Spring2021	ELT302	2002-MS Mithila Mahfuz	C2003-S
01ff98bd-ab7c-4deb-aeef-85835f5cf57a	08:00:00	ST	0	13	1	Spring2021	ELT304	2132-MS Rezina Nazneen Rimi	BC8013-S
3bd2e2f8-901e-4258-bc3b-15a3970af0b4	08:00:00	MW	0	8	1	Spring2021	ELT305	2132-MS Rezina Nazneen Rimi	BC6013-S
23e1cfaa-e2fb-4443-9760-c2b5377bc1c9	09:30:00	ST	0	14	1	Spring2021	ELT403	2136-MR Md. Shaiful Islam	C2002-S
3fb88854-fc5f-4de2-89e7-8f1c99d9edd2	11:00:00	MW	0	14	1	Spring2021	ELT405	2002-MS Mithila Mahfuz	C2005-S
ecdaa940-b189-4136-aaa8-54a230fe10ca	15:30:00	MW	0	25	1	Spring2021	ELT412	2234-MS Naureen Rahnuma	BC8013-S
41127ec7-1127-4a92-a4f5-2a2c6eb7d7f6	11:00:00	ST	0	14	1	Spring2021	ELT414	2136-MR Md. Shaiful Islam	C2003-S
bc779ca5-17f6-41ac-9e13-64f26528d5a5	12:30:00	ST	0	35	1	Spring2021	ELT415	2439-MR Adilur Rahman	BC4011-S
643424ac-f556-4f3a-99f1-43b671c885f4	09:30:00	MW	0	15	1	Spring2021	ELT416	2132-MS Rezina Nazneen Rimi	C2002-S
00cf078d-fb05-4ddc-a043-15c8f2a05b1f	17:00:00	R	0	1	1	Spring2021	ELT499	2104-MR Syed Mazharul Islam	BC8013-S
0be5526a-36f4-42e0-a7d3-1aff74fa6cb1	17:00:00	R	0	10	2	Spring2021	ELT499	2439-MR Adilur Rahman	A4L04-S
44902f04-8a90-438a-939b-276bcd6b4ddf	08:00:00	MW	0	41	1	Spring2021	ENG101	2259-MR G. M. A Mainuddin Chowdhury	BC7016-S
6ba4023c-5fb9-492a-b0e8-5102225f97a3	11:00:00	ST	0	42	2	Spring2021	ENG101	2493-MS Anika Nawar	BC7025-S
0aa80a48-62aa-499d-921b-c5af9cebedf6	11:00:00	ST	0	42	3	Spring2021	ENG101	2344-MS Nadira Sultana Mirza	BC7026-S
96dd52fe-31ac-493b-b666-0234ec6ae435	12:30:00	MW	0	42	4	Spring2021	ENG101	2362-MS Sakira Islam	BC7016-S
545a2a99-374f-41e6-a75c-93a86c407706	14:00:00	MW	0	43	5	Spring2021	ENG101	2411-MS Lameya Alma Amin	BC7016-S
b5c91389-6e17-426e-b357-bf802086108f	09:30:00	MW	0	41	6	Spring2021	ENG101	2418-MR Md. Ashikuzzaman	BC9014-S
a508a177-23fb-4cdf-a7d0-d296c26c154f	08:00:00	ST	0	41	7	Spring2021	ENG101	2483-MR Kazi Mubinul Hasan Shanto	BC7016-S
03815725-f161-4fba-87d0-b4d72979c24f	17:00:00	MW	B-0	0	8	Spring2021	ENG101	2493-MS Anika Nawar	BC7015-S
673bea7e-4d16-4514-8150-bb9da2fb70c2	09:30:00	ST	0	42	9	Spring2021	ENG101	2344-MS Nadira Sultana Mirza	BC7026-S
faef0390-50a7-47c6-8b3d-0c61cc442f43	08:00:00	MW	0	41	10	Spring2021	ENG101	2247-MS Sumaiya Islam	BC7025-S
79fe25be-cab9-4991-8463-7971381fe32d	14:00:00	MW	0	41	11	Spring2021	ENG101	2362-MS Sakira Islam	BC7025-S
02943565-bcc5-4c7c-8cc1-5a530d8cb5a9	09:30:00	ST	0	41	12	Spring2021	ENG101	2452-MS Mir Sadia Siddequa Sifat	BC8011-S
8dbd9621-558f-4724-bc79-b989bb08fd39	09:30:00	MW	0	42	13	Spring2021	ENG101	2411-MS Lameya Alma Amin	BC9017-S
7dca894b-9678-42c1-9b85-5c0cbaf9dd6d	12:30:00	MW	0	42	14	Spring2021	ENG101	2409-MS Sanjida Akhter	BC7025-S
31ddd528-018a-48b5-a342-af04f0a3283e	17:00:00	MW	0	42	15	Spring2021	ENG101	2332-MS Fatina Sarwar	BC7016-S
9714236f-7c63-410f-86f3-a7fbe3e6e2c5	17:00:00	ST	0	46	1	Spring2021	ENG102	2332-MS Fatina Sarwar	BC7015-S
0242856a-3095-434e-a22f-968f8d9a4a67	11:00:00	ST	0	47	2	Spring2021	ENG102	2133-MS Saara Zabeen	BC9014-S
b2f0bba8-a23c-42c0-bdda-48c255a77b6b	17:00:00	MW	0	46	3	Spring2021	ENG102	2490-MS Pikasha Imam	BC7025-S
22c80a95-849d-4482-a139-a731d75d74b8	11:00:00	MW	0	48	4	Spring2021	ENG102	2133-MS Saara Zabeen	BC7025-S
61c7341c-31d4-4477-92cc-56e0ae52c40a	12:30:00	MW	0	47	5	Spring2021	ENG102	2133-MS Saara Zabeen	BC7026-S
fde0755c-b124-48f3-a5ba-4e6e50379930	15:30:00	MW	0	46	6	Spring2021	ENG102	2260-MS Andaleeb N. Chowdhury	BC7016-S
c5311597-c58b-420a-ba99-79141a929f39	14:00:00	ST	0	46	7	Spring2021	ENG102	2219-MR Md. Ziaul Karim	BC7016-S
63f2a3d6-86e2-4033-9f0b-26e244247d7b	15:30:00	ST	0	46	8	Spring2021	ENG102	2219-MR Md. Ziaul Karim	BC7016-S
4a1d0ceb-a863-46e9-87a9-95da05f54531	11:00:00	MW	0	48	9	Spring2021	ENG102	2418-MR Md. Ashikuzzaman	BC7026-S
38c19421-1393-4eed-bed6-b4fe89c9fc8d	12:30:00	MW	0	46	10	Spring2021	ENG102	2247-MS Sumaiya Islam	BC8011-S
0bdbac2b-71cf-4e81-a986-7fcc522f078e	11:00:00	ST	0	47	11	Spring2021	ENG102	2483-MR Kazi Mubinul Hasan Shanto	BC9017-S
8d7c2016-3f69-40d1-961a-e302d69b651c	09:30:00	MW	0	46	12	Spring2021	ENG102	2487-DR AKM Zakaria	BC10014-S
6080d9d9-4141-4377-828e-97c2fa03a063	15:30:00	MW	0	46	13	Spring2021	ENG102	2409-MS Sanjida Akhter	BC7026-S
7b01bfec-3a2b-4367-aeeb-4469625b1471	15:30:00	MW	0	46	14	Spring2021	ENG102	2408-MS Rumana Amin	BC9017-S
40759f1b-e1d0-4ea0-a7bc-a7ca930b05a8	09:30:00	ST	0	44	1	Spring2021	ENG105	2405-MS Jasmine Ferdous	BC8015-S
5f930c32-ddce-420d-8b6e-284fb52b6f21	11:00:00	MW	0	46	2	Spring2021	ENG105	2357-MR Mohammad Israil Hoque	BC9014-S
0806369d-3c55-4cab-bbb2-d2f763f11927	09:30:00	MW	0	45	3	Spring2021	ENG105	2357-MR Mohammad Israil Hoque	BC10015-S
d78b4fa7-65dd-4c24-8e5d-56620b64bb1d	11:00:00	MW	0	44	4	Spring2021	ENG105	2463-PROF Rabeya Begum	BC9017-S
16341a09-761d-44de-b30a-b4ab32996b66	08:00:00	ST	0	46	5	Spring2021	ENG105	2405-MS Jasmine Ferdous	BC7025-S
51453e9e-84a1-462b-bc3c-4413f0f201b1	08:00:00	MW	0	44	6	Spring2021	ENG105	2487-DR AKM Zakaria	BC7026-S
0d0e6543-e281-4759-b587-43a5520ea718	15:30:00	ST	0	46	7	Spring2021	ENG105	2407-MS Sayeeda Sharmin	BC7025-S
3b279b4d-a698-4910-b545-a95a80de6799	12:30:00	MW	0	44	8	Spring2021	ENG105	2463-PROF Rabeya Begum	BC8012-S
db32387f-b09a-4fce-b991-3bac7d433e35	12:30:00	MW	0	46	9	Spring2021	ENG105	2417-MR Mohammad Serajuddin	BC8015-S
655ef92a-b468-4d7c-8f23-afd20483c206	11:00:00	ST	0	46	10	Spring2021	ENG105	1105-MR Kamal Uddin	BC10014-S
3990bf9a-3388-42bd-85bd-797e70295490	15:30:00	ST	0	46	11	Spring2021	ENG105	2408-MS Rumana Amin	BC7026-S
bc26c6be-8869-4eeb-881c-31111184ef6c	08:00:00	ST	0	46	12	Spring2021	ENG105	1105-MR Kamal Uddin	BC7026-S
25d8b2fa-0569-4c17-8a6f-971d4232b341	11:00:00	ST	0	46	13	Spring2021	ENG105	2407-MS Sayeeda Sharmin	BC10015-S
78abc79d-9627-4463-8617-3e56b735586c	09:30:00	MW	0	43	14	Spring2021	ENG105	2259-MR G. M. A Mainuddin Chowdhury	BC10018-S
551e8b91-39c1-4e4c-b807-cd5262459fb7	09:30:00	ST	0	30	1	Spring2021	ENG201	2126-MS Sayyeda-tun-Noor Sameera	C2003-S
86993135-8ec6-489d-beaf-d2308bc5deee	17:00:00	MW	0	15	1	Spring2021	ENG202	2260-MS Andaleeb N. Chowdhury	BC4012-S
804f85aa-2afb-4220-a935-163a2dfb1be7	15:30:00	ST	0	19	1	Spring2021	ENG305	2260-MS Andaleeb N. Chowdhury	C2003-S
f7a14fb8-2bbc-4ea3-978f-322f4b82f911	17:00:00	ST	0	9	1	Spring2021	ENG401	2486-DR Ahmed Ahsanuzzaman	BC4011-S
04c5f9a7-f384-40cf-9099-9757b985e2ca	15:30:00	MW	0	14	1	Spring2021	ENG404	2229-PROF Razia Sultana Khan	BC9015-S
554cb70f-6d72-4fff-8271-c77e89584e18	09:30:00	MW	0	11	1	Spring2021	ENG405	2126-MS Sayyeda-tun-Noor Sameera	C5003-S
88af0923-0a1e-4d10-b603-c009c94ba795	14:00:00	ST	0	6	1	Spring2021	ENG414	2126-MS Sayyeda-tun-Noor Sameera	BC8013-S
b2603f12-cd90-4409-a3d7-6db80d2f9f6b	12:30:00	ST	0	16	1	Spring2021	ENG416	2260-MS Andaleeb N. Chowdhury	BC8013-S
f5fda840-a6d6-4616-8ce9-e95625279e22	17:00:00	R	0	9	1	Spring2021	ENG499	2486-DR Ahmed Ahsanuzzaman	BCTBA3-S
1a92e232-cd2e-42f8-9406-430d927de4a5	14:00:00	ST	0	37	1	Spring2021	ENV100	5230-MR Md. Ekhtekharul Islam	BC8011-S
2efa93ad-963a-4d5e-b5a3-607f213ddd3e	14:00:00	ST	0	28	2	Spring2021	ENV100	5536-MS Karishma Sinha	BC8012-S
d537dd25-2f4f-4357-a603-e3067a5a4072	11:00:00	MW	0	40	1	Spring2021	ENV101	5231-MR Saquib Ahmad Khan	BC8011-S
3bcc0d49-9ca3-4038-ba38-4b8b3ebb3376	17:00:00	MW	0	27	2	Spring2021	ENV101	5248-MS Tahmina Sultana	BC7026-S
0ebea4b8-5ce0-4432-be0e-361954696049	11:00:00	ST	0	40	3	Spring2021	ENV101	5230-MR Md. Ekhtekharul Islam	BC10018-S
89ab518d-dbbf-4fdd-8495-d157eadc14e6	12:30:00	ST	0	40	4	Spring2021	ENV101	5248-MS Tahmina Sultana	BC8012-S
ac2867d3-353b-4e1f-8bb9-aeb19bbf1ad6	12:30:00	MW	0	19	5	Spring2021	ENV101	5536-MS Karishma Sinha	BC10015-S
13c2bf1c-1166-4dda-9eaa-3c7228302a41	15:30:00	ST	0	28	6	Spring2021	ENV101	5212-MR Chowdhury Kamrul Hasan	BC8012-S
05ea91f8-fc1d-490e-9b99-6592c851a3db	14:00:00	ST	0	40	7	Spring2021	ENV101	5207-MR Tanvir Ahmed Haroon	BC8015-S
14c5e043-929d-4a6d-97b5-91fa145b948a	09:30:00	MW	0	14	8	Spring2021	ENV101	5324-MS Sareeta Haidar	C2005-S
20ddc71a-5d65-4e68-887e-9076ff26a3bd	11:00:00	MW	0	25	1	Spring2021	ENV102	5207-MR Tanvir Ahmed Haroon	BC8012-S
7de49142-73dd-408a-b6ed-ff9b31f92706	11:00:00	MW	0	30	1	Spring2021	ENV201	5252-DR Sadia Nazneen Karobi	BC10017-S
be68977a-2e83-4b78-92df-f3273a3cb194	09:30:00	R	B-0	0	1	Spring2021	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
b26b9d8f-6138-4065-8bf4-4e91664f40aa	11:00:00	R	B-0	0	2	Spring2021	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
5b8db178-dbe7-48e0-b816-3c7b483efe70	11:00:00	ST	0	20	1	Spring2021	ENV202	5199-Ms. Shahima Islam	C6007-S
b6638ad1-f2e5-464b-8047-394e67c207df	09:30:00	MW	0	17	2	Spring2021	ENV202	5236-DR Mohammad Sorowar Hossain	BC10017-S
66da641f-6ad5-47b2-b8d7-1b96d7e4cb72	11:00:00	R	B-0	0	1	Spring2021	ENV202L	5199-Ms. Shahima Islam	BLab-S
a33f830b-5f4c-4417-84d1-9ff3d62cda0b	12:30:00	R	B-0	0	2	Spring2021	ENV202L	5236-DR Mohammad Sorowar Hossain	BLab-S
6e7995c6-d208-432f-b0bd-be7d3c31a14a	09:30:00	ST	0	28	1	Spring2021	ENV205	5231-MR Saquib Ahmad Khan	BC8012-S
c611f69a-48c7-4cc3-be8e-c375ef9b8b44	17:00:00	ST	0	30	1	Spring2021	ENV206	5248-MS Tahmina Sultana	BC8011-S
d1af7966-af1f-4331-b0f3-6af5664ce1ae	15:30:00	MW	0	30	2	Spring2021	ENV206	5248-MS Tahmina Sultana	BC10018-S
f9a86fd5-cdba-453e-aceb-6edf3be4c080	14:00:00	MW	0	26	1	Spring2021	ENV208	5236-DR Mohammad Sorowar Hossain	BC8014-S
e5ce17c5-17fc-4254-9a81-7eb734eefa42	11:00:00	ST	0	40	1	Spring2021	ENV212	5207-MR Tanvir Ahmed Haroon	BC8013-S
8aedc746-0022-42d2-b181-a75a75b327c3	11:00:00	ST	0	25	2	Spring2021	ENV212	5247-DR Tawhid Monzur	C2007-S
128026c4-3453-40ee-ab2c-19175ea9592b	11:00:00	MW	0	30	1	Spring2021	ENV216	5212-MR Chowdhury Kamrul Hasan	BC10018-S
330d96d1-7361-4b3b-89fa-89078ce0818e	08:00:00	MW	0	8	1	Spring2021	ENV220	5252-DR Sadia Nazneen Karobi	BC8015-S
bdecbb62-acfb-4aaa-92e7-dcd063b0548b	14:00:00	MW	0	19	1	Spring2021	ENV301	5230-MR Md. Ekhtekharul Islam	BC8011-S
57564192-60ff-4802-9cd5-2fe5594d1d4e	17:00:00	ST	0	31	1	Spring2021	ENV302	5247-DR Tawhid Monzur	BC7019-S
e71017cd-6944-4cf3-ad5a-cdcb0e8a4d4a	15:30:00	R	B-0	0	1	Spring2021	ENV302L	5247-DR Tawhid Monzur	BC7019-S
2d4aaa2c-06a0-4898-9fa9-445cb3b26f5e	14:00:00	R	B-0	0	2	Spring2021	ENV302L	5247-DR Tawhid Monzur	BC7019-S
2667ad3e-358c-48e0-83aa-26ed5e5ab75a	12:30:00	ST	0	50	1	Spring2021	ENV303	5207-MR Tanvir Ahmed Haroon	BC8011-S
a59aa281-0329-4fb7-b700-636ec2a17d1b	11:00:00	MW	0	8	1	Spring2021	ENV304	5236-DR Mohammad Sorowar Hossain	C5003-S
34a53e9a-d8d4-4cf0-b60d-47d21e10337a	14:00:00	R	B-0	0	1	Spring2021	ENV304L	5236-DR Mohammad Sorowar Hossain	ESLAB2-S
3f769616-d6c5-4c18-9018-931e3f72fd49	09:30:00	ST	0	12	1	Spring2021	ENV307	5230-MR Md. Ekhtekharul Islam	BC10017-S
d82ecb87-b487-406f-9243-f5107d0dcd39	14:00:00	ST	0	30	1	Spring2021	ENV310	5199-Ms. Shahima Islam	BC9017-S
c1e13ab1-2f3c-42d4-8731-fe7b0842dff8	09:30:00	MW	0	32	1	Spring2021	ENV315	5129-MR Khondkar Ayaz Rabbani	BC9015-S
2bb7e7bd-01c4-4166-b205-6e4185ffeef8	08:00:00	ST	0	36	1	Spring2021	ENV316	5142-DR Md. Abdul Khaleque	C2005-S
4512a401-1065-4bcc-8750-a0d499c96303	15:30:00	ST	0	31	1	Spring2021	ENV320	5536-MS Karishma Sinha	BC9014-S
51a1b5f3-cbc2-408c-b134-424c8eb6d6dc	08:00:00	MW	0	16	1	Spring2021	ENV325	5142-DR Md. Abdul Khaleque	BC9014-S
a980668c-c9c2-4282-be90-52cc84919db7	17:00:00	ST	0	28	2	Spring2021	ENV325	5142-DR Md. Abdul Khaleque	BC8012-S
1dfccc92-c71b-416b-9c52-23520f5476cc	17:00:00	ST	B-0	0	1	Spring2021	ENV330	5291-DR Abu SMG Kibria	BC8015-S
258511b4-2d23-4f83-b98d-2522d7201eb9	11:00:00	MW	0	18	1	Spring2021	ENV340	5247-DR Tawhid Monzur	BC7019-S
dad396ce-b529-4e09-a6b0-bbde8f81b817	09:30:00	ST	0	28	1	Spring2021	ENV346	5215-DR M. H. Rahman	BC9016-S
f6929f1b-bb58-46f6-9771-250046785058	14:00:00	MW	0	13	1	Spring2021	ENV348	5215-DR M. H. Rahman	BC8012-S
ba3d260b-dead-4275-a547-a538000d037a	14:00:00	MW	0	30	1	Spring2021	ENV350	5536-MS Karishma Sinha	BC10015-S
64cfd322-96c5-4ae7-9894-e5a3e753c81b	15:30:00	ST	0	27	1	Spring2021	ENV360	5199-Ms. Shahima Islam	C3003-S
ac34d5f1-378a-4d6c-b12c-207f51b7d1a9	12:30:00	MW	0	44	1	Spring2021	ENV401	5207-MR Tanvir Ahmed Haroon	BC10018-S
2de2350c-09c2-4373-9dcd-6ea7305e6d70	09:30:00	MW	0	32	1	Spring2021	ENV403	5215-DR M. H. Rahman	BC9016-S
1b09571d-a22f-4007-a30c-e5b16f46e417	17:00:00	ST	0	23	1	Spring2021	ENV409	5189-PROF M. Z. Abedin	BC9014-S
9eb0545a-58b2-439f-982e-1182f74b35d0	17:00:00	MW	B-0	0	1	Spring2021	ENV410	5321-DR Qazi Zahed Iqbal	BC10015-S
b2163e54-115b-4715-b3fa-3f693e70bbcd	09:30:00	ST	0	32	1	Spring2021	ENV415	5129-MR Khondkar Ayaz Rabbani	C2006-S
2ac99fe0-d95e-4c28-8890-abdcf6ad3d0c	08:00:00	R	0	49	1	Spring2021	ENV498	5129-MR Khondkar Ayaz Rabbani	BC001-S
4963d3ed-67c1-4e71-b28d-2417e2a0b9f0	09:30:00	R	0	44	1	Spring2021	ENV499	5129-MR Khondkar Ayaz Rabbani	BC001-S
a546b002-501c-4cd0-9db4-6dfaca8a4448	11:00:00	ST	0	29	1	Spring2021	ETE312	4199-DR Feroz Ahmed	BC6009-S
bfae0e3c-5a11-4608-94ac-ff135ded588a	15:30:00	T	0	4	1	Spring2021	ETE315L	4321-MR Emranul Haque	TelLab-S
bca3cdcb-41c4-4a2a-99b4-503d1764053e	11:00:00	MW	0	30	1	Spring2021	ETE322	4199-DR Feroz Ahmed	BC6013-S
7592dda2-eaf2-4c07-9aa7-a1ea1edff847	12:30:00	W	0	30	1	Spring2021	ETE322L	4275-MS Tahsin F. Ara Nayna	TelLab-S
a11bc16e-9265-455e-9cb0-a9e0e91c1578	08:00:00	MW	0	6	1	Spring2021	ETE323	4361-MR Shovasis Kumar Biswas	BC5012-S
5b71f07f-6a1c-43a5-9eca-029b9907ec34	08:00:00	T	0	6	1	Spring2021	ETE323L	4361-MR Shovasis Kumar Biswas	TelLab-S
6ff3362f-4e95-4bc0-8d2c-c684bb2b781a	12:30:00	ST	0	45	1	Spring2021	ETE331	4275-MS Tahsin F. Ara Nayna	BC6009-S
05b5c339-8cde-4132-883b-98a9ff38fcf0	12:30:00	M	0	27	1	Spring2021	ETE331L	4275-MS Tahsin F. Ara Nayna	TelLab-S
7bb5b3a3-5fb1-4737-938b-55ecdc8d64a8	15:30:00	S	0	24	2	Spring2021	ETE331L	4275-MS Tahsin F. Ara Nayna	TelLab-S
6e4943c5-51b4-4647-bf07-247e8aa5c9d5	09:30:00	MW	0	37	1	Spring2021	ETE411	4361-MR Shovasis Kumar Biswas	BC7016-S
610e0473-9092-4323-9814-43a6c705e1a1	09:30:00	T	0	11	1	Spring2021	ETE411L	4361-MR Shovasis Kumar Biswas	TelLab-S
76845d7c-df7f-4ff0-bb01-43694f54118b	08:00:00	ST	B-0	0	1	Spring2021	ETE413	T001-00 TBA TBA	BC5014-S
c557eb42-bc26-43c4-a889-47bce4d2f6d9	08:00:00	MW	0	4	1	Spring2021	ETE423	4287-MR Ali Ashraf Molla	BC5013-S
4c1be5b2-201b-4233-be64-707219320f83	09:30:00	ST	0	51	1	Spring2021	FIN201	3442-MR Anwar Zahid	BC2021-S
1cfbe90d-96ce-4f80-afb5-b313fe0ca3d7	11:00:00	MW	0	51	2	Spring2021	FIN201	3479-MS Zaima Ahmed	BC3002-S
aad21ea5-e241-4829-9c3a-47d924684905	17:00:00	ST	0	51	3	Spring2021	FIN201	3588-MR Md. Sajedul Islam	BC2012-S
991f7b62-75d7-4874-9454-ddb3d7bb2131	11:00:00	MW	0	51	4	Spring2021	FIN201	3344-MR Mohammad Fahad Noor	BC2011-S
46d443c7-37ac-48d6-862b-3eb41afbc621	14:00:00	MW	0	50	5	Spring2021	FIN201	3429-MS Jesmin Mannan	BC2011-S
4d7d73fd-00d9-4c49-984e-a38af838f8ca	12:30:00	MW	0	50	6	Spring2021	FIN201	3442-MR Anwar Zahid	BC2012-S
063aba98-be50-4502-98ff-d7f2df1c589f	09:30:00	MW	0	50	7	Spring2021	FIN201	3410-MS Tasneem Bareen Hasan	BC2020-S
a64c3234-a719-4c64-bf7a-fec031ca2848	15:30:00	MW	0	51	8	Spring2021	FIN201	3468-MS Sumaya Zesmin	BC2013-S
7450ff92-4ba9-44d2-8fe2-b65b998407d2	12:30:00	ST	0	49	1	Spring2021	FIN301	3442-MR Anwar Zahid	BC2012-S
fe345f3e-61e5-4dd6-b150-f912c4511413	11:00:00	MW	0	48	2	Spring2021	FIN301	3442-MR Anwar Zahid	BC2012-S
a8a207ae-67eb-4e0f-83e5-2cb7616c7074	17:00:00	MW	B-0	0	3	Spring2021	FIN301	T001-00 TBA TBA	BC3012-S
fe79c511-c1da-4232-aaa0-b0306e873ee0	11:00:00	ST	0	45	1	Spring2021	FIN302	3344-MR Mohammad Fahad Noor	BC2014-S
27ed2696-a3b6-4628-a16d-7978d0bd2263	12:30:00	MW	0	34	2	Spring2021	FIN302	3344-MR Mohammad Fahad Noor	BC2013-S
87180f56-9d34-4da1-ac4e-8bf83cee9756	09:30:00	ST	0	26	1	Spring2021	FIN305	3479-MS Zaima Ahmed	BC3008-S
8b4f0169-43e2-4c1b-9d12-193943cef7e7	09:30:00	MW	0	46	1	Spring2021	FIN401	3479-MS Zaima Ahmed	BC2021-S
4743f5cc-ac7a-42b0-a9ec-c596cc942456	17:00:00	ST	0	49	2	Spring2021	FIN401	3617-MR Anis A. Khan	BC3010-S
fe9795a7-6b28-4d77-a957-b78317d1a0bc	17:00:00	ST	0	46	1	Spring2021	FIN405	1747-MR Md. Rayatul Islam	BC3009-S
a82cc659-d475-449b-85e6-699c716338e9	17:00:00	ST	B-0	0	1	Spring2021	FIN440	T001-00 TBA TBA	BCTBA1-S
438ed5dd-d305-4edc-a328-c70c7628a0ab	12:30:00	ST	0	45	1	Spring2021	FIN460	3344-MR Mohammad Fahad Noor	BC2013-S
df4e79fa-f668-44f9-b810-4c4ca48b6d43	14:00:00	MW	0	40	2	Spring2021	FIN460	3229-DR Sarwar Uddin Ahmed	BC2012-S
448084cd-23b2-47d8-8aa9-3b7f6acb6981	08:00:00	ST	0	24	1	Spring2021	FIN461	3625-MR Md. Mehedi Hasan	BC8011-S
4df54688-50a6-4ae0-9acc-5c21a4e368ad	11:00:00	ST	0	35	1	Spring2021	FIN480	3479-MS Zaima Ahmed	BC4012-S
d2071d99-d9e2-4d49-852f-5381cbfcfad2	12:30:00	MW	B-0	0	2	Spring2021	FIN480	T001-00 TBA TBA	BCTBA2-S
9d1d28ec-956a-479c-a282-05b7f86051b5	08:00:00	MW	0	40	1	Spring2021	FRN101	2160-DR Rifat Rashid	BC8012-S
e614146d-0562-4457-8fdd-06fdb8192caf	09:30:00	MW	0	36	2	Spring2021	FRN101	2160-DR Rifat Rashid	BC8014-S
7c5cfb46-bb45-441a-ab4a-30e1a1e45307	08:00:00	ST	0	32	3	Spring2021	FRN101	2286-MR Mohammed Ataur Rahman	C2004-S
2bff749e-0db5-4c82-a325-34ff76de85a1	09:30:00	ST	0	35	4	Spring2021	FRN101	2286-MR Mohammed Ataur Rahman	BC8014-S
7d4e5656-4aca-476a-9806-ee2376af4d5b	09:30:00	ST	0	12	1	Spring2021	GSG101	2479-DR Marufa Akter	C2004-S
001c2597-a5bd-450a-99e8-8a3a6c6a2500	09:30:00	MW	0	14	2	Spring2021	GSG101	2213-MS Jessica Tartila Suma	C2004-S
9cea477a-a675-4bcc-8c61-f00bfcd0a59d	15:30:00	MW	0	5	3	Spring2021	GSG101	2462-MR Md. Ohidujjaman	BC8011-S
d1b38bba-7ff9-4fc9-b6d7-123e4791e069	15:30:00	ST	0	14	4	Spring2021	GSG101	2496-DR Shanawez Hossain	BC8011-S
18e9a3e7-0569-4d0d-9b91-eb7d832f0531	11:00:00	MW	0	12	5	Spring2021	GSG101	2480-MR Mohammad Ashab Uddin	C4005-S
3abdc733-1a98-4d3b-8114-a6119ec85567	11:00:00	ST	0	9	1	Spring2021	GSG102	2496-DR Shanawez Hossain	C5006-S
ca4197b0-7982-41f1-884c-1e06d56d29ae	12:30:00	ST	0	6	1	Spring2021	GSG202	2392-PROF Imtiaz A. Hussain	BC4014-S
d83b3533-cb50-4d41-a23d-82a1f06899ad	11:00:00	MW	0	3	1	Spring2021	GSG203	2504-MR Raian Hossain	C4004-S
20608c5a-0f7b-48b4-a77f-97f11a35d14f	12:30:00	MW	0	1	1	Spring2021	GSG210	2392-PROF Imtiaz A. Hussain	C3005-S
72782352-a7b2-46f6-a505-8d7474f1ef3d	17:00:00	MW	0	8	1	Spring2021	GSG220	2480-MR Mohammad Ashab Uddin	C3006-S
1b800049-ec23-472d-909e-091799ec2991	15:30:00	MW	0	3	1	Spring2021	GSG231	2496-DR Shanawez Hossain	C3004-S
10da045e-ca4e-40fa-93e9-c90feb479098	08:00:00	ST	0	1	1	Spring2021	GSG240	2213-MS Jessica Tartila Suma	C2006-S
b82f2f20-ea42-4894-b6eb-83812f5af20b	14:00:00	ST	0	4	1	Spring2021	GSG260	2392-PROF Imtiaz A. Hussain	C2005-S
463d6e43-4fee-48f2-b4fd-ad4af7c201d1	12:30:00	MW	0	6	1	Spring2021	GSG303	2213-MS Jessica Tartila Suma	C4005-S
0a2def75-a76d-4cd1-8d94-75c0d474f2f3	12:30:00	ST	0	1	1	Spring2021	GSG306	2462-MR Md. Ohidujjaman	C2002-S
403ab125-1ce2-4916-8e62-5aa317876d9c	12:30:00	MW	0	4	1	Spring2021	GSG321	2504-MR Raian Hossain	C4004-S
bdedfb52-1389-43b7-9324-b89027ad41f3	11:00:00	ST	0	2	1	Spring2021	GSG330	2462-MR Md. Ohidujjaman	C5007-S
f425cdb6-45c0-4cc8-994d-149a6f008194	14:00:00	MW	0	4	1	Spring2021	GSG430	2213-MS Jessica Tartila Suma	C2003-S
7f47d404-cf5f-4efa-b797-929173b0bdfa	11:00:00	MW	0	4	1	Spring2021	GSG450	2496-DR Shanawez Hossain	C3007-S
daf7c722-7f21-425f-ba59-526f70d82609	15:30:00	ST	0	4	1	Spring2021	GSG483	2504-MR Raian Hossain	C2006-S
6d5b8709-377a-4f43-8b6f-5e07747e10f2	14:00:00	ST	0	3	1	Spring2021	GSG484	2479-DR Marufa Akter	C3004-S
dfde729d-15e6-4724-8ea3-51a08500fc8e	11:00:00	ST	0	4	1	Spring2021	GSG492	2479-DR Marufa Akter	C6002-S
302acfb3-6642-450d-b132-b6ce1af8566b	11:00:00	MW	0	3	1	Spring2021	GSG497	2160-DR Rifat Rashid	C4002-S
d5d91c68-4559-45b7-b95a-943ac911c5d5	08:00:00	R	0	0	1	Spring2021	GSG498	2479-DR Marufa Akter	A4L04-S
a63571d2-683b-4b20-8486-79e970cd6f57	17:00:00	ST	0	1	1	Spring2021	GSG499	2392-PROF Imtiaz A. Hussain	BC001-S
f4b1b353-679d-43ba-accd-679bf207f188	17:00:00	MW	0	0	2	Spring2021	GSG499	2479-DR Marufa Akter	BC001-S
4e51ce5b-2f91-4383-a556-eee529938ddc	09:30:00	MW	0	35	1	Spring2021	HEA101	5519-DR Nafisa Huq	BC7026-S
47e9d8a1-84a3-4398-a07d-c56a43e503d9	11:00:00	ST	0	35	2	Spring2021	HEA101	5530-DR Shabareen Tisha	BC8011-S
b401113f-817b-499c-a44f-95c476ed000c	09:30:00	MW	0	35	3	Spring2021	HEA101	5530-DR Shabareen Tisha	BC8011-S
448f18e5-c63e-44ce-a042-c9855f81e0f9	11:00:00	MW	0	35	4	Spring2021	HEA101	5530-DR Shabareen Tisha	BC10014-S
d4c67014-2127-4035-94cf-0dd104448c26	12:30:00	MW	0	38	5	Spring2021	HEA101	5530-DR Shabareen Tisha	BC9014-S
825f19a1-931e-4959-b723-5e14498b5ed2	11:00:00	ST	0	28	6	Spring2021	HEA101	5591-DR Tasnuva Faruk	BC8012-S
2b99b5c2-d871-4ff7-bd94-0c2ac1bf4523	12:30:00	ST	0	28	7	Spring2021	HEA101	5591-DR Tasnuva Faruk	BC10014-S
22fff45a-f642-4a7a-ae71-3f40d1762fdf	11:00:00	MW	0	20	8	Spring2021	HEA101	5591-DR Tasnuva Faruk	BC10015-S
9e974468-900a-4d80-848a-91f0efa804f5	12:30:00	MW	0	29	9	Spring2021	HEA101	5591-DR Tasnuva Faruk	BC9017-S
f965d11e-09dd-46c1-ba80-f6591f1c3593	11:00:00	ST	0	39	10	Spring2021	HEA101	5528-MS Samia Aziz	BC8015-S
0061df3e-ec94-47d6-9948-aacb7683593f	08:00:00	ST	0	14	11	Spring2021	HEA101	5606-MR Rabiul Islam	BC10014-S
637a1a5b-eaf9-431f-947d-0071fbe57286	12:30:00	MW	0	0	12	Spring2021	HEA101	5528-MS Samia Aziz	BC10014-S
a1838d04-f651-449d-8674-cb0f4098d767	09:30:00	ST	0	19	13	Spring2021	HEA101	5606-MR Rabiul Islam	BC9014-S
1e949686-4460-4286-aa2f-c1748075702c	15:30:00	MW	0	17	14	Spring2021	HEA101	5606-MR Rabiul Islam	C4004-S
21abc10e-7832-46a5-b027-2e3cfc433c70	17:00:00	MW	B-0	0	15	Spring2021	HEA101	T001-00 TBA TBA	BC8015-S
5b1ce0cd-af49-469a-8c7d-af96b28160a2	08:00:00	ST	B-0	0	16	Spring2021	HEA101	5528-MS Samia Aziz	BC10018-S
ce36cd2b-8d1d-4c03-85eb-df387cae3722	11:00:00	MW	0	7	1	Spring2021	HEA202	5528-MS Samia Aziz	C6006-S
2126def4-6c69-450e-bc17-eaf40a003646	15:30:00	ST	0	50	1	Spring2021	HRM301	3444-DR Ikramul Hasan	BC2013-S
fea198b0-1b13-429c-a9c3-25f70b516bae	08:00:00	ST	0	50	2	Spring2021	HRM301	3413-MR Shafiqul Alam	BC2013-S
bfe4ccf1-91db-4692-89fe-d5cc7db7a1d5	09:30:00	ST	0	50	3	Spring2021	HRM301	3413-MR Shafiqul Alam	BC3009-S
7e1e825f-c762-4ea9-b2ac-1ff70b1b54e9	17:00:00	MW	0	50	4	Spring2021	HRM301	3629-MS Nabila Kamal Promy	BC2010-S
8b4eaf7e-ba18-4ecc-94da-7a7fdf020ab1	12:30:00	ST	0	51	5	Spring2021	HRM301	3569-MR Abdullah Al Ahad	BC2014-S
248c0844-f438-4c84-be4a-72738165e02e	15:30:00	MW	0	50	6	Spring2021	HRM301	3446-MS Bushra Sanjana	BC2014-S
3347684f-a402-4304-ba12-08d04d8214a8	17:00:00	MW	0	51	7	Spring2021	HRM301	3446-MS Bushra Sanjana	BC2011-S
1c0ee9f8-2093-4fb9-94e4-0fb0a2546786	11:00:00	ST	0	54	1	Spring2021	HRM360	3569-MR Abdullah Al Ahad	BC2020-S
33193103-a8aa-4ac5-8313-97b83903da17	08:00:00	MW	0	58	2	Spring2021	HRM360	3254-DR A.N.M. Shibly Noman Khan	BC2012-S
16c94755-9cda-448c-a73d-1b56f5cdef7c	15:30:00	ST	0	56	1	Spring2021	HRM370	3446-MS Bushra Sanjana	BC2014-S
f6d0b76d-c78e-45f6-a707-f4836114b5a2	08:00:00	ST	0	57	2	Spring2021	HRM370	3254-DR A.N.M. Shibly Noman Khan	BC2014-S
b237005d-692c-48e6-b8bd-62f8f6a6a29c	17:00:00	ST	0	55	1	Spring2021	HRM380	3446-MS Bushra Sanjana	BC2013-S
32ec53ad-50b0-4552-b529-a7d20c6b19fc	15:30:00	MW	0	55	2	Spring2021	HRM380	3413-MR Shafiqul Alam	BC2020-S
d8534608-22ce-4b8c-9b84-99787e51df24	09:30:00	MW	0	53	1	Spring2021	HRM390	3254-DR A.N.M. Shibly Noman Khan	BC3008-S
e9b5e0ff-6ba9-4c23-8b6c-835cfcdb38ad	17:00:00	ST	0	53	2	Spring2021	HRM390	3569-MR Abdullah Al Ahad	BC2014-S
0e3db68c-371b-4514-a4cf-762ed34f9762	14:00:00	MW	0	62	1	Spring2021	HRM430	3444-DR Ikramul Hasan	BC2013-S
06fffa23-dc0b-4643-844a-b0cee26c7472	17:00:00	MW	0	50	1	Spring2021	HRM460	3403-MR Awal Al Kabir	BC2012-S
65e13315-291f-4c6a-831b-a66a0644197d	12:30:00	MW	0	53	2	Spring2021	HRM460	3413-MR Shafiqul Alam	BC2014-S
15ba6806-8bcc-4c71-ba1e-442d4876ce57	11:00:00	ST	0	40	1	Spring2021	INB301	3539-MR SM Yusuf Mallick	BC2021-S
620a3272-3fa7-437d-a74e-5ce2bbc9902e	08:00:00	ST	0	38	2	Spring2021	INB301	3193-MR Hanif Mahtab	BC2020-S
41b3321c-4be7-4093-be7d-55f781a63d26	12:30:00	MW	0	40	3	Spring2021	INB301	3486-MR Hasan Md. Mahmood Ul Haque	BC2020-S
e29604c1-47d9-4256-98a5-289ae8108fe6	14:00:00	MW	0	40	4	Spring2021	INB301	3448-MR Mehadi Mansur	BC2014-S
927983a4-b565-48db-9827-39f8f0d3db9d	14:00:00	ST	0	40	5	Spring2021	INB301	3512-MR Kazi Md. Jamshed	BC2013-S
ee798e6f-1b46-413a-a831-6d4cac1507ff	15:30:00	MW	0	33	6	Spring2021	INB301	3548-MS Papia Sultana	BC2021-S
d65579c3-e07c-4ec9-994f-48b41c9b86df	15:30:00	ST	0	41	7	Spring2021	INB301	3486-MR Hasan Md. Mahmood Ul Haque	BC2020-S
bf545b96-20de-49f2-95d0-f24e772f60bb	08:00:00	MW	0	11	8	Spring2021	INB301	3299-MR Latiful Khabir	BC2013-S
60f3f820-2e18-4e15-82ef-dc148d7f8156	17:00:00	MW	0	18	9	Spring2021	INB301	3584-MS Dhritiparna Kundu	BC2013-S
b68d191d-9315-4384-8ac8-e29409de36c0	11:00:00	MW	0	44	1	Spring2021	INB302	3539-MR SM Yusuf Mallick	BC3008-S
d3d25e33-ff19-474e-bbb6-908c5133437c	09:30:00	ST	0	44	2	Spring2021	INB302	3193-MR Hanif Mahtab	BC7015-S
1ebd43f2-d661-4257-9e97-09c8dd6ba7f5	12:30:00	ST	0	40	1	Spring2021	INB303	3539-MR SM Yusuf Mallick	BC3008-S
99450fc9-b300-424f-b127-7a9ecb600316	09:30:00	MW	0	26	2	Spring2021	INB303	3486-MR Hasan Md. Mahmood Ul Haque	BC3011-S
2389df96-9846-4b68-9b81-8974348f735b	11:00:00	ST	0	49	1	Spring2021	INB304	3567-DR Raisul Awal Mahmood	BC2009-S
a66ead47-a153-4df1-95db-7c3fdaa99bf4	14:00:00	MW	0	6	2	Spring2021	INB304	3567-DR Raisul Awal Mahmood	BC3009-S
3bac61de-2200-472e-af81-2fdc7cfc9442	09:30:00	ST	0	52	1	Spring2021	INB403	3601-MR Md. Touhid Hossain	BC2009-S
3e232cd0-8712-492b-832c-66c95c62e4ee	12:30:00	ST	B-0	0	2	Spring2021	INB403	T001-00 TBA TBA	BC3009-S
4dc0fb5c-b13f-4160-8cfa-023b86753af6	15:30:00	MW	0	45	1	Spring2021	INB405	3423-MR Arifur Rahman Khan	BC3008-S
c4f5da1f-22aa-4429-ae44-64d2d0662478	12:30:00	ST	0	20	1	Spring2021	ITC103	2391-MS Nabila Tahsin Farah	C9002-S
0177ff1d-0e96-4845-b8ba-e18e5ba16ba1	15:30:00	ST	0	20	2	Spring2021	ITC103	2391-MS Nabila Tahsin Farah	C9002-S
6b5d7c70-a6d4-440c-bbd7-46385bfcc019	15:30:00	ST	0	30	1	Spring2021	LAW101	2445-MR Md Abdul Awal Khan	C4005-S
43c21a2a-eaea-4635-8eb1-f7b03d87e315	12:30:00	ST	0	29	2	Spring2021	LAW101	2445-MR Md Abdul Awal Khan	C5004-S
a5494521-16f9-4970-a50f-f2c299a54332	12:30:00	MW	0	24	1	Spring2021	LAW102	2391-MS Nabila Tahsin Farah	C9002-S
69083889-b791-4e76-a2b4-d347a7af185c	14:00:00	MW	B-0	0	2	Spring2021	LAW102	2391-MS Nabila Tahsin Farah	C9002-S
3da79109-9da7-4f0a-8dc9-f31a1e3bcbfb	09:30:00	ST	0	21	1	Spring2021	LAW103	2501-MR Md. Al Ifran Hossain Mollah	C2007-S
1e1ab3fd-0059-4f67-8cc9-47591c764d2b	14:00:00	MW	0	19	1	Spring2021	LAW105	2433-DR Md. Mahbubur Rahman	C2007-S
211bc618-be4b-465c-a87f-328ee4e58704	15:30:00	MW	B-0	0	2	Spring2021	LAW105	T001-00 TBA TBA	C5002-S
1c1bd9a8-3bca-4426-87de-2f6af83d6dea	11:00:00	MW	0	20	1	Spring2021	LAW106	2500-DR Zahidul Islam	C4003-S
ab7b334d-c37d-45d5-8288-8776ca0f1415	14:00:00	MW	0	19	1	Spring2021	LAW107	5271-DR Arif Jamil	C3002-S
af150d4b-3743-42e0-95c1-d519bcc2dfa4	15:30:00	MW	0	7	2	Spring2021	LAW107	5271-DR Arif Jamil	C3002-S
6e67cd3b-6a4d-4463-bc6f-8da556d91048	11:00:00	MW	B-0	0	1	Spring2021	LAW108	T001-00 TBA TBA	A4L04-S
e00279c0-d0c7-40d6-8a08-a32d78d9c9f5	15:30:00	MW	0	13	1	Spring2021	LAW202	2500-DR Zahidul Islam	C3005-S
be515870-4244-4d86-aabe-7a46237e2126	12:30:00	ST	0	21	1	Spring2021	LAW203	2501-MR Md. Al Ifran Hossain Mollah	C2003-S
3075a9ae-8bbe-4d52-8e89-20c96c365c76	14:00:00	MW	0	14	2	Spring2021	LAW203	2502-MS Afroza Bilkis	C4002-S
7f90cd9d-215d-4915-a689-c700bf84a86f	09:30:00	ST	0	18	1	Spring2021	LAW204	2459-DR Assaduzzaman	C3002-S
40d2028b-f973-4835-9c54-4157537e05c9	12:30:00	ST	B-0	0	1	Spring2021	LAW205	T001-00 TBA TBA	BC001-S
cd01800b-0b4e-4b6c-a66f-85e1f7ce8211	14:00:00	MW	0	8	1	Spring2021	LAW206	2445-MR Md Abdul Awal Khan	C3006-S
74750daa-35dc-4958-bd15-4ac6fe51ce02	11:00:00	ST	B-0	0	1	Spring2021	LAW207	T001-00 TBA TBA	BCTBA1-S
6151518e-6011-40bd-a3c5-a7aefb515ab5	14:00:00	ST	0	18	1	Spring2021	LAW208	2501-MR Md. Al Ifran Hossain Mollah	C3005-S
ffc53e9a-549e-46de-bba8-58df792e3019	11:00:00	ST	0	19	1	Spring2021	LAW209	2503-MR Nuran Choudhury Choudhury	C9002-S
d36a679f-891c-424c-9ab3-e0196d27e4b4	11:00:00	ST	0	16	2	Spring2021	LAW209	2428-DR Md Parvez Sattar	C6006-S
9f360f5c-fcd4-4ab1-bc78-7ef35debe567	09:30:00	MW	0	6	1	Spring2021	LAW301	2428-DR Md Parvez Sattar	C3007-S
af957194-5006-4223-ab9a-bc7d436ba74f	09:30:00	ST	0	16	1	Spring2021	LAW302	2428-DR Md Parvez Sattar	C3003-S
2d738a06-840c-44c7-910d-9412ec6295c5	09:30:00	MW	0	18	1	Spring2021	LAW303	2459-DR Assaduzzaman	C4002-S
99182631-33e6-4601-9a5e-4e789a9d96cc	15:30:00	ST	0	2	1	Spring2021	LAW304	2503-MR Nuran Choudhury Choudhury	C2007-S
34beab04-87a8-40dc-ad55-332da1462cc6	17:00:00	MW	0	6	1	Spring2021	LAW305	2503-MR Nuran Choudhury Choudhury	C2004-S
07b21579-4199-47fc-9fed-d805571192ec	11:00:00	MW	0	18	1	Spring2021	LAW307	2503-MR Nuran Choudhury Choudhury	C4007-S
c20cd105-f7b9-4cc6-961a-3c3ddf8c4a3d	14:00:00	MW	B-0	0	1	Spring2021	LAW308	T001-00 TBA TBA	C3003-S
f3b69469-b259-47dc-9757-56c903a5b827	12:30:00	MW	0	20	1	Spring2021	LAW309	2501-MR Md. Al Ifran Hossain Mollah	C2002-S
d2553c05-5126-47b9-9df8-758da905ab71	17:00:00	ST	0	20	1	Spring2021	LAW402	2391-MS Nabila Tahsin Farah	C2003-S
2637189c-e856-4e38-8d17-968ee698dc26	14:00:00	ST	0	17	1	Spring2021	LAW404	2500-DR Zahidul Islam	C4004-S
14fb27b0-01eb-4a6f-ad18-203b7560c2a3	15:30:00	ST	B-0	0	2	Spring2021	LAW404	T001-00 TBA TBA	C3002-S
b2a6c76e-a0c1-44f4-aa85-13f1d90cf791	09:30:00	MW	0	13	1	Spring2021	LAW407	2445-MR Md Abdul Awal Khan	C4007-S
76b3ccd5-8dfa-4d26-ac90-3772480f37db	14:00:00	ST	0	20	1	Spring2021	LEL102	2502-MS Afroza Bilkis	C9002-S
9bcd5b26-d546-4844-bcb1-14d207e32183	11:00:00	MW	0	21	2	Spring2021	LEL102	2459-DR Assaduzzaman	C9002-S
815e498b-694d-4e7f-9335-00db0a20a8b3	08:00:00	R	0	40	1	Spring2021	LFE201	5207-MR Tanvir Ahmed Haroon	FT-S
004f0510-f787-4a1c-aea6-048677056693	09:30:00	R	0	40	2	Spring2021	LFE201	6064-MR Md. Daud Hossain Khan	FT-S
5d812c39-ad51-4a0a-ae23-89218ece38cf	11:00:00	R	0	40	3	Spring2021	LFE201	3563-MR Mohammed Naveed Siddiquee	FT-S
c34d6ddc-db58-41c6-b742-10a3c44551e3	12:30:00	R	0	40	4	Spring2021	LFE201	3423-MR Arifur Rahman Khan	FT-S
4cc6c9c4-871d-402b-aad1-0f1a169f0f83	14:00:00	R	0	8	5	Spring2021	LFE201	3318-MR Suman Prosad Saha	FT-S
8e24b163-1721-43ab-a67e-c71f2afd727e	15:30:00	R	0	7	6	Spring2021	LFE201	4360-MR Mohammad Nasfikur Rahman Khan	FT-S
67bcb87a-8485-40a4-b0b8-a98d94077015	17:00:00	R	0	7	7	Spring2021	LFE201	5519-DR Nafisa Huq	FT-S
9d42da64-7e6c-4e41-9541-3b40c92ea5e7	18:30:00	R	0	7	8	Spring2021	LFE201	5519-DR Nafisa Huq	FT-S
4087e1c9-c7e3-4425-b61a-8a3ffac03fa4	14:00:00	ST	0	6	1	Spring2021	LIN311	2106-MR Towhid Bin Muzaffar	BC4013-S
2f983d45-2b1d-478b-827a-cd19d3aa0a7b	09:30:00	ST	0	4	1	Spring2021	LIN313	2132-MS Rezina Nazneen Rimi	C4003-S
4f85c11c-86d7-4c0f-bc6a-d8b7620f0fc2	15:30:00	ST	0	5	1	Spring2021	LIN411	2439-MR Adilur Rahman	C2002-S
f6e17f1f-c365-4fe8-952b-90e70c2fed6e	12:30:00	ST	0	35	1	Spring2021	MAT100	4423-MS Nabila Jaman Tripti	BC5012-S
a8a402a9-eba7-497d-b957-910783b900ef	11:00:00	ST	0	24	2	Spring2021	MAT100	4423-MS Nabila Jaman Tripti	BC5012-S
1071cf0e-c3b4-49b7-836a-3541d85c0594	11:00:00	MW	0	14	1	Spring2021	MAT100A	4430-MR Ifte Khairul Alam Bhuiyan	BC5012-S
1b400b0f-979f-4505-b5e8-f463433ce7b4	17:00:00	ST	0	50	1	Spring2021	MAT101	4255-MS Zainab Lutfun Nahar	BC5012-S
26124cc7-98b1-4aaf-8f6a-4e75ebbee611	17:00:00	MW	0	51	2	Spring2021	MAT101	4358-MR Mustafa Mohammad Shaky	BC5012-S
c2c40fd7-1df4-4b40-99a2-e0fd85f68bfd	11:00:00	MW	0	52	3	Spring2021	MAT101	4411-MS Fauzia Hoque Shorna	BC5013-S
94ea98b2-ef0f-485c-9f36-71bfc28877d8	11:00:00	ST	0	51	4	Spring2021	MAT101	4327-MS Amrita Khan	BC5013-S
a2cbfa13-8259-4315-9652-9788960cb47f	14:00:00	MW	0	53	5	Spring2021	MAT101	4327-MS Amrita Khan	BC5012-S
d12684a7-bd04-4572-9cf3-9919e4d83c40	09:30:00	MW	0	52	6	Spring2021	MAT101	4430-MR Ifte Khairul Alam Bhuiyan	BC5012-S
e2a0b7f3-85ef-4b5d-9bef-c47469066ae3	12:30:00	MW	0	51	7	Spring2021	MAT101	4423-MS Nabila Jaman Tripti	BC5012-S
aa636b8f-64b1-4078-b43c-1c65de732b2c	11:00:00	MW	0	51	8	Spring2021	MAT101	4423-MS Nabila Jaman Tripti	BC5014-S
764dafa3-c100-41c4-a71c-5f8f37dd0bd5	09:30:00	ST	0	43	9	Spring2021	MAT101	4430-MR Ifte Khairul Alam Bhuiyan	BC5012-S
c9b967d6-74d7-4f8b-b8f0-73755e900846	14:00:00	ST	B-0	0	10	Spring2021	MAT101	T001-00 TBA TBA	BC5012-S
8a3da38e-66d4-4ad7-96d0-bf96791e69f2	14:00:00	ST	0	22	1	Spring2021	MAT104	4378-DR Md. Readul Mahmud	BC5002-S
74206619-e279-4022-bae0-771ec3625b64	09:30:00	ST	0	17	2	Spring2021	MAT104	4378-DR Md. Readul Mahmud	BC5013-S
ec4ddf39-3cc1-4ef4-a8fc-5ef0e51ee53d	09:30:00	MW	0	31	3	Spring2021	MAT104	4250-DR Asma Begum	BC5013-S
a0cc8844-8541-45b3-bb3b-390664a388b5	12:30:00	ST	0	42	4	Spring2021	MAT104	4419-MS Nurjahan Akter Nepa	BC5013-S
e19ad8d7-86b6-4c5f-829d-f72884cab75f	12:30:00	MW	0	34	5	Spring2021	MAT104	4419-MS Nurjahan Akter Nepa	BC5013-S
2da94488-eb5d-4b8d-8227-67da8acb8480	11:00:00	MW	0	36	6	Spring2021	MAT104	4119-MS Dr. Rifat Ara Rouf	BC6007-S
a4908dde-32f0-48d8-a656-41a1bc759ee6	11:00:00	ST	0	27	1	Spring2021	MAT111	4419-MS Nurjahan Akter Nepa	BC5014-S
d4493379-334d-4756-8548-051ac903923f	09:30:00	ST	0	48	1	Spring2021	MAT121	4102-DR Mohammed Anwer	BC6008-S
7629f0d1-2990-4239-a561-340bfc57ec5b	11:00:00	ST	0	51	2	Spring2021	MAT121	4124-DR Shipra Banik	BC6008-S
daa6ea36-8072-4104-ad5c-cf8cc1725500	09:30:00	MW	0	51	3	Spring2021	MAT121	4246-MS Proma Anwar Khan	BC6008-S
2b1955be-5ed3-493c-ae57-406d27a420ae	11:00:00	MW	0	55	4	Spring2021	MAT121	4325-MR Nur Elahi Razin	BC6009-S
7cc17966-05bf-46e7-b2ca-01a3ed7e2bdb	11:00:00	MW	0	2	1	Spring2021	MAT125	4419-MS Nurjahan Akter Nepa	C5006-S
f7bd62d1-3dc9-4f87-9439-59b2c47b0dd5	15:30:00	ST	0	50	1	Spring2021	MAT131	4431-DR Mohammad Nazrul Islam	BC5012-S
c7798cc6-d0e0-4df4-a6e9-f81d0ca3beb4	09:30:00	MW	0	55	1	Spring2021	MAT203	4454-DR Jewel Kumar Ghosh	BC5014-S
cfe4bf88-b396-491a-8f87-d08d77c4d418	09:30:00	ST	0	55	2	Spring2021	MAT203	4119-MS Dr. Rifat Ara Rouf	BC5014-S
c4ef6708-cf06-4a28-b59f-afa9d95dae6d	09:30:00	MW	0	55	3	Spring2021	MAT203	4322-PROF Nilufar Farhat Hossain	BC5002-S
a7d58a6e-6f18-46bd-be08-84d51979767e	12:30:00	ST	0	31	1	Spring2021	MAT210	4312-MS Purobi Rani Kundu	BC5014-S
782df723-a548-4214-974e-5b292ffd3cb4	09:30:00	MW	0	53	1	Spring2021	MAT211	4384-DR S N M Azizul Hoque	BC6007-S
4331719b-c631-4d10-bb25-d75d39864c5a	11:00:00	ST	0	53	2	Spring2021	MAT211	4246-MS Proma Anwar Khan	BC6007-S
f4bf7540-0d1b-4721-9793-82b9cc0fa6a4	11:00:00	MW	0	53	3	Spring2021	MAT211	4246-MS Proma Anwar Khan	BC6008-S
c77f3b43-e1fd-4423-be7a-39b6c7f635fe	14:00:00	ST	0	51	4	Spring2021	MAT211	4124-DR Shipra Banik	BC5014-S
f759d428-0094-44be-8a81-0e9b095fa945	14:00:00	MW	0	52	5	Spring2021	MAT211	4124-DR Shipra Banik	BC5013-S
0167a792-7efa-444d-8d72-7966c9a6f332	09:30:00	ST	0	53	6	Spring2021	MAT211	4246-MS Proma Anwar Khan	BC6007-S
1dc6bfc6-3a92-4ba0-b316-0c0e14658b82	12:30:00	MW	0	52	7	Spring2021	MAT211	4358-MR Mustafa Mohammad Shaky	BC5014-S
15a6dd57-6fec-4967-adec-321a59e2a148	12:30:00	ST	0	53	8	Spring2021	MAT211	4384-DR S N M Azizul Hoque	BC6007-S
70476517-d4f2-4d04-82dd-e26b6fbefa1e	09:30:00	MW	0	24	1	Spring2021	MAT213	4308-PROF Laek Sazzad Andallah	BC6009-S
2586162b-4f73-4145-8a6b-db4321f51866	17:00:00	MW	0	11	1	Spring2021	MAT221	4310-PROF Md. Abu Naim Sheikh	BC5013-S
e367bab5-559f-4cd4-8a80-04b66c53c76c	09:30:00	MW	0	48	1	Spring2021	MAT230	4102-DR Mohammed Anwer	BC6012-S
54a0b7f9-d441-45a0-b538-3d8d855acb02	12:30:00	ST	0	55	2	Spring2021	MAT230	4119-MS Dr. Rifat Ara Rouf	BC6008-S
8754f461-6672-4929-a1bc-bbdec14ce1db	17:00:00	MW	0	9	1	Spring2021	MAT251	4223- Mr. Md. Shariful Islam	BC6008-S
8fca2679-5880-41b3-90ba-72c2483795b5	14:00:00	MW	0	2	1	Spring2021	MAT453	4228-DR Habib Bin Muzaffar	C2002-S
c5062371-635f-4437-8700-804bcf9cd86e	11:00:00	ST	0	9	1	Spring2021	MAT461	4338-PROF M Arshad Momen	C3003-S
05ce1113-988f-4cb7-b7b9-59afb0f139e8	08:00:00	A	0	1	1	Spring2021	MAT499	4228-DR Habib Bin Muzaffar	BC5012-S
65ec012f-787f-4f39-bf40-8b58b8f9a723	09:30:00	ST	0	6	1	Spring2021	MCB101	6010-MS Tasnimul Ferdous	C3006-S
59e14630-1778-4b6b-be93-22635ed5171e	14:00:00	MW	0	12	1	Spring2021	MCB102	6036-MS Nazratun Nayeem Choudhury	BC4017C-S
e408cea5-e487-49a0-b0a7-44e4826ec101	12:30:00	MW	0	9	1	Spring2021	MCB103	6002-MR Syed A. K. Shifat Ahmed	BC4014-S
c7f21ee9-0a30-40ba-9b10-488cca34bdd5	12:30:00	R	0	9	1	Spring2021	MCB103L	6002-MR Syed A. K. Shifat Ahmed	BC4017B-S
6d7b4b39-6946-4709-860c-cad70b4ad37b	15:30:00	MW	0	21	1	Spring2021	MCB201	6055-DR Rashed Noor	BC10017-S
a37678d4-95bb-4d9a-b414-bf2fdef9e9e5	15:30:00	ST	0	14	1	Spring2021	MCB202	6070-MR Salman Khan Promon	BC9016-S
870f4ca9-c902-4884-993e-6e2b9a6158f2	17:00:00	MW	0	10	1	Spring2021	MCB210	6010-MS Tasnimul Ferdous	BC9016-S
93ba70b1-7e07-432c-9b60-e867b898cc71	17:00:00	ST	0	0	1	Spring2021	MCB302	6033-DR Jebunnahar Khandakar	BC9016-S
820bb537-c900-4f5b-a992-c2b856c0ce5e	12:30:00	MW	0	12	1	Spring2021	MCB303	6010-MS Tasnimul Ferdous	C3004-S
a3ad2f0a-5f31-451f-b3a2-4ea7d5ead472	14:00:00	R	0	12	1	Spring2021	MCB303L	6010-MS Tasnimul Ferdous	BC4017B-S
88f1216e-ef7e-4743-8dab-4bd5a3ab7628	14:00:00	ST	0	13	1	Spring2021	MCB305	6010-MS Tasnimul Ferdous	BC9015-S
a9411b44-3d6a-4f5c-b8b1-6f6bfb532318	11:00:00	ST	0	9	1	Spring2021	MCB306	6002-MR Syed A. K. Shifat Ahmed	C3007-S
8c036fc2-98d2-48fe-8e27-fce0689a980d	17:00:00	MW	0	18	1	Spring2021	MCB308	6055-DR Rashed Noor	BC10018-S
27ccb996-d670-4494-9c0b-788a30833923	12:30:00	ST	0	14	1	Spring2021	MCB310	6013-MS Noshin Azra Rahman	BC10017-S
ff164e8b-7fa3-4a37-8dd0-c82f6bfd15fb	15:30:00	MW	0	13	1	Spring2021	MCB311	6010-MS Tasnimul Ferdous	BC4017A-S
a2c53642-19a4-4c85-946b-bd51e4f1d378	11:00:00	MW	0	8	1	Spring2021	MCB401	6013-MS Noshin Azra Rahman	C2003-S
ba8701ff-db34-4b03-88ba-27c11e137ff8	14:00:00	MW	0	10	1	Spring2021	MCB402	6033-DR Jebunnahar Khandakar	BC9016-S
5421460d-3039-43f1-a063-aacee075a97a	09:30:00	MW	0	9	1	Spring2021	MCB403	6033-DR Jebunnahar Khandakar	C2007-S
5f39c654-8918-41c6-852f-73326c9cf849	14:00:00	ST	0	14	1	Spring2021	MCB404	6013-MS Noshin Azra Rahman	BC9016-S
4bc5e508-bb1a-414d-a464-af9a9b04494e	15:30:00	ST	0	10	1	Spring2021	MCB406	6009-DR Ashrafus Safa	BC10017-S
4412d6dc-f772-42df-91e9-79ceb0f5a1dd	11:00:00	ST	0	10	1	Spring2021	MCB407	6009-DR Ashrafus Safa	C4002-S
de343dc2-63fe-4b2b-ab60-2edb9500d263	09:30:00	ST	0	15	1	Spring2021	MCB410	6002-MR Syed A. K. Shifat Ahmed	C3007-S
67f063fe-b800-46e8-82fe-1f826a766175	09:30:00	MW	0	14	2	Spring2021	MCB410	6070-MR Salman Khan Promon	BC4017A-S
ced5f194-68dc-4e60-84be-1915e3c8b096	17:00:00	ST	0	13	1	Spring2021	MCB411	6013-MS Noshin Azra Rahman	BC4017A-S
9fef6760-b2fa-4e4b-816f-1dac7e31ab7b	08:00:00	ST	B-0	0	1	Spring2021	MCB450	T001-00 TBA TBA	C2003-S
7063cb28-8199-4254-8880-077b92824cdb	17:00:00	ST	B-0	0	2	Spring2021	MCB450	T001-00 TBA TBA	BC10017-S
157ce2b3-9184-48f1-8b63-80484f295071	17:00:00	MW	B-0	0	3	Spring2021	MCB450	T001-00 TBA TBA	BC10017-S
f3cc179a-8e03-415b-af3b-389701d0f74c	11:00:00	F	0	2	4	Spring2021	MCB450	6054-DR Sabrina Moriom Elias	BC4017A-S
5fcf33a7-f168-47fc-ab11-68806b68e3a1	11:00:00	F	0	1	5	Spring2021	MCB450	6064-MR Md. Daud Hossain Khan	BC4017B-S
059be58c-50d8-4b69-bb08-e947981b7947	11:00:00	F	0	2	6	Spring2021	MCB450	6055-DR Rashed Noor	BC4017C-S
7cdee955-bf5f-4bd4-8ac6-4d47109957ea	13:40:00	F	0	2	7	Spring2021	MCB450	6002-MR Syed A. K. Shifat Ahmed	BC4017A-S
23360663-91e8-47b7-87b9-a1687938a17b	13:40:00	F	0	1	8	Spring2021	MCB450	6073-MR Aftab Uz Zaman Noor	BC4017B-S
1d744bd5-4d15-4ba1-8a99-8806629035be	15:20:00	F	0	1	9	Spring2021	MCB450	6036-MS Nazratun Nayeem Choudhury	BC4017A-S
fbb907b0-da75-40d4-a437-c2962558176b	15:20:00	F	0	1	10	Spring2021	MCB450	T001-00 TBA TBA	BC4017B-S
3abd696e-2f92-4d1b-86e9-7343dc330f54	08:00:00	F	B-0	0	11	Spring2021	MCB450	T001-00 TBA TBA	BC4017A-S
ebe706e6-4f8d-4f04-9c12-48977bad0065	08:00:00	F	B-0	0	12	Spring2021	MCB450	T001-00 TBA TBA	BC4017B-S
185d8547-b65e-4be9-903c-ba677ebb3619	12:30:00	F	B-0	0	13	Spring2021	MCB450	T001-00 TBA TBA	BC4017C-S
be91fe51-8b91-4a0f-acc7-de91901eb84e	12:30:00	F	B-0	0	14	Spring2021	MCB450	T001-00 TBA TBA	BC4017D-S
5c49172d-9baf-4a6c-b9f8-01b72789173f	08:00:00	R	0	2	1	Spring2021	MCB451	6055-DR Rashed Noor	BC4017B-S
af5dfa0f-a720-4e96-919f-6e5e6ce54bff	08:00:00	R	0	3	2	Spring2021	MCB451	6033-DR Jebunnahar Khandakar	BC4017C-S
ebccbd36-b492-4963-96f6-276d6400ca3d	11:00:00	A	0	0	3	Spring2021	MCB451	6002-MR Syed A. K. Shifat Ahmed	BC4017B-S
f167cef5-9489-43ed-b7a8-9bf6af669084	11:00:00	A	B-0	0	4	Spring2021	MCB451	T001-00 TBA TBA	BC4017C-S
735b1cc5-1ee3-433f-b0be-71fff2244d24	13:40:00	A	B-0	0	5	Spring2021	MCB451	T001-00 TBA TBA	BC4017A-S
083df5d5-f0eb-4e79-a316-2cc31b768467	13:40:00	A	B-0	0	6	Spring2021	MCB451	T001-00 TBA TBA	BC4017B-S
37097162-0efe-4463-a81e-b22ea56ead69	08:00:00	MW	0	47	1	Spring2021	MGT201	3251-MS Farzana Chowdhury	BC2014-S
aa07c71e-4580-4140-a77f-e41693f9003d	11:00:00	MW	0	47	2	Spring2021	MGT201	3251-MS Farzana Chowdhury	BC2013-S
12d8c60c-c09c-4705-a1cd-76131ae77c19	12:30:00	ST	0	48	3	Spring2021	MGT201	3428-DR Dr. Nazmunnessa Mahtab	BC2020-S
eb5c5161-9beb-4c6a-8f9c-42f84d2e5d10	15:30:00	MW	0	47	4	Spring2021	MGT201	3358-MR Mr. Iftekhar Mahfuz	BC3009-S
b9d15971-9d88-4ec0-a341-8ce1763f2bc9	14:00:00	ST	0	47	5	Spring2021	MGT201	3428-DR Dr. Nazmunnessa Mahtab	BC2014-S
ef934170-4c99-4994-b59a-dbe858ba4043	09:30:00	MW	0	47	6	Spring2021	MGT201	3525-MS Afnan Ashfaque	BC3009-S
656149ed-a307-4d0c-ac60-80a28aa24dcf	17:00:00	MW	0	47	7	Spring2021	MGT201	3323-MS Qantara Khaleda Khan	BC2014-S
79f086ad-3a8c-48e5-9313-902e2eef2c77	15:30:00	ST	0	47	8	Spring2021	MGT201	3251-MS Farzana Chowdhury	BC2021-S
d3ebcc38-c02d-4eb0-af34-2fb21df1de19	17:00:00	ST	0	49	1	Spring2021	MGT330	3573-DR Ziaul Haq Adnan	BC10018-S
9eed9ce1-0668-43a6-aba9-50cd8f2d7c34	17:00:00	MW	0	48	2	Spring2021	MGT330	3606-DR Md. Kharshiduzzaman	BC2020-S
48c7b365-60c5-4b18-a36a-7c8af191a887	11:00:00	ST	0	48	3	Spring2021	MGT330	3579-MS Seeratus Sabah	BC3008-S
38f75dd9-4a48-4bb9-b321-9088a1916e27	09:30:00	ST	0	48	4	Spring2021	MGT330	3615-DR Md. Mamun Habib	BC3010-S
2605117b-a2c4-4bee-a244-e5e3403b3c96	08:00:00	MW	0	48	5	Spring2021	MGT330	3573-DR Ziaul Haq Adnan	BC2020-S
2c59ceab-8166-4a73-b167-1588df59136b	11:00:00	MW	0	50	6	Spring2021	MGT330	3135-DR Abul Bashar	BC2014-S
baf5aafa-20a2-4f36-b60c-ef623a25cf49	12:30:00	MW	0	31	1	Spring2021	MGT380	3358-MR Mr. Iftekhar Mahfuz	BC4010-S
5d955454-50b3-40ff-9498-14fdf4954d2f	09:30:00	ST	0	30	1	Spring2021	MGT401	3525-MS Afnan Ashfaque	C2005-S
716c6769-26f1-42a7-9015-02ca89aa5484	09:30:00	MW	0	42	1	Spring2021	MGT405	3573-DR Ziaul Haq Adnan	BC4011-S
6106a95c-6b00-445f-aa8b-6f80f9c5db2f	11:00:00	ST	0	42	1	Spring2021	MGT490	3525-MS Afnan Ashfaque	BC3009-S
6a6d304c-d4d4-4348-be0e-0ee88f17a0b5	17:00:00	MW	0	45	2	Spring2021	MGT490	3358-MR Mr. Iftekhar Mahfuz	BC2021-S
82ca4b15-b0f7-408b-8197-6cd052abb165	11:00:00	MW	0	27	3	Spring2021	MGT490	3513-PROF Dr. Aminul Karim	BC2020-S
debf0967-c169-44ed-ab2c-133bdbb183d1	14:00:00	ST	0	14	4	Spring2021	MGT490	3299-MR Latiful Khabir	BC2020-S
fd00ba36-6718-4883-bb10-81c9e58adf06	12:30:00	ST	0	11	5	Spring2021	MGT490	3486-MR Hasan Md. Mahmood Ul Haque	BC2021-S
dbfbc132-ee8c-4b75-a938-3075a10fcb70	14:00:00	MW	0	18	6	Spring2021	MGT490	3403-MR Awal Al Kabir	BC2020-S
7715172a-cbaf-4360-83ac-2989df9c0f43	09:30:00	MW	0	37	1	Spring2021	MIS102	3542-MR Md. Aminul Islam	C3004-S
22a20700-3ce6-4243-a643-85640d5ec5b0	17:00:00	MW	0	50	1	Spring2021	MIS401	3620-DR Zoha Rahman	BC3010-S
e2796f93-7511-496f-9992-f15d465200fd	15:30:00	MW	0	43	1	Spring2021	MIS405	3605-DR Mohammad Anisur Rahman	BC5013-S
1b632507-18e6-4c9d-a867-5552533142ae	09:30:00	ST	0	43	1	Spring2021	MIS430	3542-MR Md. Aminul Islam	BC4010-S
d46b4838-3d08-478a-b438-748b4db32161	11:00:00	MW	0	52	1	Spring2021	MIS442	3566-DR Rezwanul Alam	BC3009-S
38ce898f-104f-4592-9e80-3c78a62e4d63	08:00:00	ST	0	51	2	Spring2021	MIS442	4375-MR Mustafa Nizamul Aziz	BC3011-S
f1d64d10-2435-426a-bf85-93627ec20df2	15:30:00	ST	0	51	3	Spring2021	MIS442	3423-MR Arifur Rahman Khan	BC3012-S
53a478f0-3c56-4615-887c-e5276356d737	14:00:00	MW	0	51	4	Spring2021	MIS442	3423-MR Arifur Rahman Khan	BC3010-S
d4320500-0144-4192-bf41-46ed65384213	15:30:00	MW	0	50	5	Spring2021	MIS442	3542-MR Md. Aminul Islam	BC8012-S
96a62bba-67e0-46be-8345-64c4aa7f9782	11:00:00	ST	0	51	6	Spring2021	MIS442	3542-MR Md. Aminul Islam	BC3011-S
725b854b-b6f9-4030-8dc9-7223c7218d96	14:00:00	ST	0	51	7	Spring2021	MIS442	3542-MR Md. Aminul Islam	BC3009-S
e190179b-8672-432e-a0d6-6380ea927838	09:30:00	ST	0	50	8	Spring2021	MIS442	4375-MR Mustafa Nizamul Aziz	BC7016-S
2a0a5bdd-d7dd-482f-a5e6-2b4772ca74cc	11:00:00	ST	0	50	9	Spring2021	MIS442	3631-MR Md. Rubel	BC3012-S
dad0c5e3-bfa9-493b-8b07-86d5731f9296	14:00:00	MW	0	20	1	Spring2021	MIS455	3566-DR Rezwanul Alam	BC3012-S
87bdce68-2540-4071-ab9b-a01196414329	12:30:00	ST	0	48	1	Spring2021	MIS465	3423-MR Arifur Rahman Khan	BC3011-S
c1987364-6233-43d8-a95c-2723dccffd28	15:30:00	MW	0	50	1	Spring2021	MKT201	3329-MR Abul Khair Jyote	BC3010-S
27f61103-b9a1-4c37-9194-e1d8a0518ca4	12:30:00	MW	0	50	2	Spring2021	MKT201	3406-MS Zakia Binte Jamal	BC2021-S
e69bcf15-cca7-4bcf-9434-0f66e36a7bba	15:30:00	ST	0	51	3	Spring2021	MKT201	3406-MS Zakia Binte Jamal	BC3009-S
17b2abd6-95b2-4e21-bab2-7a0146371c5f	11:00:00	MW	0	50	4	Spring2021	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC2021-S
f1eea6c4-7178-4a9e-aea6-0e339792aeca	08:00:00	MW	0	51	5	Spring2021	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC2021-S
665824d8-e071-4c62-889b-a6d868e6a7a5	17:00:00	MW	0	51	6	Spring2021	MKT201	3318-MR Suman Prosad Saha	BC3008-S
656492b6-3ad2-4964-9c38-a0138592e088	09:30:00	ST	0	50	7	Spring2021	MKT201	3329-MR Abul Khair Jyote	BC3011-S
977a7654-3854-4c7a-bb38-38af1c492e0a	08:00:00	ST	0	50	8	Spring2021	MKT201	3612-MR Syed Imamuzzaman	BC2021-S
e565c5b3-b0ba-4c6a-8eba-29d99334bbb4	12:30:00	MW	0	45	1	Spring2021	MKT302	3318-MR Suman Prosad Saha	BC3008-S
248ad1e4-be9b-41e1-b09c-0b79366e90a4	17:00:00	ST	0	45	2	Spring2021	MKT302	3583-MR Sheikh Mohammad Fauzul Azim	BC2020-S
1d94c1e3-c6a2-4cdb-98f3-328d36bfe9bb	14:00:00	MW	0	46	3	Spring2021	MKT302	3612-MR Syed Imamuzzaman	BC2021-S
286fdf3c-9c22-46cb-91cd-ee8505f070be	15:30:00	ST	B-0	0	1	Spring2021	MKT330	3557-DR Shamsun Nahar Momotaz	BC3010-S
5c817be4-3550-4d3c-a3a6-a6f851d812c2	12:30:00	MW	0	49	1	Spring2021	MKT340	3583-MR Sheikh Mohammad Fauzul Azim	BC3009-S
730436be-4ba9-4d63-820f-5a61361ef452	17:00:00	ST	0	49	2	Spring2021	MKT340	3406-MS Zakia Binte Jamal	BC2021-S
56b82618-7b46-4b4f-bea6-c1d0381a066d	11:00:00	ST	0	48	3	Spring2021	MKT340	3329-MR Abul Khair Jyote	BC3010-S
e11e70d6-1375-48a7-8b20-c3fadf3230dd	14:00:00	ST	0	47	1	Spring2021	MKT350	3583-MR Sheikh Mohammad Fauzul Azim	BC2021-S
4ef6a68e-37f8-4a4d-ba6f-0beb5e76bc76	15:30:00	MW	0	45	2	Spring2021	MKT350	3318-MR Suman Prosad Saha	BC3011-S
680f5440-c8d2-423a-8fd1-0b094bbc0902	09:30:00	MW	0	43	3	Spring2021	MKT350	3435-DR M. Habib	BC3010-S
bb41e1a0-6050-41f4-9571-375ae128aef6	17:00:00	ST	0	48	1	Spring2021	MKT380	3318-MR Suman Prosad Saha	BC3008-S
8e5b1025-6c2d-491a-a676-1c7fd6ce009d	14:00:00	ST	0	50	1	Spring2021	MKT401	3329-MR Abul Khair Jyote	BC3008-S
8cfaa29e-6a9e-4aa1-a698-332ee8236752	09:30:00	MW	0	46	2	Spring2021	MKT401	3539-MR SM Yusuf Mallick	BC3012-S
159c21fa-fa27-4805-bd68-b398ce22cac4	15:30:00	MW	0	48	1	Spring2021	MKT460	3406-MS Zakia Binte Jamal	BC3012-S
ca777c7e-58ab-4ba3-8152-a3e4ae8c6577	17:00:00	MW	0	45	1	Spring2021	MKT470	3406-MS Zakia Binte Jamal	BC3009-S
f3507e6b-7e0a-4711-be48-3fb3b989274a	09:30:00	MW	0	34	1	Spring2021	MKT481	3185-MR Mohammed Sohel Islam	BC4012-S
d0acde60-bbdf-4b55-8887-17efe18b5db4	15:30:00	ST	0	45	2	Spring2021	MKT481	3318-MR Suman Prosad Saha	BC3011-S
112f0c13-2252-43bb-bf59-11c74f65b77d	14:00:00	MW	0	46	3	Spring2021	MKT481	3329-MR Abul Khair Jyote	BC3008-S
91b81dc0-d454-4471-886e-9eea8ddec75c	09:30:00	ST	0	50	1	Spring2021	MUS101	2397-DR Shahnaz Nasrin	BC7002-S
b9e347de-b19c-4bf9-ab28-ebddba68376f	09:30:00	MW	0	41	2	Spring2021	MUS101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
d5eb5ccc-a7c5-4823-a71e-752a5d74909d	11:00:00	ST	0	50	3	Spring2021	MUS101	2397-DR Shahnaz Nasrin	BC7002-S
34ab7c89-5005-4942-8f11-555f6bd5261f	12:30:00	ST	0	32	1	Spring2021	MUS102	2397-DR Shahnaz Nasrin	BC5002-S
eac095de-f540-4307-856b-d1d8d24f05c3	15:30:00	MW	0	56	1	Spring2021	NCH101	2389-DR Ranjan Saha Partha	BC3002-S
821399e6-633f-448e-9660-1351d755617b	08:00:00	ST	0	50	2	Spring2021	NCH101	2403-MR Mohammad Masud Rana	BC7002-S
0700ca13-1da0-4801-a6d6-5565d83acdaf	09:30:00	ST	0	51	3	Spring2021	NCH101	2403-MR Mohammad Masud Rana	BC5002-S
5f33af27-b067-46b4-a85a-7bbdd94818b0	14:00:00	ST	0	51	4	Spring2021	NCH101	2424-MS Samia Hemayet Diba	BC7002-S
3846dcad-f2e5-4978-8db8-f6b5c2f14344	15:30:00	ST	0	52	5	Spring2021	NCH101	2424-MS Samia Hemayet Diba	BC5002-S
e8096d23-c99a-4781-9c04-7000f880af7c	08:00:00	R	0	6	1	Spring2021	PHA100	T001-00 TBA TBA	C6002-S
f3b43ee3-2de1-462c-983d-ce1effa5bf0f	09:30:00	R	0	12	2	Spring2021	PHA100	T001-00 TBA TBA	C6002-S
8bfb1212-585a-421a-b01c-b941160d82c9	11:00:00	R	0	20	3	Spring2021	PHA100	T001-00 TBA TBA	C6002-S
ea4493a3-27ae-486d-8bf6-9365192e8f5a	12:30:00	R	0	16	4	Spring2021	PHA100	T001-00 TBA TBA	C6002-S
c4915f24-7698-43b9-81c5-79829096f0d4	14:00:00	R	0	15	5	Spring2021	PHA100	T001-00 TBA TBA	C6002-S
1751b699-c62e-4470-9682-d4fc0155569c	15:30:00	R	0	2	6	Spring2021	PHA100	T001-00 TBA TBA	C6002-S
62ecb8ae-46e9-4499-b53c-f60223be3418	09:30:00	R	0	17	1	Spring2021	PHA101	5274-DR Md. Saiful Islam	BC9013-S
6b7279ac-fe54-4981-be6c-917aa6ff39b4	11:00:00	R	0	14	2	Spring2021	PHA101	5274-DR Md. Saiful Islam	BC9013-S
5d57df63-6e75-49bb-8b74-7a8a7af1b2ea	08:00:00	ST	B-0	0	3	Spring2021	PHA101	T001-00 TBA TBA	C6005-S
6aaecb20-e6c1-4ca1-acef-e386dec9b713	11:00:00	MW	B-0	0	4	Spring2021	PHA101	T001-00 TBA TBA	C6004-S
45e16f26-f14d-4915-a429-202ab89b9843	11:00:00	ST	0	35	1	Spring2021	PHA102	5603-MS Parisa Tamannur Rashid	C5005-S
b278fa76-5831-48a4-bec8-01b55edd1e8d	09:30:00	ST	B-0	0	2	Spring2021	PHA102	T001-00 TBA TBA	C5005-S
b0da1f53-3071-47c4-b763-b10ba6a4662f	09:30:00	MW	0	36	3	Spring2021	PHA102	5603-MS Parisa Tamannur Rashid	C5005-S
b3d78249-cccf-4b3c-a8e2-0799543c3bba	12:30:00	MW	0	33	4	Spring2021	PHA102	5603-MS Parisa Tamannur Rashid	C5005-S
816b2a53-a9fe-436e-9365-74643af9724c	11:00:00	ST	0	11	1	Spring2021	PHA103	5261-MS Syeda Naureen Ahmed	C4003-S
088c3984-c236-45df-ac0d-1b314946d6a3	12:30:00	ST	0	18	2	Spring2021	PHA103	5261-MS Syeda Naureen Ahmed	C6002-S
41a3e5d7-ade8-485c-ae3b-d27c7a3818f2	14:00:00	ST	0	15	3	Spring2021	PHA103	5261-MS Syeda Naureen Ahmed	C6002-S
75fe0482-e00b-4010-be98-ab16ea212dfb	11:00:00	MW	0	19	4	Spring2021	PHA103	5261-MS Syeda Naureen Ahmed	C6002-S
407e3e58-4ae2-4c55-b766-3fcccd5f634a	14:00:00	MW	0	12	5	Spring2021	PHA103	5261-MS Syeda Naureen Ahmed	C6002-S
98f264d6-0e63-46cc-bc01-43ed19f32366	09:30:00	ST	0	9	6	Spring2021	PHA103	5261-MS Syeda Naureen Ahmed	C6003-S
9fb94770-8337-4b16-9f38-9ce93514d382	15:30:00	ST	0	40	1	Spring2021	PHA104	5283-DR Md. Raihan Sarkar	C6004-S
07faf0e7-7142-4f33-a4e1-dbdcad55338d	17:00:00	ST	0	25	2	Spring2021	PHA104	5312-DR A. B. M. Mahfuz Ul Alam	C6004-S
1a37eadc-b002-4353-bce6-c25fc0fd2e1c	08:00:00	MW	0	28	3	Spring2021	PHA104	5283-DR Md. Raihan Sarkar	C6004-S
5970f234-d2a4-482f-a4bd-96401d6876c1	15:30:00	MW	B-0	0	4	Spring2021	PHA104	T001-00 TBA TBA	C6002-S
cf8ac578-ef0d-461e-9e7a-9b701fa1b652	12:30:00	ST	0	19	1	Spring2021	PHA105	5300-MS Mashmum Shababa Shahid	C6003-S
8c6ed593-ca79-4e52-a002-79f5cc4a9674	14:00:00	ST	0	19	2	Spring2021	PHA105	5300-MS Mashmum Shababa Shahid	C6003-S
0fe67bd9-0321-4cfc-b345-727f82fe2155	08:00:00	MW	0	23	3	Spring2021	PHA105	5288-DR Sheikh Zahir Raihan	C6005-S
3ca571c8-f563-409b-b5ee-a9b30f304c1c	09:30:00	MW	0	20	4	Spring2021	PHA105	5288-DR Sheikh Zahir Raihan	C6002-S
dc75a449-8fc3-433d-998e-8385e41a1c1b	08:00:00	ST	0	45	1	Spring2021	PHA106	5320-MR Md. Abdul Aziz	BC9013-S
312507f8-0c9e-45aa-8e84-c92d314f0b37	09:30:00	ST	0	45	2	Spring2021	PHA106	5320-MR Md. Abdul Aziz	BC9013-S
3d5d6475-497a-44b0-812a-ea45b19fc8ee	08:00:00	R	0	12	1	Spring2021	PHA200	T001-00 TBA TBA	C6003-S
c6939edd-12a6-4296-9539-971c46b8fc52	09:30:00	R	0	20	2	Spring2021	PHA200	T001-00 TBA TBA	C6003-S
e8304b79-552f-433e-821f-da8b2e62f607	11:00:00	R	0	17	3	Spring2021	PHA200	T001-00 TBA TBA	C6003-S
f2a6ae49-3244-4aa6-9fe4-e60e86b23370	08:00:00	MW	0	34	1	Spring2021	PHA201	5266-MR Md. Abdul Muhit	C5005-S
87d46d9b-75b3-4328-bcb6-7c3bcd32870c	09:30:00	MW	0	40	2	Spring2021	PHA201	5266-MR Md. Abdul Muhit	C6004-S
baabe66c-f53d-4cd7-920e-c74546a0203e	15:30:00	ST	0	20	3	Spring2021	PHA201	5289-MR Nazmus Saqueeb	C6002-S
6fdaa849-bdc7-47fc-81ee-4c923b8a1274	17:00:00	ST	0	40	4	Spring2021	PHA201	5289-MR Nazmus Saqueeb	C6005-S
85438837-ec11-403c-8955-e8b3e46a2c67	12:30:00	ST	0	46	1	Spring2021	PHA202	5320-MR Md. Abdul Aziz	BC9013-S
adfc5568-ffc1-41c0-9a82-23abaf771b40	14:00:00	ST	0	45	2	Spring2021	PHA202	5320-MR Md. Abdul Aziz	BC9013-S
28e4d817-d935-44d1-acbc-731f9a02ff3d	11:00:00	MW	0	45	3	Spring2021	PHA202	5320-MR Md. Abdul Aziz	BC9013-S
c4414d27-93b1-44b2-994f-9b2042ac75ec	14:00:00	MW	0	45	4	Spring2021	PHA202	5320-MR Md. Abdul Aziz	BC9013-S
6c037547-8a9a-4d99-80a5-94e470628f4f	15:30:00	MW	B-0	0	5	Spring2021	PHA202	T001-00 TBA TBA	C6003-S
42fcbe65-a037-4434-a06f-c9f928f566a0	09:30:00	ST	0	28	1	Spring2021	PHA203	5275-PROF Mohammad Mafruhi Sattar	C6004-S
7f7b1f09-76be-4466-afeb-77d7121a06ba	09:30:00	MW	0	37	2	Spring2021	PHA203	5265-MS Saquiba Yesmine	C6005-S
388eb45e-cbc0-4c07-85d3-1c430fb229cc	11:00:00	MW	0	40	3	Spring2021	PHA203	5265-MS Saquiba Yesmine	C6005-S
1b8f428d-16ba-4029-aab7-07381091e921	11:00:00	ST	0	40	1	Spring2021	PHA204	5300-MS Mashmum Shababa Shahid	BC9013-S
8dbc2b56-ad56-4450-a8c9-14f61f654060	14:00:00	MW	0	34	2	Spring2021	PHA204	5300-MS Mashmum Shababa Shahid	C6004-S
5cfd3691-3659-4a73-a52c-833df11302bf	14:00:00	ST	0	17	3	Spring2021	PHA204	5264-MR Masum Shahriar	C6004-S
8b8a2127-0f2f-47f7-90c4-212cc6b69aba	17:00:00	MW	0	28	1	Spring2021	PHA205	5286-MR M. Salahuddin Bhuiya	C6004-S
c7a5d8b6-81ae-485a-a43b-ff21d81b868d	15:30:00	MW	0	27	2	Spring2021	PHA205	5286-MR M. Salahuddin Bhuiya	C6004-S
d6b02437-91d6-4098-bfd2-05cd6e884f43	15:30:00	ST	0	15	3	Spring2021	PHA205	5611-DR Prawej Ansari	C6005-S
6e3656b4-21c2-4ac4-acc3-50492d46bafb	11:00:00	MW	0	39	1	Spring2021	PHA206	5300-MS Mashmum Shababa Shahid	C5004-S
b0c4b090-6640-4159-a802-22af46f3e0c3	12:30:00	MW	0	36	2	Spring2021	PHA206	5300-MS Mashmum Shababa Shahid	C6004-S
a930f690-64b3-413c-bc28-6feb4ba18491	08:00:00	MW	0	24	3	Spring2021	PHA206	5611-DR Prawej Ansari	BC9013-S
0b483327-0e08-4e4b-8a04-6892ec650336	08:00:00	ST	0	40	1	Spring2021	PHA207	5262-MR M. Shahabuddin K. Choudhuri	C6004-S
f5e8c08d-3090-4ac6-abd5-4e79adcc49e3	09:30:00	ST	0	40	2	Spring2021	PHA207	5262-MR M. Shahabuddin K. Choudhuri	C6005-S
bf3b5071-3b73-4592-8ee3-9f359bff014b	14:00:00	MW	0	26	1	Spring2021	PHA208	5305-DR Muhammad Asaduzzaman	C6005-S
752a0248-ea1a-4c61-bbfd-7d56b3c4252e	15:30:00	MW	0	7	2	Spring2021	PHA208	5305-DR Muhammad Asaduzzaman	C6005-S
197d710d-8801-4e79-b509-164752f99e83	17:00:00	ST	0	35	3	Spring2021	PHA208	5306-MR Zobaer Al Mahmud	C5004-S
c6c0b32f-1e5c-4ad0-936f-1c19d5da1b82	12:30:00	ST	0	40	1	Spring2021	PHA209	5603-MS Parisa Tamannur Rashid	C6004-S
1e45bd05-e276-4643-a619-dc33afbb8bf1	14:00:00	ST	0	41	2	Spring2021	PHA209	5603-MS Parisa Tamannur Rashid	C6005-S
6deb82bf-33b2-4b5a-b118-ec31168f7945	17:00:00	MW	0	38	3	Spring2021	PHA209	5263-MR Abdullah Faruque	C6005-S
385bf2e0-fbcc-4546-8d79-67383ac52ff9	11:00:00	A	0	35	4	Spring2021	PHA209	5307-DR Md. Selim Reza	C6005-S
f4e21cb9-0469-4e9b-9db6-3ce748e5cf92	17:00:00	A	0	12	1	Spring2021	PHA300	T001-00 TBA TBA	C6006-S
4776a605-b82f-4101-8e6e-f7efd295f2d8	12:30:00	MW	0	40	1	Spring2021	PHA301	5607-DR A. S. M. Monjur-Al- Hossain	BC9013-S
ce05eee1-450d-4013-8082-80b6dc4a367d	15:30:00	MW	0	32	2	Spring2021	PHA301	5603-MS Parisa Tamannur Rashid	BC9013-S
74e6adb7-1471-4555-a7e8-6a231e99a71d	15:00:00	F	0	31	1	Spring2021	PHA302	5304-DR Md. Elias-Al- Mamun	BC9013-S
8b75efcd-9455-4ae1-88dc-313237390e5a	11:00:00	A	0	38	2	Spring2021	PHA302	5304-DR Md. Elias-Al- Mamun	BC9013-S
dc7e86a4-0665-48fa-aa82-32b79ffd8ad6	09:30:00	F	0	45	1	Spring2021	PHA303	5609-MR Md. Ashraful Alam	BC9013-S
981fd990-b2e9-4498-b58f-55d66a04b2c2	15:00:00	F	B-0	0	2	Spring2021	PHA303	T001-00 TBA TBA	C6004-S
d34f67d2-7e4b-497e-85f6-4115927b47aa	15:30:00	ST	0	36	1	Spring2021	PHA304	5264-MR Masum Shahriar	BC9013-S
df1bcbdf-a8bc-439e-a86a-1e16676223da	17:00:00	ST	0	22	2	Spring2021	PHA304	5264-MR Masum Shahriar	BC9013-S
c0e0a509-6482-41a9-9f8f-73480df0eee4	15:30:00	ST	0	21	3	Spring2021	PHA304	5604-DR Iffat Ara Sonia Rahman	C6003-S
87489c8e-8682-41a5-8252-e1fb42212de8	11:00:00	MW	0	16	1	Spring2021	PHA305	5281-PROF Amir Hussain Khan	C5005-S
16f581e2-9334-475d-9582-0ff642c3aa1b	12:30:00	ST	0	41	2	Spring2021	PHA305	5611-DR Prawej Ansari	C6005-S
e399bb19-f4bb-4177-a2bd-4a1bc484066e	09:30:00	MW	0	45	1	Spring2021	PHA306	5254-PROF J M A Hannan	BC9013-S
c45ddffc-231c-43a6-a2c4-9eeb0ed79d4c	09:30:00	ST	0	41	2	Spring2021	PHA306	5611-DR Prawej Ansari	C5004-S
b5f4c0c6-b675-43a2-a025-a6bb6ff0d36d	11:00:00	ST	B-0	0	3	Spring2021	PHA306	T001-00 TBA TBA	C4006-S
1b7233d8-98c8-472d-bd08-86879b8e556f	15:30:00	ST	0	29	1	Spring2021	PHA307	5306-MR Zobaer Al Mahmud	C4004-S
c12c803c-c4b6-423a-9012-c6df1192e6e5	11:00:00	ST	0	31	1	Spring2021	PHA309	5263-MR Abdullah Faruque	C6004-S
7e146bbe-4303-4b86-b62f-6b227f462cf2	09:30:00	ST	0	12	2	Spring2021	PHA309	5608-DR S. M. Abdur Rahman	C4004-S
64fd69f7-5203-4f11-8c46-55b89a994f86	11:00:00	ST	0	30	1	Spring2021	PHA310	5610-DR Shimul Halder	C6005-S
2ce43f22-b9d8-40c6-9243-3a8b5e283da7	17:00:00	ST	0	21	1	Spring2021	PHA311	5286-MR M. Salahuddin Bhuiya	C5005-S
8d9ae20a-b3f7-4e9b-8663-9949c6c3336d	12:30:00	MW	0	42	1	Spring2021	PHA312	5604-DR Iffat Ara Sonia Rahman	C6005-S
ea83dc44-275e-4921-9936-213bfedb5cbc	14:00:00	MW	0	20	2	Spring2021	PHA312	5604-DR Iffat Ara Sonia Rahman	C6003-S
e6261982-6725-40ef-bbfa-7eb9c62b42d6	12:30:00	R	B-0	0	1	Spring2021	PHA400	T001-00 TBA TBA	C6007-S
2af496ae-3739-4d23-af32-c7c9ab7c9468	09:30:00	MW	0	26	1	Spring2021	PHA401	5275-PROF Mohammad Mafruhi Sattar	C6003-S
c9875f9a-a447-4e2f-a326-6206860d5a3a	09:30:00	ST	0	19	1	Spring2021	PHA403	5274-DR Md. Saiful Islam	C6006-S
0e564745-c349-4d28-b023-0191c832ebc2	14:00:00	ST	0	15	1	Spring2021	PHA404	5610-DR Shimul Halder	C6006-S
454efdba-735e-47f6-9b98-5598a66facbe	14:00:00	R	0	6	1	Spring2021	PHA407	T001-00 TBA TBA	BC6007-S
5098aa5a-08e3-4d19-822c-ffab335b084c	11:00:00	MW	0	21	1	Spring2021	PHA409	5275-PROF Mohammad Mafruhi Sattar	C6003-S
4636c038-cb72-4a3c-80c6-40184b88eab1	17:00:00	ST	0	19	1	Spring2021	PHA412	5604-DR Iffat Ara Sonia Rahman	C6002-S
6e4ea5aa-3786-48bf-a83d-227c5c4c2c25	09:30:00	MW	0	41	1	Spring2021	PHL101	2307-MR Obydullah Al Marjuk	BC8015-S
42fe1251-763f-41e8-b251-c37df31b2d9d	11:00:00	ST	0	28	2	Spring2021	PHL101	2335-MS Parsa S. Sajid	BC7016-S
b7ce8e2e-5f61-45e9-aeb4-4ce974ff8645	11:00:00	ST	0	4	1	Spring2021	PHY100	4250-DR Asma Begum	BC6012-S
2cad779e-f6ce-4556-adcb-3b6a86066f67	08:00:00	ST	0	23	1	Spring2021	PHY101	4384-DR S N M Azizul Hoque	BC6007-S
de65b8ec-8266-495d-8604-3edbfb7fbd64	14:00:00	MW	0	40	2	Spring2021	PHY101	4378-DR Md. Readul Mahmud	BC6008-S
0ff7ef5d-9ed7-4f7d-a2b8-e81f0e760588	09:30:00	MW	0	39	3	Spring2021	PHY101	4158-MR Dr. Farhad Alam	BC7025-S
71ba488a-bf54-46b4-8e29-f9aea1ebabba	08:00:00	MW	0	35	4	Spring2021	PHY101	4429-DR Khan Muhammad Bin Asad	BC5014-S
e684811b-0f6f-493a-a945-4f5200482e35	11:00:00	ST	0	14	5	Spring2021	PHY101	4430-MR Ifte Khairul Alam Bhuiyan	BC6013-S
e3356350-d2f4-4fe5-99e8-9766ea6845ed	12:30:00	ST	0	29	6	Spring2021	PHY101	4454-DR Jewel Kumar Ghosh	BC6012-S
bf0badc0-3609-4bb0-8785-484d0c70b607	11:00:00	MW	0	12	7	Spring2021	PHY101	4454-DR Jewel Kumar Ghosh	BC7015-S
cdba03a7-7b9e-4b8e-b15f-d16d5e48731b	14:00:00	MW	0	42	1	Spring2021	PHY102	4112-DR Mostafa Kamal	BC6009-S
5b243ca8-5b3f-4585-a51c-48f7033def98	12:30:00	ST	0	41	2	Spring2021	PHY102	4112-DR Mostafa Kamal	BC6013-S
05faf772-fe74-4b4b-9068-55e04a092c09	11:00:00	ST	0	49	3	Spring2021	PHY102	4158-MR Dr. Farhad Alam	BC7015-S
653561ce-06e8-4b35-812c-adbff130010f	08:00:00	MW	0	44	4	Spring2021	PHY102	4250-DR Asma Begum	BC6007-S
54be005f-80c1-4060-9a8a-5ae61a68617f	09:30:00	ST	0	47	5	Spring2021	PHY102	4158-MR Dr. Farhad Alam	BC6009-S
5ba2837d-0564-4589-b738-68e70f6ea33d	12:30:00	ST	0	17	1	Spring2021	PHY111	4327-MS Amrita Khan	C2004-S
868f22dc-9ed0-4f47-a7f8-684dd0960c8f	12:30:00	MW	0	8	2	Spring2021	PHY111	4327-MS Amrita Khan	BC6008-S
fbcb139e-a915-4718-84e5-a869f532a585	12:30:00	MW	0	38	1	Spring2021	PHY121	4112-DR Mostafa Kamal	BC6009-S
11458cb5-9a68-425b-8255-29b8a5293edc	15:30:00	ST	B-0	0	2	Spring2021	PHY121	T001-00 TBA TBA	BC6007-S
0f7f122f-7168-49c5-9cc6-c4ebc412b592	17:00:00	MW	0	2	1	Spring2021	PHY204	4338-PROF M Arshad Momen	BC6009-S
e07c6205-3699-43fb-a56f-a6523f80725f	11:00:00	MW	0	7	1	Spring2021	PHY302	4338-PROF M Arshad Momen	C3004-S
31d8180f-3d9d-4a71-892c-a84be4f7b45a	09:30:00	ST	0	7	1	Spring2021	PHY305	4429-DR Khan Muhammad Bin Asad	C6002-S
c8fda75c-b803-4264-bb90-4a1d27db996d	11:00:00	ST	0	40	1	Spring2021	POP201	5231-MR Saquib Ahmad Khan	BC8014-S
60591e7b-51b1-440a-9732-ceeddc2644e4	12:30:00	MW	0	39	1	Spring2021	POP305	5231-MR Saquib Ahmad Khan	BC9015-S
a8f080a6-f885-4a42-8f8d-4377765facab	17:00:00	MW	0	1	1	Spring2021	POP411	5231-MR Saquib Ahmad Khan	BC8014-S
0c3b4626-d2da-4450-856f-bb7114090a31	12:30:00	MW	0	38	1	Spring2021	PSY201	5519-DR Nafisa Huq	BC7015-S
57958583-8563-4209-9e9c-eec76b7cbc27	09:30:00	ST	0	30	1	Spring2021	SOC101	2200-MS Sharmeen Ahmed	BC8013-S
ffd4e9cc-4fc8-44e9-a19d-151a86bfa6e1	09:30:00	MW	0	24	2	Spring2021	SOC101	2200-MS Sharmeen Ahmed	C4003-S
0147f4b6-6b48-4cae-9fc9-4e3b4f9d9c8c	14:00:00	ST	0	25	3	Spring2021	SOC101	2198-MS Mahbuba Dewan	BC7026-S
aa6db694-cb3b-4b9d-a9ff-6428417e1e49	11:00:00	ST	0	16	4	Spring2021	SOC101	2198-MS Mahbuba Dewan	BC10017-S
65a8a565-a3e9-4ad9-b5e0-25a211a38375	11:00:00	MW	0	20	5	Spring2021	SOC101	2307-MR Obydullah Al Marjuk	BC8013-S
4e85128c-25ed-4974-91f2-71405ce251e5	14:00:00	MW	0	29	6	Spring2021	SOC101	2307-MR Obydullah Al Marjuk	BC9014-S
74b2cdb1-6194-40fa-bd52-7dc74f85a648	09:30:00	MW	0	18	1	Spring2021	SOC202	2198-MS Mahbuba Dewan	BC8013-S
55903a2e-ca84-4722-b3fe-dbd4e07b2ac7	14:00:00	MW	0	10	1	Spring2021	SOC206	2198-MS Mahbuba Dewan	BC4011-S
9ea68eba-950f-4796-ba66-3143f1896f97	14:00:00	ST	0	12	1	Spring2021	SOC306	2484-MR Mahbub Quaisar	BC4014-S
c590f642-ebf6-47be-8350-7fe8c0478bd2	15:30:00	MW	0	10	1	Spring2021	SOC316	2207-MR S. Aminul Islam	BC4012-S
1a7231d0-163f-4520-816f-17a5918ee2c4	17:00:00	ST	0	4	1	Spring2021	SOC318	2165-PROF A. I. Mahbub Uddin Ahmed	BC8013-S
0574120c-1729-4001-a52c-6058cc648450	17:00:00	MW	0	7	1	Spring2021	SOC408	2485-MR A. K. M Nurun Nabi	BC9015-S
f769da78-9ad3-46aa-9b2f-40204b464521	15:30:00	ST	0	6	1	Spring2021	SOC414	2207-MR S. Aminul Islam	BC8014-S
93b2074d-e3b6-426f-aa60-86f23188edec	08:00:00	ST	0	2	1	Spring2021	SOC499	2200-MS Sharmeen Ahmed	BCTBA4-S
28747dc7-0c6c-44a7-a6e7-0423f88c65f0	11:00:00	ST	0	20	1	Spring2021	TCL104	2459-DR Assaduzzaman	C6003-S
da1a1002-b13b-4200-8aca-aa5b94e0d9b1	11:20:00	MW	-1	40	1	Spring2020	AAT101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
19724f2b-03ea-4b9d-8f6f-f2810e1e14a6	08:00:00	MW	-1	45	1	Spring2020	ACN201	3563-MR Mohammed Naveed Siddiquee	BC2009-S
25bbac80-1896-4796-a8aa-092d2bc9b782	11:20:00	MW	-1	50	2	Spring2020	ACN201	3478-MR Md. Safiuddin	BC2009-S
b398aa00-9464-42d4-8abe-632486c82a99	11:20:00	ST	-1	50	3	Spring2020	ACN201	3493-MR Ashraful Arefin	BC2009-S
0424a9c1-41e8-4baa-91fb-82085c11dfc8	13:40:00	MW	-1	50	4	Spring2020	ACN201	3511-MS Susmita Mandal	BC2009-S
249a034f-7b8f-4df5-8df7-b60ee129b208	17:00:00	MW	-1	41	5	Spring2020	ACN201	3603-MR Md. Rezaul Karim	BC2009-S
f8f810f2-b134-4b90-ac89-541ae7709281	11:20:00	ST	-1	50	6	Spring2020	ACN201	3511-MS Susmita Mandal	BC2010-S
b84481ce-59f9-4548-acf9-aae58b2a8222	17:00:00	ST	-1	48	7	Spring2020	ACN201	3493-MR Ashraful Arefin	BC2009-S
ce631f68-6fea-48c3-9c4e-049d36231301	09:40:00	ST	-1	42	8	Spring2020	ACN201	3600-MR Prahallad Chandra Das	BC2009-S
9a4bf380-8db7-4cdc-aa7e-1e1bbd0e25e9	08:00:00	ST	-1	40	9	Spring2020	ACN201	3616-MR Mohammed Abu Yousuf	BC2009-S
6b68f712-440d-4bb0-880a-e8dea62f57be	11:20:00	MW	-1	40	1	Spring2020	ACN202	3511-MS Susmita Mandal	BC2010-S
4b91dadd-90ea-4f58-a6a8-8f038037ddd4	15:20:00	MW	-1	40	2	Spring2020	ACN202	3478-MR Md. Safiuddin	BC2009-S
9b9267a8-a63f-442e-bb1f-269132ef3960	11:20:00	ST	-1	40	3	Spring2020	ACN202	3563-MR Mohammed Naveed Siddiquee	BC2011-S
0ee37804-dbe0-4b65-95ee-cf83e8ddb5a8	13:40:00	MW	-1	39	4	Spring2020	ACN202	3603-MR Md. Rezaul Karim	BC2010-S
299ef665-b324-4dda-8cd6-107c3c63d3be	08:00:00	ST	-1	37	5	Spring2020	ACN202	3600-MR Prahallad Chandra Das	BC2010-S
c3ef75cd-e7ce-49ab-9626-6bcbd8a58c15	13:40:00	MW	-1	41	6	Spring2020	ACN202	3563-MR Mohammed Naveed Siddiquee	BC2011-S
5354f512-5436-46e7-bbd0-5b622e8af92d	09:40:00	ST	-1	40	7	Spring2020	ACN202	3493-MR Ashraful Arefin	BC2010-S
aef32e37-0814-4722-9224-b4ce559b07b2	09:40:00	ST	-1	29	1	Spring2020	ACN301	3147-DR Rushdi Rezaur Razzaque	BC2011-S
cadbcc21-75ed-4f43-a91f-f16af0636d12	13:40:00	ST	-1	32	2	Spring2020	ACN301	3511-MS Susmita Mandal	BC2013-S
095238e9-ef94-473b-a517-0c62dce9ad0f	13:40:00	ST	-1	39	1	Spring2020	ACN305	3478-MR Md. Safiuddin	BC2010-S
39a06ece-67b3-4fa3-b70c-09f671f81384	09:40:00	MW	-1	33	2	Spring2020	ACN305	3147-DR Rushdi Rezaur Razzaque	BC2009-S
a7797973-fb99-4d80-a265-eadf80d2459f	09:40:00	ST	-1	38	1	Spring2020	ACN402	3478-MR Md. Safiuddin	BC2012-S
fef629f9-9684-4fce-889e-d4e2c8c638ea	09:40:00	MW	-1	19	2	Spring2020	ACN402	3603-MR Md. Rezaul Karim	C4006-S
9807f7e8-4e99-4f4d-a94f-004c67ec3d2a	09:40:00	MW	-1	30	1	Spring2020	ACN403	3563-MR Mohammed Naveed Siddiquee	C5004-S
4aa040d5-f271-4210-a9dc-eba135d1cde7	08:00:00	ST	-1	22	2	Spring2020	ACN403	3427-MS Nimat Zarin	C2004-S
c354645d-31d2-452e-a26b-453868b160ee	11:20:00	ST	-1	35	1	Spring2020	ACN405	3376-MR Naheem Mahtab	BC2012-S
f2097191-e7e4-442c-a647-d7f21e41d1de	08:00:00	MW	-1	17	2	Spring2020	ACN405	3511-MS Susmita Mandal	BC2010-S
be9294e0-5e35-4fe9-a8f0-533ab3d8d1f6	09:40:00	ST	-1	12	1	Spring2020	ACN406	3376-MR Naheem Mahtab	BC4010-S
72b7a26d-6098-48a9-abee-f490b8442394	17:00:00	ST	-1	45	1	Spring2020	ACN441	3563-MR Mohammed Naveed Siddiquee	BC2010-S
dc99490b-5322-493f-af1f-7d2f2eb0e6cd	15:20:00	ST	-1	38	1	Spring2020	ANT101	2326-MR Maidul Alam Chaklader	BC8012-S
a9731d45-35b3-49e5-b1ae-c38ca89a9379	15:20:00	MW	-1	38	2	Spring2020	ANT101	2326-MR Maidul Alam Chaklader	BC9014-S
23caffe4-b26a-4701-ac1d-9742c932a635	13:40:00	ST	-1	40	3	Spring2020	ANT101	2194-MR Mohammad Mahfuzul Islam	C3004-S
a8f47a4b-cae1-4f50-89a2-eb03be2b2c5e	13:40:00	MW	-1	39	4	Spring2020	ANT101	2194-MR Mohammad Mahfuzul Islam	C4004-S
4a3df0f2-286c-416f-ae3e-ccf016a946ae	17:00:00	ST	-1	32	5	Spring2020	ANT101	2443-MS Tazin Rahman Ananya	BC8013-S
fde68d21-bb55-4160-99d2-b39b0c1b3120	17:00:00	MW	-1	39	6	Spring2020	ANT101	2443-MS Tazin Rahman Ananya	C2004-S
94640ff4-63b6-4ef4-a3ba-c7a829c41176	08:00:00	MW	-1	32	7	Spring2020	ANT101	2443-MS Tazin Rahman Ananya	BC9014-S
2f7abd61-62f6-4830-93a6-bd76798f2731	11:20:00	MW	-1	39	8	Spring2020	ANT101	2444-MS Ibtesum Afrin	BC8012-S
29a6630c-0091-4f5b-83da-344413c95768	17:00:00	ST	-1	12	9	Spring2020	ANT101	2444-MS Ibtesum Afrin	BC8014-S
8d135ec9-3e0d-4312-a32a-5271503f4094	08:00:00	ST	-1	35	10	Spring2020	ANT101	2444-MS Ibtesum Afrin	BC7015-S
1ce71aac-a5a7-4fca-bb96-a4de43f070be	17:00:00	ST	-1	32	1	Spring2020	ANT103	2326-MR Maidul Alam Chaklader	BC9015-S
18583afb-1337-4ffd-ac5c-1c57bb73a041	15:20:00	ST	-1	14	1	Spring2020	ANT211	2194-MR Mohammad Mahfuzul Islam	C3006-S
cb1ed8b4-48fb-47de-abd2-b9d1a9a5f0c5	09:40:00	MW	-1	10	1	Spring2020	ANT308	2444-MS Ibtesum Afrin	C3002-S
25ef653a-7921-42de-8a90-7205a82afd7b	15:20:00	MW	-1	9	1	Spring2020	ANT311	2194-MR Mohammad Mahfuzul Islam	C3002-S
3d0fdc5d-ec86-4683-807e-a91a9482c0c8	09:40:00	ST	-1	5	1	Spring2020	ANT314	2443-MS Tazin Rahman Ananya	C2007-S
c5e27b6d-a319-41a8-82b3-6cd6d67cf3f1	11:20:00	MW	-1	16	1	Spring2020	ANT403	2389-DR Ranjan Saha Partha	C2007-S
26b249be-96c8-4bfb-aa2f-7b0deb1b0d07	13:40:00	MW	-1	10	1	Spring2020	ANT418	2326-MR Maidul Alam Chaklader	C4003-S
8856b75e-acee-4d7f-badd-9f444c122bfa	08:00:00	A	0	1	1	Spring2020	ANT499	2194-MR Mohammad Mahfuzul Islam 2326-Maidul AlamChaklader	BCTBA2-S
ceaa4789-a2bf-40c0-b7ff-91682fe024d0	08:00:00	F	-1	199	1	Spring2020	BBA499A	3484-MR Zubayer Zakir Khan	BCTBA3-S
8128007d-a20d-46bf-9f01-8bc37a87599a	09:40:00	F	0	0	1	Spring2020	BBA499B	3513-PROF Dr. Aminul Karim	BCTBA3-S
7750682e-48c4-4faf-94d1-5494139cd0ed	15:20:00	MW	-1	21	1	Spring2020	BCB103	6042-DR M Kabir Uddin	BC9016-S
525f9839-78d2-4a27-80d2-0fb0b1a62c9f	11:20:00	R	-1	21	1	Spring2020	BCB103L	6042-DR M Kabir Uddin	BC4017A-S
2c97dc93-c753-4f7a-9e00-a7378d753b73	17:00:00	MW	B-0	0	1	Spring2020	BCB104	T001-00 TBA TBA	A4L04-S
b14a2e76-9481-43eb-8497-204558de6c64	15:20:00	W	B-0	0	1	Spring2020	BCB104L	T001-00 TBA TBA	FT-S
3bd7fa86-9aab-4623-ac36-3ed57754fad8	15:20:00	MW	B-0	0	1	Spring2020	BCB202	T001-00 TBA TBA	A4L04-S
d7c0aeef-6a06-40fc-9cdd-049e474a628b	13:40:00	R	-1	24	1	Spring2020	BCB202L	6042-DR M Kabir Uddin	BC4017B-S
839ad14d-469d-44a5-b919-b5b1176ddeb5	09:40:00	MW	B-0	0	1	Spring2020	BCB203	T001-00 TBA TBA	FT-S
cbe1ae48-2e2b-4acc-ad9d-e603bf635602	13:40:00	ST	B-0	0	1	Spring2020	BCB204	T001-00 TBA TBA	CSCLab2-S
7f2773c5-d56d-4c76-99ad-fa6d07ed4ec9	13:40:00	MW	-1	11	1	Spring2020	BCB205	6011-MS Ms. Mahina Tabassum Mitul	C4002-S
7abddbf5-7701-4dd8-a6b0-b6512718bd5f	17:00:00	ST	-1	22	1	Spring2020	BCB206	6011-MS Ms. Mahina Tabassum Mitul	C4004-S
0b64676b-5ab1-40ca-8976-0c977fd9bc6a	11:20:00	ST	B-0	0	1	Spring2020	BCB207	T001-00 TBA TBA	BC4017A-S
a61a1585-59c2-45cc-b0bc-e8df1898440c	15:20:00	ST	-1	16	1	Spring2020	BCB301	6063-MR Richard Malo	C3007-S
3f1b0aa8-db59-4eef-8cb8-717d47372325	13:40:00	ST	-1	27	1	Spring2020	BCB302	6049-DR Syed Saleheen Qadri	BC10018-S
a10ba816-ddbe-4a89-9551-2b9c04b75d66	08:00:00	ST	-1	23	1	Spring2020	BCB303	6054-DR Sabrina Moriom Elias	BC9015-S
e1cbebc7-db87-40e0-b263-69e5b355383d	15:20:00	MW	-1	19	1	Spring2020	BCB304	6011-MS Ms. Mahina Tabassum Mitul	BC10017-S
f142b4de-aca8-48aa-8132-a13aceb037de	11:20:00	MW	-1	23	1	Spring2020	BCB305	6054-DR Sabrina Moriom Elias	BC4017A-S
d91b16c9-9105-4abf-bc05-1aa66be6135a	09:40:00	ST	-1	6	1	Spring2020	BCB306	6054-DR Sabrina Moriom Elias	C4002-S
9afeb615-15ae-41d6-a362-496f961cdda2	17:00:00	MW	B-0	0	1	Spring2020	BCB307	T001-00 TBA TBA	C3003-S
9e4767bd-39a9-461b-afbc-694c32371ba2	11:20:00	ST	-1	10	1	Spring2020	BCB308	6049-DR Syed Saleheen Qadri	C5002-S
b0e612df-0375-477a-bf62-190b6b3595a4	13:40:00	MW	B-0	0	1	Spring2020	BCB309	T001-00 TBA TBA	A4L04-S
8e7f72dc-50c8-4869-8e49-6d8124e82510	15:20:00	ST	-1	12	1	Spring2020	BCB401	6064-MR Md. Daud Hossain Khan	C2006-S
fe6264c6-36a7-4824-a66b-efb1696c08ea	13:40:00	MW	-1	11	1	Spring2020	BCB402	6002-MR Syed A. K. Shifat Ahmed	C6004-S
dd09c0dc-ac95-4950-8caa-bdddc4277a8f	08:00:00	MW	B-0	0	1	Spring2020	BCB405	T001-00 TBA TBA	C2002-S
3a5de614-d036-49a3-b633-052e3d12eb2c	08:00:00	ST	B-0	0	1	Spring2020	BCB407	T001-00 TBA TBA	FT-S
91c7853c-2d4a-4bae-b874-aa35fcbdf3c6	15:20:00	ST	-1	8	1	Spring2020	BCB412	6011-MS Ms. Mahina Tabassum Mitul	BC4017B-S
737e3030-4c08-4605-a768-8c0c0fd8707c	08:00:00	ST	-1	6	1	Spring2020	BCB413	6064-MR Md. Daud Hossain Khan	C3006-S
96265d31-13f1-442e-8002-8dfe5b3227c1	09:40:00	ST	-1	13	1	Spring2020	BCB414	6063-MR Richard Malo	BC4017A-S
1ca59ad7-f914-4b49-8896-9ef851f9e63a	09:40:00	MW	-1	18	1	Spring2020	BCB415	6064-MR Md. Daud Hossain Khan	BC4010-S
ed4d0dbb-00f7-4e92-9ffb-e54aad6f984e	09:40:00	MW	-1	41	1	Spring2020	BDS109	2255-MS Momtaz Parvin Mumu	BC7026-S
b826bf5f-d948-4b9d-ab61-abcb26ac305e	15:20:00	ST	-1	44	2	Spring2020	BDS109	2255-MS Momtaz Parvin Mumu	BC7002-S
41af21ac-10f2-4817-930d-1b6be7158b10	09:40:00	ST	-1	44	3	Spring2020	BDS109	2393-MS Janina Islam Abir	BC7002-S
989c5d48-6e32-4e0a-bff7-05b93f2d0005	13:40:00	ST	-1	47	4	Spring2020	BDS109	2442-MS Mushfeqa Islam	BC7002-S
f0603899-8897-4a75-8c58-47fe76d3793a	11:20:00	MW	-1	45	5	Spring2020	BDS109	2481-DR Zahed-Ur- Rahman	BC5002-S
835fd76f-d876-4483-b1bd-0422650b5941	17:00:00	ST	-1	26	6	Spring2020	BDS109	2492-MS Naureen Rahim	BC7002-S
fde3b71a-541f-4e11-aebd-3d205f035348	15:20:00	MW	-1	45	7	Spring2020	BDS109	2481-DR Zahed-Ur- Rahman	BC7002-S
3321f705-8208-46b8-9d33-0fc20b432631	11:20:00	ST	-1	46	1	Spring2020	BIO100	6053-MS Saadia Shareen	BC10014-S
eee0b450-5621-423f-a9a9-7ed1c39c2a65	13:40:00	ST	-1	57	2	Spring2020	BIO100	6053-MS Saadia Shareen	BC10014-S
7ab767d2-fd91-4135-bbf6-b39b54f8351e	13:40:00	MW	-1	44	3	Spring2020	BIO100	6064-MR Md. Daud Hossain Khan	BC10014-S
7c8190ae-f659-4f3a-a5ce-d234d8be35d4	13:40:00	MW	-1	31	4	Spring2020	BIO100	5596-MS Zareen Tasnim Tapti	BC10015-S
e15c8499-e268-42eb-9c0b-8c5a7b4483e5	09:40:00	ST	-1	46	5	Spring2020	BIO100	6053-MS Saadia Shareen	BC10014-S
5f79991a-bf39-4941-a3b3-4b3a85121b6f	09:40:00	MW	-1	45	6	Spring2020	BIO100	6053-MS Saadia Shareen	BC10014-S
b7c03feb-8cf0-4cd2-b58d-ac0237b7220a	15:20:00	MW	B-0	0	7	Spring2020	BIO100	T001-00 TBA TBA	BCTBA2-S
e39d3645-d4a5-4953-a8c6-8520c84d7883	08:00:00	ST	B-0	0	8	Spring2020	BIO100	T001-00 TBA TBA	BCTBA4-S
4ff9e058-6bdf-4b1f-9cb0-ace935acbc85	15:20:00	ST	B-0	0	9	Spring2020	BIO100	T001-00 TBA TBA	BCTBA3-S
80e49774-67e5-4fcd-95ac-a038230150a4	15:20:00	MW	B-0	0	10	Spring2020	BIO100	T001-00 TBA TBA	BC001-S
ef7a2c51-10db-470d-b3b2-dd946c61cba5	13:40:00	ST	B-0	0	11	Spring2020	BIO100	T001-00 TBA TBA	FT-S
3aa1015d-984b-4838-adcd-e6513cd85251	08:00:00	MW	B-0	0	12	Spring2020	BIO100	T001-00 TBA TBA	A4L04-S
b0566132-bf72-44b4-b10b-eb9faa1be634	17:00:00	ST	B-0	0	13	Spring2020	BIO100	T001-00 TBA TBA	BCTBA4-S
8872a1a9-bf60-4eb2-8893-71a8a6c523a5	09:40:00	MW	-1	8	1	Spring2020	BIO101	5199-DR Shahima Islam	BC10017-S
4b968d02-1398-45a4-8647-2b3691acd677	09:40:00	R	-1	8	1	Spring2020	BIO101L	5199-DR Shahima Islam	BLab-S
d56799f8-6f27-4311-ba53-dde97bead65d	11:20:00	ST	-1	46	1	Spring2020	BIO102	6002-MR Syed A. K. Shifat Ahmed	BC10015-S
00d605c5-1470-4b91-a993-3096ad062946	11:20:00	ST	B-0	0	2	Spring2020	BIO102	T001-00 TBA TBA	BCTBA2-S
f4a30b6e-e682-4447-8f22-04e29e48ba55	13:40:00	T	0	46	1	Spring2020	BIO102L	6002-MR Syed A. K. Shifat Ahmed	BC4017A-S
9dc6b860-49aa-45b3-83a2-73c2677674ea	13:40:00	R	B-0	0	1	Spring2020	BIO102T	T001-00 TBA TBA	BC10018-S
38f241c1-53a0-46e9-9847-213c95de3b3b	13:40:00	MW	B-0	0	1	Spring2020	BIO105	T001-00 TBA TBA	BCTBA2-S
4bef035d-389d-4ece-aa43-d880ead298ea	11:20:00	R	B-0	0	1	Spring2020	BIO105L	T001-00 TBA TBA	FT-S
b5ad569c-b01b-44dd-8ef4-fa1aee8c2c49	17:00:00	MW	-1	2	1	Spring2020	BIO206	6042-DR M Kabir Uddin	BC4017C-S
964a62b7-9843-45a7-ace7-699618a79d4c	09:40:00	R	-1	1	1	Spring2020	BIO210	6064-MR Md. Daud Hossain Khan	BC4017B-S
5990c73d-b555-40c5-befb-83317ae09c23	17:00:00	R	-1	1	1	Spring2020	BIO450	6064-MR Md. Daud Hossain Khan	BC4017A-S
2fe47cee-1795-4a9b-9d66-8f5ddc1b6cbf	08:00:00	MW	-1	4	1	Spring2020	BIO452	6064-MR Md. Daud Hossain Khan	C2003-S
7456196e-96d8-429b-8fe7-1c2ec87de17c	08:00:00	MW	-1	24	1	Spring2020	BLA101	2446-DR Muhammad Shajjad Ahsan	BC7002-S
b7db345b-8775-43d8-b1bb-ea359c37de5d	09:40:00	MW	-1	39	2	Spring2020	BLA101	2446-DR Muhammad Shajjad Ahsan	BC3002-S
b3f272d2-7773-417d-a55a-4e937b2b7017	08:00:00	ST	-1	24	1	Spring2020	BNG201	2388-DR Lutfor Rahman	BC8013-S
742b18ea-21fb-429f-9896-f285278c4a44	13:40:00	ST	-1	30	2	Spring2020	BNG201	2388-DR Lutfor Rahman	BC8014-S
f916253a-fdbb-462c-a468-80a897a4e691	15:20:00	ST	-1	30	3	Spring2020	BNG201	2388-DR Lutfor Rahman	BC4013-S
20ae872b-fb43-4cc2-841d-98aa374102fc	11:20:00	MW	-1	30	4	Spring2020	BNG201	2427-MR Shaikh Mahfuzur Rahman	C5004-S
4b87ceb4-22e4-4d8c-ba50-6f80d71d0896	15:20:00	MW	-1	28	5	Spring2020	BNG201	2427-MR Shaikh Mahfuzur Rahman	C4005-S
7c37b892-72a3-4761-abd4-1638c2e95fa8	17:00:00	MW	-1	22	6	Spring2020	BNG201	2427-MR Shaikh Mahfuzur Rahman	C5005-S
dc234a51-3f1c-4859-be55-3ab87e720a70	13:40:00	MW	-1	46	1	Spring2020	BPH101	2398-MR Sayed Abu Touab Shakir	BC7002-S
3dfef9b0-3251-4ff8-94ac-31293f07d4fd	15:20:00	MW	-1	46	2	Spring2020	BPH101	2398-MR Sayed Abu Touab Shakir	BC5002-S
5a5edc7a-3529-4c09-a4f3-bfbc222a653b	17:00:00	MW	-1	36	3	Spring2020	BPH101	2398-MR Sayed Abu Touab Shakir	BC7002-S
3aa8bcbb-3b45-460a-8af9-25b2eb28592a	08:00:00	ST	-1	31	1	Spring2020	BUS201	3251-MS Farzana Chowdhury	BC2011-S
27620c1b-37b5-47f7-92e6-034fdd34695b	08:00:00	MW	-1	31	2	Spring2020	BUS201	3251-MS Farzana Chowdhury	BC2011-S
2702e5ec-acf8-4c7c-b00c-a7bd20f2ac53	13:40:00	ST	-1	35	3	Spring2020	BUS201	3423-MR Arifur Rahman Khan	C5004-S
e8d9a9ef-cf9f-43b2-9c74-54a60e0364d4	15:20:00	ST	-1	34	4	Spring2020	BUS201	3465-MS Kashfia Ameen	BC2012-S
4db59474-c032-42a6-9d0e-46637668548e	09:40:00	ST	-1	35	5	Spring2020	BUS201	3442-MR Anwar Zahid	C5004-S
5427b84c-71d2-4b5b-a681-7ed3fa5ea147	17:00:00	MW	-1	11	6	Spring2020	BUS201	3512-MR Kazi Md. Jamshed	BC2010-S
22d48143-4f91-4565-bfa5-3f2b13f2fde1	11:20:00	ST	-1	35	7	Spring2020	BUS201	3525-MS Afnan Ashfaque	C5005-S
9797156f-89d0-4726-9be4-c978e6dfde41	13:40:00	MW	-1	34	8	Spring2020	BUS201	3525-MS Afnan Ashfaque	BC2012-S
b33fa52f-9e45-406e-948e-cc46f85e3b81	17:00:00	ST	-1	9	9	Spring2020	BUS201	3403-MR Awal Al Kabir	BC2011-S
08b775f9-32d1-419b-97c8-5dddc57901d5	15:20:00	MW	-1	35	10	Spring2020	BUS201	3609-MR Wahidul Sheikh	C5004-S
372bf5ef-1105-4ff7-ae6e-6b558c9d4fc5	15:20:00	MW	-1	40	1	Spring2020	BUS202	3135-DR Abul Bashar	BC2010-S
e721c4fc-88e3-4ddd-bdf2-99caab63c4db	13:40:00	MW	-1	39	2	Spring2020	BUS202	3465-MS Kashfia Ameen	BC2013-S
a381f6a1-287e-466b-8b6c-9fcb7cbb9daa	13:40:00	ST	-1	40	3	Spring2020	BUS202	3465-MS Kashfia Ameen	BC2012-S
c9195046-228b-4cc3-93ff-36c267c796dc	17:00:00	MW	-1	38	4	Spring2020	BUS202	3528-MR Md. Mamunur Rashid	BC2011-S
b0eff163-6d16-4285-868c-c7e4556946ab	09:40:00	MW	-1	40	5	Spring2020	BUS202	3534-DR Md. Abdus Salam Akanda	BC2011-S
affe8e1c-a82a-4a10-b59a-9de3ba6f5c5e	08:00:00	MW	-1	29	6	Spring2020	BUS202	3534-DR Md. Abdus Salam Akanda	BC2012-S
a5454b1f-9ece-4e77-96eb-14c77fe204f9	08:00:00	ST	-1	31	7	Spring2020	BUS202	3545-DR Mohammad Osman Gani	BC2012-S
8086e749-a3be-4102-beed-bbee3fa14f60	09:40:00	ST	-1	41	8	Spring2020	BUS202	3545-DR Mohammad Osman Gani	BC2013-S
45148cc5-ba28-4b02-b715-7590fa5340e1	11:20:00	ST	-1	41	9	Spring2020	BUS202	3579-MS Seeratus Sabah	BC2013-S
b8d94753-a118-4292-ba83-08e7af8e6d69	15:20:00	ST	-1	39	10	Spring2020	BUS202	3579-MS Seeratus Sabah	BC2010-S
b1432183-66f0-47d5-9446-dea6a734a671	08:00:00	ST	-1	48	1	Spring2020	BUS360	3159-BAR Sarah Hassan	BC2013-S
29d6d748-9ae0-43a0-a57e-2d475fec0fb0	09:40:00	ST	-1	48	2	Spring2020	BUS360	3159-BAR Sarah Hassan	BC2014-S
5873fe5e-9df1-4cfd-8400-90f03d021d53	15:20:00	ST	-1	47	3	Spring2020	BUS360	3323-MS Qantara Khaleda Khan	BC2011-S
3784ee5f-0a37-48f6-9d25-a90ea255f2ff	17:00:00	ST	-1	48	4	Spring2020	BUS360	3358-MR Mr. Iftekhar Mahfuz	BC2012-S
fa009dc0-59df-47fa-8071-f84116afe864	11:20:00	ST	-1	48	5	Spring2020	BUS360	3358-MR Mr. Iftekhar Mahfuz	BC2014-S
b1f1463f-466c-43c0-be15-f4be3372a1aa	11:20:00	MW	-1	49	6	Spring2020	BUS360	3525-MS Afnan Ashfaque	BC2011-S
3375efd1-9cac-4fea-a4a2-c6634d4607cd	09:40:00	MW	-1	48	7	Spring2020	BUS360	3579-MS Seeratus Sabah	BC2012-S
ccf5f938-cd29-47fe-84d5-ca78af097f10	15:20:00	ST	-1	54	1	Spring2020	BUS485	3149-DR Nadim Jahangir	BC2009-S
4a962d0a-c544-4e3f-8583-1fda81244849	13:40:00	ST	-1	53	2	Spring2020	BUS485	3149-DR Nadim Jahangir	BC2009-S
90e29fe5-2ff9-4b5d-9d0e-411f14a494fc	13:40:00	ST	-1	51	3	Spring2020	BUS485	3185-MR Mohammed Sohel Islam	BC2014-S
a0e59aaf-522e-4f23-9fa8-a6506055e620	09:40:00	MW	-1	37	4	Spring2020	BUS485	3376-MR Naheem Mahtab	BC2013-S
e13973fa-788a-4c32-809d-6f5de73a15dc	13:40:00	MW	-1	49	5	Spring2020	BUS485	3372-DR Samiul Parvez Ahmed	BC3008-S
fbcae4eb-f23b-4be9-919b-e0683a9aa8f6	13:40:00	MW	-1	18	1	Spring2020	CHE101	5252-DR Sadia Nazneen Karobi	C3006-S
e8a3a5e9-97d8-47e1-b4f1-8977b440c132	13:40:00	ST	-1	18	2	Spring2020	CHE101	5252-DR Sadia Nazneen Karobi	BC10017-S
5200a8a8-a216-4f4d-bd5b-9185c8dd2d84	15:20:00	W	-1	15	1	Spring2020	CHE101L	5252-DR Sadia Nazneen Karobi	ESLAB-S
7c409212-562e-46f5-878d-492d06ccc875	15:20:00	T	-1	19	2	Spring2020	CHE101L	5252-DR Sadia Nazneen Karobi	ESLAB-S
2f540bea-d1dc-4679-858c-def9536dec69	08:00:00	ST	-1	27	1	Spring2020	CHI101	2453-MR MMA Rahman Nahid	BC8014-S
e0d5c93b-35f3-4012-bf89-c65d4ddba751	08:00:00	ST	-1	31	1	Spring2020	CIS101	4404-DR Hasina Mamtaz	BC4043-S
46d83103-4070-48da-b74d-95cc7b3b4aa1	11:20:00	ST	-1	32	2	Spring2020	CIS101	4348-MR Md. Abu Sayed	BC4043-S
70afa981-de7b-432e-8227-5bb9ffb3b1ad	08:00:00	MW	-1	33	3	Spring2020	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
97766c67-f965-41a0-b95d-e0ba6843d599	11:20:00	MW	-1	33	4	Spring2020	CIS101	4375-MR Mustafa Nizamul Aziz	BC4043-S
92f19a7d-c0ae-4ab4-af77-d34180796611	13:40:00	ST	-1	32	5	Spring2020	CIS101	4409-MS Ajmiri Sabrina Khan	BC4043-S
c3f133c6-1dbb-43aa-a54a-4969221fc281	17:00:00	ST	-1	32	6	Spring2020	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
cda8696b-4129-4b89-b528-ed3a05c2fcf6	13:40:00	MW	-1	33	7	Spring2020	CIS101	4373-MS Romasa Qasim	BC4043-S
f0ef5303-cc5a-462e-bf8e-435ffca550ee	17:00:00	MW	-1	30	8	Spring2020	CIS101	4376-MR Sanzar Adnan Alam	BC4043-S
d49b2d01-2bed-47aa-a4a3-289a5ad82600	08:00:00	ST	B-0	0	9	Spring2020	CIS101	T001-00 TBA TBA	CSCLab2-S
32d1352e-0942-48d1-894d-3ff42e70a6bd	11:20:00	ST	-1	44	10	Spring2020	CIS101	4330-MR AKM Monzurul Islam	GPLab-S
da4c50c6-e68f-4058-b455-b7ca9997833a	08:00:00	MW	B-0	0	11	Spring2020	CIS101	T001-00 TBA TBA	BC001-S
76550471-5ff1-44db-958d-7b73704304bc	11:20:00	MW	-1	45	12	Spring2020	CIS101	4348-MR Md. Abu Sayed	GPLab-S
51a49c74-e19d-4dbf-9776-237f12ef04da	09:40:00	S	0	31	1	Spring2020	CIS101L	4404-DR Hasina Mamtaz	BC4043-S
7bf05ccf-23ce-4c91-a018-0cc2ebd8d2bd	09:40:00	T	0	32	2	Spring2020	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
d8dbcfda-c845-456c-a805-0424a7cc34f1	09:40:00	M	0	33	3	Spring2020	CIS101L	4330-MR AKM Monzurul Islam	BC4043-S
19634f5d-d641-4d4f-bd5b-2f76b1bc6c26	09:40:00	W	-1	33	4	Spring2020	CIS101L	4375-MR Mustafa Nizamul Aziz	BC4043-S
9024ca17-041a-4552-a82a-d7b2cef19b7a	15:20:00	S	0	32	5	Spring2020	CIS101L	4409-MS Ajmiri Sabrina Khan	BC4043-S
fb625f66-ad35-4b10-9ecd-b6210b628039	15:20:00	T	-1	33	6	Spring2020	CIS101L	4330-MR AKM Monzurul Islam	BC4043-S
36cc2db2-64bb-4f21-aff5-af4327379dda	15:20:00	M	-1	33	7	Spring2020	CIS101L	4373-MS Romasa Qasim	BC4043-S
adf3fb81-518f-494c-8464-bbe9dcf0fdf4	15:20:00	W	0	30	8	Spring2020	CIS101L	4376-MR Sanzar Adnan Alam	BC4043-S
421fc416-b914-42ed-bb88-dd00f7552525	09:40:00	S	B-0	0	9	Spring2020	CIS101L	T001-00 TBA TBA	CSCLab2-S
16a6d065-ea87-4bd4-b304-f2059e51798f	09:40:00	S	-1	44	10	Spring2020	CIS101L	4330-MR AKM Monzurul Islam	GPLab-S
7ef201e7-1668-4aa4-9ca8-b0bfe4d92396	09:40:00	M	B-0	0	11	Spring2020	CIS101L	T001-00 TBA TBA	CSCLab2-S
35e79cb4-0f71-497f-b328-867d1923b10d	09:40:00	W	0	45	12	Spring2020	CIS101L	4348-MR Md. Abu Sayed	GPLab-S
6b616771-ba70-4b24-a3cd-8834242c38aa	15:20:00	ST	-1	32	1	Spring2020	CMN201	2164-MR Mohammad Masud Chowdhury	BC4011-S
7ec21e8f-5e4d-4099-ab05-c5a36d936775	13:40:00	ST	-1	30	2	Spring2020	CMN201	2258-MS Tasneem Shahrukh	BC4010-S
be599026-2a43-486b-9d76-0e5c826bba4d	15:20:00	ST	-1	30	3	Spring2020	CMN201	2278-MS Tazeen Ahmed	BC4012-S
7a062f56-9006-4319-9f09-660156420a16	08:00:00	ST	-1	25	4	Spring2020	CMN201	2171-MS Fariya Hossain Khan	BC4010-S
7560be9d-fdb3-4aa6-b988-931dd2340227	09:40:00	MW	-1	31	5	Spring2020	CMN201	2171-MS Fariya Hossain Khan	BC4011-S
79bb0c45-c01e-4c49-8ccc-d1242c840891	11:20:00	ST	-1	31	6	Spring2020	CMN201	2213-MS Jessica Tartila Suma	BC4010-S
5891cba0-01fd-43a0-ada4-44054dc9b10c	09:40:00	ST	-1	31	7	Spring2020	CMN201	2255-MS Momtaz Parvin Mumu	BC8012-S
a0fb8e8e-9fa9-4361-b024-49aaaabb4f18	08:00:00	MW	-1	31	8	Spring2020	CMN201	2270-MS Raisa Rasheeka	BC4010-S
56325490-e165-4379-aef1-ab28b064a0bd	11:20:00	MW	-1	31	9	Spring2020	CMN201	2393-MS Janina Islam Abir	C4004-S
654d6b54-a707-447f-bc2f-ab63a37d8675	17:00:00	ST	-1	28	10	Spring2020	CMN201	2441-MS Refat Ara Jerin	BC4010-S
640c5243-1b23-4c88-aef9-0b111f5c29d7	08:00:00	MW	-1	22	11	Spring2020	CMN201	2382-MS Raiyana Rahman	BC4011-S
f261e23b-5fc4-47f0-8e6e-fff30d415e55	11:20:00	ST	-1	31	12	Spring2020	CMN201	2382-MS Raiyana Rahman	BC4011-S
59c2ec40-9448-491b-a722-5f2fca80d2f5	08:00:00	MW	-1	29	13	Spring2020	CMN201	2441-MS Refat Ara Jerin	BC4012-S
9a77ec41-d7c5-4c52-8e70-288647e5a0f9	15:20:00	MW	-1	31	14	Spring2020	CMN201	2442-MS Mushfeqa Islam	C4004-S
4f375b6d-7b6b-4414-b621-d5ef48b1ab70	13:40:00	MW	-1	15	1	Spring2020	CMN202	2171-MS Fariya Hossain Khan	C2002-S
076f71a9-0da7-46db-91be-dfb6b6c1fe7c	09:40:00	MW	-1	17	2	Spring2020	CMN202	2382-MS Raiyana Rahman	C2006-S
986c725c-827a-4a2c-84dd-a154d0181419	11:20:00	MW	-1	10	1	Spring2020	CMN203	2258-MS Tasneem Shahrukh	BC4010-S
97ede559-1cbe-41ac-a9c0-87643d047f3f	11:20:00	ST	-1	22	2	Spring2020	CMN203	2270-MS Raisa Rasheeka	BC8013-S
a764b856-13b2-4727-8f67-222cb41b1f8c	17:00:00	MW	-1	7	1	Spring2020	CMN205	2164-MR Mohammad Masud Chowdhury	C2003-S
d5785ce2-1501-42d5-bf94-61c8d3d962a9	13:40:00	ST	-1	15	2	Spring2020	CMN205	2441-MS Refat Ara Jerin	C2002-S
d51e23fc-5bc1-47f4-9775-252b9a081811	09:40:00	MW	-1	14	1	Spring2020	CMN207	2278-MS Tazeen Ahmed	C2007-S
0bdcfc5a-3ec8-4d97-94e5-3746cb93ea71	15:20:00	ST	-1	15	2	Spring2020	CMN207	2442-MS Mushfeqa Islam	C2007-S
60691832-1fe3-4560-8616-0750e3b30cc0	11:20:00	MW	-1	10	1	Spring2020	CMN301	2270-MS Raisa Rasheeka	C2002-S
2aa4a3ad-8b8e-4fb9-8d16-07c0e2b7fb60	15:20:00	MW	-1	11	1	Spring2020	CMN302	2299-MS Naila Azad Nupur	BC8014-S
e0c7f258-9914-4d72-9d97-cb1b273cb1f3	15:20:00	MW	-1	20	1	Spring2020	CMN303	2441-MS Refat Ara Jerin	C2002-S
bdf3f0d0-86fd-42c5-98d8-5766d40072be	13:40:00	ST	-1	16	1	Spring2020	CMN304	2278-MS Tazeen Ahmed	BC8013-S
4bea505f-d37a-4218-9d79-78d7531f4433	15:20:00	ST	-1	16	1	Spring2020	CMN305	2270-MS Raisa Rasheeka	C4003-S
87aa4b94-8359-460b-a023-fa719dce931c	17:00:00	MW	-1	7	1	Spring2020	CMN306	2299-MS Naila Azad Nupur	C3006-S
1231449f-2631-4586-ab86-0614502f6c96	13:40:00	MW	-1	13	1	Spring2020	CMN308	2350-MR Syeed Zayadul Ahsan	BC4010-S
e9fd1c64-dd89-4ea0-addf-2f82d64e0bb4	11:20:00	ST	-1	5	1	Spring2020	CMN309	4146-DR Zakir Hossain Raju	C5006-S
d0370f38-f0b7-47ee-b8b4-a11ba5746238	15:20:00	MW	-1	7	1	Spring2020	CMN313	2423-MR Golam Mostafa	C4002-S
5e6881eb-2a69-40bb-b368-a9802d12422e	09:40:00	MW	-1	6	1	Spring2020	CMN314	2368-MR Al Kamal Md. Ziaul Haq	BC4013-S
11e8a376-ce1d-407c-8ed0-3f34827b230d	11:20:00	MW	-1	8	1	Spring2020	CMN318	2213-MS Jessica Tartila Suma	C2003-S
74072208-e3df-4509-a30d-bf1d73984968	15:20:00	MW	-1	13	1	Spring2020	CMN319	2255-MS Momtaz Parvin Mumu	C2003-S
3819ae4e-7c66-463d-955e-c07dd01c2444	11:20:00	MW	-1	9	1	Spring2020	CMN323	2442-MS Mushfeqa Islam	BC4014-S
60fcf926-a495-489f-866f-ae16d3a0cee4	11:20:00	ST	-1	14	1	Spring2020	CMN325	2171-MS Fariya Hossain Khan	C2007-S
7a66caf6-73aa-4dcd-b84a-b37227e0aae4	13:40:00	ST	-1	9	1	Spring2020	CMN326	2164-MR Mohammad Masud Chowdhury	C2003-S
953f2518-4f3b-4b6a-b94d-9dc62292d2bb	15:20:00	ST	-1	17	1	Spring2020	CMN403	2213-MS Jessica Tartila Suma	C3003-S
833a70d2-d411-4a8a-a3e3-ae244500fc76	17:00:00	MW	-1	12	1	Spring2020	CMN406	2456-DR Shah Nister Kabir	C5004-S
54b849e7-b335-480a-8fb6-7d4b4f1dac56	13:40:00	ST	-1	31	1	Spring2020	CMN407	2327-DR ASM Asaduzzaman	C3005-S
908ab96d-e1bd-4a9e-9a47-1beedfb87f22	13:40:00	MW	-1	15	1	Spring2020	CMN409	2278-MS Tazeen Ahmed	BC8013-S
6951e4da-651a-4b2a-b76f-ab466db55936	13:40:00	MW	-1	14	1	Spring2020	CMN414	2393-MS Janina Islam Abir	BC4011-S
42c9cbb9-a735-4f54-b3c9-e7b938d90927	17:00:00	ST	-1	15	1	Spring2020	CMN416	2308-MR Syed Ali Haider Rizvi	C2006-S
27e7dd40-f47a-461f-bc93-fc06780324f5	13:40:00	ST	-1	10	1	Spring2020	CMN420	2393-MS Janina Islam Abir	C2006-S
595777e8-13eb-42d5-a0c6-7fcea821ac53	13:40:00	MW	-1	6	1	Spring2020	CMN421	2178-DR G. M. Shahidul Alam	BC8014-S
9017434b-f5ba-415b-acc3-65d4d3792db6	09:40:00	ST	-1	22	1	Spring2020	CMN422	2258-MS Tasneem Shahrukh	BC9015-S
e8e5cda0-e9ab-4897-893c-930482e11194	11:20:00	ST	-1	17	1	Spring2020	CMN423	2318-MR Khaled Md Shariful Islam	C2006-S
374d6f5f-01e0-473b-bd74-f43d579f8be8	15:20:00	ST	-1	19	1	Spring2020	CMN425	2382-MS Raiyana Rahman	C3002-S
483a3eca-3283-440e-9750-afb9444993d0	17:00:00	ST	-1	8	1	Spring2020	CMN426	2335-MS Parsa S. Sajid	C2003-S
7db9e5cb-86fc-48da-ac33-e0b338e6c0c4	13:40:00	MW	-1	14	1	Spring2020	CMN429	2164-MR Mohammad Masud Chowdhury	C2003-S
9feb5753-6d5e-4f67-952a-17bc1cc8f22e	08:00:00	A	-1	10	1	Spring2020	CMN498	2258-MS Tasneem Shahrukh	BCTBA1-S
8e6ad925-4c1b-49a4-bbbc-9267acba79b7	09:40:00	A	-1	2	1	Spring2020	CMN499	2270-MS Raisa Rasheeka	BCTBA1-S
cd9621ac-dde1-4337-b235-af484a5309af	08:00:00	ST	-1	30	1	Spring2020	CSC101	4397-MR Mohammad Motiur Rahman	CSCLab1-S
b1423aa5-55fb-4d74-b59a-7862e1b7ebfc	11:20:00	ST	-1	32	2	Spring2020	CSC101	4397-MR Mohammad Motiur Rahman	CSCLab4-S
04842ebd-535b-4b3f-ba00-cb2bfc46b0d9	08:00:00	MW	-1	35	3	Spring2020	CSC101	4416-MR Md. Fahad Monir	CSCLab1-S
8c32bbf9-28d6-4e3b-956d-044589e63757	11:20:00	MW	-1	36	4	Spring2020	CSC101	4241-DR Md. Ashraful Amin	CSCLab1-S
5ff281b5-a0ac-4205-8346-bb36251b99ba	08:00:00	ST	-1	31	5	Spring2020	CSC101	4416-MR Md. Fahad Monir	CSCLab3-S
dd5fd5ce-22a4-4704-a08b-0921394f3cb1	11:20:00	ST	-1	35	6	Spring2020	CSC101	4416-MR Md. Fahad Monir	CSCLab3-S
90c68cb4-009a-42c8-af86-e9337e62bc66	09:40:00	T	0	30	1	Spring2020	CSC101L	4397-MR Mohammad Motiur Rahman	CSCLab1-S
7a7c670c-63f6-4994-9000-9d2a04cbcc67	09:40:00	S	0	32	2	Spring2020	CSC101L	4397-MR Mohammad Motiur Rahman	CSCLab4-S
c7e5e7bd-55e0-4ae0-8206-9761e6f7e6c0	09:40:00	W	0	35	3	Spring2020	CSC101L	4416-MR Md. Fahad Monir	CSCLab1-S
4b74432c-f914-4003-8150-a16258c62843	09:40:00	M	0	36	4	Spring2020	CSC101L	4241-DR Md. Ashraful Amin	CSCLab1-S
ffd2bce6-61e3-44f1-ab60-350b65ceef17	09:40:00	T	0	31	5	Spring2020	CSC101L	4416-MR Md. Fahad Monir	CSCLab3-S
9f7f5669-b624-4594-9c69-9aa0abc0f21a	09:40:00	S	0	35	6	Spring2020	CSC101L	4416-MR Md. Fahad Monir	CSCLab3-S
f3f1c99c-c29d-4012-a5b8-c7f9d05ef82f	08:00:00	MW	-1	35	1	Spring2020	CSC121	4375-MR Mustafa Nizamul Aziz	GPLab-S
7c869e2e-5b9e-4d39-93c0-f124500e5e6f	09:40:00	M	-1	36	1	Spring2020	CSC121L	4375-MR Mustafa Nizamul Aziz	GPLab-S
bde1c3b9-b40d-4f35-b78f-49b8a57fd7d3	17:00:00	ST	-1	57	1	Spring2020	CSC301	4362-MR Bijoy Rahman Arif	BC6008-S
8944f856-a483-42d4-bc03-d326411d5ece	18:30:00	T	-1	61	1	Spring2020	CSC472	4418-MR Nashid Ali	BC5013-S
0edd9339-1cb8-4fb9-8677-aefd54d00677	08:00:00	ST	-1	21	1	Spring2020	CSE104	4409-MS Ajmiri Sabrina Khan	BC6009-S
5e62527e-c6e6-44ca-b7a9-711f5ccec8a4	08:00:00	MW	-1	22	2	Spring2020	CSE104	4409-MS Ajmiri Sabrina Khan	BC5014-S
7e530774-d289-48d0-8b18-c07f42c78ae5	13:40:00	MW	-1	33	3	Spring2020	CSE104	4285-DR Ferdows Zahid	BC5014-S
52a53535-e6ed-42ff-8095-26269522b27d	09:40:00	ST	B-0	0	4	Spring2020	CSE104	T001-00 TBA TBA	BC001-S
081963e9-3dc1-4559-a48b-83ec364af266	09:40:00	T	0	21	1	Spring2020	CSE104L	4409-MS Ajmiri Sabrina Khan	CENLAB-S
e14a57d8-b569-4f2b-98a9-5295d04c6f60	09:40:00	W	-1	22	2	Spring2020	CSE104L	4409-MS Ajmiri Sabrina Khan	CENLAB-S
e3dd0916-08c1-4a2b-9e71-9b5a1d27f02a	17:00:00	M	-1	33	3	Spring2020	CSE104L	4285-DR Ferdows Zahid	CENLAB-S
073288a4-566a-4684-818e-ec0417c11f27	08:00:00	T	B-0	0	4	Spring2020	CSE104L	T001-00 TBA TBA	CENLAB-S
54346a56-51a7-474e-80b2-48db63e37d9d	09:40:00	ST	-1	29	1	Spring2020	CSE201	4228-DR Habib Bin Muzaffar	C6005-S
5d0e2a8f-bcbe-4819-8b4a-04b417e169a0	15:20:00	MW	-1	41	2	Spring2020	CSE201	4434-MS Sadita Ahmed	C3004-S
ca09969b-6ea4-4aaa-995b-412b8b89490d	17:00:00	MW	B-0	0	3	Spring2020	CSE201	T001-00 TBA TBA	BCTBA3-S
6f258fdd-e859-46c8-a8b6-43ed94084638	11:20:00	ST	-1	41	4	Spring2020	CSE201	4362-MR Bijoy Rahman Arif	C5004-S
a67c8c68-ee2f-4349-8b10-fedf0a13f68f	08:00:00	ST	-1	44	1	Spring2020	CSE203	4408-MR Asif Bin Khaled	GPLab-S
5afd60cd-81a3-4495-8cb5-65e71fe16505	08:00:00	MW	-1	35	2	Spring2020	CSE203	4401-MR AKM Mahbubur Rahman	CSCLab2-S
23afc00b-2017-4e9b-a9b6-c12910c74c29	11:20:00	ST	-1	37	3	Spring2020	CSE203	4408-MR Asif Bin Khaled	CSCLab1-S
668362e4-9b39-4955-b95c-82eaaa732186	08:00:00	MW	B-0	0	4	Spring2020	CSE203	T001-00 TBA TBA	BCTBA1-S
ce29234e-4dd1-4cd7-abed-e6d10fc33887	11:20:00	MW	-1	40	5	Spring2020	CSE203	4373-MS Romasa Qasim	CSCLab3-S
d882f902-18e9-4ba3-9485-1aee83676364	09:40:00	T	-1	44	1	Spring2020	CSE203L	4408-MR Asif Bin Khaled	GPLab-S
ae7a5f5c-c46c-4585-8d55-5312c73aafd0	09:40:00	W	-1	35	2	Spring2020	CSE203L	4401-MR AKM Mahbubur Rahman	CSCLab2-S
72c74a47-6e3f-447d-afd9-07f572a8d17f	09:40:00	S	-1	37	3	Spring2020	CSE203L	4408-MR Asif Bin Khaled	CSCLab1-S
416751e6-fabd-4298-90c1-5a4f7542940f	09:40:00	M	B-1	0	4	Spring2020	CSE203L	T001-00 TBA TBA	BCTBA1-S
17865b96-a033-4763-a331-1ed4606387ee	09:40:00	W	-1	40	5	Spring2020	CSE203L	4373-MS Romasa Qasim	CSCLab3-S
4e4304e7-54a1-4c65-bf0f-a5d0a801240a	09:40:00	ST	-1	27	1	Spring2020	CSE204	4251-MR Md. Raihan Bin Rafique	BC5013-S
c1b834c7-ede4-4a76-8697-15f0ed193802	11:20:00	ST	-1	37	2	Spring2020	CSE204	4251-MR Md. Raihan Bin Rafique	BC8015-S
c15d4f85-ada0-4d13-834a-c7dfdbbee60d	09:40:00	MW	-1	32	3	Spring2020	CSE204	4251-MR Md. Raihan Bin Rafique	BC6012-S
6bf670be-ac05-4d15-afaf-11a2416919fb	11:20:00	MW	B-0	0	4	Spring2020	CSE204	T001-00 TBA TBA	FT-S
24f4f29d-894c-48cc-9f5e-e7f9ef1ec82d	11:20:00	R	0	27	1	Spring2020	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
ed7a4b3a-a510-4880-9378-fa0e46a1b32d	09:40:00	R	0	37	2	Spring2020	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
22893768-bdba-49cd-b4d9-cd7930e1602f	11:20:00	M	0	32	3	Spring2020	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
d868ef03-d084-4cbc-99c3-2a06780bdc73	09:40:00	M	B-0	0	4	Spring2020	CSE204L	T001-00 TBA TBA	BCTBA3-S
274736c8-3170-4941-ae04-b9a891e14292	11:20:00	ST	-1	26	1	Spring2020	CSE210	4383-DR Faisal Uddin	BC6013-S
689f7b2a-4f32-487a-ac3e-0fb6cc2a542e	09:40:00	MW	-1	22	2	Spring2020	CSE210	4383-DR Faisal Uddin	BC6009-S
75fd701f-f10e-49c8-9cee-7c3db6769a3d	15:20:00	MW	-1	35	3	Spring2020	CSE210	4285-DR Ferdows Zahid	BC6009-S
39b0bb41-a225-4928-9035-6030962150e5	13:40:00	S	0	26	1	Spring2020	CSE210L	4435-MR Shahed Alam	CENLAB-S
a01979a5-48bf-4eb8-bb4d-9412b6efcf0e	11:20:00	W	0	22	2	Spring2020	CSE210L	4435-MR Shahed Alam	CENLAB-S
8e8c955a-e336-49d9-b918-f976014d5fb1	17:00:00	W	-1	35	3	Spring2020	CSE210L	4285-DR Ferdows Zahid	CENLAB-S
228b5a54-dbd5-43d7-b06a-52c863c732cb	11:20:00	ST	-1	34	1	Spring2020	CSE211	4373-MS Romasa Qasim	CSCLab2-S
505d587a-bf04-46f4-96e4-3770c24357fd	11:20:00	MW	-1	31	2	Spring2020	CSE211	4408-MR Asif Bin Khaled	CSCLab4-S
21572266-216c-491f-bb34-12bc35d9ed6f	17:00:00	ST	-1	19	3	Spring2020	CSE211	4408-MR Asif Bin Khaled	CSCLab2-S
800ea351-a01c-4d6a-b8c0-7bd32f2d1ca7	13:40:00	MW	-1	29	4	Spring2020	CSE211	4397-MR Mohammad Motiur Rahman	GPLab-S
b9f0f977-1f91-4cb0-ae95-31c8524e60c9	09:40:00	T	-1	34	1	Spring2020	CSE211L	4373-MS Romasa Qasim	CSCLab2-S
7e1138bf-97d8-4dd2-b694-bbb641cc3eb5	09:40:00	M	0	31	2	Spring2020	CSE211L	4408-MR Asif Bin Khaled	CSCLab4-S
2fb59a4b-19ef-4ba3-9d7f-d6a8ed86ea24	15:20:00	S	0	19	3	Spring2020	CSE211L	4408-MR Asif Bin Khaled	CSCLab2-S
93f3ae64-4c44-4e0d-8684-a7d67b0c5e0f	15:20:00	W	0	29	4	Spring2020	CSE211L	4397-MR Mohammad Motiur Rahman	GPLab-S
2f20ca61-2409-4714-a93b-7438ec94b99f	13:40:00	ST	-1	34	1	Spring2020	CSE213	4161-MR Subrata Kumar Dey	CSCLab1-S
f802b378-1154-4931-a1b2-bb026072156f	13:40:00	MW	-1	37	2	Spring2020	CSE213	4161-MR Subrata Kumar Dey	CSCLab1-S
1d763d7c-250f-4e34-b8af-866eee5a1d57	17:00:00	ST	-1	38	3	Spring2020	CSE213	4161-MR Subrata Kumar Dey	GPLab-S
9e278c43-9d7c-49bd-a7c4-ba56500dd213	15:20:00	T	0	34	1	Spring2020	CSE213L	4161-MR Subrata Kumar Dey	CSCLab1-S
ea462a7d-a14c-4a04-8036-26103f35a966	15:20:00	W	0	37	2	Spring2020	CSE213L	4161-MR Subrata Kumar Dey	CSCLab1-S
a474cb9a-c6ca-46a8-a716-48aa838702f9	18:30:00	T	0	38	3	Spring2020	CSE213L	4161-MR Subrata Kumar Dey	GPLab-S
b70946a6-4aa1-4284-aa1b-56ae27c1d2ce	13:40:00	ST	-1	45	1	Spring2020	CSE214	4137-MR Mohammad Noor Nabi	BC6013-S
9d9d8e9e-5151-4b77-808f-e81775252b78	15:20:00	ST	-1	44	2	Spring2020	CSE214	4137-MR Mohammad Noor Nabi	BC6007-S
6910d292-e14b-431a-ae99-6cd2bad93f34	17:00:00	MW	-1	30	3	Spring2020	CSE214	4137-MR Mohammad Noor Nabi	BC6009-S
6e0a1f96-af20-4fcc-b7f6-af5a618d960a	11:20:00	ST	-1	37	1	Spring2020	CSE216	4242-MR Prof. Farruk Ahmed	BC6008-S
9517e63f-8c4e-4474-baa8-4ba66a432d67	09:40:00	MW	-1	22	2	Spring2020	CSE216	4433-MR Hamidur Rahman	BC6013-S
ce6a956d-2356-4284-ba8c-868c9fc34214	11:20:00	MW	-1	34	3	Spring2020	CSE216	4406-MR Mohammad Rejwan Uddin	BC6009-S
34f75a9f-1254-4aa7-a6ba-afea7b23d89d	08:00:00	S	-1	37	1	Spring2020	CSE216L	4435-MR Shahed Alam	CENLAB-S
820627cf-7b50-4cc4-8242-5e214815fcfd	08:00:00	M	-1	22	2	Spring2020	CSE216L	4435-MR Shahed Alam	CENLAB-S
0ecd6dac-d06e-49cc-bdf6-3d32a3c03966	13:40:00	M	-1	34	3	Spring2020	CSE216L	4406-MR Mohammad Rejwan Uddin	CENLAB-S
3951ef82-970b-476e-b106-80f2f6e44355	13:40:00	ST	B-0	-1	1	Spring2020	CSE303	T001-00 TBA TBA	CSCLab4-S
5b79f8db-435c-4a8e-90d1-c86ca95a622f	13:40:00	ST	-1	47	2	Spring2020	CSE303	4348-MR Md. Abu Sayed	GPLab-S
71283040-ce78-46a3-a96c-ceeb4839eade	17:00:00	MW	-1	38	3	Spring2020	CSE303	4184-DR Mahady Hasan	GPLab-S
fd6b9357-9598-4d3a-acb3-bcef3239d334	15:20:00	S	B-0	-1	1	Spring2020	CSE303L	T001-00 TBA TBA	CSCLab4-S
b31ee6fe-b27f-4497-a09b-6ecd1c232dcd	15:20:00	S	0	47	2	Spring2020	CSE303L	4348-MR Md. Abu Sayed	GPLab-S
db56df72-3718-45dc-9ed8-77713616fe4d	15:20:00	M	-1	38	3	Spring2020	CSE303L	4184-DR Mahady Hasan	GPLab-S
e6a2eaa4-0d3c-4239-ad11-24b9c0045fa7	17:00:00	ST	-1	25	1	Spring2020	CSE307	4432-DR Al-Sakib Khan Pathan	BC6009-S
f4c4d4f0-2c6b-48ac-aeb2-e848c0158838	08:00:00	MW	-1	44	2	Spring2020	CSE307	4432-DR Al-Sakib Khan Pathan	BC6007-S
58a321fe-d938-4b9a-adc5-907792e23745	17:00:00	ST	-1	32	1	Spring2020	CSE309	4376-MR Sanzar Adnan Alam	CSCLab1-S
52235320-8a1d-4f1b-9e6c-bbc2ce5ca550	08:00:00	MW	-1	33	2	Spring2020	CSE309	4376-MR Sanzar Adnan Alam	CSCLab3-S
ea92dcc4-db7e-4e74-80ee-ca5df72218ff	15:20:00	ST	-1	40	1	Spring2020	CSE310	4248-DR Satyen Biswas	BC6008-S
ec526f8a-e5d8-4813-b56f-c2345058a260	15:20:00	MW	-1	37	2	Spring2020	CSE310	4248-DR Satyen Biswas	BC6012-S
483ebf2b-b9ff-4d25-9fb8-e0d7fdc107cd	13:40:00	T	0	40	1	Spring2020	CSE310L	4406-MR Mohammad Rejwan Uddin	CENLAB-S
3c98f4be-3856-44a2-8499-5e0649d0e928	13:40:00	W	0	37	2	Spring2020	CSE310L	4406-MR Mohammad Rejwan Uddin	CENLAB-S
4b21a79a-1092-4e69-9f89-f1e6e5728b17	15:20:00	ST	-1	35	1	Spring2020	CSE313	4362-MR Bijoy Rahman Arif	BC6009-S
5ed963be-f5da-4859-b550-3069278aa06a	15:20:00	MW	B-0	0	2	Spring2020	CSE313	T001-00 TBA TBA	BC6013-S
d9967a17-c298-4a35-9d67-6207db6ba9b8	17:00:00	ST	-1	50	1	Spring2020	CSE315	4137-MR Mohammad Noor Nabi	BC6012-S
7ae127bb-e38a-4c86-91d2-17d0c67046c7	17:00:00	MW	B-0	0	2	Spring2020	CSE315	T001-00 TBA TBA	BCTBA4-S
e446f018-185f-406c-a551-f0cdf6679b95	09:40:00	ST	-1	22	1	Spring2020	CSE316	4383-DR Faisal Uddin	BC10018-S
224c40b0-7e89-4178-baa3-976e06e2bc8b	13:40:00	MW	-1	37	2	Spring2020	CSE316	4382-DR Tarem Ahmed	BC6007-S
230e98f0-f9f7-43f2-b8da-3d3adc5fd005	17:00:00	ST	-1	20	3	Spring2020	CSE316	4382-DR Tarem Ahmed	BC6013-S
5bc1ae97-758c-4d74-bbdd-8c5ed8c37ada	17:00:00	MW	B-0	0	4	Spring2020	CSE316	T001-00 TBA TBA	BC6013-S
e1c9ee79-d3c1-4f91-bcd8-6a37f1a63b49	15:20:00	M	0	22	1	Spring2020	CSE316L	4382-DR Tarem Ahmed	CSCLab3-S
c29b22cc-242b-43d6-8f0b-5159b225a9b7	15:20:00	T	-1	37	2	Spring2020	CSE316L	4382-DR Tarem Ahmed	CSCLab3-S
1b9238ac-51ae-41c1-95df-1324550d148c	15:20:00	S	-1	20	3	Spring2020	CSE316L	4382-DR Tarem Ahmed	CSCLab1-S
ae6a12ee-92ef-43ac-992c-b6146db83ad3	15:20:00	W	B-0	0	4	Spring2020	CSE316L	T001-00 TBA TBA	CSCLab3-S
fca1350d-a9f8-4f7a-8c2d-f1a460a9c1cc	13:40:00	MW	-1	34	1	Spring2020	CSE317	4401-MR AKM Mahbubur Rahman	CSCLab2-S
e7f1394f-5ccd-4f1a-9a37-4b92c6e29028	17:00:00	MW	-1	36	2	Spring2020	CSE317	4362-MR Bijoy Rahman Arif	CSCLab2-S
75096620-929a-44b3-83a3-b0e1cb0ab484	13:40:00	ST	-1	20	3	Spring2020	CSE317	4336-DR Amin Ahsan Ali	CSCLab3-S
0853b92b-3d02-4f03-b0f9-9d89630e014e	15:20:00	M	0	34	1	Spring2020	CSE317L	4401-MR AKM Mahbubur Rahman	CSCLab2-S
c3ac285e-e634-41ce-8c8c-ea9854e064d4	15:20:00	W	0	36	2	Spring2020	CSE317L	4362-MR Bijoy Rahman Arif	CSCLab2-S
81f9d258-413f-47d8-9f7b-f08115cd5f38	15:20:00	S	0	20	3	Spring2020	CSE317L	4336-DR Amin Ahsan Ali	CSCLab3-S
f156f2cd-82ca-4dd9-a2eb-941fd2633d31	18:30:00	M	-1	51	1	Spring2020	CSE408	4242-MR Prof. Farruk Ahmed	BC5014-S
fbd4b90e-f5cc-4b74-b57f-fe981d2b40f6	18:30:00	S	-1	1	1	Spring2020	CSE416	4336-DR Amin Ahsan Ali	C2004-S
26d052ea-18f3-49fb-bed5-520e95babb2c	18:30:00	M	-1	52	1	Spring2020	CSE417	4389-MR Mohammad Shibli Kaysar	BC6013-S
6a33cc06-fea1-410a-b0d6-88bd5743690f	18:30:00	S	B-0	1	1	Spring2020	CSE421	T001-00 TBA TBA	C2005-S
bb471d36-0550-4a3e-8500-0c369eaa8bb9	18:30:00	M	-1	6	1	Spring2020	CSE424	4401-MR AKM Mahbubur Rahman	C3004-S
a631bf5b-727a-4dcc-b4f0-e4d0d127265f	18:30:00	T	-1	17	1	Spring2020	CSE425	4336-DR Amin Ahsan Ali	BC6009-S
70a99db5-10af-49f7-9e0e-9d2066918ac0	18:30:00	W	-1	46	1	Spring2020	CSE441	4242-MR Prof. Farruk Ahmed	BC5012-S
a3054de0-1087-405f-b55b-4c0a79312da3	18:30:00	S	-1	49	1	Spring2020	CSE451	4280-MS Nujhat Nahar	BC5012-S
900630cb-3b63-4ac8-a5a3-10cf1551717a	18:30:00	M	-1	5	1	Spring2020	CSE452	T001-00 TBA TBA	BC5012-S
c2194c8c-b81c-4909-93cc-9123d4e2d063	18:30:00	T	-1	26	1	Spring2020	CSE459	4280-MS Nujhat Nahar	BC5012-S
9e38327b-0539-452c-bcde-39a1b90e132d	11:20:00	ST	-1	7	1	Spring2020	CSE484	4240-DR Kafiul Islam	C4006-S
34b7effd-f1c3-4b10-815c-a4f918ceb004	18:30:00	F	0	0	1	Spring2020	CSE498	4184-DR Mahady Hasan	BCTBA1-S
14e3371d-7b7b-4c12-a2da-8ff2f2626087	08:00:00	F	-1	5	2	Spring2020	CSE498	4242-MR Prof. Farruk Ahmed	BCTBA1-S
eac73f0d-303b-4ab0-9e21-c44310d5571d	09:40:00	F	0	0	3	Spring2020	CSE498	4215-DR Ali Shihab Sabbir	BCTBA1-S
4407c37f-7dfb-4715-84ef-32ba038ea25b	11:20:00	F	0	1	4	Spring2020	CSE498	4241-DR Md. Ashraful Amin	BCTBA1-S
d40815b5-6d08-437f-b933-b7f94f009027	13:40:00	F	0	0	5	Spring2020	CSE498	4285-DR Ferdows Zahid	BCTBA1-S
0951f1b9-c01a-406a-a902-fd7df25516c9	15:20:00	F	0	0	6	Spring2020	CSE498	4382-DR Tarem Ahmed	BCTBA1-S
fcebf478-a9f3-46a6-b351-209a1f147263	17:00:00	F	-1	6	7	Spring2020	CSE498	4336-DR Amin Ahsan Ali	BCTBA1-S
c96e2184-9f0d-4aee-9253-fb051274d41f	20:00:00	F	0	0	8	Spring2020	CSE498	4383-DR Faisal Uddin	BCTBA1-S
91258304-3b3e-4b3f-88d1-b3ac0602a799	08:00:00	F	-1	1	9	Spring2020	CSE498	4401-MR AKM Mahbubur Rahman	BCTBA2-S
2947c7d7-d58a-4d5b-865a-89b29406c0bb	08:00:00	A	-1	5	1	Spring2020	CSE499	4137-MR Mohammad Noor Nabi	BCTBA4-S
ff96e945-3aeb-4c54-8978-7d90967b680e	09:40:00	A	-1	1	2	Spring2020	CSE499	4161-MR Subrata Kumar Dey	BCTBA4-S
fa0e8f56-84eb-4cb5-a163-2daea3bdf0c2	11:20:00	A	-1	1	3	Spring2020	CSE499	4362-MR Bijoy Rahman Arif	BCTBA4-S
1000ed3f-a97c-4e2a-9325-062bd3047734	13:40:00	A	-1	6	4	Spring2020	CSE499	4348-MR Md. Abu Sayed	BCTBA4-S
d1269927-7908-4f7b-b978-af9496b9d9d3	15:20:00	A	-1	1	5	Spring2020	CSE499	4397-MR Mohammad Motiur Rahman	BCTBA4-S
eb7db4f4-2371-4ced-bf2d-fb434b8890a7	17:00:00	A	-1	2	6	Spring2020	CSE499	4373-MS Romasa Qasim	BCTBA4-S
ed06b8d4-4d25-4a20-b53e-58ec54e197b5	18:30:00	A	-1	4	7	Spring2020	CSE499	4376-MR Sanzar Adnan Alam	BCTBA4-S
182187f3-bfc9-47a3-a7e1-fc60333d238a	20:00:00	A	-1	3	8	Spring2020	CSE499	4416-MR Md. Fahad Monir	BCTBA4-S
e435e42a-2d9d-468d-b029-62cbef1676e5	08:00:00	A	-1	2	9	Spring2020	CSE499	4408-MR Asif Bin Khaled	BC001-S
50ac1ab2-606f-4144-83c6-fbf1d0f42d4a	09:40:00	A	-1	6	10	Spring2020	CSE499	4409-MS Ajmiri Sabrina Khan	BC001-S
6531f88a-c312-4080-b8d5-350af8f5edc8	17:00:00	ST	-1	28	1	Spring2020	ECN200	3489-MS Fahmida Islam	BC8015-S
6b24355b-5974-4ae4-b447-89be00e3b603	09:40:00	ST	-1	44	2	Spring2020	ECN200	3491-MS Nuren Nirvana Brishti	BC3009-S
a60943b2-7262-41d7-855e-3cbde41b5e9f	08:00:00	MW	-1	33	3	Spring2020	ECN200	3490-MS Nuzhat Sharmeen	BC3008-S
a7ffa060-5fea-44a1-b18d-a6424117ab45	09:40:00	MW	-1	45	1	Spring2020	ECN201	3463-MR Md. Kamrul Islam	BC3012-S
ba0d02e6-ae5a-48a9-b379-cc659d6f35f9	15:20:00	MW	-1	42	2	Spring2020	ECN201	3490-MS Nuzhat Sharmeen	BC3010-S
f3587d2c-8aaa-4d92-9c46-d23e982d0035	13:40:00	ST	-1	40	3	Spring2020	ECN201	3369-MR Khawaja Saifur Rahman	BC3012-S
a9a8cdce-fccc-40a2-89f3-76d3373a72ea	08:00:00	ST	-1	42	4	Spring2020	ECN201	3463-MR Md. Kamrul Islam	BC3012-S
d887d0ae-a533-477b-b11b-d654fd1a3ae3	15:20:00	ST	-1	45	5	Spring2020	ECN201	3463-MR Md. Kamrul Islam	BC7016-S
7cfa5857-576b-4fbd-b196-64d48df4f2b6	13:40:00	MW	-1	45	6	Spring2020	ECN201	3467-MS Nabila Maruf	BC3011-S
4651dc9f-dc50-499f-b074-2841ff00a061	15:20:00	ST	-1	43	7	Spring2020	ECN201	3490-MS Nuzhat Sharmeen	BC7025-S
3be68828-83e4-474a-9d7f-a805a6deecfc	17:00:00	MW	-1	40	8	Spring2020	ECN201	3489-MS Fahmida Islam	BC3011-S
67b7ebd8-c94b-436f-8f4d-5cfca2c32975	08:00:00	MW	-1	33	9	Spring2020	ECN201	3369-MR Khawaja Saifur Rahman	BC3009-S
15a933d5-4af5-42d4-81b2-c17b04f00390	17:00:00	ST	-1	19	10	Spring2020	ECN201	3491-MS Nuren Nirvana Brishti	BC9014-S
4487d0a9-8a65-4a54-aff5-fc22ed06c2c0	09:40:00	MW	-1	45	11	Spring2020	ECN201	3410-MS Tasneem Bareen Hasan	BC7015-S
4b165da2-2c2e-4132-9801-edc58b97ebda	08:00:00	ST	-1	12	12	Spring2020	ECN201	3410-MS Tasneem Bareen Hasan	BC8011-S
9c88f94b-a890-4540-b8e6-acae95bf6240	13:40:00	MW	-1	44	1	Spring2020	ECN202	3461-MS Mumtahina Islam	BC3012-S
3c87aaa8-ce91-4957-bc14-8937b04686bd	11:20:00	MW	-1	33	2	Spring2020	ECN202	3494-DR Md. Shahnawaz Karim	BC2021-S
8174de25-0093-4a8a-8616-de17846b60d0	13:40:00	ST	-1	45	3	Spring2020	ECN202	3467-MS Nabila Maruf	BC7015-S
e20e2e9a-5384-4eb5-9302-cb5b3978db35	11:20:00	ST	-1	40	4	Spring2020	ECN202	3298-Mr. Shamil M Al-Islam	BC3011-S
33b4f5bf-778e-4568-8841-7b0637e9b660	15:20:00	MW	-1	45	5	Spring2020	ECN202	3467-MS Nabila Maruf	BC3011-S
fb84623e-7d37-45ca-8bf3-c457e6c5f9b0	11:20:00	MW	-1	45	6	Spring2020	ECN202	3369-MR Khawaja Saifur Rahman	BC2020-S
6be84436-45f6-40e5-8d0d-7e6321aa762d	13:40:00	MW	-1	20	7	Spring2020	ECN202	3494-DR Md. Shahnawaz Karim	C5005-S
d29bcea2-e0d1-486f-aec7-1c498ccd7a8e	09:40:00	ST	-1	33	8	Spring2020	ECN202	3461-MS Mumtahina Islam	BC3010-S
2edd65b3-77f1-49f6-9ea5-a50e72c32e6b	15:20:00	ST	-1	32	9	Spring2020	ECN202	3461-MS Mumtahina Islam	BC7026-S
354ef155-70a8-4796-8da1-c7319f1f12a3	08:00:00	ST	-1	4	10	Spring2020	ECN202	3298-Mr. Shamil M Al-Islam	BC8012-S
72bb968f-51a4-473d-8bf2-ab9c0a51efbc	11:20:00	MW	-1	17	1	Spring2020	ECN203	3461-MS Mumtahina Islam	BC4011-S
1a5b6bfe-acea-4121-8679-ad94872ae592	08:00:00	ST	-1	33	1	Spring2020	ECN301	3467-MS Nabila Maruf	BC10014-S
b0bc5e06-8541-4adf-a7c6-ae62931b47eb	17:00:00	MW	-1	23	1	Spring2020	ECN302	3565-DR Shahriar Kabir	BC4010-S
f35cad1b-b1b5-4385-8cf4-413adc5bffe2	11:20:00	MW	-1	30	1	Spring2020	ECN330	3490-MS Nuzhat Sharmeen	BC4012-S
b62c0248-6dc5-4516-aca6-457358b2a8a7	11:20:00	ST	-1	30	1	Spring2020	ECN340	3463-MR Md. Kamrul Islam	BC4013-S
281a74eb-c5fa-4eb6-9669-0f775989fc5b	15:20:00	ST	-1	28	1	Spring2020	ECN382	3369-MR Khawaja Saifur Rahman	BC4014-S
1aba3fac-d00d-4912-8655-6f1d21d41638	08:00:00	MW	-1	12	1	Spring2020	ECN401	3298-Mr. Shamil M Al-Islam	BC4013-S
c02467f3-3652-4f72-bbbc-3541576d2827	09:40:00	ST	-1	22	1	Spring2020	ECN402	3298-Mr. Shamil M Al-Islam	C2003-S
4d3bf642-aaf5-4b59-82ea-eb58bcee8aa0	13:40:00	ST	-1	3	1	Spring2020	ECN420	3494-DR Md. Shahnawaz Karim	BC4012-S
4f1f932a-8afe-43dc-abc8-45ad8ca2b989	17:00:00	ST	-1	7	1	Spring2020	ECN431	3565-DR Shahriar Kabir	BC4011-S
d65d13a5-0f78-472a-ad0e-83e996bddfbd	15:20:00	MW	-1	13	1	Spring2020	ECN435	3265-DR Syed Nayeemul Huda	BC4012-S
4eecc811-22ee-474f-bdf1-47fe8cc4d7f2	13:40:00	MW	-1	25	1	Spring2020	ECN470	3565-DR Shahriar Kabir	BC4014-S
7463914c-867c-48f0-871a-da2b6c9ea37a	09:40:00	MW	-1	17	1	Spring2020	ECN486	3265-DR Syed Nayeemul Huda	BC4012-S
679be2ad-530a-4138-91e4-71fcef35dda0	08:00:00	ST	-1	4	1	Spring2020	ECN490	3565-DR Shahriar Kabir	BC4012-S
cae0ad7a-03d7-49c0-93f2-2dc2d6eb6731	09:40:00	ST	-1	14	1	Spring2020	EEE131	4275-MS Tahsin F. Ara Nayna	C6004-S
410c60db-3366-427c-9646-2ad49068326b	11:20:00	MW	-1	35	2	Spring2020	EEE131	4275-MS Tahsin F. Ara Nayna	C3005-S
1cebb213-6977-4917-aa15-a80186b6ae39	13:40:00	MW	-1	38	1	Spring2020	EEE132	4286-DR Mustafa Habib Chowdhury	BC6013-S
c85264f1-c047-4421-9d8b-b651944a607f	13:40:00	ST	-1	41	1	Spring2020	EEE211	4200-DR Shahriar Khan	BC5014-S
dc5a794d-8866-493d-b6fc-f22bebb991a6	11:20:00	S	-1	16	1	Spring2020	EEE211L	4274-MS Saila Ishrat Annie	CirLab-S
3e5828d8-cbb4-4da3-b067-0bb8a6c05023	09:40:00	W	-1	11	2	Spring2020	EEE211L	4274-MS Saila Ishrat Annie	CirLab-S
0f6cadd6-a5d5-48c9-81db-4f2e1502e4d4	09:40:00	ST	-1	18	1	Spring2020	EEE221	4142-MS Afroza Sultana	BC6008-S
16aa63a5-d851-40f7-83df-e8f828a98b07	13:40:00	MW	-1	29	2	Spring2020	EEE221	4142-MS Afroza Sultana	BC6008-S
42c86162-1ed7-4206-9211-6c6b0e23e077	13:40:00	T	-1	4	1	Spring2020	EEE222L	4278-MR Saurav Das	SIMLAB1-S
8feb8045-fe6a-4e5d-85e8-e5c04eeea31c	17:00:00	S	-1	11	2	Spring2020	EEE222L	4278-MR Saurav Das	SIMLAB1-S
14c8da28-8944-4d04-ad18-450c1e52dca8	15:20:00	ST	-1	19	1	Spring2020	EEE223	4351-MS Navila Rahman Nadi	BC6012-S
064740e0-f6f7-4791-91ca-925960600d5e	13:40:00	ST	-1	32	1	Spring2020	EEE231	4274-MS Saila Ishrat Annie	C4004-S
dbf469f6-58fe-478d-9a01-cff34cc582fb	08:00:00	MW	-1	7	2	Spring2020	EEE231	4274-MS Saila Ishrat Annie	C2005-S
4fb86fbb-e480-4cef-9764-5d44dc757b9c	08:00:00	ST	-1	21	1	Spring2020	EEE232	4142-MS Afroza Sultana	BC6012-S
52868e83-c617-4dc1-9bf5-47e5f48e30b5	15:20:00	W	-1	12	1	Spring2020	EEE232L	4406-MR Mohammad Rejwan Uddin	CirLab-S
6e34d437-089f-4852-8d1e-7f3d181c116b	15:20:00	T	-1	10	2	Spring2020	EEE232L	4406-MR Mohammad Rejwan Uddin	CirLab-S
b624ace7-d6a6-452b-bf12-d255a444e053	11:20:00	ST	-1	20	1	Spring2020	EEE233	4200-DR Shahriar Khan	BC9015-S
11492b53-8d0b-4032-9365-3c6a33ca5b14	17:00:00	ST	-1	7	1	Spring2020	EEE234	4361-MR Shovasis Kumar Biswas	BC9016-S
a0c1ece4-4a06-4bc2-9a44-011d35e68329	09:40:00	MW	-1	28	2	Spring2020	EEE234	4361-MR Shovasis Kumar Biswas	BC7025-S
e0eb0209-d1da-4153-a833-f3e964286c71	11:20:00	M	-1	16	1	Spring2020	EEE234L	4361-MR Shovasis Kumar Biswas	CirLab-S
e8b01c2c-461b-4862-b41e-bf5440d5e14e	11:20:00	W	-1	18	2	Spring2020	EEE234L	4361-MR Shovasis Kumar Biswas	CirLab-S
817c2c1c-14e7-4a01-a925-fef3ab2aa363	15:20:00	MW	-1	36	1	Spring2020	EEE312	4190-DR Khosru Mohammad Salim	BC10018-S
ae6a51d6-9abf-4d66-9688-d07894df7977	08:00:00	S	-1	15	1	Spring2020	EEE312L	4352-MS Zaima Tasneem	PowLab-S
c7652da7-77c8-4223-9883-a8a7a1f9a1d3	08:00:00	M	-1	18	2	Spring2020	EEE312L	4352-MS Zaima Tasneem	PowLab-S
11db44cd-f3bc-400e-8eef-21692553fb0a	13:40:00	ST	-1	31	1	Spring2020	EEE313	4286-DR Mustafa Habib Chowdhury	BC9014-S
3c0f3e6d-ee7c-481d-84cd-bb9ddb303cb4	09:40:00	W	-1	22	1	Spring2020	EEE314L	4360-MR Mohammad Nasfikur Rahman Khan	SIMLAB1-S
7eaa3452-9589-4b6b-bd32-1467fc9a3823	17:00:00	M	-1	19	1	Spring2020	EEE315L	4278-MR Saurav Das	PowLab-S
b1980597-e002-4cb3-abed-78a6d2c246c0	15:20:00	S	-1	17	1	Spring2020	EEE316L	4360-MR Mohammad Nasfikur Rahman Khan	TelLab-S
9e21510e-0b65-42a2-bbc1-a5962691a11a	09:40:00	M	-1	23	2	Spring2020	EEE316L	4360-MR Mohammad Nasfikur Rahman Khan	TelLab-S
8ae04947-15de-4b88-93ee-32f664a44bd1	08:00:00	ST	-1	51	1	Spring2020	EEE321	4274-MS Saila Ishrat Annie	BC6013-S
9e5020f6-c11a-41c9-9f84-a20b4aa5a22c	11:20:00	M	-1	27	1	Spring2020	EEE321L	4274-MS Saila Ishrat Annie	SIMLAB1-S
89d4ed9c-3a92-4541-9c8a-8ba985f3fb1d	17:00:00	T	-1	13	2	Spring2020	EEE321L	4297-MR M. Ishtiaque Rahman	TelLab-S
c511bad0-38bd-4c5b-9312-a667b3e0482f	09:40:00	ST	-1	49	1	Spring2020	EEE323	4360-MR Mohammad Nasfikur Rahman Khan	BC7015-S
f647fd57-5897-4699-ad12-32750a8b4c6f	09:40:00	M	-1	17	1	Spring2020	EEE323L	4351-MS Navila Rahman Nadi	SIMLAB1-S
8e27a01c-6c59-46c6-8449-6c8353abf147	13:40:00	M	-1	23	2	Spring2020	EEE323L	4351-MS Navila Rahman Nadi	SIMLAB1-S
09bdae7d-a1c6-4f4f-97f9-a53f7bd5061d	09:40:00	MW	-1	29	1	Spring2020	EEE332	4212-DR Abdur Razzak	BC7016-S
d271d06c-c9c4-4caa-8160-d0236b593700	11:20:00	S	-1	18	1	Spring2020	EEE332L	4351-MS Navila Rahman Nadi	PowLab-S
efea52cc-6364-42ba-9dea-5af6db87f7ec	15:20:00	M	-1	13	2	Spring2020	EEE332L	4297-MR M. Ishtiaque Rahman	PowLab-S
8d465239-5fd1-47a0-afad-1293e1febe93	09:40:00	ST	-1	37	1	Spring2020	EEE333	4351-MS Navila Rahman Nadi	BC7016-S
b7df64c2-15e1-4977-af5b-518c9b7612a5	17:00:00	ST	-1	16	1	Spring2020	EEE334	4406-MR Mohammad Rejwan Uddin	PowLab-S
0dea6bc9-8268-49d8-a8c5-ab13133de81e	17:00:00	MW	-1	17	2	Spring2020	EEE334	4406-MR Mohammad Rejwan Uddin	SIMLAB1-S
52063817-40a8-4e6a-affc-35a86d33a348	08:00:00	R	-1	17	1	Spring2020	EEE400	4212-DR Abdur Razzak	BCTBA4-S
572e5f4f-bcfe-491c-b906-f7b407323200	09:40:00	R	0	0	2	Spring2020	EEE400	4200-DR Shahriar Khan	BCTBA4-S
41367cdf-0429-49da-91a3-eac19f9ffc81	11:20:00	R	-1	13	3	Spring2020	EEE400	4190-DR Khosru Mohammad Salim	BCTBA4-S
89c8cc6b-a499-4099-bce3-92cbd02d22ba	13:40:00	R	-1	16	4	Spring2020	EEE400	4199-DR Feroz Ahmed	BCTBA4-S
0050938a-fa2f-4c83-ac77-10874e3b1865	15:20:00	R	-1	2	5	Spring2020	EEE400	4240-DR Kafiul Islam	BCTBA4-S
2e232222-4744-46dc-8c76-f9e366422ba9	17:00:00	R	-1	4	6	Spring2020	EEE400	4286-DR Mustafa Habib Chowdhury	BCTBA4-S
79aa1b2f-a257-423b-951c-26394e9c8ba1	11:20:00	MW	-1	10	1	Spring2020	EEE403	4351-MS Navila Rahman Nadi	BC6012-S
4b417a00-2589-4370-aac2-2b68472323a5	15:20:00	ST	-1	27	1	Spring2020	EEE411	4212-DR Abdur Razzak	BC6013-S
9e436ed4-6886-4d3f-93e2-1c1c4f1259fa	08:00:00	T	-1	12	1	Spring2020	EEE411L	4352-MS Zaima Tasneem	PowLab-S
dcea7001-2100-4d24-9bbf-bacdb951b8a1	08:00:00	W	-1	10	2	Spring2020	EEE411L	4352-MS Zaima Tasneem	PowLab-S
94cc6b09-9439-4070-92ef-a98cf56eb5d5	17:00:00	ST	-1	15	1	Spring2020	EEE419	4200-DR Shahriar Khan	C2004-S
46ecfc46-bec6-435a-87de-b4d55c214ff4	13:40:00	S	-1	14	1	Spring2020	EEE419L	4297-MR M. Ishtiaque Rahman	PowLab-S
608b51b2-dd16-437e-be8f-5e6256dd0a74	08:00:00	MW	-1	32	1	Spring2020	EEE422	4324-MR Fokhruz Zaman	BC6008-S
8cefff78-b817-404d-84a5-9375dbe45fc4	09:40:00	T	-1	4	1	Spring2020	EEE423L	4352-MS Zaima Tasneem	PowLab-S
3f992aae-13e0-4bd7-b774-1304e6cb2549	15:20:00	ST	B-0	0	1	Spring2020	EEE435	4190-DR Khosru Mohammad Salim	BC10017-S
52cedb8a-c082-479b-ae4e-945321dca3eb	11:20:00	ST	-1	9	1	Spring2020	EEE438	4190-DR Khosru Mohammad Salim	C6006-S
21ec4497-1a5f-499a-9dba-b2f1d6b00614	15:20:00	MW	-1	8	1	Spring2020	EEE466	4240-DR Kafiul Islam	C2004-S
1eaff166-263b-409f-9aed-52789c2a538f	17:00:00	ST	-1	10	1	Spring2020	EEE490	4360-MR Mohammad Nasfikur Rahman Khan	C2005-S
98d764c0-5915-44f0-866f-bcf3a69e13f0	08:00:00	W	-1	3	1	Spring2020	EEE498	4212-DR Abdur Razzak	FT-S
0a552a9b-a877-46e0-a8a4-68190e6f1da8	09:40:00	T	0	0	2	Spring2020	EEE498	4200-DR Shahriar Khan	FT-S
1926f5a0-5061-4065-9ece-bf96af741229	11:20:00	A	-1	2	3	Spring2020	EEE498	4190-DR Khosru Mohammad Salim	FT-S
483b7e76-8b1a-44f3-a91c-813c87d57797	13:40:00	A	-1	2	4	Spring2020	EEE498	4199-DR Feroz Ahmed	FT-S
249f4e9c-889b-4a2f-bd8b-d3df925a11d8	15:20:00	A	-1	2	5	Spring2020	EEE498	4240-DR Kafiul Islam	FT-S
fa3bcb93-45f8-4460-b082-070620c2731a	20:00:00	A	0	0	6	Spring2020	EEE498	4286-DR Mustafa Habib Chowdhury	FT-S
6170c3bd-e129-4ac4-a003-ba9170e1a99b	08:00:00	F	0	0	1	Spring2020	EEE499	4142-MS Afroza Sultana	A4L04-S
233727b7-83ec-4a2e-988f-552967fa4382	09:40:00	F	0	0	2	Spring2020	EEE499	4274-MS Saila Ishrat Annie	A4L04-S
b1c7b895-59eb-4823-91f3-7529a3b9daaf	11:20:00	F	-1	1	3	Spring2020	EEE499	4275-MS Tahsin F. Ara Nayna	A4L04-S
dfd72ee8-3ca0-4fcb-ad35-c299660906b4	13:40:00	F	-1	2	4	Spring2020	EEE499	4351-MS Navila Rahman Nadi	A4L04-S
b4fe20fd-3c12-4f2c-b101-7486c944c334	15:20:00	F	0	0	5	Spring2020	EEE499	4361-MR Shovasis Kumar Biswas	A4L04-S
47de360e-c4c6-42ba-b8c5-66837f397462	17:00:00	F	-1	9	6	Spring2020	EEE499	4360-MR Mohammad Nasfikur Rahman Khan	A4L04-S
acdb9b0d-67de-4215-86bc-6a41eb1ee0b9	11:20:00	ST	-1	12	1	Spring2020	ELT201	2439-MR Adilur Rahman	C2002-S
4e6a9862-87d7-42f5-bf23-87495ec69081	13:40:00	ST	-1	20	1	Spring2020	ELT203	2439-MR Adilur Rahman	BC4011-S
0e48093a-1b90-487d-a263-82ccc6fbc43b	11:20:00	MW	-1	16	1	Spring2020	ELT301	2439-MR Adilur Rahman	C4005-S
2515e666-91a2-45ee-a410-f03ef90f5842	09:40:00	ST	-1	8	1	Spring2020	ELT302	2002-MS Mithila Mahfuz	BC8014-S
c9b04b2a-4776-4df0-b680-1d98045f9e83	13:40:00	MW	-1	27	1	Spring2020	ELT304	2439-MR Adilur Rahman	BC9016-S
7716d7f2-0605-42ad-b576-e71dcd75c021	13:40:00	MW	-1	15	1	Spring2020	ELT401	2136-MR Md. Shaiful Islam	BC10017-S
ac0ccacf-1e13-4b06-b736-4f3b72d0ec09	11:20:00	ST	-1	26	1	Spring2020	ELT402	2002-MS Mithila Mahfuz	BC8014-S
e533435e-6065-4cf6-8ebe-ba6b491ef48e	09:40:00	ST	-1	18	1	Spring2020	ELT403	2136-MR Md. Shaiful Islam	C2002-S
56a271a1-cde1-408f-b39c-387c3b0775ac	09:40:00	MW	-1	20	1	Spring2020	ELT405	2002-MS Mithila Mahfuz	BC8014-S
71b9af1e-80b3-4c74-877c-0c6f6fd52ba4	08:00:00	MW	-1	7	1	Spring2020	ELT411	2132-MS Rezina Nazneen Rimi	BC8013-S
a10c25cf-5943-4df9-9ea2-b8e9c8eff1bc	11:20:00	MW	-1	21	1	Spring2020	ELT412	2002-MS Mithila Mahfuz	BC8014-S
7001a02e-c2db-4a65-a38d-8d116c55440e	08:00:00	ST	-1	15	1	Spring2020	ELT413	2132-MS Rezina Nazneen Rimi	C2002-S
21b9b034-e240-4fd3-b903-67815b0721c0	11:20:00	ST	-1	16	1	Spring2020	ELT414	2136-MR Md. Shaiful Islam	C2003-S
99dd1a92-d5ec-4ba1-bf3d-bfeb3bb14098	08:00:00	R	-1	5	1	Spring2020	ELT499	2104-MR Syed Mazharul Islam	BCTBA1-S
0be11645-4587-4914-9b23-667ac931237c	11:20:00	ST	-1	47	1	Spring2020	ENG101	2452-MS Mir Sadia Siddequa Sifat	BC7016-S
e23b3113-c745-4fe0-8089-e20648a6c4f6	08:00:00	MW	-1	48	2	Spring2020	ENG101	2247-MS Sumaiya Islam	BC7015-S
0fed70f4-9942-4c95-bb75-3f5b41065a98	09:40:00	MW	-1	48	3	Spring2020	ENG101	2344-MS Nadira Sultana Mirza	BC8011-S
0ffa6c22-c9a9-4da6-af36-9be988565f76	08:00:00	MW	-1	49	4	Spring2020	ENG101	2344-MS Nadira Sultana Mirza	BC7016-S
ae1d68d7-0bb4-44e1-962b-b4a00eede127	17:00:00	ST	-1	47	5	Spring2020	ENG101	2332-MS Fatina Sarwar	BC7015-S
38b47621-77a0-485b-b636-3107c8a703c0	08:00:00	ST	-1	44	6	Spring2020	ENG101	2402-MS Shahnaz Akhter	BC7016-S
d7723761-51a4-414e-a6a9-32f52f455e89	09:40:00	MW	-1	48	7	Spring2020	ENG101	2487-DR AKM Zakaria	BC8012-S
5581c2cb-d63c-4d46-8311-34106f01f4e7	08:00:00	ST	-1	46	8	Spring2020	ENG101	2452-MS Mir Sadia Siddequa Sifat	BC8015-S
405f1795-92cd-4891-8ea1-612098df6e77	09:40:00	ST	-1	39	9	Spring2020	ENG101	2452-MS Mir Sadia Siddequa Sifat	C2004-S
390d065e-4790-49b7-b6e7-7b586e6d0e8f	15:20:00	ST	-1	49	10	Spring2020	ENG101	2409-MS Sanjida Akhter	BC10018-S
bda4e58b-5d17-4b6e-86b0-6e26b54d0db5	17:00:00	ST	-1	46	11	Spring2020	ENG101	2409-MS Sanjida Akhter	BC7016-S
97707b3e-8b49-4e96-9e98-6b45bdc397e6	15:20:00	MW	-1	49	12	Spring2020	ENG101	2291-MS Roksana Akhter Rupee	BC7015-S
3d4a8a7c-fe73-4161-86c6-62f7acd66d13	13:40:00	MW	-1	51	13	Spring2020	ENG101	2291-MS Roksana Akhter Rupee	BC9014-S
9e05e119-4c77-41cb-96ea-d29f1839c415	17:00:00	ST	-1	42	14	Spring2020	ENG101	2411-MS Lameya Alma Amin	BC7025-S
ec9c5339-fb49-460d-b7e1-119d493d7a60	15:20:00	ST	-1	40	15	Spring2020	ENG101	2411-MS Lameya Alma Amin	C2005-S
e1f98801-4746-4cef-950f-02228c894144	09:40:00	MW	-1	39	16	Spring2020	ENG101	2475-MS Khandaker Nayeema Haque	C3004-S
7da6dd9c-a004-47da-bd43-70319b68d785	17:00:00	ST	-1	45	17	Spring2020	ENG101	2488-MR Imtiaz Uddin Sikder	BC7026-S
d233bcfb-3436-4cce-9414-68e509100a88	15:20:00	ST	-1	37	18	Spring2020	ENG101	2440-MS Vikarun Nessa	C3004-S
71368ebd-3833-4c4e-82c4-f711c218ba68	09:40:00	ST	-1	40	19	Spring2020	ENG101	2483-MR Kazi Mubinul Hasan Shanto	C2005-S
59994950-7ce5-4027-aa69-53c1b595bbc0	08:00:00	ST	-1	45	20	Spring2020	ENG101	2483-MR Kazi Mubinul Hasan Shanto	BC9014-S
a335d713-2d0a-4aa4-aace-abbe1c5d135d	13:40:00	MW	-1	39	21	Spring2020	ENG101	2362-MS Sakira Islam	C2005-S
09bf8664-1ef5-4117-98e0-11960fc16d32	08:00:00	MW	-1	48	22	Spring2020	ENG101	2402-MS Shahnaz Akhter	BC7026-S
83972cbd-bb3e-4c60-86de-e4b94e02082b	13:40:00	MW	-1	39	23	Spring2020	ENG101	2440-MS Vikarun Nessa	C3004-S
df3b95e5-18a4-4b9f-8834-e1dcffeddbdf	17:00:00	ST	-1	48	24	Spring2020	ENG101	2489-MS Zarin Tasnim Rahman	BC9017-S
4b6c2b8f-6dc6-4e09-b929-19bbedb4a1d0	17:00:00	MW	-1	46	25	Spring2020	ENG101	2490-MS Pikasha Imam	BC7015-S
2035da08-a80b-41e3-a5e9-2e0b123f171c	15:20:00	ST	-1	28	26	Spring2020	ENG101	2332-MS Fatina Sarwar	BC8013-S
033007a5-1093-474b-b884-5bb77c2874c5	15:20:00	ST	-1	27	27	Spring2020	ENG101	2408-MS Rumana Amin	BC8014-S
b0940550-2d9d-41ac-9ed6-01bbf7d19132	15:20:00	ST	-1	28	28	Spring2020	ENG101	2291-MS Roksana Akhter Rupee	BC9016-S
aa0167e9-edf8-4c3b-a72f-d3c866180093	08:00:00	ST	-1	37	29	Spring2020	ENG101	2344-MS Nadira Sultana Mirza	C4004-S
6b17dd3d-d370-45a5-b3b6-278baceb39de	08:00:00	ST	-1	39	30	Spring2020	ENG101	2488-MR Imtiaz Uddin Sikder	C4005-S
85f4149c-6ddc-49c9-88dd-1b88f3c71ddd	09:40:00	MW	-1	25	31	Spring2020	ENG101	2491-MR Kamrul Hasan Dinar	BC8013-S
8f53d8ca-fec1-4e94-9bc1-d2b032da6419	13:40:00	ST	-1	18	32	Spring2020	ENG101	2409-MS Sanjida Akhter	BC4014-S
cb11cfb2-1bc5-45aa-b063-d56b72ad8a72	11:20:00	MW	-1	20	33	Spring2020	ENG101	2491-MR Kamrul Hasan Dinar	C5005-S
506d5a1b-a18a-4451-89c1-1296044cbe21	17:00:00	MW	-1	43	34	Spring2020	ENG101	2488-MR Imtiaz Uddin Sikder	BC6012-S
c69004a4-7dca-418c-84e8-d31b3aa2e395	09:40:00	MW	-1	42	35	Spring2020	ENG101	2343-MS Nusrat Jahan Jyote	BC9014-S
7107cb84-f22e-4257-a55a-7238bd5d3be0	11:20:00	MW	-1	12	36	Spring2020	ENG101	2343-MS Nusrat Jahan Jyote	C5003-S
c9cbcaf2-ee95-4e98-814e-4c56e8c3d891	13:40:00	MW	-1	19	37	Spring2020	ENG101	2418-MR Md. Ashikuzzaman	C5003-S
4bc179fa-ebe7-4d69-bb22-2fa50704518e	09:40:00	MW	-1	18	38	Spring2020	ENG101	2483-MR Kazi Mubinul Hasan Shanto	C5003-S
670345aa-15ea-4729-9486-50f702e1eb60	15:20:00	MW	-1	40	1	Spring2020	ENG102	2411-MS Lameya Alma Amin	BC7016-S
f125a889-c81e-435d-9b9f-a98db9e921c9	17:00:00	MW	-1	27	2	Spring2020	ENG102	2418-MR Md. Ashikuzzaman	BC7016-S
b7229e7d-0715-41f6-b361-9766f6d95621	15:20:00	ST	-1	36	3	Spring2020	ENG102	1105-MR Kamal Uddin	C3005-S
6072bc92-3426-4a84-8ea6-1055c2a6fe3d	09:40:00	ST	-1	38	4	Spring2020	ENG102	2132-MS Rezina Nazneen Rimi	C3004-S
de030943-3cd7-46ce-b30f-3b9c5a8a1270	15:20:00	ST	-1	40	5	Spring2020	ENG102	2260-MS Andaleeb N. Chowdhury	C4004-S
0d558a41-4247-442b-b23a-589312d6023c	11:20:00	MW	-1	39	6	Spring2020	ENG102	2247-MS Sumaiya Islam	BC7015-S
e59cbe52-4b8b-49c7-ae6a-d7be930beb7b	13:40:00	MW	-1	40	7	Spring2020	ENG102	2259-MR G. M. A Mainuddin Chowdhury	C3005-S
cf198763-62f9-4f19-9678-e8843abfbaca	13:40:00	ST	-1	39	8	Spring2020	ENG102	2219-MR Md. Ziaul Karim	BC7016-S
796f29e6-d28e-43a6-96b3-ef467442abe4	17:00:00	MW	-1	36	9	Spring2020	ENG102	2362-MS Sakira Islam	BC7025-S
f6e56697-aa75-4883-88ce-5deafbdd7c43	15:20:00	MW	-1	10	10	Spring2020	ENG102	2362-MS Sakira Islam	C5005-S
ce993337-f4a7-479a-926b-b5a4171760e3	08:00:00	ST	-1	26	11	Spring2020	ENG102	2342-MS Nasima Haider	BC9017-S
2a59d1e6-8b1c-474c-bb40-8f0458cf3e33	09:40:00	ST	-1	22	12	Spring2020	ENG102	2342-MS Nasima Haider	C3005-S
054bbec5-e503-4d32-9521-3f54994a37d8	11:20:00	ST	-1	24	13	Spring2020	ENG102	2342-MS Nasima Haider	C2005-S
15cd5e14-11aa-4a3f-ad7d-fd99a9aa7ed2	09:40:00	MW	-1	38	14	Spring2020	ENG102	2247-MS Sumaiya Islam	C3005-S
3b4c2446-d763-499e-b6f3-46e51b4b5382	17:00:00	MW	-1	35	15	Spring2020	ENG102	2332-MS Fatina Sarwar	BC7026-S
62508696-37ec-45d8-a34e-3fe168c514c0	08:00:00	MW	-1	31	16	Spring2020	ENG102	2487-DR AKM Zakaria	BC8011-S
c039e00a-88fc-41b3-9bc2-1bfd3d0c96ac	11:20:00	MW	-1	23	17	Spring2020	ENG102	2405-MS Jasmine Ferdous	C2005-S
71ca9f04-631e-4bf1-aa68-c370052a34e5	15:20:00	MW	-1	40	18	Spring2020	ENG102	2408-MS Rumana Amin	BC7026-S
36d3f8ee-9c60-4ed9-bf06-0b0086a47e05	11:20:00	MW	-1	40	19	Spring2020	ENG102	2475-MS Khandaker Nayeema Haque	BC7025-S
3176a7d6-c51d-4fa8-a728-6aafdbb58ea6	17:00:00	ST	-1	32	20	Spring2020	ENG102	2407-MS Sayeeda Sharmin	BC10015-S
29284a41-a850-44d1-a7ea-aca0b5796314	13:40:00	ST	-1	37	1	Spring2020	ENG105	2463-PROF Rabeya Begum	BC7025-S
d8230055-1834-4f06-80dd-0bfd83ee7db0	15:20:00	ST	-1	32	2	Spring2020	ENG105	2463-PROF Rabeya Begum	C4005-S
9356af93-5340-4cc5-8cd0-3d628a235382	17:00:00	ST	-1	17	3	Spring2020	ENG105	2219-MR Md. Ziaul Karim	C2002-S
9241707e-a735-43d6-9659-d3d71a3b0d14	13:40:00	ST	-1	32	4	Spring2020	ENG105	2357-MR Mohammad Israil Hoque	BC7026-S
e2e77cc7-e1aa-4d19-907e-328a47fe81d4	17:00:00	ST	-1	11	5	Spring2020	ENG105	2463-PROF Rabeya Begum	BC10018-S
9927c51f-0553-4ebb-b8e2-b8985248fb9c	15:20:00	ST	-1	24	6	Spring2020	ENG105	2357-MR Mohammad Israil Hoque	C5004-S
e7655952-db11-4f9d-a67d-d2cb8fde4123	15:20:00	ST	-1	6	7	Spring2020	ENG105	2219-MR Md. Ziaul Karim	C5005-S
ec088687-4ff0-4690-b089-980ee78511be	08:00:00	MW	-1	37	8	Spring2020	ENG105	2259-MR G. M. A Mainuddin Chowdhury	BC8012-S
912d4ec7-dd2b-4c50-be67-c74c7ccdb8e0	15:20:00	MW	-1	34	9	Spring2020	ENG105	2475-MS Khandaker Nayeema Haque	BC8012-S
34676602-3701-4e6d-91cd-94f98810a56e	11:20:00	ST	-1	39	10	Spring2020	ENG105	2407-MS Sayeeda Sharmin	C3004-S
8db4be9d-a1aa-41b4-a729-320d3a2b9a23	13:40:00	ST	-1	38	11	Spring2020	ENG105	2407-MS Sayeeda Sharmin	C2004-S
e282e3ca-5c60-4b5b-a453-e57893424ff0	11:20:00	ST	-1	33	12	Spring2020	ENG105	2357-MR Mohammad Israil Hoque	C3005-S
1c933104-0ec3-4419-b995-e3569cba6034	13:40:00	ST	-1	22	13	Spring2020	ENG105	1105-MR Kamal Uddin	C2005-S
8be41f8a-2fd5-4158-978e-0c87a7991845	08:00:00	MW	-1	5	14	Spring2020	ENG105	2405-MS Jasmine Ferdous	BC9016-S
fe57637b-23f4-4e56-8823-ecc3b4e1968e	09:40:00	MW	-1	30	15	Spring2020	ENG105	2405-MS Jasmine Ferdous	C4004-S
4aeebb33-84e5-4ff0-bf29-141ec7f52b33	17:00:00	MW	-1	48	16	Spring2020	ENG105	2408-MS Rumana Amin	BC8012-S
364546d4-324f-4786-bf13-50b79371ced0	11:20:00	ST	-1	40	17	Spring2020	ENG105	1105-MR Kamal Uddin	C4004-S
cac2b349-f395-4415-b468-a436d1b32553	11:20:00	MW	-1	39	18	Spring2020	ENG105	2259-MR G. M. A Mainuddin Chowdhury	BC7026-S
c099660f-e01c-496f-afbe-5a7c86845dd3	17:00:00	MW	B-0	0	19	Spring2020	ENG105	T001-00 TBA TBA	BC8015-S
235314ff-91c2-4ac4-915b-52a9d1422365	15:20:00	MW	-1	27	20	Spring2020	ENG105	2418-MR Md. Ashikuzzaman	BC8015-S
2e774848-f1d1-4447-a9ae-627cbf938406	09:40:00	ST	-1	21	1	Spring2020	ENG201	2126-MS Sayyeda-tun-Noor Sameera	C4004-S
e7f7ac1b-67ed-477c-8a70-c2918b6d4b55	13:40:00	ST	-1	6	1	Spring2020	ENG202	2260-MS Andaleeb N. Chowdhury	BC9015-S
01c5e33c-cf99-4fd2-8e1d-ea7c91471eb5	15:20:00	MW	-1	17	1	Spring2020	ENG311	2260-MS Andaleeb N. Chowdhury	BC4011-S
e77d13e8-f65b-4ecf-abce-91e84193dc4c	13:40:00	MW	-1	13	1	Spring2020	ENG312	2260-MS Andaleeb N. Chowdhury	BC4012-S
8338accf-ef26-4f55-9b63-3d709c90cca9	09:40:00	MW	-1	8	1	Spring2020	ENG313	2126-MS Sayyeda-tun-Noor Sameera	C2003-S
bf8319d4-1117-461e-8f94-3fd70ba7139b	13:40:00	ST	-1	18	1	Spring2020	ENG314	2440-MS Vikarun Nessa	BC9016-S
60fa7da8-5212-451e-b468-f38ea34f8c12	17:00:00	MW	-1	16	1	Spring2020	ENG401	2486-DR Ahmed Ahsanuzzaman	C2002-S
74f72625-0aa0-43cc-a45d-0d21ed96fe0c	11:20:00	MW	-1	14	1	Spring2020	ENG405	2440-MS Vikarun Nessa	BC8013-S
8f1b1f1f-30d1-41d7-9838-b6967693570b	11:20:00	ST	-1	25	1	Spring2020	ENG414	2126-MS Sayyeda-tun-Noor Sameera	BC10017-S
4effcc29-9337-4265-9560-dbee1bb7b2b3	13:40:00	MW	-1	6	1	Spring2020	ENG415	2486-DR Ahmed Ahsanuzzaman	BC4013-S
c929f883-5798-479e-b2cb-9d963c911881	08:00:00	ST	-1	1	1	Spring2020	ENG499	2486-DR Ahmed Ahsanuzzaman	A4L04-S
13743032-4a1a-4186-966b-6a15585e6113	13:40:00	ST	-1	48	1	Spring2020	ENV100	5230-MR Md. Ekhtekharul Islam	BC8011-S
6ae399ba-f8af-4c11-bc9e-a91d09103f5d	13:40:00	ST	-1	27	2	Spring2020	ENV100	5224-MS Rayana Rahman	BC8012-S
0d60ad24-f502-46f9-8386-882399104761	11:20:00	MW	-1	50	1	Spring2020	ENV101	5231-MR Saquib Ahmad Khan	BC8011-S
59f46d8a-e0c3-4d99-af46-96febf13db2a	15:20:00	MW	-1	50	2	Spring2020	ENV101	5231-MR Saquib Ahmad Khan	BC8011-S
1df321bb-ad6f-4f10-a2d0-115fb0048ff5	11:20:00	ST	-1	49	3	Spring2020	ENV101	5230-MR Md. Ekhtekharul Islam	BC8011-S
42478407-e7ef-44db-bbe3-ef4bc21f6e99	13:40:00	MW	-1	50	4	Spring2020	ENV101	5212-MR Chowdhury Kamrul Hasan	BC8011-S
a6c9583e-c6ff-4731-aa47-199df95259eb	13:40:00	MW	-1	47	5	Spring2020	ENV101	5302-DR Abdus Sabur	BC8012-S
521d6b1b-aa32-49fb-a5d5-9ecd449d68dd	15:20:00	ST	-1	52	6	Spring2020	ENV101	5207-MR Tanvir Ahmed Haroon	BC8011-S
73509543-3134-4b6b-a79a-7ef69c2e3a25	13:40:00	ST	-1	49	7	Spring2020	ENV101	5536-MS Karishma Sinha	BC8015-S
3f845cbd-250e-46f6-838f-afd95a830d08	11:20:00	ST	-1	48	8	Spring2020	ENV101	5224-MS Rayana Rahman	BC8012-S
bd863887-2112-4fcc-bb51-b215458b36f8	11:20:00	MW	-1	50	1	Spring2020	ENV102	5207-MR Tanvir Ahmed Haroon	BC10018-S
93f1f8d7-0ec5-4f62-a1b2-301c415ffb40	11:20:00	R	-1	6	1	Spring2020	ENV102T	5207-MR Tanvir Ahmed Haroon	BC8011-S
bf678830-8400-4cee-88f9-3893592cc7e2	11:20:00	MW	-1	23	1	Spring2020	ENV201	5252-DR Sadia Nazneen Karobi	C4003-S
037649cb-dc4f-49f8-9943-a92f4ef691cc	09:40:00	ST	B-0	-3	2	Spring2020	ENV201	5252-DR Sadia Nazneen Karobi	C3002-S
212a2308-820c-45ac-a7aa-55f02a406437	09:40:00	R	-1	25	1	Spring2020	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
7032102a-85d8-4851-8261-f0ebdb26d899	13:40:00	R	B-0	0	2	Spring2020	ENV201L	5129-MR Khondkar Ayaz Rabbani	ESLAB2-S
01e0397c-a921-46f6-ab63-17468688ba19	15:20:00	ST	-1	18	1	Spring2020	ENV202	5199-DR Shahima Islam	C4002-S
c38794a0-5bc9-4679-b162-ea09ff4bd42b	09:40:00	MW	-1	25	2	Spring2020	ENV202	5236-DR Mohammad Sorowar Hossain	C5005-S
e4b351e5-0fe2-458c-a9f2-615f6c9ce3e4	11:20:00	R	-1	18	1	Spring2020	ENV202L	5199-DR Shahima Islam	BLab-S
bf6e7525-28ae-4d60-b72c-9811478a32ec	13:40:00	R	-1	26	2	Spring2020	ENV202L	5236-DR Mohammad Sorowar Hossain	BLab-S
74b21498-0ffc-4271-9ab3-830473487252	17:00:00	ST	-1	12	1	Spring2020	ENV203	5252-DR Sadia Nazneen Karobi	BC4012-S
4feb2e46-96a9-4b1d-b46b-6fec304af35a	09:40:00	ST	-1	33	1	Spring2020	ENV205	5231-MR Saquib Ahmad Khan	BC9016-S
187ea4e1-eb86-4715-8b30-4c550bdfd38c	08:00:00	MW	-1	27	1	Spring2020	ENV206	5259-DR Md. Anamul Haque	BC9015-S
1dc57aac-21d5-43cd-b2bf-1946371ec90f	15:20:00	MW	-1	31	2	Spring2020	ENV206	5302-DR Abdus Sabur	BC4010-S
6380681b-96e4-4d25-8f9d-7f87c8b92b47	13:40:00	MW	-1	15	1	Spring2020	ENV208	5536-MS Karishma Sinha	C4007-S
60b35cec-e50d-4e16-a058-6aa7f13df73f	13:40:00	MW	-1	57	1	Spring2020	ENV212	5207-MR Tanvir Ahmed Haroon	BC8015-S
a1782fab-1855-4e7c-b649-7b633c64282e	09:40:00	ST	-1	25	2	Spring2020	ENV212	5247-DR Tawhid Monzur	BC8011-S
785b46e9-b3dc-43c0-967e-b27eb71c39a2	11:20:00	MW	-1	30	1	Spring2020	ENV216	5212-MR Chowdhury Kamrul Hasan	BC9015-S
0f5c764f-8ceb-4024-b9e8-38a7333e77ee	11:20:00	MW	-1	30	1	Spring2020	ENV220	5230-MR Md. Ekhtekharul Islam	BC9016-S
e8fbce9a-3a67-4bec-bf43-09905ee431e5	13:40:00	MW	-1	30	1	Spring2020	ENV301	5230-MR Md. Ekhtekharul Islam	BC7026-S
aad062ec-2831-4ba8-a07b-8229b37506f9	11:20:00	ST	-1	21	1	Spring2020	ENV302	5247-DR Tawhid Monzur	BC7019-S
cc8933f7-55b8-495d-afa0-3e06e99fb73b	17:00:00	ST	-1	19	2	Spring2020	ENV302	5256-DR Md. Nazrul Islam	BC7019-S
239b4582-701c-4549-ac90-30387080a1c2	09:40:00	R	-1	14	1	Spring2020	ENV302L	5247-DR Tawhid Monzur	BC7019-S
43ace563-8e7c-4421-8e60-60fa45c1f6fc	11:20:00	R	-1	15	2	Spring2020	ENV302L	5247-DR Tawhid Monzur	BC7019-S
63ec1e04-4936-45b7-affa-47eaad717076	15:20:00	R	-1	15	3	Spring2020	ENV302L	5256-DR Md. Nazrul Islam	BC7019-S
ae23b484-763e-493f-8347-3ed431243bf1	17:00:00	ST	0	1	1	Spring2020	ENV303	T001-00 TBA TBA	C3007-S
2ab0cb30-71c4-4d8b-996a-c9bdc3ae1e24	09:40:00	ST	-1	27	1	Spring2020	ENV307	5256-DR Md. Nazrul Islam	BC4014-S
6bb15a28-4520-4672-aca6-07bc0962780d	11:20:00	MW	-1	24	1	Spring2020	ENV310	5199-DR Shahima Islam	C3004-S
84b9f945-0a05-4da9-b59a-6a110d394858	17:00:00	ST	-1	24	1	Spring2020	ENV312	5207-MR Tanvir Ahmed Haroon	BC8011-S
2668e6a6-5fff-44cc-a4c7-ffa0006bb728	08:00:00	MW	-1	34	1	Spring2020	ENV315	5129-MR Khondkar Ayaz Rabbani	BC8015-S
906f0d5b-fe40-4a75-9a51-0afbf0015782	09:40:00	ST	-1	46	1	Spring2020	ENV316	5212-MR Chowdhury Kamrul Hasan	BC5012-S
686b9008-a955-4d2b-9fa3-c4e7017e9f47	11:20:00	ST	-1	52	2	Spring2020	ENV316	5212-MR Chowdhury Kamrul Hasan	BC7026-S
1df1dfab-8b5e-4dc9-ab9d-e50dc94cc94a	15:20:00	ST	-1	31	1	Spring2020	ENV320	5536-MS Karishma Sinha	BC5012-S
ef5c9280-5a03-461a-8eee-8560a253ea54	17:00:00	MW	-1	37	1	Spring2020	ENV325	5142-DR Md. Abdul Khaleque	BC9014-S
6051d75a-1dde-48e1-a215-ea4eb1d0997f	17:00:00	MW	B-0	0	2	Spring2020	ENV325	5277-DR Afzal Ahmed	BC10017-S
ef9e6440-1550-43ae-85de-3d33426be9e3	17:00:00	ST	-1	11	1	Spring2020	ENV330	5291-DR Abu SMG Kibria	BC4013-S
e41abfcd-5a2d-421c-a065-7901332a24d0	15:20:00	MW	-1	9	1	Spring2020	ENV340	5247-DR Tawhid Monzur	BC7019-S
87cc2c1f-a609-43f1-9e1d-c89575a9701d	09:40:00	ST	-1	29	1	Spring2020	ENV346	5215-DR M. H. Rahman	BC4013-S
9d1f7af5-f6ca-468e-97ce-2ac6a134068d	13:40:00	MW	-1	27	1	Spring2020	ENV348	5215-DR M. H. Rahman	BC9015-S
2c484e1b-2ad0-458b-9d8b-15bbe2a29f6d	15:20:00	MW	-1	26	1	Spring2020	ENV350	5536-MS Karishma Sinha	BC4013-S
86b9f628-f1f6-4857-b127-9545d9eea531	17:00:00	ST	-1	15	1	Spring2020	ENV360	5310-DR Sunil Kumar Kundu	C4003-S
f2140ccd-e998-4520-9d4b-3aaa720ffa6d	17:00:00	ST	-1	33	1	Spring2020	ENV401	5250-DR Md. Nasir Uddin	BC8012-S
7dc8ade4-3497-4c59-b5ec-04d0a8214347	09:40:00	MW	-1	30	1	Spring2020	ENV403	5215-DR M. H. Rahman	C2004-S
8927f69b-916f-4dce-9bae-09d80a0968cb	17:00:00	MW	-1	21	1	Spring2020	ENV409	5189-PROF M. Z. Abedin	BC9015-S
5c941404-2d56-4339-a668-482170a2a1aa	17:00:00	MW	-1	31	1	Spring2020	ENV410	5271-DR Arif Jamil	BC8011-S
82c7302d-04f2-4c59-97f0-7694f03f5538	08:00:00	ST	-1	29	1	Spring2020	ENV415	5129-MR Khondkar Ayaz Rabbani	BC9016-S
f1c046fc-5bff-410f-8158-e40b57509471	17:00:00	R	-1	19	1	Spring2020	ENV498	5142-DR Md. Abdul Khaleque	BCTBA3-S
02a92d27-df46-412d-8784-f9b23acc456b	18:30:00	S	-1	6	2	Spring2020	ENV498	5236-DR Mohammad Sorowar Hossain	BCTBA4-S
709fc866-453a-4545-86dc-05a7e20e8c58	08:00:00	F	-1	22	1	Spring2020	ENV499	5142-DR Md. Abdul Khaleque	FT-S
59160c3c-7564-439a-9455-dfbed870535c	20:00:00	R	-1	10	2	Spring2020	ENV499	5236-DR Mohammad Sorowar Hossain	BCTBA4-S
70a6f649-a9b9-4690-9a61-ecec4cab4e10	11:20:00	MW	-1	40	1	Spring2020	ETE312	4199-DR Feroz Ahmed	BC6013-S
8a31cbd3-c830-4843-8c86-e0569fef72c2	11:20:00	S	-1	16	1	Spring2020	ETE312L	4275-MS Tahsin F. Ara Nayna	TelLab-S
b55585e4-d8c4-43e3-b770-9ed8d1352a72	17:00:00	W	-1	3	1	Spring2020	ETE315L	4321-MR Emranul Haque	TelLab-S
4169ac4f-e48d-403b-8b54-4e2991de4b62	11:20:00	ST	-1	24	1	Spring2020	ETE322	4199-DR Feroz Ahmed	BC9017-S
14291ea0-758c-49fa-829f-f4169029b25a	13:40:00	W	-1	22	1	Spring2020	ETE322L	4275-MS Tahsin F. Ara Nayna	TelLab-S
0b775fc1-4e74-49d2-b562-33cf38bc26be	09:40:00	ST	-1	8	1	Spring2020	ETE323	4361-MR Shovasis Kumar Biswas	BC7025-S
9821c2e0-45e0-455a-a455-64b9270cbac4	11:20:00	T	-1	7	1	Spring2020	ETE323L	4361-MR Shovasis Kumar Biswas	TelLab-S
94fc55d1-313d-43f5-b0c5-08416a6de6d2	15:20:00	ST	-1	38	1	Spring2020	ETE331	4275-MS Tahsin F. Ara Nayna	BC10015-S
cd25f871-409f-490b-8e78-16273f2146e0	13:40:00	M	-1	20	1	Spring2020	ETE331L	4275-MS Tahsin F. Ara Nayna	TelLab-S
9668932d-0f41-4fe2-9d72-3c71409f01bd	08:00:00	MW	-1	12	1	Spring2020	ETE332	4360-MR Mohammad Nasfikur Rahman Khan	BC6009-S
975ee0e4-ad86-40bb-9329-d3217d3db116	13:40:00	ST	-1	7	1	Spring2020	ETE335	4142-MS Afroza Sultana	BC6009-S
9c1646e2-9a09-4374-8d04-c2698afb46ac	15:20:00	M	-1	3	1	Spring2020	ETE335L	4275-MS Tahsin F. Ara Nayna	TelLab-S
7532387e-7098-453e-b6df-50fd135739cb	09:40:00	MW	0	0	1	Spring2020	ETE413	4352-MS Zaima Tasneem	C6006-S
e36b9149-d542-4c79-9827-76e16c3f0591	08:00:00	ST	-1	5	1	Spring2020	ETE423	4287-MR Ali Ashraf Molla	C5004-S
3e45faf8-f189-4139-a5d2-1c58c4acf18f	11:20:00	ST	-1	52	1	Spring2020	FIN201	3410-MS Tasneem Bareen Hasan	BC2020-S
7d8fe2c7-20e0-4631-9e55-639023b0e9ff	08:00:00	MW	-1	51	2	Spring2020	FIN201	3588-MR Md. Sajedul Islam	BC2013-S
2b52a33c-078c-4879-8806-41025ab6ee12	17:00:00	MW	-1	51	3	Spring2020	FIN201	3429-MS Jesmin Mannan	BC2012-S
ae73ab01-8c9d-45b6-bf9d-cdf2b6cd44e9	08:00:00	ST	-1	46	4	Spring2020	FIN201	3479-MS Zaima Ahmed	BC2014-S
316b0ed5-ac7f-43f5-837b-59b87467fb45	13:40:00	MW	-1	51	5	Spring2020	FIN201	3468-MS Sumaya Zesmin	BC2014-S
e053f415-590c-4c1c-bdc8-94493bc9202c	13:40:00	ST	-1	51	6	Spring2020	FIN201	3442-MR Anwar Zahid	BC2020-S
f8acedf7-d750-4d32-9b44-75e3962bc293	09:40:00	MW	-1	51	7	Spring2020	FIN201	3344-MR Mohammad Fahad Noor	BC2014-S
a471b04a-6f2f-4479-a18c-5096795a7fec	11:20:00	MW	-1	44	1	Spring2020	FIN301	3442-MR Anwar Zahid	BC2012-S
6d774ffa-9b68-4450-ad91-faa023469a6f	15:20:00	ST	-1	44	2	Spring2020	FIN301	3442-MR Anwar Zahid	BC2013-S
47a71cfd-f7d8-4192-8812-baa6eeecaef8	17:00:00	ST	-1	33	3	Spring2020	FIN301	3588-MR Md. Sajedul Islam	BC2013-S
1a55b7d6-26bb-471a-b9ac-046c2d67cc3c	09:40:00	ST	-1	41	1	Spring2020	FIN302	3344-MR Mohammad Fahad Noor	BC9014-S
e376b976-b856-4ec3-b9e7-7e0db6f7e1c9	15:20:00	MW	-1	39	2	Spring2020	FIN302	3344-MR Mohammad Fahad Noor	BC7025-S
018425b1-e232-4ca0-bc5f-afbe249af4e1	08:00:00	MW	B-0	0	3	Spring2020	FIN302	3479-MS Zaima Ahmed	BC2014-S
04182615-c213-450a-8e76-019b8fbfd139	09:40:00	ST	-1	37	1	Spring2020	FIN401	3479-MS Zaima Ahmed	BC2020-S
47feac0d-2f6d-4c22-966e-abeee648a973	15:20:00	MW	-1	47	2	Spring2020	FIN401	3442-MR Anwar Zahid	BC2011-S
f9aeca08-c144-4ed8-9c56-0260c5762201	17:00:00	ST	-1	47	1	Spring2020	FIN405	3429-MS Jesmin Mannan	BC2014-S
45ec4199-9632-4eb1-9c4e-3e06d6850c5e	17:00:00	ST	-1	30	1	Spring2020	FIN440	3617-MR Anis A. Khan	BC2020-S
d143cbba-d653-4f18-8bad-784694301db1	11:20:00	ST	-1	45	1	Spring2020	FIN460	3344-MR Mohammad Fahad Noor	BC2021-S
0ce1259c-cde0-405c-aa72-1ec590eb50cc	15:20:00	MW	-1	37	2	Spring2020	FIN460	3229-DR Sarwar Uddin Ahmed	BC2012-S
5f703322-245c-45b4-9be7-db5d8aeb6528	15:20:00	ST	-1	48	1	Spring2020	FIN480	3344-MR Mohammad Fahad Noor	BC2014-S
828ac260-36df-48a7-bde7-2a100dde881d	11:20:00	MW	-1	30	2	Spring2020	FIN480	3479-MS Zaima Ahmed	BC2013-S
9a95d8b4-c562-491c-ae58-9c2fa2414359	08:00:00	MW	-1	29	1	Spring2020	FRN101	2160-DR Rifat Rashid	BC8014-S
00fff283-c56e-4326-9178-b69ecf0dd982	09:40:00	MW	-1	30	2	Spring2020	FRN101	2160-DR Rifat Rashid	BC9015-S
eb9afec9-0bb4-42d2-b429-9acdc91dd5d6	08:00:00	ST	-1	22	3	Spring2020	FRN101	2286-MR Mohammed Ataur Rahman	BC4013-S
f5812900-fdac-48d2-9d83-887338d2b053	09:40:00	ST	-1	29	4	Spring2020	FRN101	2286-MR Mohammed Ataur Rahman	BC4011-S
32e2474e-1709-4c78-9b1a-216830f47a32	11:20:00	ST	-1	30	5	Spring2020	FRN101	2286-MR Mohammed Ataur Rahman	BC4012-S
c7b0a3c7-319d-4e19-b5c8-ca89fa60ff99	11:20:00	MW	B-0	0	1	Spring2020	FRN102	2160-DR Rifat Rashid	BC001-S
66849c6a-9d6f-4c04-b730-04920df25463	09:40:00	MW	-1	19	1	Spring2020	GSG101	2469-MR Md. Amjad Hossain	C4005-S
d0bcbd59-4695-4eab-89da-478291692a55	08:00:00	MW	-1	4	2	Spring2020	GSG101	2213-MS Jessica Tartila Suma	C2004-S
8e49e93a-c22d-446d-98a5-10d504a5c2bc	11:20:00	ST	-1	38	3	Spring2020	GSG101	2437-MR Hossain Ahmed Taufiq	C4005-S
76775f98-7c20-4636-9739-112c86c884a9	15:20:00	MW	-1	32	4	Spring2020	GSG101	2479-DR Marufa Akter	BC10014-S
e8159959-4bf1-42b7-b034-34dc62a20459	13:40:00	ST	B-0	0	5	Spring2020	GSG101	2480-MR Mohammad Ashab Uddin	BCTBA3-S
81102e45-2e59-45f4-8248-2edfde09f665	09:40:00	ST	-1	5	1	Spring2020	GSG102	2469-MR Md. Amjad Hossain	BC8013-S
d7416f7c-2b29-4041-8a8a-268ccff2cb5c	11:20:00	MW	-1	2	1	Spring2020	GSG103	2437-MR Hossain Ahmed Taufiq	C3003-S
61c0de03-ec20-48ea-a29c-58de70881cfa	11:20:00	MW	-1	1	1	Spring2020	GSG201	2479-DR Marufa Akter	C3006-S
d93463ef-58e7-4ae8-b394-b4bfbb9802e0	08:00:00	ST	B-0	0	1	Spring2020	GSG202	2392-PROF Imtiaz A. Hussain	C4002-S
7c585b79-9444-4589-8c7a-1d26bf125eaa	08:00:00	MW	-1	1	1	Spring2020	GSG210	2392-PROF Imtiaz A. Hussain	C4002-S
5d08ff9f-f257-416b-b57b-3408ee1f990d	17:00:00	MW	-1	3	1	Spring2020	GSG221	2437-MR Hossain Ahmed Taufiq	C2007-S
a553e723-398d-465a-80eb-57502431916c	15:20:00	MW	-1	4	1	Spring2020	GSG301	2437-MR Hossain Ahmed Taufiq	C3006-S
fee53431-7806-41cd-a04a-039956afca86	09:40:00	MW	-1	1	1	Spring2020	GSG303	2213-MS Jessica Tartila Suma	C3006-S
68251b7f-5dc3-4b0e-91f1-6ac26c85c832	11:20:00	MW	-1	5	1	Spring2020	GSG311	2469-MR Md. Amjad Hossain	C3007-S
e95c59af-951f-40e9-a263-795b27d4a175	08:00:00	ST	-1	3	1	Spring2020	GSG401	2479-DR Marufa Akter	C3002-S
d18db8f0-35fe-4513-a13a-b6fdf70c0352	15:20:00	ST	-1	2	1	Spring2020	GSG402	2437-MR Hossain Ahmed Taufiq	C2003-S
d09b70c2-2b49-4461-9e60-2eb0fb019d5a	13:40:00	ST	-1	6	1	Spring2020	GSG410	2469-MR Md. Amjad Hossain	C3006-S
a95e76fd-5648-4825-8cd3-99a265c1d6ae	11:20:00	ST	-1	4	1	Spring2020	GSG420	2479-DR Marufa Akter	C3007-S
e9d71815-188a-47e2-8c2c-78bd7d0b19f2	15:20:00	ST	-1	5	1	Spring2020	GSG481	2479-DR Marufa Akter	C4007-S
a9d9dca1-27dd-4fd7-b244-b9adc61b94c5	13:40:00	MW	-1	6	1	Spring2020	GSG497	2160-DR Rifat Rashid	C2007-S
161534e9-7c73-4fd0-8327-4e186cad67f5	09:40:00	MW	-1	40	1	Spring2020	HEA101	5519-DR Nafisa Huq	BC10015-S
d6bb6e9c-5a09-45a2-a8cd-1d18c2afa8e6	09:40:00	MW	-1	40	2	Spring2020	HEA101	5530-DR Shabareen Tisha	BC9017-S
3ba2b064-3a96-42ad-9c1d-0f0b1df48a05	11:20:00	MW	-1	38	3	Spring2020	HEA101	5530-DR Shabareen Tisha	BC9014-S
82210456-6374-4f42-8f57-7c7e1596c693	09:40:00	ST	-1	37	4	Spring2020	HEA101	5530-DR Shabareen Tisha	BC10015-S
549c9817-6102-461e-bae0-45fb0ec59791	13:40:00	ST	-1	39	5	Spring2020	HEA101	5530-DR Shabareen Tisha	BC10015-S
5a5176c6-fe90-45f4-8cb3-e016071582f4	08:00:00	ST	-1	38	6	Spring2020	HEA101	5591-DR Tasnuva Faruk	BC10015-S
30db4ffd-dca5-40b5-b5fb-9618a3291de2	13:40:00	ST	-1	38	7	Spring2020	HEA101	5591-DR Tasnuva Faruk	C6005-S
01c686bf-fb20-4a42-b5f5-0c48ea9b3353	08:00:00	MW	-1	36	8	Spring2020	HEA101	5591-DR Tasnuva Faruk	BC10015-S
627313b8-dbea-4fee-ab1e-3be20e029a18	13:40:00	MW	-1	39	9	Spring2020	HEA101	5591-DR Tasnuva Faruk	BC10018-S
f8c21075-a841-41fc-abb5-3ffc2c968d7f	17:00:00	MW	-1	40	10	Spring2020	HEA101	5592-MR Humayun Kabir	BC9017-S
fd1fb722-57e8-42a6-803b-be0850852730	08:00:00	ST	B-0	0	11	Spring2020	HEA101	5596-MS Zareen Tasnim Tapti	BCTBA3-S
e94664d2-a037-4cbb-b681-d0fbcbdd7fb6	17:00:00	MW	-1	39	12	Spring2020	HEA101	5596-MS Zareen Tasnim Tapti	BC10014-S
2b943bfe-4e0e-4b95-adc7-5d8bb649ca7d	17:00:00	MW	-1	7	1	Spring2020	HEA304	5551-DR Khandaker Ezazul Haque	BC9016-S
3e1cde57-128d-4490-a70a-9efa4c7ffef1	15:20:00	ST	-1	42	1	Spring2020	HRM301	3444-DR Ikramul Hasan	BC2020-S
1941bc8e-3341-4fae-8a9c-1d9e7e93526e	08:00:00	ST	-1	45	2	Spring2020	HRM301	3413-MR Shafiqul Alam	BC2021-S
98478d5f-1803-407e-9303-203c51045754	09:40:00	ST	-1	46	3	Spring2020	HRM301	3413-MR Shafiqul Alam	BC2021-S
2aaf3354-eafb-43b4-afc1-0537d35643bc	17:00:00	MW	-1	40	4	Spring2020	HRM301	3446-MS Bushra Sanjana	BC2013-S
270b6cc1-5fd2-422e-8c1e-8fe2e996af9b	15:20:00	ST	-1	33	5	Spring2020	HRM301	3462-MS Sariat Rafa Khan	BC2021-S
db205409-f224-43a7-9422-a70f89706f0a	15:20:00	MW	-1	45	6	Spring2020	HRM301	3446-MS Bushra Sanjana	BC2013-S
8777c9d6-561b-42f2-b8e9-76507899a9fd	13:40:00	ST	-1	45	7	Spring2020	HRM301	3462-MS Sariat Rafa Khan	BC2021-S
760e606f-160a-4de9-8d68-e8e01b7ef3ee	11:20:00	MW	-1	42	8	Spring2020	HRM301	3462-MS Sariat Rafa Khan	BC2014-S
1f9ae813-3b55-4ddc-b081-006e2d62a7b8	11:20:00	ST	-1	51	1	Spring2020	HRM360	3444-DR Ikramul Hasan	BC3008-S
831126df-9061-435c-a301-6e8caacc5eb4	11:20:00	MW	-1	53	2	Spring2020	HRM360	3413-MR Shafiqul Alam	BC3008-S
64b318fa-f6e9-4e51-b0bb-b77c133dc493	15:20:00	ST	-1	52	1	Spring2020	HRM370	3446-MS Bushra Sanjana	BC3008-S
19507f20-265f-450b-bb9b-68fdfc62928f	08:00:00	ST	-1	51	2	Spring2020	HRM370	3254-DR A.N.M. Shibly Noman Khan	BC3008-S
beb954d3-c779-4ad1-bb73-9d94e256759b	13:40:00	MW	-1	52	1	Spring2020	HRM380	3462-MS Sariat Rafa Khan	BC2020-S
b424cb5f-beac-480f-9520-a0a3d5f8dd35	17:00:00	MW	-1	52	2	Spring2020	HRM380	3413-MR Shafiqul Alam	BC2014-S
12721262-66d6-4ca3-8a66-83fde85009de	17:00:00	ST	-1	50	1	Spring2020	HRM390	3446-MS Bushra Sanjana	BC2021-S
01f6e7a9-967e-4d32-9792-42939ece84da	15:20:00	MW	-1	52	2	Spring2020	HRM390	3444-DR Ikramul Hasan	BC2014-S
7454a024-a3e4-4b48-9d0f-51fa439d6053	08:00:00	MW	-1	54	1	Spring2020	HRM410	3254-DR A.N.M. Shibly Noman Khan	BC2020-S
ab821928-d1f2-4637-b311-6bdd492dc4d2	09:40:00	MW	-1	44	1	Spring2020	HRM460	3462-MS Sariat Rafa Khan	BC2020-S
f67e7094-049d-4d88-8858-0d4bf3fe7025	13:40:00	MW	-1	51	2	Spring2020	HRM460	3413-MR Shafiqul Alam	BC2021-S
064dc264-22a1-4d2a-bea2-836762a40c7a	13:40:00	MW	-1	36	3	Spring2020	HRM460	3486-MR Hasan Md. Mahmood Ul Haque	C5004-S
b6ace922-2f56-4b5b-8119-d699495f69c6	08:00:00	MW	-1	40	1	Spring2020	INB301	3539-MR SM Yusuf Mallick	BC3010-S
a1d5eef5-ef60-4bdc-8a9e-a4e9e723824d	08:00:00	ST	-1	39	2	Spring2020	INB301	3548-MS Papia Sultana	C2005-S
1a24a4e3-0574-4683-9f88-a55b7d5eb861	11:20:00	ST	-1	40	3	Spring2020	INB301	3486-MR Hasan Md. Mahmood Ul Haque	BC3012-S
a7631264-9414-4e18-8b74-a57c39179c80	13:40:00	ST	-1	38	4	Spring2020	INB301	3539-MR SM Yusuf Mallick	BC2011-S
8d402377-fe3b-4ac4-b9bc-fed5689079b0	15:20:00	MW	-1	41	5	Spring2020	INB301	3512-MR Kazi Md. Jamshed	BC9017-S
c55db5d1-d145-469e-88b5-254b165d0df6	17:00:00	MW	-1	33	6	Spring2020	INB301	3584-MS Dhritiparna Kundu	BC3012-S
e419efbf-0148-48b3-903d-d9276eb8db64	17:00:00	MW	-1	16	7	Spring2020	INB301	3486-MR Hasan Md. Mahmood Ul Haque	C2005-S
cafd61d4-3a59-4c9a-a1be-1c72c9ff5397	08:00:00	ST	B-0	-1	8	Spring2020	INB301	3568-DR Tareq Mahbub	C3004-S
286f15f8-96d4-49cb-98c5-6027c03be8de	17:00:00	ST	-1	21	9	Spring2020	INB301	3548-MS Papia Sultana	C3004-S
bef34b86-69ec-4f52-9057-20eeb0016291	11:20:00	ST	-1	42	1	Spring2020	INB302	3539-MR SM Yusuf Mallick	BC9014-S
967d2981-72bb-4466-b0d7-83f93609c84d	09:40:00	ST	-1	42	2	Spring2020	INB302	3193-MR Hanif Mahtab	BC3011-S
a9ee0e67-f361-4b1f-b62b-2cc2ab58fab9	11:20:00	MW	-1	40	1	Spring2020	INB303	3539-MR SM Yusuf Mallick	C2004-S
750a89aa-b3bd-4639-8adb-6e1bc0c50d06	17:00:00	ST	-1	12	2	Spring2020	INB303	3486-MR Hasan Md. Mahmood Ul Haque	C3005-S
f077dbf0-e1cd-46d0-ba82-ca268480f712	11:20:00	MW	-1	39	1	Spring2020	INB304	3567-DR Raisul Awal Mahmood	BC7016-S
4c4563d6-b5c6-4e98-8d5b-fd3a6e204a90	13:40:00	MW	-1	41	2	Spring2020	INB304	3567-DR Raisul Awal Mahmood	BC7015-S
73d8a2a4-c62b-4043-bfca-9bedca7dc098	09:40:00	ST	-1	41	1	Spring2020	INB403	3601-MR Md. Touhid Hossain	BC3012-S
ae9dadc0-e4b9-4b25-871e-2156034bfe13	15:20:00	MW	-1	29	1	Spring2020	INB405	3423-MR Arifur Rahman Khan	BC4014-S
5727fe47-aee5-4a47-ac7b-f9ccf54d4eae	08:00:00	MW	-1	6	1	Spring2020	INB406	2459-DR Assaduzzaman	BC3011-S
4adafb9b-37f1-4f4c-91d8-1a4e07318f86	13:00:00	R	-1	32	1	Spring2020	KRN112	4146-DR Zakir Hossain Raju	BC7002-S
f84d7f62-b15a-4446-87e8-b85a89f98a3e	15:20:00	MW	-1	23	1	Spring2020	LAW101	2445-MR Md Abdul Awal Khan	C9002-S
3d02915d-209a-4a54-9c30-f61d0f598fe9	11:20:00	MW	-1	32	1	Spring2020	LAW102	2338-MR Liton Chandra Biswas	C9002-S
458f1151-be54-48b5-88fc-29b3f4749687	13:40:00	MW	-1	32	2	Spring2020	LAW102	2338-MR Liton Chandra Biswas	C9002-S
ad43574c-6606-4522-91f7-9802e72b6f41	09:40:00	ST	-1	16	1	Spring2020	LAW103	2428-DR Md Parvez Sattar	C9002-S
58ac2716-a1ca-44d7-9fac-b6f894bfad1c	11:20:00	ST	-1	14	1	Spring2020	LAW106	2445-MR Md Abdul Awal Khan	C3002-S
8c11f5a9-cac0-44ae-9205-68fd4470119e	13:40:00	MW	-1	20	1	Spring2020	LAW107	5271-DR Arif Jamil	C2006-S
3b227269-7045-4b37-8871-939dc39afa39	11:20:00	ST	-1	15	1	Spring2020	LAW108	2391-MS Nabila Tahsin Farah	C3003-S
c756e41e-f254-4bfe-851d-993a3c609d68	13:40:00	ST	-1	13	1	Spring2020	LAW109	2429-DR Borhan Uddin Khan	C9002-S
44bdccb9-8881-4113-aa58-a1b86d413b08	15:20:00	MW	-1	2	1	Spring2020	LAW201	2433-DR Md. Mahbubur Rahman	C2006-S
96fb8c27-1f91-49c9-81eb-0eaf1637814f	15:20:00	ST	-1	14	1	Spring2020	LAW204	2338-MR Liton Chandra Biswas	C5002-S
e28ba4e2-293b-45e2-9206-cb02d19ca221	15:20:00	ST	-1	14	1	Spring2020	LAW206	2445-MR Md Abdul Awal Khan	C2002-S
9c6022a7-7d30-4246-bd0d-bb7878a1160a	13:40:00	ST	-1	16	1	Spring2020	LAW207	2391-MS Nabila Tahsin Farah	C3002-S
062167a5-21da-4709-b250-278c6fdd1b83	09:40:00	ST	-1	15	1	Spring2020	LAW209	2459-DR Assaduzzaman	C3007-S
7fa0f66d-e2a3-42ab-b980-7491dbc9ce07	15:20:00	MW	-1	15	1	Spring2020	LAW301	2391-MS Nabila Tahsin Farah	C2007-S
347a61d9-d805-450f-b47b-2bae4a0a2f5a	11:20:00	ST	-1	15	1	Spring2020	LAW302	2428-DR Md Parvez Sattar	C5003-S
0f15e7ac-87aa-4844-bde7-57295c347f78	08:00:00	ST	-1	6	1	Spring2020	LAW303	2459-DR Assaduzzaman	C2003-S
41530065-03a1-4671-85e5-e6ba3ce78a51	09:40:00	MW	-1	12	1	Spring2020	LAW305	2459-DR Assaduzzaman	C9002-S
96f4d50c-d556-4e72-b62c-e50a8aa6436a	17:00:00	MW	-1	7	1	Spring2020	LAW306	2445-MR Md Abdul Awal Khan	C2006-S
cad3ec7b-e284-41c8-b3b3-296bdb2904cf	09:40:00	MW	-1	3	1	Spring2020	LAW308	2428-DR Md Parvez Sattar	C4002-S
987d1978-20c0-4465-9ca8-0631ec112519	11:20:00	MW	-1	15	1	Spring2020	LAW402	2391-MS Nabila Tahsin Farah	C2006-S
b6908f6d-3367-41b8-942d-420e4d6f3c38	17:00:00	ST	-1	7	1	Spring2020	LAW404	2338-MR Liton Chandra Biswas	C5003-S
0def28c9-6f75-433b-98a7-793279318a5b	17:00:00	MW	-1	11	1	Spring2020	LAW409	2432-DR Md. Nazmuzzaman Bhuiyan	C9002-S
f011e103-d017-48bb-8a0e-c9720117fa2b	09:40:00	MW	-1	6	1	Spring2020	LIN313	2132-MS Rezina Nazneen Rimi	C2002-S
92b851df-e585-4356-a605-0665f3689b17	11:20:00	ST	-1	52	1	Spring2020	MAT100	4312-MS Purobi Rani Kundu	BC5012-S
c6be97d2-a974-451b-86a2-bba479d6bfdc	08:00:00	ST	-1	48	2	Spring2020	MAT100	4358-MR Mustafa Mohammad Shaky	BC5012-S
346aeb40-6b21-479b-9711-707c4ae982b9	09:40:00	MW	-1	43	3	Spring2020	MAT100	4423-MS Nabila Jaman Tripti	BC2010-S
4d2f8604-23bd-4bb4-a0a9-13cb78e8d5cf	08:00:00	MW	-1	25	4	Spring2020	MAT100	4312-MS Purobi Rani Kundu	BC10014-S
2b1c8ca9-ea28-439f-8993-ff11bd5bdd9d	11:20:00	ST	B-0	0	5	Spring2020	MAT100	T001-00 TBA TBA	BCTBA1-S
e5d2f063-e9ac-46d2-8bd9-f3d21f570b40	09:40:00	ST	-1	50	1	Spring2020	MAT100A	4297-MR M. Ishtiaque Rahman	BC5014-S
77a766aa-ba5b-468e-9002-790f4d943437	13:40:00	ST	-1	53	2	Spring2020	MAT100A	4312-MS Purobi Rani Kundu	BC5012-S
0472ed7c-256b-4a12-80f2-b613c86b1db1	11:20:00	ST	-1	49	3	Spring2020	MAT100A	4352-MS Zaima Tasneem	BC5013-S
c84eee09-1b30-472b-8cd9-c8e0013f974f	13:40:00	MW	-1	50	4	Spring2020	MAT100A	4297-MR M. Ishtiaque Rahman	BC7025-S
ec6f0a6c-b42c-4c5f-93d0-02690162709a	11:20:00	ST	-1	50	5	Spring2020	MAT100A	4430-MR Ifte Khairul Alam Bhuiyan	BC10018-S
599eb752-67dd-4265-aea6-1e32f030fe35	17:00:00	MW	-1	25	6	Spring2020	MAT100A	4425-MR Md. Meshbahur Rahman	BC10018-S
494fcab7-a59b-4927-bb6c-671887b71fb3	15:20:00	ST	-1	49	7	Spring2020	MAT100A	4299-MR Shohel Ahmed	BC10014-S
8b288dee-d7fd-42cc-8b6c-15025922c3ef	08:00:00	ST	-1	31	8	Spring2020	MAT100A	4325-MR Nur Elahi Razin	C6004-S
af9977a3-0fe0-4bf0-9a61-f49b7cdfa318	17:00:00	ST	-1	53	1	Spring2020	MAT101	4255-MS Zainab Lutfun Nahar	BC5012-S
fa716012-09b1-4fc7-b552-d8de87f7c68e	17:00:00	MW	-1	54	2	Spring2020	MAT101	4255-MS Zainab Lutfun Nahar	BC5012-S
83809fe3-1eaf-4f35-b58b-e3e9d266240a	11:20:00	MW	-1	55	3	Spring2020	MAT101	4358-MR Mustafa Mohammad Shaky	BC5012-S
1f7a64ba-49cb-4894-b88b-a9f057aaf250	08:00:00	MW	-1	52	4	Spring2020	MAT101	4358-MR Mustafa Mohammad Shaky	BC5012-S
440ba130-13e2-4cc2-b350-fc80a3777fcd	08:00:00	ST	-1	49	5	Spring2020	MAT101	4297-MR M. Ishtiaque Rahman	BC5013-S
849aad4d-88d0-4a76-ac14-82451bcaa678	09:40:00	MW	-1	55	6	Spring2020	MAT101	4378-DR Md. Readul Mahmud	BC5012-S
80c3004a-33f5-4be2-a851-144912eda1c4	13:40:00	MW	-1	54	7	Spring2020	MAT101	4423-MS Nabila Jaman Tripti	BC5012-S
a408cc25-5093-45b2-a56b-4a7e11b3ec62	11:20:00	ST	-1	56	8	Spring2020	MAT101	4423-MS Nabila Jaman Tripti	BC5014-S
b1ec0ddd-2cb6-4219-8eb2-734d5719b539	08:00:00	ST	-1	51	9	Spring2020	MAT101	4312-MS Purobi Rani Kundu	BC5014-S
9484f8a5-9e68-484d-a281-a8a1adf62317	15:20:00	MW	-1	53	10	Spring2020	MAT101	4419-MS Nurjahan Akter Nepa	BC5012-S
b0da3ac4-2d06-4a7f-8bd7-a28dee8d326c	17:00:00	MW	-1	53	11	Spring2020	MAT101	4347-PROF Md. Abdul Bari Mia	BC5013-S
d99d91c0-f84b-4790-ba38-e3d8163497dc	13:40:00	ST	-1	55	12	Spring2020	MAT101	4419-MS Nurjahan Akter Nepa	BC9017-S
159dfbbc-75fe-4d79-810a-971839c0ea93	17:00:00	MW	-1	49	13	Spring2020	MAT101	4223-MR Mr. Md. Shariful Islam	BC3010-S
f5f5d517-80d9-4d35-b6f0-85191fc3b2de	08:00:00	MW	-1	48	14	Spring2020	MAT101	4413-MS Nigar Sultana	BC3012-S
9a8568e2-9358-42b3-990d-e1d44da7c96a	11:20:00	ST	-1	56	15	Spring2020	MAT101	4290-MR Abul Fazal Mahmudunnabi	BC3002-S
2b34f9d3-62de-48cd-9861-f3482d5d2503	09:40:00	ST	-1	49	16	Spring2020	MAT101	4290-MR Abul Fazal Mahmudunnabi	BC6013-S
906c8b55-d241-4b2f-9448-45e512fe6711	17:00:00	ST	-1	51	17	Spring2020	MAT101	4425-MR Md. Meshbahur Rahman	BC10014-S
37190265-53b1-4512-a014-bbd747f96a88	11:20:00	ST	-1	53	1	Spring2020	MAT104	4119-MS Dr. Rifat Ara Rouf	BC6007-S
06fdfaa2-3db7-44bf-921a-ea460744af24	11:20:00	MW	-1	52	2	Spring2020	MAT104	4423-MS Nabila Jaman Tripti	BC5013-S
d903eaf7-a7f5-49e7-a6dc-0379c26043fd	09:40:00	MW	-1	50	3	Spring2020	MAT104	4119-MS Dr. Rifat Ara Rouf	BC5013-S
454211af-f014-4ab7-8818-9c46b2deb631	08:00:00	ST	-1	53	4	Spring2020	MAT104	4410-DR Mohammad Babul Hasan	BC6007-S
83c67c8b-170a-44e6-82d5-0207cf121dda	13:40:00	MW	-1	52	5	Spring2020	MAT104	4419-MS Nurjahan Akter Nepa	BC5013-S
fd5af801-1117-45c1-b6be-0cc2008a2deb	08:00:00	MW	-1	52	6	Spring2020	MAT104	4308-PROF Laek Sazzad Andallah	BC5013-S
9f54c7c9-6ea6-4c34-b125-46c92a8b37ea	08:00:00	ST	-1	50	7	Spring2020	MAT104	4384-DR S N M Azizul Hoque	BC10018-S
46790acf-a4e6-4dfb-8278-3757d6e360dc	17:00:00	ST	-1	50	8	Spring2020	MAT104	4431-DR Mohammad Nazrul Islam	BC5002-S
03e2c4ee-ddc0-4d1c-a8ff-1b64a2e7fcf8	17:00:00	MW	-1	41	9	Spring2020	MAT104	4309-PROF Md. Shafiqul Islam	BC2020-S
774ada0f-c7f9-4d7d-b29d-e6fcd134d042	11:20:00	ST	-1	50	1	Spring2020	MAT111	4419-MS Nurjahan Akter Nepa	BC7015-S
be39d7cf-d101-4eb1-9ed2-ee13c0e74260	15:20:00	MW	-1	32	2	Spring2020	MAT111	4309-PROF Md. Shafiqul Islam	C3005-S
af0bf097-98ab-4edf-9b13-451ffaea09c0	09:40:00	ST	-1	24	1	Spring2020	MAT121	4102-DR Mohammed Anwer	BC6007-S
381728d7-a010-466b-b804-351773994bcd	15:20:00	ST	-1	50	2	Spring2020	MAT121	4369-MS Yasmin Akter	BC5013-S
f8045c14-e17e-4e63-a1f6-de19484b77f8	15:20:00	ST	-1	34	3	Spring2020	MAT121	4370-MS Tasnim Mafiz	BC5014-S
e6ae3108-10cc-4c20-aaf6-c2130097f6f3	09:40:00	MW	-1	46	4	Spring2020	MAT121	4369-MS Yasmin Akter	BC6007-S
b7385b21-a2c1-4209-a269-1f037721ae1a	15:20:00	MW	-1	31	5	Spring2020	MAT121	4246-MS Proma Anwar Khan	BC5014-S
c53f368a-fdd1-421b-8341-363b65d49686	15:20:00	ST	-1	10	1	Spring2020	MAT131	4431-DR Mohammad Nazrul Islam	C4006-S
92e21c52-80ce-42fd-b30d-6c8e452a9844	17:00:00	ST	-1	20	1	Spring2020	MAT210	4370-MS Tasnim Mafiz	BC5013-S
3c2f3389-4a8b-4e4b-8514-3e3729b16439	11:20:00	MW	-1	48	2	Spring2020	MAT210	4369-MS Yasmin Akter	BC5014-S
c6006979-47e8-4b59-914d-e8ae43103251	09:40:00	ST	-1	46	1	Spring2020	MAT211	4246-MS Proma Anwar Khan	BC6012-S
67cf071e-eb55-4423-8886-06cbf9beae87	08:00:00	ST	-1	26	2	Spring2020	MAT211	4246-MS Proma Anwar Khan	BC6008-S
4562b6d3-3f32-47bd-b9ad-b181f02f82ce	11:20:00	ST	-1	47	3	Spring2020	MAT211	4369-MS Yasmin Akter	BC6009-S
f020bc0d-1584-4071-b627-5e21d5838fdc	17:00:00	ST	-1	44	4	Spring2020	MAT211	4223-MR Mr. Md. Shariful Islam	BC5014-S
89cac018-bafb-4cc1-bfec-3f0a0edf294a	17:00:00	MW	B-0	0	5	Spring2020	MAT211	4246-MS Proma Anwar Khan	BC5014-S
8798926b-1f18-4839-a550-1607b6e6ac55	17:00:00	MW	-1	18	6	Spring2020	MAT211	4370-MS Tasnim Mafiz	BC6007-S
f09f5fd3-50cd-4566-9909-675da3fe527c	17:00:00	ST	-1	50	7	Spring2020	MAT211	4299-MR Shohel Ahmed	BC6007-S
365ecaa3-9712-4d0c-b98b-3dcf59f4b949	15:20:00	MW	-1	37	8	Spring2020	MAT211	4370-MS Tasnim Mafiz	BC5013-S
642bab0f-1356-43de-8ad0-15985cfa622b	11:20:00	MW	-1	50	9	Spring2020	MAT211	4428-PROF Anandamayee Majumdar	BC6007-S
63c4ea86-bd81-4d2a-ba4e-aa4be23f5442	15:20:00	MW	-1	27	1	Spring2020	MAT213	4310-PROF Md. Abu Naim Sheikh	BC6007-S
2d85e987-3ee8-4aac-bff1-035c507c3ea9	17:00:00	MW	-1	31	1	Spring2020	MAT221	4310-PROF Md. Abu Naim Sheikh	BC6008-S
6f5de9b4-5f1f-4585-b541-e93b8275b48f	09:40:00	MW	-1	35	1	Spring2020	MAT222	4308-PROF Laek Sazzad Andallah	BC5014-S
810a8f36-07ee-41f1-8bc5-aa4c9f5fd0b4	09:40:00	ST	-1	54	2	Spring2020	MAT222	4354-PROF Nirmal Kanti Mitra	BC6009-S
f4c1519c-aa74-43f2-aa33-ed57d03dccb4	13:40:00	ST	-1	48	3	Spring2020	MAT222	4338-PROF M Arshad Momen	BC5013-S
4551af12-c549-464d-8e9c-158fe24f338b	09:40:00	MW	-1	37	1	Spring2020	MAT230	4322-PROF Nilufar Farhat Hossain	BC6008-S
cc627346-78fe-4a7d-85e7-adaaae51dfe8	09:40:00	ST	-1	9	2	Spring2020	MAT230	4119-MS Dr. Rifat Ara Rouf	C4007-S
de9861f8-1cfa-42ac-ad51-380f25d774bf	11:20:00	ST	-1	29	3	Spring2020	MAT230	4354-PROF Nirmal Kanti Mitra	BC6012-S
8ce0dfab-8987-48b8-8b87-e1f2f057df62	15:20:00	MW	-1	43	4	Spring2020	MAT230	4322-PROF Nilufar Farhat Hossain	BC6008-S
8a032604-f172-45ba-af78-5519c19d7bc7	11:20:00	ST	-1	18	1	Spring2020	MAT251	4338-PROF M Arshad Momen	C4002-S
2cd160bb-4ab6-43c5-9b2c-32efe76e5841	13:40:00	ST	-1	1	1	Spring2020	MAT428	4228-DR Habib Bin Muzaffar	C3007-S
3e20010d-544b-4f5e-9ad7-3915b4aeeb2e	08:00:00	ST	-1	1	1	Spring2020	MAT432	4223-MR Mr. Md. Shariful Islam	BC10017-S
ed71e5e4-c8e6-43f6-89b2-7e1349707c6a	13:40:00	MW	B-0	0	1	Spring2020	MAT436	4124-DR Shipra Banik	FT-S
04bf0027-a2ed-4e0d-9521-0eec7b201449	11:20:00	MW	-1	5	1	Spring2020	MAT459	4429-DR Khan Muhammad Bin Asad	C5006-S
d8f3f445-f137-4693-9c59-70902594d9be	13:40:00	MW	-1	5	1	Spring2020	MAT469	4384-DR S N M Azizul Hoque	C3003-S
49480308-028c-4a2e-9990-210f2bbc57d2	13:40:00	MW	-1	1	1	Spring2020	MAT489	4428-PROF Anandamayee Majumdar	C3002-S
14aee64a-2c30-4a5d-9856-a3b50df9de67	09:40:00	ST	-1	11	1	Spring2020	MCB101	6013-MS Noshin Azra Rahman	BC10017-S
b6e81e93-b469-4838-8652-fe323c6e70ff	17:00:00	MW	-1	16	1	Spring2020	MCB102	6055-DR Rashed Noor	C3002-S
163efbf9-2717-410a-a606-1f94c55b774d	15:20:00	MW	-1	8	1	Spring2020	MCB103	6013-MS Noshin Azra Rahman	C3007-S
6630d786-8f95-4ff2-a0f4-e672beb9fe12	13:40:00	T	0	8	1	Spring2020	MCB103L	6013-MS Noshin Azra Rahman	BC4017B-S
aee4bcb5-cdf8-4cde-a7e0-9e30749b66ed	11:20:00	MW	-1	16	1	Spring2020	MCB201	6055-DR Rashed Noor	C4007-S
e540e221-8414-46d6-bb95-8c4bb9f25111	11:20:00	ST	B-0	0	1	Spring2020	MCB202	T001-00 TBA TBA	BC001-S
5bda349c-9e31-46b3-8ab6-215e9904c6c9	08:00:00	ST	-1	2	1	Spring2020	MCB210	6010-MS Tasnimul Ferdous	BC4017C-S
fa005f70-edd1-425f-819e-5ab76c146fb3	09:40:00	MW	-1	15	1	Spring2020	MCB301	6033-DR Jebunnahar Khandakar	BC10018-S
49e21410-c757-492b-9040-40ad28ed3f2b	11:20:00	ST	B-0	0	1	Spring2020	MCB303	6010-MS Tasnimul Ferdous	C6007-S
cb0b587a-b435-4398-85db-66dd395de796	13:40:00	W	B-0	0	1	Spring2020	MCB303L	6010-MS Tasnimul Ferdous	BC4017B-S
6e6df6d6-28e9-4ae2-93d1-717468b094a7	09:40:00	ST	-1	12	1	Spring2020	MCB305	6010-MS Tasnimul Ferdous	BC9017-S
59181cf5-e64a-484c-af26-967e5dadeede	15:20:00	ST	-1	20	1	Spring2020	MCB306	6058-DR Shah M Faruque	BC9015-S
ecb19004-b351-43f0-9f2c-203dd75836e8	11:20:00	MW	-1	27	1	Spring2020	MCB309	6058-DR Shah M Faruque	BC10015-S
7e5561ef-5820-4e35-ad3e-b06186406ab6	11:20:00	ST	-1	27	1	Spring2020	MCB310	6055-DR Rashed Noor	BC9016-S
d11e2640-1c17-4da1-81a2-d8f67f2743bc	15:20:00	MW	-1	13	1	Spring2020	MCB311	6010-MS Tasnimul Ferdous	BC4017A-S
19d6a9e5-8220-4271-b6ba-b7395517f4c5	09:40:00	MW	B-0	0	1	Spring2020	MCB404	T001-00 TBA TBA	BC001-S
3f713f32-497a-40fd-ae65-1ae1f09264e1	13:40:00	MW	-1	13	1	Spring2020	MCB405	6009-DR Ashrafus Safa	C4006-S
74b041b2-b13b-49a1-958d-60c31603930e	13:40:00	ST	-1	12	1	Spring2020	MCB406	6009-DR Ashrafus Safa	C4006-S
d3388b69-eff4-4703-9964-f55f462fe883	17:00:00	ST	B-0	0	1	Spring2020	MCB407	T001-00 TBA TBA	C3006-S
1aa03f24-f9f2-45a9-834b-630468b620e7	17:00:00	MW	-1	14	1	Spring2020	MCB409	6033-DR Jebunnahar Khandakar	BC4011-S
a5c14250-0d79-47be-a98f-3dba82bd501d	11:20:00	MW	-1	8	1	Spring2020	MCB410	6010-MS Tasnimul Ferdous	C5002-S
51f977b4-db06-4f71-a3b3-9ac00749118b	09:40:00	MW	-1	8	1	Spring2020	MCB411	6013-MS Noshin Azra Rahman	BC4017A-S
f8e439ca-a17d-49d5-b7ec-032eb52824e3	08:00:00	R	0	0	1	Spring2020	MCB450	6058-DR Shah M Faruque	BC4017B-S
03cd2e8d-f30d-47ab-b4aa-266e4209b17b	17:00:00	R	-1	7	2	Spring2020	MCB450	6055-DR Rashed Noor	BC4017C-S
9ee53295-1e34-4a4e-8d04-f531b7eb6e10	13:40:00	R	-1	3	3	Spring2020	MCB450	6009-DR Ashrafus Safa 6010-TasnimulFerdous	BC4017C-S
58b88210-6a2e-4489-bf30-bf2820b9951f	13:40:00	R	-1	4	4	Spring2020	MCB450	6033-DR Jebunnahar Khandakar	BC4017D-S
25e00267-f6b6-4897-ad71-587b907acde6	15:20:00	R	-1	1	5	Spring2020	MCB450	6009-DR Ashrafus Safa	BC4017C-S
e42518b2-eb2d-402c-867d-de53b61d9429	15:20:00	R	0	0	6	Spring2020	MCB450	6013-MS Noshin Azra Rahman	BC4017D-S
f769186f-ff8b-4ae1-8ceb-402c6be2c57a	08:00:00	R	0	0	7	Spring2020	MCB450	6010-MS Tasnimul Ferdous	BC4017C-S
34ee768f-3b53-4c3c-826e-dd5ee3fe1689	17:00:00	R	-1	9	1	Spring2020	MCB451	6033-DR Jebunnahar Khandakar	BCTBA1-S
f453762c-bcf5-475c-a28c-7a1d17040b7f	11:20:00	ST	-1	49	1	Spring2020	MGT201	3251-MS Farzana Chowdhury	BC3009-S
182fb13a-1e81-4d1e-a668-1f391bbeec4f	11:20:00	MW	-1	48	2	Spring2020	MGT201	3251-MS Farzana Chowdhury	BC3009-S
66117ad1-174e-45d4-8ffa-ea4fae5b4c02	17:00:00	ST	-1	37	3	Spring2020	MGT201	3323-MS Qantara Khaleda Khan	BC3008-S
fdaa7deb-a3e3-4fd0-9546-5e10ee1a0939	15:20:00	ST	-1	50	4	Spring2020	MGT201	3358-MR Mr. Iftekhar Mahfuz	BC3009-S
d2ed23bd-75d0-4630-bc8a-de94cf8aa7ef	15:20:00	MW	-1	46	5	Spring2020	MGT201	3358-MR Mr. Iftekhar Mahfuz	BC2020-S
e2590bc3-04c3-4fdf-9b6e-9de5807d6201	15:20:00	ST	-1	49	6	Spring2020	MGT201	3428-DR Dr. Nazmunnessa Mahtab	BC3010-S
1476acfe-33cd-4669-b270-c1da1470a1b0	09:40:00	MW	-1	46	7	Spring2020	MGT201	3525-MS Afnan Ashfaque	BC2021-S
d632f8a3-4c2d-4733-aa0b-94287c4b5aed	13:40:00	ST	-1	46	8	Spring2020	MGT201	3525-MS Afnan Ashfaque	BC3008-S
3034ef9d-d21a-425e-8aed-bb3969f093fa	13:40:00	ST	-1	23	1	Spring2020	MGT301	3428-DR Dr. Nazmunnessa Mahtab	BC4013-S
3bf21b7e-9d12-4f0a-9df5-bf4fb9d7a51d	15:20:00	MW	-1	45	1	Spring2020	MGT330	3528-MR Md. Mamunur Rashid	BC2021-S
14d428c7-88d9-4ad3-9849-6f03725818b5	09:40:00	MW	-1	45	2	Spring2020	MGT330	3573-DR Ziaul Haq Adnan	BC3008-S
fb6bf7df-2b08-4495-85bb-c12e1bb1e195	15:20:00	ST	-1	45	3	Spring2020	MGT330	3573-DR Ziaul Haq Adnan	BC3011-S
4ba17aed-7017-4e9b-b21a-ea8a683ece56	13:40:00	ST	-1	45	4	Spring2020	MGT330	3579-MS Seeratus Sabah	BC3009-S
4d2e9903-fe1d-4f56-9c7b-f52884402532	11:20:00	MW	-1	45	5	Spring2020	MGT330	3579-MS Seeratus Sabah	BC3010-S
8066523d-62f0-4b91-9bf0-5e91a9c24169	08:00:00	ST	-1	28	6	Spring2020	MGT330	3606-DR Md. Kharshiduzzaman	BC3009-S
c05f2eb9-2273-4ea1-b229-4613a7a44ba6	17:00:00	MW	-1	39	7	Spring2020	MGT330	3615-DR Md. Mamun Habib	C3004-S
2f1f3bb7-1271-4f94-b3d5-5de43c0ad3e2	15:20:00	ST	-1	31	1	Spring2020	MGT340	3135-DR Abul Bashar	BC4010-S
e8a999bd-b8d6-4b63-82d1-15fa3d271a38	11:20:00	MW	-1	15	1	Spring2020	MGT450	3573-DR Ziaul Haq Adnan	BC4013-S
76254012-4a7d-4f2a-b544-97a61d1547b9	08:00:00	ST	-1	47	1	Spring2020	MGT490	3193-MR Hanif Mahtab	BC3010-S
c0813997-754b-4df8-88a5-89029887ac16	13:40:00	MW	-1	53	2	Spring2020	MGT490	3358-MR Mr. Iftekhar Mahfuz	BC7016-S
1447ad57-71b1-4a2c-94e5-d3fa9ac9a3fd	15:20:00	MW	-1	48	3	Spring2020	MGT490	3465-MS Kashfia Ameen	BC10015-S
46617c73-f18f-4813-8130-71ccec8ff194	17:00:00	ST	-1	50	4	Spring2020	MGT490	3465-MS Kashfia Ameen	BC3009-S
f0711fea-b62a-49bf-82b4-1a85eaf0908f	13:40:00	ST	-1	52	5	Spring2020	MGT490	3486-MR Hasan Md. Mahmood Ul Haque	BC3010-S
d259b042-8312-48d7-b680-7db0a5fc7eba	17:00:00	MW	-1	47	6	Spring2020	MGT490	3609-MR Wahidul Sheikh	BC2021-S
81e10829-4327-4c4f-9e3d-e8874dbe9d42	09:40:00	MW	-1	29	1	Spring2020	MIS341	3542-MR Md. Aminul Islam	BC4014-S
f7f9bd9e-fa86-4549-b54b-91be4936a9a4	17:00:00	MW	-1	28	1	Spring2020	MIS401	3605-DR Mohammad Anisur Rahman	C3005-S
2653803d-e6f0-4237-91d2-8441854855a1	15:20:00	MW	-1	39	1	Spring2020	MIS405	3605-DR Mohammad Anisur Rahman	C6004-S
946584f6-99de-486a-93e4-811ec5f4b2a9	09:40:00	ST	-1	36	1	Spring2020	MIS430	3542-MR Md. Aminul Islam	C5005-S
f6c939b0-514e-4b55-9be5-a8870d00d00b	09:40:00	MW	-1	41	1	Spring2020	MIS442	3566-DR Rezwanul Alam	BC8015-S
f4e9167c-8679-4b7c-a65b-cd1ff63432ce	13:40:00	MW	-1	44	2	Spring2020	MIS442	3423-MR Arifur Rahman Khan	BC3002-S
a6ab81da-547a-46f4-adba-53436dc35e32	11:20:00	MW	-1	48	3	Spring2020	MIS442	3542-MR Md. Aminul Islam	BC3002-S
b53fefe1-be68-46eb-97cf-b3830ebf5279	11:20:00	ST	-1	40	4	Spring2020	MIS442	3542-MR Md. Aminul Islam	C2004-S
790542e0-6d2f-41dd-a3ef-e9a9d8fc0abe	15:20:00	ST	-1	44	5	Spring2020	MIS442	3423-MR Arifur Rahman Khan	BC3002-S
390e1720-b5a0-4be9-a149-27c6755d0032	13:40:00	ST	-1	40	6	Spring2020	MIS442	3542-MR Md. Aminul Islam	C4005-S
fa089a3d-4963-44c9-a081-885ede86c111	13:40:00	MW	-1	15	1	Spring2020	MIS455	3566-DR Rezwanul Alam	C5006-S
70359dd8-46e7-4a4b-8314-74160ea6920e	11:20:00	ST	-1	34	1	Spring2020	MIS465	3423-MR Arifur Rahman Khan	C6004-S
aa276f26-2330-4e75-8275-d39ba2865822	15:20:00	MW	-1	50	1	Spring2020	MKT201	3329-MR Abul Khair Jyote	BC3008-S
32192d0f-2bf8-42f2-bee4-fc8fef3466b9	08:00:00	MW	-1	44	2	Spring2020	MKT201	3612-MR Syed Imamuzzaman	BC2021-S
62c4ffcb-7f86-42df-afc8-27e72b8adb6d	15:20:00	ST	-1	49	3	Spring2020	MKT201	3318-MR Suman Prosad Saha	BC3012-S
796b9784-5bc0-48be-a6de-3650795f8e12	09:40:00	MW	-1	47	4	Spring2020	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC3009-S
5de061fb-d68a-4952-affc-995c655cd93c	08:00:00	ST	-1	40	5	Spring2020	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC3011-S
8fc7a9ae-dfd8-4a94-af1c-a64830648d10	11:20:00	MW	-1	50	6	Spring2020	MKT201	3318-MR Suman Prosad Saha	BC3011-S
ec4a6720-3aad-46eb-b494-5ffa5c53da1c	09:40:00	ST	-1	50	7	Spring2020	MKT201	3329-MR Abul Khair Jyote	BC3008-S
7850e349-2df2-4960-8a8c-8ad25cb8c408	15:20:00	ST	-1	33	1	Spring2020	MKT302	3557-DR Shamsun Nahar Momotaz	C2004-S
73013241-df1e-48e1-9302-c07687773314	11:20:00	MW	-1	40	2	Spring2020	MKT302	3406-MS Zakia Binte Jamal	BC3012-S
70e298dc-a69c-46d1-9c94-1e28df9e40d1	13:40:00	ST	-1	34	3	Spring2020	MKT302	3583-MR Sheikh Mohammad Fauzul Azim	C5005-S
16eb759f-e687-49a1-92bd-27d15bd6ba21	17:00:00	MW	-1	23	4	Spring2020	MKT302	3406-MS Zakia Binte Jamal	BC3008-S
9caebe53-2a85-4087-802d-72f70b1415d5	17:00:00	MW	-1	38	1	Spring2020	MKT340	3583-MR Sheikh Mohammad Fauzul Azim	BC3009-S
ea67980c-cf30-4fb6-aadd-95f3790e4903	15:20:00	MW	-1	45	2	Spring2020	MKT340	3406-MS Zakia Binte Jamal	BC3012-S
0b0cc8d7-63e9-4c17-81fc-35d8d89f048b	11:20:00	ST	-1	46	3	Spring2020	MKT340	3329-MR Abul Khair Jyote	BC3010-S
25a7b5b0-878a-4ca7-9f90-02d9460cad11	17:00:00	ST	-1	28	1	Spring2020	MKT350	3583-MR Sheikh Mohammad Fauzul Azim	BC3010-S
64ac5470-ec2a-4750-8c3b-65b44e3601ef	13:40:00	MW	-1	41	2	Spring2020	MKT350	3318-MR Suman Prosad Saha	BC3009-S
d8bd915c-a44c-4f34-baf4-e39536920380	09:40:00	MW	-1	39	3	Spring2020	MKT350	3557-DR Shamsun Nahar Momotaz	BC3010-S
16b82f0f-ada3-4fd7-b7e6-8713f8ac1125	17:00:00	ST	-1	40	1	Spring2020	MKT380	3318-MR Suman Prosad Saha	BC3011-S
ba058027-a63d-47fd-bab7-437c53023f75	13:40:00	ST	-1	51	1	Spring2020	MKT401	3329-MR Abul Khair Jyote	BC3011-S
181b3856-1c3a-47da-bdff-7ffcd93607dd	08:00:00	ST	-1	30	2	Spring2020	MKT401	3539-MR SM Yusuf Mallick	BC2020-S
f48ad397-0e14-4fd3-8882-7ab58b6ddb63	17:00:00	ST	-1	49	1	Spring2020	MKT460	3406-MS Zakia Binte Jamal	BC3012-S
98d2a227-4348-46ee-ab28-64d78917e987	15:20:00	ST	-1	48	1	Spring2020	MKT470	3406-MS Zakia Binte Jamal	BC7015-S
6842890e-f4db-4134-8703-11065e427db2	09:40:00	MW	-1	28	1	Spring2020	MKT481	3185-MR Mohammed Sohel Islam	BC3011-S
73c1c798-dee5-4cf9-93c2-cc7c4bbefb22	15:20:00	MW	-1	40	2	Spring2020	MKT481	3318-MR Suman Prosad Saha	BC3009-S
96e47ebd-7011-422d-a6c7-ddec4b7840a0	13:40:00	MW	-1	40	3	Spring2020	MKT481	3329-MR Abul Khair Jyote	BC3010-S
fe078624-ebb6-4efa-8f2b-5e7b62d06415	09:40:00	ST	-1	49	1	Spring2020	MUS101	2397-DR Shahnaz Nasrin	BC3002-S
f3dd594a-bfeb-4f09-825f-0aae33cf7f79	09:40:00	MW	-1	47	2	Spring2020	MUS101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
739f933d-b7b2-4150-90c3-260934b626dd	11:20:00	ST	-1	51	3	Spring2020	MUS101	2397-DR Shahnaz Nasrin	BC7002-S
66e6b9b6-eddb-4bd4-9cd5-a7d1c8eb7194	13:40:00	ST	-1	53	1	Spring2020	MUS102	2397-DR Shahnaz Nasrin	BC3002-S
89769460-4b16-45e4-a2c2-5a889e242482	17:00:00	MW	-1	54	1	Spring2020	NCH101	2389-DR Ranjan Saha Partha	BC5002-S
d571ae80-bc81-48de-9145-1aefa566f0bb	08:00:00	ST	-1	57	2	Spring2020	NCH101	2403-MR Mohammad Masud Rana	BC7002-S
1570bc90-f161-491c-97e0-4ff57218cbc9	09:40:00	ST	-1	54	3	Spring2020	NCH101	2403-MR Mohammad Masud Rana	BC5002-S
36f9c7d8-f79a-49c2-a783-18f84194ec2c	13:40:00	ST	-1	55	4	Spring2020	NCH101	2424-MS Samia Hemayet Diba	BC5002-S
c3d44afc-51b0-4818-8dff-507f5d729388	15:20:00	ST	-1	54	5	Spring2020	NCH101	2424-MS Samia Hemayet Diba	BC5002-S
90473ee5-8d2c-444c-8089-3826bc52edb0	08:00:00	F	-1	14	1	Spring2020	PHA100	5254-PROF J M A Hannan	BC3015F-S
c7dbb98c-8fdb-4240-b8f9-a9d58cb37ddc	09:40:00	F	-1	7	2	Spring2020	PHA100	5254-PROF J M A Hannan	BC3015F-S
c4f5d2c7-09e6-42f3-8f29-f8f4023d1251	11:20:00	F	-1	17	3	Spring2020	PHA100	5254-PROF J M A Hannan	BC3015F-S
1cd0e469-482f-42f3-a9d9-d989d5abd907	11:20:00	ST	-1	34	1	Spring2020	PHA101	5280-DR Rajib Bhattacharjee	C6005-S
678fba49-a2cd-46d0-880a-7608b2d31f15	09:40:00	MW	-1	35	2	Spring2020	PHA101	5280-DR Rajib Bhattacharjee	C6005-S
e4121386-2d4b-4d2b-b237-32038c0c864c	09:40:00	R	-1	34	3	Spring2020	PHA101	5274-DR Md. Saiful Islam	BC9013-S
5c190ba7-b14c-42e6-81b3-353e131e571a	11:20:00	R	-1	33	4	Spring2020	PHA101	5274-DR Md. Saiful Islam	BC9013-S
dbcc90ce-6501-44fd-98f1-b594b89c2718	17:00:00	MW	-1	11	5	Spring2020	PHA101	5280-DR Rajib Bhattacharjee	C6005-S
5c8b03f7-8c74-4106-ab98-f47ecc88e487	11:20:00	A	-1	34	1	Spring2020	PHA102	5282-PROF A. B. M. Faroque	BC9013-S
90641992-6204-4657-852a-8ec8f0c26a27	13:40:00	A	-1	34	2	Spring2020	PHA102	5282-PROF A. B. M. Faroque	BC9013-S
0ec484e0-f327-4040-be37-fc222e3ab881	11:20:00	A	-1	35	3	Spring2020	PHA102	5304-DR Md. Elias-Al- Mamun	C6004-S
964cdf21-c9ab-4df2-832f-2364f4267197	13:40:00	A	-1	33	4	Spring2020	PHA102	5260-MR Mehdi Bin Samad	C6004-S
dabcafa8-cbc8-4433-a777-12daadd98067	09:40:00	A	-1	33	5	Spring2020	PHA102	5260-MR Mehdi Bin Samad	C6004-S
323ac308-a7fc-44e1-8593-5280e879badb	11:20:00	A	B-0	0	6	Spring2020	PHA102	T001-00 TBA TBA	C6005-S
7daa01fd-da67-431b-afa6-8b96128c716c	08:00:00	R	-1	21	1	Spring2020	PHA102L	5254-PROF J M A Hannan	BC3015A-S
2305ee7c-e100-4362-8bf1-8bbb1fdbabc7	09:40:00	R	-1	18	2	Spring2020	PHA102L	5254-PROF J M A Hannan	BC3015A-S
fee05f08-3537-4f77-a32b-83f926f943d9	11:20:00	A	-1	19	3	Spring2020	PHA102L	5254-PROF J M A Hannan	BC3015A-S
4d265281-f18d-456f-b2a9-df7c8924a244	13:40:00	R	-1	20	4	Spring2020	PHA102L	5254-PROF J M A Hannan	BC3015A-S
f15f8488-2f25-4cc3-98fd-596c6f2a33a8	15:20:00	R	-1	19	5	Spring2020	PHA102L	5254-PROF J M A Hannan	BC3015A-S
aeac5ba9-2671-4d52-bcda-6a55d61867bc	17:00:00	R	-1	20	6	Spring2020	PHA102L	5254-PROF J M A Hannan	BC3015A-S
7668c3d0-53bc-4266-bc76-47b305ff7418	08:00:00	R	-1	14	7	Spring2020	PHA102L	5261-MS Syeda Naureen Ahmed	BC3015F-S
9eef7176-c4fe-4e87-a1e2-0ba0a604326f	09:40:00	R	-1	18	8	Spring2020	PHA102L	5261-MS Syeda Naureen Ahmed	BC3015F-S
39c250ce-b82c-4d8a-9de6-c13427e8ea36	11:20:00	R	-1	13	9	Spring2020	PHA102L	5261-MS Syeda Naureen Ahmed	BC3015F-S
fa6972f4-fa3e-47ba-9d54-02e2447ac0c5	13:40:00	R	-1	3	10	Spring2020	PHA102L	5261-MS Syeda Naureen Ahmed	BC3015F-S
7720773e-335e-4957-8c7c-e958568c9f44	08:00:00	ST	-1	20	1	Spring2020	PHA103	5260-MR Mehdi Bin Samad	C6007-S
3760eefe-12d0-407d-b100-df07de82c490	09:40:00	ST	-1	17	2	Spring2020	PHA103	5268-MS Sarah Zaheen	C6002-S
3916711b-1edb-4e94-a7ed-22ebc77ab6ca	17:00:00	ST	-1	21	3	Spring2020	PHA103	5261-MS Syeda Naureen Ahmed	C6005-S
4051eb49-fc9a-47b3-8bc8-12bd217928fe	17:00:00	MW	-1	8	4	Spring2020	PHA103	5261-MS Syeda Naureen Ahmed	C4005-S
62f4cda2-2bbd-4a67-8ec7-c347fa60ab40	15:20:00	ST	-1	20	5	Spring2020	PHA103	5260-MR Mehdi Bin Samad	C6006-S
12998060-aa3b-403b-921b-5cd3d1de3810	13:40:00	ST	-1	36	1	Spring2020	PHA104	5312-DR A. B. M. Mahfuz Ul Alam	BC9013-S
6da71f94-8a7d-415f-a8bb-f11431537f5f	15:20:00	ST	-1	14	2	Spring2020	PHA104	5289-MR Nazmus Saqueeb	BC9013-S
2904c859-32f5-4eac-9223-64d4319115a4	09:40:00	MW	-1	36	3	Spring2020	PHA104	5266-MR Md. Abdul Muhit	C6004-S
3aa7255a-dce5-472d-9788-65ff6adbdf34	15:20:00	ST	-1	20	4	Spring2020	PHA104	5283-DR Md. Raihan Sarkar	C6003-S
adf4ff85-8c9d-4a4f-ad01-5ab3b186f376	08:00:00	MW	-1	13	5	Spring2020	PHA104	5283-DR Md. Raihan Sarkar	C3004-S
d3dcf058-82b6-4ed7-a25b-319e606fa1da	08:00:00	MW	-1	33	1	Spring2020	PHA105	5288-DR Sheikh Zahir Raihan	BC9013-S
357cdb68-6faf-4e93-9ef2-79e177d15170	09:40:00	ST	-1	35	2	Spring2020	PHA105	5306-MR Zobaer Al Mahmud	BC9013-S
fdc1e1ca-5127-424e-932b-0a373687cb34	08:00:00	ST	B-0	0	3	Spring2020	PHA105	5267-MR Mohammad Kaisarul Islam	C6005-S
ce8f6f26-a9fe-4647-8937-5158fe62bd75	17:00:00	MW	B-0	0	4	Spring2020	PHA105	T001-00 TBA TBA	BC9013-S
c6266d5e-5e9a-42cd-b6dc-a654783bd59b	09:40:00	MW	-1	24	5	Spring2020	PHA105	5300-MS Mashmum Shababa Shahid	C6007-S
f6067a91-53c4-469e-96ad-daeb48405488	08:00:00	R	-1	15	1	Spring2020	PHA105L	5260-MR Mehdi Bin Samad	BC3015B-S
60b7e68e-f83b-41a5-ac75-634ebee9b022	09:40:00	R	-1	15	2	Spring2020	PHA105L	5260-MR Mehdi Bin Samad	BC3015B-S
fd972b4f-d097-4cb2-8ce6-b7069c861605	11:20:00	R	-1	13	3	Spring2020	PHA105L	5260-MR Mehdi Bin Samad	BC3015B-S
cf64cccd-2c08-451a-9a1a-5ed63be9605d	13:40:00	R	-1	15	4	Spring2020	PHA105L	5260-MR Mehdi Bin Samad	BC3015B-S
5e254bed-73d2-4759-9fd3-4f28a603499a	15:20:00	R	-1	14	5	Spring2020	PHA105L	5260-MR Mehdi Bin Samad	BC3015B-S
8322b928-c3ef-4df8-9fd8-0cfa296e145e	17:00:00	R	B-0	0	6	Spring2020	PHA105L	T001-00 TBA TBA	BC3015B-S
92bb0ffd-b89f-4ac7-93be-96ee13684404	15:20:00	R	B-0	0	7	Spring2020	PHA105L	T001-00 TBA TBA	BC3015F-S
1f3ecd5f-f6f4-4fba-b0b7-7df4cff141ea	11:20:00	ST	-1	35	1	Spring2020	PHA106	5254-PROF J M A Hannan	BC9013-S
bf9c04c9-31a0-4839-aa22-f89daf7756ec	11:20:00	MW	-1	34	2	Spring2020	PHA106	5254-PROF J M A Hannan	BC9013-S
db6639d8-d8e6-4ff8-9827-96f37a19966a	13:40:00	F	-1	22	1	Spring2020	PHA200	5254-PROF J M A Hannan	BC3015F-S
df3960ea-8b15-4911-8582-449781cde93e	09:40:00	MW	-1	22	1	Spring2020	PHA201	5281-PROF Amir Hussain Khan	BC9013-S
05148555-355d-40f1-8c94-920a0f439d1b	11:20:00	MW	-1	10	2	Spring2020	PHA201	5261-MS Syeda Naureen Ahmed	C6004-S
58c1039d-9731-4739-b21c-d19731d20c9b	13:40:00	ST	-1	19	3	Spring2020	PHA201	5281-PROF Amir Hussain Khan	C6004-S
1efbb1c7-8e82-4262-a478-7867ddc78898	11:20:00	MW	B-0	0	4	Spring2020	PHA201	T001-00 TBA TBA	C6005-S
92afdd68-d3e1-4469-b125-1319476f8c21	15:00:00	F	-1	16	5	Spring2020	PHA201	5309-DR Sitesh Chandra Bachar	BC9013-S
9a16d858-88f0-4c41-a2f7-cbb4e37e6003	09:00:00	F	B-0	0	6	Spring2020	PHA201	T001-00 TBA TBA	BC9013-S
468a56db-4919-421f-8a24-7830c07bc643	08:00:00	R	-1	20	1	Spring2020	PHA201L	5300-MS Mashmum Shababa Shahid	BC3015C-S
e44641b6-cbec-4aed-8475-94ca9f3847ba	09:40:00	R	-1	18	2	Spring2020	PHA201L	5300-MS Mashmum Shababa Shahid	BC3015C-S
2d796d55-dbae-4503-bc1a-f620f79541e8	11:20:00	R	-1	13	3	Spring2020	PHA201L	5300-MS Mashmum Shababa Shahid	BC3015C-S
03b3df34-52b4-44b3-8abf-d208ccb68973	13:40:00	R	-1	7	4	Spring2020	PHA201L	5300-MS Mashmum Shababa Shahid	BC3015C-S
b066d55c-633d-4f20-87f1-ac81aade7792	15:20:00	R	-1	2	5	Spring2020	PHA201L	5300-MS Mashmum Shababa Shahid	BC3015C-S
b4d80509-ad9d-4387-a796-1c083af9d6b2	17:00:00	R	B-0	0	6	Spring2020	PHA201L	T001-00 TBA TBA	BC3015D-S
d802bda5-fd57-40c0-8b9b-16f80b1b3206	15:20:00	MW	-1	26	1	Spring2020	PHA202	5301-DR Md. Amran Howlader	BC9013-S
d9a28c7c-c2a6-4d14-94b8-d9b07ebf9696	17:00:00	MW	-1	3	2	Spring2020	PHA202	5301-DR Md. Amran Howlader	C4004-S
ab17155b-4a9d-4c97-ba18-36d5e695248d	17:00:00	ST	-1	14	3	Spring2020	PHA202	5301-DR Md. Amran Howlader	BC9013-S
7c7c736c-140c-4598-8323-6e63be3b9bea	17:00:00	ST	B-0	0	4	Spring2020	PHA202	T001-00 TBA TBA	C5005-S
40212299-a445-4b4e-9f0b-c574d5b7edd3	17:00:00	ST	B-0	0	5	Spring2020	PHA202	T001-00 TBA TBA	C6004-S
77e1be57-324d-41a6-8922-310440c34d74	08:00:00	R	-1	4	1	Spring2020	PHA202L	5280-DR Rajib Bhattacharjee	BC3015D-S
0f31c921-76fe-4642-8129-b478f365b28c	09:40:00	R	-1	15	2	Spring2020	PHA202L	5280-DR Rajib Bhattacharjee	BC3015D-S
4bdf90ec-6501-4763-8217-3c5d84be72dc	11:20:00	R	-1	17	3	Spring2020	PHA202L	5280-DR Rajib Bhattacharjee	BC3015D-S
bea20524-0d7e-43b9-816c-33ab5f3c3212	13:40:00	R	-1	13	4	Spring2020	PHA202L	5280-DR Rajib Bhattacharjee	BC3015D-S
63b81111-f757-40c7-9e5c-8b3113ee2952	09:40:00	MW	-1	19	1	Spring2020	PHA203	5265-MS Saquiba Yesmine	C6003-S
da956789-c52f-4c15-990c-b08542a8de47	11:20:00	MW	-1	20	2	Spring2020	PHA203	5265-MS Saquiba Yesmine	C6006-S
48404a3f-dffc-418c-a0a8-48d37e671f1f	11:20:00	MW	-1	20	3	Spring2020	PHA203	5303-DR Arif Matin	C6003-S
8702cc59-776b-4aca-a10e-4311c2b3f19e	08:00:00	ST	-1	17	4	Spring2020	PHA203	5303-DR Arif Matin	C6006-S
38cd66bc-a41a-4416-a35f-4eb6748d5e9c	13:40:00	ST	B-0	0	5	Spring2020	PHA203	T001-00 TBA TBA	C6006-S
cb665c97-17f9-4a1a-8617-6bc8da1cdad8	08:00:00	A	-1	14	1	Spring2020	PHA203L	5280-DR Rajib Bhattacharjee	BC3015E-S
34b8c3a2-c8a2-44c7-b67f-b371dbecb1e6	09:40:00	A	-1	20	2	Spring2020	PHA203L	5280-DR Rajib Bhattacharjee	BC3015E-S
90ade6f2-6f52-4625-a2f3-542228d22818	11:20:00	A	-1	20	3	Spring2020	PHA203L	5280-DR Rajib Bhattacharjee	BC3015E-S
821c234f-5283-4ebe-ae84-28b8b5b9f327	13:40:00	A	-1	18	4	Spring2020	PHA203L	5280-DR Rajib Bhattacharjee	BC3015E-S
e37f67c5-8b89-49d2-864c-955e2bfa0af6	15:20:00	A	-1	18	5	Spring2020	PHA203L	5280-DR Rajib Bhattacharjee	BC3015E-S
c72803dc-aa9f-476c-86b2-169ed295f303	08:00:00	MW	B-0	0	1	Spring2020	PHA204	5260-MR Mehdi Bin Samad	C6002-S
216d7714-b790-4174-9e8b-5410cd7e2b3a	13:40:00	MW	-1	13	2	Spring2020	PHA204	5260-MR Mehdi Bin Samad	C6003-S
0c95b14c-7fe7-4a44-b07e-814e36a1e9d4	15:20:00	ST	B-0	0	3	Spring2020	PHA204	T001-00 TBA TBA	C6002-S
f0228bdb-a0fd-4179-8979-ebf2d40f5e5d	08:00:00	ST	B-0	0	4	Spring2020	PHA204	T001-00 TBA TBA	C5006-S
32ba9b84-759d-4ccf-80ef-73fb3a4014b1	09:40:00	MW	B-0	0	5	Spring2020	PHA204	5260-MR Mehdi Bin Samad	C6002-S
3df5bedf-023e-4f3d-8bfb-fa881125e602	13:40:00	ST	-1	20	6	Spring2020	PHA204	5260-MR Mehdi Bin Samad	C6002-S
e3384609-e599-4ffc-8df0-654959b74600	13:40:00	MW	-1	20	1	Spring2020	PHA205	5300-MS Mashmum Shababa Shahid	C3007-S
a413f2be-dba0-4717-b46f-2d4ad2636a0e	15:20:00	MW	-1	21	2	Spring2020	PHA205	5300-MS Mashmum Shababa Shahid	C6006-S
3a6469cf-0359-4f84-a7f4-8c50c90fc92c	08:00:00	ST	B-0	0	3	Spring2020	PHA205	T001-00 TBA TBA	C6002-S
87a14e3b-e534-416e-89bb-111d4d5ad0fc	09:40:00	ST	B-0	0	4	Spring2020	PHA205	T001-00 TBA TBA	C3003-S
45f61df3-07c6-4f8f-955e-be6cea338067	17:00:00	ST	B-0	0	5	Spring2020	PHA205	T001-00 TBA TBA	C6003-S
8784c110-aae7-4ea9-94be-2acaa08b3eb2	08:00:00	MW	-1	14	1	Spring2020	PHA206	5300-MS Mashmum Shababa Shahid	C6004-S
5923fb8a-f8d8-41c4-93d2-164cbe04272d	09:40:00	MW	-1	19	2	Spring2020	PHA206	5275-PROF Mohammad Mafruhi Sattar	C4003-S
c1ea6a81-2326-4969-8abb-0bff8c798c2f	09:40:00	ST	-1	20	1	Spring2020	PHA207	5262-MR M. Shahabuddin K. Choudhuri	C6003-S
7e0985dc-ddd9-4de2-9ab0-9b59e31b59a3	11:20:00	ST	-1	19	2	Spring2020	PHA207	5301-DR Md. Amran Howlader	C6003-S
dd5f752d-7371-4b77-a0e2-5fc7ab2e4ab0	08:00:00	ST	-1	27	3	Spring2020	PHA207	5262-MR M. Shahabuddin K. Choudhuri	BC9013-S
40ef22f8-45da-4cdc-ae7f-0a668ddc1819	09:40:00	A	B-0	0	4	Spring2020	PHA207	5274-DR Md. Saiful Islam	C6006-S
ebf3e476-bf8d-441f-892f-1d5373494eec	11:20:00	A	B-0	0	5	Spring2020	PHA207	T001-00 TBA TBA	C6006-S
69867729-2942-4613-b53d-80cbc66ded73	13:40:00	MW	-1	25	1	Spring2020	PHA208	5305-DR Muhammad Asaduzzaman	BC9013-S
409a62de-f7b0-4e9b-a8fa-0d98cddbf722	15:20:00	MW	B-0	0	2	Spring2020	PHA208	T001-00 TBA TBA	C6005-S
f157ad09-ad08-47c5-a3bb-7708d15967d1	17:00:00	R	-1	5	1	Spring2020	PHA208L	5260-MR Mehdi Bin Samad	BC3015E-S
0cf50d37-3d48-458d-bc43-bd3f50b8e284	15:20:00	A	-1	16	2	Spring2020	PHA208L	5260-MR Mehdi Bin Samad	BC3015D-S
956dc792-ad44-45f7-87b4-d04839d02126	11:20:00	ST	B-0	0	1	Spring2020	PHA209	T001-00 TBA TBA	A4L04-S
913fc566-9606-4f50-a619-8c5059a28d3e	17:00:00	ST	B-0	0	2	Spring2020	PHA209	T001-00 TBA TBA	C5004-S
fc54b7ff-631e-4c48-9868-26302c635de9	11:20:00	ST	B-0	0	3	Spring2020	PHA209	T001-00 TBA TBA	FT-S
30ebc26d-407b-4c45-8f4d-9c2264bbcfdb	11:20:00	A	-1	12	4	Spring2020	PHA209	5307-DR Md. Selim Reza	C6002-S
353bb843-4486-4ad4-aced-5a41fde6f9bd	15:20:00	F	B-0	0	1	Spring2020	PHA302	T001-00 TBA TBA	C6002-S
a322f4b2-f5e8-42dc-9451-5cbe1033aacd	10:00:00	F	-1	19	1	Spring2020	PHA303	5290-MR A. R. M. Zahidur Rahman	C6004-S
f2a46ec0-1f67-44bf-b27e-ddf4108f39e0	13:40:00	ST	B-0	0	1	Spring2020	PHA304	5264-MR Masum Shahriar	C6003-S
a338c6c1-7668-4c8a-94cd-c176822ae514	11:20:00	MW	-1	15	1	Spring2020	PHA305	5281-PROF Amir Hussain Khan	C6002-S
6259437e-dc9c-43dc-b396-924b53358094	11:20:00	R	-1	15	1	Spring2020	PHA306	5254-PROF J M A Hannan	C6003-S
23d1df51-59bf-413c-953c-594789f4b073	09:40:00	R	B-0	0	1	Spring2020	PHA308	5289-MR Nazmus Saqueeb	C6003-S
308678ef-a72a-4ab6-8c2b-b16251436951	11:20:00	ST	-1	19	1	Spring2020	PHA309	5263-MR Abdullah Faruque	C6002-S
24d14555-c299-4c77-9cd9-da6ee13a29a9	11:20:00	F	B-0	0	1	Spring2020	PHA401	T001-00 TBA TBA	C6003-S
e8cb0d82-09c3-4444-9f9a-b783d4625cd3	15:20:00	F	-1	10	1	Spring2020	PHA402	5308-MR Ehsan Aziz	C6007-S
2b4a3425-766d-426b-a22a-8e3ef11597e9	09:00:00	F	B-0	0	1	Spring2020	PHA410	T001-00 TBA TBA	C6002-S
556bbcb5-e531-40d9-991f-6c384e22463d	11:20:00	MW	-1	10	1	Spring2020	PHA411	5280-DR Rajib Bhattacharjee	C6007-S
ba333719-8802-4553-931a-87ac0fb07d29	13:40:00	MW	-1	37	1	Spring2020	PHL101	2307-MR Obydullah Al Marjuk	C4005-S
73a27475-eaf6-414e-b58f-e37dfaf6c712	11:20:00	ST	-1	28	2	Spring2020	PHL101	2335-MS Parsa S. Sajid	BC4014-S
f0cf3a78-580e-48f7-85eb-4590bebf7548	09:40:00	MW	-1	14	1	Spring2020	PHY100	4250-DR Asma Begum	C5006-S
5fce8b8c-3271-44a3-800f-32c7e4544310	08:00:00	MW	-1	35	1	Spring2020	PHY101	4250-DR Asma Begum	BC6012-S
f14c6cd0-0b89-4bbe-930f-a262caa79117	08:00:00	ST	-1	39	2	Spring2020	PHY101	4250-DR Asma Begum	BC7025-S
903c4193-ddee-4681-89b0-4a6db76b1feb	08:00:00	ST	-1	30	3	Spring2020	PHY101	4429-DR Khan Muhammad Bin Asad	BC7026-S
b293872a-ea2f-4422-94b6-d1ac66b301ae	08:00:00	MW	-1	33	4	Spring2020	PHY101	4384-DR S N M Azizul Hoque	BC6013-S
9a511a22-bebe-487a-85f5-48e6dae96f75	13:40:00	ST	-1	40	5	Spring2020	PHY101	4378-DR Md. Readul Mahmud	BC6007-S
34d18390-1019-41ba-9c6f-bec6bcb18f5a	08:00:00	MW	-1	32	6	Spring2020	PHY101	4298-DR Mohammad Jellur Rahman	BC9017-S
cf5a0b4a-ea57-43ee-8621-a71ed8d321d9	15:20:00	MW	-1	38	7	Spring2020	PHY101	4378-DR Md. Readul Mahmud	C2005-S
0ff94802-1786-4567-80f3-cf732565fe8d	15:20:00	ST	-1	39	8	Spring2020	PHY101	4377-MR Md Akhlak Bin Aziz	BC9014-S
4ff433c6-230e-4df3-beea-ef760571f4d9	17:00:00	MW	-1	12	9	Spring2020	PHY101	4430-MR Ifte Khairul Alam Bhuiyan	BC10015-S
8e62ac98-dd97-4ffa-8060-b6887d4b7068	09:40:00	ST	-1	40	10	Spring2020	PHY101	4384-DR S N M Azizul Hoque	BC8015-S
f92734c3-e044-4f13-bf22-f523fe43ca07	13:40:00	ST	-1	19	11	Spring2020	PHY101	4112-DR Mostafa Kamal	C5002-S
c72aa7bf-1786-4a77-990a-9d4b1f79ab60	13:40:00	MW	-1	37	12	Spring2020	PHY101	4158-MR Dr. Farhad Alam	BC9017-S
fb912277-31f8-463d-8db7-3d358ca9bb57	11:20:00	ST	-1	19	13	Spring2020	PHY101	4378-DR Md. Readul Mahmud	C4003-S
80ab8c81-d9d9-402e-afd4-344395f37ca9	09:40:00	ST	-1	19	14	Spring2020	PHY101	4158-MR Dr. Farhad Alam	C4003-S
7eb9dd6e-13f1-41e3-bf86-cd1630732cd8	11:20:00	T	-1	19	1	Spring2020	PHY101L	4327-MS Amrita Khan	PLab-S
f2fd6466-d98e-43bd-96ed-d2cd1454e4a1	13:40:00	T	-1	20	2	Spring2020	PHY101L	4430-MR Ifte Khairul Alam Bhuiyan	PLab-S
ffb7f73b-6592-4632-9dec-49def031234b	11:20:00	W	-1	19	3	Spring2020	PHY101L	4430-MR Ifte Khairul Alam Bhuiyan	PLab-S
642b5afa-1f51-47c7-b3fd-4fd9fe45e241	13:40:00	W	-1	19	4	Spring2020	PHY101L	4319-MR Bablu Chandra Das	PLab-S
70c76bb3-f0d9-4c9e-b628-e7a4a979325c	09:40:00	M	-1	20	5	Spring2020	PHY101L	4357-MR Andalib Nizam	PLab-S
dcbd4028-e690-414e-a71d-bc46ec2b0761	13:40:00	M	-1	20	6	Spring2020	PHY101L	4320-MR Md. Sazzad Hossain	PLab-S
90bedb87-a05a-4288-bab7-8e26d52da61f	09:40:00	W	-1	20	7	Spring2020	PHY101L	4357-MR Andalib Nizam	PLab-S
4eca849b-694f-4063-8df7-0a10dc2d95b5	15:20:00	W	-1	19	8	Spring2020	PHY101L	4319-MR Bablu Chandra Das	PLab-S
5abd5a07-2574-4af8-b060-3e6ad7c3b871	11:20:00	M	-1	20	9	Spring2020	PHY101L	4320-MR Md. Sazzad Hossain	PLab-S
879d78fa-1b92-4da6-81fe-d9b71c437743	11:20:00	S	-1	20	10	Spring2020	PHY101L	4357-MR Andalib Nizam	PLab-S
d6b00111-7cfc-4658-95d5-9e9279c02050	09:40:00	S	-1	19	11	Spring2020	PHY101L	4327-MS Amrita Khan	PLab-S
6ed50439-6df1-4482-8a08-776c586f5e22	13:40:00	S	-1	22	12	Spring2020	PHY101L	4319-MR Bablu Chandra Das	PLab-S
10060c31-9987-41d8-907e-b835507028c4	15:20:00	M	-1	19	13	Spring2020	PHY101L	4319-MR Bablu Chandra Das	PLab-S
45d01904-5916-4637-b9ba-9b8612fe70ae	15:20:00	S	-1	20	14	Spring2020	PHY101L	4319-MR Bablu Chandra Das	PLab-S
fb806931-b5af-4f09-9e5f-80b99c19ea19	17:00:00	S	-1	18	15	Spring2020	PHY101L	4319-MR Bablu Chandra Das	PLab-S
87c87c5b-add5-4cba-b7d6-cabc2dcb5045	09:40:00	T	-1	19	16	Spring2020	PHY101L	4327-MS Amrita Khan	PLab-S
82094fea-181c-4d61-a7d5-26491420b271	15:20:00	T	-1	20	17	Spring2020	PHY101L	4430-MR Ifte Khairul Alam Bhuiyan	PLab-S
4332d777-ebe8-445e-b7e0-cb22df0c0123	08:00:00	S	-1	18	18	Spring2020	PHY101L	4357-MR Andalib Nizam	PLab-S
7314ed35-6ca8-4327-9bd7-7221daf0969d	17:00:00	M	-1	17	19	Spring2020	PHY101L	4320-MR Md. Sazzad Hossain	PLab-S
84890c74-e552-43fb-9c1b-d39d76ef53f9	08:00:00	M	-1	11	20	Spring2020	PHY101L	4357-MR Andalib Nizam	PLab-S
0c5a11d7-f7d0-40f2-92ae-8426a337c484	17:00:00	T	-1	17	21	Spring2020	PHY101L	4377-MR Md Akhlak Bin Aziz	PLab-S
0e8fce34-f6ec-4b73-95cb-3e7cadb588c8	08:00:00	T	-1	17	22	Spring2020	PHY101L	4357-MR Andalib Nizam	PLab-S
10fde894-8e2e-4576-af2f-b83948162c16	08:00:00	W	B-0	0	23	Spring2020	PHY101L	T001-00 TBA TBA	PLab-S
f1299358-4fed-47a1-9583-3716c9fabed5	17:00:00	W	B-0	0	24	Spring2020	PHY101L	T001-00 TBA TBA	PLab-S
4070372d-9d90-428b-ac12-edc5728ebc23	13:40:00	MW	-1	40	1	Spring2020	PHY102	4112-DR Mostafa Kamal	BC6009-S
4678c5d9-b286-4415-9581-8773a06e07e7	09:40:00	ST	-1	32	2	Spring2020	PHY102	4250-DR Asma Begum	BC7026-S
4a4c7d1b-9242-4e2f-ad78-74306a4d7336	13:40:00	ST	-1	40	3	Spring2020	PHY102	4158-MR Dr. Farhad Alam	BC6008-S
983069f8-8122-4f7b-be9b-ab56a026bfd8	11:20:00	MW	-1	37	4	Spring2020	PHY102	4112-DR Mostafa Kamal	BC9017-S
d69442a5-7e63-463b-abef-db257dac00b4	17:00:00	ST	B-0	0	5	Spring2020	PHY102	T001-00 TBA TBA	C4005-S
d2427dee-46e3-47a7-ac71-5e86be6c819f	13:40:00	S	-1	22	1	Spring2020	PHY102L	4430-MR Ifte Khairul Alam Bhuiyan	PLab2-S
558db905-c83b-4c10-9935-b5bada05afd9	11:20:00	M	-1	25	2	Spring2020	PHY102L	4430-MR Ifte Khairul Alam Bhuiyan	PLab2-S
a5ab9c73-06dd-42ea-a662-c0395d62c466	09:40:00	S	-1	21	3	Spring2020	PHY102L	4430-MR Ifte Khairul Alam Bhuiyan	PLab2-S
6329ad3f-4d0c-4332-967b-c106a8ab8cd9	17:00:00	M	-1	20	4	Spring2020	PHY102L	4319-MR Bablu Chandra Das	PLab2-S
de71f3e2-dc26-4882-ae07-54da83c2f5ad	11:20:00	W	-1	24	5	Spring2020	PHY102L	4319-MR Bablu Chandra Das	PLab2-S
8184d409-8c0e-49be-8267-7648b31443b5	09:40:00	W	-1	17	6	Spring2020	PHY102L	4327-MS Amrita Khan	PLab2-S
b5cd7151-be31-47fa-a0ef-bf84832df1f3	13:40:00	T	-1	21	7	Spring2020	PHY102L	4377-MR Md Akhlak Bin Aziz	PLab2-S
a2cf9c18-5d5c-4b2e-b625-b6a23bed9044	15:20:00	S	B-0	0	8	Spring2020	PHY102L	T001-00 TBA TBA	PLab2-S
cc939921-700e-4f73-9a2c-ba467e718766	11:20:00	MW	-1	6	1	Spring2020	PHY103	4338-PROF M Arshad Momen	C4002-S
2f3d445c-1159-4726-bb7c-e265e47e83c7	08:00:00	S	-1	5	1	Spring2020	PHY103L	4327-MS Amrita Khan	PLab2-S
f8eb1a4c-92de-49c0-9bd2-f44ec3f7661d	13:40:00	ST	-1	39	1	Spring2020	PHY111	4327-MS Amrita Khan	BC6012-S
114a3e73-b3dc-45fc-b7c5-5cfac2e83677	13:40:00	MW	-1	40	2	Spring2020	PHY111	4327-MS Amrita Khan	BC6012-S
dc6b38e0-bae7-452e-8dfa-6fb8d4a4f95a	15:20:00	MW	-1	10	3	Spring2020	PHY111	4327-MS Amrita Khan	C4003-S
0639fb24-272d-4b95-903f-200a000b7619	15:20:00	ST	-1	35	1	Spring2020	PHY121	4112-DR Mostafa Kamal	BC9017-S
92c81df5-1029-424d-b8fa-24824fce3999	08:00:00	MW	B-0	0	2	Spring2020	PHY121	T001-00 TBA TBA	BC10018-S
ad7f053b-69b5-453b-8538-11a9a693e56b	09:40:00	M	-1	14	1	Spring2020	PHY121L	4327-MS Amrita Khan	PLab2-S
8da6d4e8-c709-4dd9-8b75-daa9e585a4fe	09:40:00	T	-1	20	2	Spring2020	PHY121L	4357-MR Andalib Nizam	PLab2-S
9bf0a01c-76e7-4558-a502-6438df202f13	15:20:00	M	B-0	0	3	Spring2020	PHY121L	T001-00 TBA TBA	PLab2-S
75a0e6ac-bb14-4658-bc96-01a10ddee5ab	09:40:00	MW	-1	1	1	Spring2020	PHY436	4158-MR Dr. Farhad Alam	C3007-S
369fe5ed-08e2-44fd-af45-72e99cf3edb1	08:00:00	ST	-1	14	1	Spring2020	POP201	5295-MS Sadia Tasfina	BC4014-S
6924e920-08ee-4e00-ac3d-88d50d88c89f	09:40:00	MW	-1	32	2	Spring2020	POP201	5231-MR Saquib Ahmad Khan	C2005-S
56bfc011-15d6-4b8a-af5c-47666afa3924	08:00:00	MW	-1	21	1	Spring2020	POP305	5295-MS Sadia Tasfina	BC10017-S
d2388a09-0d0f-42e6-8597-d1f91d1ddab1	09:40:00	MW	-1	34	2	Spring2020	POP305	5551-DR Khandaker Ezazul Haque	BC9016-S
1ee2499b-70eb-45a1-ba05-06ad39309290	09:40:00	ST	-1	10	1	Spring2020	POP411	5551-DR Khandaker Ezazul Haque	C4006-S
ff3f0d92-10f1-43e8-876f-302a00e971d2	13:40:00	MW	-1	23	1	Spring2020	PSY201	5519-DR Nafisa Huq	C2004-S
42b8363b-ee68-49f5-8b65-f8132a00af14	09:40:00	ST	-1	33	1	Spring2020	SOC101	2200-MS Sharmeen Ahmed	C4005-S
332a989a-f2e8-428c-9591-f148626b19c6	08:00:00	MW	-1	18	2	Spring2020	SOC101	2198-MS Mahbuba Dewan	BC7025-S
787c41f8-fee7-4eb9-b9d2-25a6f494c22a	11:20:00	ST	-1	28	3	Spring2020	SOC101	2198-MS Mahbuba Dewan	BC7025-S
5176b2d3-6010-4535-87e2-81389925d41f	11:20:00	MW	-1	36	4	Spring2020	SOC101	2307-MR Obydullah Al Marjuk	BC8015-S
b35ad68b-d5a8-4754-a72f-5cbb72717fe0	15:20:00	ST	-1	41	5	Spring2020	SOC101	2165-PROF A. I. Mahbub Uddin Ahmed	BC8015-S
893585de-1253-4b03-b16e-763bb43ab28b	13:40:00	ST	-1	13	6	Spring2020	SOC101	2307-MR Obydullah Al Marjuk	C4007-S
55882551-8579-457f-95e7-699c83b5ff82	11:20:00	MW	-1	17	1	Spring2020	SOC205	2198-MS Mahbuba Dewan	C3002-S
f0a2dc9f-55c5-4395-b0fd-511a2c4694ee	11:20:00	ST	-1	10	1	Spring2020	SOC301	2200-MS Sharmeen Ahmed	C3006-S
37289dd8-98ea-40bb-941e-bb30c9bd6a33	09:40:00	MW	-1	10	1	Spring2020	SOC318	2198-MS Mahbuba Dewan	C3003-S
a9d48c8e-40f8-4294-b8ac-c21f476bcd42	17:00:00	MW	-1	3	1	Spring2020	SOC322	2485-MR A. K. M Nurun Nabi	BC4012-S
e9ea5ff5-f2b0-4f11-a907-015be3733d79	13:40:00	ST	-1	10	1	Spring2020	SOC401	2207-MR S. Aminul Islam	C3003-S
db9a9fc7-48c1-4b3b-8a51-ade04b614cff	17:00:00	ST	-1	6	1	Spring2020	SOC406	2200-MS Sharmeen Ahmed	C2007-S
7e2f8fd4-c8d6-479f-9898-d79dd103af75	15:20:00	MW	-1	2	1	Spring2020	SOC408	2485-MR A. K. M Nurun Nabi	C3003-S
50725477-745b-44b0-8602-5864ce8e134f	08:00:00	R	0	0	1	Spring2020	SOC499	2220-PROF Abdul Monim Chowdhury	BCTBA2-S
0daf28a4-cc8f-4de3-95ba-edef67e068ea	11:00:00	MW	-1	23	1	Autumn2020	AAT101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
0b50e48e-56a8-4bec-b0e3-62d3a0e29ee4	08:00:00	ST	-1	43	1	Autumn2020	ACN201	3563-MR Mohammed Naveed Siddiquee	BC2009-S
32625f96-584a-43bb-b7a3-ffc79c411960	09:30:00	ST	-1	45	2	Autumn2020	ACN201	3600-MR Prahallad Chandra Das	BC2009-S
a34a9884-9e28-4282-959b-de30510533b9	11:00:00	MW	-1	45	3	Autumn2020	ACN201	3478-MR Md. Safiuddin	BC2009-S
c20df524-e747-4054-b131-f0051dffea9f	14:00:00	MW	-1	47	4	Autumn2020	ACN201	3603-MR Md. Rezaul Karim	BC2009-S
f0e9d225-41ae-4879-9f15-60c477a8d328	14:00:00	ST	-1	46	5	Autumn2020	ACN201	3493-MR Ashraful Arefin	BC2009-S
31e861b7-5a32-40c3-84b2-c56ee34bceef	15:30:00	ST	-1	45	6	Autumn2020	ACN201	3563-MR Mohammed Naveed Siddiquee	BC2009-S
ade412aa-52c5-411f-832a-518873db09ae	08:00:00	MW	-1	10	7	Autumn2020	ACN201	3624-MR Iqtesab Haider	BC2009-S
c4fee1d8-10a1-41e2-864d-7350a6a8861c	17:00:00	MW	B-0	0	8	Autumn2020	ACN201	3603-MR Md. Rezaul Karim	BC2009-S
ccd6ca5b-1b31-4fcf-a28c-452764a86c8a	08:00:00	MW	-1	36	1	Autumn2020	ACN202	3427-MS Nimat Zarin	BC2010-S
ffb6e9a9-adb8-469a-9f9f-bc4812958844	09:30:00	ST	-1	35	2	Autumn2020	ACN202	3376-MR Naheem Mahtab	BC2010-S
9928ec5c-2600-4442-8850-e1be23ed49b9	12:30:00	MW	-1	45	3	Autumn2020	ACN202	3563-MR Mohammed Naveed Siddiquee	BC2009-S
1892c05d-afd3-4acb-a8fa-07af3d58f361	11:00:00	ST	-1	45	4	Autumn2020	ACN202	3600-MR Prahallad Chandra Das	BC2009-S
bbed6bfb-8450-4036-936f-15b2896af5e7	14:00:00	MW	-1	45	5	Autumn2020	ACN202	3478-MR Md. Safiuddin	BC2010-S
9fb15784-d385-4d2c-a9c4-4becec6a5043	17:00:00	ST	-1	46	6	Autumn2020	ACN202	3493-MR Ashraful Arefin	BC2009-S
6e43a354-2bf6-4c53-b2bc-400d5cd77ae5	09:30:00	ST	-1	27	1	Autumn2020	ACN301	3147-DR Rushdi Rezaur Razzaque	BC2011-S
d54bb5bf-58da-479e-b980-6db019ecacdc	09:30:00	MW	-1	11	2	Autumn2020	ACN301	3269-MR Zeeshan Abedin	BC2009-S
f42cbeca-e1f1-4451-b0c7-3f5e12676b60	09:30:00	MW	-1	13	1	Autumn2020	ACN305	3147-DR Rushdi Rezaur Razzaque	BC2010-S
53127679-0b80-4f54-a3b6-729e7150c08e	12:30:00	ST	-1	29	2	Autumn2020	ACN305	3478-MR Md. Safiuddin	BC2009-S
4b88cf07-ee38-4420-a533-efb419018d46	09:30:00	ST	-1	33	1	Autumn2020	ACN402	3478-MR Md. Safiuddin	BC2012-S
da65e6e7-5d29-44b2-a099-7c6379bed9e1	12:30:00	MW	B-0	0	2	Autumn2020	ACN402	3603-MR Md. Rezaul Karim	BC2010-S
6e4a5b10-bbff-4916-87a5-d53d797e87fd	15:30:00	MW	B-0	0	1	Autumn2020	ACN403	3563-MR Mohammed Naveed Siddiquee	BC2009-S
13ccfeca-3d90-497f-b9ed-19bdbc3ef0d2	08:00:00	ST	-1	50	2	Autumn2020	ACN403	3427-MS Nimat Zarin	BC2010-S
67149b7e-37bd-4b84-aad0-adc059d1cd50	11:00:00	MW	-1	18	1	Autumn2020	ACN405	3376-MR Naheem Mahtab	BC2010-S
483ef191-f3a3-4fca-b802-2ed5c815f88e	11:00:00	ST	-1	11	2	Autumn2020	ACN405	3563-MR Mohammed Naveed Siddiquee	BC2010-S
e273756e-b6f8-45aa-a937-a67417ff2ea8	11:00:00	ST	-1	19	1	Autumn2020	ACN406	3376-MR Naheem Mahtab	BC4013-S
bfd4f9bc-62f6-4165-9cd0-8e4a86a1e4ea	17:00:00	MW	-1	50	1	Autumn2020	ACN441	3563-MR Mohammed Naveed Siddiquee	BC2010-S
b14ad05c-9392-4b7c-89c9-c2e3f4066121	15:30:00	ST	-1	41	1	Autumn2020	ANT101	2326-MR Maidul Alam Chaklader	BC8015-S
b0e5d076-77be-4061-9b7b-7c2afaa65b2c	15:30:00	MW	-1	39	2	Autumn2020	ANT101	2326-MR Maidul Alam Chaklader	BC7015-S
e9c975b3-c01b-4a7a-839b-feccda683d3f	14:00:00	ST	-1	41	3	Autumn2020	ANT101	2194-MR Mohammad Mahfuzul Islam	C2004-S
f32167ce-d571-41ad-93bf-ef80ee3b0d1c	14:00:00	MW	-1	41	4	Autumn2020	ANT101	2194-MR Mohammad Mahfuzul Islam	BC7015-S
c66ffafa-6b10-48e3-8eb7-fdfd9e1fe54f	08:00:00	ST	-1	22	5	Autumn2020	ANT101	2443-MS Tazin Rahman Ananya	BC8011-S
271a32cd-37e6-425b-a832-e4a9609a0d9c	09:30:00	ST	-1	38	6	Autumn2020	ANT101	2443-MS Tazin Rahman Ananya	C2004-S
b3319676-496a-4ea5-9a1e-08ee8478551a	11:00:00	MW	-1	40	7	Autumn2020	ANT101	2443-MS Tazin Rahman Ananya	BC7015-S
a951cefc-066a-42c9-b39c-e2341872aeba	09:30:00	MW	-1	39	8	Autumn2020	ANT101	2444-MS Ibtesum Afrin	BC7015-S
fe6730d3-fad1-4f16-806a-2ff818027ef4	12:30:00	MW	-1	40	9	Autumn2020	ANT101	2444-MS Ibtesum Afrin	BC10015-S
15e950d7-e42f-4fd4-a807-885162d339f7	14:00:00	ST	-1	27	1	Autumn2020	ANT103	2326-MR Maidul Alam Chaklader	C2007-S
718bf0ca-f4ea-4851-91e0-06489bd18404	15:30:00	ST	-1	22	1	Autumn2020	ANT205	2194-MR Mohammad Mahfuzul Islam	C2005-S
ec307054-fc7f-41dd-841b-c84485c2e23d	09:30:00	MW	-1	2	1	Autumn2020	ANT308	2443-MS Tazin Rahman Ananya	C2006-S
6fb5c85b-391f-48d7-ba05-e20df0f5a208	14:00:00	MW	-1	16	1	Autumn2020	ANT312	2326-MR Maidul Alam Chaklader	C2003-S
216a5bf1-56e8-4b8b-acbf-6b6506d92fd8	15:30:00	MW	-1	11	1	Autumn2020	ANT401	2194-MR Mohammad Mahfuzul Islam	BC8014-S
9593f3b6-5a79-48b4-a838-98f5889573d4	15:30:00	MW	-1	7	1	Autumn2020	ANT404	2389-DR Ranjan Saha Partha	BC8013-S
9221d1f5-3407-4674-94a9-623a0544aaaa	08:00:00	ST	0	0	1	Autumn2020	ANT499	2194-MR Mohammad Mahfuzul Islam 2326-Maidul AlamChaklader	BC001-S
1e2f622e-05bd-46ce-9217-77cfdb44b3d3	08:00:00	F	-1	177	1	Autumn2020	BBA499A	3229-DR Sarwar Uddin Ahmed	BCTBA3-S
a5488e88-81cc-471a-a442-7cfb2cc8cb6c	08:00:00	S	0	0	1	Autumn2020	BBA499B	T001-00 TBA TBA	BCTBA1-S
b692fd2a-2603-4164-851f-de2c0f5c052c	15:30:00	MW	-1	12	1	Autumn2020	BCB103	5212-MR Chowdhury Kamrul Hasan	BC4017C-S
cdc259d8-703b-4599-8651-f5471b295435	11:00:00	R	0	12	1	Autumn2020	BCB103L	5212-MR Chowdhury Kamrul Hasan	BC4017C-S
a5b4004a-92ea-44cd-a470-3c98783d9ecd	12:30:00	MW	-1	12	1	Autumn2020	BCB104	5212-MR Chowdhury Kamrul Hasan	BC4017B-S
d84d6d66-2973-4529-813d-48d5e96b900f	12:30:00	R	0	12	1	Autumn2020	BCB104L	5212-MR Chowdhury Kamrul Hasan	BC4017C-S
3f24f880-0f9a-419f-a9c9-c9dd30a87d7f	14:00:00	R	-1	24	1	Autumn2020	BCB201L	5252-DR Sadia Nazneen Karobi	BC4017B-S
1de6cbc2-e98d-446f-9c29-28d58a8262a1	15:30:00	ST	-1	7	1	Autumn2020	BCB202	5252-DR Sadia Nazneen Karobi	BC9015-S
cbd4d483-1eef-4525-84bb-eb1e1092f407	17:00:00	ST	-1	11	1	Autumn2020	BCB202L	5252-DR Sadia Nazneen Karobi	BC4017A-S
6c68f35b-35ba-406e-bec3-9b69d033cd34	14:00:00	ST	-1	12	1	Autumn2020	BCB203	6054-DR Sabrina Moriom Elias	BC9015-S
9d975117-1029-41e4-bedc-3c400dcda5b6	09:30:00	MW	-1	31	1	Autumn2020	BCB205	6064-MR Md. Daud Hossain Khan	BC10015-S
0f8bccdd-25d0-4be2-9230-9abfde78d5e2	14:00:00	MW	-1	21	1	Autumn2020	BCB206	6002-MR Syed A. K. Shifat Ahmed	BC9016-S
30a155d7-187c-4c7f-8511-0e514e2ac0b8	11:00:00	MW	B-0	0	1	Autumn2020	BCB207	T001-00 TBA TBA	BC4017A-S
144efce5-23df-43fa-842f-f78c113923cd	12:30:00	ST	-1	8	1	Autumn2020	BCB306	6054-DR Sabrina Moriom Elias	BC4013-S
0676002b-bd6a-4224-a946-984e48806353	15:30:00	MW	-1	12	1	Autumn2020	BCB307	6054-DR Sabrina Moriom Elias	BC9015-S
04f07e39-27fe-4209-83a2-89953f46787c	11:00:00	ST	-1	14	1	Autumn2020	BCB308	6049-DR Syed Saleheen Qadri	C4003-S
30b3ffab-d30c-4071-9e25-eda593c27d19	09:30:00	ST	-1	16	1	Autumn2020	BCB309	6054-DR Sabrina Moriom Elias	C3007-S
e7841609-c148-49dd-bfd4-54742d145dda	14:00:00	ST	-1	11	1	Autumn2020	BCB401	6064-MR Md. Daud Hossain Khan	C3007-S
47c23855-cce4-4730-8fcd-b3336b597c39	15:30:00	ST	-1	17	1	Autumn2020	BCB405	6010-MS Tasnimul Ferdous	BC9016-S
39c46605-ed71-4636-a8fa-b1141593245a	17:00:00	MW	-1	18	1	Autumn2020	BCB409	6055-DR Rashed Noor	BC9015-S
73248d4a-96d5-4604-9cad-e9796b03fd51	12:30:00	MW	-1	12	1	Autumn2020	BCB410	6009-DR Ashrafus Safa	BC10017-S
badba734-b46f-418e-84f8-6e8e85b2eb4b	11:00:00	MW	-1	15	1	Autumn2020	BCB413	6064-MR Md. Daud Hossain Khan	C4002-S
c71f2a01-792e-47d9-a437-ef78dc67bff6	08:00:00	MW	-1	3	1	Autumn2020	BCB450	6002-MR Syed A. K. Shifat Ahmed	BC9016-S
7a20afd8-708f-49cf-92ec-eb56b32242b2	08:00:00	MW	-1	3	2	Autumn2020	BCB450	6064-MR Md. Daud Hossain Khan	BC10017-S
192aef9c-06bc-4b03-9e8a-587420f722b3	11:00:00	F	-1	2	3	Autumn2020	BCB450	6054-DR Sabrina Moriom Elias	BC4017C-S
6b16058d-b026-4072-be53-b4841ecc85bb	09:30:00	F	-1	2	4	Autumn2020	BCB450	6013-MS Noshin Azra Rahman	BC4017A-S
7fdd9c98-06fb-4ebd-8db0-da3a6783077d	12:30:00	F	-1	1	5	Autumn2020	BCB450	6010-MS Tasnimul Ferdous	BC4017C-S
b8bb1c04-76bc-42f7-9e7f-04f63fa9b40a	14:00:00	ST	-1	24	1	Autumn2020	BDS109	4146-DR Zakir Hossain Raju	BC7002-S
27d4ba13-583e-4353-8f06-69a5f66e2b3e	09:30:00	ST	-1	25	2	Autumn2020	BDS109	2393-MS Janina Islam Abir	BC3002-S
262da72b-3466-4bfb-b880-c50cac9d9a3b	11:00:00	ST	-1	25	3	Autumn2020	BDS109	2442-MS Mushfeqa Islam	BC7002-S
f8badb3a-9cde-4667-924c-9631e6612e6a	14:00:00	MW	-1	25	4	Autumn2020	BDS109	2481-DR Zahed-Ur- Rahman	BC7002-S
d1b74984-030b-43b0-8ab7-131c5d471a97	15:30:00	MW	-1	24	5	Autumn2020	BDS109	2497-MR Hamza Kamal Mostafa	BC7002-S
b8efcf25-ea97-472d-9539-6ea40463350b	17:00:00	MW	-1	25	6	Autumn2020	BDS109	2497-MR Hamza Kamal Mostafa	BC3002-S
bb2b9125-400d-40eb-af70-e50639c4466f	12:30:00	MW	-1	25	7	Autumn2020	BDS109	2481-DR Zahed-Ur- Rahman	BC5002-S
986dcd50-ec7c-4bac-938c-78526a3f6b57	11:00:00	ST	-1	45	1	Autumn2020	BIO100	6053-MS Saadia Shareen	BC10014-S
54b89c18-5b4d-4378-99ed-e0d7234ad6b7	12:30:00	ST	-1	46	2	Autumn2020	BIO100	6053-MS Saadia Shareen	BC10014-S
333b9146-1d62-42a2-b7d5-d47e2db4e06b	11:00:00	MW	-1	47	3	Autumn2020	BIO100	6053-MS Saadia Shareen	BC10014-S
0739862b-3d1d-418d-b543-c430c6d37d3f	12:30:00	MW	-1	47	4	Autumn2020	BIO100	6064-MR Md. Daud Hossain Khan	BC10014-S
ad5fb3cf-0d11-46ed-a667-2ca3f0fe8c2c	14:00:00	ST	-1	46	5	Autumn2020	BIO100	6053-MS Saadia Shareen	BC10014-S
de2602a7-ff56-49c4-a495-25c03e52ff4f	15:30:00	ST	B-0	0	6	Autumn2020	BIO100	T001-00 TBA TBA	BC10015-S
a75f6cb0-be27-42ca-8568-efba13d8e875	14:00:00	MW	-1	17	7	Autumn2020	BIO100	6053-MS Saadia Shareen	BC10014-S
a581e922-67d8-4cc3-9467-e89b39e01f88	15:30:00	MW	0	0	8	Autumn2020	BIO100	T001-00 TBA TBA	BC10014-S
69cd51c9-95cf-4c22-b666-6f180782b376	17:00:00	MW	B-0	0	9	Autumn2020	BIO100	T001-00 TBA TBA	BC10014-S
11c2e78f-7c9c-4e33-bdf0-409a421d1ce9	08:00:00	ST	B-0	0	10	Autumn2020	BIO100	T001-00 TBA TBA	BC10014-S
ed5a6ffb-4208-4dbe-81db-6a3ffe3b591b	11:00:00	MW	-1	24	1	Autumn2020	BIO102	6002-MR Syed A. K. Shifat Ahmed	BC10015-S
8944ed83-ca64-4545-a15f-6685111dd5dc	12:30:00	W	0	24	1	Autumn2020	BIO102L	6002-MR Syed A. K. Shifat Ahmed	BC4017A-S
f39de290-c811-4945-9ebe-1b4167dfebca	11:00:00	ST	-1	7	1	Autumn2020	BIO105	5252-DR Sadia Nazneen Karobi	BC4017D-S
bb1dcfa1-e137-43d3-bbd4-5be26cfd82f5	09:30:00	ST	0	7	1	Autumn2020	BIO105L	5252-DR Sadia Nazneen Karobi	BC4017A-S
fa96b67e-27b0-483f-84c5-7dea1b230566	08:00:00	ST	-1	1	1	Autumn2020	BIO210	6002-MR Syed A. K. Shifat Ahmed	C2003-S
f80e0c73-82b8-4367-87fd-dab689f2d673	09:30:00	MW	-1	13	1	Autumn2020	BLA101	2446-DR Muhammad Shajjad Ahsan	BC5002-S
eba627bc-bdf2-4d66-b8eb-a0334f7e9c56	11:00:00	MW	-1	37	2	Autumn2020	BLA101	2446-DR Muhammad Shajjad Ahsan	BC5002-S
b5bbc56a-405a-417d-a92f-b18a9042d85b	11:00:00	ST	-1	28	1	Autumn2020	BNG201	2388-DR Lutfor Rahman	BC4011-S
e918df4b-cd3c-4899-80ee-cb3c157f20dd	12:30:00	ST	-1	30	2	Autumn2020	BNG201	2388-DR Lutfor Rahman	BC4010-S
ee838cc5-eed6-4143-a5e7-05a257c56346	11:00:00	MW	-1	30	3	Autumn2020	BNG201	2427-MR Shaikh Mahfuzur Rahman	C2004-S
4bb20fe1-a1d5-4260-832b-5213ff056f30	15:30:00	MW	-1	29	4	Autumn2020	BNG201	2427-MR Shaikh Mahfuzur Rahman	C2005-S
c88c6c92-963e-4d89-95e2-cafdf48b6a14	14:00:00	MW	-1	50	1	Autumn2020	BPH101	2398-MR Sayed Abu Touab Shakir	BC3002-S
153c670f-41c6-420d-a091-2c35d0cbaa9c	15:30:00	MW	-1	49	2	Autumn2020	BPH101	2398-MR Sayed Abu Touab Shakir	BC5002-S
3b7d0a22-93c8-40ca-8dd8-790d7b055a36	17:00:00	MW	-1	51	3	Autumn2020	BPH101	2398-MR Sayed Abu Touab Shakir	BC7002-S
d03b0b21-a886-4d65-953f-ba9d7d288f62	08:00:00	ST	-1	49	1	Autumn2020	BUS201	3251-MS Farzana Chowdhury	BC2011-S
4c735d41-221d-4ac5-9841-09d06063d5c2	11:00:00	ST	-1	50	2	Autumn2020	BUS201	3251-MS Farzana Chowdhury	BC3010-S
93371f58-0200-4279-9eea-4bcd9af66331	14:00:00	ST	-1	50	3	Autumn2020	BUS201	3423-MR Arifur Rahman Khan	BC2021-S
c4c404f4-e8a7-4c60-be27-6363b7221fa7	14:00:00	MW	-1	49	4	Autumn2020	BUS201	3539-MR SM Yusuf Mallick	BC2011-S
c51a93b4-f60b-42a4-98f7-141a4adb7b96	15:30:00	MW	-1	48	5	Autumn2020	BUS201	3344-MR Mohammad Fahad Noor	BC3011-S
801a2edc-d5f0-4efa-9df9-e3efa10e4af6	09:30:00	ST	-1	49	6	Autumn2020	BUS201	3525-MS Afnan Ashfaque	BC8015-S
42c5a22b-7fe7-4b26-b35e-34330c388c56	17:00:00	ST	-1	50	7	Autumn2020	BUS201	3570-MS Maria Muntahin	BC2010-S
0bca3a30-9d00-473a-a309-2c43fe0d4478	12:30:00	MW	-1	50	8	Autumn2020	BUS201	3525-MS Afnan Ashfaque	BC3008-S
8e0eebfe-5fd8-49a8-b3a1-ab107eb86510	11:00:00	ST	-1	37	1	Autumn2020	BUS202	3545-DR Mohammad Osman Gani	BC3011-S
26b6729c-f069-4a57-8743-a5708228c1ae	12:30:00	ST	-1	41	2	Autumn2020	BUS202	3579-MS Seeratus Sabah	BC2010-S
d441b63a-ee2c-4fd6-9d7b-630778582238	11:00:00	MW	-1	37	3	Autumn2020	BUS202	3534-DR Md. Abdus Salam Akanda	BC3012-S
25442d09-e4c5-4f79-b2a1-0eb8a1aaccff	17:00:00	ST	-1	37	4	Autumn2020	BUS202	3528-MR Md. Mamunur Rashid	BC2011-S
e0dca1c3-dfde-4dce-8b5b-a03b716fb049	09:30:00	MW	-1	37	5	Autumn2020	BUS202	3534-DR Md. Abdus Salam Akanda	BC2011-S
b5e2b278-64d3-4468-9e7f-a1b5f5ca2ff2	09:30:00	ST	-1	37	6	Autumn2020	BUS202	3545-DR Mohammad Osman Gani	BC2013-S
548e5d3b-67a5-4b9d-9255-fdbb4a45ef30	14:00:00	ST	B-0	0	7	Autumn2020	BUS202	3579-MS Seeratus Sabah	BC2010-S
ea8022d0-8429-4ce7-bfda-4e452a95a1ba	15:30:00	MW	-1	37	8	Autumn2020	BUS202	3579-MS Seeratus Sabah	BC2010-S
cac01c57-bd0e-4d71-a580-27f7047b031e	09:30:00	ST	-1	46	1	Autumn2020	BUS360	3159-BAR Sarah Hassan	BC2014-S
49446d02-e678-4d37-8249-7c5c77646be2	15:30:00	MW	-1	45	2	Autumn2020	BUS360	3323-MS Qantara Khaleda Khan	BC2011-S
b01bf806-b81f-48f5-9a45-ef303856e6c3	09:30:00	MW	-1	45	3	Autumn2020	BUS360	3579-MS Seeratus Sabah	BC2012-S
9bea59c2-b20e-4ce4-b1e8-eae670051b8e	11:00:00	MW	-1	45	4	Autumn2020	BUS360	3579-MS Seeratus Sabah	BC2011-S
2e98362a-eb25-498f-940d-b9a4fff3b4db	12:30:00	ST	-1	45	5	Autumn2020	BUS360	3525-MS Afnan Ashfaque	BC2011-S
a620897c-553c-4dd0-95e2-44c62341e9b8	15:30:00	ST	-1	46	6	Autumn2020	BUS360	3358-MR Mr. Iftekhar Mahfuz	BC2010-S
c2d8f607-50eb-42a8-a87e-edf36cff48c8	08:00:00	ST	-1	45	7	Autumn2020	BUS360	3159-BAR Sarah Hassan	BC2012-S
5bd628d4-42b0-4bd0-ba19-8701d973e59d	14:00:00	ST	-1	47	1	Autumn2020	BUS485	3615-DR Md. Mamun Habib	BC2011-S
c8365a7c-fabb-4487-9a3c-31c289c07975	15:30:00	ST	-1	47	2	Autumn2020	BUS485	3615-DR Md. Mamun Habib	BC2011-S
e50026d4-5e69-4d3d-ae86-fdbacbb4aafc	14:00:00	MW	-1	45	3	Autumn2020	BUS485	3185-MR Mohammed Sohel Islam	BC2012-S
399151e4-da53-412e-9599-be5239580e7b	09:30:00	MW	-1	31	4	Autumn2020	BUS485	3135-DR Abul Bashar	BC2013-S
8d4a8827-2e56-4e70-b81c-d09981ddef4f	09:30:00	MW	-1	49	5	Autumn2020	BUS485	3376-MR Naheem Mahtab	BC2014-S
5ee9279c-36cb-4218-aac3-5a16187aa625	12:30:00	MW	-1	48	6	Autumn2020	BUS485	3372-DR Samiul Parvez Ahmed	BC2011-S
159c99ea-9c26-4d3c-9669-e6104f9c5135	14:00:00	MW	-1	18	1	Autumn2020	CHE101	5252-DR Sadia Nazneen Karobi	C4006-S
30b55fb8-ee8b-44e9-92db-fa8b02d15191	14:00:00	ST	B-0	0	2	Autumn2020	CHE101	5252-DR Sadia Nazneen Karobi	BC4014-S
fed4e30f-b8c7-46df-b93d-c65beb0d92ef	14:00:00	R	-1	19	1	Autumn2020	CHE101L	5231-MR Saquib Ahmad Khan	ESLAB-S
fa80cbd1-117c-4542-9f2b-8db60da0c1fd	15:30:00	R	B-0	0	2	Autumn2020	CHE101L	5231-MR Saquib Ahmad Khan	ESLAB-S
3a1ed843-be98-4ee4-9f9b-73e70fc74d0f	17:00:00	R	B-0	0	3	Autumn2020	CHE101L	5231-MR Saquib Ahmad Khan	ESLAB-S
9f6f49b5-8618-4066-af40-74cc959cda2c	08:00:00	ST	-1	30	1	Autumn2020	CHI101	2453-MR MMA Rahman Nahid	BC4010-S
96c61029-a8d7-4895-a4bc-89352512b006	09:30:00	ST	-1	29	1	Autumn2020	CIS101	4446-DR Yusuf Mahbubul Islam	BC4043-S
76c965bc-a09b-4b88-8f86-e81bcfdc9be9	12:30:00	ST	-1	29	2	Autumn2020	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
b197fced-61d2-4939-b71e-005777376fe6	14:00:00	ST	-1	30	3	Autumn2020	CIS101	4348-MR Md. Abu Sayed	BC4043-S
6e1060a0-a884-45c6-93eb-7cf101aeb45b	17:00:00	ST	-1	30	4	Autumn2020	CIS101	4374-MR Wahidul Hasan	BC4043-S
c5eaf6a6-5879-419c-8e57-c6e1ee0f7719	09:30:00	MW	-1	30	5	Autumn2020	CIS101	4331-MS Sabrina Alam	BC4043-S
fe8b10ce-53a0-404b-8f07-5b57c5c3276a	12:30:00	MW	-1	30	6	Autumn2020	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
28b5d969-9e97-4ada-a4d7-9acf0aeda830	14:00:00	MW	-1	31	7	Autumn2020	CIS101	4348-MR Md. Abu Sayed	BC4043-S
84198e5e-2a38-4a71-a25d-28dbd36c0f13	17:00:00	MW	-1	29	8	Autumn2020	CIS101	4297-MR M. Ishtiaque Rahman	BC4043-S
b522a4f3-1d7d-454f-a012-f2e151a84ea7	08:00:00	ST	-1	12	9	Autumn2020	CIS101	4280-MS Nujhat Nahar	CSCLab2-S
53638ecb-55c9-4d93-83f0-90842c88a4a6	08:00:00	MW	-1	14	10	Autumn2020	CIS101	4280-MS Nujhat Nahar	CSCLab2-S
9ec23f3e-f3b6-4277-b68d-5175b83ccfd9	08:00:00	ST	-1	23	11	Autumn2020	CIS101	4330-MR AKM Monzurul Islam	BC4043-S
39fcb291-5775-4c90-9a0c-0c99177aa9c3	08:00:00	MW	B-0	0	12	Autumn2020	CIS101	T001-00 TBA TBA	BC4043-S
118d6360-dee2-4cfd-a666-abb909c26643	11:00:00	S	0	29	1	Autumn2020	CIS101L	4446-DR Yusuf Mahbubul Islam	BC4043-S
cd47d527-5a30-4800-aa46-1eebd8f51dac	11:00:00	T	0	29	2	Autumn2020	CIS101L	4330-MR AKM Monzurul Islam	BC4043-S
f98bcb44-d432-4854-9aaf-abc72793b5c9	15:30:00	S	0	30	3	Autumn2020	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
8fa3f49e-6cc3-45ba-b660-a6f5d41e7a64	15:30:00	T	0	30	4	Autumn2020	CIS101L	4374-MR Wahidul Hasan	BC4043-S
10dc1408-5f3f-4048-980d-f2f443dde930	11:00:00	M	0	30	5	Autumn2020	CIS101L	4331-MS Sabrina Alam	BC4043-S
63b56efc-8652-499f-a5c4-6d5882b49783	11:00:00	W	0	30	6	Autumn2020	CIS101L	4330-MR AKM Monzurul Islam	BC4043-S
978ab4ff-9b91-4bb1-9bff-8e7380e5cc0b	15:30:00	M	0	31	7	Autumn2020	CIS101L	4348-MR Md. Abu Sayed	BC4043-S
30a0ed3b-d0ce-4aa5-a5f6-ded91b0a051b	15:30:00	W	0	29	8	Autumn2020	CIS101L	4297-MR M. Ishtiaque Rahman	BC4043-S
ed0d5ff2-f6f8-46ba-9c4c-5da3e4701f54	09:30:00	S	0	12	9	Autumn2020	CIS101L	4280-MS Nujhat Nahar	CSCLab2-S
f5afd137-c3a9-4057-a103-9151a4a88209	09:30:00	M	0	14	10	Autumn2020	CIS101L	4280-MS Nujhat Nahar	CSCLab2-S
b83b64d2-1e6c-40ac-9e04-78dae03b0ade	08:00:00	M	-1	25	11	Autumn2020	CIS101L	4330-MR AKM Monzurul Islam	CSCLab1-S
d83a4eb9-d705-4bfd-8f0e-a9833b365232	08:00:00	T	B-0	0	12	Autumn2020	CIS101L	T001-00 TBA TBA	CSCLab1-S
975399ee-a2b3-42e0-80c2-7983afdd8ded	11:00:00	MW	-1	26	1	Autumn2020	CMN201	2164-MR Mohammad Masud Chowdhury	BC4013-S
7176cee4-902c-4445-b08a-b34762f34103	15:30:00	ST	-1	22	2	Autumn2020	CMN201	2258-MS Tasneem Shahrukh	BC4013-S
470cf6b0-1c4b-4cf9-8ab8-93f4099746aa	15:30:00	MW	-1	25	3	Autumn2020	CMN201	2258-MS Tasneem Shahrukh	BC4010-S
dcf6603e-eff3-4424-8d5d-1536861ad501	08:00:00	MW	-1	15	4	Autumn2020	CMN201	2171-MS Fariya Hossain Khan	BC4010-S
717f65f3-9456-498a-a921-bda19296a3ef	12:30:00	ST	-1	26	5	Autumn2020	CMN201	2171-MS Fariya Hossain Khan	BC4011-S
1d2d9296-cccc-4631-a878-ed80a0bec6ad	15:30:00	ST	-1	27	6	Autumn2020	CMN201	2213-MS Jessica Tartila Suma	BC4014-S
372c55bb-c1cc-484b-9410-f4bfcfa810ec	11:00:00	ST	-1	27	7	Autumn2020	CMN201	2270-MS Raisa Rasheeka	C3004-S
d1e8b11d-a003-442a-be38-fdb34934b393	14:00:00	ST	-1	24	8	Autumn2020	CMN201	2382-MS Raiyana Rahman	BC7025-S
8adef0b4-93eb-4889-a440-14a1ce6a1d1d	09:30:00	MW	-1	27	9	Autumn2020	CMN201	2382-MS Raiyana Rahman	C4005-S
d9d88411-eb94-429d-a4db-a0ab5b518b97	08:00:00	MW	-1	19	10	Autumn2020	CMN201	2393-MS Janina Islam Abir	BC4011-S
6ffae661-7714-49f0-8355-3136d834dbcd	17:00:00	ST	-1	26	11	Autumn2020	CMN201	2441-MS Refat Ara Jerin	BC4012-S
1a143695-f74e-48e5-a9e8-806d88761493	15:30:00	MW	-1	27	12	Autumn2020	CMN201	2441-MS Refat Ara Jerin	BC4011-S
27737615-5fb2-4c52-834e-15f1b3b9f691	17:00:00	MW	-1	4	13	Autumn2020	CMN201	2442-MS Mushfeqa Islam	BC4010-S
2d88cd80-e2a8-4a3f-8da8-3bfe6a74c9ad	09:30:00	ST	-1	12	1	Autumn2020	CMN202	2171-MS Fariya Hossain Khan	C2006-S
ef7d3660-186f-4515-bfd4-81dedfa8d664	11:00:00	ST	-1	15	2	Autumn2020	CMN202	2382-MS Raiyana Rahman	C2002-S
fb2503c4-8d1b-460e-99db-3dd335159c74	11:00:00	MW	-1	12	3	Autumn2020	CMN202	2382-MS Raiyana Rahman	C6002-S
a00aaa80-bc23-4218-b8be-cb8f05467c3e	11:00:00	MW	-1	33	1	Autumn2020	CMN203	2258-MS Tasneem Shahrukh	BC4010-S
f14e4727-7642-4797-a5fc-37324abb24b2	09:30:00	MW	-1	23	1	Autumn2020	CMN205	2164-MR Mohammad Masud Chowdhury	C2002-S
04d65360-7611-4714-9d97-c76053b26412	14:00:00	MW	-1	19	1	Autumn2020	CMN207	2382-MS Raiyana Rahman	BC4014-S
061ca639-d622-4995-9bdf-cf5ef3c2b115	15:30:00	ST	-1	15	2	Autumn2020	CMN207	2442-MS Mushfeqa Islam	BC8013-S
deb1d48a-d9c5-446b-810f-a5527200048f	09:30:00	ST	-1	14	1	Autumn2020	CMN301	2213-MS Jessica Tartila Suma	C2007-S
64739b4e-fb74-47ef-a9da-417ebe18d898	14:00:00	MW	-1	19	1	Autumn2020	CMN302	2178-DR G. M. Shahidul Alam	BC8014-S
78327321-a371-48cc-9b1d-8f4bc4f1c370	15:30:00	ST	-1	25	1	Autumn2020	CMN303	2441-MS Refat Ara Jerin	BC8014-S
81b6049f-4d0d-44da-a259-384da5069262	12:30:00	ST	-1	30	1	Autumn2020	CMN305	2270-MS Raisa Rasheeka	BC4012-S
6361bf5d-7e07-4973-911c-ee591298332e	17:00:00	MW	-1	11	1	Autumn2020	CMN306	2299-MS Naila Azad Nupur	BC8013-S
dca0fb04-9bc7-473c-9977-c88dc9d5cd72	14:00:00	ST	-1	13	1	Autumn2020	CMN308	2350-MR Syeed Zayadul Ahsan	BC7026-S
01e948c9-06dc-426c-bf37-ed828478f2e7	14:00:00	MW	-1	14	1	Autumn2020	CMN313	2441-MS Refat Ara Jerin	BC8013-S
29f434ac-d50d-42b8-8a25-b4c640c87305	09:30:00	MW	-1	2	1	Autumn2020	CMN314	2368-MR Al Kamal Md. Ziaul Haq	C4006-S
0b54bd2f-654e-4f96-9551-f181605c9ca3	09:30:00	MW	-1	4	1	Autumn2020	CMN318	2213-MS Jessica Tartila Suma	C2003-S
f352fb2a-ab88-47b1-9465-c02c9b7b9c4d	14:00:00	MW	-1	23	1	Autumn2020	CMN323	2442-MS Mushfeqa Islam	C2002-S
623e401a-f3df-4ca1-90a3-8d12b7a5dd61	12:30:00	MW	-1	16	1	Autumn2020	CMN325	2171-MS Fariya Hossain Khan	BC4011-S
bc6aa395-5f9b-4d36-bc83-d2af3b8dfb95	12:30:00	MW	-1	19	1	Autumn2020	CMN403	2270-MS Raisa Rasheeka	BC4012-S
76b13f0e-bba8-4cce-ba51-3b3c14d383aa	11:00:00	MW	-1	33	1	Autumn2020	CMN407	2393-MS Janina Islam Abir	BC8014-S
9931d9c2-4e3a-4655-9961-327ceba78d99	17:00:00	ST	-1	9	1	Autumn2020	CMN412	2308-MR Syed Ali Haider Rizvi	C2002-S
a100edf8-e7be-4d62-8af4-4b9babf76346	11:00:00	ST	-1	8	1	Autumn2020	CMN414	2164-MR Mohammad Masud Chowdhury	C3005-S
675ea8e3-7513-41e5-93e4-cda2c924f36f	11:00:00	ST	-1	10	1	Autumn2020	CMN420	2154-MR Philip Gain	C2006-S
c3f8dd1f-30a4-4dc9-b888-7d6666f6a097	12:30:00	MW	-1	9	1	Autumn2020	CMN421	2178-DR G. M. Shahidul Alam	BC4013-S
caa90180-da6c-4feb-af82-a61425a8c78d	11:00:00	ST	-1	27	1	Autumn2020	CMN422	2258-MS Tasneem Shahrukh	C2003-S
ca0de9d3-0d58-4e36-b8e5-c947d99af1cd	09:30:00	ST	-1	12	1	Autumn2020	CMN429	2164-MR Mohammad Masud Chowdhury	C3002-S
3166e572-78c9-488b-a00a-349b0e659309	15:30:00	A	-1	11	1	Autumn2020	CMN498	2393-MS Janina Islam Abir	BCTBA1-S
7825add7-4112-4c28-86ac-52173abf2bcf	14:00:00	A	-1	4	1	Autumn2020	CMN499	2270-MS Raisa Rasheeka	BCTBA2-S
6233a765-2f82-44e1-9e87-b967972380b3	09:30:00	ST	-1	31	1	Autumn2020	CSC101	4241-DR Md. Ashraful Amin	CSCLab4-S
b3f84532-1be9-40c6-a284-633eb01f2cd1	12:30:00	ST	-1	30	2	Autumn2020	CSC101	4376-MR Sanzar Adnan Alam	GPLab-S
a431e4b4-5962-4e0d-8181-2f82ce0af434	14:00:00	ST	-1	35	3	Autumn2020	CSC101	4416-MR Md. Fahad Monir	GPLab-S
d411b7c8-32a8-45e0-be85-3ec8516cbc90	17:00:00	ST	-1	34	4	Autumn2020	CSC101	4416-MR Md. Fahad Monir	GPLab-S
a8d98a5b-e604-4ce5-80ac-245f397249ca	14:00:00	MW	-1	32	5	Autumn2020	CSC101	4241-DR Md. Ashraful Amin	CSCLab1-S
dc9acf30-59b0-414e-a48d-58182ff00dae	17:00:00	MW	-1	33	6	Autumn2020	CSC101	4416-MR Md. Fahad Monir	CSCLab1-S
662e51a9-d13f-4083-9589-2ce6eb365056	14:00:00	MW	-1	33	7	Autumn2020	CSC101	4416-MR Md. Fahad Monir	GPLab-S
8bf33e86-0ab5-4e3d-9ddc-8572fe352e71	17:00:00	MW	-1	35	8	Autumn2020	CSC101	4376-MR Sanzar Adnan Alam	GPLab-S
a4fb1ff7-dfd7-4e5f-89dc-ad1e0dfd27e7	08:00:00	ST	B-0	0	9	Autumn2020	CSC101	T001-00 TBA TBA	FT-S
fa5b59bb-7d97-47c9-afcb-adfb1d6c32f2	08:00:00	MW	B-0	0	10	Autumn2020	CSC101	T001-00 TBA TBA	FT-S
f7503e7c-973c-414c-b2dc-0f9907a95565	11:00:00	S	0	30	1	Autumn2020	CSC101L	4241-DR Md. Ashraful Amin	CSCLab4-S
2e131118-60c2-407f-a03e-e7ef4d0b68af	14:00:00	T	0	30	2	Autumn2020	CSC101L	4376-MR Sanzar Adnan Alam	CSCLab3-S
d76034bc-88e7-4559-aefc-e192fd9c51f1	15:30:00	S	0	35	3	Autumn2020	CSC101L	4416-MR Md. Fahad Monir	GPLab-S
0a1d3441-b418-4ad8-b50f-ae2c5acab701	15:30:00	T	0	34	4	Autumn2020	CSC101L	4416-MR Md. Fahad Monir	GPLab-S
754efcf4-d870-4c8a-be32-17c96df05758	15:30:00	M	-1	32	5	Autumn2020	CSC101L	4241-DR Md. Ashraful Amin	CSCLab1-S
ff07e8c5-b7b0-48b4-bf3e-79d5b769de94	15:30:00	W	0	33	6	Autumn2020	CSC101L	4416-MR Md. Fahad Monir	CSCLab1-S
87b2d637-57c4-431c-bca2-ac281e3032d2	15:30:00	M	0	33	7	Autumn2020	CSC101L	4416-MR Md. Fahad Monir	GPLab-S
c892f434-9344-4b0d-89a2-7f64edafa612	15:30:00	W	0	35	8	Autumn2020	CSC101L	4376-MR Sanzar Adnan Alam	GPLab-S
e981fe8a-d131-4694-9075-ad951dbcaf6c	09:30:00	S	B-0	0	9	Autumn2020	CSC101L	T001-00 TBA TBA	FT-S
95f009d9-d7de-48f7-b160-31fd8767139a	09:30:00	M	B-0	0	10	Autumn2020	CSC101L	T001-00 TBA TBA	FT-S
425f2402-9ea5-4ba6-9dc2-aed1bc877289	08:00:00	ST	-1	25	1	Autumn2020	CSC121	4450-MS Farzana Bente Alam	CSCLab3-S
81b73b5c-840a-4154-bf8e-6034fa7e000b	09:30:00	S	0	25	1	Autumn2020	CSC121L	4450-MS Farzana Bente Alam	CSCLab3-S
7bc94a2f-38df-4039-b37c-b7e94102031e	08:00:00	ST	-1	38	1	Autumn2020	CSC301	4447-PROF A. R. Azimul Hoque	BC6008-S
789aba02-4709-4b86-9060-15176c7dca16	08:00:00	MW	-1	42	2	Autumn2020	CSC301	4362-MR Bijoy Rahman Arif	BC6012-S
1cd4ea20-23a3-4214-a198-8d38d8840ea1	18:30:00	T	-1	29	3	Autumn2020	CSC301	4241-DR Md. Ashraful Amin	BC6008-S
b3c99490-77ce-4bbb-844b-2c040bbe628e	18:30:00	T	-1	7	1	Autumn2020	CSC471	3620-DR Zoha Rahman	BC6007-S
6d6ba329-5d4d-40b8-b52a-4a0cf3b5e1cc	09:30:00	ST	B-0	0	1	Autumn2020	CSE104	4427-MR Rubayed Mehedi	C2002-S
5548d21d-5799-462d-86e6-29ad6d61bde7	11:00:00	ST	-1	32	2	Autumn2020	CSE104	4409-MS Ajmiri Sabrina Khan	BC10018-S
c4d0923c-104b-4a5a-98fd-e4ce77b2f57d	09:30:00	MW	-1	34	3	Autumn2020	CSE104	4409-MS Ajmiri Sabrina Khan	BC4013-S
7b1c214f-76d4-4e61-990f-964a9b0e8e9e	08:00:00	MW	B-0	0	4	Autumn2020	CSE104	T001-00 TBA TBA	BC6009-S
68ea4917-1a67-4490-b247-78e58de39d85	08:00:00	S	-1	18	1	Autumn2020	CSE104L	4406-MR Mohammad Rejwan Uddin	CENLAB-S
f9d0c842-5649-4c6d-b8b9-946d25e2285d	09:30:00	S	-1	34	2	Autumn2020	CSE104L	4409-MS Ajmiri Sabrina Khan	CENLAB-S
1d5fbd0d-68e1-4494-a946-1249277db827	08:00:00	M	-1	33	3	Autumn2020	CSE104L	4409-MS Ajmiri Sabrina Khan	CENLAB-S
dd068198-4b93-41a2-bde7-97a2be932f80	09:30:00	M	B-0	0	4	Autumn2020	CSE104L	4427-MR Rubayed Mehedi	CENLAB-S
38c3ed48-df93-4a54-a9fd-2b98490a2ad8	14:00:00	T	B-0	0	5	Autumn2020	CSE104L	4273-MR Sarwar Shahidi	CENLAB-S
ce22117f-615e-4343-93e6-1da14c25a16f	09:30:00	ST	-1	34	1	Autumn2020	CSE201	4228-DR Habib Bin Muzaffar	C2003-S
f639557d-f3d0-41a1-a598-ab1d96447397	11:00:00	ST	-1	33	2	Autumn2020	CSE201	4362-MR Bijoy Rahman Arif	BC9017-S
f0eeaa67-0caa-493e-9d29-9f50260d1f5b	09:30:00	MW	-1	35	3	Autumn2020	CSE201	4434-MS Sadita Ahmed	BC4014-S
ac9c2b1a-295c-4136-882d-c77bb83697cc	11:00:00	MW	-1	35	4	Autumn2020	CSE201	4434-MS Sadita Ahmed	BC10018-S
051a90ee-efe5-47a0-a456-001c195d4b5d	09:30:00	ST	-1	34	1	Autumn2020	CSE203	4401-MR AKM Mahbubur Rahman	CSCLab1-S
bc6b141c-5830-42dd-9bef-2919371b117d	12:30:00	ST	-1	31	2	Autumn2020	CSE203	4449-MR Sheikh Abujar	CSCLab1-S
9eaae974-fa1c-49e4-b12d-cc3c1b5bbd49	09:30:00	MW	-1	32	3	Autumn2020	CSE203	4449-MR Sheikh Abujar	CSCLab1-S
c5da26cd-6245-40d6-b199-4cea405e4013	12:30:00	MW	-1	26	4	Autumn2020	CSE203	4448-DR Farzana Rahman	CSCLab1-S
cab98cba-a95d-493b-bfc9-edd25dcf820e	11:00:00	ST	B-0	0	5	Autumn2020	CSE203	4301-MR Ahmed Adeeb Sultan	GPLab-S
2e25cfe7-83d5-45bc-b478-a9d4d1e1c1e2	09:30:00	MW	-1	31	6	Autumn2020	CSE203	4448-DR Farzana Rahman	GPLab-S
67199699-e0f6-4284-8d75-e7a3550bcb17	11:00:00	S	-1	34	1	Autumn2020	CSE203L	4401-MR AKM Mahbubur Rahman	CSCLab1-S
78b2c713-61e0-4b49-828f-bcb94f4018c6	11:00:00	T	0	31	2	Autumn2020	CSE203L	4449-MR Sheikh Abujar	CSCLab1-S
b40de3a2-c941-4057-9e16-a1df3c91e738	11:00:00	M	0	32	3	Autumn2020	CSE203L	4449-MR Sheikh Abujar	CSCLab1-S
0767526c-5019-4da1-8f5f-f15c49b8c983	11:00:00	W	0	26	4	Autumn2020	CSE203L	4448-DR Farzana Rahman	CSCLab1-S
2404daaf-fee2-4fc7-b1a5-44d43a9cd605	09:30:00	T	B-0	0	5	Autumn2020	CSE203L	4301-MR Ahmed Adeeb Sultan	GPLab-S
5ae51170-8b5b-4576-9932-7426f3702999	11:00:00	M	0	31	6	Autumn2020	CSE203L	4448-DR Farzana Rahman	GPLab-S
f0236157-9bb9-4d40-b47b-8d63106b8e3d	12:30:00	ST	-1	26	1	Autumn2020	CSE204	4251-MR Md. Raihan Bin Rafique	BC5014-S
106ca56d-8ba6-4073-bc12-11c6ee89bde2	12:30:00	MW	B-0	0	2	Autumn2020	CSE204	T001-00 TBA TBA	BC6007-S
f4f2930e-7f63-4ef9-9dfc-53f77dd365b2	14:00:00	ST	-1	19	3	Autumn2020	CSE204	4251-MR Md. Raihan Bin Rafique	BC6007-S
16141b7e-8eff-4536-b66b-7f1f3d348c44	14:00:00	MW	-1	14	4	Autumn2020	CSE204	4251-MR Md. Raihan Bin Rafique	BC6008-S
e888f4be-1094-43e3-a9b1-09044d6e028d	11:00:00	S	0	26	1	Autumn2020	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
dafab76d-121e-4088-8734-d54666460b8e	11:00:00	M	B-0	0	2	Autumn2020	CSE204L	T001-00 TBA TBA	CENLAB-S
c4079b2e-84e3-4322-ba66-a418b3987740	12:30:00	W	0	19	3	Autumn2020	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
794e6696-8b1b-40be-9a3c-d5d0ddacb5b4	12:30:00	M	0	14	4	Autumn2020	CSE204L	4251-MR Md. Raihan Bin Rafique	CENLAB-S
4ac3956b-cfed-47e4-9e6f-6a64b67ab77c	09:30:00	ST	-1	21	1	Autumn2020	CSE210	4406-MR Mohammad Rejwan Uddin	BC6012-S
18e4070f-00ae-48d8-b716-4ee404b7821d	11:00:00	MW	B-0	0	2	Autumn2020	CSE210	T001-00 TBA TBA	BC6008-S
d4968b07-76e6-4158-b0dc-59f5c482bebb	14:00:00	ST	-1	42	3	Autumn2020	CSE210	4285-DR Ferdows Zahid	BC6008-S
876be868-0339-406a-8208-0de98ed10f7a	08:00:00	T	-1	20	1	Autumn2020	CSE210L	4435-MR Shahed Alam	CENLAB-S
f92e8025-c227-4791-8770-30a6702f7dc0	09:30:00	W	B-0	0	2	Autumn2020	CSE210L	4301-MR Ahmed Adeeb Sultan	CENLAB-S
b3e3e23c-bf0a-48c3-9f70-9de38406efde	12:30:00	T	-1	30	3	Autumn2020	CSE210L	4435-MR Shahed Alam	CENLAB-S
f9ae0219-60cd-4108-b6de-6606faf9aa75	11:00:00	T	-1	13	4	Autumn2020	CSE210L	4406-MR Mohammad Rejwan Uddin	CENLAB-S
5d1a1b10-1363-466e-9af0-758b8a271d20	11:00:00	ST	-1	27	1	Autumn2020	CSE211	4408-MR Asif Bin Khaled	CSCLab3-S
523f6804-c855-464c-96d2-cdb620a97b63	11:00:00	MW	-1	22	2	Autumn2020	CSE211	4408-MR Asif Bin Khaled	CSCLab3-S
32a7c31e-4b8e-4ed3-bd2d-e16c801175d0	12:30:00	ST	-1	29	3	Autumn2020	CSE211	4408-MR Asif Bin Khaled	CSCLab2-S
26f21736-b80e-424f-b05f-3d9673dcd0ad	12:30:00	MW	-1	20	4	Autumn2020	CSE211	4408-MR Asif Bin Khaled	CSCLab2-S
5f0ff8f6-6aaf-49c3-a174-39589c06b221	09:30:00	T	0	27	1	Autumn2020	CSE211L	4408-MR Asif Bin Khaled	CSCLab3-S
d2e3d020-a346-4136-9239-851a37534ed1	09:30:00	W	0	22	2	Autumn2020	CSE211L	4408-MR Asif Bin Khaled	CSCLab3-S
35debbde-f611-4f55-94cd-c4b2b39c7acf	14:00:00	S	0	29	3	Autumn2020	CSE211L	4408-MR Asif Bin Khaled	CSCLab2-S
35327993-ea5c-4e9c-a9ed-d886c8c1801a	14:00:00	M	-1	20	4	Autumn2020	CSE211L	4408-MR Asif Bin Khaled	CSCLab2-S
d9950f99-bccf-4463-be7c-a5745d928617	11:00:00	ST	-1	31	1	Autumn2020	CSE213	4161-MR Subrata Kumar Dey	CSCLab2-S
9739d361-96fd-4982-be06-a46f4b543e5e	11:00:00	MW	-1	34	2	Autumn2020	CSE213	4161-MR Subrata Kumar Dey	CSCLab2-S
7e4c0702-601b-4207-8860-97c03a7f9091	15:30:00	ST	-1	33	3	Autumn2020	CSE213	4161-MR Subrata Kumar Dey	CSCLab2-S
de99ff7c-b111-4a48-b287-ff0e2c7b3c42	08:00:00	ST	-1	35	4	Autumn2020	CSE213	4161-MR Subrata Kumar Dey	GPLab-S
41c18621-b7cc-420d-8003-97721aa7c40e	09:30:00	T	0	31	1	Autumn2020	CSE213L	4161-MR Subrata Kumar Dey	CSCLab2-S
31594058-7b00-4bed-8410-9c3aa0e0be59	09:30:00	W	0	34	2	Autumn2020	CSE213L	4161-MR Subrata Kumar Dey	CSCLab2-S
52722a3c-6a0f-432e-93fb-a737460c325f	14:00:00	T	0	33	3	Autumn2020	CSE213L	4161-MR Subrata Kumar Dey	CSCLab2-S
e9094fec-da66-4527-a8a7-97b5db3d0bfc	09:30:00	S	0	35	4	Autumn2020	CSE213L	4161-MR Subrata Kumar Dey	GPLab-S
837dd953-b0e4-4a4f-8f84-b0554f5ab6e3	12:30:00	ST	-1	16	1	Autumn2020	CSE214	4137-MR Mohammad Noor Nabi	BC9014-S
8a0807a6-7461-439e-b4e8-9b12772f12ea	12:30:00	MW	-1	29	2	Autumn2020	CSE214	4137-MR Mohammad Noor Nabi	BC9014-S
7ad50294-0017-4439-9189-6204b114ef8c	14:00:00	MW	-1	17	3	Autumn2020	CSE214	4137-MR Mohammad Noor Nabi	BC9017-S
be5399df-17ea-4762-8b24-45b75b699f24	11:00:00	ST	-1	33	1	Autumn2020	CSE216	4242-MR Prof. Farruk Ahmed	C2005-S
0fa0d831-4e93-4ee0-bb87-d6816ea50525	11:00:00	MW	-1	35	2	Autumn2020	CSE216	4242-MR Prof. Farruk Ahmed	C2005-S
21a843c5-92f7-47d8-9754-215b40a708c9	09:30:00	T	-1	34	1	Autumn2020	CSE216L	4435-MR Shahed Alam	CENLAB-S
a0bfe3fc-0a4b-45f9-b6fb-db7e9be8de36	08:00:00	W	0	35	2	Autumn2020	CSE216L	4435-MR Shahed Alam	CENLAB-S
b1a40cf8-bbca-46f7-8c53-8bb05f26e265	14:00:00	ST	-1	31	1	Autumn2020	CSE303	4184-DR Mahady Hasan	CSCLab1-S
6b23cff8-79b9-4e37-abb3-c349e960e0df	17:00:00	ST	-1	27	2	Autumn2020	CSE303	4434-MS Sadita Ahmed	CSCLab1-S
f608c317-e6bd-4344-9ba5-305527005646	12:30:00	MW	-1	21	3	Autumn2020	CSE303	4348-MR Md. Abu Sayed	GPLab-S
be1d1d09-3fdc-4a45-8b46-553b9b52fc85	15:30:00	S	0	31	1	Autumn2020	CSE303L	4184-DR Mahady Hasan	CSCLab1-S
357bfd96-fd32-4eae-af9a-70e133a24ab5	15:30:00	T	0	27	2	Autumn2020	CSE303L	4434-MS Sadita Ahmed	CSCLab1-S
bab7bd83-8a61-477d-aaa1-b0151240a5fd	11:00:00	W	0	21	3	Autumn2020	CSE303L	4348-MR Md. Abu Sayed	GPLab-S
2e778f03-4214-4c9b-b3db-4d5be4363725	08:00:00	ST	-1	41	1	Autumn2020	CSE307	4331-MS Sabrina Alam	BC6009-S
e9a41cf7-8688-45ea-a6cc-1135055b49ac	08:00:00	MW	-1	36	2	Autumn2020	CSE307	4331-MS Sabrina Alam	BC6013-S
4a24b2b0-fcb2-420c-9439-d5b9fbc0cedb	08:00:00	ST	-1	29	1	Autumn2020	CSE309	4349-MS Shama Hoque	CSCLab4-S
28fae514-1713-4a8a-8bb8-a9b4d8374652	08:00:00	MW	-1	31	2	Autumn2020	CSE309	4349-MS Shama Hoque	GPLab-S
d6fc3597-4cfb-4e82-93d2-f1fc136f3878	15:30:00	ST	-1	19	1	Autumn2020	CSE310	4285-DR Ferdows Zahid	BC6009-S
c8a1f13a-6210-4219-a74d-913fff02b61d	15:30:00	MW	-1	22	2	Autumn2020	CSE310	4285-DR Ferdows Zahid	BC6008-S
43d869c8-0dc6-42fd-ba50-64641527b4f2	14:00:00	S	-1	22	1	Autumn2020	CSE310L	4406-MR Mohammad Rejwan Uddin	CENLAB-S
e29e8d91-fe19-4be0-b4d9-17bc5c46d9de	14:00:00	M	-1	27	2	Autumn2020	CSE310L	4406-MR Mohammad Rejwan Uddin	CENLAB-S
7b45459e-6646-42c0-b977-35dcee97eb62	15:30:00	S	B-0	0	3	Autumn2020	CSE310L	4427-MR Rubayed Mehedi	CENLAB-S
0be0a581-b887-42fa-9289-082b6d5ca922	15:30:00	MW	-1	42	1	Autumn2020	CSE313	4362-MR Bijoy Rahman Arif	CSCLab3-S
c1ec9dc1-8a93-45c6-bb9b-98c68eceaa66	17:00:00	ST	-1	42	2	Autumn2020	CSE313	4362-MR Bijoy Rahman Arif	CSCLab3-S
51bc3612-3c8d-4469-9f61-f92583ecefc8	15:30:00	ST	-1	41	1	Autumn2020	CSE315	4137-MR Mohammad Noor Nabi	CSCLab3-S
18b788ec-680e-4d5a-823a-1cdb390daef4	17:00:00	MW	-1	41	2	Autumn2020	CSE315	4137-MR Mohammad Noor Nabi	CSCLab3-S
59c78337-4f4a-4267-a490-d4b3185f1123	12:30:00	ST	-1	35	1	Autumn2020	CSE316	4383-DR Faisal Uddin	BC9017-S
b6432057-df4d-4dbd-b452-9d2d38a4ce38	12:30:00	MW	-1	38	2	Autumn2020	CSE316	4382-DR Tarem Ahmed	BC9017-S
4a4cf72e-2fd0-41a4-beb7-efdeb0c6ced7	14:00:00	ST	-1	33	3	Autumn2020	CSE316	4383-DR Faisal Uddin	BC8014-S
eea1350d-bffa-4869-b282-35fec0b8b9dd	14:00:00	MW	B-0	0	4	Autumn2020	CSE316	4383-DR Faisal Uddin	C2004-S
dee5cb68-9622-43cc-b0fa-85a629f8fb4e	14:00:00	S	0	35	1	Autumn2020	CSE316L	4382-DR Tarem Ahmed	CSCLab3-S
55c1524f-3ff1-46dd-90bc-9e0c800889c1	14:00:00	M	0	38	2	Autumn2020	CSE316L	4382-DR Tarem Ahmed	CSCLab3-S
343a1340-2d93-4143-a1e6-9dcb100f4c16	12:30:00	S	0	33	3	Autumn2020	CSE316L	4382-DR Tarem Ahmed	CSCLab3-S
646a08cb-07d5-4cd7-b5cb-d34833ae22c1	12:30:00	M	B-0	0	4	Autumn2020	CSE316L	4383-DR Faisal Uddin	CSCLab3-S
5f92b152-b5aa-48ad-a648-9e4e815f1e06	15:30:00	ST	-1	28	1	Autumn2020	CSE317	4401-MR AKM Mahbubur Rahman	BC6012-S
f0162364-f566-4c4d-a795-88989a63aa7a	15:30:00	MW	-1	32	2	Autumn2020	CSE317	4375-MR Mustafa Nizamul Aziz	BC6009-S
780a0962-7d03-4914-ad09-2bc11695e671	08:00:00	MW	-1	27	3	Autumn2020	CSE317	4447-PROF A. R. Azimul Hoque	CSCLab3-S
366a0801-18cf-4ad8-8e58-88ef181584b6	17:00:00	T	-1	28	1	Autumn2020	CSE317L	4401-MR AKM Mahbubur Rahman	CSCLab2-S
3bfbc825-7c3d-4024-9753-ca3f0f26c17f	14:00:00	W	0	32	2	Autumn2020	CSE317L	4375-MR Mustafa Nizamul Aziz	CSCLab3-S
56c7191d-c198-4a05-8012-053cea064aab	09:30:00	M	0	27	3	Autumn2020	CSE317L	4447-PROF A. R. Azimul Hoque	CSCLab3-S
8585d706-a47e-4edd-8f89-1107eaec98c4	18:30:00	M	-1	35	1	Autumn2020	CSE406	4432-DR Al-Sakib Khan Pathan	BC5012-S
a9918976-4556-4b6e-8b26-cdb8b8e8c524	18:30:00	S	-1	38	1	Autumn2020	CSE417	4389-MR Mohammad Shibli Kaysar	BC5012-S
a52e0d65-1bd3-476d-98b7-8778f6f3ac6d	18:30:00	W	-1	11	1	Autumn2020	CSE420	4241-DR Md. Ashraful Amin	BC6013-S
28be2cd9-da5b-4927-932d-1f6c049cd1d1	18:30:00	M	-1	5	1	Autumn2020	CSE421	4336-DR Amin Ahsan Ali	BC5013-S
bfc710f6-5bb8-485e-89e5-be0ab91b573d	18:30:00	T	B-0	0	1	Autumn2020	CSE425	T001-00 TBA TBA	BC5013-S
7b0c99cf-80a2-4692-8999-16fb54052b34	18:30:00	W	B-0	0	1	Autumn2020	CSE426	T001-00 TBA TBA	BC5013-S
49efc672-46c8-4c54-8b18-b09076e8d63a	18:30:00	S	-1	43	1	Autumn2020	CSE451	4280-MS Nujhat Nahar	BC6007-S
969a119b-b054-433e-a1a0-cd43de493305	18:30:00	W	-1	29	1	Autumn2020	CSE464	4376-MR Sanzar Adnan Alam	BC6007-S
302fb6c3-dde2-4a8d-b0fd-76239625b045	12:30:00	MW	-1	29	1	Autumn2020	CSE478	4360-MR Mohammad Nasfikur Rahman Khan	BC6009-S
0922bfc7-cf63-4db2-b618-2c776e12cb19	18:30:00	F	0	0	1	Autumn2020	CSE498	4184-DR Mahady Hasan	BC001-S
64758bb8-d19b-4575-b66e-ac4d226ed1a7	08:00:00	F	0	5	2	Autumn2020	CSE498	4242-MR Prof. Farruk Ahmed	BC001-S
db5b81c5-eb45-445d-8f54-4717c85f3acd	09:30:00	F	0	0	3	Autumn2020	CSE498	4241-DR Md. Ashraful Amin	BC001-S
5f00bc64-a1cb-423d-974e-1575a561dbae	11:00:00	F	0	0	4	Autumn2020	CSE498	4285-DR Ferdows Zahid	BC001-S
7eef648f-371b-4ce1-9b9c-f78a662b0f86	12:30:00	F	0	0	5	Autumn2020	CSE498	4382-DR Tarem Ahmed	BC001-S
a4400d3b-afe8-47c6-a72c-aa9100d82cf6	14:00:00	F	0	0	6	Autumn2020	CSE498	4336-DR Amin Ahsan Ali	BC001-S
7665f871-cd45-47fd-80d4-7c92a7196bc8	15:30:00	F	0	0	7	Autumn2020	CSE498	4383-DR Faisal Uddin	BC001-S
e7b3da48-1248-4f3a-ba25-7730aaf70238	17:00:00	F	0	3	8	Autumn2020	CSE498	4401-MR AKM Mahbubur Rahman	BC001-S
0f31c2f7-03e2-4517-a289-dcba149fa57c	08:00:00	A	-1	7	1	Autumn2020	CSE499	4137-MR Mohammad Noor Nabi	A4L04-S
d68b1bda-92f2-480c-b18a-3fb8c712463d	09:30:00	A	-1	3	2	Autumn2020	CSE499	4161-MR Subrata Kumar Dey	A4L04-S
f9f1ec0b-6920-4fa5-b7cf-34cf63f821e5	11:00:00	A	-1	4	3	Autumn2020	CSE499	4331-MS Sabrina Alam	A4L04-S
617afba9-4971-4b27-93ca-7cdbbc161c84	12:30:00	A	-1	5	4	Autumn2020	CSE499	4362-MR Bijoy Rahman Arif	A4L04-S
a7f36bf4-eefe-45e7-b565-d8f382b5ce6e	14:00:00	A	-1	5	5	Autumn2020	CSE499	4348-MR Md. Abu Sayed	A4L04-S
ea46ca73-bdc7-46e4-bbdd-2b5032480f6c	15:30:00	A	B-0	0	6	Autumn2020	CSE499	4372-MS Radiah Haque	A4L04-S
b34f81b0-c3d7-4071-982d-6261ba2a8459	17:00:00	A	B-0	0	7	Autumn2020	CSE499	4397-MR Mohammad Motiur Rahman	A4L04-S
8e55058a-0b23-4072-b229-4bc7240b5207	18:30:00	A	B-0	0	8	Autumn2020	CSE499	4373-MS Romasa Qasim	A4L04-S
f894629a-7887-4dd7-a1a2-3020101f3952	20:00:00	A	-1	6	9	Autumn2020	CSE499	4376-MR Sanzar Adnan Alam	A4L04-S
57bd0b2c-894b-421e-8653-9fece74687a1	18:30:00	R	-1	6	10	Autumn2020	CSE499	4416-MR Md. Fahad Monir	BC001-S
9fe3b002-8516-4b49-b954-7679d875587d	20:00:00	R	-1	4	11	Autumn2020	CSE499	4408-MR Asif Bin Khaled	BC001-S
190a2182-491f-4b56-a23b-62d9cc3b7ed2	08:00:00	R	-1	6	12	Autumn2020	CSE499	4409-MS Ajmiri Sabrina Khan	BC001-S
b264eff4-b522-4e73-b8fc-7dc76840d36e	09:30:00	ST	-1	35	1	Autumn2020	ECN200	3491-MS Nuren Nirvana Brishti	BC4012-S
90d7e165-7555-4af2-ba2d-53d785f50251	17:00:00	ST	-1	35	2	Autumn2020	ECN200	3489-MS Fahmida Islam	BC8013-S
9ac762b4-1630-4d56-b462-e6c9d0919889	08:00:00	MW	-1	29	3	Autumn2020	ECN200	3490-MS Nuzhat Sharmeen	BC3008-S
67cfe689-b09c-4690-9253-8eabd63440ca	08:00:00	ST	-1	38	1	Autumn2020	ECN201	3463-MR Md. Kamrul Islam	BC7015-S
d8188a63-1042-4548-9418-9e2a0b365f34	09:30:00	ST	-1	30	2	Autumn2020	ECN201	3298-Mr. Shamil M Al-Islam	BC4013-S
7c10857b-a7e8-418c-9e2c-e7e0e43c837c	11:00:00	ST	-1	39	3	Autumn2020	ECN201	3467-MS Nabila Maruf	BC3012-S
f9f77676-1fb6-4a78-97c5-a9de56770707	12:30:00	ST	-1	36	4	Autumn2020	ECN201	3463-MR Md. Kamrul Islam	BC8011-S
3801e758-7d8a-4963-b32f-873f350efb31	14:00:00	ST	B-0	0	5	Autumn2020	ECN201	T001-00 TBA TBA	BC4011-S
56246cf6-de9a-40e6-844c-c4c251f82221	15:30:00	ST	B-0	0	6	Autumn2020	ECN201	T001-00 TBA TBA	BC3011-S
96ff49dd-2d0d-4f64-bae1-535234beccb5	09:30:00	MW	-1	38	7	Autumn2020	ECN201	3410-MS Tasneem Bareen Hasan	BC4010-S
73f57fa9-b256-4015-9607-5386a585cbab	11:00:00	MW	-1	38	8	Autumn2020	ECN201	3298-Mr. Shamil M Al-Islam	BC7026-S
6c109d70-eef5-4759-896d-9850b8f150f9	12:30:00	MW	-1	38	9	Autumn2020	ECN201	3467-MS Nabila Maruf	BC7025-S
7ce6b39b-157b-42ba-8cd9-76f757a2d6e7	14:00:00	MW	-1	38	10	Autumn2020	ECN201	3369-MR Khawaja Saifur Rahman	BC4010-S
07ac8a66-9a17-4429-83d1-632b77244870	15:30:00	MW	-1	38	11	Autumn2020	ECN201	3369-MR Khawaja Saifur Rahman	C3004-S
6d16fc48-a627-4368-a424-d60289996dd0	17:00:00	MW	B-0	0	12	Autumn2020	ECN201	T001-00 TBA TBA	BC3008-S
57f13141-e4e9-4819-b5d0-594b81df0d94	17:00:00	ST	B-0	0	1	Autumn2020	ECN202	3463-MR Md. Kamrul Islam	BC3012-S
f9b4369e-2de8-4e83-a033-ed331da5987f	11:00:00	ST	-1	36	2	Autumn2020	ECN202	3369-MR Khawaja Saifur Rahman	BC6013-S
f8475f15-95bf-4ade-bb7c-4d940546bac0	12:30:00	ST	-1	35	3	Autumn2020	ECN202	3461-MS Mumtahina Islam	BC8012-S
3fd1743f-3888-4827-b597-ffe61451b918	14:00:00	ST	-1	35	4	Autumn2020	ECN202	3461-MS Mumtahina Islam	BC4012-S
a965d1fe-3571-47d9-8047-c503c7a3653b	15:30:00	ST	-1	35	5	Autumn2020	ECN202	3369-MR Khawaja Saifur Rahman	BC3012-S
f299e520-b0e5-47b4-b652-f1fa6cf1843d	09:30:00	MW	-1	35	6	Autumn2020	ECN202	3298-Mr. Shamil M Al-Islam	BC4011-S
cd370ccb-8e2f-4a39-90fe-a38b377577af	11:00:00	MW	-1	35	7	Autumn2020	ECN202	3490-MS Nuzhat Sharmeen	BC9014-S
a0ed1c08-f293-4bb2-9c6a-07db4c61bc54	12:30:00	MW	B-0	0	8	Autumn2020	ECN202	T001-00 TBA TBA	BC7026-S
b47400db-5789-4efc-8e35-79ec9e20ea1a	14:00:00	MW	-1	28	9	Autumn2020	ECN202	3494-DR Md. Shahnawaz Karim	BC4011-S
ce5feaaa-ff8c-4c99-a7bf-6f2d01a62fbe	17:00:00	MW	-1	35	10	Autumn2020	ECN202	3621-DR Md. Khaled Saifullah	BC3009-S
f10cd1f9-76ad-4c24-b578-9fb576d43f9f	11:00:00	MW	-1	5	1	Autumn2020	ECN203	3461-MS Mumtahina Islam	BC4012-S
f790f0db-fa7f-45f2-b42e-2a72e1efbe21	15:30:00	ST	-1	22	1	Autumn2020	ECN220	3463-MR Md. Kamrul Islam	BC7025-S
c514151d-2e6c-45da-9e8b-9f27bfc76df7	09:30:00	MW	-1	22	1	Autumn2020	ECN301	3467-MS Nabila Maruf	BC4012-S
e658326f-5a33-4193-9972-3a0433528691	14:00:00	MW	-1	26	1	Autumn2020	ECN302	3463-MR Md. Kamrul Islam	BC4012-S
17399796-747d-420b-a250-0e23bf7cd81b	17:00:00	MW	-1	29	1	Autumn2020	ECN320	3565-DR Shahriar Kabir	BC3010-S
f6b75d28-ab9e-4779-9095-e5b3d5328c55	12:30:00	ST	-1	18	1	Autumn2020	ECN330	3490-MS Nuzhat Sharmeen	BC8015-S
14bf1bc5-8981-4d47-9c87-35bbfff464c5	12:30:00	MW	-1	12	1	Autumn2020	ECN340	3463-MR Md. Kamrul Islam	BC8015-S
bf7c6ab4-a7f5-4f64-b328-eec131d7b370	09:30:00	ST	-1	28	1	Autumn2020	ECN361	3490-MS Nuzhat Sharmeen	BC9016-S
4a800268-4160-4a30-a04e-4c1ab59cb91a	15:30:00	MW	-1	9	1	Autumn2020	ECN382	3461-MS Mumtahina Islam	C3005-S
e2130a1d-b3da-4690-adef-beb595d12792	14:00:00	ST	-1	20	1	Autumn2020	ECN385	3467-MS Nabila Maruf	BC4013-S
9106e9f5-9955-43ed-b58f-079fdc162b1e	11:00:00	ST	-1	10	1	Autumn2020	ECN401	3298-Mr. Shamil M Al-Islam	BC4012-S
fb34bac4-0d9d-4f5e-93e0-6564bcbba318	17:00:00	ST	-1	11	1	Autumn2020	ECN402	3494-DR Md. Shahnawaz Karim	BC8014-S
91c4b69a-2303-4516-bc4d-d3176303f635	08:00:00	MW	-1	13	1	Autumn2020	ECN470	3298-Mr. Shamil M Al-Islam	BC3009-S
8ef24eb5-0d70-41c1-b8bc-2ad9de97afeb	11:00:00	MW	-1	2	1	Autumn2020	ECN486	3494-DR Md. Shahnawaz Karim	BC4011-S
b1ea9dda-72ff-49f0-9071-2272a38eddd2	08:00:00	ST	-1	4	1	Autumn2020	ECN490	3565-DR Shahriar Kabir	BC4012-S
9787f9c8-9dec-4c2f-9f22-14d161cb1271	12:30:00	ST	-1	33	1	Autumn2020	EEE131	4275-MS Tahsin F. Ara Nayna	BC6007-S
4530c54e-34e2-4da9-92f3-4f7ca3d6e61f	14:00:00	MW	-1	40	1	Autumn2020	EEE132	4286-DR Mustafa Habib Chowdhury	BC6007-S
a3be0595-e772-4831-9f10-4e44f6ad8a0b	09:30:00	ST	-1	20	1	Autumn2020	EEE211	4274-MS Saila Ishrat Annie	BC6013-S
238a1d0a-4c08-4c69-93b3-397cad608bde	08:00:00	MW	-1	10	2	Autumn2020	EEE211	4274-MS Saila Ishrat Annie	BC5013-S
9c4c6a16-9a09-4520-8e4b-004a7da4b9eb	11:00:00	M	-1	13	1	Autumn2020	EEE211L	4352-MS Zaima Tasneem	CirLab-S
3bb3b180-1970-46b4-bef3-49b54a852772	14:00:00	W	-1	4	2	Autumn2020	EEE211L	4352-MS Zaima Tasneem	CirLab-S
0b4cd882-cde7-4815-8e35-94788b8061d0	15:30:00	ST	-1	39	1	Autumn2020	EEE221	4142-MS Afroza Sultana	BC5014-S
674cc393-e82a-4bb8-83f3-92e485d59372	14:00:00	T	-1	2	1	Autumn2020	EEE222L	4278-MR Saurav Das	SIMLAB1-S
679e3308-9001-4f2b-8b57-fed36aee9419	14:00:00	M	-1	13	2	Autumn2020	EEE222L	4278-MR Saurav Das	SIMLAB1-S
33b71eb5-4684-4dce-b714-96dd8420f46d	12:30:00	MW	-1	39	1	Autumn2020	EEE223	4351-MS Navila Rahman Nadi	BC6008-S
35b6e3a9-6c3f-462c-bf3b-20a6f3586b96	08:00:00	ST	-1	34	1	Autumn2020	EEE231	4274-MS Saila Ishrat Annie	BC5013-S
847e45b1-dd1b-4202-ae80-c2a79d675e63	14:00:00	ST	-1	33	1	Autumn2020	EEE232	4142-MS Afroza Sultana	BC6009-S
57ac109a-8998-43f1-98c8-ce95ee750329	15:30:00	T	-1	16	1	Autumn2020	EEE232L	4406-MR Mohammad Rejwan Uddin	CirLab-S
90ae197f-f267-4789-92fd-a108d5f54d49	15:30:00	M	-1	7	2	Autumn2020	EEE232L	4406-MR Mohammad Rejwan Uddin	CirLab-S
36cbf7c0-2bb3-4bb3-8803-429caf8515b5	14:00:00	MW	-1	27	1	Autumn2020	EEE233	4200-DR Shahriar Khan	BC6009-S
ecfb2f02-a3d9-470a-a39a-f0e464de7ed9	09:30:00	MW	-1	24	1	Autumn2020	EEE234	4361-MR Shovasis Kumar Biswas	BC6009-S
b2b4f5b7-b161-4f8e-b1a5-e61d1700cac2	09:30:00	S	-1	8	1	Autumn2020	EEE234L	4361-MR Shovasis Kumar Biswas	CirLab-S
7a87379c-ca79-4276-839e-30898a90f3cf	09:30:00	T	-1	3	2	Autumn2020	EEE234L	4361-MR Shovasis Kumar Biswas	CirLab-S
d1045822-07f3-4b0c-8007-1dfe6520b4b4	14:00:00	MW	-1	33	1	Autumn2020	EEE312	4190-DR Khosru Mohammad Salim	BC6012-S
79e0d20d-e7eb-4468-ae13-a9ba8e2321e0	08:00:00	T	-1	20	1	Autumn2020	EEE312L	4352-MS Zaima Tasneem	PowLab-S
8e9dc82c-511c-442d-9869-35d3ae062121	08:00:00	M	-1	12	2	Autumn2020	EEE312L	4352-MS Zaima Tasneem	PowLab-S
0dbc080a-ba32-4c52-9f2f-beff65f190e3	14:00:00	ST	-1	50	1	Autumn2020	EEE313	4286-DR Mustafa Habib Chowdhury	BC6012-S
005b35fd-ae04-48eb-924f-058a877bdde0	12:30:00	T	-1	30	1	Autumn2020	EEE314L	4360-MR Mohammad Nasfikur Rahman Khan	TelLab-S
66ff92e3-aad7-480c-9401-a7e2da64d4e5	12:30:00	W	-1	11	1	Autumn2020	EEE315L	4278-MR Saurav Das	PowLab-S
6f6a33e2-e144-4738-a84e-be9c52654a9b	12:30:00	S	-1	18	1	Autumn2020	EEE316L	4360-MR Mohammad Nasfikur Rahman Khan	TelLab-S
d303f1cf-8cc4-4de7-afea-84ab42e4ef52	09:30:00	ST	-1	31	1	Autumn2020	EEE321	4240-DR Kafiul Islam	BC7016-S
2cb4c1ce-4cd0-465a-8087-3d7801bc2c04	09:30:00	M	-1	22	1	Autumn2020	EEE321L	4274-MS Saila Ishrat Annie	TelLab-S
666951a8-5a9b-47ed-8662-799c535c9671	09:30:00	W	-1	19	2	Autumn2020	EEE321L	4274-MS Saila Ishrat Annie	TelLab-S
ba687fc1-798f-4576-b7ae-43f9df9725de	08:00:00	MW	-1	30	1	Autumn2020	EEE323	4360-MR Mohammad Nasfikur Rahman Khan	BC5014-S
c5be977f-0b58-4888-9c4d-d661790b6cda	08:00:00	S	-1	12	1	Autumn2020	EEE323L	4351-MS Navila Rahman Nadi	SIMLAB1-S
ea557047-86d6-4506-945e-e44e866a14eb	14:00:00	W	-1	21	2	Autumn2020	EEE323L	4351-MS Navila Rahman Nadi	SIMLAB1-S
f8a5766d-3764-4cc4-a5ec-b9e9ffc9720c	15:30:00	MW	-1	27	1	Autumn2020	EEE332	4212-DR Abdur Razzak	BC5013-S
6978738f-b939-48a3-aa2a-26c93f39d8c6	11:00:00	S	-1	14	1	Autumn2020	EEE332L	4297-MR M. Ishtiaque Rahman	PowLab-S
201974aa-0e26-476e-ab47-f7ba7a648614	12:30:00	T	-1	10	2	Autumn2020	EEE332L	4297-MR M. Ishtiaque Rahman	PowLab-S
763fd917-dea6-46b6-a7cf-2ed2da8d21d3	09:30:00	ST	-1	34	1	Autumn2020	EEE333	4351-MS Navila Rahman Nadi	BC7025-S
84000908-1148-4d7d-afdc-7dad5c596596	17:00:00	ST	-1	21	1	Autumn2020	EEE334	4406-MR Mohammad Rejwan Uddin	SIMLAB1-S
781580cf-958d-424f-9b36-56b55bcc6eb5	17:00:00	MW	-1	22	2	Autumn2020	EEE334	4406-MR Mohammad Rejwan Uddin	SIMLAB1-S
2a591d2a-fa4e-413b-9bd2-cb20905aa1cd	08:00:00	R	-1	10	1	Autumn2020	EEE400	4212-DR Abdur Razzak	BCTBA1-S
07ce22ef-bb95-465f-8579-7713c74808f8	09:30:00	R	-1	1	2	Autumn2020	EEE400	4200-DR Shahriar Khan	BCTBA1-S
1c02496e-bc50-4239-94b0-84a64707950e	11:00:00	R	-1	7	3	Autumn2020	EEE400	4190-DR Khosru Mohammad Salim	BCTBA1-S
34faea0b-932f-48a8-8e9f-81921543852b	12:30:00	R	-1	2	4	Autumn2020	EEE400	4199-DR Feroz Ahmed	BCTBA1-S
bc825c49-fa92-472b-98e1-9127cb490dbe	14:00:00	R	-1	2	5	Autumn2020	EEE400	4240-DR Kafiul Islam	BCTBA1-S
36b58fc7-8b49-4272-bd7d-655aeccf1ab2	15:30:00	R	0	0	6	Autumn2020	EEE400	4286-DR Mustafa Habib Chowdhury	BCTBA1-S
fd2b4f4f-8f9d-4d4a-b883-5fd446e26832	17:00:00	R	-1	7	7	Autumn2020	EEE400	4361-MR Shovasis Kumar Biswas	BCTBA1-S
957388f3-f3e9-465a-aebe-6fb36aa158f9	15:30:00	ST	-1	17	1	Autumn2020	EEE411	4212-DR Abdur Razzak	BC6007-S
f3e924fe-c254-4f63-b31d-683d6d2bcf8d	11:00:00	T	-1	14	1	Autumn2020	EEE411L	4352-MS Zaima Tasneem	PowLab-S
5bc677fa-6591-4371-9c9f-4f7857059fc6	08:00:00	W	-1	7	2	Autumn2020	EEE411L	4352-MS Zaima Tasneem	PowLab-S
20a72341-2c69-4b37-9949-55b5b45c8e0b	14:00:00	ST	-1	35	1	Autumn2020	EEE419	4200-DR Shahriar Khan	BC6013-S
42e89f2b-999d-4038-8910-2c60293726ee	09:30:00	W	-1	30	1	Autumn2020	EEE419L	4297-MR M. Ishtiaque Rahman	PowLab-S
035a119b-5423-46f8-a178-b0bf22954466	08:00:00	ST	-1	42	1	Autumn2020	EEE422	4324-MR Fokhruz Zaman	BC5014-S
2e377f07-4371-467c-af1d-e42520b1f630	15:30:00	M	-1	31	1	Autumn2020	EEE423L	4352-MS Zaima Tasneem	PowLab-S
6c3884dd-e4a9-4e6f-8284-17f5664347c6	11:00:00	MW	-1	15	1	Autumn2020	EEE432	4351-MS Navila Rahman Nadi	BC6009-S
87dccffc-899b-491b-8d65-1e147d8a109b	11:00:00	MW	0	4	1	Autumn2020	EEE466	4240-DR Kafiul Islam	TelLab-S
4b301867-d99b-484b-8e88-16e9de9a863b	17:00:00	ST	-1	12	1	Autumn2020	EEE469	4360-MR Mohammad Nasfikur Rahman Khan	BC5013-S
c2e247ad-69ea-44d5-b0e8-af5cc5b5633b	08:00:00	A	0	0	1	Autumn2020	EEE497	4142-MS Afroza Sultana	BCTBA1-S
c22a53c5-21a8-401c-be32-066e2c72ec0f	09:30:00	A	0	0	2	Autumn2020	EEE497	4274-MS Saila Ishrat Annie	BCTBA1-S
df249407-e5ce-4c5b-90ba-61f43ed4548d	11:00:00	A	0	0	3	Autumn2020	EEE497	4275-MS Tahsin F. Ara Nayna	BCTBA1-S
d0d5287d-6de7-4a50-a18f-f0587141dd7c	12:30:00	A	0	0	4	Autumn2020	EEE497	4351-MS Navila Rahman Nadi	BCTBA2-S
5aa79df4-eaad-40ed-ae08-efeff41af98b	14:00:00	A	-1	2	5	Autumn2020	EEE497	4361-MR Shovasis Kumar Biswas	BCTBA1-S
6d6d7d8f-7102-47bc-b97d-b12ac0b107a2	15:30:00	A	-1	1	6	Autumn2020	EEE497	4360-MR Mohammad Nasfikur Rahman Khan	BCTBA2-S
b923e823-6893-40a8-8fab-bb21b5aca679	08:00:00	F	0	0	1	Autumn2020	EEE499	4142-MS Afroza Sultana	BCTBA1-S
a7af22d1-2ed0-4d92-934c-ce3767bc4f45	09:30:00	F	0	0	2	Autumn2020	EEE499	4274-MS Saila Ishrat Annie	BCTBA1-S
9954428b-9831-4c89-9d91-bd26edf22771	11:00:00	F	0	0	3	Autumn2020	EEE499	4275-MS Tahsin F. Ara Nayna	BCTBA1-S
1843163e-7a59-4dc1-a5e1-1abfa0e45315	12:30:00	F	-1	1	4	Autumn2020	EEE499	4351-MS Navila Rahman Nadi	BCTBA1-S
89c64679-983b-46e6-be4e-524eed5d8043	14:00:00	F	-1	2	5	Autumn2020	EEE499	4361-MR Shovasis Kumar Biswas	BCTBA1-S
327f31ed-a33c-4cce-b9ef-b4065ec43b73	15:30:00	F	-1	1	6	Autumn2020	EEE499	4360-MR Mohammad Nasfikur Rahman Khan	BCTBA1-S
ff6e0025-31d0-47e4-ae43-54444b895e2f	11:00:00	MW	-1	24	1	Autumn2020	ELT204	2439-MR Adilur Rahman	BC8013-S
4a4a5acc-6a49-40cc-abcd-fe61d4de6d55	08:00:00	ST	-1	9	1	Autumn2020	ELT303	2132-MS Rezina Nazneen Rimi	BC8013-S
ab88e570-4118-4811-a8f4-fc33e4163a36	11:00:00	ST	-1	14	1	Autumn2020	ELT312	2002-MS Mithila Mahfuz	BC8014-S
9a87687d-0287-460a-bde2-5332802bc554	09:30:00	MW	-1	28	1	Autumn2020	ELT314	2002-MS Mithila Mahfuz	C2005-S
6ce72314-072c-4128-a0c5-67638f4d5388	14:00:00	ST	-1	33	1	Autumn2020	ELT401	2234-MS Naureen Rahnuma	C2002-S
516582fc-f8b1-4dbb-bca8-e3c82fe18f85	09:30:00	ST	-1	6	1	Autumn2020	ELT402	2002-MS Mithila Mahfuz	BC8013-S
fd519d23-ceb1-423e-80af-2dbeb0badb75	09:30:00	ST	-1	11	1	Autumn2020	ELT403	2132-MS Rezina Nazneen Rimi	BC8014-S
a746e6c9-0f99-4229-b98c-bfeed8bfc03a	11:00:00	ST	-1	19	1	Autumn2020	ELT405	2439-MR Adilur Rahman	BC8013-S
a9aab94f-d30c-430d-9202-a2edaae74d2c	12:30:00	MW	-1	12	1	Autumn2020	ELT411	2002-MS Mithila Mahfuz	BC8013-S
f71b5a1e-0d83-4fbe-839e-db9b03a59836	12:30:00	ST	-1	18	1	Autumn2020	ELT413	2439-MR Adilur Rahman	BC8013-S
1af63f84-55df-48e0-901e-252b819e7fd6	08:00:00	MW	-1	10	1	Autumn2020	ELT414	2132-MS Rezina Nazneen Rimi	BC8013-S
e483ccf9-246d-4992-bea0-ce354e3a50a2	09:30:00	MW	-1	6	1	Autumn2020	ELT415	2132-MS Rezina Nazneen Rimi	C3004-S
9d4993ec-e320-4176-b14f-0673129e0538	11:00:00	ST	-1	8	1	Autumn2020	ELT416	2136-MR Md. Shaiful Islam	BC9015-S
eb22403d-8026-4a65-a56a-0777dafbbdad	17:00:00	T	-1	4	1	Autumn2020	ELT499	2104-MR Syed Mazharul Islam	BC001-S
87ec1b81-db29-465d-9753-a9b91f838abc	17:00:00	ST	-1	46	1	Autumn2020	ENG101	2332-MS Fatina Sarwar	C2004-S
12124175-e478-434b-8680-37d32c2f8373	15:30:00	MW	-1	44	2	Autumn2020	ENG101	2362-MS Sakira Islam	BC8011-S
a0823dfb-ecd4-4177-8c1b-e8d36c74f27c	14:00:00	ST	-1	46	3	Autumn2020	ENG101	2494-MR Prodhan Mahbub Ibna Seraj	C2005-S
4e261ee2-6ec6-4651-b61e-34c64ab17599	09:30:00	MW	-1	44	4	Autumn2020	ENG101	2344-MS Nadira Sultana Mirza	C2004-S
ad2b851c-f578-4280-83a8-5fb6f447a89f	15:30:00	ST	-1	47	5	Autumn2020	ENG101	2362-MS Sakira Islam	BC9014-S
02deb722-c617-483e-8a92-53ff6246369f	11:00:00	MW	-1	45	6	Autumn2020	ENG101	2344-MS Nadira Sultana Mirza	BC7025-S
c4e8d1a2-e39e-4897-8970-4579322f0d7c	09:30:00	ST	-1	46	7	Autumn2020	ENG101	2136-MR Md. Shaiful Islam	C3005-S
405fb4bb-3c68-4115-ab70-d20530289a5d	08:00:00	ST	-1	45	8	Autumn2020	ENG101	2483-MR Kazi Mubinul Hasan Shanto	C2004-S
53eb4cb8-a1db-4320-9214-0ba89e025f81	14:00:00	ST	-1	47	9	Autumn2020	ENG101	2493-MS Anika Nawar	C3004-S
283a057e-bc27-4aef-836a-443487e86415	15:30:00	ST	-1	46	10	Autumn2020	ENG101	2493-MS Anika Nawar	C2004-S
69d6391f-1ed4-4b1a-b0f9-f632261a286a	08:00:00	MW	-1	38	1	Autumn2020	ENG102	2411-MS Lameya Alma Amin	BC7015-S
3396ec12-bc63-42ad-92c8-9e26e4f8ffec	17:00:00	MW	-1	45	2	Autumn2020	ENG102	2409-MS Sanjida Akhter	BC8011-S
592f1780-1d37-4948-b7a7-456c2b84002a	17:00:00	ST	-1	44	3	Autumn2020	ENG102	2490-MS Pikasha Imam	BC8011-S
6964437c-3f31-4cd5-a964-5b5cf2658bc5	09:30:00	ST	-1	45	4	Autumn2020	ENG102	2452-MS Mir Sadia Siddequa Sifat	C4004-S
6dcd432b-629c-4ed7-b957-b2db6c73019b	14:00:00	MW	-1	46	5	Autumn2020	ENG102	2483-MR Kazi Mubinul Hasan Shanto	BC7016-S
51c0adcf-6b18-4b49-8522-2e3809018e30	14:00:00	MW	-1	45	6	Autumn2020	ENG102	2452-MS Mir Sadia Siddequa Sifat	BC7025-S
df9b1d1e-14de-4549-abe6-469e53bffa24	09:30:00	MW	-1	45	7	Autumn2020	ENG102	2343-MS Nusrat Jahan Jyote	BC7026-S
600a7de8-93d8-4abf-932a-eec5af375324	12:30:00	ST	-1	45	8	Autumn2020	ENG102	2133-MS Saara Zabeen	BC7015-S
fd5cdb86-a6ef-45a1-9190-c4b02fd10724	17:00:00	MW	-1	45	9	Autumn2020	ENG102	2332-MS Fatina Sarwar	BC8012-S
8d0180bb-d841-4603-8eec-b5fe8af4686e	15:30:00	MW	-1	44	10	Autumn2020	ENG102	2409-MS Sanjida Akhter	BC8012-S
bb514f65-4237-4c4d-aac8-cfd7033e14e4	08:00:00	ST	-1	36	11	Autumn2020	ENG102	2402-MS Shahnaz Akhter	BC8014-S
617a0eb8-5258-4df5-a983-8c1c09349763	12:30:00	MW	-1	39	12	Autumn2020	ENG102	2418-MR Md. Ashikuzzaman	BC7002-S
d7097d88-0b5a-4891-b070-a2e46861fa39	08:00:00	ST	-1	17	1	Autumn2020	ENG105	2405-MS Jasmine Ferdous	BC8012-S
17dfe423-eff5-4d99-b425-87296615f042	09:30:00	ST	-1	27	2	Autumn2020	ENG105	2405-MS Jasmine Ferdous	BC8011-S
d8002925-6728-46a9-b793-c5538b28a0c5	11:00:00	ST	-1	39	3	Autumn2020	ENG105	2357-MR Mohammad Israil Hoque	BC7016-S
029ff8dd-7fde-4516-ad07-1a58865c26aa	14:00:00	ST	-1	40	4	Autumn2020	ENG105	2219-MR Md. Ziaul Karim	BC8011-S
f0dbbaeb-c6ee-499f-b116-4cef0e723547	09:30:00	MW	-1	40	5	Autumn2020	ENG105	2259-MR G. M. A Mainuddin Chowdhury	BC8011-S
6949442b-a32a-4a91-927e-da3e75a7d788	12:30:00	ST	-1	40	6	Autumn2020	ENG105	2407-MS Sayeeda Sharmin	BC7016-S
db4845c9-4f7a-4ed1-9622-e8ab509d8917	17:00:00	ST	-1	40	7	Autumn2020	ENG105	2407-MS Sayeeda Sharmin	BC7015-S
257c78ae-9872-48e8-8943-767946871b5c	09:30:00	ST	-1	28	8	Autumn2020	ENG105	2417-MR Mohammad Serajuddin	BC8012-S
450ab108-58f3-4785-9290-adba5716e019	12:30:00	ST	-1	40	9	Autumn2020	ENG105	2357-MR Mohammad Israil Hoque	BC7025-S
5f119099-db93-4300-86d1-ed1ef751f6e9	14:00:00	ST	-1	35	10	Autumn2020	ENG105	2357-MR Mohammad Israil Hoque	BC8012-S
5f5455ca-8cc7-4f2e-9ea5-e00cc72e1af8	14:00:00	ST	-1	40	11	Autumn2020	ENG105	2247-MS Sumaiya Islam	BC8015-S
d6f01ec0-3cde-4abd-8c35-0aa4055837c7	15:30:00	ST	-1	9	12	Autumn2020	ENG105	2219-MR Md. Ziaul Karim	BC7015-S
dc830dab-9282-4e78-9bad-b2138911b1cd	08:00:00	MW	-1	40	13	Autumn2020	ENG105	2259-MR G. M. A Mainuddin Chowdhury	BC7016-S
3cb5bf37-74c7-4347-916f-2b603e535393	11:00:00	MW	-1	40	14	Autumn2020	ENG105	2463-PROF Rabeya Begum	BC8011-S
5406993b-f467-4e30-86d9-11fadc853af2	11:00:00	ST	-1	40	15	Autumn2020	ENG105	2417-MR Mohammad Serajuddin	BC7025-S
b111b7ce-7ee9-4890-a013-0f77e12e9e7e	08:00:00	MW	-1	29	16	Autumn2020	ENG105	2487-DR AKM Zakaria	BC7025-S
65c944cd-bff3-4556-b6e6-a4023a8a2937	08:00:00	ST	-1	41	17	Autumn2020	ENG105	1105-MR Kamal Uddin	BC8015-S
0a6f7892-9042-4ba4-bf2a-a4f9a1c729d9	08:00:00	MW	-1	40	18	Autumn2020	ENG105	2402-MS Shahnaz Akhter	BC7026-S
d424cd76-cb24-4347-ba90-c9e68a8eeb1c	12:30:00	MW	-1	40	19	Autumn2020	ENG105	2463-PROF Rabeya Begum	BC8011-S
4d32afcf-ff11-4125-95d7-98ee04d9a474	11:00:00	ST	-1	34	20	Autumn2020	ENG105	2247-MS Sumaiya Islam	BC7026-S
bd8dd7a7-c624-4c83-8f1a-6bba7fdb7900	12:30:00	ST	-1	11	21	Autumn2020	ENG105	2405-MS Jasmine Ferdous	BC7026-S
c80e2c84-9b63-41f9-b497-ff5a345b4ddc	14:00:00	MW	-1	40	22	Autumn2020	ENG105	2418-MR Md. Ashikuzzaman	BC8011-S
1bd09cec-b8fd-447d-b40b-d3eae4621739	15:30:00	ST	-1	40	23	Autumn2020	ENG105	2408-MS Rumana Amin	BC7016-S
c6ff5e73-4f4f-4f6c-b1e6-412c695a257c	17:00:00	ST	-1	41	24	Autumn2020	ENG105	2408-MS Rumana Amin	BC7016-S
975c4428-3a98-41fd-8232-6b46c30df15e	09:30:00	MW	-1	40	25	Autumn2020	ENG105	2487-DR AKM Zakaria	BC8012-S
7e07fa55-79aa-46b9-bab1-1819f1d69500	12:30:00	MW	-1	40	26	Autumn2020	ENG105	1105-MR Kamal Uddin	BC8012-S
ce3524e2-46b4-4e37-840e-fc7219c9025c	09:30:00	MW	-1	30	1	Autumn2020	ENG201	2126-MS Sayyeda-tun-Noor Sameera	C3005-S
3bd878a6-0a0f-454f-aa9c-4f84fbd48a3a	12:30:00	ST	-1	15	1	Autumn2020	ENG306	2260-MS Andaleeb N. Chowdhury	BC8014-S
b1600cec-ff45-4892-b273-aba5350ea065	15:30:00	ST	-1	8	1	Autumn2020	ENG311	2260-MS Andaleeb N. Chowdhury	BC4010-S
8e92cfe1-4043-4a28-a701-8c0be0d5d450	11:00:00	ST	-1	1	1	Autumn2020	ENG312	2133-MS Saara Zabeen	BC4010-S
4e2745bc-d764-4c65-b6fa-6791fea4dff0	09:30:00	ST	-1	4	1	Autumn2020	ENG313	2126-MS Sayyeda-tun-Noor Sameera	BC9015-S
02339672-3e1c-4330-b1a9-4e0ae47512a4	14:00:00	MW	-1	6	1	Autumn2020	ENG314	2133-MS Saara Zabeen	BC9015-S
6a53adf7-38bb-42ee-a431-a0dc5ab274e2	12:30:00	MW	-1	12	1	Autumn2020	ENG316	2260-MS Andaleeb N. Chowdhury	BC4010-S
d96fa447-4712-4270-936e-78ad783e4686	15:30:00	ST	-1	6	1	Autumn2020	ENG401	2486-DR Ahmed Ahsanuzzaman	BC4011-S
b42b6f95-7fc4-446a-95d2-4f72f8c581e6	15:30:00	MW	-1	7	1	Autumn2020	ENG403	2260-MS Andaleeb N. Chowdhury	C2004-S
88b38449-a2e3-4585-8e07-b238ffe30a50	17:00:00	MW	-1	20	1	Autumn2020	ENG404	2166-PROF Niaz Zaman	C2003-S
f009cb33-69b0-4ef3-b987-f9929584da2b	17:00:00	ST	-1	12	2	Autumn2020	ENG404	2486-DR Ahmed Ahsanuzzaman	C2005-S
a31239a3-4918-48dd-9da3-354b3d43e74f	14:00:00	ST	B-0	0	1	Autumn2020	ENG406	2440-MS Vikarun Nessa	C2006-S
615a3f65-6025-459c-b5c1-c415ea1e96a3	17:00:00	ST	B-0	0	1	Autumn2020	ENG412	T001-00 TBA TBA	BC4010-S
51bfd1ff-0a8e-4760-b758-f136c4c2620b	17:00:00	ST	-1	15	1	Autumn2020	ENG413	2440-MS Vikarun Nessa	BC4011-S
c2d9c1c3-2341-4339-951f-71f50bbc76a4	11:00:00	MW	-1	4	1	Autumn2020	ENG414	2126-MS Sayyeda-tun-Noor Sameera	BC10017-S
8bc6458c-f10a-48e4-ad3f-2dbefe0b77c8	11:00:00	ST	-1	11	1	Autumn2020	ENG415	2126-MS Sayyeda-tun-Noor Sameera	BC9016-S
e15f1ec3-07b3-4521-a7e0-e5fa352da17a	17:00:00	R	-1	4	1	Autumn2020	ENG499	2234-MS Naureen Rahnuma	BCTBA2-S
2e438308-799a-411f-8d29-19c18f1af8f1	14:00:00	ST	-1	38	1	Autumn2020	ENV100	5230-MR Md. Ekhtekharul Islam	BC10015-S
da9ddff8-b9ca-4613-aecb-ff380c717173	14:00:00	ST	-1	15	2	Autumn2020	ENV100	5536-MS Karishma Sinha	BC10018-S
94c86950-5869-453e-bb00-a1b419cb36e4	11:00:00	MW	-1	40	1	Autumn2020	ENV101	5231-MR Saquib Ahmad Khan	BC8012-S
bc4973ae-ebb9-4907-98fb-7fb9f2a37da2	08:00:00	MW	-1	13	2	Autumn2020	ENV101	5248-MS Tahmina Sultana	BC8011-S
08de6378-91b8-44b7-914c-e468db411780	11:00:00	ST	-1	39	3	Autumn2020	ENV101	5230-MR Md. Ekhtekharul Islam	BC8011-S
520ff1bd-b55b-4011-b89f-6277f4d3764d	15:30:00	ST	-1	10	4	Autumn2020	ENV101	5248-MS Tahmina Sultana	BC8011-S
7008568b-a884-4583-8b5a-052c59cd386b	14:00:00	MW	-1	14	5	Autumn2020	ENV101	5536-MS Karishma Sinha	BC8012-S
36990610-b7f2-4359-8960-a0cb6840906c	15:30:00	ST	-1	40	6	Autumn2020	ENV101	5207-MR Tanvir Ahmed Haroon	BC8012-S
aaf2a7d1-abb5-4d02-997b-933504eda044	11:00:00	ST	-1	40	7	Autumn2020	ENV101	5207-MR Tanvir Ahmed Haroon	BC8012-S
cfe20d12-a545-4d7d-be7f-7a573a047022	11:00:00	MW	-1	26	1	Autumn2020	ENV201	5252-DR Sadia Nazneen Karobi	BC9015-S
97885e89-d624-41b2-9a4c-491e36f4b111	09:30:00	R	-1	22	1	Autumn2020	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
9099eb1a-d296-441c-85d7-ac6b59d439a7	11:00:00	R	B-0	0	2	Autumn2020	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
b642e160-bc03-4f9c-852b-ba6e0f4fe6e5	12:30:00	R	B-0	0	3	Autumn2020	ENV201L	5252-DR Sadia Nazneen Karobi	ESLAB2-S
12b6635c-1620-4265-930b-f0ecc79d372e	11:00:00	ST	-1	19	1	Autumn2020	ENV202	5199-DR Shahima Islam	C4006-S
7fccedaa-5f5f-4dd5-aef1-1981a4496be1	09:30:00	MW	-1	15	2	Autumn2020	ENV202	5236-DR Mohammad Sorowar Hossain	C4003-S
9bbd19f2-beda-4acb-8870-c50f420fbdd1	09:30:00	R	-1	21	1	Autumn2020	ENV202L	5199-DR Shahima Islam	BLab-S
2589382c-7b15-430f-9393-834615674309	11:00:00	R	B-0	0	2	Autumn2020	ENV202L	5199-DR Shahima Islam	BLab-S
33911929-99c0-48db-84e4-465bebb752a2	14:00:00	R	-1	12	3	Autumn2020	ENV202L	5199-DR Shahima Islam	BLab-S
38df21b2-7b4d-4430-9545-2cc3173b068f	09:30:00	ST	-1	30	1	Autumn2020	ENV205	5231-MR Saquib Ahmad Khan	C6004-S
1d40a2f7-3265-412d-8ea3-415041181fa1	08:00:00	ST	-1	30	1	Autumn2020	ENV206	5248-MS Tahmina Sultana	BC4013-S
ee663a83-e6f3-4064-9f0f-fc79f572afa1	15:30:00	MW	-1	30	2	Autumn2020	ENV206	5248-MS Tahmina Sultana	BC7025-S
30d1f915-34f8-4aa6-8a71-1fc27c436098	14:00:00	ST	-1	40	1	Autumn2020	ENV212	5207-MR Tanvir Ahmed Haroon	BC9017-S
e1a56020-8b18-4b55-b138-feabf6d9bbfe	11:00:00	ST	-1	30	2	Autumn2020	ENV212	5247-DR Tawhid Monzur	BC8015-S
9ead54ec-d6bd-4c3b-8ecc-a6f9c8fb4b78	11:00:00	MW	-1	31	1	Autumn2020	ENV216	5212-MR Chowdhury Kamrul Hasan	BC9016-S
59a73b78-a115-4b44-a15a-ece8319a5027	08:00:00	MW	-1	16	1	Autumn2020	ENV220	5230-MR Md. Ekhtekharul Islam	BC10015-S
c4252ae0-9355-4573-a734-549eb9330939	14:00:00	MW	-1	29	1	Autumn2020	ENV301	5230-MR Md. Ekhtekharul Islam	BC8015-S
c1bd7756-a100-4257-98b0-58542a1adadd	17:00:00	ST	-1	15	1	Autumn2020	ENV302	5247-DR Tawhid Monzur	BC7019-S
c9bd9106-3b4d-4cb7-8e0e-c6aa264c6570	17:00:00	MW	-1	9	2	Autumn2020	ENV302	5247-DR Tawhid Monzur	BC7019-S
1abac4e3-4351-4bf5-9737-2bfacb5507c4	15:30:00	R	-1	24	1	Autumn2020	ENV302L	5247-DR Tawhid Monzur	BC7019-S
f0e92206-7f12-425b-8f5c-e42b8f15a1e7	11:00:00	MW	-1	8	1	Autumn2020	ENV304	5236-DR Mohammad Sorowar Hossain	C2006-S
e10be0bc-3401-41d3-9a8a-6ed42dd9fe9b	14:00:00	R	B-1	1	1	Autumn2020	ENV304L	5236-DR Mohammad Sorowar Hossain	GIS-LAB-S
d6770ec5-e84b-459b-8903-58adfe28eb0b	14:00:00	ST	-1	25	1	Autumn2020	ENV310	5199-DR Shahima Islam	C4004-S
02b57f10-2bcf-473f-8a86-22a296840eda	09:30:00	MW	-1	30	1	Autumn2020	ENV315	5129-MR Khondkar Ayaz Rabbani	BC8013-S
e233b784-ca2a-4e03-a5fb-56f9b2d91dd8	09:30:00	ST	-1	30	1	Autumn2020	ENV316	5212-MR Chowdhury Kamrul Hasan	BC10017-S
a244c999-4b83-4719-86df-8d71085cad53	11:00:00	ST	-1	31	2	Autumn2020	ENV316	5212-MR Chowdhury Kamrul Hasan	BC4014-S
e3bffb00-1955-45d2-89d9-3f17e64b4463	14:00:00	ST	B-0	0	3	Autumn2020	ENV316	5212-MR Chowdhury Kamrul Hasan	BC8013-S
46179a8b-d535-4b6b-80b7-85e307052fed	15:30:00	ST	-1	30	1	Autumn2020	ENV320	5536-MS Karishma Sinha	BC9017-S
8723740f-da59-4f6d-abea-4459a25573da	17:00:00	MW	-1	30	1	Autumn2020	ENV325	5142-DR Md. Abdul Khaleque	BC8015-S
ac7c528b-23bd-4f05-bf39-9bbf72b4a946	17:00:00	ST	-1	31	2	Autumn2020	ENV325	5142-DR Md. Abdul Khaleque	BC7026-S
0121e9b3-55f8-452d-857a-4568c8e5944d	17:00:00	ST	-1	40	1	Autumn2020	ENV330	5291-DR Abu SMG Kibria	BC8012-S
63bb7b58-0c9b-4403-a38b-89b39794ec63	11:00:00	MW	-1	14	1	Autumn2020	ENV340	5247-DR Tawhid Monzur	BC7019-S
4967a742-0009-4cc7-be76-988ef26bf927	09:30:00	ST	-1	35	1	Autumn2020	ENV346	5215-DR M. H. Rahman	BC10018-S
de9a6036-4259-4602-90c8-0a9512895467	14:00:00	MW	-1	29	1	Autumn2020	ENV348	5215-DR M. H. Rahman	BC9014-S
1f526bae-cd46-4baf-a63d-9a716faa2c60	15:30:00	MW	-1	29	1	Autumn2020	ENV350	5536-MS Karishma Sinha	BC7026-S
92e840f6-34bd-4f01-ba15-8551c18ce385	11:00:00	MW	-1	49	1	Autumn2020	ENV401	5207-MR Tanvir Ahmed Haroon	BC8015-S
4bf0f24b-daf2-4a3f-9921-5a955d2a154f	09:30:00	MW	-1	46	1	Autumn2020	ENV403	5215-DR M. H. Rahman	BC8014-S
f1d3a9fc-979c-41c8-b24b-937929aa3180	17:00:00	MW	-1	13	1	Autumn2020	ENV409	5189-PROF M. Z. Abedin	BC9014-S
278457c7-bb57-4a1a-a05b-53196982c19f	17:00:00	MW	-1	40	1	Autumn2020	ENV410	5321-DR Qazi Zahed Iqbal	BC9017-S
c8c218a3-8f84-4d37-bc1b-34faee20b5c5	09:30:00	ST	-1	36	1	Autumn2020	ENV415	5129-MR Khondkar Ayaz Rabbani	BC9014-S
30fe1092-2b4a-4392-ab7e-c248347b71d5	12:30:00	R	-1	17	1	Autumn2020	ENV498	5129-MR Khondkar Ayaz Rabbani	BC001-S
8955625b-1240-4910-b2fe-cc22387d171d	14:00:00	R	-1	26	1	Autumn2020	ENV499	5129-MR Khondkar Ayaz Rabbani	BC001-S
8672dbfd-d425-4e5c-ae5c-9e6c68a17613	11:00:00	MW	-1	34	1	Autumn2020	ETE312	4199-DR Feroz Ahmed	BC6012-S
fe47e9c8-aef7-49a5-a1d0-2671ee4a87a7	15:30:00	T	-1	3	1	Autumn2020	ETE315L	4321-MR Emranul Haque	TelLab-S
b6451084-9ace-497d-9278-060a22881dd0	11:00:00	ST	-1	36	1	Autumn2020	ETE322	4199-DR Feroz Ahmed	BC6008-S
5ed2ad3e-cfca-4109-b8c9-ddf52d1a34d9	12:30:00	W	-1	12	1	Autumn2020	ETE322L	4275-MS Tahsin F. Ara Nayna	TelLab-S
994b6ec4-62b7-44b1-a2c9-c4f58d147b6b	11:00:00	MW	-1	31	1	Autumn2020	ETE331	4275-MS Tahsin F. Ara Nayna	BC6013-S
ac401507-651d-4f60-a2d3-055279b94780	12:30:00	M	-1	24	1	Autumn2020	ETE331L	4275-MS Tahsin F. Ara Nayna	TelLab-S
67a8a527-d74d-4a8d-a2d8-ddebb4a23257	08:00:00	ST	-1	18	1	Autumn2020	ETE332	4361-MR Shovasis Kumar Biswas	BC6007-S
f28edbc7-7067-4fc3-bbf6-761c04c39ca0	12:30:00	MW	-1	2	1	Autumn2020	ETE333	4142-MS Afroza Sultana	BC6012-S
b171a0ec-5c3c-4fea-bb6a-1341ecbf5c98	11:00:00	ST	-1	6	1	Autumn2020	ETE335	4275-MS Tahsin F. Ara Nayna	BC6009-S
7d4f4cea-4a21-468c-99f5-bd6521df83b2	08:00:00	MW	-1	34	1	Autumn2020	ETE413	4361-MR Shovasis Kumar Biswas	BC6007-S
20fb3f67-4b94-4717-83b1-aafb274eb45f	09:30:00	ST	-1	45	1	Autumn2020	FIN201	3442-MR Anwar Zahid	BC2020-S
9d1c99f4-df14-4841-a73c-f8801c105a18	08:00:00	ST	-1	43	2	Autumn2020	FIN201	3479-MS Zaima Ahmed	BC2013-S
ca1b7d29-616c-48a8-a3a1-bd12d566b021	17:00:00	ST	-1	45	3	Autumn2020	FIN201	3588-MR Md. Sajedul Islam	BC2012-S
5e1bdc6c-d6f7-4bb3-ba71-6f82d0ee0883	11:00:00	MW	-1	45	4	Autumn2020	FIN201	3344-MR Mohammad Fahad Noor	BC2012-S
fcd3f220-4654-44d8-85f8-a28153055e48	14:00:00	MW	-1	45	5	Autumn2020	FIN201	3429-MS Jesmin Mannan	BC2013-S
18faa86b-307f-485f-81bd-7dd55d93aedf	12:30:00	MW	-1	45	6	Autumn2020	FIN201	3442-MR Anwar Zahid	BC2012-S
ca981399-4b3c-48a0-aa5d-30e81dc7a371	12:30:00	MW	-1	45	7	Autumn2020	FIN201	3410-MS Tasneem Bareen Hasan	BC2013-S
af1eebee-36b2-4750-8b01-c4b40a8567a3	15:30:00	MW	-1	46	8	Autumn2020	FIN201	3468-MS Sumaya Zesmin	BC2012-S
64be7a49-8f22-4e38-b15b-6b1481836066	12:30:00	ST	-1	45	1	Autumn2020	FIN301	3442-MR Anwar Zahid	BC2012-S
9dfe1db6-2094-4a45-a6e0-8b90eb5382dd	15:30:00	MW	-1	36	2	Autumn2020	FIN301	3442-MR Anwar Zahid	BC2013-S
24a89782-ddc9-4f33-a0ce-a893a3ce84a8	11:00:00	ST	-1	45	1	Autumn2020	FIN302	3344-MR Mohammad Fahad Noor	BC2011-S
bdb5c03c-210a-4eef-9d07-8703b5cd117f	09:30:00	MW	-1	18	2	Autumn2020	FIN302	3344-MR Mohammad Fahad Noor	BC2020-S
5b02422a-4c35-4beb-ad55-45ae0df363c2	08:00:00	MW	-1	16	1	Autumn2020	FIN401	3479-MS Zaima Ahmed	BC2011-S
379ed64b-ca8c-4125-a92b-5f325c33486c	09:30:00	ST	-1	37	2	Autumn2020	FIN401	3479-MS Zaima Ahmed	BC2021-S
388fb247-0579-47bc-94d7-d3cfd1a0778c	17:00:00	ST	-1	46	1	Autumn2020	FIN405	1747-MR Md. Rayatul Islam	BC2013-S
15f248c4-9ab8-4485-880f-8b1c4221e582	17:00:00	ST	-1	49	1	Autumn2020	FIN440	3617-MR Anis A. Khan	BC2014-S
d02449dc-2e0e-40ae-9fe0-8814c030938f	12:30:00	ST	-1	45	1	Autumn2020	FIN460	3344-MR Mohammad Fahad Noor	BC2013-S
c5ef1bb3-6eff-4c17-8a8a-c395db8183d1	14:00:00	MW	-1	33	2	Autumn2020	FIN460	3229-DR Sarwar Uddin Ahmed	BC2014-S
047bb970-c216-40b9-9d6f-836d608c76cd	08:00:00	ST	-1	18	1	Autumn2020	FIN461	3625-MR Md. Mehedi Hasan	BC2014-S
99176ef3-bcb6-4869-84c6-c0033554803e	09:30:00	MW	-1	29	1	Autumn2020	FIN480	3479-MS Zaima Ahmed	BC2021-S
26f685fc-5302-469d-a31b-fb78a3c5ccf5	08:00:00	MW	-1	29	1	Autumn2020	FRN101	2160-DR Rifat Rashid	BC8014-S
4424d6e9-1b47-4d57-a07a-fd279e3649da	09:30:00	MW	-1	30	2	Autumn2020	FRN101	2160-DR Rifat Rashid	C4004-S
116b5489-99d4-40c1-a2b5-7e5ea75629cd	08:00:00	ST	-1	30	3	Autumn2020	FRN101	2286-MR Mohammed Ataur Rahman	BC4011-S
7ac657a4-a43f-473e-9488-1297ff5b9d55	09:30:00	ST	-1	31	4	Autumn2020	FRN101	2286-MR Mohammed Ataur Rahman	BC4011-S
76d87084-e5f0-429f-8df0-d0c28ad56b6c	09:30:00	MW	-1	11	1	Autumn2020	GSG101	2469-MR Md. Amjad Hossain	C3006-S
16112855-f37d-4cde-bb98-a67fe8d1aecd	12:30:00	MW	-1	7	2	Autumn2020	GSG101	2213-MS Jessica Tartila Suma	C2006-S
8e6a28e2-99bf-4d5d-9c8f-53071d304d11	11:00:00	ST	-1	15	3	Autumn2020	GSG101	2437-MR Hossain Ahmed Taufiq	C3002-S
ad0c8157-eb02-4a59-8326-fda723a00438	15:30:00	ST	-1	7	4	Autumn2020	GSG101	2479-DR Marufa Akter	C2007-S
3ca24a2f-9dde-4080-9694-e1fab80b985b	11:00:00	MW	-1	5	1	Autumn2020	GSG102	2469-MR Md. Amjad Hossain	C3002-S
e944b208-6070-4924-90db-945f4013958f	14:00:00	ST	-1	5	1	Autumn2020	GSG103	2437-MR Hossain Ahmed Taufiq	C3003-S
54a8b47a-254f-4706-80f4-072d082a5e8b	11:00:00	MW	-1	3	1	Autumn2020	GSG201	2479-DR Marufa Akter	C3003-S
eb58f10d-c756-45a6-82f1-6acf89731a39	08:00:00	ST	-1	3	1	Autumn2020	GSG202	2392-PROF Imtiaz A. Hussain	C2002-S
ea6c46d9-66e7-4df7-b99d-b57f0b29a533	11:00:00	MW	0	0	1	Autumn2020	GSG203	2437-MR Hossain Ahmed Taufiq	C3006-S
86b36bc1-7809-409d-b334-cc1fce65212f	08:00:00	MW	-1	4	1	Autumn2020	GSG210	2392-PROF Imtiaz A. Hussain	C2002-S
997af785-ea8c-4876-823b-c6529de60b70	11:00:00	MW	-1	3	1	Autumn2020	GSG220	2480-MR Mohammad Ashab Uddin	C3007-S
0668b821-2054-41ab-89e0-692b350f710d	15:30:00	ST	0	0	1	Autumn2020	GSG306	2462-MR Md. Ohidujjaman	C3002-S
5f41573b-1da3-41d4-9ac6-80ac26840b05	15:30:00	MW	-1	4	1	Autumn2020	GSG310	2495-DR Shima Zaman	C4002-S
3f22d59e-d445-4cf8-9eb6-8a7a26c2153d	12:30:00	MW	-1	5	1	Autumn2020	GSG320	2480-MR Mohammad Ashab Uddin	C2007-S
f46ee7a7-56c5-468e-85be-7958003422ce	14:00:00	MW	-1	3	1	Autumn2020	GSG331	2469-MR Md. Amjad Hossain	C3003-S
3aaf29e1-94d6-4263-989a-d72f6606bf48	15:30:00	MW	-1	4	1	Autumn2020	GSG380	2479-DR Marufa Akter	C2006-S
d82fb05d-11a0-4a76-b413-d6d79faef806	11:00:00	ST	-1	6	1	Autumn2020	GSG387	2496-DR Shanawez Hossain	C3003-S
3ed49ed8-b7dc-4648-a6db-8c0f562a7a91	11:00:00	ST	-1	3	1	Autumn2020	GSG401	2479-DR Marufa Akter	C3006-S
515e00c4-acd6-4165-ad61-ed1d8c1e619f	15:30:00	MW	-1	3	1	Autumn2020	GSG440	2213-MS Jessica Tartila Suma	C2007-S
07388100-4fb6-43f0-99ee-5156ef31b9a6	12:30:00	ST	-1	3	1	Autumn2020	GSG480	2462-MR Md. Ohidujjaman	C2003-S
56d88464-fc49-430d-9673-024b11bf46c0	14:00:00	MW	-1	3	1	Autumn2020	GSG483	2437-MR Hossain Ahmed Taufiq	C3006-S
7b871fbd-1dbc-4609-92d1-5d39ff581d3a	17:00:00	ST	-1	1	1	Autumn2020	GSG499	2392-PROF Imtiaz A. Hussain	A4L04-S
49855748-431e-40d5-8e7a-b400f53bc6f2	08:00:00	ST	-1	40	1	Autumn2020	HEA101	5530-DR Shabareen Tisha	BC9014-S
19fcece0-0802-46cb-a264-a576b0f24bac	09:30:00	ST	-1	41	2	Autumn2020	HEA101	5530-DR Shabareen Tisha	BC9017-S
240edd8a-7074-49cb-9012-98af1a92c55a	08:00:00	MW	-1	40	3	Autumn2020	HEA101	5530-DR Shabareen Tisha	BC9014-S
816ba5f0-6c30-4ee8-b7e2-c0ab39c4b7f2	09:30:00	MW	-1	39	4	Autumn2020	HEA101	5530-DR Shabareen Tisha	BC9014-S
0d1b9ec9-4843-44b2-ab0b-78e747051d0b	08:00:00	ST	-1	39	5	Autumn2020	HEA101	5551-DR Khandaker Ezazul Haque	BC9017-S
cc2ab9bc-cd7e-4832-b7f3-dfda5f4b15e2	14:00:00	ST	-1	40	6	Autumn2020	HEA101	5557-MR Hasnain Sabih Nayak	BC7016-S
c2e1e640-f8a0-4c71-8efb-7dfb89d3f361	08:00:00	MW	-1	23	7	Autumn2020	HEA101	5557-MR Hasnain Sabih Nayak	BC9017-S
e90a4de6-80e7-4364-893b-c8a75e835e61	14:00:00	MW	-1	40	8	Autumn2020	HEA101	5551-DR Khandaker Ezazul Haque	BC10015-S
256602ca-5d8c-4ef2-9e7d-c2ae4c563c2f	09:30:00	ST	-1	40	9	Autumn2020	HEA101	5592-MR Humayun Kabir	BC10014-S
4f464f97-a83f-411d-a59e-c81be18d2f43	09:30:00	ST	-1	35	10	Autumn2020	HEA101	5557-MR Hasnain Sabih Nayak	BC10015-S
326db0ac-5f4d-41e6-a5b0-7a155c8c710b	09:30:00	ST	-1	39	11	Autumn2020	HEA101	5551-DR Khandaker Ezazul Haque	C4006-S
2e8b533f-bc4f-4095-a8d5-3ff2fb175feb	11:00:00	ST	-1	40	12	Autumn2020	HEA101	5585-MR Mohammad Arifuzzaman	BC10015-S
fa97c492-e9c9-4fa7-a889-15fe9914355f	15:30:00	ST	-1	49	1	Autumn2020	HRM301	3444-DR Ikramul Hasan	BC2012-S
22ca73bb-adee-4df9-991c-0fdae2784ff2	08:00:00	ST	-1	50	2	Autumn2020	HRM301	3413-MR Shafiqul Alam	BC2020-S
9741d2b7-2f5e-45f8-be4d-535cb3ea45b0	09:30:00	ST	-1	50	3	Autumn2020	HRM301	3413-MR Shafiqul Alam	BC3008-S
8f3f5eee-073b-4214-ba14-18ea0670e39a	17:00:00	MW	-1	51	4	Autumn2020	HRM301	3446-MS Bushra Sanjana	BC2011-S
06357583-7108-4ab9-8a78-d2443eea53cb	12:30:00	ST	B-0	0	5	Autumn2020	HRM301	T001-00 TBA TBA	BC2014-S
188bb3f3-ddc0-4462-b391-c7bbf8e22723	15:30:00	MW	-1	49	6	Autumn2020	HRM301	3446-MS Bushra Sanjana	BC2014-S
378d75c1-dda2-4590-9cdc-fdf98e549878	17:00:00	ST	B-0	0	7	Autumn2020	HRM301	T001-00 TBA TBA	BC2020-S
a1ea1cfb-ff8f-40ad-a774-7dbabaedda29	11:00:00	ST	-1	55	1	Autumn2020	HRM360	3444-DR Ikramul Hasan	BC2012-S
ce1ef8e9-d6f5-40b4-a2f8-57b931d7128e	08:00:00	MW	-1	58	2	Autumn2020	HRM360	3254-DR A.N.M. Shibly Noman Khan	BC2012-S
3d76441b-544e-4ae3-a97c-e1a57e219008	15:30:00	ST	-1	55	1	Autumn2020	HRM370	3446-MS Bushra Sanjana	BC2013-S
06eeef2b-cb48-40ea-b407-ef8051f32cf2	08:00:00	ST	-1	55	2	Autumn2020	HRM370	3254-DR A.N.M. Shibly Noman Khan	BC2021-S
d598e921-c936-4fe4-aef7-d5b7cc40c5dc	17:00:00	ST	-1	55	1	Autumn2020	HRM380	3626-MS Nujhat Anjum Ani	BC2021-S
f1999e88-2a93-4fb7-86d1-cfc107a26564	15:30:00	MW	-1	55	2	Autumn2020	HRM380	3413-MR Shafiqul Alam	BC2020-S
d315f07f-9820-4bbb-bfaf-b922b4f6a1e9	17:00:00	ST	-1	56	1	Autumn2020	HRM390	3446-MS Bushra Sanjana	BC3008-S
e425ccc9-fb9e-4efd-aced-d5b0574697ba	14:00:00	MW	-1	57	2	Autumn2020	HRM390	3413-MR Shafiqul Alam	BC2020-S
4b740f52-ca81-4e6c-a4ed-0b7dcb421af5	09:30:00	MW	-1	58	1	Autumn2020	HRM410	3254-DR A.N.M. Shibly Noman Khan	BC3008-S
12727f1e-933d-45e9-86fb-47eb3928b55d	17:00:00	MW	-1	60	1	Autumn2020	HRM460	3403-MR Awal Al Kabir	BC2012-S
22f52aec-03d6-4bf3-bd43-735aa8733307	12:30:00	MW	-1	60	2	Autumn2020	HRM460	3569-MR Abdullah Al Ahad	BC2014-S
bacd52c3-ce18-47c2-a240-02b83887cdef	11:00:00	ST	-1	46	1	Autumn2020	INB301	3539-MR SM Yusuf Mallick	BC2013-S
e9acc0cc-e425-48fe-8b1e-0809a26fadfe	09:30:00	ST	-1	35	2	Autumn2020	INB301	3193-MR Hanif Mahtab	BC3009-S
1401049d-aeeb-40ec-bd56-82c7807c8fb2	14:00:00	MW	-1	45	3	Autumn2020	INB301	3486-MR Hasan Md. Mahmood Ul Haque	BC2021-S
1d4abce3-d7a0-43df-93b0-da7c4c235221	12:30:00	MW	-1	45	4	Autumn2020	INB301	3448-MR Mehadi Mansur	BC2020-S
ad4fe65d-cef8-40b5-a1db-78d4c1550f38	17:00:00	ST	-1	34	5	Autumn2020	INB301	3512-MR Kazi Md. Jamshed	BC3009-S
375bf0fb-43d2-469a-b843-5f31516c1bb5	17:00:00	MW	-1	46	6	Autumn2020	INB301	3548-MS Papia Sultana	BC2013-S
ecab40a4-e2b4-4d71-9a16-5c675f74c2ac	15:30:00	ST	-1	34	7	Autumn2020	INB301	3486-MR Hasan Md. Mahmood Ul Haque	BC2014-S
5ca91119-effd-4acc-a9da-2b25238f1f76	08:00:00	ST	-1	45	8	Autumn2020	INB301	3584-MS Dhritiparna Kundu	BC3008-S
574ac6ed-0bfd-4bc2-992d-88287334be55	08:00:00	MW	B-0	0	9	Autumn2020	INB301	T001-00 TBA TBA	BC2013-S
84d1f5fd-24d9-4ab8-836d-eafade127926	11:00:00	MW	-1	49	1	Autumn2020	INB302	3539-MR SM Yusuf Mallick	BC3010-S
cd428df3-777d-40fb-ba0e-ad97d2167b41	14:00:00	ST	B-0	0	2	Autumn2020	INB302	T001-00 TBA TBA	BC3008-S
f21742ed-cea8-47bd-96cd-ed46be9b9cee	12:30:00	ST	-1	40	1	Autumn2020	INB303	3610-MR Md. Shah Newaz	BC3009-S
88091b57-a766-473b-8ad6-6763d7e6b830	09:30:00	MW	-1	41	2	Autumn2020	INB303	3486-MR Hasan Md. Mahmood Ul Haque	BC8015-S
42e7d2f0-63ca-4fee-8966-937f488b3e82	11:00:00	ST	-1	30	1	Autumn2020	INB304	3567-DR Raisul Awal Mahmood	BC2014-S
76480063-3ff4-4400-85c3-26ceabf3bafc	12:30:00	MW	-1	36	2	Autumn2020	INB304	3567-DR Raisul Awal Mahmood	BC2021-S
7dc4e63f-b91d-495c-81d8-c153d79a16e7	09:30:00	ST	-1	37	1	Autumn2020	INB403	3601-MR Md. Touhid Hossain	BC3010-S
55fc86d3-8b3d-4372-be09-2c2942d9aada	12:30:00	ST	-1	46	2	Autumn2020	INB403	3539-MR SM Yusuf Mallick	BC2020-S
ae965de5-cd7a-4916-81b8-0855fe1ed8d9	15:30:00	MW	-1	49	1	Autumn2020	INB405	3423-MR Arifur Rahman Khan	BC3012-S
0827749c-d4a4-439c-96d1-2caeb6822778	11:00:00	MW	B-0	0	2	Autumn2020	INB405	T001-00 TBA TBA	BC3011-S
3c46a53f-04f6-496c-bf32-d3be967f27e5	09:30:00	MW	-1	15	1	Autumn2020	LAW101	2445-MR Md Abdul Awal Khan	C6004-S
1e1e203c-03d1-47db-a388-44c35fecbd19	15:30:00	MW	-1	22	2	Autumn2020	LAW101	2445-MR Md Abdul Awal Khan	C4004-S
3ca57b72-38f3-4915-850d-293c4a8d192c	11:00:00	MW	-1	31	1	Autumn2020	LAW102	2338-MR Liton Chandra Biswas	C9002-S
0c8204d9-f1f8-46a5-aaa1-a0ebbbbd17bb	09:30:00	MW	B-0	0	2	Autumn2020	LAW102	T001-00 TBA TBA	C9002-S
f50e8d2b-0900-428f-a61a-51b05e272cc3	09:30:00	ST	-1	30	1	Autumn2020	LAW103	2428-DR Md Parvez Sattar	C4005-S
e41ec921-f253-4a58-b723-46944e06f7ef	11:00:00	ST	-1	33	2	Autumn2020	LAW103	2428-DR Md Parvez Sattar	C4004-S
8a2e08f2-aaba-4d3b-804c-dcc203715337	09:30:00	MW	-1	14	1	Autumn2020	LAW106	2338-MR Liton Chandra Biswas	C3002-S
9bf34546-b83c-4050-9b96-ea2a7b42579a	12:30:00	MW	-1	21	1	Autumn2020	LAW107	2391-MS Nabila Tahsin Farah	C2002-S
9dc0c3da-39f2-42b8-8414-f10c1b5b9872	11:00:00	MW	-1	17	1	Autumn2020	LAW108	2459-DR Assaduzzaman	C2007-S
b88c9ab6-cf63-4a87-8fc3-62050ae7669c	14:00:00	ST	-1	13	1	Autumn2020	LAW109	2338-MR Liton Chandra Biswas	C3002-S
bc8342ea-d33d-494b-8903-01d653c9e567	15:30:00	MW	-1	18	1	Autumn2020	LAW201	2433-DR Md. Mahbubur Rahman	C2002-S
6705a97a-fab1-4130-a5b0-c8f969d9d8c6	12:30:00	MW	-1	11	1	Autumn2020	LAW206	2445-MR Md Abdul Awal Khan	C2003-S
4d99aa6e-292d-402b-bff5-d32dc68853f8	15:30:00	MW	-1	21	1	Autumn2020	LAW207	2391-MS Nabila Tahsin Farah	C2003-S
98a52a94-619f-4396-8b33-121468b72b6a	15:30:00	ST	-1	18	1	Autumn2020	LAW208	2338-MR Liton Chandra Biswas	C2003-S
4784548c-eec9-457c-a575-2e9366900fce	12:30:00	ST	-1	21	1	Autumn2020	LAW301	2391-MS Nabila Tahsin Farah	C2002-S
d02a6ab8-7f43-4a0e-8e88-ae78dacfcff8	09:30:00	ST	-1	21	1	Autumn2020	LAW302	2459-DR Assaduzzaman	C3003-S
4a652a27-7006-4790-94f1-cda7e26d0c47	15:30:00	ST	-1	4	1	Autumn2020	LAW304	2391-MS Nabila Tahsin Farah	C2006-S
c1b24f64-3de2-4790-8818-95daad81c04b	11:00:00	ST	-1	26	1	Autumn2020	LAW307	2459-DR Assaduzzaman	C2007-S
595aea8d-084b-4e34-a463-b68278a72b45	14:00:00	MW	-1	18	1	Autumn2020	LAW308	5271-DR Arif Jamil	C3002-S
81db673f-5604-4a3d-99d8-143c9c5d6748	09:30:00	MW	-1	9	1	Autumn2020	LAW407	2428-DR Md Parvez Sattar	C3003-S
ca84bda9-bdde-40c7-9682-57b4d6e1d6c0	17:00:00	MW	-1	12	1	Autumn2020	LAW409	2432-DR Md. Nazmuzzaman Bhuiyan	C2002-S
07e68c32-9f84-43c7-97ff-e90efb6d34c0	08:00:00	A	-1	23	1	Autumn2020	LFE201	4376-MR Sanzar Adnan Alam	FT-S
c6dd39c2-1097-496f-a99e-60024c295caa	09:30:00	A	-1	33	2	Autumn2020	LFE201	5207-MR Tanvir Ahmed Haroon	FT-S
799e4b85-293b-4310-8fae-8af483d2a998	11:00:00	A	-1	34	3	Autumn2020	LFE201	6055-DR Rashed Noor	FT-S
960f9b15-5314-413a-b45a-7255753b2f99	12:30:00	A	-1	34	4	Autumn2020	LFE201	3369-MR Khawaja Saifur Rahman	FT-S
d8af4b8c-9d94-4e69-b12d-c20f0ed5766c	14:00:00	A	-1	33	5	Autumn2020	LFE201	3358-MR Mr. Iftekhar Mahfuz	FT-S
39ccf2c6-a976-4f76-bea0-95d0cf2231ac	15:30:00	A	-1	33	6	Autumn2020	LFE201	3413-MR Shafiqul Alam	FT-S
672a21ac-0731-48f2-8c6d-fb7557e2a9a2	17:00:00	A	-1	33	7	Autumn2020	LFE201	3539-MR SM Yusuf Mallick	FT-S
fc597919-163d-47d2-a21a-b32bd665c6d3	17:00:00	F	-1	33	8	Autumn2020	LFE201	4378-DR Md. Readul Mahmud	FT-S
7e977a79-fee9-46a1-ab7f-eb8283347cc2	14:00:00	ST	-1	1	1	Autumn2020	LIN311	2106-MR Towhid Bin Muzaffar	C2003-S
161fc0be-eff8-4d2b-b959-b62c56cff057	12:30:00	MW	-1	7	1	Autumn2020	LIN412	2439-MR Adilur Rahman	BC8014-S
48d0dd30-4776-4d54-b822-6d28cfa33460	12:30:00	ST	-1	39	1	Autumn2020	MAT100	4423-MS Nabila Jaman Tripti	BC5012-S
9d5867c1-9316-46b3-b5a9-dfde80ef174f	11:00:00	ST	B-0	0	2	Autumn2020	MAT100	4423-MS Nabila Jaman Tripti	BC5012-S
b2a2f649-69b4-4aa3-85a1-e5c3280e30fc	11:00:00	ST	-1	18	1	Autumn2020	MAT100A	4430-MR Ifte Khairul Alam Bhuiyan	BC5013-S
286df338-0fde-4166-a3e6-bfec9a3a9600	17:00:00	ST	B-0	0	1	Autumn2020	MAT101	4255-MS Zainab Lutfun Nahar	BC5012-S
c2c9a48a-2217-47c3-99fb-c4e2ced51b7a	17:00:00	MW	-1	50	2	Autumn2020	MAT101	4255-MS Zainab Lutfun Nahar	BC5012-S
acd366f2-6cba-40c9-bac7-75cf81a91a95	11:00:00	MW	-1	49	3	Autumn2020	MAT101	4419-MS Nurjahan Akter Nepa	BC5012-S
766061eb-60bc-4123-a313-3999057fe189	09:30:00	ST	-1	46	4	Autumn2020	MAT101	4423-MS Nabila Jaman Tripti	BC5012-S
30362bf0-03d2-4ff4-8492-b4681adfd7c2	14:00:00	MW	-1	47	5	Autumn2020	MAT101	4327-MS Amrita Khan	BC5012-S
de78dbcf-4fdf-40ed-9a32-dbc17d6d61de	09:30:00	MW	-1	48	6	Autumn2020	MAT101	4430-MR Ifte Khairul Alam Bhuiyan	BC5012-S
0142c275-11a7-4a6a-b82e-854282805f9e	12:30:00	MW	-1	52	7	Autumn2020	MAT101	4423-MS Nabila Jaman Tripti	BC5012-S
d3904b8f-b369-4c02-991e-6204d205c941	11:00:00	MW	B-0	0	8	Autumn2020	MAT101	4423-MS Nabila Jaman Tripti	BC5013-S
0adabb42-a065-440b-b836-1c7aff864fcb	15:30:00	MW	-1	50	9	Autumn2020	MAT101	4430-MR Ifte Khairul Alam Bhuiyan	BC5012-S
0dce8e3a-3c55-49df-bde6-2270bea7b95a	14:00:00	ST	-1	38	10	Autumn2020	MAT101	4327-MS Amrita Khan	BC5012-S
72cd4cc5-2229-4254-9a5c-389a4c1feb67	12:30:00	MW	-1	48	1	Autumn2020	MAT104	4378-DR Md. Readul Mahmud	BC5013-S
3e1eea73-527d-4adc-a652-0a9fc9969c60	08:00:00	MW	-1	51	2	Autumn2020	MAT104	4384-DR S N M Azizul Hoque	BC5012-S
78c38052-5b69-4e32-9485-67d4090c0093	14:00:00	MW	-1	34	3	Autumn2020	MAT104	4250-DR Asma Begum	BC5013-S
34b9ad3e-bba3-4bac-ab06-63af72a41615	09:30:00	ST	-1	40	4	Autumn2020	MAT104	4419-MS Nurjahan Akter Nepa	BC5013-S
e2a01bb7-d858-4a95-be58-46af11147044	09:30:00	MW	-1	29	5	Autumn2020	MAT104	4419-MS Nurjahan Akter Nepa	BC5013-S
be6d670c-5e92-499d-9398-0f4084fdde69	11:00:00	ST	-1	37	1	Autumn2020	MAT111	4419-MS Nurjahan Akter Nepa	BC5014-S
1d755fd7-aca0-408f-b587-c52f9eb6e760	09:30:00	ST	-1	45	1	Autumn2020	MAT121	4102-DR Mohammed Anwer	BC6008-S
eec84c30-5cdb-4604-95fa-c45b5c737fb5	11:00:00	ST	-1	49	2	Autumn2020	MAT121	4124-DR Shipra Banik	BC6007-S
527fb8a2-cd5e-47c0-8319-5d67066daadb	09:30:00	MW	-1	50	3	Autumn2020	MAT121	4246-MS Proma Anwar Khan	BC6007-S
8bdbd987-f0be-49fc-bc5a-db83c59c1617	11:00:00	MW	-1	50	4	Autumn2020	MAT121	4358-MR Mustafa Mohammad Shaky	BC6007-S
ea93885f-ec86-407e-a8d1-7a4415baba56	15:30:00	ST	-1	29	1	Autumn2020	MAT131	4431-DR Mohammad Nazrul Islam	BC5012-S
8c2edf33-933d-4762-a090-fcb82bfba183	11:00:00	ST	-1	4	1	Autumn2020	MAT201	4318-MS Tahmina Tabassum	C3007-S
037561ba-1063-45dd-b5bd-215807e6fdf3	09:30:00	MW	-1	15	1	Autumn2020	MAT203	4318-MS Tahmina Tabassum	BC5014-S
8371d7a0-d75d-42c6-8b26-279715cf26fd	09:30:00	ST	-1	50	2	Autumn2020	MAT203	4119-MS Dr. Rifat Ara Rouf	BC5014-S
60e111eb-4aa7-43a9-bc9a-3bc51a9c9368	14:00:00	ST	-1	49	1	Autumn2020	MAT210	4312-MS Purobi Rani Kundu	BC5013-S
77327146-76ad-40cb-8c48-43f4677d3b5b	15:30:00	ST	-1	42	1	Autumn2020	MAT211	4378-DR Md. Readul Mahmud	BC5013-S
f6e023c7-19e3-4273-8196-5379dc21af81	08:00:00	ST	-1	20	2	Autumn2020	MAT211	4246-MS Proma Anwar Khan	BC5012-S
54612dd1-e7eb-4749-a39f-51e63c047c90	11:00:00	MW	-1	43	3	Autumn2020	MAT211	4246-MS Proma Anwar Khan	BC5014-S
ebcc313d-d135-446b-bc90-7caa12e0e9e0	14:00:00	ST	-1	50	4	Autumn2020	MAT211	4124-DR Shipra Banik	BC5014-S
e1ccaa70-6f4b-46ad-b138-40ad7646babf	14:00:00	MW	-1	26	5	Autumn2020	MAT211	4124-DR Shipra Banik	BC5014-S
65b41e4c-e1f5-4d59-a00f-a95371e30a4d	09:30:00	ST	-1	49	6	Autumn2020	MAT211	4246-MS Proma Anwar Khan	BC6007-S
5edbf5e2-cebf-4d07-a754-ff09d4ac2c72	12:30:00	MW	-1	49	7	Autumn2020	MAT211	4384-DR S N M Azizul Hoque	BC5014-S
98410eef-7a18-4527-9ee8-b87e72fc7818	09:30:00	MW	-1	11	1	Autumn2020	MAT213	4308-PROF Laek Sazzad Andallah	BC6008-S
d52d9217-c087-4966-b38d-1ff5e43da243	11:00:00	MW	-1	1	1	Autumn2020	MAT215	4318-MS Tahmina Tabassum	C4003-S
87511fa1-09f4-480b-bf02-9b8b039ec5db	17:00:00	MW	-1	5	1	Autumn2020	MAT221	4310-PROF Md. Abu Naim Sheikh	BC5013-S
6e8e1cc8-25e3-473a-9852-5f3f8d0aacef	09:30:00	ST	-1	21	1	Autumn2020	MAT230	4318-MS Tahmina Tabassum	BC6009-S
5a2b93ee-d75e-4326-a667-9e3848a6be0b	12:30:00	ST	-1	53	2	Autumn2020	MAT230	4119-MS Dr. Rifat Ara Rouf	BC5013-S
29d0dd4f-b91e-415f-9898-16d8faa661dd	11:00:00	ST	-1	9	1	Autumn2020	MAT251	4338-PROF M Arshad Momen	C4002-S
635fc792-8951-44d4-b9ed-8eef56f561ce	09:30:00	MW	-1	2	1	Autumn2020	MAT305	4102-DR Mohammed Anwer	C3007-S
7704434e-73c9-42f5-a3e0-43b810915e16	14:00:00	T	-1	2	1	Autumn2020	MAT350L	4228-DR Habib Bin Muzaffar	C6003-S
a83f5e5d-f137-40ea-9ef9-8c8a3214fdc5	11:00:00	M	-1	2	1	Autumn2020	MAT399L	4124-DR Shipra Banik	C4006-S
57bacb66-8d69-4c18-b711-72ff5aea4f03	14:00:00	MW	-1	8	1	Autumn2020	MAT401	4228-DR Habib Bin Muzaffar	C3007-S
5c54deb6-6d87-4b5c-8b94-eb31d0474884	12:30:00	MW	-1	19	1	Autumn2020	MAT403	4223-MR Mr. Md. Shariful Islam	BC9015-S
fb64137e-e15e-4983-8663-434d768b4ec0	17:00:00	MW	-1	7	1	Autumn2020	MAT463	4338-PROF M Arshad Momen	C4002-S
092cbdd8-9dab-4e95-b38b-3d2b93af3af2	14:00:00	ST	-1	15	1	Autumn2020	MCB101	6010-MS Tasnimul Ferdous	BC10017-S
a43e1cde-9b99-4fd1-872d-e042a67ac9e2	12:30:00	ST	-1	22	1	Autumn2020	MCB102	6009-DR Ashrafus Safa	BC10017-S
58025282-b179-4f26-bc11-6a2b4c4e41f7	12:30:00	ST	B-0	0	1	Autumn2020	MCB103	T001-00 TBA TBA	BC9016-S
5b79fd63-1dbf-47e9-a449-55a1fb5991d7	11:00:00	R	B-0	0	1	Autumn2020	MCB103L	T001-00 TBA TBA	BC4017A-S
3ed1a936-0e41-43cd-b269-8b3a513dd0dc	17:00:00	ST	-1	10	1	Autumn2020	MCB201	6055-DR Rashed Noor	BC10017-S
f0b088fb-0278-4574-be76-8c70a270035e	15:30:00	ST	-1	6	1	Autumn2020	MCB202	6009-DR Ashrafus Safa	BC10017-S
3887248f-e528-4b72-9770-96c76c42c9c3	14:00:00	MW	-1	14	1	Autumn2020	MCB204	6055-DR Rashed Noor	BC10017-S
0a3a314a-7685-4188-b3f5-de68a377ac02	08:00:00	ST	-1	2	1	Autumn2020	MCB210	6013-MS Noshin Azra Rahman	C2006-S
280f4406-2c60-4c5a-be72-82091eb048da	09:30:00	ST	-1	8	1	Autumn2020	MCB302	6033-DR Jebunnahar Khandakar	C4002-S
19c22932-2018-42af-aba9-fd72df40dcb2	11:00:00	MW	-1	8	1	Autumn2020	MCB303	6010-MS Tasnimul Ferdous	BC4014-S
8990ba5c-9e04-400e-949e-90ae73855aaf	12:30:00	R	0	8	1	Autumn2020	MCB303L	6010-MS Tasnimul Ferdous	BC4017A-S
1784b344-890e-4307-bc6d-d7ff2aef1350	12:30:00	MW	-1	14	1	Autumn2020	MCB305	6010-MS Tasnimul Ferdous	BC9016-S
b52b7acc-c46f-4ee5-ad75-da10512a17f0	11:00:00	ST	-1	9	1	Autumn2020	MCB306	6058-DR Shah M Faruque	BC10017-S
e1d98fbf-49e0-4ad5-b481-9d76faa8f71e	15:30:00	MW	-1	15	1	Autumn2020	MCB307	6033-DR Jebunnahar Khandakar	BC9016-S
5af92123-e454-4cf9-bfcc-c1712aa5364a	15:30:00	ST	-1	8	1	Autumn2020	MCB309	6013-MS Noshin Azra Rahman	C3004-S
97846636-82c7-48f4-a201-3fc2cc34a7bd	14:00:00	MW	-1	9	1	Autumn2020	MCB310	6013-MS Noshin Azra Rahman	C4003-S
14a84232-f20d-465e-a0fa-e29de2f85a69	15:30:00	MW	B-0	0	1	Autumn2020	MCB311	T001-00 TBA TBA	BC4017A-S
29791d79-0824-4902-beb3-cb859a278dcf	09:30:00	MW	-1	8	1	Autumn2020	MCB401	6013-MS Noshin Azra Rahman	BC9015-S
e090c0bf-e721-499a-b901-15c1258e3f95	17:00:00	MW	-1	12	1	Autumn2020	MCB403	6033-DR Jebunnahar Khandakar	BC9016-S
bcfa26a1-3709-4ffc-9dca-a0239d52c47a	14:00:00	ST	-1	24	1	Autumn2020	MCB405	6055-DR Rashed Noor	BC9016-S
22e3ca68-bc72-49d8-942f-21a06f706177	09:30:00	ST	-1	12	1	Autumn2020	MCB407	6009-DR Ashrafus Safa	C4003-S
fe979346-9621-4179-8a48-1df82409391b	17:00:00	ST	-1	12	1	Autumn2020	MCB409	6013-MS Noshin Azra Rahman	BC4013-S
32cd214e-89dd-48e7-a3fd-b5ca304397b6	09:30:00	MW	-1	9	1	Autumn2020	MCB410	6002-MR Syed A. K. Shifat Ahmed	C4002-S
cff47ebf-a94e-4c02-b732-0cd19e613e0c	11:00:00	ST	B-0	0	1	Autumn2020	MCB411	T001-00 TBA TBA	BC4017A-S
07f4f715-6daa-486a-b606-6bc86b00eb3d	08:00:00	R	B-0	0	1	Autumn2020	MCB450	6058-DR Shah M Faruque	BC4017A-S
0e6eff23-94bf-4e03-9b3b-148aecc26bd9	09:30:00	R	-1	2	2	Autumn2020	MCB450	6055-DR Rashed Noor	BC4017A-S
ab8726ba-d2ec-43f8-a2fd-d1b680b33127	11:00:00	F	B-0	0	3	Autumn2020	MCB450	6009-DR Ashrafus Safa	BC4017A-S
fcfca728-1373-410f-a67b-a08c6c1787a6	12:30:00	F	B-0	0	4	Autumn2020	MCB450	T001-00 TBA TBA	BC4017A-S
0404b176-bcd2-4f7b-9c75-a75ac646268c	15:30:00	R	B-0	0	5	Autumn2020	MCB450	6002-MR Syed A. K. Shifat Ahmed	BC4017A-S
a4b4763a-01cc-4df0-b11b-7852e7c8b323	15:30:00	F	-1	1	6	Autumn2020	MCB450	6010-MS Tasnimul Ferdous	BC4017A-S
152d1e0a-be38-4b9e-bf8c-4d997fdf005f	17:00:00	F	-1	1	7	Autumn2020	MCB450	6013-MS Noshin Azra Rahman	BC4017A-S
573b2006-7160-43d5-a9a6-8f86c3eb095a	08:00:00	R	B-0	0	1	Autumn2020	MCB451	T001-00 TBA TBA	BC4017B-S
41106ff3-9e90-445b-89f9-18f928718d52	09:30:00	F	-1	2	2	Autumn2020	MCB451	6055-DR Rashed Noor	BC4017B-S
c1c9ce3c-37fe-4588-b2df-143ce0d35e56	11:00:00	F	B-0	0	3	Autumn2020	MCB451	T001-00 TBA TBA	BC4017B-S
f5c4d8c3-49c7-4576-ae2e-3adcb167548d	12:30:00	F	-1	4	4	Autumn2020	MCB451	6033-DR Jebunnahar Khandakar	BC4017B-S
630be71f-ec4f-43ed-8579-4179f6e9a572	15:30:00	R	B-0	0	5	Autumn2020	MCB451	T001-00 TBA TBA	BC4017B-S
ec90a9a1-d0af-48a7-ac55-fdaa5a4ac24b	15:30:00	F	-1	2	6	Autumn2020	MCB451	6013-MS Noshin Azra Rahman	BC4017B-S
98f84376-4b47-4855-b954-d43d4a917632	17:00:00	F	-1	1	7	Autumn2020	MCB451	6010-MS Tasnimul Ferdous	BC4017B-S
c9c33697-1caf-45ee-8175-6b2e33ab62b5	08:00:00	MW	-1	45	1	Autumn2020	MGT201	3251-MS Farzana Chowdhury	BC2014-S
53d1df8d-ef8c-48f0-9f7f-4ceab3a21745	11:00:00	MW	-1	47	2	Autumn2020	MGT201	3251-MS Farzana Chowdhury	BC2013-S
304ba4eb-170c-4c6c-9f42-e1fe5f08353e	12:30:00	ST	-1	45	3	Autumn2020	MGT201	3358-MR Mr. Iftekhar Mahfuz	BC2021-S
e6bf7ba2-8865-41af-9fce-d5b80a9916a2	15:30:00	MW	-1	45	4	Autumn2020	MGT201	3358-MR Mr. Iftekhar Mahfuz	BC2021-S
3f6a1d01-57c4-421f-8634-315ab58d735d	14:00:00	ST	-1	46	5	Autumn2020	MGT201	3428-DR Dr. Nazmunnessa Mahtab	BC2012-S
62c5cf89-46f5-4612-ba31-5715cb106429	09:30:00	MW	-1	45	6	Autumn2020	MGT201	3525-MS Afnan Ashfaque	BC3009-S
2585a6b4-163b-4688-9dc0-2651eee9db0b	17:00:00	MW	-1	44	7	Autumn2020	MGT201	3323-MS Qantara Khaleda Khan	BC2020-S
b0a5b630-93f6-4392-abe2-d1fe5ebe39fe	15:30:00	MW	-1	30	1	Autumn2020	MGT301	3428-DR Dr. Nazmunnessa Mahtab	BC4012-S
c54e4055-7b26-4402-b5f1-dead5a24a114	15:30:00	ST	-1	46	1	Autumn2020	MGT330	3528-MR Md. Mamunur Rashid	BC2020-S
0d287f14-1aab-4e21-a027-289a0ae1b1f5	09:30:00	MW	-1	47	2	Autumn2020	MGT330	3606-DR Md. Kharshiduzzaman	BC3010-S
539b5e39-a987-4a59-a896-7a1b65ac52b8	11:00:00	ST	-1	47	3	Autumn2020	MGT330	3579-MS Seeratus Sabah	BC2020-S
f8a0efac-8706-46e7-804f-a560c44fda61	09:30:00	ST	-1	48	4	Autumn2020	MGT330	3615-DR Md. Mamun Habib	BC3011-S
c23265d6-0c09-404a-a3b9-a8710e3648d6	08:00:00	MW	-1	47	5	Autumn2020	MGT330	3573-DR Ziaul Haq Adnan	BC2020-S
8599c0ae-c168-42f9-8101-156218d8c363	11:00:00	MW	B-0	0	6	Autumn2020	MGT330	T001-00 TBA TBA	BC2014-S
3cd6d2b8-1c20-43f2-8d9c-723116b4ab87	15:30:00	ST	-1	36	1	Autumn2020	MGT340	3135-DR Abul Bashar	BC4012-S
a8d28bb1-0a72-4783-9f51-554af8a25c96	09:30:00	MW	-1	19	1	Autumn2020	MGT450	3573-DR Ziaul Haq Adnan	C5004-S
eb60413f-869f-4c13-985b-f93ccc8e2341	08:00:00	ST	-1	50	1	Autumn2020	MGT490	3193-MR Hanif Mahtab	BC3009-S
3fd52db4-9118-4562-a69b-e769c817f027	12:30:00	MW	-1	50	2	Autumn2020	MGT490	3358-MR Mr. Iftekhar Mahfuz	BC3009-S
0fcc7807-07ff-4988-adf0-998f334f9434	11:00:00	MW	-1	50	3	Autumn2020	MGT490	3513-PROF Dr. Aminul Karim	BC2020-S
49ebc7ff-c3c6-4bec-9086-15e8e496c5ba	14:00:00	ST	-1	50	4	Autumn2020	MGT490	3614-MR Md. Mujibul Hoque	BC2013-S
42b74093-61d3-40b3-9ea8-26120c342f48	12:30:00	ST	-1	49	5	Autumn2020	MGT490	3486-MR Hasan Md. Mahmood Ul Haque	BC3008-S
047c5a1d-816c-44f1-a831-3db997601ccc	14:00:00	MW	-1	51	6	Autumn2020	MGT490	3403-MR Awal Al Kabir	BC3008-S
efe0cf03-8d6e-40aa-ac7d-c93958d6e1fc	09:30:00	MW	-1	40	1	Autumn2020	MIS341	3542-MR Md. Aminul Islam	BC6013-S
05593c9f-c1aa-4a3d-a778-5e6142e71ceb	17:00:00	MW	-1	42	1	Autumn2020	MIS401	3620-DR Zoha Rahman	BC2021-S
738f81df-1ad6-4f32-8fc3-944e713cd7d9	15:30:00	MW	-1	33	1	Autumn2020	MIS405	3605-DR Mohammad Anisur Rahman	BC7016-S
26a97f09-2bb9-4c55-80e7-7a69fa9271f3	09:30:00	ST	-1	40	1	Autumn2020	MIS430	3542-MR Md. Aminul Islam	BC4010-S
2804f2e0-77e9-4fa0-b4ff-0c88cc7c1931	11:00:00	MW	-1	48	1	Autumn2020	MIS442	3566-DR Rezwanul Alam	BC3009-S
e355e6ea-c954-4349-b140-54fd4f0ada3a	08:00:00	ST	-1	49	2	Autumn2020	MIS442	4375-MR Mustafa Nizamul Aziz	BC3011-S
1bc0f901-8160-4c98-a282-fce7b07f729c	15:30:00	ST	-1	49	3	Autumn2020	MIS442	3423-MR Arifur Rahman Khan	BC3009-S
4e860053-b6a6-4f72-90c4-f0056bf9895e	14:00:00	MW	-1	48	4	Autumn2020	MIS442	3423-MR Arifur Rahman Khan	BC3011-S
39057202-a0c0-408c-8cda-96f83a32bc82	15:30:00	MW	-1	48	5	Autumn2020	MIS442	3542-MR Md. Aminul Islam	BC3010-S
2b8edcd0-cbfb-4b8b-a478-5953b87effca	11:00:00	ST	-1	49	6	Autumn2020	MIS442	3542-MR Md. Aminul Islam	BC3009-S
723bffa5-d0a7-4b27-8d40-05e1c5816996	14:00:00	ST	-1	48	7	Autumn2020	MIS442	3542-MR Md. Aminul Islam	BC2020-S
990e29ec-399f-408e-b417-08a1be05b08f	09:30:00	ST	-1	48	8	Autumn2020	MIS442	4375-MR Mustafa Nizamul Aziz	BC7015-S
3816b31a-99e2-4f00-86a4-d1a720da1919	17:00:00	MW	-1	49	9	Autumn2020	MIS442	3605-DR Mohammad Anisur Rahman	BC3012-S
28f8e3c4-d844-4b00-afa9-cfb987983002	14:00:00	MW	-1	26	1	Autumn2020	MIS455	3566-DR Rezwanul Alam	BC3012-S
1bb1cc9d-5032-4071-8d92-0cd58cb86239	12:30:00	ST	-1	41	1	Autumn2020	MIS465	3423-MR Arifur Rahman Khan	BC3010-S
b62b4319-ec7c-4a2c-a1a3-3f7871cc1f97	15:30:00	MW	-1	50	1	Autumn2020	MKT201	3329-MR Abul Khair Jyote	BC3008-S
44630728-5caa-4e39-b5cc-ebfe63a15d41	12:30:00	MW	-1	50	2	Autumn2020	MKT201	3406-MS Zakia Binte Jamal	BC3010-S
0f80edc3-d6d8-4c76-bbf2-9a11df1d20ae	15:30:00	ST	-1	50	3	Autumn2020	MKT201	3406-MS Zakia Binte Jamal	BC2021-S
c3e757cb-b99d-4afe-a5f7-12f6170d3465	11:00:00	MW	-1	50	4	Autumn2020	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC2021-S
95abc101-aca2-4f30-803b-1093758fd4c6	08:00:00	MW	-1	50	5	Autumn2020	MKT201	3583-MR Sheikh Mohammad Fauzul Azim	BC2021-S
a23d9191-a1b0-4df4-9705-b1c7da1b5360	14:00:00	MW	-1	50	6	Autumn2020	MKT201	3318-MR Suman Prosad Saha	BC3009-S
17282c15-0477-496e-af5f-3eb4939e07b8	09:30:00	ST	-1	50	7	Autumn2020	MKT201	3329-MR Abul Khair Jyote	BC3012-S
e6dada7a-0098-4328-a42d-adb9e96512fc	11:00:00	MW	-1	45	1	Autumn2020	MKT302	3318-MR Suman Prosad Saha	BC3008-S
adac7d1a-2790-40f7-9497-da0c9c4d10ef	08:00:00	ST	-1	41	2	Autumn2020	MKT302	3583-MR Sheikh Mohammad Fauzul Azim	BC3010-S
73cd6cb1-651c-4135-bff6-ccfaf5756b11	14:00:00	MW	-1	46	3	Autumn2020	MKT302	3557-DR Shamsun Nahar Momotaz	BC3010-S
310f021e-88e3-479f-9a12-d8ebfc5346df	15:30:00	ST	-1	31	1	Autumn2020	MKT330	3557-DR Shamsun Nahar Momotaz	BC3010-S
ea70e459-3914-4314-b7df-274d2c5a1893	12:30:00	MW	-1	39	1	Autumn2020	MKT340	3583-MR Sheikh Mohammad Fauzul Azim	BC3011-S
2ae4c13c-202f-48c5-b344-ef31de5a39f2	17:00:00	ST	-1	46	2	Autumn2020	MKT340	3406-MS Zakia Binte Jamal	BC3010-S
67a6a31c-b3cf-46f7-97c0-99e7cd215b1c	11:00:00	ST	-1	44	3	Autumn2020	MKT340	3329-MR Abul Khair Jyote	BC2021-S
c08dd26e-8e65-42dc-936d-4f6399b035e4	11:00:00	ST	-1	42	1	Autumn2020	MKT350	3583-MR Sheikh Mohammad Fauzul Azim	BC3008-S
88634cdf-dd86-4839-a8cf-79b4e3ca9b28	15:30:00	MW	-1	45	2	Autumn2020	MKT350	3318-MR Suman Prosad Saha	BC3009-S
f0053a20-fe08-4ad1-9e06-18231ecab928	09:30:00	MW	-1	45	3	Autumn2020	MKT350	3557-DR Shamsun Nahar Momotaz	BC3011-S
40e5834c-a27b-4f22-ad00-c6fa28879f87	17:00:00	ST	-1	37	1	Autumn2020	MKT380	3318-MR Suman Prosad Saha	BC3011-S
5581352e-cd22-458c-adfa-c71e9bd2fb61	14:00:00	ST	-1	45	1	Autumn2020	MKT401	3329-MR Abul Khair Jyote	BC2014-S
85876cdc-3b8a-4165-97f3-9ec0eec65115	09:30:00	MW	-1	44	2	Autumn2020	MKT401	3539-MR SM Yusuf Mallick	BC10018-S
bae3d366-5bf4-47b0-8bf9-1c18f2809cf1	15:30:00	MW	-1	40	1	Autumn2020	MKT460	3406-MS Zakia Binte Jamal	BC8015-S
f86d6e94-06e9-4e84-99d2-e3033f0be120	17:00:00	MW	-1	45	1	Autumn2020	MKT470	3406-MS Zakia Binte Jamal	BC2014-S
85ee4533-d43d-4e6b-8e13-d2741a162e17	09:30:00	MW	-1	31	1	Autumn2020	MKT481	3185-MR Mohammed Sohel Islam	BC3012-S
167cc57b-9f2c-4096-9768-c4d3ff7b7755	15:30:00	ST	-1	46	2	Autumn2020	MKT481	3318-MR Suman Prosad Saha	BC3008-S
a988d32f-e6c7-4cab-b7d0-ee68e2e14ffd	14:00:00	MW	-1	32	3	Autumn2020	MKT481	3329-MR Abul Khair Jyote	BC4013-S
268c5f67-94e3-4272-af47-8a83430f729b	09:30:00	ST	-1	36	1	Autumn2020	MUS101	2397-DR Shahnaz Nasrin	BC7002-S
fadcc1b5-2963-4dc1-a7c5-b31e8ed5460f	09:30:00	MW	-1	24	2	Autumn2020	MUS101	2404-MR Shohail Rayhan Muhammad Tarek	BC7002-S
b7e543eb-4eeb-452f-bf60-25113c4912f6	11:00:00	ST	-1	50	3	Autumn2020	MUS101	2397-DR Shahnaz Nasrin	BC3002-S
07255b14-97a6-4288-b8f1-300aac439647	12:30:00	ST	-1	11	1	Autumn2020	MUS102	2397-DR Shahnaz Nasrin	BC7002-S
2673f657-ee8a-4717-9c00-0d2bb518ddb4	17:00:00	MW	-1	50	1	Autumn2020	NCH101	2389-DR Ranjan Saha Partha	BC5002-S
d3845220-7110-4f88-86b3-78814351d658	08:00:00	ST	-1	50	2	Autumn2020	NCH101	2403-MR Mohammad Masud Rana	BC7002-S
bf7743bb-2b27-46e1-97f5-2d3d36b1be43	09:30:00	ST	-1	52	3	Autumn2020	NCH101	2403-MR Mohammad Masud Rana	BC5002-S
d6532b3f-f458-45b8-ab46-be35ac2e587a	14:00:00	ST	-1	51	4	Autumn2020	NCH101	2424-MS Samia Hemayet Diba	BC3002-S
1774acfc-9b97-4b57-8010-13a5bf2eca60	15:30:00	ST	-1	50	5	Autumn2020	NCH101	2424-MS Samia Hemayet Diba	BC7002-S
bd877407-53e0-4b9e-85ba-e789349c2647	08:00:00	R	B-0	0	1	Autumn2020	PHA100	T001-00 TBA TBA	BC3015F-S
c63dd43e-fd0c-455c-a266-773e2ef35b5c	09:30:00	R	B-0	0	2	Autumn2020	PHA100	T001-00 TBA TBA	BC3015F-S
d180392d-c51b-4855-a507-cc7fa2d4edd9	11:00:00	R	B-0	0	3	Autumn2020	PHA100	T001-00 TBA TBA	BC3015F-S
944ad1a5-abe4-425b-904d-61011c80466b	12:30:00	R	B-0	0	4	Autumn2020	PHA100	T001-00 TBA TBA	BC3015F-S
249d3b35-3d6e-4c31-9ef3-1b6cbfe4f8c3	12:30:00	ST	-1	22	1	Autumn2020	PHA101	5274-DR Md. Saiful Islam	C6005-S
765f2931-0173-4a4b-a79a-49c10951de42	08:00:00	MW	-1	14	2	Autumn2020	PHA101	5274-DR Md. Saiful Islam	BC9015-S
fdb67798-1afb-4abd-8042-550aa20c335d	09:30:00	R	B-0	0	3	Autumn2020	PHA101	5274-DR Md. Saiful Islam	C6005-S
92a4d4fe-e2f6-4d83-b4a5-70c697da75c4	11:00:00	R	B-0	0	4	Autumn2020	PHA101	T001-00 TBA TBA	C6004-S
d44718d9-3305-441a-9a17-63494d944dd3	11:00:00	A	-1	21	1	Autumn2020	PHA102	5260-MR Mehdi Bin Samad	BC9013-S
5d191c1b-70d3-4f17-a054-abcf64afb637	12:30:00	A	B-0	0	2	Autumn2020	PHA102	T001-00 TBA TBA	BCTBA1-S
ce245109-3b8f-4a16-bc2d-d74563d6619e	11:00:00	A	B-0	0	3	Autumn2020	PHA102	T001-00 TBA TBA	C6005-S
e03a1633-a437-488a-9f24-3d3eb30896a6	11:00:00	ST	-1	23	1	Autumn2020	PHA103	5280-DR Rajib Bhattacharjee	C6002-S
83170c64-9d5f-43ac-af07-867f8d16cd52	14:00:00	ST	-1	35	2	Autumn2020	PHA103	5280-DR Rajib Bhattacharjee	C5004-S
a68eec8e-dba9-4f6b-9249-9690bb493297	09:30:00	ST	-1	20	3	Autumn2020	PHA103	5268-MS Sarah Zaheen	C5004-S
5951438b-9fdc-421a-847c-f06d239707f8	14:00:00	MW	-1	25	4	Autumn2020	PHA103	5280-DR Rajib Bhattacharjee	BC9013-S
68880d29-b552-4fba-be35-8e7743a737f6	12:30:00	MW	B-0	0	5	Autumn2020	PHA103	T001-00 TBA TBA	C6002-S
6b8334da-e859-465c-a12b-43383d077e1c	08:00:00	ST	-1	20	6	Autumn2020	PHA103	5268-MS Sarah Zaheen	C6004-S
dc678211-d2a6-4671-88ec-32be5f4f4b5f	15:30:00	ST	-1	39	1	Autumn2020	PHA104	5283-DR Md. Raihan Sarkar	C6004-S
86b4d04a-a018-41fa-a0a6-38fd700baec8	17:00:00	ST	-1	30	2	Autumn2020	PHA104	5312-DR A. B. M. Mahfuz Ul Alam	C6004-S
beeb3659-004d-4639-81d8-f61253fc542f	08:00:00	MW	-1	36	3	Autumn2020	PHA104	5266-MR Md. Abdul Muhit	C6004-S
19f3eccc-af38-47c1-94f9-ba60aae152a1	17:00:00	MW	-1	35	4	Autumn2020	PHA104	5283-DR Md. Raihan Sarkar	C6004-S
11857acf-3878-4b3f-80fa-1dce576a0129	09:30:00	MW	B-0	0	5	Autumn2020	PHA104	T001-00 TBA TBA	C6003-S
17241981-6250-4afa-af3a-aed3eaa22e6d	12:30:00	ST	-1	38	1	Autumn2020	PHA105	5300-MS Mashmum Shababa Shahid	C6004-S
f61d9837-4635-4192-a041-4d7b955f1fca	14:00:00	ST	-1	23	2	Autumn2020	PHA105	5300-MS Mashmum Shababa Shahid	C6004-S
da3861d5-e7cd-4a5e-8ff9-053302a5b9cc	09:30:00	MW	-1	38	3	Autumn2020	PHA105	5288-DR Sheikh Zahir Raihan	C5007-S
6598b233-2abf-43eb-ae7a-591d78bf6214	15:30:00	MW	-1	30	4	Autumn2020	PHA105	5300-MS Mashmum Shababa Shahid	C6004-S
6d8f3de2-57d1-4a60-8bc9-71ba2d67b714	08:00:00	MW	-1	37	5	Autumn2020	PHA105	5288-DR Sheikh Zahir Raihan	C6005-S
aa3256fb-4438-4739-8cec-b05a355f65d3	17:00:00	ST	B-0	0	6	Autumn2020	PHA105	5306-MR Zobaer Al Mahmud	C6002-S
69a595f7-adf5-4b76-a718-9d9b6c15bcd6	09:30:00	ST	-1	45	1	Autumn2020	PHA106	5300-MS Mashmum Shababa Shahid	BC9013-S
ee7f6823-1313-4fda-98f3-3e5fad70a050	11:00:00	ST	-1	42	2	Autumn2020	PHA106	5300-MS Mashmum Shababa Shahid	BC9013-S
8a77d955-d44d-4e55-a9e5-e0f7928c3850	09:30:00	MW	-1	25	3	Autumn2020	PHA106	5300-MS Mashmum Shababa Shahid	BC9013-S
246b3ce9-5195-43ff-a486-b74c68f196d8	14:00:00	R	B-0	0	1	Autumn2020	PHA200	T001-00 TBA TBA	BC3015F-S
d8e6f9ad-b58f-469d-baba-9ee8698f8bd2	15:30:00	R	B-0	0	2	Autumn2020	PHA200	T001-00 TBA TBA	BC3015F-S
4e482a54-1a84-4b3b-a476-b66c9e4cd9bf	17:00:00	R	B-0	0	3	Autumn2020	PHA200	T001-00 TBA TBA	BC3015F-S
770a4f5e-9660-40e3-a1c0-f98936398c00	09:30:00	ST	-1	39	1	Autumn2020	PHA201	5261-MS Syeda Naureen Ahmed	C5005-S
36f74de7-95bf-4650-a276-02bda0039d45	15:00:00	F	-1	40	2	Autumn2020	PHA201	5309-DR Sitesh Chandra Bachar	C6004-S
846067ca-3411-4c6b-afbf-d506f5329283	15:30:00	MW	B-0	0	3	Autumn2020	PHA201	T001-00 TBA TBA	BCTBA1-S
27c16828-6b67-4b15-81c5-0fd2f1c7d3de	17:00:00	MW	-1	42	4	Autumn2020	PHA201	5266-MR Md. Abdul Muhit	BC9013-S
89c26c4f-9023-4aff-9f44-728a18346604	14:00:00	ST	-1	37	1	Autumn2020	PHA202	5320-MR Md. Abdul Aziz	BC9013-S
3995d01a-387c-4c34-ba0d-620ce17d9526	15:30:00	MW	-1	24	2	Autumn2020	PHA202	5320-MR Md. Abdul Aziz	BC9013-S
c050d3a0-1952-48fd-bc79-77d94cd46654	11:00:00	ST	-1	36	3	Autumn2020	PHA202	5263-MR Abdullah Faruque	C6005-S
23e24042-d1a5-44d5-a896-9b3b82b4801e	09:30:00	ST	B-0	0	4	Autumn2020	PHA202	5263-MR Abdullah Faruque	C6002-S
f47853e4-8ce2-461b-ad4b-cff5b03ca558	09:30:00	ST	-1	34	1	Autumn2020	PHA203	5306-MR Zobaer Al Mahmud	C6005-S
e8ba89fc-36a3-4f62-9989-c1a781cf2d56	09:30:00	ST	B-0	0	2	Autumn2020	PHA203	T001-00 TBA TBA	C6003-S
d95bcadd-8cc9-4947-b724-fe713840a89c	09:30:00	MW	-1	40	3	Autumn2020	PHA203	5265-MS Saquiba Yesmine	C6005-S
a9eab8ea-d699-4df3-9a66-6d9500dffaa8	11:00:00	MW	-1	45	4	Autumn2020	PHA203	5265-MS Saquiba Yesmine	C6005-S
ddbfc716-2da0-455e-a739-b501fdb1c35a	08:00:00	ST	-1	43	1	Autumn2020	PHA204	5260-MR Mehdi Bin Samad	BC9013-S
b6408df6-5349-4afa-92d6-2fb417512f5b	14:00:00	MW	-1	22	2	Autumn2020	PHA204	5260-MR Mehdi Bin Samad	C6003-S
61e6d4d9-0fa4-41c6-8d20-610358d48d76	15:30:00	ST	-1	42	3	Autumn2020	PHA204	5260-MR Mehdi Bin Samad	BC9013-S
08235729-095e-4e89-9733-57c7e98b30a3	14:00:00	ST	-1	24	4	Autumn2020	PHA204	5264-MR Masum Shahriar	C6002-S
f9c87b94-1df8-4885-989a-e8c42ded1ae7	11:00:00	MW	-1	9	5	Autumn2020	PHA204	5260-MR Mehdi Bin Samad	BC9013-S
8f61882d-a280-4315-aec8-17a3897d056f	15:30:00	ST	-1	44	1	Autumn2020	PHA205	5320-MR Md. Abdul Aziz	C6005-S
15773e64-8821-4db9-b0a3-3739ba261988	17:00:00	ST	B-0	0	2	Autumn2020	PHA205	5320-MR Md. Abdul Aziz	C6005-S
95169fdc-2db5-431b-8d3d-e22750f5de54	17:00:00	MW	-1	33	3	Autumn2020	PHA205	5286-MR M. Salahuddin Bhuiya	C6005-S
8f6fe5a4-a950-4bd2-ae06-7cc448604162	09:00:00	A	-1	43	4	Autumn2020	PHA205	5320-MR Md. Abdul Aziz	C5004-S
1fba7acc-6c1c-4ac0-b247-63a6d7b8aa64	09:30:00	MW	B-0	0	1	Autumn2020	PHA206	T001-00 TBA TBA	C6002-S
5349be85-9ebf-47ac-b460-4e40d041125a	11:00:00	MW	-1	46	2	Autumn2020	PHA206	5300-MS Mashmum Shababa Shahid	C6004-S
c4b54f60-6df5-4361-804a-bd75a5e1c85a	08:00:00	MW	-1	37	3	Autumn2020	PHA206	5275-PROF Mohammad Mafruhi Sattar	BC9013-S
e6c7c90a-b024-4dff-ada4-5d1d188a183e	12:30:00	ST	-1	37	1	Autumn2020	PHA207	5289-MR Nazmus Saqueeb	BC9013-S
a22eb46f-6b35-465b-be1a-6a41c9f9c095	12:30:00	MW	-1	36	2	Autumn2020	PHA207	5289-MR Nazmus Saqueeb	BC9013-S
e7ffc5dd-d56f-4589-adea-1d13d95330ff	08:00:00	ST	-1	21	3	Autumn2020	PHA207	5262-MR M. Shahabuddin K. Choudhuri	C6003-S
7afd0371-11a0-426a-9285-a8ed8f518808	09:30:00	ST	-1	21	4	Autumn2020	PHA207	5262-MR M. Shahabuddin K. Choudhuri	C6006-S
7600c639-21e1-4620-8b65-846562fe26b5	14:00:00	MW	-1	34	1	Autumn2020	PHA208	5305-DR Muhammad Asaduzzaman	C6005-S
e3c2c1b0-e768-4308-a6d2-765e2f6ab2a7	15:30:00	MW	-1	30	2	Autumn2020	PHA208	5305-DR Muhammad Asaduzzaman	C6002-S
d64a8775-6cff-4566-8d59-d3428e263b4d	15:30:00	R	B-0	0	3	Autumn2020	PHA208	T001-00 TBA TBA	C6005-S
7059e363-424f-4d16-8e91-8dfbf144a5b9	11:00:00	A	-1	44	1	Autumn2020	PHA209	5307-DR Md. Selim Reza	C6004-S
8253565b-b9af-4053-acbe-9be613598b97	11:00:00	A	-1	34	2	Autumn2020	PHA209	5304-DR Md. Elias-Al- Mamun	C5005-S
0b4df7dd-c8bc-4332-b9ec-f85a7e9a9c70	14:00:00	MW	-1	10	3	Autumn2020	PHA209	5320-MR Md. Abdul Aziz	C6007-S
5cf0c04d-32c8-486f-8be6-09a01c1b47b0	08:00:00	R	B-0	0	1	Autumn2020	PHA300	T001-00 TBA TBA	BC3015E-S
7843902d-30b4-44f6-a068-c4ec970f6b35	09:30:00	R	B-0	0	2	Autumn2020	PHA300	T001-00 TBA TBA	BC3015D-S
1747d49a-e7cb-455b-9a6b-6163ca8d8a86	11:00:00	R	B-0	0	3	Autumn2020	PHA300	T001-00 TBA TBA	BC3015E-S
715ba72b-cf5e-4d04-85a4-ae5c999ec51f	17:00:00	MW	-1	37	1	Autumn2020	PHA301	5260-MR Mehdi Bin Samad	C6007-S
e40060c5-583b-49eb-9204-f4b1ffc9c687	08:00:00	MW	-1	6	2	Autumn2020	PHA301	5260-MR Mehdi Bin Samad	C6002-S
4cab2224-4bbd-4171-a54e-e25060944cbf	15:00:00	F	-1	31	1	Autumn2020	PHA302	5304-DR Md. Elias-Al- Mamun	C5004-S
816180d2-aa81-4ab1-9326-ce19cc0e447b	09:00:00	F	-1	50	1	Autumn2020	PHA303	5290-MR A. R. M. Zahidur Rahman	BC9013-S
239ea007-3d56-44b7-b2c0-fcbc477430a9	15:00:00	F	B-0	0	2	Autumn2020	PHA303	T001-00 TBA TBA	C6003-S
80c64d1a-b49d-4cba-9058-a61e98ea628b	17:00:00	ST	B-0	0	1	Autumn2020	PHA304	T001-00 TBA TBA	BC9013-S
7626c265-8175-49a3-b962-f0e3c99c5478	09:00:00	F	B-0	0	2	Autumn2020	PHA304	T001-00 TBA TBA	C6006-S
58825680-8ab2-4c58-bee2-e44ad37a3c10	09:30:00	MW	-1	34	1	Autumn2020	PHA305	5261-MS Syeda Naureen Ahmed	C5005-S
43c61a21-c82a-48ef-a415-bf4928b387a1	09:30:00	MW	-1	28	1	Autumn2020	PHA306	5254-PROF J M A Hannan	C6006-S
184bfec4-f427-4330-8480-251b0ec94c85	15:30:00	ST	-1	6	1	Autumn2020	PHA307	5306-MR Zobaer Al Mahmud	C6006-S
1edea7d9-fcd8-447d-9488-573402247c81	12:30:00	MW	-1	28	1	Autumn2020	PHA308	5280-DR Rajib Bhattacharjee	C6003-S
69e18d2f-5500-4d03-a3c7-4f9e3da27d70	08:00:00	MW	B-0	0	1	Autumn2020	PHA407	T001-00 TBA TBA	C6007-S
ac8ad286-2ab8-406f-a290-82a264baa25a	09:00:00	F	-1	21	1	Autumn2020	PHA410	5320-MR Md. Abdul Aziz	C6007-S
921e59d2-12b5-4ec7-858d-d08b4335e285	09:30:00	MW	-1	27	1	Autumn2020	PHL101	2307-MR Obydullah Al Marjuk	BC7016-S
298e5e5f-d36f-4893-9767-cd0248b2a863	11:00:00	ST	-1	15	2	Autumn2020	PHL101	2335-MS Parsa S. Sajid	BC7015-S
66ea9828-796f-40f2-8477-0c2f83879ffb	15:30:00	ST	-1	40	1	Autumn2020	PHY101	4250-DR Asma Begum	BC6008-S
a0c989cc-f6a4-4a9b-b4a1-87391180d403	09:30:00	MW	-1	40	2	Autumn2020	PHY101	4158-MR Dr. Farhad Alam	BC6012-S
bd7f8744-92a8-405d-80af-d1d32c88f62a	08:00:00	MW	-1	38	3	Autumn2020	PHY101	4429-DR Khan Muhammad Bin Asad	BC6008-S
18c8b22e-cda3-472e-a2a3-812b188c8cdc	11:00:00	ST	-1	39	4	Autumn2020	PHY101	4384-DR S N M Azizul Hoque	BC6012-S
d061985a-93ed-41c8-b0d1-b5916eed3900	14:00:00	MW	B-0	0	5	Autumn2020	PHY101	T001-00 TBA TBA	BC6013-S
74e6af86-db52-45c3-90b1-46705d9e607a	12:30:00	S	B-0	0	1	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
e45ae803-0aa6-4b82-9318-872e2a26767e	11:00:00	M	B-0	0	2	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
376fe1ab-18e4-404c-9edd-9ebb34c1d822	12:30:00	T	B-0	0	3	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
ed0a018b-1bd4-45f7-9927-42b25225599a	11:00:00	S	B-0	0	4	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
465bb24a-89ae-4b11-a83f-1ab813a785d0	12:30:00	M	B-0	0	5	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
6a574475-990a-4198-b917-78c340f6c17f	12:30:00	W	B-0	0	6	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
a3259a79-e034-45a4-933f-2718868f44bc	11:00:00	W	B-0	0	7	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
9b5bb641-0b7c-4b0d-8782-84acf9fa1842	14:00:00	S	B-0	0	8	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
1a255d0f-1ce3-4f4a-85b2-b7419bf48091	14:00:00	T	B-0	0	9	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
8f291c79-f085-44b9-8664-0bc8cc4942bc	14:00:00	M	B-0	0	10	Autumn2020	PHY101L	T001-00 TBA TBA	PLab-S
489f8063-89c8-4f96-9fcd-2098ec079bd9	14:00:00	W	-1	1	11	Autumn2020	PHY101L	4430-MR Ifte Khairul Alam Bhuiyan	PLab-S
3354a340-ad4c-4a7d-a655-7910d65a670c	12:30:00	MW	-1	40	1	Autumn2020	PHY102	4112-DR Mostafa Kamal	BC6013-S
b68e22e1-2c09-4fd2-9e0e-beed14e26035	14:00:00	ST	-1	30	2	Autumn2020	PHY102	4378-DR Md. Readul Mahmud	BC7015-S
fc0d39ae-fd02-4738-8835-de245ea9e619	12:30:00	ST	-1	40	3	Autumn2020	PHY102	4158-MR Dr. Farhad Alam	BC6009-S
948bce78-8e84-4c18-993b-d0598ab18717	15:30:00	MW	-1	32	4	Autumn2020	PHY102	4250-DR Asma Begum	BC6007-S
9a79f562-f388-4b32-a73c-305cbaa1ab2b	09:30:00	ST	-1	45	5	Autumn2020	PHY102	4429-DR Khan Muhammad Bin Asad	BC7026-S
0fb8faf2-2a56-40bd-833f-4391c3ab0346	11:00:00	S	B-0	0	1	Autumn2020	PHY102L	T001-00 TBA TBA	PLab2-S
a613f413-31a3-4e42-898f-383661b4c821	11:00:00	W	B-0	0	2	Autumn2020	PHY102L	T001-00 TBA TBA	PLab2-S
e3436210-d9d6-4e98-82a7-e56a43848751	12:30:00	T	B-0	0	3	Autumn2020	PHY102L	T001-00 TBA TBA	PLab2-S
c8c10b36-67c1-4495-b1e2-e7da3da3956a	09:30:00	S	B-0	0	4	Autumn2020	PHY102L	T001-00 TBA TBA	PLab2-S
7c737f12-ba01-4946-ace1-1811551a68ea	11:00:00	T	B-0	0	5	Autumn2020	PHY102L	T001-00 TBA TBA	PLab2-S
b1cdf8cf-e082-45fa-9881-48d21d51c4f5	12:30:00	S	B-0	0	6	Autumn2020	PHY102L	T001-00 TBA TBA	PLab2-S
209131d3-73d2-4484-b643-c62cb8b21134	12:30:00	M	B-0	0	7	Autumn2020	PHY102L	T001-00 TBA TBA	PLab2-S
5047a007-28ef-4b04-911a-5ee00f1f8c4d	12:30:00	ST	-1	23	1	Autumn2020	PHY111	4327-MS Amrita Khan	BC6012-S
7ad820f1-6c1e-4160-8bea-23939560f560	12:30:00	MW	B-0	0	2	Autumn2020	PHY111	T001-00 TBA TBA	BC7015-S
36073bc1-5ee0-4ed3-95ef-4351f8bce642	12:30:00	ST	-1	24	1	Autumn2020	PHY121	4112-DR Mostafa Kamal	BC6013-S
7f81e7bf-80db-4714-b8e3-b44ed64b747e	12:30:00	MW	B-0	0	2	Autumn2020	PHY121	T001-00 TBA TBA	BC7016-S
176b9355-4c79-44f3-a422-da71dc88b19c	09:30:00	M	B-0	0	1	Autumn2020	PHY121L	T001-00 TBA TBA	PLab2-S
9d94efaa-9076-4ab8-8328-ce167c937afa	09:30:00	T	B-0	0	2	Autumn2020	PHY121L	T001-00 TBA TBA	PLab2-S
d15023dd-7957-492c-9446-3145931c69f8	14:00:00	ST	-1	6	1	Autumn2020	PHY201	4112-DR Mostafa Kamal	C3006-S
e9ffddd3-1179-4fdb-b685-05f4f69e7694	12:30:00	MW	-1	7	1	Autumn2020	PHY203	4158-MR Dr. Farhad Alam	BC4014-S
e518dd3d-3166-4f55-8817-8169367eb5d3	12:30:00	ST	-1	7	1	Autumn2020	PHY207	4430-MR Ifte Khairul Alam Bhuiyan	C3006-S
2e4d9438-f803-46dc-9b97-6f9b364e96ed	12:30:00	MW	-1	6	1	Autumn2020	PHY308	4338-PROF M Arshad Momen	C4002-S
d46930e2-3265-45b4-b73f-f14d203b4272	17:00:00	ST	-1	41	1	Autumn2020	POP201	5231-MR Saquib Ahmad Khan	BC7025-S
b8d7b7c2-c4c8-488c-9b3b-2e87e991564e	09:30:00	MW	-1	19	1	Autumn2020	PSY201	5519-DR Nafisa Huq	BC10014-S
2991fb02-4be9-4863-a1d0-b89deda843e7	09:30:00	ST	-1	18	1	Autumn2020	SOC101	2200-MS Sharmeen Ahmed	C2005-S
779618ff-eb0a-44ca-8937-7a38c06389e1	11:00:00	MW	-1	30	2	Autumn2020	SOC101	2307-MR Obydullah Al Marjuk	BC7016-S
96b80448-4ce4-4fb3-8acc-db6872831417	09:30:00	MW	-1	28	3	Autumn2020	SOC101	2200-MS Sharmeen Ahmed	BC7025-S
9d76bf2e-dd78-4019-bbce-81b7de389cd2	09:30:00	ST	-1	6	4	Autumn2020	SOC101	2198-MS Mahbuba Dewan	C3004-S
5f6a993f-f652-46d1-a292-604c66fa2402	11:00:00	ST	-1	18	5	Autumn2020	SOC101	2198-MS Mahbuba Dewan	C2004-S
a0a0330d-e061-4140-b2c0-7add1cc91ed5	09:30:00	MW	-1	17	1	Autumn2020	SOC205	2198-MS Mahbuba Dewan	C2007-S
bfa54d74-85fa-4817-9457-6b85abd0721c	14:00:00	MW	-1	5	1	Autumn2020	SOC210	2307-MR Obydullah Al Marjuk	C2006-S
52b09f4c-07e7-4d6f-93df-6f61b09fa033	11:00:00	MW	-1	11	1	Autumn2020	SOC301	2200-MS Sharmeen Ahmed	C2002-S
37ff4ea2-4967-44b4-819f-c0741fa76b19	14:00:00	MW	-1	7	1	Autumn2020	SOC309	2198-MS Mahbuba Dewan	C2007-S
31cd6f41-d731-498a-8e96-e9d9cafe0caf	17:00:00	ST	-1	7	1	Autumn2020	SOC313	2165-PROF A. I. Mahbub Uddin Ahmed	BC4014-S
5264b0bc-1c0e-43a7-bcd6-acb5af031832	15:30:00	ST	-1	7	1	Autumn2020	SOC319	2207-MR S. Aminul Islam	C2002-S
bbac4794-87db-4029-a65f-8b4a55c58775	12:30:00	ST	-1	5	1	Autumn2020	SOC401	2207-MR S. Aminul Islam	BC9015-S
3aba3396-cf87-4df2-bac1-415260310df8	15:30:00	MW	-1	3	1	Autumn2020	SOC403	2485-MR A. K. M Nurun Nabi	BC4013-S
31b25ecb-2165-4542-93d5-c6046e15dfa2	17:00:00	MW	-1	3	1	Autumn2020	SOC403L	2485-MR A. K. M Nurun Nabi	BC8014-S
37fbe9f2-aa4c-400c-8ad6-c4c7816cd733	14:00:00	ST	-1	11	1	Autumn2020	SOC409	2484-MR Mahbub Quaisar	C5002-S
fb5bdc9d-8bc5-4249-b915-5684effb9b67	08:00:00	MW	0	1	1	Autumn2020	SOC499	2200-MS Sharmeen Ahmed	BCTBA1-S
\.


--
-- Data for Name: semester_t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semester_t (csemesterid, csemestername, cyearid, nsemesternum) FROM stdin;
Spring2009	Spring	2009	1
Spring2010	Spring	2010	1
Spring2011	Spring	2011	1
Spring2012	Spring	2012	1
Spring2013	Spring	2013	1
Spring2014	Spring	2014	1
Spring2015	Spring	2015	1
Spring2016	Spring	2016	1
Spring2017	Spring	2017	1
Spring2018	Spring	2018	1
Spring2019	Spring	2019	1
Spring2020	Spring	2020	1
Spring2021	Spring	2021	1
Summer2009	Summer	2009	2
Summer2010	Summer	2010	2
Summer2011	Summer	2011	2
Summer2012	Summer	2012	2
Summer2013	Summer	2013	2
Summer2014	Summer	2014	2
Summer2015	Summer	2015	2
Summer2016	Summer	2016	2
Summer2017	Summer	2017	2
Summer2018	Summer	2018	2
Summer2019	Summer	2019	2
Summer2020	Summer	2020	2
Summer2021	Summer	2021	2
Autumn2009	Autumn	2009	3
Autumn2010	Autumn	2010	3
Autumn2011	Autumn	2011	3
Autumn2012	Autumn	2012	3
Autumn2013	Autumn	2013	3
Autumn2014	Autumn	2014	3
Autumn2015	Autumn	2015	3
Autumn2016	Autumn	2016	3
Autumn2017	Autumn	2017	3
Autumn2018	Autumn	2018	3
Autumn2019	Autumn	2019	3
Autumn2020	Autumn	2020	3
Autumn2021	Autumn	2021	3
\.


--
-- Data for Name: year_t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.year_t (cyearid) FROM stdin;
2009
2010
2011
2012
2013
2014
2015
2016
2017
2018
2019
2020
2021
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 43, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: course_t course_t_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_t
    ADD CONSTRAINT course_t_pkey PRIMARY KEY (ccourseid);


--
-- Name: department_t department_t_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_t
    ADD CONSTRAINT department_t_pkey PRIMARY KEY (cdepartmentid);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: faculty_t faculty_t_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty_t
    ADD CONSTRAINT faculty_t_pkey PRIMARY KEY (cfacultyid);


--
-- Name: room_t room_t_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_t
    ADD CONSTRAINT room_t_pkey PRIMARY KEY (croomid);


--
-- Name: school_t school_t_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school_t
    ADD CONSTRAINT school_t_pkey PRIMARY KEY (cschoolid);


--
-- Name: section_t section_t_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section_t
    ADD CONSTRAINT section_t_pkey PRIMARY KEY (usectionid);


--
-- Name: semester_t semester_t_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semester_t
    ADD CONSTRAINT semester_t_pkey PRIMARY KEY (csemesterid);


--
-- Name: year_t year_t_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.year_t
    ADD CONSTRAINT year_t_pkey PRIMARY KEY (cyearid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_t course_t_cdepartmentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_t
    ADD CONSTRAINT course_t_cdepartmentid_fkey FOREIGN KEY (cdepartmentid) REFERENCES public.department_t(cdepartmentid);


--
-- Name: department_t department_t_cschoolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_t
    ADD CONSTRAINT department_t_cschoolid_fkey FOREIGN KEY (cschoolid) REFERENCES public.school_t(cschoolid);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: faculty_t faculty_t_cdepartmentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty_t
    ADD CONSTRAINT faculty_t_cdepartmentid_fkey FOREIGN KEY (cdepartmentid) REFERENCES public.department_t(cdepartmentid);


--
-- Name: section_t section_t_ccourseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section_t
    ADD CONSTRAINT section_t_ccourseid_fkey FOREIGN KEY (ccourseid) REFERENCES public.course_t(ccourseid);


--
-- Name: section_t section_t_cfacultyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section_t
    ADD CONSTRAINT section_t_cfacultyid_fkey FOREIGN KEY (cfacultyid) REFERENCES public.faculty_t(cfacultyid);


--
-- Name: section_t section_t_croomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section_t
    ADD CONSTRAINT section_t_croomid_fkey FOREIGN KEY (croomid) REFERENCES public.room_t(croomid);


--
-- Name: section_t section_t_csemesterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section_t
    ADD CONSTRAINT section_t_csemesterid_fkey FOREIGN KEY (csemesterid) REFERENCES public.semester_t(csemesterid);


--
-- Name: semester_t semester_t_cyearid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semester_t
    ADD CONSTRAINT semester_t_cyearid_fkey FOREIGN KEY (cyearid) REFERENCES public.year_t(cyearid);


--
-- PostgreSQL database dump complete
--

