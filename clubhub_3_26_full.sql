--
-- PostgreSQL database dump
--

\restrict 7d5CuOoiP0s7WRydqosHXbKTEcl4x5uzkr7Ga2BfcdaPhfHTRJMYSZAK7bfgomZ

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2026-03-12 00:16:41

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

--
-- TOC entry 6 (class 2615 OID 16957)
-- Name: private; Type: SCHEMA; Schema: -; Owner: chadmin
--

CREATE SCHEMA private;


ALTER SCHEMA private OWNER TO chadmin;

--
-- TOC entry 883 (class 1247 OID 16959)
-- Name: attendance_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.attendance_status AS ENUM (
    'Present',
    'Absent'
);


ALTER TYPE public.attendance_status OWNER TO chadmin;

--
-- TOC entry 922 (class 1247 OID 17318)
-- Name: club_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.club_category AS ENUM (
    'academic',
    'activism',
    'api',
    'athletic',
    'black_african',
    'career_dev',
    'christian',
    'civic',
    'sports_comp',
    'sports_noncomp',
    'community_svc',
    'cooking',
    'crafts_arts',
    'cultural_lang',
    'dance',
    'democratic_engagement',
    'environment',
    'faith',
    'greek_life',
    'gaming',
    'gender_sexuality',
    'health',
    'honor_societies',
    'indigenous',
    'international',
    'sports_intramural',
    'jewish',
    'lake_tahoe',
    'latinx',
    'leadership',
    'literary',
    'martial_arts',
    'media',
    'men_of_color',
    'mena',
    'multicultural',
    'music',
    'muslim',
    'neurodiversity',
    'outdoor_rec',
    'political',
    'pre_professional',
    'religious',
    'research',
    'social',
    'social_justice',
    'special_interest',
    'stem',
    'student_gov',
    'student_resources',
    'theater',
    'women_of_color',
    'women_centered'
);


ALTER TYPE public.club_category OWNER TO postgres;

--
-- TOC entry 931 (class 1247 OID 33092)
-- Name: club_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.club_role AS ENUM (
    'president',
    'vice_pres',
    'treasurer',
    'secretary',
    'member',
    'advisor',
    'officer'
);


ALTER TYPE public.club_role OWNER TO postgres;

--
-- TOC entry 886 (class 1247 OID 16964)
-- Name: club_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.club_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.club_status OWNER TO chadmin;

--
-- TOC entry 889 (class 1247 OID 16970)
-- Name: task_priority; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.task_priority AS ENUM (
    'Low',
    'Medium',
    'High'
);


ALTER TYPE public.task_priority OWNER TO chadmin;

--
-- TOC entry 892 (class 1247 OID 16978)
-- Name: task_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.task_status AS ENUM (
    'Not Started',
    'In Progress',
    'Complete'
);


ALTER TYPE public.task_status OWNER TO chadmin;

--
-- TOC entry 925 (class 1247 OID 24910)
-- Name: user_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role AS ENUM (
    'student',
    'admin',
    'faculty'
);


ALTER TYPE public.user_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16985)
-- Name: Attendance; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Attendance" (
    id integer CONSTRAINT "Attendance_attendance_id_not_null" NOT NULL,
    event integer NOT NULL,
    "user" integer NOT NULL,
    status public.attendance_status NOT NULL,
    "time" timestamp with time zone
);


ALTER TABLE public."Attendance" OWNER TO chadmin;

--
-- TOC entry 221 (class 1259 OID 16992)
-- Name: Attendance_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Attendance_attendance_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_attendance_id_seq" OWNER TO chadmin;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 221
-- Name: Attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_attendance_id_seq" OWNED BY public."Attendance".id;


--
-- TOC entry 222 (class 1259 OID 16993)
-- Name: Attendance_event_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Attendance_event_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_event_seq" OWNER TO chadmin;

--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 222
-- Name: Attendance_event_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_event_seq" OWNED BY public."Attendance".event;


--
-- TOC entry 223 (class 1259 OID 16994)
-- Name: Attendance_user_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Attendance_user_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_user_seq" OWNER TO chadmin;

--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 223
-- Name: Attendance_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_user_seq" OWNED BY public."Attendance"."user";


--
-- TOC entry 224 (class 1259 OID 16995)
-- Name: Club; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Club" (
    id integer CONSTRAINT "Club_club_id_not_null" NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    activity_status public.club_status NOT NULL,
    tags public.club_category[]
);


ALTER TABLE public."Club" OWNER TO chadmin;

--
-- TOC entry 225 (class 1259 OID 17004)
-- Name: Club Membership; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Club Membership" (
    id integer CONSTRAINT "Club Membership_membership_id_not_null" NOT NULL,
    club integer CONSTRAINT "Club Membership_clubid_not_null" NOT NULL,
    "user" integer CONSTRAINT "Club Membership_userid_not_null" NOT NULL,
    is_active boolean NOT NULL,
    dues_paid boolean NOT NULL,
    role public.club_role NOT NULL
);


ALTER TABLE public."Club Membership" OWNER TO chadmin;

--
-- TOC entry 226 (class 1259 OID 17012)
-- Name: Club Membership_clubid_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Club Membership_clubid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Club Membership_clubid_seq" OWNER TO chadmin;

--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 226
-- Name: Club Membership_clubid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_clubid_seq" OWNED BY public."Club Membership".club;


--
-- TOC entry 227 (class 1259 OID 17013)
-- Name: Club Membership_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Club Membership_membership_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Club Membership_membership_id_seq" OWNER TO chadmin;

--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 227
-- Name: Club Membership_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_membership_id_seq" OWNED BY public."Club Membership".id;


--
-- TOC entry 228 (class 1259 OID 17014)
-- Name: Club Membership_userid_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Club Membership_userid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Club Membership_userid_seq" OWNER TO chadmin;

--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 228
-- Name: Club Membership_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_userid_seq" OWNED BY public."Club Membership"."user";


--
-- TOC entry 229 (class 1259 OID 17015)
-- Name: Club_club_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Club_club_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Club_club_id_seq" OWNER TO chadmin;

--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 229
-- Name: Club_club_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club_club_id_seq" OWNED BY public."Club".id;


--
-- TOC entry 230 (class 1259 OID 17016)
-- Name: Event; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Event" (
    id integer CONSTRAINT "Event_event_id_not_null" NOT NULL,
    club integer NOT NULL,
    name character varying(255),
    description text,
    start_datetime timestamp with time zone,
    end_datetime timestamp with time zone,
    location character varying(255),
    created_at timestamp with time zone
);


ALTER TABLE public."Event" OWNER TO chadmin;

--
-- TOC entry 231 (class 1259 OID 17023)
-- Name: Event_club_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Event_club_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Event_club_seq" OWNER TO chadmin;

--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 231
-- Name: Event_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Event_club_seq" OWNED BY public."Event".club;


--
-- TOC entry 232 (class 1259 OID 17024)
-- Name: Event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Event_event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Event_event_id_seq" OWNER TO chadmin;

--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 232
-- Name: Event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Event_event_id_seq" OWNED BY public."Event".id;


--
-- TOC entry 233 (class 1259 OID 17025)
-- Name: File Resource; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."File Resource" (
    id integer CONSTRAINT "File Resource_file_id_not_null" NOT NULL,
    club integer NOT NULL,
    source_url text NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public."File Resource" OWNER TO chadmin;

--
-- TOC entry 234 (class 1259 OID 17035)
-- Name: File Resource_club_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."File Resource_club_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."File Resource_club_seq" OWNER TO chadmin;

--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 234
-- Name: File Resource_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."File Resource_club_seq" OWNED BY public."File Resource".club;


--
-- TOC entry 235 (class 1259 OID 17037)
-- Name: File Resource_file_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."File Resource_file_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."File Resource_file_id_seq" OWNER TO chadmin;

--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 235
-- Name: File Resource_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."File Resource_file_id_seq" OWNED BY public."File Resource".id;


--
-- TOC entry 250 (class 1259 OID 24918)
-- Name: Notification Recipient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notification Recipient" (
    id integer CONSTRAINT notif_recipients_id_not_null NOT NULL,
    notif integer CONSTRAINT notif_recipients_notif_not_null NOT NULL,
    "user" integer CONSTRAINT notif_recipients_user_not_null NOT NULL
);


ALTER TABLE public."Notification Recipient" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17038)
-- Name: Notifications; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Notifications" (
    id integer CONSTRAINT "Notifications_notif_id_not_null" NOT NULL,
    club integer NOT NULL,
    title character varying(255) NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer NOT NULL
);


ALTER TABLE public."Notifications" OWNER TO chadmin;

--
-- TOC entry 237 (class 1259 OID 17050)
-- Name: Notifications_club_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Notifications_club_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Notifications_club_seq" OWNER TO chadmin;

--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 237
-- Name: Notifications_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Notifications_club_seq" OWNED BY public."Notifications".club;


--
-- TOC entry 238 (class 1259 OID 17051)
-- Name: Notifications_created_by_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Notifications_created_by_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Notifications_created_by_seq" OWNER TO chadmin;

--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 238
-- Name: Notifications_created_by_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Notifications_created_by_seq" OWNED BY public."Notifications".created_by;


--
-- TOC entry 239 (class 1259 OID 17052)
-- Name: Notifications_notif_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Notifications_notif_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Notifications_notif_id_seq" OWNER TO chadmin;

--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 239
-- Name: Notifications_notif_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Notifications_notif_id_seq" OWNED BY public."Notifications".id;


--
-- TOC entry 240 (class 1259 OID 17053)
-- Name: Task; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Task" (
    id integer CONSTRAINT "Task_task_id_not_null" NOT NULL,
    club integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    due_date date NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    priority public.task_priority NOT NULL,
    status public.task_status NOT NULL
);


ALTER TABLE public."Task" OWNER TO chadmin;

--
-- TOC entry 241 (class 1259 OID 17066)
-- Name: Task Assignment; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Task Assignment" (
    id integer CONSTRAINT "Task Assignment_assignment_id_not_null" NOT NULL,
    task integer NOT NULL,
    "user" integer NOT NULL,
    assigned_at timestamp without time zone NOT NULL
);


ALTER TABLE public."Task Assignment" OWNER TO chadmin;

--
-- TOC entry 242 (class 1259 OID 17073)
-- Name: Task Assignment_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task Assignment_assignment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task Assignment_assignment_id_seq" OWNER TO chadmin;

--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 242
-- Name: Task Assignment_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_assignment_id_seq" OWNED BY public."Task Assignment".id;


--
-- TOC entry 243 (class 1259 OID 17074)
-- Name: Task Assignment_task_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task Assignment_task_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task Assignment_task_seq" OWNER TO chadmin;

--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 243
-- Name: Task Assignment_task_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_task_seq" OWNED BY public."Task Assignment".task;


--
-- TOC entry 244 (class 1259 OID 17075)
-- Name: Task Assignment_user_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task Assignment_user_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task Assignment_user_seq" OWNER TO chadmin;

--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 244
-- Name: Task Assignment_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_user_seq" OWNED BY public."Task Assignment"."user";


--
-- TOC entry 245 (class 1259 OID 17076)
-- Name: Task_club_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task_club_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task_club_seq" OWNER TO chadmin;

--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 245
-- Name: Task_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task_club_seq" OWNED BY public."Task".club;


--
-- TOC entry 246 (class 1259 OID 17077)
-- Name: Task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task_task_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task_task_id_seq" OWNER TO chadmin;

--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 246
-- Name: Task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task_task_id_seq" OWNED BY public."Task".id;


--
-- TOC entry 247 (class 1259 OID 17078)
-- Name: User; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."User" (
    id integer CONSTRAINT "Users_user_id_not_null" NOT NULL,
    school_email character varying(255) CONSTRAINT "Users_school_email_not_null" NOT NULL,
    password character varying(255) CONSTRAINT "Users_password_not_null" NOT NULL,
    first_name character varying(100) CONSTRAINT "Users_first_name_not_null" NOT NULL,
    last_name character varying(100) CONSTRAINT "Users_last_name_not_null" NOT NULL,
    created_at timestamp with time zone CONSTRAINT "Users_created_at_not_null" NOT NULL,
    role public.user_role
);


ALTER TABLE public."User" OWNER TO chadmin;

--
-- TOC entry 248 (class 1259 OID 17090)
-- Name: Users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Users_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_user_id_seq" OWNER TO chadmin;

--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 248
-- Name: Users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Users_user_id_seq" OWNED BY public."User".id;


--
-- TOC entry 249 (class 1259 OID 24917)
-- Name: notif_recipients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notif_recipients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notif_recipients_id_seq OWNER TO postgres;

--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 249
-- Name: notif_recipients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notif_recipients_id_seq OWNED BY public."Notification Recipient".id;


--
-- TOC entry 4935 (class 2604 OID 17091)
-- Name: Attendance id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN id SET DEFAULT nextval('public."Attendance_attendance_id_seq"'::regclass);


--
-- TOC entry 4936 (class 2604 OID 17094)
-- Name: Club id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club" ALTER COLUMN id SET DEFAULT nextval('public."Club_club_id_seq"'::regclass);


--
-- TOC entry 4937 (class 2604 OID 17095)
-- Name: Club Membership id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership" ALTER COLUMN id SET DEFAULT nextval('public."Club Membership_membership_id_seq"'::regclass);


--
-- TOC entry 4938 (class 2604 OID 17098)
-- Name: Event id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event" ALTER COLUMN id SET DEFAULT nextval('public."Event_event_id_seq"'::regclass);


--
-- TOC entry 4939 (class 2604 OID 17100)
-- Name: File Resource id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource" ALTER COLUMN id SET DEFAULT nextval('public."File Resource_file_id_seq"'::regclass);


--
-- TOC entry 4947 (class 2604 OID 24921)
-- Name: Notification Recipient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification Recipient" ALTER COLUMN id SET DEFAULT nextval('public.notif_recipients_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 17103)
-- Name: Notifications id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications" ALTER COLUMN id SET DEFAULT nextval('public."Notifications_notif_id_seq"'::regclass);


--
-- TOC entry 4942 (class 2604 OID 17106)
-- Name: Task id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task" ALTER COLUMN id SET DEFAULT nextval('public."Task_task_id_seq"'::regclass);


--
-- TOC entry 4943 (class 2604 OID 17108)
-- Name: Task Assignment id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN id SET DEFAULT nextval('public."Task Assignment_assignment_id_seq"'::regclass);


--
-- TOC entry 4944 (class 2604 OID 17109)
-- Name: Task Assignment task; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN task SET DEFAULT nextval('public."Task Assignment_task_seq"'::regclass);


--
-- TOC entry 4945 (class 2604 OID 17110)
-- Name: Task Assignment user; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN "user" SET DEFAULT nextval('public."Task Assignment_user_seq"'::regclass);


--
-- TOC entry 4946 (class 2604 OID 17111)
-- Name: User id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."Users_user_id_seq"'::regclass);


--
-- TOC entry 5140 (class 0 OID 16985)
-- Dependencies: 220
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."Attendance" (id, event, "user", status, "time") FROM stdin;
\.


--
-- TOC entry 5144 (class 0 OID 16995)
-- Dependencies: 224
-- Data for Name: Club; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."Club" (id, name, description, created_at, activity_status, tags) FROM stdin;
6	Admissions and Records	\N	2026-03-10 21:03:24.423774-07	Active	\N
9	African Students Association 	\N	2026-03-10 21:03:24.423774-07	Active	\N
19	American Chemical Society 	\N	2026-03-10 21:03:24.423774-07	Active	\N
20	American Institute of Chemical Engineers 	\N	2026-03-10 21:03:24.423774-07	Active	\N
21	American Lung Cancer Screening Initiative 	\N	2026-03-10 21:03:24.423774-07	Active	\N
22	American Marketing Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
25	American Nuclear Society 	\N	2026-03-10 21:03:24.423774-07	Active	\N
26	American Red Cross	\N	2026-03-10 21:03:24.423774-07	Active	\N
27	American Society of Civil Engineers	\N	2026-03-10 21:03:24.423774-07	Active	\N
28	Anthropology Department 	\N	2026-03-10 21:03:24.423774-07	Active	\N
29	Argenta Hall 	\N	2026-03-10 21:03:24.423774-07	Active	\N
30	Art Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
31	Art History VIsual Culture Studies Forum	\N	2026-03-10 21:03:24.423774-07	Active	\N
33	Aspire @ the U	\N	2026-03-10 21:03:24.423774-07	Active	\N
34	Association for Computing Machinery	\N	2026-03-10 21:03:24.423774-07	Active	\N
35	ASUN Clubs and Organizations 	\N	2026-03-10 21:03:24.423774-07	Active	\N
36	ASUN Department of Campus Wellness	\N	2026-03-10 21:03:24.423774-07	Active	\N
37	ASUN Department of Sustainability	\N	2026-03-10 21:03:24.423774-07	Active	\N
38	ASUN Elections Candidates 	\N	2026-03-10 21:03:24.423774-07	Active	\N
39	ASUN Elections Information	\N	2026-03-10 21:03:24.423774-07	Active	\N
40	ASUN Executive Board	\N	2026-03-10 21:03:24.423774-07	Active	\N
41	ASUN Goverment Affairs	\N	2026-03-10 21:03:24.423774-07	Active	\N
42	ASUN IDEA	\N	2026-03-10 21:03:24.423774-07	Active	\N
43	ASUN Judicial 	\N	2026-03-10 21:03:24.423774-07	Active	\N
44	ASUN Legal Services	\N	2026-03-10 21:03:24.423774-07	Active	\N
45	ASUN Programming 	\N	2026-03-10 21:03:24.423774-07	Active	\N
46	ASUN Senate	\N	2026-03-10 21:03:24.423774-07	Active	\N
47	Ballet Folklorico Cima de Plata	\N	2026-03-10 21:03:24.423774-07	Active	\N
48	Balloon Race Scholarship Committee 	\N	2026-03-10 21:03:24.423774-07	Active	\N
49	Bangladesh Student Association 	\N	2026-03-10 21:03:24.423774-07	Active	\N
51	Beta Alpha Psi - Zeta lota	\N	2026-03-10 21:03:24.423774-07	Active	\N
52	Biggest Little Fur Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
53	Biochemistry and Molecular Biology	\N	2026-03-10 21:03:24.423774-07	Active	\N
54	BIology	\N	2026-03-10 21:03:24.423774-07	Active	\N
56	Blue Key Honor Society 	\N	2026-03-10 21:03:24.423774-07	Active	\N
58	Bridging Wellness 	\N	2026-03-10 21:03:24.423774-07	Active	\N
59	Brushfire Literature and Arts Journal	\N	2026-03-10 21:03:24.423774-07	Active	\N
60	Bug Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
61	Business Student Council	\N	2026-03-10 21:03:24.423774-07	Active	\N
62	CABNR Ambassadors 	\N	2026-03-10 21:03:24.423774-07	Active	\N
63	Camp Kesem at University of Nevada, Reno	\N	2026-03-10 21:03:24.423774-07	Active	\N
64	Canada Hall	\N	2026-03-10 21:03:24.423774-07	Active	\N
66	Center for Civil Rights and Equal Access	\N	2026-03-10 21:03:24.423774-07	Active	\N
67	Center for Learning and Literacy 	\N	2026-03-10 21:03:24.423774-07	Active	\N
68	Center for Student Engagement 	\N	2026-03-10 21:03:24.423774-07	Active	\N
69	Center for the Application of Substance Abuse Technologies 	\N	2026-03-10 21:03:24.423774-07	Active	\N
70	Ceramics Society of University of Nevada Reno 	\N	2026-03-10 21:03:24.423774-07	Active	\N
71	Chabad at UNR	\N	2026-03-10 21:03:24.423774-07	Active	\N
72	Chess Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
73	Child and Family Research Center	\N	2026-03-10 21:03:24.423774-07	Active	\N
75	Christain Students at UNR	\N	2026-03-10 21:03:24.423774-07	Active	\N
76	Christian Challenge 	\N	2026-03-10 21:03:24.423774-07	Active	\N
77	Club Tennis	\N	2026-03-10 21:03:24.423774-07	Active	\N
78	College of Agriculture, Biotechnology and Natural Resources 	\N	2026-03-10 21:03:24.423774-07	Active	\N
79	College of Business - Finance Dept	\N	2026-03-10 21:03:24.423774-07	Active	\N
80	College of Business - Management Dept 	\N	2026-03-10 21:03:24.423774-07	Active	\N
81	College of Business Career Services 	\N	2026-03-10 21:03:24.423774-07	Active	\N
82	College of Business Dean's Office 	\N	2026-03-10 21:03:24.423774-07	Active	\N
83	College of Business Marketing Dept 	\N	2026-03-10 21:03:24.423774-07	Active	\N
84	College of Business Student Success Center 	\N	2026-03-10 21:03:24.423774-07	Active	\N
85	College of Education and Human Development Dean's Office 	\N	2026-03-10 21:03:24.423774-07	Active	\N
86	College of Education and Human Development Student Success Center 	\N	2026-03-10 21:03:24.423774-07	Active	\N
87	College of Engineering	\N	2026-03-10 21:03:24.423774-07	Active	\N
88	College of Liberal Arts 	\N	2026-03-10 21:03:24.423774-07	Active	\N
89	College of Science 	\N	2026-03-10 21:03:24.423774-07	Active	\N
90	Communciation Studies	\N	2026-03-10 21:03:24.423774-07	Active	\N
91	Community of English Spanish Speakers	\N	2026-03-10 21:03:24.423774-07	Active	\N
92	Computer Science and Engineering 	\N	2026-03-10 21:03:24.423774-07	Active	\N
93	Concrete Canoe	\N	2026-03-10 21:03:24.423774-07	Active	\N
94	Core Humanities 	\N	2026-03-10 21:03:24.423774-07	Active	\N
95	Counseling Services 	\N	2026-03-10 21:03:24.423774-07	Active	\N
96	Criminal Justice Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
97	Davidson Academy	\N	2026-03-10 21:03:24.423774-07	Active	\N
98	Dean of Students Office 	\N	2026-03-10 21:03:24.423774-07	Active	\N
99	Dean's Future Scholars Program	\N	2026-03-10 21:03:24.423774-07	Active	\N
100	DeLaMare Science and Engineering Library 	\N	2026-03-10 21:03:24.423774-07	Active	\N
101	Delta Delta Delta Sorority 	\N	2026-03-10 21:03:24.423774-07	Active	\N
102	Delta Gamma 	\N	2026-03-10 21:03:24.423774-07	Active	\N
18	Alumni Engagement 	The mission of the Nevada Alumni Association is to foster and cultivate a common bond of pride, affinity and connection among alumni, students, prospective students and friends of the University of Nevada, Reno through quality programs, services and events.	2026-03-10 21:03:24.423774-07	Active	\N
7	Advancements in Teaching Excellence 	\N	2026-03-10 21:03:24.423774-07	Active	{academic}
8	Advising, Recruiting and Retention School of Public Health 	\N	2026-03-10 21:03:24.423774-07	Active	{academic}
50	Bangladeshi Student Association 	\N	2026-03-10 21:03:24.423774-07	Active	{api}
57	Bollywood America 	\N	2026-03-10 21:03:24.423774-07	Active	{api}
74	Chinese Students and Scholars Association 	\N	2026-03-10 21:03:24.423774-07	Active	{api}
103	Delta Sigma Theta Sorority Incorporated 	\N	2026-03-10 21:03:24.423774-07	Active	\N
104	Deparment of Criminal Justice 	\N	2026-03-10 21:03:24.423774-07	Active	\N
105	Department of ACC	\N	2026-03-10 21:03:24.423774-07	Active	\N
106	Department of Civil and Enviromental Engineering 	\N	2026-03-10 21:03:24.423774-07	Active	\N
107	Department of Educational Studies 	\N	2026-03-10 21:03:24.423774-07	Active	\N
108	Department of Gender, Race and Identity 	\N	2026-03-10 21:03:24.423774-07	Active	\N
109	Department of Geological Sciences and Engineering	\N	2026-03-10 21:03:24.423774-07	Active	\N
110	Department of Human Development, Family Science and Counseling 	\N	2026-03-10 21:03:24.423774-07	Active	\N
111	Department of Information System	\N	2026-03-10 21:03:24.423774-07	Active	\N
112	Department of Physics 	\N	2026-03-10 21:03:24.423774-07	Active	\N
113	Department of Political Science	\N	2026-03-10 21:03:24.423774-07	Active	\N
115	Digital Wolf Pack Initiative (DWPI)	\N	2026-03-10 21:03:24.423774-07	Active	\N
116	Disability Resource Center 	\N	2026-03-10 21:03:24.423774-07	Active	\N
117	DIstributive Education Clubs of America	\N	2026-03-10 21:03:24.423774-07	Active	\N
118	Diversity, Equity and Inclusion 	\N	2026-03-10 21:03:24.423774-07	Active	\N
119	Diversity, Social Justice and Inclusion	\N	2026-03-10 21:03:24.423774-07	Active	\N
120	Division of Extended Studies 	\N	2026-03-10 21:03:24.423774-07	Active	\N
121	Division of Student Services	\N	2026-03-10 21:03:24.423774-07	Active	\N
122	Douglas County Extension	\N	2026-03-10 21:03:24.423774-07	Active	\N
123	Dragon Club of Nevada	\N	2026-03-10 21:03:24.423774-07	Active	\N
124	Ecology, Evolution and Conservation Biology 	\N	2026-03-10 21:03:24.423774-07	Active	\N
125	Ecology, Evolution and Conservation Biology Graduate Student Outreach Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
126	Educational Leadership	\N	2026-03-10 21:03:24.423774-07	Active	\N
127	Electrical and Biomedical Engineering Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
128	Elohist Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
129	English Department 	\N	2026-03-10 21:03:24.423774-07	Active	\N
130	Enterprise and Innovation	\N	2026-03-10 21:03:24.423774-07	Active	\N
131	Equal Opportuntity and Title IX	\N	2026-03-10 21:03:24.423774-07	Active	\N
132	Everest Sports Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
133	Every Nation Campus at University of Nevada, Reno	\N	2026-03-10 21:03:24.423774-07	Active	\N
134	Facilities Services 	\N	2026-03-10 21:03:24.423774-07	Active	\N
135	Faculty Senate 	\N	2026-03-10 21:03:24.423774-07	Active	\N
136	First Generation Student Center 	\N	2026-03-10 21:03:24.423774-07	Active	\N
137	Fitness and Recreational Sports 	\N	2026-03-10 21:03:24.423774-07	Active	\N
138	Flesichmann Planetarium	\N	2026-03-10 21:03:24.423774-07	Active	\N
139	Forestry Club 	\N	2026-03-10 21:03:24.423774-07	Active	\N
140	Fraternity and Sorority Life 	\N	2026-03-10 21:03:24.423774-07	Active	\N
141	Friends of MSF	\N	2026-03-10 21:03:24.423774-07	Active	\N
142	Games Guild 	\N	2026-03-10 21:03:24.423774-07	Active	\N
143	Gamma Rho Lambda 	\N	2026-03-10 21:03:24.423774-07	Active	\N
144	Geography Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
145	Geography Graduate Student Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
146	Gerontology Academic Program 	\N	2026-03-10 21:03:24.423774-07	Active	\N
147	Global Water Center 	\N	2026-03-10 21:03:24.423774-07	Active	\N
148	Golden Scholars Program 	\N	2026-03-10 21:03:24.423774-07	Active	\N
149	Grad Student and Postdoc Engagement 	\N	2026-03-10 21:03:24.423774-07	Active	\N
150	Graduate Behavior Analysis Club 	\N	2026-03-10 21:03:24.423774-07	Active	\N
151	Graduate Chemical and Materials Engineering Society 	\N	2026-03-10 21:03:24.423774-07	Active	\N
152	Graduate Program of Hydrologic Sciences 	\N	2026-03-10 21:03:24.423774-07	Active	\N
153	Graduate Student Badminton Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
154	Gradute School 	\N	2026-03-10 21:03:24.423774-07	Active	\N
155	Great Basin Center for Geothermal Energy 	\N	2026-03-10 21:03:24.423774-07	Active	\N
156	Great Basin Hall	\N	2026-03-10 21:03:24.423774-07	Active	\N
157	GSA Awards Committee 	\N	2026-03-10 21:03:24.423774-07	Active	\N
158	GSA Clubs and Organizations Committee 	\N	2026-03-10 21:03:24.423774-07	Active	\N
159	GSA Events Committee	\N	2026-03-10 21:03:24.423774-07	Active	\N
160	GSA Fundraising and Community Relations Committee	\N	2026-03-10 21:03:24.423774-07	Active	\N
161	GSA Judical, Budget and Finance Committee 	\N	2026-03-10 21:03:24.423774-07	Active	\N
162	GSA Service Committee 	\N	2026-03-10 21:03:24.423774-07	Active	\N
163	GSA Summer Task Force 	\N	2026-03-10 21:03:24.423774-07	Active	\N
164	Healthcare Administration and Leadership Student Association 	\N	2026-03-10 21:03:24.423774-07	Active	\N
165	Healthier Nevada	\N	2026-03-10 21:03:24.423774-07	Active	\N
166	Hearts for the Homeless at UNR	\N	2026-03-10 21:03:24.423774-07	Active	\N
167	Helping Advance Relationships and Togetherness Initiative 	\N	2026-03-10 21:03:24.423774-07	Active	\N
168	High Sierra AHEC	\N	2026-03-10 21:03:24.423774-07	Active	\N
169	HIking Club 	\N	2026-03-10 21:03:24.423774-07	Active	\N
170	Hillel of Northern Nevada 	\N	2026-03-10 21:03:24.423774-07	Active	\N
171	Hippocratic Society at the University of Nevada, Reno 	\N	2026-03-10 21:03:24.423774-07	Active	\N
172	History Department 	\N	2026-03-10 21:03:24.423774-07	Active	\N
173	Honors College 	\N	2026-03-10 21:03:24.423774-07	Active	\N
174	Honors College Student Council	\N	2026-03-10 21:03:24.423774-07	Active	\N
175	Human Development and Family Sciences Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
176	Human Resources 	\N	2026-03-10 21:03:24.423774-07	Active	\N
177	Ice Skating Allies 	\N	2026-03-10 21:03:24.423774-07	Active	\N
178	Indian Student Organization 	\N	2026-03-10 21:03:24.423774-07	Active	\N
179	Indigenous Relations 	\N	2026-03-10 21:03:24.423774-07	Active	\N
180	Insight Magazine 	\N	2026-03-10 21:03:24.423774-07	Active	\N
181	Insitiute of Electrial and Elctronics Engineer (IEEE) Student Branch Chapter of the University of Nevada, Reno	\N	2026-03-10 21:03:24.423774-07	Active	\N
182	Interfraternity Council	\N	2026-03-10 21:03:24.423774-07	Active	\N
183	International Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
184	International Club (Graduate Chapter) 	\N	2026-03-10 21:03:24.423774-07	Active	\N
185	InterVarsity Christian Fellowship 	\N	2026-03-10 21:03:24.423774-07	Active	\N
186	Iranian Students Association 	\N	2026-03-10 21:03:24.423774-07	Active	\N
187	Its On Us 	\N	2026-03-10 21:03:24.423774-07	Active	\N
188	Japan Pack	\N	2026-03-10 21:03:24.423774-07	Active	\N
189	Japanese Calligraphy Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
190	Japanese Student Action Network	\N	2026-03-10 21:03:24.423774-07	Active	\N
191	Joe Crowley Studnet Union	\N	2026-03-10 21:03:24.423774-07	Active	\N
192	John Mackay Club 	\N	2026-03-10 21:03:24.423774-07	Active	\N
193	Judicial Studies Graduate Degree Program	\N	2026-03-10 21:03:24.423774-07	Active	\N
194	Kappa Alpha Theta 	\N	2026-03-10 21:03:24.423774-07	Active	\N
195	Kappa Delta Chi Sorority Inc. 	\N	2026-03-10 21:03:24.423774-07	Active	\N
196	Kappa Phi Lambada Sorority Inc. 	\N	2026-03-10 21:03:24.423774-07	Active	\N
197	Kappa Sigma 	\N	2026-03-10 21:03:24.423774-07	Active	\N
198	Kids University 	\N	2026-03-10 21:03:24.423774-07	Active	\N
199	Kinesiology Club UNR	\N	2026-03-10 21:03:24.423774-07	Active	\N
200	L.S. @ the U	\N	2026-03-10 21:03:24.423774-07	Active	\N
201	La Dolce Vita 	\N	2026-03-10 21:03:24.423774-07	Active	\N
202	Lambda Phi Xi Multicultural Sorority Incorporated 	\N	2026-03-10 21:03:24.423774-07	Active	\N
203	Lambda Psi Rho	\N	2026-03-10 21:03:24.423774-07	Active	\N
204	Lambda Theta Phi	\N	2026-03-10 21:03:24.423774-07	Active	\N
205	Latino Pre-law Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
206	Latino Research Center 	\N	2026-03-10 21:03:24.423774-07	Active	\N
207	Latino Student Advisory Board 	\N	2026-03-10 21:03:24.423774-07	Active	\N
208	Latter-Day Saint Student Association 	\N	2026-03-10 21:03:24.423774-07	Active	\N
209	Lettuce Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
210	LIttle Footsteps, Big Steps	\N	2026-03-10 21:03:24.423774-07	Active	\N
211	Love and Mine Foundation	\N	2026-03-10 21:03:24.423774-07	Active	\N
212	Lovingkindness Collective	\N	2026-03-10 21:03:24.423774-07	Active	\N
213	Mackay Muckers Mining	\N	2026-03-10 21:03:24.423774-07	Active	\N
214	Mackay Rockhounds	\N	2026-03-10 21:03:24.423774-07	Active	\N
215	Mackay School of Earth Sciences & Engineering	\N	2026-03-10 21:03:24.423774-07	Active	\N
216	Management and Human Resources Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
217	Manzanita - Juniper Halls	\N	2026-03-10 21:03:24.423774-07	Active	\N
218	Mariachi Lobos de Plata	\N	2026-03-10 21:03:24.423774-07	Active	\N
219	Master's Society of Public Health	\N	2026-03-10 21:03:24.423774-07	Active	\N
220	Material Advantage Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
221	Math and Statistics Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
222	Meals with Meaning	\N	2026-03-10 21:03:24.423774-07	Active	\N
223	Mechanical Engineering Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
224	Mechanical Engineering Graduate Students Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
225	MEDLIFE Nevada	\N	2026-03-10 21:03:24.423774-07	Active	\N
226	Men's Ultimate Frisbee	\N	2026-03-10 21:03:24.423774-07	Active	\N
227	Mental Health First Aid	\N	2026-03-10 21:03:24.423774-07	Active	\N
228	Military Science	\N	2026-03-10 21:03:24.423774-07	Active	\N
229	Mineral County Extension	\N	2026-03-10 21:03:24.423774-07	Active	\N
230	Mining and Metallurgical Engineering	\N	2026-03-10 21:03:24.423774-07	Active	\N
231	Minority Association of Pre-Medical Students	\N	2026-03-10 21:03:24.423774-07	Active	\N
232	Model United Nations	\N	2026-03-10 21:03:24.423774-07	Active	\N
233	Movie Medicine Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
234	Multicultural Greek Council	\N	2026-03-10 21:03:24.423774-07	Active	\N
235	Music Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
236	Muslim Student Assocation	\N	2026-03-10 21:03:24.423774-07	Active	\N
237	National Alliance on Mental Illness at UNR	\N	2026-03-10 21:03:24.423774-07	Active	\N
238	National Association of Hispanic Journalists UNR Chapter	\N	2026-03-10 21:03:24.423774-07	Active	\N
239	National Society of Black Engineers	\N	2026-03-10 21:03:24.423774-07	Active	\N
240	National Student Speech Language Hearing Assocation	\N	2026-03-10 21:03:24.423774-07	Active	\N
241	Natural Resources & Environmental Science	\N	2026-03-10 21:03:24.423774-07	Active	\N
242	Nepalese Student Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
243	Neuroscience Outreach Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
244	Nevada 7on7 Football Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
245	Nevada Airsoft Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
246	Nevada Association for Psychological Science	\N	2026-03-10 21:03:24.423774-07	Active	\N
247	Nevada Athletics	\N	2026-03-10 21:03:24.423774-07	Active	\N
248	Nevada Boxing	\N	2026-03-10 21:03:24.423774-07	Active	\N
249	Nevada Brazilian Jiu Jitsu	\N	2026-03-10 21:03:24.423774-07	Active	\N
250	Nevada Bureau of Mines & Geology	\N	2026-03-10 21:03:24.423774-07	Active	\N
251	Nevada Career Studio	\N	2026-03-10 21:03:24.423774-07	Active	\N
252	Nevada Center for Excellence in Disabilities	\N	2026-03-10 21:03:24.423774-07	Active	\N
253	Nevada Circle K International	\N	2026-03-10 21:03:24.423774-07	Active	\N
254	Nevada Climbing	\N	2026-03-10 21:03:24.423774-07	Active	\N
255	Nevada Club Baseball	\N	2026-03-10 21:03:24.423774-07	Active	\N
256	Nevada Club Basketball	\N	2026-03-10 21:03:24.423774-07	Active	\N
257	Nevada Club Golf	\N	2026-03-10 21:03:24.423774-07	Active	\N
258	Nevada Club Swimming	\N	2026-03-10 21:03:24.423774-07	Active	\N
260	Nevada Cyber Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
261	Nevada Cycling	\N	2026-03-10 21:03:24.423774-07	Active	\N
262	Nevada Dining	\N	2026-03-10 21:03:24.423774-07	Active	\N
263	Nevada Disney Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
264	Nevada Electric Racing	\N	2026-03-10 21:03:24.423774-07	Active	\N
265	Nevada Esports	\N	2026-03-10 21:03:24.423774-07	Active	\N
266	Nevada Filipino Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
267	Nevada First-Gen Network	\N	2026-03-10 21:03:24.423774-07	Active	\N
268	Nevada Football	\N	2026-03-10 21:03:24.423774-07	Active	\N
269	Nevada Freeride	\N	2026-03-10 21:03:24.423774-07	Active	\N
270	Nevada Glee Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
271	Nevada Helping Hands	\N	2026-03-10 21:03:24.423774-07	Active	\N
272	Nevada Hockey Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
273	Nevada Horror Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
274	Nevada Latin Dance Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
275	Nevada Living Learning Community	\N	2026-03-10 21:03:24.423774-07	Active	\N
276	Nevada Loggers	\N	2026-03-10 21:03:24.423774-07	Active	\N
277	Nevada Magic: the Gathering Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
278	Nevada Math & Technology Program	\N	2026-03-10 21:03:24.423774-07	Active	\N
279	Nevada Men's Club Volleyball	\N	2026-03-10 21:03:24.423774-07	Active	\N
280	Nevada Men's Lacrosse	\N	2026-03-10 21:03:24.423774-07	Active	\N
281	Nevada Men's Soccer	\N	2026-03-10 21:03:24.423774-07	Active	\N
282	Nevada Microbiology Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
283	Nevada Mock Trial Team	\N	2026-03-10 21:03:24.423774-07	Active	\N
284	Nevada Money Mentors	\N	2026-03-10 21:03:24.423774-07	Active	\N
285	Nevada Neuro Society	\N	2026-03-10 21:03:24.423774-07	Active	\N
286	Nevada Origami	\N	2026-03-10 21:03:24.423774-07	Active	\N
287	Nevada Physical Therapy Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
288	Nevada Pre-Dental Society	\N	2026-03-10 21:03:24.423774-07	Active	\N
289	Nevada Pre-Optometry Assocation	\N	2026-03-10 21:03:24.423774-07	Active	\N
290	Nevada Recovery and Prevention	\N	2026-03-10 21:03:24.423774-07	Active	\N
291	Nevada Sailing Team	\N	2026-03-10 21:03:24.423774-07	Active	\N
292	Nevada Scholars of Tomorrow	\N	2026-03-10 21:03:24.423774-07	Active	\N
293	Nevada Seismological Laboratory	\N	2026-03-10 21:03:24.423774-07	Active	\N
294	Nevada Shotgun Sports Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
295	Nevada Spikeball	\N	2026-03-10 21:03:24.423774-07	Active	\N
296	Nevada Student Ambassadors	\N	2026-03-10 21:03:24.423774-07	Active	\N
297	Nevada Student Investment Organization	\N	2026-03-10 21:03:24.423774-07	Active	\N
298	Nevada Taekwondo Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
299	Nevada Timber Strong	\N	2026-03-10 21:03:24.423774-07	Active	\N
300	Nevada Venture Capital Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
301	Nevada Women's Club Soccer	\N	2026-03-10 21:03:24.423774-07	Active	\N
302	Nevada Women's Flag Football Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
303	Nevada Women's Rugby Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
304	Nevada Women's Ultimate Frisbee	\N	2026-03-10 21:03:24.423774-07	Active	\N
305	NevadaCARES	\N	2026-03-10 21:03:24.423774-07	Active	\N
306	NevadaTeach  	\N	2026-03-10 21:03:24.423774-07	Active	\N
307	NevadaTeach STEM Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
308	New Student Initiatives	\N	2026-03-10 21:03:24.423774-07	Active	\N
309	Newman Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
310	No'o Patu Natuenetooena	\N	2026-03-10 21:03:24.423774-07	Active	\N
311	Northern Nevada International Center	\N	2026-03-10 21:03:24.423774-07	Active	\N
312	Nu Alpha Kappa Fraternity, Inc.	\N	2026-03-10 21:03:24.423774-07	Active	\N
313	Nu Rho Psi	\N	2026-03-10 21:03:24.423774-07	Active	\N
314	NV INBRE	\N	2026-03-10 21:03:24.423774-07	Active	\N
315	Nye Hall	\N	2026-03-10 21:03:24.423774-07	Active	\N
316	Office for Community Faculty	\N	2026-03-10 21:03:24.423774-07	Active	\N
317	Office of Animal Resources	\N	2026-03-10 21:03:24.423774-07	Active	\N
318	Office of Digital Learning	\N	2026-03-10 21:03:24.423774-07	Active	\N
319	Office of Government Relations & Community Engagement	\N	2026-03-10 21:03:24.423774-07	Active	\N
320	Office of International Students and Scholars	\N	2026-03-10 21:03:24.423774-07	Active	\N
321	Office of Marketing and Communications	\N	2026-03-10 21:03:24.423774-07	Active	\N
322	Office of Service-Learning and Civic Engagement	\N	2026-03-10 21:03:24.423774-07	Active	\N
323	Office of the President	\N	2026-03-10 21:03:24.423774-07	Active	\N
324	Office of the Provost	\N	2026-03-10 21:03:24.423774-07	Active	\N
325	Office of Undergraduate Fellowships	\N	2026-03-10 21:03:24.423774-07	Active	\N
326	Omega Delta Phi	\N	2026-03-10 21:03:24.423774-07	Active	\N
327	Order of Omega	\N	2026-03-10 21:03:24.423774-07	Active	\N
328	Organizational Resilience	\N	2026-03-10 21:03:24.423774-07	Active	\N
329	Orvis School of Nursing	\N	2026-03-10 21:03:24.423774-07	Active	\N
330	Orvis Student Nurses Assocation	\N	2026-03-10 21:03:24.423774-07	Active	\N
331	Ozmen Institute for Entrepreneurship	\N	2026-03-10 21:03:24.423774-07	Active	\N
332	Ozmen Institute for Global Studies	\N	2026-03-10 21:03:24.423774-07	Active	\N
333	PA Studies Program - UNR Med	\N	2026-03-10 21:03:24.423774-07	Active	\N
334	Pack Disc Golf	\N	2026-03-10 21:03:24.423774-07	Active	\N
335	Pack LIfe Admin Group	\N	2026-03-10 21:03:24.423774-07	Active	\N
336	Pack Mentor Program	\N	2026-03-10 21:03:24.423774-07	Active	\N
337	Pack Pilots	\N	2026-03-10 21:03:24.423774-07	Active	\N
338	Pack Provisions	\N	2026-03-10 21:03:24.423774-07	Active	\N
339	Pakistani Student Assocation (Graduate Chaper)	\N	2026-03-10 21:03:24.423774-07	Active	\N
340	Pakistani Student Assocation (Undergraduate Chaper)	\N	2026-03-10 21:03:24.423774-07	Active	\N
341	Participation, Activites, and Companionship Klub	\N	2026-03-10 21:03:24.423774-07	Active	\N
342	Payment 4 Placements - UNR	\N	2026-03-10 21:03:24.423774-07	Active	\N
343	Peavine Hall	\N	2026-03-10 21:03:24.423774-07	Active	\N
344	Phi Alpha Delta Law Fraternity, International	\N	2026-03-10 21:03:24.423774-07	Active	\N
345	Phi Delta Epsilon - Nevada Alpha Chapter	\N	2026-03-10 21:03:24.423774-07	Active	\N
346	Phi Delta Theta	\N	2026-03-10 21:03:24.423774-07	Active	\N
347	Phi Kappa Phi	\N	2026-03-10 21:03:24.423774-07	Active	\N
348	Phiosophy Deparment	\N	2026-03-10 21:03:24.423774-07	Active	\N
349	PhiSigma Rho Sorority	\N	2026-03-10 21:03:24.423774-07	Active	\N
350	Pi Beta Phi Fraternity For Women	\N	2026-03-10 21:03:24.423774-07	Active	\N
351	Pi Tau Sigma Beta Nu	\N	2026-03-10 21:03:24.423774-07	Active	\N
352	Pickleball Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
353	Planned Parenthood Generation Action UNR	\N	2026-03-10 21:03:24.423774-07	Active	\N
354	Planning, Budge & Analysis	\N	2026-03-10 21:03:24.423774-07	Active	\N
355	Pokemon Go Pack	\N	2026-03-10 21:03:24.423774-07	Active	\N
356	Political Science Graduate Student Organization	\N	2026-03-10 21:03:24.423774-07	Active	\N
357	Polymath Wannabes - UNR Chapter	\N	2026-03-10 21:03:24.423774-07	Active	\N
358	Pre-Health Advisory Council	\N	2026-03-10 21:03:24.423774-07	Active	\N
359	Pre-OT Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
360	Pre-PA Society Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
361	Pre-Pharmacy Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
362	Pre-Student Osteopathic Medical Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
363	Prim LIbrary, University of Nevada, Reno at Lake Tahoe	\N	2026-03-10 21:03:24.423774-07	Active	\N
364	Provost Office (Lake Tahoe)	\N	2026-03-10 21:03:24.423774-07	Active	\N
365	Psi Chi	\N	2026-03-10 21:03:24.423774-07	Active	\N
366	Psychiatry & Behavioral Sciences	\N	2026-03-10 21:03:24.423774-07	Active	\N
367	Psychology Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
368	Public Health Coalition	\N	2026-03-10 21:03:24.423774-07	Active	\N
369	Public Health Student Advisory Committee	\N	2026-03-10 21:03:24.423774-07	Active	\N
370	Public Releations Student Society of America	\N	2026-03-10 21:03:24.423774-07	Active	\N
371	Queer and LGBT Advocacy Board	\N	2026-03-10 21:03:24.423774-07	Active	\N
372	Queer Student Union	\N	2026-03-10 21:03:24.423774-07	Active	\N
373	Recovery Rising	\N	2026-03-10 21:03:24.423774-07	Active	\N
374	Reno College Panhellenic Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
375	Reno Cubing Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
376	RenoACDA	\N	2026-03-10 21:03:24.423774-07	Active	\N
377	Reproductive Freedom for All UNR	\N	2026-03-10 21:03:24.423774-07	Active	\N
378	Research & Innovation	\N	2026-03-10 21:03:24.423774-07	Active	\N
379	Research Integrity	\N	2026-03-10 21:03:24.423774-07	Active	\N
380	Residence Hall Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
381	Residential Life, Housing, and Food Services	\N	2026-03-10 21:03:24.423774-07	Active	\N
382	Resonate Community	\N	2026-03-10 21:03:24.423774-07	Active	\N
383	Reynolds School of Journalism	\N	2026-03-10 21:03:24.423774-07	Active	\N
384	Reynolds School of Journalism Student Council	\N	2026-03-10 21:03:24.423774-07	Active	\N
385	Ronald E. McNair Post-Baccalaureate Achievement Program	\N	2026-03-10 21:03:24.423774-07	Active	\N
386	ROTC Ranger Challenge	\N	2026-03-10 21:03:24.423774-07	Active	\N
387	Sanford Center for Aging	\N	2026-03-10 21:03:24.423774-07	Active	\N
388	Scheduling Services	\N	2026-03-10 21:03:24.423774-07	Active	\N
389	Scholars Honing Ambitions & Professional Excellence	\N	2026-03-10 21:03:24.423774-07	Active	\N
390	School of Medicine - Admissions and Student Affairs	\N	2026-03-10 21:03:24.423774-07	Active	\N
391	School of Medicine - Basic Sciences	\N	2026-03-10 21:03:24.423774-07	Active	\N
392	School of Medicine - Medical Education	\N	2026-03-10 21:03:24.423774-07	Active	\N
393	School of Medicine - Office of Academic Affairs	\N	2026-03-10 21:03:24.423774-07	Active	\N
394	School of Public Health	\N	2026-03-10 21:03:24.423774-07	Active	\N
395	School of Social Work	\N	2026-03-10 21:03:24.423774-07	Active	\N
396	Sierra Hall	\N	2026-03-10 21:03:24.423774-07	Active	\N
397	Sigma Alpha Epsilon 	\N	2026-03-10 21:03:24.423774-07	Active	\N
398	Sigma Alpha Epsilon Pi	\N	2026-03-10 21:03:24.423774-07	Active	\N
399	Sigma Kappa	\N	2026-03-10 21:03:24.423774-07	Active	\N
400	Sigma Omega Nu, Latina Interest Sorority Inc.	\N	2026-03-10 21:03:24.423774-07	Active	\N
401	Sigma Tau Gamma	\N	2026-03-10 21:03:24.423774-07	Active	\N
402	Skate Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
403	Social Psychology Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
404	Social Psychology Program	\N	2026-03-10 21:03:24.423774-07	Active	\N
405	Social Work Associated Graduates	\N	2026-03-10 21:03:24.423774-07	Active	\N
406	Society for the Advancement of Chicanos/Hispanics and Native Americans in Science	\N	2026-03-10 21:03:24.423774-07	Active	\N
407	Society of Ethnic Cultures	\N	2026-03-10 21:03:24.423774-07	Active	\N
408	Society of Hispanic Professional Engineers	\N	2026-03-10 21:03:24.423774-07	Active	\N
409	Society of Physics Students	\N	2026-03-10 21:03:24.423774-07	Active	\N
410	Society of Women Engineers	\N	2026-03-10 21:03:24.423774-07	Active	\N
411	Sociology Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
412	Speech Pathology and Audiology	\N	2026-03-10 21:03:24.423774-07	Active	\N
413	Sri Lankan Students Assocation	\N	2026-03-10 21:03:24.423774-07	Active	\N
414	Steel Bridge	\N	2026-03-10 21:03:24.423774-07	Active	\N
415	Student Activities at Lake Tahoe	\N	2026-03-10 21:03:24.423774-07	Active	\N
416	Student ASsociation of Geoscience and Engineering	\N	2026-03-10 21:03:24.423774-07	Active	\N
417	Student Engagements	\N	2026-03-10 21:03:24.423774-07	Active	\N
418	Student Health Center	\N	2026-03-10 21:03:24.423774-07	Active	\N
419	Student Organ Donation Advocates	\N	2026-03-10 21:03:24.423774-07	Active	\N
420	Student Persistence Research Office	\N	2026-03-10 21:03:24.423774-07	Active	\N
421	Student Trauma Intervention Program	\N	2026-03-10 21:03:24.423774-07	Active	\N
422	Students Against ICE Abuses	\N	2026-03-10 21:03:24.423774-07	Active	\N
423	Students Against Trafficking & Exploitation	\N	2026-03-10 21:03:24.423774-07	Active	\N
424	Sustainable Solutions Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
425	The Biggest Little Shadow Cast	\N	2026-03-10 21:03:24.423774-07	Active	\N
426	The Book Bees	\N	2026-03-10 21:03:24.423774-07	Active	\N
427	The Downing Counseling Clinic	\N	2026-03-10 21:03:24.423774-07	Active	\N
428	The Graduate Board of Anthropoloogy Students	\N	2026-03-10 21:03:24.423774-07	Active	\N
429	The High Sierra Rambler	\N	2026-03-10 21:03:24.423774-07	Active	\N
430	The Meteorology and Climatology Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
431	The Multicultural Center	\N	2026-03-10 21:03:24.423774-07	Active	\N
432	The Multicultural Center: Asian & Pacific Islander Programs	\N	2026-03-10 21:03:24.423774-07	Active	\N
433	The Multicultural Center: Black Student Programs	\N	2026-03-10 21:03:24.423774-07	Active	\N
434	The Multicultural Center: Indigenous Student Programs	\N	2026-03-10 21:03:24.423774-07	Active	\N
435	The Multicultural Center: Latinx Programs	\N	2026-03-10 21:03:24.423774-07	Active	\N
436	The Multicultural Center: LGBTQIA2S+	\N	2026-03-10 21:03:24.423774-07	Active	\N
437	The Nevada Medical Research Consortium	\N	2026-03-10 21:03:24.423774-07	Active	\N
438	The Nevada Sagebrush	\N	2026-03-10 21:03:24.423774-07	Active	\N
439	The Office of General Counsel	\N	2026-03-10 21:03:24.423774-07	Active	\N
440	The Outdoor Advneture and Leadership Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
441	The Packtivists	\N	2026-03-10 21:03:24.423774-07	Active	\N
442	The School of Social Work Student Advisory Board	\N	2026-03-10 21:03:24.423774-07	Active	\N
443	The Student Chapter of the Society for Range Management	\N	2026-03-10 21:03:24.423774-07	Active	\N
444	The University of Nevada, Reno Student Chapter of The Wildlife Society	\N	2026-03-10 21:03:24.423774-07	Active	\N
445	The UNR Digital Art Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
446	The UNR Film Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
447	Theatre & Dance	\N	2026-03-10 21:03:24.423774-07	Active	\N
448	Theta Tau	\N	2026-03-10 21:03:24.423774-07	Active	\N
449	Touhou Project Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
450	Turkish Cultural Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
451	Turning Point USA	\N	2026-03-10 21:03:24.423774-07	Active	\N
452	Undergraduate Behavior Analysis Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
453	Undergraduate Research	\N	2026-03-10 21:03:24.423774-07	Active	\N
454	Univeristy of Nevada, Reno Extension 4-H Youth Development	\N	2026-03-10 21:03:24.423774-07	Active	\N
455	Univeristy of Nevada, Reno Roller Coaster Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
456	Univeristy Police Department - Northern Command	\N	2026-03-10 21:03:24.423774-07	Active	\N
457	Univeristy Tutoring Center	\N	2026-03-10 21:03:24.423774-07	Active	\N
458	University Advancement, Donor Relations	\N	2026-03-10 21:03:24.423774-07	Active	\N
459	University Advising	\N	2026-03-10 21:03:24.423774-07	Active	\N
460	University Center for Economic Development	\N	2026-03-10 21:03:24.423774-07	Active	\N
461	University Events	\N	2026-03-10 21:03:24.423774-07	Active	\N
462	University Libraries	\N	2026-03-10 21:03:24.423774-07	Active	\N
463	University Math Center	\N	2026-03-10 21:03:24.423774-07	Active	\N
464	University of Nevada Education Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
465	University of Nevada Reno Consulting Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
466	University of Nevada Reno Rodeo Team	\N	2026-03-10 21:03:24.423774-07	Active	\N
467	University of Nevada Thousand Pound Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
468	University of Nevada Winter Sports Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
469	University of Nevada, Reno Chapter of the American Medical Women's Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
470	University of Nevada, Reno Clarinet Pack	\N	2026-03-10 21:03:24.423774-07	Active	\N
471	University of Nevada, Reno Country Dance Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
472	University of Nevada, Reno Debate Team	\N	2026-03-10 21:03:24.423774-07	Active	\N
473	University of Nevada, Reno Equestrian Team	\N	2026-03-10 21:03:24.423774-07	Active	\N
474	University of Nevada, Reno Hawaii Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
475	University of Nevada, Reno School of Medicine	\N	2026-03-10 21:03:24.423774-07	Active	\N
476	University of Nevada, Reno School of the Arts	\N	2026-03-10 21:03:24.423774-07	Active	\N
477	University Student Social Work Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
478	University Studies Abroad Consortium	\N	2026-03-10 21:03:24.423774-07	Active	\N
479	University Writing & Speaking Center	\N	2026-03-10 21:03:24.423774-07	Active	\N
480	UNR Acroyoga Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
481	UNR Aerospace Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
482	UNR African Students' Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
483	UNR AIAA	\N	2026-03-10 21:03:24.423774-07	Active	\N
484	UNR Alpine Club Team	\N	2026-03-10 21:03:24.423774-07	Active	\N
485	UNR Astronomy Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
486	UNR Audio Engineering Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
487	UNR Best Buddies	\N	2026-03-10 21:03:24.423774-07	Active	\N
488	UNR Bhangra Giddha	\N	2026-03-10 21:03:24.423774-07	Active	\N
489	UNR Bridge Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
490	UNR Chemistry Department	\N	2026-03-10 21:03:24.423774-07	Active	\N
491	UNR Civics Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
492	UNR Comics Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
493	UNR Cricket Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
494	UNR Crochet Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
495	UNR Department of Economics	\N	2026-03-10 21:03:24.423774-07	Active	\N
496	UNR Diabetes - Diabetes Advocacy Community and Education	\N	2026-03-10 21:03:24.423774-07	Active	\N
497	UNR Digital Know-How	\N	2026-03-10 21:03:24.423774-07	Active	\N
498	UNR Ducks Unlimited Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
499	UNR Economics Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
500	UNR Engineering Career Services	\N	2026-03-10 21:03:24.423774-07	Active	\N
501	UNR Gray for Glioblastoma	\N	2026-03-10 21:03:24.423774-07	Active	\N
502	UNR Horn Pack	\N	2026-03-10 21:03:24.423774-07	Active	\N
503	UNR Improv	\N	2026-03-10 21:03:24.423774-07	Active	\N
504	UNR Innevation Center	\N	2026-03-10 21:03:24.423774-07	Active	\N
505	UNR Institute for Neuroscience	\N	2026-03-10 21:03:24.423774-07	Active	\N
506	UNR International Education Week 	\N	2026-03-10 21:03:24.423774-07	Active	\N
507	UNR Linguistics Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
508	UNR Mathematics Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
509	UNR Med - Admissions	\N	2026-03-10 21:03:24.423774-07	Active	\N
510	UNR Med Classified Collective	\N	2026-03-10 21:03:24.423774-07	Active	\N
511	UNR Med Events + Protocol	\N	2026-03-10 21:03:24.423774-07	Active	\N
512	UNR Med Students Affairs	\N	2026-03-10 21:03:24.423774-07	Active	\N
513	UNR Men's Rugby	\N	2026-03-10 21:03:24.423774-07	Active	\N
514	UNR Mindfulness Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
515	UNR Music Teachers Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
516	UNR National Association for Music Education Collegiate	\N	2026-03-10 21:03:24.423774-07	Active	\N
517	UNR Nerf Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
518	UNR Power People	\N	2026-03-10 21:03:24.423774-07	Active	\N
519	UNR Pre-Vet Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
520	UNR Public Health PhD Student Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
521	UNR Robotics	\N	2026-03-10 21:03:24.423774-07	Active	\N
522	UNR Running Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
523	UNR Sikh Student Associaiton	\N	2026-03-10 21:03:24.423774-07	Active	\N
524	UNR Smoothie Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
525	UNR Spanish Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
526	UNR Surf and Taco Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
527	UNR Survivor Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
528	UNR Sweet Treats Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
529	UNR Table Tennis Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
530	UNR theatre and Dance Student Council	\N	2026-03-10 21:03:24.423774-07	Active	\N
531	UNR Veteran Support Team	\N	2026-03-10 21:03:24.423774-07	Active	\N
532	UNR Wargaming Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
533	UNR Wrestling Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
534	UNRtists: Student Art Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
535	Uplift Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
536	Upward Bound	\N	2026-03-10 21:03:24.423774-07	Active	\N
537	Urban Dance Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
538	Urban Dance Club - Contemporary Unit	\N	2026-03-10 21:03:24.423774-07	Active	\N
539	Urban Dance Club - K-pop Unit	\N	2026-03-10 21:03:24.423774-07	Active	\N
540	Veteran Services	\N	2026-03-10 21:03:24.423774-07	Active	\N
541	Vice President of Student Services	\N	2026-03-10 21:03:24.423774-07	Active	\N
542	Video Game Club at Lake Tahoe	\N	2026-03-10 21:03:24.423774-07	Active	\N
543	Vietnamese Student Association	\N	2026-03-10 21:03:24.423774-07	Active	\N
544	Water Ski and Wakeboard Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
545	We Walk!	\N	2026-03-10 21:03:24.423774-07	Active	\N
546	Welcome Center, Office for Prospective Students	\N	2026-03-10 21:03:24.423774-07	Active	\N
547	Western Association of Student Financial Aid Administrators	\N	2026-03-10 21:03:24.423774-07	Active	\N
548	Wolf Pack AI Collective	\N	2026-03-10 21:03:24.423774-07	Active	\N
549	Wolf Pack Entrepreneurship Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
550	Wolf Pack Finance	\N	2026-03-10 21:03:24.423774-07	Active	\N
551	Wolf Pack Miracle Network	\N	2026-03-10 21:03:24.423774-07	Active	\N
552	Wolf Pack Powerlifting	\N	2026-03-10 21:03:24.423774-07	Active	\N
553	Wolf Pack Racing	\N	2026-03-10 21:03:24.423774-07	Active	\N
554	Wolf Pack Radio	\N	2026-03-10 21:03:24.423774-07	Active	\N
555	Wolf Pack Swing Dance Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
556	Wolf Pack Taiko	\N	2026-03-10 21:03:24.423774-07	Active	\N
557	Wolf Pack Trumpet Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
558	Wolf Pack Veterans Club	\N	2026-03-10 21:03:24.423774-07	Active	\N
559	WolfCard Office	\N	2026-03-10 21:03:24.423774-07	Active	\N
560	WOLFPACK BATTALION	\N	2026-03-10 21:03:24.423774-07	Active	\N
561	Wolfpack Spartans	\N	2026-03-10 21:03:24.423774-07	Active	\N
562	Women In Aviation	\N	2026-03-10 21:03:24.423774-07	Active	\N
563	Women in Mining University of Nevada, Reno	\N	2026-03-10 21:03:24.423774-07	Active	\N
564	Women of Color Collective	\N	2026-03-10 21:03:24.423774-07	Active	\N
565	Women of Color Collective - Graduate Chapter	\N	2026-03-10 21:03:24.423774-07	Active	\N
566	Women's Club Lacrosse	\N	2026-03-10 21:03:24.423774-07	Active	\N
567	Women's Club Volleyball	\N	2026-03-10 21:03:24.423774-07	Active	\N
568	Writing and Mindfulness	\N	2026-03-10 21:03:24.423774-07	Active	\N
569	Young Democratic Socialists of Reno	\N	2026-03-10 21:03:24.423774-07	Active	\N
570	Young Democrats of University of Nevada Reno	\N	2026-03-10 21:03:24.423774-07	Active	\N
3	Academic Council for Democratic Iran	ACDI is an organization established to promote public awareness of issues concerning democracy and human rights in Iran while advancing the liaison of the Iranian diaspora to strengthen an independent academic alliance for a democratic and free Iran, through its programs of research, publications, events, and public outreach.\n\nThe ACDI is an independent organization with no political affiliation.	2026-03-10 21:03:24.423774-07	Active	{activism}
5	Administration and Finance 	Essential planning and operational services for the university.	2026-03-10 21:03:24.423774-07	Active	\N
1	3D Printing Club	The 3D Printing Club aims to teach others about maker culture through a variety of student projects and hands-on activities, including 3D printing, crafting, cosplay, robotics, woodworking, electronics, programming, and 3D modeling. This goal includes teaching members how to use various tools and machines, design models and parts for different fabrication processes, and work on collaborative projects. The club provides students with important knowledge about design philosophies, engineering techniques, and how to translate concepts into reality. Through collaborative projects, skill-building sessions, and networking events, the 3D Printing Club cultivates a vibrant community of makers passionate about exploring new technologies and crafting innovative solutions. These concepts can be applied to academic courses and provide valuable experience for career paths in engineering and related fields. Whether you are a seasoned maker or a curious beginner, join us to bring your ideas to life, discover, create, and grow!	2026-03-10 21:03:24.423774-07	Active	{academic}
2	A.B.L.E Women	Chartered April 1st, 2000, A.B.L.E Women of UNR was the first  is a vibrant,  all inclusive network dedicated to celebrating and advancing women from all backgrounds. Our mission is to provide a supportive and dynamic platform where women of ambition, beauty, leadership, and equality can connect, collaborate, and thrive.\n\nWe believe that every woman brings a unique perspective and strength to the table, and our diverse membership reflects this rich tapestry of experiences. Through networking events, leadership workshops, and cultural exchanges, we empower our members to achieve their personal and professional goals while fostering a community built on mutual respect and shared aspirations.\n\nJoin us in celebrating the power of diversity and the pursuit of excellence. Whether you're an aspiring leader, a creative visionary, or a champion of equality, the Empowerment Collective is here to support and inspire you on your journey!	2026-03-10 21:03:24.423774-07	Active	{activism}
10	Agriculture, Veterinary and Rangeland Science Department 	The Department of Agriculture, Veterinary and Rangeland Science is an academic department in the College of Agriculture, Biotechnology and Natural Resources.	2026-03-10 21:03:24.423774-07	Active	{academic}
13	Alpha Epsilion Pi	Alpha Epsilon Pi is a Jewish fraternity, and brotherhood in Alpha Epsilon Pi is open to any Jewish and non-Jewish men who are willing to espouse its values and mission: developing future leaders in the Jewish community through daily acts of brotherhood, charity, social awareness, and support for Jewish communities. The Nevada chapter, Upsilon Nu, prides itself in our strong brotherly connections, community engagement, and active local alumni.\n\nWe are our brothers' keeper.	2026-03-10 21:03:24.423774-07	Active	\N
16	Alpha Phi Omega	Alpha Phi Omega is a national co-ed professional service fraternity. Its purpose is to develop leadership, promote friendship and provide service to humanity. More than 500,000 students on 375 college campuses have chosen Alpha Phi Omega, making it the nation’s largest Greek letter fraternity. \n\nThe Upsilon Psi chapter at the University of Nevada, Reno was chartered on May 28, 2018. Since then, we strive to exemplify the ideals of leadership, friendship, and service. We offer workshops and various officer positions to grow as leaders, host brotherhood events to strengthen our connections with one another and provide volunteering opportunities both on and off campus to serve our fraternity, campus, community, and nation.	2026-03-10 21:03:24.423774-07	Active	\N
17	Alpha Pi Sigma Sorority Incorporated	Alpha Pi Sigma Sorority, Incorporated. is a Latina based sorority that is not exclusive. Members of Alpha Pi Sigma strive academically, personally and professionally in a commitment to excellence with a desire to support one another. Alphas are scholars, leaders, contributors and lifetime members of an infinite Alphahood who hold their values close to heart. 	2026-03-10 21:03:24.423774-07	Active	\N
4	Academic Mentors 	The Academic Mentor (AM) position at the University of Nevada, Reno focuses on the academic success of our on-campus students, as this is a crucial component of our residence halls. These Academic Mentors are trained undergraduate student staff who live on-campus to assist students with acclimating to the university environment, building a positive community and navigating the academic environment. The Academic Mentor will serve students living in all residence halls by helping to bridge the residence hall living environments with what occurs in the classrooms of the University. Academic Mentors supplement the residential experience by providing more extensive academic resources and in-depth individual and group academic attention. Academic Mentors collaborate as a team to provide academic support to all on-campus residents, no matter the residence hall they live in. \n\n	2026-03-10 21:03:24.423774-07	Active	{academic}
14	Alpha Kappa Psi 	Alpha Kappa Psi is a Professional Co-ed Business Fraternity founded in 1904 with the purpose of developing its members into principled business leaders. Originally founded by 4 men at New York University, the professional organization now has over 298,000 initiated members at 219 universities in 4 countries. Alpha Kappa Psi has grown to be the oldest and largest business fraternity in the world! With an extensive network of alumni, members are able to land opportunities at some of the most profitable companies in the world. As one of the best professional co-ed business fraternities, we are truly preparing our brothers for a life of success.	2026-03-10 21:03:24.423774-07	Active	{academic}
24	American Medical Women's Association Branch at UNR Medical School	\N	2026-03-10 21:03:24.423774-07	Active	{activism}
55	Black Student Organization 	\N	2026-03-10 21:03:24.423774-07	Active	{activism}
11	Alianza	Alianza was founded in 2017 at the University of Nevada, Reno as an association of Chicanx, Latinx and Indigenous faculty and staff members who were interested in shaping and advancing diversity initiatives on campus while addressing issues pertinent to diverse communities.\n\nMission statement\nAlianza is an association dedicated to creating a collaborative and generative environment that addresses topics relevant to Chicanx, Latinx, Indigenous, and other underrepresented groups in order to advance educational, research, professional development, and diversity initiatives at the University of Nevada, Reno and in our respective communities. ¡Que viva la causa!\n\nPurpose\nAlianza aims to:\n\nProvide networking, professional development and mentoring opportunities\nAssist with efforts to recruit and retain diverse faculty, staff and students\nAdvance research related to Chicanx, Latinx and Indigenous studies\nFacilitate critical discourse and shape policies that advance diversity initiatives\nCommunicate effectively and cooperate with the appropriate university officials to address concerns and provide solutions to relevant issues\nServe in an advisory capacity to the University administration and other entities on campus\nEducate the university community and the community at large about Chicanx, Latinx, and Indigenous issues and initiatives	2026-03-10 21:03:24.423774-07	Active	{academic}
12	Alpha Eplsilon Delta	Our club focuses on serving our community and developing skills needed for professional school. Our club is open to any students who are pursuing professional or graduate school in any health-related field which includes medical and dental school, physical therapy programs, and even nursing students interested in pursuing a graduate degree. 	2026-03-10 21:03:24.423774-07	Active	{academic}
15	Alpha Phi Gamma	Alpha Phi Gamma National Sorority Inc. was established on February 1st, 1994 at California State Polytechnic University Pomona. Seven women founded the sorority: Allex Choi, Candy Cunanan, Christine Nguyen, Sandie Rillera, Kolleen Kim, Grace Hsieh and Jennifer Oku. These Sisters wanted to bring together all women of different nationalities through the bonds of friendship and sisterhood.\n\nOn May 21, 2011, the determination and devotion to bring Alpha Phi Gamma to the University of Nevada, Reno became a reality by our 17 charters, known as the Charter Charger Girls Class. We received chapter status on July 13, 2013 and became recognized as the Kappa Chapter. On May 2nd, 2021, Kappa Chapter was re-established by 9 re-charters, known as the Iota Poison Ivy Class. \n\nSince our establishment, we have grown to have 76 sisters in our chapter and counting!\n\nAlpha Phi Gamma is committed to bettering our communities! Our official philanthropy is the Fight Against Violence Towards Women. We are also part of the National Coalition Against Domestic Violence (NCADV). 	2026-03-10 21:03:24.423774-07	Active	{academic,api}
23	American Medical Student Association 	The American Medical Student Association (AMSA) is a pre-medicine club committed to assisting, guiding, and supporting students on their path to medicine. We strive to create a general framework for our members to build off of and/or adjust to their specific needs, along with a foundation of pre-medical resources for our members to thrive from. Such resources include guest speakers, volunteer opportunities, information sessions, workshops, MCAT practice, mock interviews, clinical experience opportunities, and, most importantly, social events. Providing a place for students of similar interests to connect and interact is vital to the success of our members and our club as a whole. Our overall goal is to continue molding and shaping our members to be better prepared than ever before through constant effort, engagement, and communication.	2026-03-10 21:03:24.423774-07	Active	{activism}
32	AsPIre	Mission statement\nAsPIre is dedicated to promoting a collaborative and generative environment for Asian, Asian American and Indigenous Pacific Islander faculty, staff and students on campus and beyond. We work towards fostering an inclusive community and cultivating professional, institutional and personal development of and for our members.\n\nPurpose\nAsPIre aims to:\n\nGrow a community of Asian, Asian American and Indigenous Pacific Islander faculty and staff through networking, professional development and mentoring.\nAssist with efforts to recruit and retain diverse faculty and staff.\nMentor and support Asian, Asian American and Indigenous Pacific Islander students.\nCommunicate relevant concerns with University members and work towards policies and institutional solutions.\nIncrease the visibility and celebrate the diversity and vibrancy of the Asian, Asian American and Indigenous Pacific Islander communities at University of Nevada, Reno.\nEducate the University and wider community about Asian, Asian American and Indigenous Pacific Islander issues and initiatives.	2026-03-10 21:03:24.423774-07	Active	{api}
65	Care Club	\N	2026-03-10 21:03:24.423774-07	Active	{activism}
114	Department of World Languages 	\N	2026-03-10 21:03:24.423774-07	Active	{api}
259	Nevada Club Waterpolo	Our objective is to teach cyber skills to students and provide community outreach that will connect members to jobs in the field of Cyber Security (and Cyber in general) upon graduation.\n\nAs a club, we are dedicated to conducting research that will help to make advancements in policy and serve to better inform our community and the cyber world at large.	2026-03-10 21:03:24.423774-07	Active	\N
\.


--
-- TOC entry 5145 (class 0 OID 17004)
-- Dependencies: 225
-- Data for Name: Club Membership; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."Club Membership" (id, club, "user", is_active, dues_paid, role) FROM stdin;
\.


--
-- TOC entry 5150 (class 0 OID 17016)
-- Dependencies: 230
-- Data for Name: Event; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."Event" (id, club, name, description, start_datetime, end_datetime, location, created_at) FROM stdin;
\.


--
-- TOC entry 5153 (class 0 OID 17025)
-- Dependencies: 233
-- Data for Name: File Resource; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."File Resource" (id, club, source_url, created_at) FROM stdin;
\.


--
-- TOC entry 5170 (class 0 OID 24918)
-- Dependencies: 250
-- Data for Name: Notification Recipient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Notification Recipient" (id, notif, "user") FROM stdin;
\.


--
-- TOC entry 5156 (class 0 OID 17038)
-- Dependencies: 236
-- Data for Name: Notifications; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."Notifications" (id, club, title, message, created_at, created_by) FROM stdin;
\.


--
-- TOC entry 5160 (class 0 OID 17053)
-- Dependencies: 240
-- Data for Name: Task; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."Task" (id, club, title, description, due_date, created_at, updated_at, priority, status) FROM stdin;
\.


--
-- TOC entry 5161 (class 0 OID 17066)
-- Dependencies: 241
-- Data for Name: Task Assignment; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."Task Assignment" (id, task, "user", assigned_at) FROM stdin;
\.


--
-- TOC entry 5167 (class 0 OID 17078)
-- Dependencies: 247
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: chadmin
--

COPY public."User" (id, school_email, password, first_name, last_name, created_at, role) FROM stdin;
\.


--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 221
-- Name: Attendance_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Attendance_attendance_id_seq"', 1, false);


--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 222
-- Name: Attendance_event_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Attendance_event_seq"', 1, false);


--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 223
-- Name: Attendance_user_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Attendance_user_seq"', 1, false);


--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 226
-- Name: Club Membership_clubid_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Club Membership_clubid_seq"', 1, false);


--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 227
-- Name: Club Membership_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Club Membership_membership_id_seq"', 1, false);


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 228
-- Name: Club Membership_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Club Membership_userid_seq"', 1, false);


--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 229
-- Name: Club_club_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Club_club_id_seq"', 570, true);


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 231
-- Name: Event_club_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Event_club_seq"', 1, false);


--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 232
-- Name: Event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Event_event_id_seq"', 1, false);


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 234
-- Name: File Resource_club_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."File Resource_club_seq"', 1, false);


--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 235
-- Name: File Resource_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."File Resource_file_id_seq"', 1, false);


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 237
-- Name: Notifications_club_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Notifications_club_seq"', 1, false);


--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 238
-- Name: Notifications_created_by_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Notifications_created_by_seq"', 1, false);


--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 239
-- Name: Notifications_notif_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Notifications_notif_id_seq"', 1, false);


--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 242
-- Name: Task Assignment_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Task Assignment_assignment_id_seq"', 1, false);


--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 243
-- Name: Task Assignment_task_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Task Assignment_task_seq"', 1, false);


--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 244
-- Name: Task Assignment_user_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Task Assignment_user_seq"', 1, false);


--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 245
-- Name: Task_club_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Task_club_seq"', 1, false);


--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 246
-- Name: Task_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Task_task_id_seq"', 1, false);


--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 248
-- Name: Users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chadmin
--

SELECT pg_catalog.setval('public."Users_user_id_seq"', 1, false);


--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 249
-- Name: notif_recipients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notif_recipients_id_seq', 1, false);


--
-- TOC entry 4951 (class 2606 OID 17113)
-- Name: Club Club_club_id_name_key; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club"
    ADD CONSTRAINT "Club_club_id_name_key" UNIQUE (id, name);


--
-- TOC entry 4953 (class 2606 OID 17115)
-- Name: Club Club_pkey; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club"
    ADD CONSTRAINT "Club_pkey" PRIMARY KEY (id);


--
-- TOC entry 4973 (class 2606 OID 17117)
-- Name: User Users_pkey; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- TOC entry 4971 (class 2606 OID 17119)
-- Name: Task Assignment assignment_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_pk PRIMARY KEY (id);


--
-- TOC entry 4949 (class 2606 OID 17121)
-- Name: Attendance attendance_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_pk PRIMARY KEY (id);


--
-- TOC entry 4955 (class 2606 OID 17123)
-- Name: Club Membership cm_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT cm_pk PRIMARY KEY (id);


--
-- TOC entry 4957 (class 2606 OID 17125)
-- Name: Club Membership cm_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT cm_unique UNIQUE (id, club, "user");


--
-- TOC entry 4959 (class 2606 OID 17127)
-- Name: Event event_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT event_pk PRIMARY KEY (id);


--
-- TOC entry 4961 (class 2606 OID 17129)
-- Name: File Resource file_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_pk PRIMARY KEY (id);


--
-- TOC entry 4963 (class 2606 OID 17131)
-- Name: File Resource file_uniq; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_uniq UNIQUE (id, source_url);


--
-- TOC entry 4965 (class 2606 OID 17133)
-- Name: Notifications notif_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT notif_pk PRIMARY KEY (id);


--
-- TOC entry 4979 (class 2606 OID 24926)
-- Name: Notification Recipient notif_recip_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification Recipient"
    ADD CONSTRAINT notif_recip_pk PRIMARY KEY (id);


--
-- TOC entry 4975 (class 2606 OID 17135)
-- Name: User pass_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT pass_unique UNIQUE (password);


--
-- TOC entry 4967 (class 2606 OID 17137)
-- Name: Task task_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_pk PRIMARY KEY (id);


--
-- TOC entry 4969 (class 2606 OID 17139)
-- Name: Task task_uniq; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_uniq UNIQUE (id, club, title);


--
-- TOC entry 4977 (class 2606 OID 17141)
-- Name: User user_id_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT user_id_unique UNIQUE (id);


--
-- TOC entry 4989 (class 2606 OID 17142)
-- Name: Task Assignment assignment_task_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_task_fk FOREIGN KEY (task) REFERENCES public."Task"(id);


--
-- TOC entry 4990 (class 2606 OID 17147)
-- Name: Task Assignment assignment_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_user_fk FOREIGN KEY ("user") REFERENCES public."User"(id);


--
-- TOC entry 4980 (class 2606 OID 17152)
-- Name: Attendance attendance_event_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_event_fk FOREIGN KEY (event) REFERENCES public."Event"(id);


--
-- TOC entry 4981 (class 2606 OID 17157)
-- Name: Attendance attendance_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_user_fk FOREIGN KEY ("user") REFERENCES public."User"(id);


--
-- TOC entry 4982 (class 2606 OID 17162)
-- Name: Club Membership club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT club_fk FOREIGN KEY (club) REFERENCES public."Club"(id);


--
-- TOC entry 4984 (class 2606 OID 17167)
-- Name: Event event_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT event_fk FOREIGN KEY (club) REFERENCES public."Club"(id);


--
-- TOC entry 4985 (class 2606 OID 17172)
-- Name: File Resource file_club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_club_fk FOREIGN KEY (club) REFERENCES public."Club"(id);


--
-- TOC entry 4986 (class 2606 OID 17182)
-- Name: Notifications notif_club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT notif_club_fk FOREIGN KEY (club) REFERENCES public."Club"(id);


--
-- TOC entry 4991 (class 2606 OID 24927)
-- Name: Notification Recipient notif_recip_notif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification Recipient"
    ADD CONSTRAINT notif_recip_notif FOREIGN KEY (notif) REFERENCES public."Notifications"(id);


--
-- TOC entry 4992 (class 2606 OID 24932)
-- Name: Notification Recipient notif_recip_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification Recipient"
    ADD CONSTRAINT notif_recip_user FOREIGN KEY ("user") REFERENCES public."User"(id);


--
-- TOC entry 4987 (class 2606 OID 17187)
-- Name: Notifications notif_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT notif_user_fk FOREIGN KEY (created_by) REFERENCES public."User"(id);


--
-- TOC entry 4988 (class 2606 OID 17192)
-- Name: Task task_club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_club_fk FOREIGN KEY (club) REFERENCES public."Club"(id);


--
-- TOC entry 4983 (class 2606 OID 17197)
-- Name: Club Membership user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT user_fk FOREIGN KEY ("user") REFERENCES public."User"(id);


--
-- TOC entry 2130 (class 826 OID 17202)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: private; Owner: chadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE chadmin IN SCHEMA private GRANT ALL ON TABLES TO chadmin;


-- Completed on 2026-03-12 00:16:41

--
-- PostgreSQL database dump complete
--

\unrestrict 7d5CuOoiP0s7WRydqosHXbKTEcl4x5uzkr7Ga2BfcdaPhfHTRJMYSZAK7bfgomZ

