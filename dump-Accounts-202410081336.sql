--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2024-10-08 13:36:53

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 98312)
-- Name: account_payables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_payables (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'account_payables'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.account_payables OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 98324)
-- Name: account_recievables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_recievables (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'account_recievables'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.account_recievables OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 98384)
-- Name: bank_acc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_acc (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'bank_acc'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.bank_acc OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 98372)
-- Name: capital_acc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capital_acc (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'capital_acc'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.capital_acc OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 98360)
-- Name: cash_acc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cash_acc (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'cash_acc'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.cash_acc OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 98420)
-- Name: furniture_acc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.furniture_acc (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'furniture_acc'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.furniture_acc OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 98396)
-- Name: purchases_acc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases_acc (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'purchases_acc'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.purchases_acc OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 98336)
-- Name: return_inwards_acc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_inwards_acc (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'return_inwards_acc'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.return_inwards_acc OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 98348)
-- Name: return_outwards_acc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_outwards_acc (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'return_outwards_acc'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.return_outwards_acc OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 98408)
-- Name: sales_acc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_acc (
    id bigint DEFAULT '-1'::integer NOT NULL,
    entry_date date NOT NULL,
    ref_account character(30) DEFAULT 'sales_acc'::bpchar NOT NULL,
    trxn_date character(10) DEFAULT '_'::bpchar NOT NULL,
    description character(30) DEFAULT '_'::bpchar NOT NULL,
    debit numeric(15,2) DEFAULT 0.00,
    credit numeric(15,2) DEFAULT 0.00,
    is_reconcilled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.sales_acc OWNER TO postgres;

--
-- TOC entry 3428 (class 0 OID 98312)
-- Dependencies: 209
-- Data for Name: account_payables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_payables (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3429 (class 0 OID 98324)
-- Dependencies: 210
-- Data for Name: account_recievables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_recievables (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3434 (class 0 OID 98384)
-- Dependencies: 215
-- Data for Name: bank_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_acc (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3433 (class 0 OID 98372)
-- Dependencies: 214
-- Data for Name: capital_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capital_acc (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3432 (class 0 OID 98360)
-- Dependencies: 213
-- Data for Name: cash_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cash_acc (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3437 (class 0 OID 98420)
-- Dependencies: 218
-- Data for Name: furniture_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.furniture_acc (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3435 (class 0 OID 98396)
-- Dependencies: 216
-- Data for Name: purchases_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases_acc (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3430 (class 0 OID 98336)
-- Dependencies: 211
-- Data for Name: return_inwards_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return_inwards_acc (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3431 (class 0 OID 98348)
-- Dependencies: 212
-- Data for Name: return_outwards_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return_outwards_acc (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3436 (class 0 OID 98408)
-- Dependencies: 217
-- Data for Name: sales_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_acc (id, entry_date, ref_account, trxn_date, description, debit, credit, is_reconcilled) FROM stdin;
\.


--
-- TOC entry 3270 (class 2606 OID 98323)
-- Name: account_payables account_payables_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_payables
    ADD CONSTRAINT account_payables_pk PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 98335)
-- Name: account_recievables account_recievables_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_recievables
    ADD CONSTRAINT account_recievables_pk PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 98395)
-- Name: bank_acc bank_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_acc
    ADD CONSTRAINT bank_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 98383)
-- Name: capital_acc capital_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capital_acc
    ADD CONSTRAINT capital_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 98371)
-- Name: cash_acc cash_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cash_acc
    ADD CONSTRAINT cash_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 98431)
-- Name: furniture_acc furniture_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furniture_acc
    ADD CONSTRAINT furniture_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 98407)
-- Name: purchases_acc purchases_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases_acc
    ADD CONSTRAINT purchases_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 98347)
-- Name: return_inwards_acc return_inwards_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_inwards_acc
    ADD CONSTRAINT return_inwards_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 98359)
-- Name: return_outwards_acc return_outwards_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_outwards_acc
    ADD CONSTRAINT return_outwards_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 98419)
-- Name: sales_acc sales_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_acc
    ADD CONSTRAINT sales_acc_pk PRIMARY KEY (id);


-- Completed on 2024-10-08 13:36:53

--
-- PostgreSQL database dump complete
--

