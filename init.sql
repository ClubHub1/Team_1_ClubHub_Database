--
-- PostgreSQL database dump
--

\restrict NV2u32rC28210qlbX8jd45tr0GgFGh9RG74MZ6RpYtJPcLOczM5phnqDUjg0SSK

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-12-02 21:38:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16388)
-- Name: private; Type: SCHEMA; Schema: -; Owner: chadmin
--

CREATE SCHEMA private;


ALTER SCHEMA private OWNER TO chadmin;

--
-- TOC entry 894 (class 1247 OID 16632)
-- Name: attendance_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.attendance_status AS ENUM (
    'Present',
    'Absent'
);


ALTER TYPE public.attendance_status OWNER TO chadmin;

--
-- TOC entry 900 (class 1247 OID 16663)
-- Name: club_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.club_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.club_status OWNER TO chadmin;

--
-- TOC entry 912 (class 1247 OID 16750)
-- Name: task_priority; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.task_priority AS ENUM (
    'Low',
    'Medium',
    'High'
);


ALTER TYPE public.task_priority OWNER TO chadmin;

--
-- TOC entry 915 (class 1247 OID 16758)
-- Name: task_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.task_status AS ENUM (
    'Not Started',
    'In Progress',
    'Complete'
);


ALTER TYPE public.task_status OWNER TO chadmin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 16640)
-- Name: Attendance; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Attendance" (
    attendance_id integer NOT NULL,
    event integer NOT NULL,
    "user" integer NOT NULL,
    status public.attendance_status NOT NULL,
    "time" timestamp with time zone
);


ALTER TABLE public."Attendance" OWNER TO chadmin;

--
-- TOC entry 231 (class 1259 OID 16637)
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
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 231
-- Name: Attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_attendance_id_seq" OWNED BY public."Attendance".attendance_id;


--
-- TOC entry 232 (class 1259 OID 16638)
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
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 232
-- Name: Attendance_event_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_event_seq" OWNED BY public."Attendance".event;


--
-- TOC entry 233 (class 1259 OID 16639)
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
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 233
-- Name: Attendance_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_user_seq" OWNED BY public."Attendance"."user";


--
-- TOC entry 223 (class 1259 OID 16407)
-- Name: Club; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Club" (
    club_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    activity_status public.club_status NOT NULL
);


ALTER TABLE public."Club" OWNER TO chadmin;

--
-- TOC entry 227 (class 1259 OID 16588)
-- Name: Club Membership; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Club Membership" (
    membership_id integer NOT NULL,
    clubid integer NOT NULL,
    userid integer NOT NULL,
    role character varying(100),
    is_active boolean NOT NULL,
    dues_paid boolean NOT NULL
);


ALTER TABLE public."Club Membership" OWNER TO chadmin;

--
-- TOC entry 225 (class 1259 OID 16586)
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
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 225
-- Name: Club Membership_clubid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_clubid_seq" OWNED BY public."Club Membership".clubid;


--
-- TOC entry 224 (class 1259 OID 16585)
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
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 224
-- Name: Club Membership_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_membership_id_seq" OWNED BY public."Club Membership".membership_id;


--
-- TOC entry 226 (class 1259 OID 16587)
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
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 226
-- Name: Club Membership_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_userid_seq" OWNED BY public."Club Membership".userid;


--
-- TOC entry 222 (class 1259 OID 16406)
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
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 222
-- Name: Club_club_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club_club_id_seq" OWNED BY public."Club".club_id;


--
-- TOC entry 230 (class 1259 OID 16615)
-- Name: Event; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Event" (
    event_id integer NOT NULL,
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
-- TOC entry 229 (class 1259 OID 16614)
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
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 229
-- Name: Event_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Event_club_seq" OWNED BY public."Event".club;


--
-- TOC entry 228 (class 1259 OID 16613)
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
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 228
-- Name: Event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Event_event_id_seq" OWNED BY public."Event".event_id;


--
-- TOC entry 245 (class 1259 OID 16722)
-- Name: File Resource; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."File Resource" (
    file_id integer NOT NULL,
    club integer NOT NULL,
    event integer NOT NULL,
    source_url text NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public."File Resource" OWNER TO chadmin;

--
-- TOC entry 243 (class 1259 OID 16720)
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
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 243
-- Name: File Resource_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."File Resource_club_seq" OWNED BY public."File Resource".club;


--
-- TOC entry 244 (class 1259 OID 16721)
-- Name: File Resource_event_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."File Resource_event_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."File Resource_event_seq" OWNER TO chadmin;

--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 244
-- Name: File Resource_event_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."File Resource_event_seq" OWNED BY public."File Resource".event;


--
-- TOC entry 242 (class 1259 OID 16719)
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
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 242
-- Name: File Resource_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."File Resource_file_id_seq" OWNED BY public."File Resource".file_id;


--
-- TOC entry 249 (class 1259 OID 16770)
-- Name: Notifications; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Notifications" (
    notif_id integer NOT NULL,
    club integer NOT NULL,
    title character varying(255) NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer NOT NULL
);


ALTER TABLE public."Notifications" OWNER TO chadmin;

--
-- TOC entry 247 (class 1259 OID 16768)
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
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 247
-- Name: Notifications_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Notifications_club_seq" OWNED BY public."Notifications".club;


--
-- TOC entry 248 (class 1259 OID 16769)
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
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 248
-- Name: Notifications_created_by_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Notifications_created_by_seq" OWNED BY public."Notifications".created_by;


--
-- TOC entry 246 (class 1259 OID 16767)
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
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 246
-- Name: Notifications_notif_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Notifications_notif_id_seq" OWNED BY public."Notifications".notif_id;


--
-- TOC entry 237 (class 1259 OID 16670)
-- Name: Task; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Task" (
    task_id integer NOT NULL,
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
-- TOC entry 241 (class 1259 OID 16697)
-- Name: Task Assignment; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Task Assignment" (
    assignment_id integer NOT NULL,
    task integer NOT NULL,
    "user" integer NOT NULL,
    assigned_at timestamp without time zone NOT NULL
);


ALTER TABLE public."Task Assignment" OWNER TO chadmin;

--
-- TOC entry 238 (class 1259 OID 16694)
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
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 238
-- Name: Task Assignment_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_assignment_id_seq" OWNED BY public."Task Assignment".assignment_id;


--
-- TOC entry 239 (class 1259 OID 16695)
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
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 239
-- Name: Task Assignment_task_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_task_seq" OWNED BY public."Task Assignment".task;


--
-- TOC entry 240 (class 1259 OID 16696)
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
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 240
-- Name: Task Assignment_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_user_seq" OWNED BY public."Task Assignment"."user";


--
-- TOC entry 236 (class 1259 OID 16669)
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
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 236
-- Name: Task_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task_club_seq" OWNED BY public."Task".club;


--
-- TOC entry 235 (class 1259 OID 16668)
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
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 235
-- Name: Task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task_task_id_seq" OWNED BY public."Task".task_id;


--
-- TOC entry 221 (class 1259 OID 16391)
-- Name: User; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."User" (
    user_id integer CONSTRAINT "Users_user_id_not_null" NOT NULL,
    school_email character varying(255) CONSTRAINT "Users_school_email_not_null" NOT NULL,
    password character varying(255) CONSTRAINT "Users_password_not_null" NOT NULL,
    first_name character varying(100) CONSTRAINT "Users_first_name_not_null" NOT NULL,
    last_name character varying(100) CONSTRAINT "Users_last_name_not_null" NOT NULL,
    role character varying(50) CONSTRAINT "Users_role_not_null" NOT NULL,
    created_at timestamp with time zone CONSTRAINT "Users_created_at_not_null" NOT NULL
);


ALTER TABLE public."User" OWNER TO chadmin;

--
-- TOC entry 220 (class 1259 OID 16390)
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
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 220
-- Name: Users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Users_user_id_seq" OWNED BY public."User".user_id;


--
-- TOC entry 4929 (class 2604 OID 16643)
-- Name: Attendance attendance_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN attendance_id SET DEFAULT nextval('public."Attendance_attendance_id_seq"'::regclass);


--
-- TOC entry 4930 (class 2604 OID 16644)
-- Name: Attendance event; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN event SET DEFAULT nextval('public."Attendance_event_seq"'::regclass);


--
-- TOC entry 4931 (class 2604 OID 16645)
-- Name: Attendance user; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN "user" SET DEFAULT nextval('public."Attendance_user_seq"'::regclass);


--
-- TOC entry 4923 (class 2604 OID 16410)
-- Name: Club club_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club" ALTER COLUMN club_id SET DEFAULT nextval('public."Club_club_id_seq"'::regclass);


--
-- TOC entry 4924 (class 2604 OID 16591)
-- Name: Club Membership membership_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership" ALTER COLUMN membership_id SET DEFAULT nextval('public."Club Membership_membership_id_seq"'::regclass);


--
-- TOC entry 4925 (class 2604 OID 16592)
-- Name: Club Membership clubid; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership" ALTER COLUMN clubid SET DEFAULT nextval('public."Club Membership_clubid_seq"'::regclass);


--
-- TOC entry 4926 (class 2604 OID 16593)
-- Name: Club Membership userid; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership" ALTER COLUMN userid SET DEFAULT nextval('public."Club Membership_userid_seq"'::regclass);


--
-- TOC entry 4927 (class 2604 OID 16618)
-- Name: Event event_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event" ALTER COLUMN event_id SET DEFAULT nextval('public."Event_event_id_seq"'::regclass);


--
-- TOC entry 4928 (class 2604 OID 16619)
-- Name: Event club; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event" ALTER COLUMN club SET DEFAULT nextval('public."Event_club_seq"'::regclass);


--
-- TOC entry 4937 (class 2604 OID 16725)
-- Name: File Resource file_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource" ALTER COLUMN file_id SET DEFAULT nextval('public."File Resource_file_id_seq"'::regclass);


--
-- TOC entry 4938 (class 2604 OID 16726)
-- Name: File Resource club; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource" ALTER COLUMN club SET DEFAULT nextval('public."File Resource_club_seq"'::regclass);


--
-- TOC entry 4939 (class 2604 OID 16727)
-- Name: File Resource event; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource" ALTER COLUMN event SET DEFAULT nextval('public."File Resource_event_seq"'::regclass);


--
-- TOC entry 4940 (class 2604 OID 16773)
-- Name: Notifications notif_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications" ALTER COLUMN notif_id SET DEFAULT nextval('public."Notifications_notif_id_seq"'::regclass);


--
-- TOC entry 4941 (class 2604 OID 16774)
-- Name: Notifications club; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications" ALTER COLUMN club SET DEFAULT nextval('public."Notifications_club_seq"'::regclass);


--
-- TOC entry 4943 (class 2604 OID 16776)
-- Name: Notifications created_by; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications" ALTER COLUMN created_by SET DEFAULT nextval('public."Notifications_created_by_seq"'::regclass);


--
-- TOC entry 4932 (class 2604 OID 16673)
-- Name: Task task_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task" ALTER COLUMN task_id SET DEFAULT nextval('public."Task_task_id_seq"'::regclass);


--
-- TOC entry 4933 (class 2604 OID 16674)
-- Name: Task club; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task" ALTER COLUMN club SET DEFAULT nextval('public."Task_club_seq"'::regclass);


--
-- TOC entry 4934 (class 2604 OID 16700)
-- Name: Task Assignment assignment_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN assignment_id SET DEFAULT nextval('public."Task Assignment_assignment_id_seq"'::regclass);


--
-- TOC entry 4935 (class 2604 OID 16701)
-- Name: Task Assignment task; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN task SET DEFAULT nextval('public."Task Assignment_task_seq"'::regclass);


--
-- TOC entry 4936 (class 2604 OID 16702)
-- Name: Task Assignment user; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN "user" SET DEFAULT nextval('public."Task Assignment_user_seq"'::regclass);


--
-- TOC entry 4922 (class 2604 OID 16394)
-- Name: User user_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User" ALTER COLUMN user_id SET DEFAULT nextval('public."Users_user_id_seq"'::regclass);


--
-- TOC entry 4951 (class 2606 OID 16420)
-- Name: Club Club_club_id_name_key; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club"
    ADD CONSTRAINT "Club_club_id_name_key" UNIQUE (club_id, name);


--
-- TOC entry 4953 (class 2606 OID 16418)
-- Name: Club Club_pkey; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club"
    ADD CONSTRAINT "Club_pkey" PRIMARY KEY (club_id);


--
-- TOC entry 4945 (class 2606 OID 16580)
-- Name: User Users_pkey; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


--
-- TOC entry 4967 (class 2606 OID 16708)
-- Name: Task Assignment assignment_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_pk PRIMARY KEY (assignment_id);


--
-- TOC entry 4961 (class 2606 OID 16651)
-- Name: Attendance attendance_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_pk PRIMARY KEY (attendance_id);


--
-- TOC entry 4955 (class 2606 OID 16600)
-- Name: Club Membership cm_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT cm_pk PRIMARY KEY (membership_id);


--
-- TOC entry 4957 (class 2606 OID 16602)
-- Name: Club Membership cm_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT cm_unique UNIQUE (membership_id, clubid, userid);


--
-- TOC entry 4959 (class 2606 OID 16625)
-- Name: Event event_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT event_pk PRIMARY KEY (event_id);


--
-- TOC entry 4969 (class 2606 OID 16736)
-- Name: File Resource file_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_pk PRIMARY KEY (file_id);


--
-- TOC entry 4971 (class 2606 OID 16738)
-- Name: File Resource file_uniq; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_uniq UNIQUE (file_id, source_url);


--
-- TOC entry 4973 (class 2606 OID 16786)
-- Name: Notifications notif_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT notif_pk PRIMARY KEY (notif_id);


--
-- TOC entry 4947 (class 2606 OID 16584)
-- Name: User pass_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT pass_unique UNIQUE (password);


--
-- TOC entry 4963 (class 2606 OID 16686)
-- Name: Task task_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_pk PRIMARY KEY (task_id);


--
-- TOC entry 4965 (class 2606 OID 16688)
-- Name: Task task_uniq; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_uniq UNIQUE (task_id, club, title);


--
-- TOC entry 4949 (class 2606 OID 16582)
-- Name: User user_id_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT user_id_unique UNIQUE (user_id);


--
-- TOC entry 4980 (class 2606 OID 16709)
-- Name: Task Assignment assignment_task_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_task_fk FOREIGN KEY (task) REFERENCES public."Task"(task_id);


--
-- TOC entry 4981 (class 2606 OID 16714)
-- Name: Task Assignment assignment_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_user_fk FOREIGN KEY ("user") REFERENCES public."User"(user_id);


--
-- TOC entry 4977 (class 2606 OID 16652)
-- Name: Attendance attendance_event_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_event_fk FOREIGN KEY (event) REFERENCES public."Event"(event_id);


--
-- TOC entry 4978 (class 2606 OID 16657)
-- Name: Attendance attendance_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_user_fk FOREIGN KEY ("user") REFERENCES public."User"(user_id);


--
-- TOC entry 4974 (class 2606 OID 16603)
-- Name: Club Membership club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT club_fk FOREIGN KEY (clubid) REFERENCES public."Club"(club_id);


--
-- TOC entry 4976 (class 2606 OID 16626)
-- Name: Event event_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT event_fk FOREIGN KEY (club) REFERENCES public."Club"(club_id);


--
-- TOC entry 4982 (class 2606 OID 16739)
-- Name: File Resource file_club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_club_fk FOREIGN KEY (club) REFERENCES public."Club"(club_id);


--
-- TOC entry 4983 (class 2606 OID 16744)
-- Name: File Resource file_event_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_event_fk FOREIGN KEY (event) REFERENCES public."Event"(event_id);


--
-- TOC entry 4984 (class 2606 OID 16787)
-- Name: Notifications notif_club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT notif_club_fk FOREIGN KEY (club) REFERENCES public."Club"(club_id);


--
-- TOC entry 4985 (class 2606 OID 16792)
-- Name: Notifications notif_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT notif_user_fk FOREIGN KEY (created_by) REFERENCES public."User"(user_id);


--
-- TOC entry 4979 (class 2606 OID 16689)
-- Name: Task task_club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_club_fk FOREIGN KEY (club) REFERENCES public."Club"(club_id);


--
-- TOC entry 4975 (class 2606 OID 16608)
-- Name: Club Membership user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT user_fk FOREIGN KEY (userid) REFERENCES public."User"(user_id);


--
-- TOC entry 2117 (class 826 OID 16389)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: private; Owner: chadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE chadmin IN SCHEMA private GRANT ALL ON TABLES TO chadmin;


-- Completed on 2025-12-02 21:38:12

--
-- PostgreSQL database dump complete
--

\unrestrict NV2u32rC28210qlbX8jd45tr0GgFGh9RG74MZ6RpYtJPcLOczM5phnqDUjg0SSK

