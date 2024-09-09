--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2024-09-09 22:12:32

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
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 239 (class 1259 OID 97804)
-- Name: billing_charges_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_charges_config (
    id bigint DEFAULT '-1'::integer NOT NULL,
    billing_code character(20) DEFAULT 'VAT'::bpchar NOT NULL,
    partner_code character(20),
    is_active boolean DEFAULT true NOT NULL,
    service_id bigint,
    service_name character(20),
    scheme_code character(12),
    applicable_trxn_type character(20) DEFAULT 'wallettowallet'::bpchar NOT NULL,
    trxn_band character(10) DEFAULT 'LOW'::bpchar NOT NULL,
    lower_limit_value numeric(15,2) DEFAULT 0.00,
    upper_limit_value numeric(15,2) DEFAULT 0.00,
    use_percentage boolean DEFAULT true NOT NULL,
    percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    trxn_charge_cap numeric(15,2) DEFAULT '-1.00'::numeric,
    date_configured date NOT NULL,
    use_percentage_for_tax boolean DEFAULT true NOT NULL,
    tax_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    tax_charge_cap numeric(15,2) DEFAULT '-1.00'::numeric,
    use_percentage_for_bank_commission boolean DEFAULT true NOT NULL,
    bank_commission_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    bank_commission_share_cap numeric(15,2) DEFAULT '-1.00'::numeric,
    use_percentage_for_partner_commission boolean DEFAULT true NOT NULL,
    partner_commission_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    partner_commission_share_cap numeric(15,2) DEFAULT '-1.00'::numeric,
    use_save_invest_percentage boolean DEFAULT true NOT NULL,
    save_invest_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    save_invest_cap numeric(15,2) DEFAULT '-1.00'::numeric,
    bonus_share numeric(15,2) DEFAULT '-1.00'::numeric,
    bonus_accelerate boolean DEFAULT true NOT NULL
);


ALTER TABLE public.billing_charges_config OWNER TO postgres;

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
-- TOC entry 225 (class 1259 OID 96655)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id bigint DEFAULT '-1'::integer NOT NULL,
    name character(13) DEFAULT '-'::bpchar,
    version character(13) DEFAULT '-'::bpchar
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 96690)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    id bigint DEFAULT '-1'::integer NOT NULL,
    first_name character(13) DEFAULT '-'::bpchar,
    last_name character(13) DEFAULT '-'::bpchar,
    company_id bigint DEFAULT '-1'::integer NOT NULL,
    status_id bigint DEFAULT 3 NOT NULL,
    email character(23) DEFAULT '-'::bpchar,
    version bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 96385)
-- Name: customer_request_security; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_request_security (
    id bigint NOT NULL,
    customer_reference character(30) DEFAULT '-'::bpchar NOT NULL,
    request_ip character(25) DEFAULT '-'::bpchar NOT NULL,
    secret_salt character(22) DEFAULT 'API'::bpchar NOT NULL,
    request_hash_key character(60) DEFAULT '-'::bpchar NOT NULL,
    request_encrytion_key character(12) DEFAULT '_'::bpchar NOT NULL,
    update_column character(12) DEFAULT '_'::bpchar NOT NULL
);


ALTER TABLE public.customer_request_security OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 96384)
-- Name: customer_request_security_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_request_security_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_request_security_id_seq OWNER TO postgres;

--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 223
-- Name: customer_request_security_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_request_security_id_seq OWNED BY public.customer_request_security.id;


--
-- TOC entry 221 (class 1259 OID 96316)
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    faculty_id integer NOT NULL,
    faculty character varying(100) DEFAULT '_'::character varying NOT NULL,
    datecreated date NOT NULL,
    f_code character varying(100) DEFAULT '_'::character varying NOT NULL
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 97258)
-- Name: journal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journal (
    id bigint NOT NULL,
    trxn_request_id character(20),
    trxn_reference character(20),
    external_trxn_reference character(20),
    journal_action character(7) DEFAULT 'Post'::bpchar NOT NULL,
    source_customer_reference character(25) DEFAULT '-'::bpchar NOT NULL,
    debit_partner_code character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    debit_cust_user_id bigint DEFAULT '-1'::integer NOT NULL,
    debit_profile_id bigint DEFAULT '-1'::integer NOT NULL,
    debit_profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    debit_bank_code character(3),
    debit_wallet_accnt_no bigint DEFAULT '-1'::integer NOT NULL,
    debit_wallet_accnt_num bigint DEFAULT '-1'::integer NOT NULL,
    trxn_amount numeric(15,2) DEFAULT 0.00,
    credit_partner_code character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    credit_cust_user_id bigint DEFAULT '-1'::integer NOT NULL,
    credit_profile_id bigint DEFAULT '-1'::integer NOT NULL,
    credit_profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    credit_bank_code character(3),
    credit_wallet_accnt_id bigint DEFAULT '-1'::integer NOT NULL,
    credit_wallet_accnt_num bigint DEFAULT '-1'::integer NOT NULL,
    memo character(50),
    trxn_channel character(6) DEFAULT 'WEB'::bpchar,
    trxn_type character(20) DEFAULT '-'::bpchar,
    service_provider_id bigint NOT NULL,
    service_provider character(30),
    service_name character(30),
    trxn_date date NOT NULL,
    trxn_time time without time zone NOT NULL,
    due_date date,
    narration character(50),
    trans_status_code character(2) DEFAULT '99'::bpchar,
    sys_comment character(50)
);


ALTER TABLE public.journal OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 97257)
-- Name: journal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_id_seq OWNER TO postgres;

--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 229
-- Name: journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_id_seq OWNED BY public.journal.id;


--
-- TOC entry 234 (class 1259 OID 97337)
-- Name: journal_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journal_line (
    id bigint NOT NULL,
    profile_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    journal_action character(7) DEFAULT 'Post'::bpchar NOT NULL,
    credit_debit_partner_code character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_debit_scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    is_credit_or_debit character(2) DEFAULT '-'::bpchar NOT NULL,
    credit_debit_value numeric(15,2) DEFAULT 0.00,
    jounal_id bigint DEFAULT '-1'::bigint NOT NULL,
    wallet_account_id bigint DEFAULT (- (1)::bigint) NOT NULL,
    wallet_account_num bigint DEFAULT (- (1)::bigint) NOT NULL,
    current_balance numeric(15,2) DEFAULT 0.00,
    previous_balance numeric(15,2) DEFAULT 0.00,
    trxn_date date NOT NULL,
    trxn_time time without time zone NOT NULL,
    trxn_reference character(20) DEFAULT '-'::bpchar,
    external_trxn_reference character(20) DEFAULT '-'::bpchar,
    trxn_type character(20) DEFAULT '-'::bpchar,
    trxn_channel character(6) DEFAULT '-'::bpchar
);


ALTER TABLE public.journal_line OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 97336)
-- Name: journal_line_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journal_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_line_id_seq OWNER TO postgres;

--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 233
-- Name: journal_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_line_id_seq OWNED BY public.journal_line.id;


--
-- TOC entry 232 (class 1259 OID 97285)
-- Name: journal_line_summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journal_line_summary (
    id bigint NOT NULL,
    journal_id bigint DEFAULT '-1'::bigint NOT NULL,
    journal_action character(7) DEFAULT 'Post'::bpchar NOT NULL,
    debit_profile_id bigint DEFAULT '-1'::integer NOT NULL,
    debit_profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    debit_partner_code character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    debit_wallet_accnt_id bigint DEFAULT '-1'::bigint NOT NULL,
    debit_wallet_accnt_value numeric(15,2) DEFAULT 0.00,
    credit_partner_code character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    credit_profile_id bigint DEFAULT '-1'::integer NOT NULL,
    credit_profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    credit_wallet_accnt_id bigint DEFAULT (- (1)::bigint) NOT NULL,
    credit_wallet_accnt_value numeric(15,2) DEFAULT 0.00,
    "operational_wallet_accnt_id" bigint DEFAULT (- (1)::bigint) NOT NULL,
    operational_wallet_accnt_value numeric(15,2) DEFAULT 0.00,
    operational_wallet_accnt_credit_debit character(2) DEFAULT '?'::bpchar,
    host_fee_wallet_id bigint DEFAULT (- (1)::bigint) NOT NULL,
    host_fee_wallet_value numeric(15,2) DEFAULT 0.00,
    host_fee_wallet_credit_debit character(2) DEFAULT '?'::bpchar,
    biller_wallet_id bigint DEFAULT (- (1)::bigint) NOT NULL,
    biller_payable_recievable character(3),
    biller_wallet_value numeric(15,2) DEFAULT 0.00,
    biller_credit_debit character(1) DEFAULT '?'::bpchar,
    biller_commission_wallet_id bigint DEFAULT (- (1)::bigint) NOT NULL,
    biller_commission_payable_recievable character(3),
    biller_commission_wallet_value numeric(15,2) DEFAULT 0.00,
    biller_commission_wallet_credit_debit character(1) DEFAULT '?'::bpchar,
    tax_wallet_id bigint DEFAULT (- (1)::bigint) NOT NULL,
    tax_type_id integer NOT NULL,
    tax_type character(20),
    tax_wallet_value numeric(15,2) DEFAULT 0.00,
    tax_wallet_credit_debit character(1) DEFAULT '?'::bpchar,
    partner_commission_1_wallet_id bigint DEFAULT (- (1)::bigint) NOT NULL,
    partner_commission_1_payable_recievable character(3),
    partner_commission_1_wallet_value numeric(15,2) DEFAULT 0.00,
    partner_commission_1_wallet_credit_debit character(1) DEFAULT '?'::bpchar,
    partner_commission_2_wallet_id bigint DEFAULT (- (1)::bigint) NOT NULL,
    partner_commission_2_payable_recievable character(3),
    partner_commission_2_wallet_value numeric(15,2) DEFAULT 0.00,
    partner_commission_2_wallet_credit_debit character(1) DEFAULT '?'::bpchar,
    trxn_date date NOT NULL,
    trxn_time time without time zone NOT NULL,
    trxn_reference character(20) DEFAULT '-'::bpchar,
    external_trxn_reference character(20) DEFAULT '-'::bpchar,
    trxn_type character(20) DEFAULT '-'::bpchar,
    trxn_channel character(6) DEFAULT '-'::bpchar
);


ALTER TABLE public.journal_line_summary OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 97284)
-- Name: journal_line_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journal_line_summary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_line_summary_id_seq OWNER TO postgres;

--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 231
-- Name: journal_line_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_line_summary_id_seq OWNED BY public.journal_line_summary.id;


--
-- TOC entry 236 (class 1259 OID 97424)
-- Name: merchant_access_whitelist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_access_whitelist (
    ip_address character varying(40) DEFAULT '-'::bpchar NOT NULL,
    merchant_full_name character(52) DEFAULT '-'::bpchar NOT NULL,
    merchant_mobile_num character(15) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.merchant_access_whitelist OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 97442)
-- Name: partner_access_blacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partner_access_blacklist (
    ip_address character varying(40) DEFAULT '-'::bpchar NOT NULL,
    user_full_name character(52) DEFAULT '-'::bpchar NOT NULL,
    user_mobile_num character(15) DEFAULT '-'::bpchar NOT NULL,
    is_allowed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.partner_access_blacklist OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 97433)
-- Name: partner_access_whitelist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partner_access_whitelist (
    ip_address character varying(40) DEFAULT '-'::bpchar NOT NULL,
    partner_full_name character(52) DEFAULT '-'::bpchar NOT NULL,
    partner_mobile_num character(15) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.partner_access_whitelist OWNER TO postgres;

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
-- TOC entry 226 (class 1259 OID 96674)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id bigint DEFAULT '-1'::integer NOT NULL,
    name character(13) DEFAULT '-'::bpchar,
    version bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 96321)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 97418)
-- Name: user_access_whitelist_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_access_whitelist_test (
    ip_address character varying(40) DEFAULT '-'::bpchar NOT NULL,
    user_full_name character(52) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.user_access_whitelist_test OWNER TO postgres;

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
-- TOC entry 228 (class 1259 OID 96835)
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_sessions (
    ip_address character(25) DEFAULT '-'::bpchar NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar NOT NULL,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(25) DEFAULT '-'::bpchar,
    scheme_code character(25) DEFAULT '-'::bpchar NOT NULL,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(6) DEFAULT '-'::bpchar NOT NULL,
    old_request_key character(250) DEFAULT '-'::bpchar,
    new_request_key character(250) DEFAULT '-'::bpchar,
    expiry_time bigint DEFAULT '-1'::integer NOT NULL,
    is_active_session boolean DEFAULT false,
    notification_token character(25) DEFAULT '-'::bpchar,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_login_date date NOT NULL,
    last_login_time time without time zone NOT NULL
);


ALTER TABLE public.user_sessions OWNER TO postgres;

--
-- TOC entry 3292 (class 2604 OID 96388)
-- Name: customer_request_security id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request_security ALTER COLUMN id SET DEFAULT nextval('public.customer_request_security_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 97261)
-- Name: journal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal ALTER COLUMN id SET DEFAULT nextval('public.journal_id_seq'::regclass);


--
-- TOC entry 3386 (class 2604 OID 97340)
-- Name: journal_line id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line ALTER COLUMN id SET DEFAULT nextval('public.journal_line_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 97288)
-- Name: journal_line_summary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary ALTER COLUMN id SET DEFAULT nextval('public.journal_line_summary_id_seq'::regclass);


--
-- TOC entry 3650 (class 0 OID 97804)
-- Dependencies: 239
-- Data for Name: billing_charges_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_charges_config (id, billing_code, partner_code, is_active, service_id, service_name, scheme_code, applicable_trxn_type, trxn_band, lower_limit_value, upper_limit_value, use_percentage, percentage_or_fixedvalue, trxn_charge_cap, date_configured, use_percentage_for_tax, tax_percentage_or_fixedvalue, tax_charge_cap, use_percentage_for_bank_commission, bank_commission_percentage_or_fixedvalue, bank_commission_share_cap, use_percentage_for_partner_commission, partner_commission_percentage_or_fixedvalue, partner_commission_share_cap, use_save_invest_percentage, save_invest_percentage_or_fixedvalue, save_invest_cap, bonus_share, bonus_accelerate) FROM stdin;
1	HJSW                	jahddd              	t	1	test-billing        	ndoadndadd  	WalletToBank        	LOW       	1.00	5000.00	t	20.00	50.00	2024-09-09	t	5.00	10.00	t	3.00	0.00	t	40.00	0.00	t	50.00	0.00	0.00	f
\.


--
-- TOC entry 3621 (class 0 OID 88179)
-- Dependencies: 210
-- Data for Name: book_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_inventory (id, title, genre, isbn, author, year_published) FROM stdin;
1	New Title                               	Thriller	ISBN-47297132  	Bolaji Ogey                                                 	2021      
\.


--
-- TOC entry 3623 (class 0 OID 88192)
-- Dependencies: 212
-- Data for Name: book_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_prices (id, book_id, isbn, price, units_in_stock) FROM stdin;
1	1	ISBN-47297132  	2000.00	5
\.


--
-- TOC entry 3636 (class 0 OID 96655)
-- Dependencies: 225
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (id, name, version) FROM stdin;
1	SystemSpecs  	1.0          
\.


--
-- TOC entry 3638 (class 0 OID 96690)
-- Dependencies: 227
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (id, first_name, last_name, company_id, status_id, email, version) FROM stdin;
1	Bolaji Oge   	Ogeyingbo    	1	3	bogeyingbo@gmail.com   	1
\.


--
-- TOC entry 3635 (class 0 OID 96385)
-- Dependencies: 224
-- Data for Name: customer_request_security; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_request_security (id, customer_reference, request_ip, secret_salt, request_hash_key, request_encrytion_key, update_column) FROM stdin;
\.


--
-- TOC entry 3632 (class 0 OID 96316)
-- Dependencies: 221
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (faculty_id, faculty, datecreated, f_code) FROM stdin;
6	Basic Medical and Applied Science	2023-08-31	01
7	Arts Managment and Social Sciences	2023-08-31	02
8	Nursing Sciences	2023-12-30	03
\.


--
-- TOC entry 3641 (class 0 OID 97258)
-- Dependencies: 230
-- Data for Name: journal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal (id, trxn_request_id, trxn_reference, external_trxn_reference, journal_action, source_customer_reference, debit_partner_code, debit_scheme_code, debit_cust_user_id, debit_profile_id, debit_profile_type_code, debit_bank_code, debit_wallet_accnt_no, debit_wallet_accnt_num, trxn_amount, credit_partner_code, credit_scheme_code, credit_cust_user_id, credit_profile_id, credit_profile_type_code, credit_bank_code, credit_wallet_accnt_id, credit_wallet_accnt_num, memo, trxn_channel, trxn_type, service_provider_id, service_provider, service_name, trxn_date, trxn_time, due_date, narration, trans_status_code, sys_comment) FROM stdin;
\.


--
-- TOC entry 3645 (class 0 OID 97337)
-- Dependencies: 234
-- Data for Name: journal_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_line (id, profile_id, profile_type_code, journal_action, credit_debit_partner_code, credit_debit_scheme_code, is_credit_or_debit, credit_debit_value, jounal_id, wallet_account_id, wallet_account_num, current_balance, previous_balance, trxn_date, trxn_time, trxn_reference, external_trxn_reference, trxn_type, trxn_channel) FROM stdin;
\.


--
-- TOC entry 3643 (class 0 OID 97285)
-- Dependencies: 232
-- Data for Name: journal_line_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_line_summary (id, journal_id, journal_action, debit_profile_id, debit_profile_type_code, debit_partner_code, debit_scheme_code, debit_wallet_accnt_id, debit_wallet_accnt_value, credit_partner_code, credit_scheme_code, credit_profile_id, credit_profile_type_code, credit_wallet_accnt_id, credit_wallet_accnt_value, "operational_wallet_accnt_id", operational_wallet_accnt_value, operational_wallet_accnt_credit_debit, host_fee_wallet_id, host_fee_wallet_value, host_fee_wallet_credit_debit, biller_wallet_id, biller_payable_recievable, biller_wallet_value, biller_credit_debit, biller_commission_wallet_id, biller_commission_payable_recievable, biller_commission_wallet_value, biller_commission_wallet_credit_debit, tax_wallet_id, tax_type_id, tax_type, tax_wallet_value, tax_wallet_credit_debit, partner_commission_1_wallet_id, partner_commission_1_payable_recievable, partner_commission_1_wallet_value, partner_commission_1_wallet_credit_debit, partner_commission_2_wallet_id, partner_commission_2_payable_recievable, partner_commission_2_wallet_value, partner_commission_2_wallet_credit_debit, trxn_date, trxn_time, trxn_reference, external_trxn_reference, trxn_type, trxn_channel) FROM stdin;
\.


--
-- TOC entry 3647 (class 0 OID 97424)
-- Dependencies: 236
-- Data for Name: merchant_access_whitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_access_whitelist (ip_address, merchant_full_name, merchant_mobile_num, is_active) FROM stdin;
\.


--
-- TOC entry 3649 (class 0 OID 97442)
-- Dependencies: 238
-- Data for Name: partner_access_blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_access_blacklist (ip_address, user_full_name, user_mobile_num, is_allowed) FROM stdin;
\.


--
-- TOC entry 3648 (class 0 OID 97433)
-- Dependencies: 237
-- Data for Name: partner_access_whitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_access_whitelist (ip_address, partner_full_name, partner_mobile_num, is_active) FROM stdin;
\.


--
-- TOC entry 3629 (class 0 OID 88345)
-- Dependencies: 218
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart (id, order_serial, total_price, total_books_in_cart, payment_processed) FROM stdin;
\.


--
-- TOC entry 3631 (class 0 OID 88357)
-- Dependencies: 220
-- Data for Name: shopping_cart_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart_books (id, order_serial, title, genre, isbn, author, year_published, price) FROM stdin;
\.


--
-- TOC entry 3637 (class 0 OID 96674)
-- Dependencies: 226
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, name, version) FROM stdin;
1	ImportedLead 	1
2	NotContacted 	1
3	Contacted    	1
4	Customer     	1
5	ClosedLost   	1
\.


--
-- TOC entry 3633 (class 0 OID 96321)
-- Dependencies: 222
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (id, name) FROM stdin;
1	Hello
2	World
\.


--
-- TOC entry 3646 (class 0 OID 97418)
-- Dependencies: 235
-- Data for Name: user_access_whitelist_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_access_whitelist_test (ip_address, user_full_name, is_active) FROM stdin;
123.45.345.657	Segun Adeoye                                        	t
123.45.345.657	Segun Adeoye                                        	t
\.


--
-- TOC entry 3625 (class 0 OID 88313)
-- Dependencies: 214
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile (id, username, user_password, full_name, mobile, email, wallet_balance, auth_pin, last_purchase_date, last_purchase_time) FROM stdin;
\.


--
-- TOC entry 3627 (class 0 OID 88326)
-- Dependencies: 216
-- Data for Name: user_purchase_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_purchase_history (id, order_serial, title, genre, isbn, author, year_published, user_id, user_name, user_phone_number, purchase_price, purchase_date, purchase_time) FROM stdin;
\.


--
-- TOC entry 3639 (class 0 OID 96835)
-- Dependencies: 228
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_sessions (ip_address, profile_type_code, customer_ref, partner_code, scheme_code, request_user_type, request_channel, old_request_key, new_request_key, expiry_time, is_active_session, notification_token, consecutive_login_retries, last_login_date, last_login_time) FROM stdin;
\.


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 209
-- Name: book_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_inventory_id_seq', 1, true);


--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_prices_id_seq', 1, true);


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 223
-- Name: customer_request_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_request_security_id_seq', 1, false);


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 229
-- Name: journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_id_seq', 1, false);


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 233
-- Name: journal_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_line_id_seq', 1, false);


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 231
-- Name: journal_line_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_line_summary_id_seq', 1, false);


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 219
-- Name: shopping_cart_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_books_id_seq', 1, false);


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 217
-- Name: shopping_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_id_seq', 1, false);


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 213
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 1, false);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_purchase_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_purchase_history_id_seq', 1, false);


--
-- TOC entry 3473 (class 2606 OID 97832)
-- Name: billing_charges_config billing_charges_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_charges_config
    ADD CONSTRAINT billing_charges_config_pk PRIMARY KEY (id);


--
-- TOC entry 3455 (class 2606 OID 96398)
-- Name: customer_request_security customer_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request_security
    ADD CONSTRAINT customer_reference_pkey UNIQUE (customer_reference);


--
-- TOC entry 3457 (class 2606 OID 96396)
-- Name: customer_request_security customer_request_security_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request_security
    ADD CONSTRAINT customer_request_security_pkey PRIMARY KEY (id);


--
-- TOC entry 3443 (class 2606 OID 88188)
-- Name: book_inventory id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_inventory
    ADD CONSTRAINT id_pkey PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 88190)
-- Name: book_inventory isbn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_inventory
    ADD CONSTRAINT isbn_pkey UNIQUE (isbn);


--
-- TOC entry 3465 (class 2606 OID 97358)
-- Name: journal_line journal_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line
    ADD CONSTRAINT journal_line_pkey PRIMARY KEY (id);


--
-- TOC entry 3463 (class 2606 OID 97329)
-- Name: journal_line_summary journal_line_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary
    ADD CONSTRAINT journal_line_summary_pkey PRIMARY KEY (id);


--
-- TOC entry 3461 (class 2606 OID 97283)
-- Name: journal journal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal
    ADD CONSTRAINT journal_pkey PRIMARY KEY (id);


--
-- TOC entry 3467 (class 2606 OID 97432)
-- Name: merchant_access_whitelist merchant_access_whitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_access_whitelist
    ADD CONSTRAINT merchant_access_whitelist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 3449 (class 2606 OID 88355)
-- Name: shopping_cart order_serial_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT order_serial_key UNIQUE (order_serial);


--
-- TOC entry 3469 (class 2606 OID 97441)
-- Name: partner_access_whitelist partner_access_whitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_access_whitelist
    ADD CONSTRAINT partner_access_whitelist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 3451 (class 2606 OID 88353)
-- Name: shopping_cart shopping_cart_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_id_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 2606 OID 96325)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 3471 (class 2606 OID 97450)
-- Name: partner_access_blacklist user_access_blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_access_blacklist
    ADD CONSTRAINT user_access_blacklist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 3447 (class 2606 OID 88324)
-- Name: user_profile user_profile_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_id_pkey PRIMARY KEY (id);


--
-- TOC entry 3459 (class 2606 OID 96854)
-- Name: user_sessions user_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_session_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 3480 (class 2606 OID 97359)
-- Name: journal_line FKq1qkwi3bp726yehudbih8xe5b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line
    ADD CONSTRAINT "FKq1qkwi3bp726yehudbih8xe5b" FOREIGN KEY (jounal_id) REFERENCES public.journal(id);


--
-- TOC entry 3474 (class 2606 OID 88199)
-- Name: book_prices fk_book_inventory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_prices
    ADD CONSTRAINT fk_book_inventory_id FOREIGN KEY (book_id) REFERENCES public.book_inventory(id);


--
-- TOC entry 3475 (class 2606 OID 88204)
-- Name: book_prices fk_book_isbn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_prices
    ADD CONSTRAINT fk_book_isbn FOREIGN KEY (isbn) REFERENCES public.book_inventory(isbn);


--
-- TOC entry 3479 (class 2606 OID 97330)
-- Name: journal_line_summary fk_journal_line_summary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary
    ADD CONSTRAINT fk_journal_line_summary_id FOREIGN KEY (journal_id) REFERENCES public.journal(id);


--
-- TOC entry 3478 (class 2606 OID 88372)
-- Name: shopping_cart_books fk_shopping_cart_book_order_isbn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_books
    ADD CONSTRAINT fk_shopping_cart_book_order_isbn FOREIGN KEY (isbn) REFERENCES public.book_inventory(isbn);


--
-- TOC entry 3477 (class 2606 OID 88367)
-- Name: shopping_cart_books fk_shopping_cart_book_order_serial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart_books
    ADD CONSTRAINT fk_shopping_cart_book_order_serial FOREIGN KEY (order_serial) REFERENCES public.shopping_cart(order_serial);


--
-- TOC entry 3476 (class 2606 OID 88339)
-- Name: user_purchase_history fk_user_purchase_history_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_purchase_history
    ADD CONSTRAINT fk_user_purchase_history_user_id FOREIGN KEY (user_id) REFERENCES public.user_profile(id);


-- Completed on 2024-09-09 22:12:32

--
-- PostgreSQL database dump complete
--

