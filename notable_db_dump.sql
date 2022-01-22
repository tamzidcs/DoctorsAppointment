--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: appointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment (
    appointment_id integer NOT NULL,
    patient_name character varying(100) NOT NULL,
    kind character varying(100) NOT NULL,
    "time" time without time zone
);


ALTER TABLE public.appointment OWNER TO postgres;

--
-- Name: appointment_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointment_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_appointment_id_seq OWNER TO postgres;

--
-- Name: appointment_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointment_appointment_id_seq OWNED BY public.appointment.appointment_id;


--
-- Name: physician; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physician (
    physician_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL
);


ALTER TABLE public.physician OWNER TO postgres;

--
-- Name: physician_appointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physician_appointment (
    physician_id integer NOT NULL,
    appointment_id integer NOT NULL
);


ALTER TABLE public.physician_appointment OWNER TO postgres;

--
-- Name: physician_appointment_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.physician_appointment_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physician_appointment_appointment_id_seq OWNER TO postgres;

--
-- Name: physician_appointment_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.physician_appointment_appointment_id_seq OWNED BY public.physician_appointment.appointment_id;


--
-- Name: physician_appointment_physician_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.physician_appointment_physician_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physician_appointment_physician_id_seq OWNER TO postgres;

--
-- Name: physician_appointment_physician_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.physician_appointment_physician_id_seq OWNED BY public.physician_appointment.physician_id;


--
-- Name: physician_physician_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.physician_physician_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physician_physician_id_seq OWNER TO postgres;

--
-- Name: physician_physician_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.physician_physician_id_seq OWNED BY public.physician.physician_id;


--
-- Name: appointment appointment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointment_appointment_id_seq'::regclass);


--
-- Name: physician physician_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician ALTER COLUMN physician_id SET DEFAULT nextval('public.physician_physician_id_seq'::regclass);


--
-- Name: physician_appointment physician_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician_appointment ALTER COLUMN physician_id SET DEFAULT nextval('public.physician_appointment_physician_id_seq'::regclass);


--
-- Name: physician_appointment appointment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician_appointment ALTER COLUMN appointment_id SET DEFAULT nextval('public.physician_appointment_appointment_id_seq'::regclass);


--
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment (appointment_id, patient_name, kind, "time") FROM stdin;
2	Cyril Figis	Follow Up	08:30:00
1	Sterling Archer	New Patient	08:00:00
3	James Bond	New Patient	09:00:00
4	Victoria Beckham	New Patient	09:30:00
5	James Cameroon	New Patient	10:00:00
6	Max Cartel	Follow Up	08:00:00
7	Nick Carter	Follow Up	08:30:00
8	Arron James	Follow Up	09:00:00
9	Molly Parker	Follow Up	09:30:00
10	Brad Pitt Parker	New Patient	10:00:00
11	Naomi Campbell	Follow Up	08:00:00
12	Micahel Jordan	Follow Up	08:30:00
13	Josh Parker	New Patient	09:00:00
\.


--
-- Data for Name: physician; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.physician (physician_id, first_name, last_name) FROM stdin;
1	Julias	Hibberts
2	Algernop	Krieger
3	Nick	Riviera
\.


--
-- Data for Name: physician_appointment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.physician_appointment (physician_id, appointment_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
2	6
2	7
2	8
2	9
2	10
3	11
3	12
3	13
\.


--
-- Name: appointment_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_appointment_id_seq', 13, true);


--
-- Name: physician_appointment_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.physician_appointment_appointment_id_seq', 1, false);


--
-- Name: physician_appointment_physician_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.physician_appointment_physician_id_seq', 1, false);


--
-- Name: physician_physician_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.physician_physician_id_seq', 3, true);


--
-- Name: appointment appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (appointment_id);


--
-- Name: physician physician_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_pkey PRIMARY KEY (physician_id);


--
-- Name: fki_appointment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_appointment_id ON public.physician_appointment USING btree (appointment_id);


--
-- Name: fki_physician_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_physician_id ON public.physician_appointment USING btree (physician_id);


--
-- Name: physician_appointment appointment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician_appointment
    ADD CONSTRAINT appointment_id FOREIGN KEY (appointment_id) REFERENCES public.appointment(appointment_id) NOT VALID;


--
-- Name: physician_appointment physician_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physician_appointment
    ADD CONSTRAINT physician_id FOREIGN KEY (physician_id) REFERENCES public.physician(physician_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

