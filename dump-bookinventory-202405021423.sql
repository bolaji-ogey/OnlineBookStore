--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2024-05-02 14:23:49

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
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 88179)
-- Name: book_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_inventory (
    id bigint NOT NULL,
    title character(40) DEFAULT '-'::bpchar NOT NULL,
    genre character(8) DEFAULT '-'::bpchar NOT NULL,
    isbn character(15) DEFAULT '-'::bpchar NOT NULL,
    author character(60) DEFAULT '-'::bpchar NOT NULL,
    year_published character(10) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.book_inventory OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 88178)
-- Name: book_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.book_inventory ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.book_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 88192)
-- Name: book_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_prices (
    id bigint NOT NULL,
    book_id bigint DEFAULT '-1'::integer NOT NULL,
    isbn character(15) DEFAULT '-'::bpchar NOT NULL,
    price numeric(15,2) DEFAULT 0.00,
    units_in_stock integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.book_prices OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 88191)
-- Name: book_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.book_prices ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.book_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 88345)
-- Name: shopping_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart (
    id bigint NOT NULL,
    order_serial character(40) DEFAULT '-'::bpchar NOT NULL,
    total_price numeric(15,2) DEFAULT 0.00,
    total_books_in_cart integer DEFAULT 0 NOT NULL,
    payment_processed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.shopping_cart OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 88357)
-- Name: shopping_cart_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart_books (
    id bigint NOT NULL,
    order_serial character(40) DEFAULT '-'::bpchar NOT NULL,
    title character(40) DEFAULT '-'::bpchar NOT NULL,
    genre character(8) DEFAULT '-'::bpchar NOT NULL,
    isbn character(15) DEFAULT '-'::bpchar NOT NULL,
    author character(60) DEFAULT '-'::bpchar NOT NULL,
    year_published character(10) DEFAULT '-'::bpchar NOT NULL,
    price numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.shopping_cart_books OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 88356)
-- Name: shopping_cart_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shopping_cart_books ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shopping_cart_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 88344)
-- Name: shopping_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shopping_cart ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shopping_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 88313)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profile (
    id bigint NOT NULL,
    username character(40) DEFAULT '-'::bpchar NOT NULL,
    user_password character(40) DEFAULT '-'::bpchar NOT NULL,
    full_name character(8) DEFAULT '-'::bpchar NOT NULL,
    mobile character(15) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    wallet_balance character(140) DEFAULT '-'::bpchar NOT NULL,
    auth_pin character(80) DEFAULT '-'::bpchar NOT NULL,
    last_purchase_date date,
    last_purchase_time time without time zone
);


ALTER TABLE public.user_profile OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 88312)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 88326)
-- Name: user_purchase_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_purchase_history (
    id bigint NOT NULL,
    order_serial character(40) DEFAULT '-'::bpchar NOT NULL,
    title character(40) DEFAULT '-'::bpchar NOT NULL,
    genre character(8) DEFAULT '-'::bpchar NOT NULL,
    isbn character(15) DEFAULT '-'::bpchar NOT NULL,
    author character(60) DEFAULT '-'::bpchar NOT NULL,
    year_published character(10) DEFAULT '-'::bpchar NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    user_name character(60) DEFAULT '-'::bpchar NOT NULL,
    user_phone_number character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_price numeric(15,2) DEFAULT 0.00,
    purchase_date date NOT NULL,
    purchase_time timestamp without time zone NOT NULL
);


ALTER TABLE public.user_purchase_history OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 88325)
-- Name: user_purchase_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_purchase_history ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_purchase_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3381 (class 0 OID 88179)
-- Dependencies: 210
-- Data for Name: book_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_inventory (id, title, genre, isbn, author, year_published) FROM stdin;
1	New Title                               	Thriller	ISBN-47297132  	Bolaji Ogey                                                 	2021      
\.


--
-- TOC entry 3383 (class 0 OID 88192)
-- Dependencies: 212
-- Data for Name: book_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_prices (id, book_id, isbn, price, units_in_stock) FROM stdin;
1	1	ISBN-47297132  	2000.00	5
\.


--
-- TOC entry 3389 (class 0 OID 88345)
-- Dependencies: 218
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart (id, order_serial, total_price, total_books_in_cart, payment_processed) FROM stdin;
\.


--
-- TOC entry 3391 (class 0 OID 88357)
-- Dependencies: 220
-- Data for Name: shopping_cart_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart_books (id, order_serial, title, genre, isbn, author, year_published, price) FROM stdin;
\.


--
-- TOC entry 3385 (class 0 OID 88313)
-- Dependencies: 214
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile (id, username, user_password, full_name, mobile, email, wallet_balance, auth_pin, last_purchase_date, last_purchase_time) FROM stdin;
\.


--
-- TOC entry 3387 (class 0 OID 88326)
-- Dependencies: 216
-- Data for Name: user_purchase_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_purchase_history (id, order_serial, title, genre, isbn, author, year_published, user_id, user_name, user_phone_number, purchase_price, purchase_date, purchase_time) FROM stdin;
\.


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 209
-- Name: book_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_inventory_id_seq', 1, true);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_prices_id_seq', 1, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 219
-- Name: shopping_cart_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_books_id_seq', 1, false);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 217
-- Name: shopping_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_id_seq', 1, false);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 213
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 1, false);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_purchase_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_purchase_history_id_seq', 1, false);


--
-- TOC entry 3227 (class 2606 OID 88188)
-- Name: book_inventory id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_inventory
    ADD CONSTRAINT id_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 88190)
-- Name: book_inventory isbn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_inventory
    ADD CONSTRAINT isbn_pkey UNIQUE (isbn);


--
-- TOC entry 3233 (class 2606 OID 88355)
-- Name: shopping_cart order_serial_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT order_serial_key UNIQUE (order_serial);


--
-- TOC entry 3235 (class 2606 OID 88353)
-- Name: shopping_cart shopping_cart_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_id_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 88324)
-- Name: user_profile user_profile_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_id_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 88199)
-- Name: book_prices fk_book_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_prices
    ADD CONSTRAINT fk_book_inventory_id FOREIGN KEY (book_id) REFERENCES public.book_inventory(id);


--
-- TOC entry 3237 (class 2606 OID 88204)
-- Name: book_prices fk_book_isbn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_prices
    ADD CONSTRAINT fk_book_isbn FOREIGN KEY (isbn) REFERENCES public.book_inventory(isbn);


--
-- TOC entry 3240 (class 2606 OID 88372)
-- Name: shopping_cart_books fk_shopping_cart_book_order_isbn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_books
    ADD CONSTRAINT fk_shopping_cart_book_order_isbn FOREIGN KEY (isbn) REFERENCES public.book_inventory(isbn);


--
-- TOC entry 3239 (class 2606 OID 88367)
-- Name: shopping_cart_books fk_shopping_cart_book_order_serial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_books
    ADD CONSTRAINT fk_shopping_cart_book_order_serial FOREIGN KEY (order_serial) REFERENCES public.shopping_cart(order_serial);


--
-- TOC entry 3238 (class 2606 OID 88339)
-- Name: user_purchase_history fk_user_purchase_history_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_purchase_history
    ADD CONSTRAINT fk_user_purchase_history_user_id FOREIGN KEY (user_id) REFERENCES public.user_profile(id);


-- Completed on 2024-05-02 14:23:50

--
-- PostgreSQL database dump complete
--

