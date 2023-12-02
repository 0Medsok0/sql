--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

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
-- Name: skillbox; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skillbox (
    id integer NOT NULL,
    text_value text
);


ALTER TABLE public.skillbox OWNER TO postgres;

--
-- Name: skillbox_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skillbox_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skillbox_id_seq OWNER TO postgres;

--
-- Name: skillbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skillbox_id_seq OWNED BY public.skillbox.id;


--
-- Name: skillbox id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skillbox ALTER COLUMN id SET DEFAULT nextval('public.skillbox_id_seq'::regclass);


--
-- Data for Name: skillbox; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skillbox (id, text_value) FROM stdin;
1	One
2	Two
3	Three
\.


--
-- Name: skillbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skillbox_id_seq', 3, true);


--
-- Name: skillbox skillbox_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skillbox
    ADD CONSTRAINT skillbox_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

