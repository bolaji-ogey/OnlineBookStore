--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2024-09-12 12:28:31

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 8821 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 479 (class 1259 OID 86783)
-- Name: account_credit_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_credit_history (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash character(12) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash character(12) DEFAULT '-'::bpchar NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash character(12) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.account_credit_history OWNER TO postgres;

--
-- TOC entry 478 (class 1259 OID 86782)
-- Name: account_credit_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_credit_history ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_credit_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 16396)
-- Name: actual_bonus_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actual_bonus_log (
    id bigint DEFAULT '-1'::integer NOT NULL,
    amount numeric(15,2) DEFAULT 0.00,
    remark character(150) DEFAULT '-'::bpchar NOT NULL,
    journal_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id bigint DEFAULT '-1'::integer NOT NULL,
    bonus_log_date timestamp without time zone
);


ALTER TABLE public.actual_bonus_log OWNER TO postgres;

--
-- TOC entry 405 (class 1259 OID 46802)
-- Name: admin_user_device_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_user_device_sessions (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    request_partner_code character(20) DEFAULT '-'::bpchar,
    request_app_code character(8) DEFAULT '-'::bpchar,
    request_user_id bigint,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    profile_sys_id bigint,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    ext_customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    is_user_profile_active boolean DEFAULT false NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    request_channel_id character(20) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(8) DEFAULT '-'::bpchar NOT NULL,
    device_type character(15) DEFAULT '-'::bpchar NOT NULL,
    device_os character(10) DEFAULT '-'::bpchar NOT NULL,
    device_name character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT false NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_app_request_key character(50) DEFAULT '-'::bpchar NOT NULL,
    device_id character(50) DEFAULT '-'::bpchar NOT NULL,
    notification_token character(20) DEFAULT '-'::bpchar NOT NULL,
    last_login_date timestamp without time zone NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.admin_user_device_sessions OWNER TO postgres;

--
-- TOC entry 404 (class 1259 OID 46801)
-- Name: admin_user_device_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_user_device_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_user_device_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 8822 (class 0 OID 0)
-- Dependencies: 404
-- Name: admin_user_device_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_user_device_sessions_id_seq OWNED BY public.admin_user_device_sessions.id;


--
-- TOC entry 371 (class 1259 OID 37813)
-- Name: agent_profile_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent_profile_details (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    middle_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    city character(50) DEFAULT '-'::bpchar NOT NULL,
    state character(50) DEFAULT '-'::bpchar NOT NULL,
    country character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    email_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    email_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    loc_longitude bigint DEFAULT '-1'::integer NOT NULL,
    loc_latitude bigint DEFAULT '-1'::integer NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.agent_profile_details OWNER TO postgres;

--
-- TOC entry 370 (class 1259 OID 37812)
-- Name: agent_profile_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_profile_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_profile_details_id_seq OWNER TO postgres;

--
-- TOC entry 8823 (class 0 OID 0)
-- Dependencies: 370
-- Name: agent_profile_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_profile_details_id_seq OWNED BY public.agent_profile_details.id;


--
-- TOC entry 353 (class 1259 OID 37275)
-- Name: agent_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent_profiles (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_detail_sys_id bigint NOT NULL,
    profile_id character(150) DEFAULT '-'::bpchar NOT NULL,
    profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    customer_no bigint DEFAULT 0 NOT NULL,
    mobile_number character(50) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    red_flagged boolean DEFAULT false,
    kyc_trxn_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    kyc_daily_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    consecutive_pin_retries smallint DEFAULT 0 NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar
);


ALTER TABLE public.agent_profiles OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 37272)
-- Name: agent_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 8824 (class 0 OID 0)
-- Dependencies: 350
-- Name: agent_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_profiles_id_seq OWNED BY public.agent_profiles.id;


--
-- TOC entry 352 (class 1259 OID 37274)
-- Name: agent_profiles_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_profiles_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_profiles_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8825 (class 0 OID 0)
-- Dependencies: 352
-- Name: agent_profiles_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_profiles_profile_sys_id_seq OWNED BY public.agent_profiles.profile_detail_sys_id;


--
-- TOC entry 351 (class 1259 OID 37273)
-- Name: agent_profiles_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_profiles_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_profiles_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8826 (class 0 OID 0)
-- Dependencies: 351
-- Name: agent_profiles_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_profiles_user_sys_id_seq OWNED BY public.agent_profiles.user_sys_id;


--
-- TOC entry 492 (class 1259 OID 87846)
-- Name: agent_swift_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent_swift_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    book_balance character(130) DEFAULT '-'::bpchar,
    book_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    customer_ref character(30) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    available_balance character(130) DEFAULT '-'::bpchar,
    available_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pocket_wallet_balance character(130) DEFAULT '-'::bpchar,
    pocket_wallet_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    hold_amount_balance character(130) DEFAULT '-'::bpchar,
    hold_amount_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    transit_trxn_balance character(130) DEFAULT '-'::bpchar,
    transit_trxn_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(130) DEFAULT '-'::bpchar,
    overdraft_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_debit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_credit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.agent_swift_wallets OWNER TO postgres;

--
-- TOC entry 395 (class 1259 OID 46637)
-- Name: agent_user_device_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent_user_device_sessions (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    request_partner_code character(20) DEFAULT '-'::bpchar,
    request_app_code character(8) DEFAULT '-'::bpchar,
    request_user_id bigint,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    profile_sys_id bigint,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    ext_customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    is_user_profile_active boolean DEFAULT false NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    request_channel_id character(20) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(8) DEFAULT '-'::bpchar NOT NULL,
    device_type character(15) DEFAULT '-'::bpchar NOT NULL,
    device_os character(10) DEFAULT '-'::bpchar NOT NULL,
    device_name character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT false NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_app_request_key character(50) DEFAULT '-'::bpchar NOT NULL,
    device_id character(50) DEFAULT '-'::bpchar NOT NULL,
    notification_token character(20) DEFAULT '-'::bpchar NOT NULL,
    last_login_date timestamp without time zone NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.agent_user_device_sessions OWNER TO postgres;

--
-- TOC entry 394 (class 1259 OID 46636)
-- Name: agent_user_device_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_user_device_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_user_device_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 8827 (class 0 OID 0)
-- Dependencies: 394
-- Name: agent_user_device_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_user_device_sessions_id_seq OWNED BY public.agent_user_device_sessions.id;


--
-- TOC entry 250 (class 1259 OID 24399)
-- Name: agent_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent_users (
    id bigint NOT NULL,
    profile_sys_id bigint NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    username character(42) DEFAULT '-'::bpchar NOT NULL,
    user_password character(150) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    image_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true,
    red_flagged boolean DEFAULT false,
    lang_key character(12) DEFAULT '-'::bpchar NOT NULL,
    activation_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_date timestamp without time zone,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    single_sign_on boolean DEFAULT false,
    status character(12) DEFAULT '-'::bpchar NOT NULL,
    login_retries bigint DEFAULT 0 NOT NULL,
    pin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operator character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operand character(60) DEFAULT '-'::bpchar NOT NULL,
    default_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    current_session_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar,
    customer_no bigint DEFAULT 0 NOT NULL,
    authourization_dpin_operand bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.agent_users OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 24397)
-- Name: agent_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_users_id_seq OWNER TO postgres;

--
-- TOC entry 8828 (class 0 OID 0)
-- Dependencies: 248
-- Name: agent_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_users_id_seq OWNED BY public.agent_users.id;


--
-- TOC entry 249 (class 1259 OID 24398)
-- Name: agent_users_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_users_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_users_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8829 (class 0 OID 0)
-- Dependencies: 249
-- Name: agent_users_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_users_profile_sys_id_seq OWNED BY public.agent_users.profile_sys_id;


--
-- TOC entry 487 (class 1259 OID 87772)
-- Name: agent_wallet_instance_refs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent_wallet_instance_refs (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    reference_count bigint DEFAULT '-1'::integer NOT NULL,
    update_test_field character(1) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.agent_wallet_instance_refs OWNER TO postgres;

--
-- TOC entry 345 (class 1259 OID 37034)
-- Name: agent_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    current_balance character(60) DEFAULT '-'::bpchar,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    wallet_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_balance character(60) DEFAULT '-'::bpchar,
    hold_amount_balance character(60) DEFAULT '-'::bpchar,
    transit_trxn_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_reversal_bal character(60) DEFAULT '-'::bpchar,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(60) DEFAULT '-'::bpchar,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.agent_wallets OWNER TO postgres;

--
-- TOC entry 421 (class 1259 OID 64416)
-- Name: approval_item_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_item_groups (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    item_group_name character(80) DEFAULT '_'::bpchar,
    item_group_description character(80) DEFAULT '_'::bpchar,
    item_group_creation_date date,
    item_group_creation_time time without time zone,
    item_group_modification_date date,
    item_group_modification_time time without time zone
);


ALTER TABLE public.approval_item_groups OWNER TO postgres;

--
-- TOC entry 420 (class 1259 OID 64415)
-- Name: approval_item_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.approval_item_groups ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.approval_item_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 417 (class 1259 OID 56183)
-- Name: approval_item_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_item_types (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    approval_item_group_id bigint DEFAULT '-1'::integer NOT NULL,
    item_name character(80) DEFAULT '_'::bpchar,
    description character(120) DEFAULT '_'::bpchar,
    is_financial_related boolean DEFAULT false,
    is_physical_object_related boolean DEFAULT false,
    is_relocation_related boolean DEFAULT false,
    approval_item_table character(60) DEFAULT '_'::bpchar,
    item_type_creator character(60) DEFAULT '_'::bpchar,
    item_type_creation_date date,
    item_type_creation_time time without time zone
);


ALTER TABLE public.approval_item_types OWNER TO postgres;

--
-- TOC entry 416 (class 1259 OID 56182)
-- Name: approval_item_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.approval_item_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.approval_item_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 435 (class 1259 OID 72595)
-- Name: approval_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_items (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    approval_workflow_id bigint DEFAULT '-1'::integer NOT NULL,
    item_type_id bigint DEFAULT '-1'::integer NOT NULL,
    item_group_id bigint DEFAULT '-1'::integer NOT NULL,
    item_name character(80) DEFAULT '_'::bpchar,
    approval_batch_id bigint DEFAULT '-1'::integer NOT NULL,
    user_request_id bigint DEFAULT '-1'::integer NOT NULL,
    current_approver_id bigint DEFAULT '-1'::integer NOT NULL,
    current_approver_level integer DEFAULT 0 NOT NULL,
    request_user_id bigint DEFAULT '-1'::integer NOT NULL,
    request_user character(20) DEFAULT '_'::bpchar,
    is_currently_been_reviewed boolean DEFAULT false,
    current_reviewer_user_id bigint DEFAULT '-1'::integer NOT NULL,
    is_approved_final boolean DEFAULT false,
    approve_comment character(20) DEFAULT '_'::bpchar,
    reject_reason character(20) DEFAULT '_'::bpchar,
    request_initiation_date date,
    request_initiation_time time without time zone
);


ALTER TABLE public.approval_items OWNER TO postgres;

--
-- TOC entry 434 (class 1259 OID 72594)
-- Name: approval_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.approval_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.approval_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 419 (class 1259 OID 64395)
-- Name: approval_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_requests (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    approval_workflow_id bigint DEFAULT '-1'::integer NOT NULL,
    item_type_id bigint DEFAULT '-1'::integer NOT NULL,
    item_group_id bigint DEFAULT '-1'::integer NOT NULL,
    item_group_name character(80) DEFAULT '_'::bpchar,
    approval_batch_id bigint DEFAULT '-1'::integer NOT NULL,
    approval_item_id bigint DEFAULT '-1'::integer NOT NULL,
    batch_item_count bigint DEFAULT '-1'::integer NOT NULL,
    user_request_id character(20) DEFAULT '_'::bpchar,
    current_approver_id bigint DEFAULT '-1'::integer NOT NULL,
    current_approver_level integer DEFAULT 0 NOT NULL,
    request_user_id bigint DEFAULT '-1'::integer NOT NULL,
    request_user character(20) DEFAULT '_'::bpchar,
    request_initiation_date date,
    request_initiation_time time without time zone,
    is_approved_final boolean DEFAULT false,
    approve_comment character(60) DEFAULT '_'::bpchar,
    reject_reason character(60) DEFAULT '_'::bpchar,
    approved_level_1_date date,
    approved_level_1_time time without time zone,
    approved_level_2_date date,
    approved_level_2_time time without time zone,
    approved_level_3_date date,
    approved_level_3_time time without time zone
);


ALTER TABLE public.approval_requests OWNER TO postgres;

--
-- TOC entry 418 (class 1259 OID 64394)
-- Name: approval_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.approval_requests ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.approval_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 427 (class 1259 OID 64547)
-- Name: approval_routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_routes (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    item_group_id bigint DEFAULT '-1'::integer NOT NULL,
    item_type_id bigint DEFAULT '-1'::integer NOT NULL,
    approval_workflow_id bigint DEFAULT 1 NOT NULL,
    is_active_route boolean DEFAULT true,
    approver_user_group_id bigint DEFAULT '-1'::integer NOT NULL,
    approver_user_id bigint DEFAULT '-1'::integer NOT NULL,
    approver_level integer DEFAULT 0 NOT NULL,
    approver_description character(40) DEFAULT '_'::bpchar,
    approver_name character(60) DEFAULT '_'::bpchar,
    is_final_approver boolean DEFAULT false,
    approver_route_create_date date,
    approver_route_create_time time without time zone,
    approver_route_modification_date date,
    approver_route_modification_time time without time zone
);


ALTER TABLE public.approval_routes OWNER TO postgres;

--
-- TOC entry 426 (class 1259 OID 64546)
-- Name: approval_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.approval_routes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.approval_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 423 (class 1259 OID 64475)
-- Name: approval_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_user_groups (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    user_group_name character(80) DEFAULT '_'::bpchar,
    user_group_description character(80) DEFAULT '_'::bpchar,
    user_group_approval_level integer DEFAULT '-1'::integer NOT NULL,
    user_group_creation_date date,
    user_group_creation_time time without time zone,
    user_group_modification_date date,
    user_group_modification_time time without time zone
);


ALTER TABLE public.approval_user_groups OWNER TO postgres;

--
-- TOC entry 422 (class 1259 OID 64474)
-- Name: approval_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.approval_user_groups ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.approval_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 425 (class 1259 OID 64514)
-- Name: approval_workflow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_workflow (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    item_group_id bigint DEFAULT '-1'::integer NOT NULL,
    item_type_id bigint DEFAULT '-1'::integer NOT NULL,
    total_approval_levels integer DEFAULT 1 NOT NULL,
    total_approval_levels_in_words character(60) DEFAULT '_'::bpchar,
    total_approval_levels_in_words_hash character(20) DEFAULT '_'::bpchar,
    workflow_create_user_id bigint DEFAULT '-1'::integer NOT NULL,
    workflow_create_user character(60) DEFAULT '_'::bpchar,
    workflow_create_date date,
    workflow_create_time time without time zone,
    workflow_modification_user_id bigint DEFAULT '-1'::integer NOT NULL,
    workflow_modification_user character(60) DEFAULT '_'::bpchar,
    workflow_modification_date date,
    workflow_modification_time time without time zone
);


ALTER TABLE public.approval_workflow OWNER TO postgres;

--
-- TOC entry 424 (class 1259 OID 64513)
-- Name: approval_workflow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.approval_workflow ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.approval_workflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 363 (class 1259 OID 37526)
-- Name: beneficiary_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficiary_accounts (
    id bigint DEFAULT '-1'::bigint NOT NULL,
    user_id bigint DEFAULT '-1'::bigint NOT NULL,
    profile_detail_id bigint DEFAULT '-1'::bigint NOT NULL,
    customer_no bigint DEFAULT '-1'::bigint NOT NULL,
    profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    is_wallet boolean DEFAULT true NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    bank_name character(40) DEFAULT '-'::bpchar NOT NULL,
    account_no character(15) DEFAULT '-'::bpchar NOT NULL,
    bank_account_name character(60) DEFAULT '-'::bpchar NOT NULL,
    trxn_count bigint DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    last_payment_date date,
    last_payment_time timestamp without time zone
);


ALTER TABLE public.beneficiary_accounts OWNER TO postgres;

--
-- TOC entry 362 (class 1259 OID 37490)
-- Name: beneficiary_service_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficiary_service_accounts (
    id bigint DEFAULT '-1'::bigint NOT NULL,
    user_id bigint DEFAULT '-1'::bigint NOT NULL,
    profile_detail_id bigint DEFAULT '-1'::bigint NOT NULL,
    customer_no bigint DEFAULT '-1'::bigint NOT NULL,
    profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    service_type character(3) DEFAULT '-'::bpchar NOT NULL,
    service_subscription_id bigint DEFAULT '-1'::integer NOT NULL,
    device_account character(15) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    is_auto_renewal boolean DEFAULT true NOT NULL,
    service_value numeric(15,2) DEFAULT 0.00 NOT NULL,
    trxn_count bigint DEFAULT 0 NOT NULL,
    auto_renewal_day_of_month bigint DEFAULT '-1'::integer NOT NULL,
    last_purchase_date date,
    last_purchase_time timestamp without time zone
);


ALTER TABLE public.beneficiary_service_accounts OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16424)
-- Name: biller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biller (
    id bigint NOT NULL,
    billing_reference character(20),
    biller_id character(20),
    biller_name character(60),
    status character(1) DEFAULT 'I'::bpchar
);


ALTER TABLE public.biller OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 19892)
-- Name: biller_operational_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biller_operational_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_num bigint DEFAULT '-1'::integer NOT NULL,
    biller_id bigint DEFAULT '-1'::integer NOT NULL,
    public_ledger_biller_id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_name character(40) DEFAULT '.jpg'::bpchar NOT NULL,
    balance_amount numeric(15,2) DEFAULT 0.00,
    date_opened date NOT NULL,
    charge_trxn boolean DEFAULT true NOT NULL,
    applicable_trxn_type character(20) DEFAULT 'wallettowallet'::bpchar NOT NULL,
    share_accrued boolean DEFAULT false NOT NULL,
    use_percentage boolean DEFAULT true NOT NULL,
    lower_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    medium_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    upper_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    last_modified_date date,
    is_active boolean DEFAULT true NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    hold_amount numeric(15,2) DEFAULT 0.00,
    charge_name character(20) DEFAULT 'VAT'::bpchar NOT NULL
);


ALTER TABLE public.biller_operational_wallets OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 19593)
-- Name: biller_settlement_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biller_settlement_accounts (
    id bigint DEFAULT '-1'::integer NOT NULL,
    biller_id bigint DEFAULT '-1'::integer NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    account_num character(15) DEFAULT '-'::bpchar NOT NULL,
    bank_name character(40) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    last_settlement_date date,
    last_settlement_time timestamp without time zone
);


ALTER TABLE public.biller_settlement_accounts OWNER TO postgres;

--
-- TOC entry 512 (class 1259 OID 98044)
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
    minimum_save_invest numeric(15,2) DEFAULT 0.00,
    save_invest_cap numeric(15,2) DEFAULT 0.00,
    bonus_share numeric(15,2) DEFAULT 0.00,
    bonus_accelerate boolean DEFAULT true NOT NULL
);


ALTER TABLE public.billing_charges_config OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 34387)
-- Name: billing_config_summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_config_summary (
    id bigint DEFAULT '-1'::integer NOT NULL,
    billing_reference character(20),
    is_active boolean DEFAULT true NOT NULL,
    service_id bigint,
    service_name character(20),
    scheme_code character(12),
    applicable_trxn_type character(20) DEFAULT 'wallettowallet'::bpchar NOT NULL,
    trxn_band character(10) DEFAULT 'LOW'::bpchar NOT NULL,
    use_percentage boolean DEFAULT true NOT NULL,
    percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    trxn_charge_cap numeric(15,2) DEFAULT '-1.00'::numeric,
    date_configured timestamp without time zone,
    billing_code character(20) DEFAULT 'VAT'::bpchar NOT NULL,
    lower_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    medium_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    upper_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    wallet_accnt_num bigint DEFAULT '-1'::integer NOT NULL,
    charge_code character(10) DEFAULT 'VAT'::bpchar NOT NULL,
    biller_id bigint DEFAULT '-1'::integer NOT NULL,
    lower_trxn_band_cap numeric(15,2) DEFAULT '-1.00'::numeric,
    medium_trxn_band_cap numeric(15,2) DEFAULT '-1.00'::numeric,
    upper_trxn_band_cap numeric(15,2) DEFAULT '-1.00'::numeric
);


ALTER TABLE public.billing_config_summary OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16463)
-- Name: billing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.billing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_id_seq OWNER TO postgres;

--
-- TOC entry 8830 (class 0 OID 0)
-- Dependencies: 213
-- Name: billing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billing_id_seq OWNED BY public.biller.id;


--
-- TOC entry 500 (class 1259 OID 96640)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id bigint DEFAULT '-1'::integer NOT NULL,
    name character(13) DEFAULT '-'::bpchar,
    version character(13) DEFAULT '-'::bpchar
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 501 (class 1259 OID 96646)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    id bigint DEFAULT '-1'::integer NOT NULL,
    firstname character(13) DEFAULT '-'::bpchar,
    lastname character(13) DEFAULT '-'::bpchar,
    company_id bigint DEFAULT '-1'::integer NOT NULL,
    status character(13) DEFAULT '-'::bpchar,
    email character(23) DEFAULT '-'::bpchar
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16464)
-- Name: customer_kyc_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_kyc_level (
    id bigint DEFAULT '-1'::integer NOT NULL,
    description character(150) DEFAULT '-'::bpchar NOT NULL,
    kyc_level integer DEFAULT 1 NOT NULL,
    phone_number_verified boolean DEFAULT false NOT NULL,
    email_address_verified boolean DEFAULT false NOT NULL,
    first_name_verified boolean DEFAULT false NOT NULL,
    last_name_verified boolean DEFAULT false NOT NULL,
    gender_verified boolean DEFAULT false NOT NULL,
    date_of_birth_verified boolean DEFAULT false NOT NULL,
    photo_id_uploaded boolean DEFAULT false NOT NULL,
    bvn_verified boolean DEFAULT false NOT NULL,
    valid_id_verified boolean DEFAULT false NOT NULL,
    evidence_of_address_verified boolean DEFAULT false NOT NULL,
    address_verified boolean DEFAULT false NOT NULL,
    employment_details_verified boolean DEFAULT false NOT NULL,
    payment_transaction_enabled boolean DEFAULT false NOT NULL,
    biller_transaction_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.customer_kyc_level OWNER TO postgres;

--
-- TOC entry 369 (class 1259 OID 37760)
-- Name: customer_profile_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_profile_details (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    middle_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    city character(50) DEFAULT '-'::bpchar NOT NULL,
    state character(50) DEFAULT '-'::bpchar NOT NULL,
    country character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    email_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    email_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    loc_longitude bigint DEFAULT '-1'::integer NOT NULL,
    loc_latitude bigint DEFAULT '-1'::integer NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.customer_profile_details OWNER TO postgres;

--
-- TOC entry 368 (class 1259 OID 37759)
-- Name: customer_profile_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_profile_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_profile_details_id_seq OWNER TO postgres;

--
-- TOC entry 8831 (class 0 OID 0)
-- Dependencies: 368
-- Name: customer_profile_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_profile_details_id_seq OWNED BY public.customer_profile_details.id;


--
-- TOC entry 498 (class 1259 OID 96355)
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
-- TOC entry 497 (class 1259 OID 96354)
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
-- TOC entry 8832 (class 0 OID 0)
-- Dependencies: 497
-- Name: customer_request_security_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_request_security_id_seq OWNED BY public.customer_request_security.id;


--
-- TOC entry 499 (class 1259 OID 96590)
-- Name: customer_swift_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_swift_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no bigint DEFAULT '-1'::integer NOT NULL,
    book_balance character(130) DEFAULT '-'::bpchar,
    book_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    customer_ref character(30) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    active_status boolean DEFAULT true,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    available_balance character(130) DEFAULT '-'::bpchar,
    available_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pocket_wallet_balance character(130) DEFAULT '-'::bpchar,
    pocket_wallet_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    hold_amount_balance character(130) DEFAULT '-'::bpchar,
    hold_amount_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    transit_trxn_balance character(130) DEFAULT '-'::bpchar,
    transit_trxn_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(130) DEFAULT '-'::bpchar,
    overdraft_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_debit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_credit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_ref character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_ref character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.customer_swift_wallets OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 38019)
-- Name: customer_tier_1_profile_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_tier_1_profile_details (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    middle_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    city character(50) DEFAULT '-'::bpchar NOT NULL,
    state character(50) DEFAULT '-'::bpchar NOT NULL,
    country character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    email_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    email_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    loc_longitude bigint DEFAULT '-1'::integer NOT NULL,
    loc_latitude bigint DEFAULT '-1'::integer NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.customer_tier_1_profile_details OWNER TO postgres;

--
-- TOC entry 378 (class 1259 OID 38018)
-- Name: customer_tier_1_profile_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tier_1_profile_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tier_1_profile_details_id_seq OWNER TO postgres;

--
-- TOC entry 8833 (class 0 OID 0)
-- Dependencies: 378
-- Name: customer_tier_1_profile_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tier_1_profile_details_id_seq OWNED BY public.customer_tier_1_profile_details.id;


--
-- TOC entry 361 (class 1259 OID 37365)
-- Name: customer_tier_1_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_tier_1_profiles (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_detail_sys_id bigint NOT NULL,
    profile_id character(150) DEFAULT '-'::bpchar NOT NULL,
    profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    customer_no bigint DEFAULT 0 NOT NULL,
    mobile_number character(50) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    red_flag boolean DEFAULT false,
    kyc_trxn_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    kyc_daily_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    consecutive_pin_retries smallint DEFAULT 0 NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar
);


ALTER TABLE public.customer_tier_1_profiles OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 37362)
-- Name: customer_tier_1_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tier_1_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tier_1_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 8834 (class 0 OID 0)
-- Dependencies: 358
-- Name: customer_tier_1_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tier_1_profiles_id_seq OWNED BY public.customer_tier_1_profiles.id;


--
-- TOC entry 360 (class 1259 OID 37364)
-- Name: customer_tier_1_profiles_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tier_1_profiles_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tier_1_profiles_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8835 (class 0 OID 0)
-- Dependencies: 360
-- Name: customer_tier_1_profiles_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tier_1_profiles_profile_sys_id_seq OWNED BY public.customer_tier_1_profiles.profile_detail_sys_id;


--
-- TOC entry 359 (class 1259 OID 37363)
-- Name: customer_tier_1_profiles_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tier_1_profiles_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tier_1_profiles_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8836 (class 0 OID 0)
-- Dependencies: 359
-- Name: customer_tier_1_profiles_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tier_1_profiles_user_sys_id_seq OWNED BY public.customer_tier_1_profiles.user_sys_id;


--
-- TOC entry 494 (class 1259 OID 87986)
-- Name: customer_tier_1_swift_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_tier_1_swift_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    book_balance character(130) DEFAULT '-'::bpchar,
    book_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    customer_ref character(30) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    available_balance character(130) DEFAULT '-'::bpchar,
    available_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pocket_wallet_balance character(130) DEFAULT '-'::bpchar,
    pocket_wallet_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    hold_amount_balance character(130) DEFAULT '-'::bpchar,
    hold_amount_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    transit_trxn_balance character(130) DEFAULT '-'::bpchar,
    transit_trxn_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(130) DEFAULT '-'::bpchar,
    overdraft_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_debit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_credit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.customer_tier_1_swift_wallets OWNER TO postgres;

--
-- TOC entry 409 (class 1259 OID 46870)
-- Name: customer_tier_1_user_device_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_tier_1_user_device_sessions (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    request_partner_code character(20) DEFAULT '-'::bpchar,
    request_app_code character(8) DEFAULT '-'::bpchar,
    request_user_id bigint,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    profile_sys_id bigint,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    ext_customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    is_user_profile_active boolean DEFAULT false NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    request_channel_id character(20) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(8) DEFAULT '-'::bpchar NOT NULL,
    device_type character(15) DEFAULT '-'::bpchar NOT NULL,
    device_os character(10) DEFAULT '-'::bpchar NOT NULL,
    device_name character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT false NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_app_request_key character(50) DEFAULT '-'::bpchar NOT NULL,
    device_id character(50) DEFAULT '-'::bpchar NOT NULL,
    notification_token character(20) DEFAULT '-'::bpchar NOT NULL,
    last_login_date timestamp without time zone NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.customer_tier_1_user_device_sessions OWNER TO postgres;

--
-- TOC entry 408 (class 1259 OID 46869)
-- Name: customer_tier_1_user_device_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tier_1_user_device_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tier_1_user_device_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 8837 (class 0 OID 0)
-- Dependencies: 408
-- Name: customer_tier_1_user_device_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tier_1_user_device_sessions_id_seq OWNED BY public.customer_tier_1_user_device_sessions.id;


--
-- TOC entry 337 (class 1259 OID 36381)
-- Name: customer_tier_1_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_tier_1_users (
    id bigint NOT NULL,
    profile_sys_id bigint NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    customer_no bigint NOT NULL,
    username character(42) DEFAULT '-'::bpchar NOT NULL,
    user_password character(150) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    image_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true,
    red_flagged boolean DEFAULT false,
    lang_key character(12) DEFAULT '-'::bpchar NOT NULL,
    activation_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_date timestamp without time zone,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    single_sign_on boolean DEFAULT false,
    status character(12) DEFAULT '-'::bpchar NOT NULL,
    login_retries bigint DEFAULT 0 NOT NULL,
    pin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operator character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operand character(60) DEFAULT '-'::bpchar NOT NULL,
    default_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    current_session_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    kyc_trxn_limit character(60) DEFAULT '-'::bpchar,
    kyc_daily_limit character(60) DEFAULT '-'::bpchar,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    consecutive_pin_use_retries smallint DEFAULT 0 NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar,
    authourization_dpin_operand bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.customer_tier_1_users OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 36380)
-- Name: customer_tier_1_users_customer_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tier_1_users_customer_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tier_1_users_customer_no_seq OWNER TO postgres;

--
-- TOC entry 8838 (class 0 OID 0)
-- Dependencies: 336
-- Name: customer_tier_1_users_customer_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tier_1_users_customer_no_seq OWNED BY public.customer_tier_1_users.customer_no;


--
-- TOC entry 334 (class 1259 OID 36378)
-- Name: customer_tier_1_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tier_1_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tier_1_users_id_seq OWNER TO postgres;

--
-- TOC entry 8839 (class 0 OID 0)
-- Dependencies: 334
-- Name: customer_tier_1_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tier_1_users_id_seq OWNED BY public.customer_tier_1_users.id;


--
-- TOC entry 335 (class 1259 OID 36379)
-- Name: customer_tier_1_users_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tier_1_users_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tier_1_users_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8840 (class 0 OID 0)
-- Dependencies: 335
-- Name: customer_tier_1_users_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tier_1_users_profile_sys_id_seq OWNED BY public.customer_tier_1_users.profile_sys_id;


--
-- TOC entry 490 (class 1259 OID 87793)
-- Name: customer_tier_1_wallet_instance_refs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_tier_1_wallet_instance_refs (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    reference_count bigint DEFAULT '-1'::integer NOT NULL,
    update_test_field character(1) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.customer_tier_1_wallet_instance_refs OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 36994)
-- Name: customer_tier_1_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_tier_1_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    current_balance character(60) DEFAULT '-'::bpchar,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    wallet_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_balance character(60) DEFAULT '-'::bpchar,
    hold_amount_balance character(60) DEFAULT '-'::bpchar,
    transit_trxn_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_reversal_bal character(60) DEFAULT '-'::bpchar,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(60) DEFAULT '-'::bpchar,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.customer_tier_1_wallets OWNER TO postgres;

--
-- TOC entry 397 (class 1259 OID 46670)
-- Name: customer_user_device_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_user_device_sessions (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    request_partner_code character(20) DEFAULT '-'::bpchar,
    request_app_code character(8) DEFAULT '-'::bpchar,
    request_user_id bigint,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    profile_sys_id bigint,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    ext_customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    is_user_profile_active boolean DEFAULT false NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    request_channel_id character(20) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(8) DEFAULT '-'::bpchar NOT NULL,
    device_type character(15) DEFAULT '-'::bpchar NOT NULL,
    device_os character(10) DEFAULT '-'::bpchar NOT NULL,
    device_name character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT false NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_app_request_key character(50) DEFAULT '-'::bpchar NOT NULL,
    device_id character(50) DEFAULT '-'::bpchar NOT NULL,
    notification_token character(20) DEFAULT '-'::bpchar NOT NULL,
    last_login_date timestamp without time zone NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.customer_user_device_sessions OWNER TO postgres;

--
-- TOC entry 396 (class 1259 OID 46669)
-- Name: customer_user_device_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_user_device_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_user_device_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 8841 (class 0 OID 0)
-- Dependencies: 396
-- Name: customer_user_device_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_user_device_sessions_id_seq OWNED BY public.customer_user_device_sessions.id;


--
-- TOC entry 241 (class 1259 OID 24137)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    profile_id bigint NOT NULL,
    username character(42) DEFAULT '-'::bpchar NOT NULL,
    user_password character(150) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    image_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true,
    red_flagged boolean DEFAULT false,
    lang_key character(12) DEFAULT '-'::bpchar NOT NULL,
    activation_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_date timestamp without time zone,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    single_sign_on boolean DEFAULT false,
    status character(12) DEFAULT '-'::bpchar NOT NULL,
    login_count bigint DEFAULT 0 NOT NULL,
    authourization_pin character(60) DEFAULT '-'::bpchar NOT NULL,
    authourization_dpin character(60) DEFAULT '-'::bpchar NOT NULL,
    authourization_dpin_operator character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operand character(60) DEFAULT '-'::bpchar NOT NULL,
    default_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    current_session_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar,
    customer_no bigint DEFAULT 0 NOT NULL,
    authourization_dpin_operand bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 24136)
-- Name: users_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8842 (class 0 OID 0)
-- Dependencies: 240
-- Name: users_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_profile_sys_id_seq OWNED BY public.users.profile_id;


--
-- TOC entry 387 (class 1259 OID 38229)
-- Name: customer_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_users (
    id bigint NOT NULL,
    profile_id bigint DEFAULT nextval('public.users_profile_sys_id_seq'::regclass) NOT NULL,
    username character(42) DEFAULT '-'::bpchar NOT NULL,
    user_password character(150) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    image_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true,
    red_flagged boolean DEFAULT false,
    lang_key character(12) DEFAULT '-'::bpchar NOT NULL,
    activation_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_date timestamp without time zone,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    single_sign_on boolean DEFAULT false,
    status character(12) DEFAULT '-'::bpchar NOT NULL,
    login_count bigint DEFAULT 0 NOT NULL,
    authourization_pin character(60) DEFAULT '-'::bpchar NOT NULL,
    authourization_dpin character(60) DEFAULT '-'::bpchar NOT NULL,
    authourization_dpin_operator character(60) DEFAULT '-'::bpchar NOT NULL,
    authourization_dpin_operand bigint DEFAULT '-1'::integer NOT NULL,
    dpin_operand character(60) DEFAULT '-'::bpchar NOT NULL,
    default_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    current_session_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar,
    customer_no bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.customer_users OWNER TO postgres;

--
-- TOC entry 386 (class 1259 OID 38228)
-- Name: customer_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_users_id_seq OWNER TO postgres;

--
-- TOC entry 8843 (class 0 OID 0)
-- Dependencies: 386
-- Name: customer_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_users_id_seq OWNED BY public.customer_users.id;


--
-- TOC entry 488 (class 1259 OID 87779)
-- Name: customer_wallet_instance_refs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_wallet_instance_refs (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    reference_count bigint DEFAULT '-1'::integer NOT NULL,
    update_test_field character(1) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.customer_wallet_instance_refs OWNER TO postgres;

--
-- TOC entry 343 (class 1259 OID 36918)
-- Name: customer_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    current_balance character(60) DEFAULT '-'::bpchar,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    wallet_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_balance character(60) DEFAULT '-'::bpchar,
    hold_amount_balance character(60) DEFAULT '-'::bpchar,
    transit_trxn_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_reversal_bal character(60) DEFAULT '-'::bpchar,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(60) DEFAULT '-'::bpchar,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.customer_wallets OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16548)
-- Name: demo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demo (
    pw bytea
);


ALTER TABLE public.demo OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 35791)
-- Name: ext_credit_wallet_rqst_trxn_log_0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_credit_wallet_rqst_trxn_log_0 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_credit_wallet_rqst_trxn_log_0 OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 35817)
-- Name: ext_credit_wallet_rqst_trxn_log_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_credit_wallet_rqst_trxn_log_1 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_credit_wallet_rqst_trxn_log_1 OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 35843)
-- Name: ext_credit_wallet_rqst_trxn_log_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_credit_wallet_rqst_trxn_log_2 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_credit_wallet_rqst_trxn_log_2 OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 35869)
-- Name: ext_credit_wallet_rqst_trxn_log_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_credit_wallet_rqst_trxn_log_3 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_credit_wallet_rqst_trxn_log_3 OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 35895)
-- Name: ext_credit_wallet_rqst_trxn_log_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_credit_wallet_rqst_trxn_log_4 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_credit_wallet_rqst_trxn_log_4 OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 35921)
-- Name: ext_credit_wallet_rqst_trxn_log_5; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_credit_wallet_rqst_trxn_log_5 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_credit_wallet_rqst_trxn_log_5 OWNER TO postgres;

--
-- TOC entry 333 (class 1259 OID 36262)
-- Name: ext_debit_wallet_rqst_trxn_log_0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_debit_wallet_rqst_trxn_log_0 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_debit_wallet_rqst_trxn_log_0 OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 36236)
-- Name: ext_debit_wallet_rqst_trxn_log_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_debit_wallet_rqst_trxn_log_1 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_debit_wallet_rqst_trxn_log_1 OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 36209)
-- Name: ext_debit_wallet_rqst_trxn_log_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_debit_wallet_rqst_trxn_log_2 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_debit_wallet_rqst_trxn_log_2 OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 36183)
-- Name: ext_debit_wallet_rqst_trxn_log_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_debit_wallet_rqst_trxn_log_3 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_debit_wallet_rqst_trxn_log_3 OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 36157)
-- Name: ext_debit_wallet_rqst_trxn_log_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_debit_wallet_rqst_trxn_log_4 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_debit_wallet_rqst_trxn_log_4 OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 35948)
-- Name: ext_debit_wallet_rqst_trxn_log_5; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ext_debit_wallet_rqst_trxn_log_5 (
    id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    external_trxn_ref character(30) DEFAULT '-'::bpchar,
    profile_id character(14) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    trxn_dr_cr_request character(2) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar,
    accnt_bank_code character(3) DEFAULT '-'::bpchar,
    wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    wallet_accnt_type_id integer DEFAULT '-1'::integer NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar,
    selected character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.ext_debit_wallet_rqst_trxn_log_5 OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 34837)
-- Name: inter_node_wallet_trxn_log_0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inter_node_wallet_trxn_log_0 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.inter_node_wallet_trxn_log_0 OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 34836)
-- Name: inter_node_wallet_trxn_log_0_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inter_node_wallet_trxn_log_0_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inter_node_wallet_trxn_log_0_id_seq OWNER TO postgres;

--
-- TOC entry 8844 (class 0 OID 0)
-- Dependencies: 276
-- Name: inter_node_wallet_trxn_log_0_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inter_node_wallet_trxn_log_0_id_seq OWNED BY public.inter_node_wallet_trxn_log_0.id;


--
-- TOC entry 271 (class 1259 OID 34662)
-- Name: inter_node_wallet_trxn_log_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inter_node_wallet_trxn_log_1 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.inter_node_wallet_trxn_log_1 OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 34661)
-- Name: inter_node_wallet_trxn_log_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inter_node_wallet_trxn_log_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inter_node_wallet_trxn_log_1_id_seq OWNER TO postgres;

--
-- TOC entry 8845 (class 0 OID 0)
-- Dependencies: 270
-- Name: inter_node_wallet_trxn_log_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inter_node_wallet_trxn_log_1_id_seq OWNED BY public.inter_node_wallet_trxn_log_1.id;


--
-- TOC entry 273 (class 1259 OID 34712)
-- Name: inter_node_wallet_trxn_log_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inter_node_wallet_trxn_log_2 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.inter_node_wallet_trxn_log_2 OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 34711)
-- Name: inter_node_wallet_trxn_log_2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inter_node_wallet_trxn_log_2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inter_node_wallet_trxn_log_2_id_seq OWNER TO postgres;

--
-- TOC entry 8846 (class 0 OID 0)
-- Dependencies: 272
-- Name: inter_node_wallet_trxn_log_2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inter_node_wallet_trxn_log_2_id_seq OWNED BY public.inter_node_wallet_trxn_log_2.id;


--
-- TOC entry 275 (class 1259 OID 34761)
-- Name: inter_node_wallet_trxn_log_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inter_node_wallet_trxn_log_3 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.inter_node_wallet_trxn_log_3 OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 34760)
-- Name: inter_node_wallet_trxn_log_3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inter_node_wallet_trxn_log_3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inter_node_wallet_trxn_log_3_id_seq OWNER TO postgres;

--
-- TOC entry 8847 (class 0 OID 0)
-- Dependencies: 274
-- Name: inter_node_wallet_trxn_log_3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inter_node_wallet_trxn_log_3_id_seq OWNED BY public.inter_node_wallet_trxn_log_3.id;


--
-- TOC entry 279 (class 1259 OID 34887)
-- Name: inter_node_wallet_trxn_log_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inter_node_wallet_trxn_log_4 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.inter_node_wallet_trxn_log_4 OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 34886)
-- Name: inter_node_wallet_trxn_log_4_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inter_node_wallet_trxn_log_4_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inter_node_wallet_trxn_log_4_id_seq OWNER TO postgres;

--
-- TOC entry 8848 (class 0 OID 0)
-- Dependencies: 278
-- Name: inter_node_wallet_trxn_log_4_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inter_node_wallet_trxn_log_4_id_seq OWNED BY public.inter_node_wallet_trxn_log_4.id;


--
-- TOC entry 281 (class 1259 OID 34936)
-- Name: inter_node_wallet_trxn_log_5; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inter_node_wallet_trxn_log_5 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.inter_node_wallet_trxn_log_5 OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 34935)
-- Name: inter_node_wallet_trxn_log_5_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inter_node_wallet_trxn_log_5_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inter_node_wallet_trxn_log_5_id_seq OWNER TO postgres;

--
-- TOC entry 8849 (class 0 OID 0)
-- Dependencies: 280
-- Name: inter_node_wallet_trxn_log_5_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inter_node_wallet_trxn_log_5_id_seq OWNED BY public.inter_node_wallet_trxn_log_5.id;


--
-- TOC entry 291 (class 1259 OID 35182)
-- Name: intra_node_wallet_trxn_log_0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intra_node_wallet_trxn_log_0 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.intra_node_wallet_trxn_log_0 OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 35181)
-- Name: intra_node_wallet_trxn_log_0_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intra_node_wallet_trxn_log_0_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intra_node_wallet_trxn_log_0_id_seq OWNER TO postgres;

--
-- TOC entry 8850 (class 0 OID 0)
-- Dependencies: 290
-- Name: intra_node_wallet_trxn_log_0_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intra_node_wallet_trxn_log_0_id_seq OWNED BY public.intra_node_wallet_trxn_log_0.id;


--
-- TOC entry 289 (class 1259 OID 35132)
-- Name: intra_node_wallet_trxn_log_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intra_node_wallet_trxn_log_1 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.intra_node_wallet_trxn_log_1 OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 35131)
-- Name: intra_node_wallet_trxn_log_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intra_node_wallet_trxn_log_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intra_node_wallet_trxn_log_1_id_seq OWNER TO postgres;

--
-- TOC entry 8851 (class 0 OID 0)
-- Dependencies: 288
-- Name: intra_node_wallet_trxn_log_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intra_node_wallet_trxn_log_1_id_seq OWNED BY public.intra_node_wallet_trxn_log_1.id;


--
-- TOC entry 287 (class 1259 OID 35083)
-- Name: intra_node_wallet_trxn_log_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intra_node_wallet_trxn_log_2 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.intra_node_wallet_trxn_log_2 OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 35082)
-- Name: intra_node_wallet_trxn_log_2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intra_node_wallet_trxn_log_2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intra_node_wallet_trxn_log_2_id_seq OWNER TO postgres;

--
-- TOC entry 8852 (class 0 OID 0)
-- Dependencies: 286
-- Name: intra_node_wallet_trxn_log_2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intra_node_wallet_trxn_log_2_id_seq OWNED BY public.intra_node_wallet_trxn_log_2.id;


--
-- TOC entry 285 (class 1259 OID 35034)
-- Name: intra_node_wallet_trxn_log_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intra_node_wallet_trxn_log_3 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.intra_node_wallet_trxn_log_3 OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 35033)
-- Name: intra_node_wallet_trxn_log_3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intra_node_wallet_trxn_log_3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intra_node_wallet_trxn_log_3_id_seq OWNER TO postgres;

--
-- TOC entry 8853 (class 0 OID 0)
-- Dependencies: 284
-- Name: intra_node_wallet_trxn_log_3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intra_node_wallet_trxn_log_3_id_seq OWNED BY public.intra_node_wallet_trxn_log_3.id;


--
-- TOC entry 283 (class 1259 OID 34985)
-- Name: intra_node_wallet_trxn_log_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intra_node_wallet_trxn_log_4 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.intra_node_wallet_trxn_log_4 OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 34984)
-- Name: intra_node_wallet_trxn_log_4_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intra_node_wallet_trxn_log_4_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intra_node_wallet_trxn_log_4_id_seq OWNER TO postgres;

--
-- TOC entry 8854 (class 0 OID 0)
-- Dependencies: 282
-- Name: intra_node_wallet_trxn_log_4_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intra_node_wallet_trxn_log_4_id_seq OWNED BY public.intra_node_wallet_trxn_log_4.id;


--
-- TOC entry 305 (class 1259 OID 35526)
-- Name: intra_node_wallet_trxn_log_5; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intra_node_wallet_trxn_log_5 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.intra_node_wallet_trxn_log_5 OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 35525)
-- Name: intra_node_wallet_trxn_log_5_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intra_node_wallet_trxn_log_5_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intra_node_wallet_trxn_log_5_id_seq OWNER TO postgres;

--
-- TOC entry 8855 (class 0 OID 0)
-- Dependencies: 304
-- Name: intra_node_wallet_trxn_log_5_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intra_node_wallet_trxn_log_5_id_seq OWNED BY public.intra_node_wallet_trxn_log_5.id;


--
-- TOC entry 316 (class 1259 OID 36050)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_sys_id bigint NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(60) DEFAULT '-'::bpchar NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    item_code character(5) DEFAULT '-'::bpchar NOT NULL,
    item_name character(60) DEFAULT '-'::bpchar NOT NULL,
    available_units bigint DEFAULT 0 NOT NULL,
    cost_price numeric(15,2) DEFAULT 0.00,
    ency_cost_price character(60) DEFAULT '-'::bpchar NOT NULL,
    purchases_this_week bigint DEFAULT 0 NOT NULL,
    purchases_this_month bigint DEFAULT 0 NOT NULL,
    purchases_ytd bigint DEFAULT 0 NOT NULL,
    encry_margin character(60) DEFAULT '-'::bpchar NOT NULL,
    last_purchase_date date NOT NULL,
    last_purchase_time timestamp without time zone NOT NULL,
    last_sales_date date NOT NULL,
    last_sales_time timestamp without time zone NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 36047)
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_id_seq OWNER TO postgres;

--
-- TOC entry 8856 (class 0 OID 0)
-- Dependencies: 313
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- TOC entry 328 (class 1259 OID 36136)
-- Name: inventory_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_items (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_sys_id bigint NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(60) DEFAULT '-'::bpchar NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    item_code character(5) DEFAULT '-'::bpchar NOT NULL,
    item_name character(60) DEFAULT '-'::bpchar NOT NULL,
    item_description character(60) DEFAULT '-'::bpchar NOT NULL,
    supplier_code character(10) DEFAULT '-'::bpchar NOT NULL,
    supplier_phone character(30) DEFAULT '-'::bpchar NOT NULL,
    supplier_email character(30) DEFAULT '-'::bpchar NOT NULL,
    supplier_whatsapp character(30) DEFAULT '-'::bpchar NOT NULL,
    last_purchase_price numeric(15,2) DEFAULT 0.00,
    ency_last_purchase_price character(60) DEFAULT '-'::bpchar NOT NULL,
    last_purchase_date date NOT NULL,
    last_purchase_time timestamp without time zone NOT NULL
);


ALTER TABLE public.inventory_items OWNER TO postgres;

--
-- TOC entry 325 (class 1259 OID 36133)
-- Name: inventory_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_items_id_seq OWNER TO postgres;

--
-- TOC entry 8857 (class 0 OID 0)
-- Dependencies: 325
-- Name: inventory_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_items_id_seq OWNED BY public.inventory_items.id;


--
-- TOC entry 327 (class 1259 OID 36135)
-- Name: inventory_items_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_items_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_items_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8858 (class 0 OID 0)
-- Dependencies: 327
-- Name: inventory_items_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_items_profile_sys_id_seq OWNED BY public.inventory_items.profile_sys_id;


--
-- TOC entry 326 (class 1259 OID 36134)
-- Name: inventory_items_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_items_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_items_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8859 (class 0 OID 0)
-- Dependencies: 326
-- Name: inventory_items_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_items_user_sys_id_seq OWNED BY public.inventory_items.user_sys_id;


--
-- TOC entry 315 (class 1259 OID 36049)
-- Name: inventory_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8860 (class 0 OID 0)
-- Dependencies: 315
-- Name: inventory_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_profile_sys_id_seq OWNED BY public.inventory.profile_sys_id;


--
-- TOC entry 314 (class 1259 OID 36048)
-- Name: inventory_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8861 (class 0 OID 0)
-- Dependencies: 314
-- Name: inventory_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_user_sys_id_seq OWNED BY public.inventory.user_sys_id;


--
-- TOC entry 504 (class 1259 OID 96987)
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
-- TOC entry 503 (class 1259 OID 96986)
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
-- TOC entry 8862 (class 0 OID 0)
-- Dependencies: 503
-- Name: journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_id_seq OWNED BY public.journal.id;


--
-- TOC entry 508 (class 1259 OID 97228)
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
-- TOC entry 507 (class 1259 OID 97227)
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
-- TOC entry 8863 (class 0 OID 0)
-- Dependencies: 507
-- Name: journal_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_line_id_seq OWNED BY public.journal_line.id;


--
-- TOC entry 506 (class 1259 OID 97014)
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
-- TOC entry 505 (class 1259 OID 97013)
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
-- TOC entry 8864 (class 0 OID 0)
-- Dependencies: 505
-- Name: journal_line_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_line_summary_id_seq OWNED BY public.journal_line_summary.id;


--
-- TOC entry 509 (class 1259 OID 97479)
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
-- TOC entry 377 (class 1259 OID 37968)
-- Name: merchant_profile_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_profile_details (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    middle_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    city character(50) DEFAULT '-'::bpchar NOT NULL,
    state character(50) DEFAULT '-'::bpchar NOT NULL,
    country character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    email_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    email_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    loc_longitude bigint DEFAULT '-1'::integer NOT NULL,
    loc_latitude bigint DEFAULT '-1'::integer NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.merchant_profile_details OWNER TO postgres;

--
-- TOC entry 376 (class 1259 OID 37967)
-- Name: merchant_profile_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_profile_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_profile_details_id_seq OWNER TO postgres;

--
-- TOC entry 8865 (class 0 OID 0)
-- Dependencies: 376
-- Name: merchant_profile_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_profile_details_id_seq OWNED BY public.merchant_profile_details.id;


--
-- TOC entry 384 (class 1259 OID 38110)
-- Name: merchant_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_profiles (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_detail_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(150) DEFAULT '-'::bpchar NOT NULL,
    profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    customer_no bigint DEFAULT 0 NOT NULL,
    mobile_number character(50) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    red_flaged boolean DEFAULT false,
    kyc_trxn_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    kyc_daily_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    consecutive_pin_retries smallint DEFAULT 0 NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar
);


ALTER TABLE public.merchant_profiles OWNER TO postgres;

--
-- TOC entry 382 (class 1259 OID 38108)
-- Name: merchant_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 8866 (class 0 OID 0)
-- Dependencies: 382
-- Name: merchant_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_profiles_id_seq OWNED BY public.merchant_profiles.id;


--
-- TOC entry 383 (class 1259 OID 38109)
-- Name: merchant_profiles_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_profiles_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_profiles_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8867 (class 0 OID 0)
-- Dependencies: 383
-- Name: merchant_profiles_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_profiles_user_sys_id_seq OWNED BY public.merchant_profiles.user_sys_id;


--
-- TOC entry 485 (class 1259 OID 87493)
-- Name: merchant_swift_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_swift_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    book_balance character(130) DEFAULT '-'::bpchar,
    book_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    available_balance character(130) DEFAULT '-'::bpchar,
    available_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pocket_wallet_balance character(130) DEFAULT '-'::bpchar,
    pocket_wallet_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    hold_amount_balance character(130) DEFAULT '-'::bpchar,
    hold_amount_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    transit_trxn_balance character(130) DEFAULT '-'::bpchar,
    transit_trxn_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(130) DEFAULT '-'::bpchar,
    overdraft_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_debit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_credit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.merchant_swift_wallets OWNER TO postgres;

--
-- TOC entry 399 (class 1259 OID 46703)
-- Name: merchant_user_device_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_user_device_sessions (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    request_partner_code character(20) DEFAULT '-'::bpchar,
    request_app_code character(8) DEFAULT '-'::bpchar,
    request_user_id bigint,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    profile_sys_id bigint,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    ext_customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    is_user_profile_active boolean DEFAULT false NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    request_channel_id character(20) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(8) DEFAULT '-'::bpchar NOT NULL,
    device_type character(15) DEFAULT '-'::bpchar NOT NULL,
    device_os character(10) DEFAULT '-'::bpchar NOT NULL,
    device_name character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT false NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_app_request_key character(50) DEFAULT '-'::bpchar NOT NULL,
    device_id character(50) DEFAULT '-'::bpchar NOT NULL,
    notification_token character(20) DEFAULT '-'::bpchar NOT NULL,
    last_login_date timestamp without time zone NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.merchant_user_device_sessions OWNER TO postgres;

--
-- TOC entry 398 (class 1259 OID 46702)
-- Name: merchant_user_device_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_user_device_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_user_device_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 8868 (class 0 OID 0)
-- Dependencies: 398
-- Name: merchant_user_device_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_user_device_sessions_id_seq OWNED BY public.merchant_user_device_sessions.id;


--
-- TOC entry 381 (class 1259 OID 38071)
-- Name: merchant_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_users (
    id bigint NOT NULL,
    profile_detail_id bigint DEFAULT '-1'::integer NOT NULL,
    username character(42) DEFAULT '-'::bpchar NOT NULL,
    user_password character(150) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    image_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true,
    red_flagged boolean DEFAULT false,
    lang_key character(12) DEFAULT '-'::bpchar NOT NULL,
    activation_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_date timestamp without time zone,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    single_sign_on boolean DEFAULT false,
    status character(12) DEFAULT '-'::bpchar NOT NULL,
    login_count smallint DEFAULT 0 NOT NULL,
    pin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operator character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operand character(60) DEFAULT '-'::bpchar NOT NULL,
    default_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    current_session_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar,
    customer_no bigint DEFAULT 0 NOT NULL,
    authourization_dpin_operand bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.merchant_users OWNER TO postgres;

--
-- TOC entry 380 (class 1259 OID 38070)
-- Name: merchant_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merchant_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merchant_users_id_seq OWNER TO postgres;

--
-- TOC entry 8869 (class 0 OID 0)
-- Dependencies: 380
-- Name: merchant_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merchant_users_id_seq OWNED BY public.merchant_users.id;


--
-- TOC entry 385 (class 1259 OID 38146)
-- Name: merchant_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    current_balance character(60) DEFAULT '-'::bpchar,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    wallet_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_balance character(60) DEFAULT '-'::bpchar,
    hold_amount_balance character(60) DEFAULT '-'::bpchar,
    transit_trxn_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_reversal_bal character(60) DEFAULT '-'::bpchar,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(60) DEFAULT '-'::bpchar,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.merchant_wallets OWNER TO postgres;

--
-- TOC entry 413 (class 1259 OID 55669)
-- Name: node_in_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.node_in_sessions (
    id bigint NOT NULL,
    node_index integer DEFAULT '-1'::integer NOT NULL,
    node_name character(10) DEFAULT '_'::bpchar,
    start_in_session_id bigint DEFAULT '-1'::integer NOT NULL,
    end_in_session_id bigint DEFAULT '-1'::integer NOT NULL,
    start_in_session_date date NOT NULL,
    start_in_session_time time without time zone NOT NULL,
    end_in_session_date date,
    end_in_session_time time without time zone
);


ALTER TABLE public.node_in_sessions OWNER TO postgres;

--
-- TOC entry 412 (class 1259 OID 55668)
-- Name: node_in_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.node_in_sessions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.node_in_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 415 (class 1259 OID 55677)
-- Name: node_out_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.node_out_sessions (
    id bigint NOT NULL,
    node_index integer DEFAULT '-1'::integer NOT NULL,
    node_name character(10) DEFAULT '_'::bpchar,
    start_out_session_id bigint DEFAULT '-1'::integer NOT NULL,
    end_out_session_id bigint DEFAULT '-1'::integer NOT NULL,
    start_out_session_date date,
    start_out_session_time time without time zone,
    end_out_session_date date,
    end_out_session_time time without time zone,
    is_outof_service boolean DEFAULT false
);


ALTER TABLE public.node_out_sessions OWNER TO postgres;

--
-- TOC entry 414 (class 1259 OID 55676)
-- Name: node_out_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.node_out_sessions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.node_out_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 18957)
-- Name: nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nodes (
    node_id bigint DEFAULT '-1'::integer NOT NULL,
    node_group_code character(2) DEFAULT '11'::bpchar,
    this_node character(1) DEFAULT 'N'::bpchar,
    wallet_acct_lower_bound bigint DEFAULT '-1'::integer NOT NULL,
    wallet_acct_upper_bound bigint DEFAULT '-1'::integer NOT NULL,
    node_ip_address character(20) DEFAULT '-'::bpchar,
    node_fail_over_ip character(20) DEFAULT '-'::bpchar,
    is_active character(1) DEFAULT 'Y'::bpchar
);


ALTER TABLE public.nodes OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 34322)
-- Name: operational_charges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operational_charges (
    id bigint DEFAULT '-1'::integer NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    charge_name character(20) DEFAULT 'VAT'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_num bigint DEFAULT '-1'::integer NOT NULL,
    public_ledger_biller_id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_name character(40) DEFAULT '.jpg'::bpchar NOT NULL,
    date_opened date NOT NULL,
    charge_trxn boolean DEFAULT true NOT NULL,
    applicable_trxn_type character(20) DEFAULT 'wallettowallet'::bpchar NOT NULL,
    all_trxn_bands_rate numeric(15,2) DEFAULT 0.00 NOT NULL,
    use_percentage boolean DEFAULT true NOT NULL,
    lower_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00 NOT NULL,
    medium_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00 NOT NULL,
    upper_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_modified_date date,
    is_active boolean DEFAULT true NOT NULL,
    charge_code character(10) DEFAULT 'VAT'::bpchar NOT NULL,
    make_scheme_incur_customer_charges boolean DEFAULT false NOT NULL
);


ALTER TABLE public.operational_charges OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19853)
-- Name: operational_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operational_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_num bigint DEFAULT '-1'::integer NOT NULL,
    biller_id bigint DEFAULT '-1'::integer NOT NULL,
    public_ledger_biller_id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_name character(40) DEFAULT '.jpg'::bpchar NOT NULL,
    balance_amount numeric(15,2) DEFAULT 0.00,
    date_opened date NOT NULL,
    charge_trxn boolean DEFAULT true NOT NULL,
    applicable_trxn_type character(20) DEFAULT 'wallettowallet'::bpchar NOT NULL,
    share_accrued boolean DEFAULT false NOT NULL,
    use_percentage boolean DEFAULT true NOT NULL,
    lower_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    medium_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    upper_trxn_band_perct_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    last_modified_date date,
    is_active boolean DEFAULT true NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    hold_amount numeric(15,2) DEFAULT 0.00,
    partner_code character(20) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.operational_wallets OWNER TO postgres;

--
-- TOC entry 511 (class 1259 OID 97497)
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
-- TOC entry 510 (class 1259 OID 97488)
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
-- TOC entry 431 (class 1259 OID 72505)
-- Name: partner_loan_tenures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partner_loan_tenures (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    partner_code character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    loan_name character(40) DEFAULT '_'::bpchar,
    lender_code character(20) DEFAULT '_'::bpchar,
    minimum_amount numeric(15,2) DEFAULT 0.00,
    maximum_amount numeric(15,2) DEFAULT 0.00,
    minimum_duration integer DEFAULT 0 NOT NULL,
    maximum_duration integer DEFAULT 0 NOT NULL,
    tenure_type character(10) DEFAULT 'Months'::bpchar,
    loan_type character(40) DEFAULT '_'::bpchar,
    loan_type_id integer DEFAULT 0 NOT NULL,
    service_type character(20) DEFAULT '_'::bpchar,
    rate numeric(15,2) DEFAULT 0.00,
    is_active boolean DEFAULT false
);


ALTER TABLE public.partner_loan_tenures OWNER TO postgres;

--
-- TOC entry 430 (class 1259 OID 72504)
-- Name: partner_loan_tenures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.partner_loan_tenures ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.partner_loan_tenures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 429 (class 1259 OID 72493)
-- Name: partner_loan_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partner_loan_types (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    partner_code character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    loan_name character(40) DEFAULT '_'::bpchar,
    loan_description character(60) DEFAULT '_'::bpchar,
    loan_type character(40) DEFAULT '_'::bpchar,
    short_name character(40) DEFAULT '_'::bpchar,
    is_active boolean DEFAULT false
);


ALTER TABLE public.partner_loan_types OWNER TO postgres;

--
-- TOC entry 428 (class 1259 OID 72492)
-- Name: partner_loan_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.partner_loan_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.partner_loan_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 407 (class 1259 OID 46837)
-- Name: partner_user_device_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partner_user_device_sessions (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    request_partner_code character(20) DEFAULT '-'::bpchar,
    request_app_code character(8) DEFAULT '-'::bpchar,
    request_user_id bigint,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    profile_sys_id bigint,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    ext_customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    is_user_profile_active boolean DEFAULT false NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    request_channel_id character(20) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(8) DEFAULT '-'::bpchar NOT NULL,
    device_type character(15) DEFAULT '-'::bpchar NOT NULL,
    device_os character(10) DEFAULT '-'::bpchar NOT NULL,
    device_name character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT false NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_app_request_key character(50) DEFAULT '-'::bpchar NOT NULL,
    device_id character(50) DEFAULT '-'::bpchar NOT NULL,
    notification_token character(20) DEFAULT '-'::bpchar NOT NULL,
    last_login_date timestamp without time zone NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.partner_user_device_sessions OWNER TO postgres;

--
-- TOC entry 406 (class 1259 OID 46836)
-- Name: partner_user_device_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partner_user_device_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partner_user_device_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 8870 (class 0 OID 0)
-- Dependencies: 406
-- Name: partner_user_device_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partner_user_device_sessions_id_seq OWNED BY public.partner_user_device_sessions.id;


--
-- TOC entry 441 (class 1259 OID 84231)
-- Name: pending_bank_credit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_bank_credit (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_bank_credit OWNER TO postgres;

--
-- TOC entry 443 (class 1259 OID 84280)
-- Name: pending_bank_credit_0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_bank_credit_0 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_bank_credit_0 OWNER TO postgres;

--
-- TOC entry 442 (class 1259 OID 84279)
-- Name: pending_bank_credit_0_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_bank_credit_0 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_bank_credit_0_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 445 (class 1259 OID 84380)
-- Name: pending_bank_credit_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_bank_credit_1 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_bank_credit_1 OWNER TO postgres;

--
-- TOC entry 444 (class 1259 OID 84379)
-- Name: pending_bank_credit_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_bank_credit_1 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_bank_credit_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 447 (class 1259 OID 84478)
-- Name: pending_bank_credit_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_bank_credit_2 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_bank_credit_2 OWNER TO postgres;

--
-- TOC entry 446 (class 1259 OID 84477)
-- Name: pending_bank_credit_2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_bank_credit_2 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_bank_credit_2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 449 (class 1259 OID 84527)
-- Name: pending_bank_credit_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_bank_credit_3 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_bank_credit_3 OWNER TO postgres;

--
-- TOC entry 448 (class 1259 OID 84526)
-- Name: pending_bank_credit_3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_bank_credit_3 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_bank_credit_3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 451 (class 1259 OID 84576)
-- Name: pending_bank_credit_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_bank_credit_4 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_bank_credit_4 OWNER TO postgres;

--
-- TOC entry 450 (class 1259 OID 84575)
-- Name: pending_bank_credit_4_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_bank_credit_4 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_bank_credit_4_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 440 (class 1259 OID 84230)
-- Name: pending_bank_credit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_bank_credit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_bank_credit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 459 (class 1259 OID 85515)
-- Name: pending_node_credit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_node_credit (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_node_credit OWNER TO postgres;

--
-- TOC entry 457 (class 1259 OID 85466)
-- Name: pending_node_credit_0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_node_credit_0 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_node_credit_0 OWNER TO postgres;

--
-- TOC entry 456 (class 1259 OID 85465)
-- Name: pending_node_credit_0_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_node_credit_0 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_node_credit_0_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 455 (class 1259 OID 85417)
-- Name: pending_node_credit_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_node_credit_1 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_node_credit_1 OWNER TO postgres;

--
-- TOC entry 454 (class 1259 OID 85416)
-- Name: pending_node_credit_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_node_credit_1 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_node_credit_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 453 (class 1259 OID 85368)
-- Name: pending_node_credit_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_node_credit_2 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_node_credit_2 OWNER TO postgres;

--
-- TOC entry 452 (class 1259 OID 85367)
-- Name: pending_node_credit_2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_node_credit_2 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_node_credit_2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 463 (class 1259 OID 85615)
-- Name: pending_node_credit_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_node_credit_3 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_node_credit_3 OWNER TO postgres;

--
-- TOC entry 462 (class 1259 OID 85614)
-- Name: pending_node_credit_3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_node_credit_3 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_node_credit_3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 461 (class 1259 OID 85566)
-- Name: pending_node_credit_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_node_credit_4 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    credit_amount numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_node_credit_4 OWNER TO postgres;

--
-- TOC entry 460 (class 1259 OID 85565)
-- Name: pending_node_credit_4_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_node_credit_4 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_node_credit_4_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 458 (class 1259 OID 85514)
-- Name: pending_node_credit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_node_credit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_node_credit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 465 (class 1259 OID 86245)
-- Name: pending_process_trxn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_process_trxn (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    bearer_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    sender_scheme_code character(20) DEFAULT '-'::bpchar,
    sender_profile_type_code character(5) DEFAULT '-'::bpchar,
    sender_customer_reference character(20) DEFAULT '-'::bpchar,
    sender_name character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet character(15) DEFAULT '-'::bpchar NOT NULL,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    total_trxn_amount numeric(15,2) DEFAULT 0.00,
    trxn_value_amount numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_amount numeric(15,2) DEFAULT 0.00,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_process_code integer DEFAULT '-1'::integer NOT NULL,
    trxn_status_code character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_status character(20) DEFAULT '-'::bpchar NOT NULL,
    bonus_credit_amount numeric(15,2) DEFAULT 0.00,
    bonus_debit_amount numeric(15,2) DEFAULT 0.00,
    avail_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    avail_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    is_debit_wallet_in_memory boolean DEFAULT false NOT NULL,
    is_credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_process_trxn OWNER TO postgres;

--
-- TOC entry 475 (class 1259 OID 86663)
-- Name: pending_process_trxn_0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_process_trxn_0 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    bearer_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    sender_scheme_code character(20) DEFAULT '-'::bpchar,
    sender_profile_type_code character(5) DEFAULT '-'::bpchar,
    sender_customer_reference character(20) DEFAULT '-'::bpchar,
    sender_name character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet character(15) DEFAULT '-'::bpchar NOT NULL,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    total_trxn_amount numeric(15,2) DEFAULT 0.00,
    trxn_value_amount numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_amount numeric(15,2) DEFAULT 0.00,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_process_code integer DEFAULT '-1'::integer NOT NULL,
    trxn_status_code character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_status character(20) DEFAULT '-'::bpchar NOT NULL,
    bonus_credit_amount numeric(15,2) DEFAULT 0.00,
    bonus_debit_amount numeric(15,2) DEFAULT 0.00,
    avail_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    avail_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    is_debit_wallet_in_memory boolean DEFAULT false NOT NULL,
    is_credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_process_trxn_0 OWNER TO postgres;

--
-- TOC entry 474 (class 1259 OID 86662)
-- Name: pending_process_trxn_0_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_process_trxn_0 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_process_trxn_0_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 467 (class 1259 OID 86385)
-- Name: pending_process_trxn_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_process_trxn_1 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    bearer_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    sender_scheme_code character(20) DEFAULT '-'::bpchar,
    sender_profile_type_code character(5) DEFAULT '-'::bpchar,
    sender_customer_reference character(20) DEFAULT '-'::bpchar,
    sender_name character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet character(15) DEFAULT '-'::bpchar NOT NULL,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    total_trxn_amount numeric(15,2) DEFAULT 0.00,
    trxn_value_amount numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_amount numeric(15,2) DEFAULT 0.00,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_process_code integer DEFAULT '-1'::integer NOT NULL,
    trxn_status_code character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_status character(20) DEFAULT '-'::bpchar NOT NULL,
    bonus_credit_amount numeric(15,2) DEFAULT 0.00,
    bonus_debit_amount numeric(15,2) DEFAULT 0.00,
    avail_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    avail_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    is_debit_wallet_in_memory boolean DEFAULT false NOT NULL,
    is_credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_process_trxn_1 OWNER TO postgres;

--
-- TOC entry 466 (class 1259 OID 86384)
-- Name: pending_process_trxn_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_process_trxn_1 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_process_trxn_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 469 (class 1259 OID 86454)
-- Name: pending_process_trxn_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_process_trxn_2 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    bearer_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    sender_scheme_code character(20) DEFAULT '-'::bpchar,
    sender_profile_type_code character(5) DEFAULT '-'::bpchar,
    sender_customer_reference character(20) DEFAULT '-'::bpchar,
    sender_name character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet character(15) DEFAULT '-'::bpchar NOT NULL,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    total_trxn_amount numeric(15,2) DEFAULT 0.00,
    trxn_value_amount numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_amount numeric(15,2) DEFAULT 0.00,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_process_code integer DEFAULT '-1'::integer NOT NULL,
    trxn_status_code character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_status character(20) DEFAULT '-'::bpchar NOT NULL,
    bonus_credit_amount numeric(15,2) DEFAULT 0.00,
    bonus_debit_amount numeric(15,2) DEFAULT 0.00,
    avail_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    avail_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    is_debit_wallet_in_memory boolean DEFAULT false NOT NULL,
    is_credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_process_trxn_2 OWNER TO postgres;

--
-- TOC entry 468 (class 1259 OID 86453)
-- Name: pending_process_trxn_2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_process_trxn_2 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_process_trxn_2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 471 (class 1259 OID 86525)
-- Name: pending_process_trxn_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_process_trxn_3 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    bearer_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    sender_scheme_code character(20) DEFAULT '-'::bpchar,
    sender_profile_type_code character(5) DEFAULT '-'::bpchar,
    sender_customer_reference character(20) DEFAULT '-'::bpchar,
    sender_name character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet character(15) DEFAULT '-'::bpchar NOT NULL,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    total_trxn_amount numeric(15,2) DEFAULT 0.00,
    trxn_value_amount numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_amount numeric(15,2) DEFAULT 0.00,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_process_code integer DEFAULT '-1'::integer NOT NULL,
    trxn_status_code character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_status character(20) DEFAULT '-'::bpchar NOT NULL,
    bonus_credit_amount numeric(15,2) DEFAULT 0.00,
    bonus_debit_amount numeric(15,2) DEFAULT 0.00,
    avail_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    avail_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    is_debit_wallet_in_memory boolean DEFAULT false NOT NULL,
    is_credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_process_trxn_3 OWNER TO postgres;

--
-- TOC entry 470 (class 1259 OID 86524)
-- Name: pending_process_trxn_3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_process_trxn_3 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_process_trxn_3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 473 (class 1259 OID 86594)
-- Name: pending_process_trxn_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pending_process_trxn_4 (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    bearer_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    sender_scheme_code character(20) DEFAULT '-'::bpchar,
    sender_profile_type_code character(5) DEFAULT '-'::bpchar,
    sender_customer_reference character(20) DEFAULT '-'::bpchar,
    sender_name character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet character(15) DEFAULT '-'::bpchar NOT NULL,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    reciever_scheme_code character(20) DEFAULT '-'::bpchar,
    reciever_profile_type_code character(5) DEFAULT '-'::bpchar,
    reciever_customer_reference character(20) DEFAULT '-'::bpchar,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    total_trxn_amount numeric(15,2) DEFAULT 0.00,
    trxn_value_amount numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_amount numeric(15,2) DEFAULT 0.00,
    credit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    credit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_process_code integer DEFAULT '-1'::integer NOT NULL,
    trxn_status_code character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_status character(20) DEFAULT '-'::bpchar NOT NULL,
    bonus_credit_amount numeric(15,2) DEFAULT 0.00,
    bonus_debit_amount numeric(15,2) DEFAULT 0.00,
    avail_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    avail_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    is_processed boolean DEFAULT false,
    is_selected boolean DEFAULT false NOT NULL,
    is_debit_wallet_in_memory boolean DEFAULT false NOT NULL,
    is_credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pending_process_trxn_4 OWNER TO postgres;

--
-- TOC entry 472 (class 1259 OID 86593)
-- Name: pending_process_trxn_4_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_process_trxn_4 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_process_trxn_4_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 464 (class 1259 OID 86244)
-- Name: pending_process_trxn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pending_process_trxn ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pending_process_trxn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 375 (class 1259 OID 37917)
-- Name: pos_profile_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pos_profile_details (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    middle_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    city character(50) DEFAULT '-'::bpchar NOT NULL,
    state character(50) DEFAULT '-'::bpchar NOT NULL,
    country character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    email_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    email_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    loc_longitude bigint DEFAULT '-1'::integer NOT NULL,
    loc_latitude bigint DEFAULT '-1'::integer NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.pos_profile_details OWNER TO postgres;

--
-- TOC entry 374 (class 1259 OID 37916)
-- Name: pos_profile_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pos_profile_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pos_profile_details_id_seq OWNER TO postgres;

--
-- TOC entry 8871 (class 0 OID 0)
-- Dependencies: 374
-- Name: pos_profile_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pos_profile_details_id_seq OWNED BY public.pos_profile_details.id;


--
-- TOC entry 349 (class 1259 OID 37197)
-- Name: pos_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pos_profiles (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_detail_sys_id bigint NOT NULL,
    profile_id character(150) DEFAULT '-'::bpchar NOT NULL,
    profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    customer_no bigint DEFAULT 0 NOT NULL,
    mobile_number character(50) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    red_flagged boolean DEFAULT false,
    kyc_trxn_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    kyc_daily_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    consecutive_pin_retries smallint DEFAULT 0 NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar
);


ALTER TABLE public.pos_profiles OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 37194)
-- Name: pos_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pos_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pos_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 8872 (class 0 OID 0)
-- Dependencies: 346
-- Name: pos_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pos_profiles_id_seq OWNED BY public.pos_profiles.id;


--
-- TOC entry 348 (class 1259 OID 37196)
-- Name: pos_profiles_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pos_profiles_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pos_profiles_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8873 (class 0 OID 0)
-- Dependencies: 348
-- Name: pos_profiles_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pos_profiles_profile_sys_id_seq OWNED BY public.pos_profiles.profile_detail_sys_id;


--
-- TOC entry 347 (class 1259 OID 37195)
-- Name: pos_profiles_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pos_profiles_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pos_profiles_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8874 (class 0 OID 0)
-- Dependencies: 347
-- Name: pos_profiles_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pos_profiles_user_sys_id_seq OWNED BY public.pos_profiles.user_sys_id;


--
-- TOC entry 495 (class 1259 OID 88032)
-- Name: pos_swift_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pos_swift_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    book_balance character(130) DEFAULT '-'::bpchar,
    book_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    customer_ref character(30) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    available_balance character(130) DEFAULT '-'::bpchar,
    available_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pocket_wallet_balance character(130) DEFAULT '-'::bpchar,
    pocket_wallet_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    hold_amount_balance character(130) DEFAULT '-'::bpchar,
    hold_amount_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    transit_trxn_balance character(130) DEFAULT '-'::bpchar,
    transit_trxn_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(130) DEFAULT '-'::bpchar,
    overdraft_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_debit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_credit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.pos_swift_wallets OWNER TO postgres;

--
-- TOC entry 401 (class 1259 OID 46736)
-- Name: pos_user_device_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pos_user_device_sessions (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    request_partner_code character(20) DEFAULT '-'::bpchar,
    request_app_code character(8) DEFAULT '-'::bpchar,
    request_user_id bigint,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    profile_sys_id bigint,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    ext_customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    is_user_profile_active boolean DEFAULT false NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    request_channel_id character(20) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(8) DEFAULT '-'::bpchar NOT NULL,
    device_type character(15) DEFAULT '-'::bpchar NOT NULL,
    device_os character(10) DEFAULT '-'::bpchar NOT NULL,
    device_name character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT false NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_app_request_key character(50) DEFAULT '-'::bpchar NOT NULL,
    device_id character(50) DEFAULT '-'::bpchar NOT NULL,
    notification_token character(20) DEFAULT '-'::bpchar NOT NULL,
    last_login_date timestamp without time zone NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.pos_user_device_sessions OWNER TO postgres;

--
-- TOC entry 400 (class 1259 OID 46735)
-- Name: pos_user_device_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pos_user_device_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pos_user_device_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 8875 (class 0 OID 0)
-- Dependencies: 400
-- Name: pos_user_device_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pos_user_device_sessions_id_seq OWNED BY public.pos_user_device_sessions.id;


--
-- TOC entry 340 (class 1259 OID 36666)
-- Name: pos_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pos_users (
    id bigint NOT NULL,
    profile_sys_id bigint NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    username character(42) DEFAULT '-'::bpchar NOT NULL,
    user_password character(150) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    image_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true,
    red_flagged boolean DEFAULT false,
    lang_key character(12) DEFAULT '-'::bpchar NOT NULL,
    activation_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_date timestamp without time zone,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    single_sign_on boolean DEFAULT false,
    status character(12) DEFAULT '-'::bpchar NOT NULL,
    login_count smallint DEFAULT 0 NOT NULL,
    pin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operator character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operand character(60) DEFAULT '-'::bpchar NOT NULL,
    default_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    current_session_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar,
    authourization_dpin_operand bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.pos_users OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 36664)
-- Name: pos_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pos_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pos_users_id_seq OWNER TO postgres;

--
-- TOC entry 8876 (class 0 OID 0)
-- Dependencies: 338
-- Name: pos_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pos_users_id_seq OWNED BY public.pos_users.id;


--
-- TOC entry 339 (class 1259 OID 36665)
-- Name: pos_users_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pos_users_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pos_users_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8877 (class 0 OID 0)
-- Dependencies: 339
-- Name: pos_users_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pos_users_profile_sys_id_seq OWNED BY public.pos_users.profile_sys_id;


--
-- TOC entry 489 (class 1259 OID 87786)
-- Name: pos_wallet_instance_refs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pos_wallet_instance_refs (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    reference_count bigint DEFAULT '-1'::integer NOT NULL,
    update_test_field character(1) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.pos_wallet_instance_refs OWNER TO postgres;

--
-- TOC entry 341 (class 1259 OID 36842)
-- Name: pos_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pos_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    current_balance character(60) DEFAULT '-'::bpchar,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    wallet_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_balance character(60) DEFAULT '-'::bpchar,
    hold_amount_balance character(60) DEFAULT '-'::bpchar,
    transit_trxn_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_reversal_bal character(60) DEFAULT '-'::bpchar,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(60) DEFAULT '-'::bpchar,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.pos_wallets OWNER TO postgres;

--
-- TOC entry 392 (class 1259 OID 46618)
-- Name: product_scheme_promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_scheme_promotions (
    id bigint NOT NULL,
    product_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    reward_amount numeric(15,2) DEFAULT 0.00 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    target_trxn_count bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.product_scheme_promotions OWNER TO postgres;

--
-- TOC entry 393 (class 1259 OID 46627)
-- Name: product_scheme_promotions_recycle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_scheme_promotions_recycle (
    id bigint NOT NULL,
    product_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    reward_amount numeric(15,2) DEFAULT 0.00 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    target_trxn_count bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.product_scheme_promotions_recycle OWNER TO postgres;

--
-- TOC entry 391 (class 1259 OID 46591)
-- Name: product_scheme_recycle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_scheme_recycle (
    id integer NOT NULL,
    product_name character(70) DEFAULT '-'::bpchar,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    use_scheme_key boolean DEFAULT false NOT NULL,
    pool_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    pool_account_number character(15) DEFAULT '-'::bpchar NOT NULL,
    pool_account_balance character(60) DEFAULT '-'::bpchar NOT NULL,
    pool_account_balance_plain numeric(15,2) DEFAULT 0.00,
    scheme_encry_key character(60) DEFAULT '-'::bpchar NOT NULL,
    last_trxn_bank_posting_date date,
    last_trxn_bank_posting_time timestamp without time zone,
    scheme_create_date date,
    api_key character(60) DEFAULT '-'::bpchar NOT NULL,
    secret_key character(60) DEFAULT '-'::bpchar NOT NULL,
    callback_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    promotions integer DEFAULT 0 NOT NULL,
    make_scheme_incur_customer_charges boolean DEFAULT false NOT NULL
);


ALTER TABLE public.product_scheme_recycle OWNER TO postgres;

--
-- TOC entry 390 (class 1259 OID 46590)
-- Name: product_scheme_recycle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_scheme_recycle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_scheme_recycle_id_seq OWNER TO postgres;

--
-- TOC entry 8878 (class 0 OID 0)
-- Dependencies: 390
-- Name: product_scheme_recycle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_scheme_recycle_id_seq OWNED BY public.product_scheme_recycle.id;


--
-- TOC entry 389 (class 1259 OID 46563)
-- Name: product_schemes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_schemes (
    id integer NOT NULL,
    product_name character(70) DEFAULT '-'::bpchar,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    use_scheme_key boolean DEFAULT false NOT NULL,
    pool_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    pool_account_number character(15) DEFAULT '-'::bpchar NOT NULL,
    pool_account_balance character(60) DEFAULT '-'::bpchar NOT NULL,
    pool_account_balance_plain numeric(15,2) DEFAULT 0.00,
    scheme_encry_key character(60) DEFAULT '-'::bpchar NOT NULL,
    last_trxn_bank_posting_date date,
    last_trxn_bank_posting_time timestamp without time zone,
    scheme_create_date date,
    api_key character(60) DEFAULT '-'::bpchar NOT NULL,
    secret_key character(60) DEFAULT '-'::bpchar NOT NULL,
    callback_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    promotions integer DEFAULT 0 NOT NULL,
    make_scheme_incur_customer_charges boolean DEFAULT false NOT NULL
);


ALTER TABLE public.product_schemes OWNER TO postgres;

--
-- TOC entry 388 (class 1259 OID 46562)
-- Name: product_schemes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_schemes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_schemes_id_seq OWNER TO postgres;

--
-- TOC entry 8879 (class 0 OID 0)
-- Dependencies: 388
-- Name: product_schemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_schemes_id_seq OWNED BY public.product_schemes.id;


--
-- TOC entry 219 (class 1259 OID 19074)
-- Name: profile_biometrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_biometrics (
    id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(150) DEFAULT '-'::bpchar NOT NULL,
    email character(3) DEFAULT '-'::character(1) NOT NULL,
    primary_mobile character(50) DEFAULT '-'::bpchar NOT NULL,
    facial_picture bytea,
    my_device_only boolean DEFAULT true NOT NULL
);


ALTER TABLE public.profile_biometrics OWNER TO postgres;

--
-- TOC entry 367 (class 1259 OID 37709)
-- Name: profile_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_details (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    middle_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    city character(50) DEFAULT '-'::bpchar NOT NULL,
    state character(50) DEFAULT '-'::bpchar NOT NULL,
    country character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    email_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    email_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    loc_longitude bigint DEFAULT '-1'::integer NOT NULL,
    loc_latitude bigint DEFAULT '-1'::integer NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.profile_details OWNER TO postgres;

--
-- TOC entry 366 (class 1259 OID 37708)
-- Name: profile_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_details_id_seq OWNER TO postgres;

--
-- TOC entry 8880 (class 0 OID 0)
-- Dependencies: 366
-- Name: profile_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_details_id_seq OWNED BY public.profile_details.id;


--
-- TOC entry 236 (class 1259 OID 23907)
-- Name: profile_details_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_details_model (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    mail_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mail_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.profile_details_model OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 23906)
-- Name: profile_details_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_details_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_details_model_id_seq OWNER TO postgres;

--
-- TOC entry 8881 (class 0 OID 0)
-- Dependencies: 235
-- Name: profile_details_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_details_model_id_seq OWNED BY public.profile_details_model.id;


--
-- TOC entry 220 (class 1259 OID 19084)
-- Name: profile_display_picture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_display_picture (
    id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(150) DEFAULT '-'::bpchar NOT NULL,
    email character(3) DEFAULT '-'::character(1) NOT NULL,
    primary_mobile character(50) DEFAULT '-'::bpchar NOT NULL,
    display_picture bytea
);


ALTER TABLE public.profile_display_picture OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 22223)
-- Name: profile_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_types (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    profile_type character(50) DEFAULT '-'::bpchar
);


ALTER TABLE public.profile_types OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 22222)
-- Name: profile_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_types_id_seq OWNER TO postgres;

--
-- TOC entry 8882 (class 0 OID 0)
-- Dependencies: 231
-- Name: profile_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_types_id_seq OWNED BY public.profile_types.id;


--
-- TOC entry 433 (class 1259 OID 72559)
-- Name: request_item_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request_item_batches (
    id bigint NOT NULL,
    company_id character(20) DEFAULT '_'::bpchar,
    application_code character(20) DEFAULT '_'::bpchar,
    approval_workflow_id bigint DEFAULT '-1'::integer NOT NULL,
    item_type_id bigint DEFAULT '-1'::integer NOT NULL,
    total_item_count integer DEFAULT 0 NOT NULL,
    total_item_count_in_words character(60) DEFAULT '_'::bpchar,
    total_item_count_in_words_hash character(20) DEFAULT '_'::bpchar,
    is_currently_been_reviewed boolean DEFAULT false,
    current_reviewer_user_id bigint DEFAULT '-1'::integer NOT NULL,
    is_approved_final boolean DEFAULT false,
    approve_comment character(60) DEFAULT '_'::bpchar,
    reject_reason character(60) DEFAULT '_'::bpchar,
    request_batch_date date,
    request_batch_time time without time zone,
    approved_level_1_date date,
    approved_level_1_time time without time zone,
    approved_level_2_date date,
    approved_level_2_time time without time zone,
    approved_level_3_date date,
    approved_level_3_time time without time zone
);


ALTER TABLE public.request_item_batches OWNER TO postgres;

--
-- TOC entry 432 (class 1259 OID 72558)
-- Name: request_item_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.request_item_batches ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.request_item_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 481 (class 1259 OID 86947)
-- Name: request_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request_log (
    id bigint NOT NULL,
    request_id character(20) DEFAULT '_'::bpchar,
    request_company_id character(20) DEFAULT '_'::bpchar,
    request_partner_code character(20) DEFAULT '_'::bpchar,
    request_application_code character(20) DEFAULT '_'::bpchar,
    request_type character(40) DEFAULT 'POST'::bpchar,
    request_hash bigint DEFAULT '-1'::bigint,
    request_json character(120) DEFAULT '_'::bpchar,
    is_request_parsed_ok boolean DEFAULT false,
    request_time time without time zone,
    request_date date,
    response_sent boolean DEFAULT false,
    is_successfully_processed boolean DEFAULT false
);


ALTER TABLE public.request_log OWNER TO postgres;

--
-- TOC entry 480 (class 1259 OID 86946)
-- Name: request_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.request_log ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.request_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 483 (class 1259 OID 87035)
-- Name: response_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.response_log (
    id bigint NOT NULL,
    request_id character(20) DEFAULT '_'::bpchar,
    response_company_id character(20) DEFAULT '_'::bpchar,
    response_partner_code character(20) DEFAULT '_'::bpchar,
    response_application_code character(20) DEFAULT '_'::bpchar,
    response_direction character(3) DEFAULT 'OUT'::bpchar,
    response_type character(4) DEFAULT 'POST'::bpchar,
    response_hash bigint DEFAULT '-1'::bigint,
    response_json character(120) DEFAULT '_'::bpchar,
    response_time time without time zone,
    response_date date,
    is_successfully_processed boolean DEFAULT false
);


ALTER TABLE public.response_log OWNER TO postgres;

--
-- TOC entry 482 (class 1259 OID 87034)
-- Name: response_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.response_log ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.response_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 320 (class 1259 OID 36080)
-- Name: sales_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_inventory (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_sys_id bigint NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(60) DEFAULT '-'::bpchar NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    item_code character(5) DEFAULT '-'::bpchar NOT NULL,
    item_name character(60) DEFAULT '-'::bpchar NOT NULL,
    available_units bigint DEFAULT 0 NOT NULL,
    cost_price numeric(15,2) DEFAULT 0.00,
    sales_price numeric(15,2) DEFAULT 0.00,
    ency_cost_price character(60) DEFAULT '-'::bpchar NOT NULL,
    encry_sales_price character(60) DEFAULT '-'::bpchar NOT NULL,
    purchases_this_week bigint DEFAULT 0 NOT NULL,
    sales_this_week bigint DEFAULT 0 NOT NULL,
    purchases_this_month bigint DEFAULT 0 NOT NULL,
    sales_this_month bigint DEFAULT 0 NOT NULL,
    purchases_ytd bigint DEFAULT 0 NOT NULL,
    sales_ytd bigint DEFAULT 0 NOT NULL,
    margin numeric(15,2) DEFAULT 0.00,
    encry_margin character(60) DEFAULT '-'::bpchar NOT NULL,
    last_purchase_date date NOT NULL,
    last_purchase_time timestamp without time zone NOT NULL,
    last_sales_date date NOT NULL,
    last_sales_time timestamp without time zone NOT NULL
);


ALTER TABLE public.sales_inventory OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 36077)
-- Name: sales_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 8883 (class 0 OID 0)
-- Dependencies: 317
-- Name: sales_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_inventory_id_seq OWNED BY public.sales_inventory.id;


--
-- TOC entry 319 (class 1259 OID 36079)
-- Name: sales_inventory_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_inventory_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_inventory_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8884 (class 0 OID 0)
-- Dependencies: 319
-- Name: sales_inventory_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_inventory_profile_sys_id_seq OWNED BY public.sales_inventory.profile_sys_id;


--
-- TOC entry 318 (class 1259 OID 36078)
-- Name: sales_inventory_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_inventory_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_inventory_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8885 (class 0 OID 0)
-- Dependencies: 318
-- Name: sales_inventory_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_inventory_user_sys_id_seq OWNED BY public.sales_inventory.user_sys_id;


--
-- TOC entry 324 (class 1259 OID 36110)
-- Name: sales_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_items (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_sys_id bigint NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(60) DEFAULT '-'::bpchar NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    item_code character(5) DEFAULT '-'::bpchar NOT NULL,
    item_name character(60) DEFAULT '-'::bpchar NOT NULL,
    item_description character(60) DEFAULT '-'::bpchar NOT NULL,
    supplier_code character(10) DEFAULT '-'::bpchar NOT NULL,
    supplier_phone character(30) DEFAULT '-'::bpchar NOT NULL,
    supplier_email character(30) DEFAULT '-'::bpchar NOT NULL,
    supplier_whatsapp character(30) DEFAULT '-'::bpchar NOT NULL,
    last_purchase_price numeric(15,2) DEFAULT 0.00,
    ency_last_purchase_price character(60) DEFAULT '-'::bpchar NOT NULL,
    last_markup numeric(15,2) DEFAULT 0.00,
    last_purchase_date date NOT NULL,
    last_purchase_time timestamp without time zone NOT NULL,
    last_sales_date date NOT NULL,
    last_sales_time timestamp without time zone NOT NULL
);


ALTER TABLE public.sales_items OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 36107)
-- Name: sales_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_items_id_seq OWNER TO postgres;

--
-- TOC entry 8886 (class 0 OID 0)
-- Dependencies: 321
-- Name: sales_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_items_id_seq OWNED BY public.sales_items.id;


--
-- TOC entry 323 (class 1259 OID 36109)
-- Name: sales_items_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_items_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_items_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8887 (class 0 OID 0)
-- Dependencies: 323
-- Name: sales_items_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_items_profile_sys_id_seq OWNED BY public.sales_items.profile_sys_id;


--
-- TOC entry 322 (class 1259 OID 36108)
-- Name: sales_items_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_items_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_items_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8888 (class 0 OID 0)
-- Dependencies: 322
-- Name: sales_items_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_items_user_sys_id_seq OWNED BY public.sales_items.user_sys_id;


--
-- TOC entry 266 (class 1259 OID 34225)
-- Name: scheme_promotion_recycle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scheme_promotion_recycle (
    id bigint NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    reward_amount numeric(15,2) DEFAULT 0.00 NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    target_trxn_count bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.scheme_promotion_recycle OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 34189)
-- Name: scheme_promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scheme_promotions (
    id bigint NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    reward_amount numeric(15,2) DEFAULT 0.00 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    target_trxn_count bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.scheme_promotions OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 34200)
-- Name: scheme_recycle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scheme_recycle (
    id integer NOT NULL,
    scheme_name character(70) DEFAULT '-'::bpchar,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    use_scheme_key boolean DEFAULT false NOT NULL,
    pool_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    pool_account_number character(15) DEFAULT '-'::bpchar NOT NULL,
    pool_account_balance character(60) DEFAULT '-'::bpchar NOT NULL,
    pool_account_balance_plain numeric(15,2) DEFAULT 0.00,
    scheme_encry_key character(60) DEFAULT '-'::bpchar NOT NULL,
    last_trxn_bank_posting_date date,
    last_trxn_bank_posting_time timestamp without time zone,
    scheme_create_date date,
    api_key character(60) DEFAULT '-'::bpchar NOT NULL,
    secret_key character(60) DEFAULT '-'::bpchar NOT NULL,
    callback_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    promotions integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.scheme_recycle OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 34199)
-- Name: scheme_recycle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scheme_recycle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scheme_recycle_id_seq OWNER TO postgres;

--
-- TOC entry 8889 (class 0 OID 0)
-- Dependencies: 264
-- Name: scheme_recycle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scheme_recycle_id_seq OWNED BY public.scheme_recycle.id;


--
-- TOC entry 230 (class 1259 OID 20379)
-- Name: schemes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schemes (
    id integer NOT NULL,
    scheme_name character(70) DEFAULT '-'::bpchar,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    use_scheme_key boolean DEFAULT false NOT NULL,
    pool_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    pool_account_number character(15) DEFAULT '-'::bpchar NOT NULL,
    pool_account_balance character(60) DEFAULT '-'::bpchar NOT NULL,
    pool_account_balance_plain numeric(15,2) DEFAULT 0.00,
    scheme_encry_key character(60) DEFAULT '-'::bpchar NOT NULL,
    last_trxn_bank_posting_date date,
    last_trxn_bank_posting_time timestamp without time zone,
    scheme_create_date date,
    api_key character(60) DEFAULT '-'::bpchar NOT NULL,
    secret_key character(60) DEFAULT '-'::bpchar NOT NULL,
    callback_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    promotions integer DEFAULT 0 NOT NULL,
    make_scheme_incur_customer_charges boolean DEFAULT false NOT NULL
);


ALTER TABLE public.schemes OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 20378)
-- Name: schemes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schemes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schemes_id_seq OWNER TO postgres;

--
-- TOC entry 8890 (class 0 OID 0)
-- Dependencies: 229
-- Name: schemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schemes_id_seq OWNED BY public.schemes.id;


--
-- TOC entry 234 (class 1259 OID 22319)
-- Name: service_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_channels (
    id integer NOT NULL,
    channel_id character(5) DEFAULT '-'::bpchar,
    channel_code character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    channel_name character(80) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.service_channels OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 22318)
-- Name: service_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_channels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_channels_id_seq OWNER TO postgres;

--
-- TOC entry 8891 (class 0 OID 0)
-- Dependencies: 233
-- Name: service_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_channels_id_seq OWNED BY public.service_channels.id;


--
-- TOC entry 216 (class 1259 OID 16792)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    service_reference character(20),
    service_name character(30),
    description character(150),
    status character(1) DEFAULT 'I'::bpchar
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16796)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 8892 (class 0 OID 0)
-- Dependencies: 217
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 373 (class 1259 OID 37865)
-- Name: super_agent_profile_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_profile_details (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    middle_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    city character(50) DEFAULT '-'::bpchar NOT NULL,
    state character(50) DEFAULT '-'::bpchar NOT NULL,
    country character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    email_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    email_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    loc_longitude bigint DEFAULT '-1'::integer NOT NULL,
    loc_latitude bigint DEFAULT '-1'::integer NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.super_agent_profile_details OWNER TO postgres;

--
-- TOC entry 372 (class 1259 OID 37864)
-- Name: super_agent_profile_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_profile_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_profile_details_id_seq OWNER TO postgres;

--
-- TOC entry 8893 (class 0 OID 0)
-- Dependencies: 372
-- Name: super_agent_profile_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_profile_details_id_seq OWNED BY public.super_agent_profile_details.id;


--
-- TOC entry 238 (class 1259 OID 23998)
-- Name: super_agent_profile_details_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_profile_details_model (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    mail_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mail_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.super_agent_profile_details_model OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 23997)
-- Name: super_agent_profile_details_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_profile_details_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_profile_details_model_id_seq OWNER TO postgres;

--
-- TOC entry 8894 (class 0 OID 0)
-- Dependencies: 237
-- Name: super_agent_profile_details_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_profile_details_model_id_seq OWNED BY public.super_agent_profile_details_model.id;


--
-- TOC entry 357 (class 1259 OID 37320)
-- Name: super_agent_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_profiles (
    id bigint NOT NULL,
    user_sys_id bigint NOT NULL,
    profile_detail_sys_id bigint NOT NULL,
    profile_id character(150) DEFAULT '-'::bpchar NOT NULL,
    profile_type_code character(12) DEFAULT '-'::bpchar NOT NULL,
    customer_no bigint DEFAULT 0 NOT NULL,
    mobile_number character(50) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    red_flaged boolean DEFAULT false,
    kyc_trxn_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    kyc_daily_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    consecutive_pin_retries smallint DEFAULT 0 NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar
);


ALTER TABLE public.super_agent_profiles OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 37317)
-- Name: super_agent_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 8895 (class 0 OID 0)
-- Dependencies: 354
-- Name: super_agent_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_profiles_id_seq OWNED BY public.super_agent_profiles.id;


--
-- TOC entry 356 (class 1259 OID 37319)
-- Name: super_agent_profiles_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_profiles_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_profiles_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8896 (class 0 OID 0)
-- Dependencies: 356
-- Name: super_agent_profiles_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_profiles_profile_sys_id_seq OWNED BY public.super_agent_profiles.profile_detail_sys_id;


--
-- TOC entry 355 (class 1259 OID 37318)
-- Name: super_agent_profiles_user_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_profiles_user_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_profiles_user_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8897 (class 0 OID 0)
-- Dependencies: 355
-- Name: super_agent_profiles_user_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_profiles_user_sys_id_seq OWNED BY public.super_agent_profiles.user_sys_id;


--
-- TOC entry 491 (class 1259 OID 87800)
-- Name: super_agent_swift_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_swift_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    book_balance character(130) DEFAULT '-'::bpchar,
    book_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    customer_ref character(30) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    available_balance character(130) DEFAULT '-'::bpchar,
    available_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pocket_wallet_balance character(130) DEFAULT '-'::bpchar,
    pocket_wallet_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    hold_amount_balance character(130) DEFAULT '-'::bpchar,
    hold_amount_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    transit_trxn_balance character(130) DEFAULT '-'::bpchar,
    transit_trxn_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(130) DEFAULT '-'::bpchar,
    overdraft_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_debit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_credit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.super_agent_swift_wallets OWNER TO postgres;

--
-- TOC entry 403 (class 1259 OID 46769)
-- Name: super_agent_user_device_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_user_device_sessions (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    request_partner_code character(20) DEFAULT '-'::bpchar,
    request_app_code character(8) DEFAULT '-'::bpchar,
    request_user_id bigint,
    request_user_type character(14) DEFAULT '-'::bpchar NOT NULL,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    profile_sys_id bigint,
    customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    ext_customer_ref character(25) DEFAULT '-'::bpchar NOT NULL,
    is_user_profile_active boolean DEFAULT false NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    request_channel_id character(20) DEFAULT '-'::bpchar NOT NULL,
    request_channel character(8) DEFAULT '-'::bpchar NOT NULL,
    device_type character(15) DEFAULT '-'::bpchar NOT NULL,
    device_os character(10) DEFAULT '-'::bpchar NOT NULL,
    device_name character(30) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT false NOT NULL,
    era_id bigint DEFAULT '-1'::integer NOT NULL,
    consecutive_login_retries smallint DEFAULT 0 NOT NULL,
    last_app_request_key character(50) DEFAULT '-'::bpchar NOT NULL,
    device_id character(50) DEFAULT '-'::bpchar NOT NULL,
    notification_token character(20) DEFAULT '-'::bpchar NOT NULL,
    last_login_date timestamp without time zone NOT NULL,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.super_agent_user_device_sessions OWNER TO postgres;

--
-- TOC entry 402 (class 1259 OID 46768)
-- Name: super_agent_user_device_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_user_device_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_user_device_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 8898 (class 0 OID 0)
-- Dependencies: 402
-- Name: super_agent_user_device_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_user_device_sessions_id_seq OWNED BY public.super_agent_user_device_sessions.id;


--
-- TOC entry 247 (class 1259 OID 24348)
-- Name: super_agent_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_users (
    id bigint NOT NULL,
    profile_detail_id bigint NOT NULL,
    username character(42) DEFAULT '-'::bpchar NOT NULL,
    user_password character(150) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    image_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true,
    red_flagged boolean DEFAULT false,
    lang_key character(12) DEFAULT '-'::bpchar NOT NULL,
    activation_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_date timestamp without time zone,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    single_sign_on boolean DEFAULT false,
    status character(12) DEFAULT '-'::bpchar NOT NULL,
    login_count smallint DEFAULT 0 NOT NULL,
    pin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operator character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operand character(60) DEFAULT '-'::bpchar NOT NULL,
    default_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    current_session_scheme_code character(12) DEFAULT '-'::bpchar NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(60) DEFAULT '00'::bpchar,
    customer_no bigint DEFAULT 0 NOT NULL,
    authourization_dpin_operand bigint DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.super_agent_users OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 24346)
-- Name: super_agent_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_users_id_seq OWNER TO postgres;

--
-- TOC entry 8899 (class 0 OID 0)
-- Dependencies: 245
-- Name: super_agent_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_users_id_seq OWNED BY public.super_agent_users.id;


--
-- TOC entry 244 (class 1259 OID 24296)
-- Name: super_agent_users_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_users_model (
    id bigint NOT NULL,
    profile_sys_id bigint NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    username character(42) DEFAULT '-'::bpchar NOT NULL,
    user_password character(150) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    image_url character(60) DEFAULT '-'::bpchar NOT NULL,
    is_active boolean DEFAULT true,
    red_flag boolean DEFAULT false,
    lang_key character(12) DEFAULT '-'::bpchar NOT NULL,
    activation_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_key character(30) DEFAULT '-'::bpchar NOT NULL,
    reset_date timestamp without time zone,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    default_encry_key character(42) DEFAULT '-'::bpchar NOT NULL,
    key_program_control character(7) DEFAULT 'default'::bpchar NOT NULL,
    encypted_last_key character(42) DEFAULT 'default'::bpchar NOT NULL,
    single_sign_on boolean DEFAULT false,
    status character(12) DEFAULT '-'::bpchar NOT NULL,
    login_count bigint DEFAULT 0 NOT NULL,
    login_retries bigint DEFAULT 0 NOT NULL,
    pin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operator character(60) DEFAULT '-'::bpchar NOT NULL,
    dpin_operand character(60) DEFAULT '-'::bpchar NOT NULL,
    default_scheme_id character(12) DEFAULT '-'::bpchar NOT NULL,
    selected_scheme_id character(12) DEFAULT '-'::bpchar NOT NULL,
    kyc_trxn_limit character(60) DEFAULT '-'::bpchar,
    kyc_daily_limit character(60) DEFAULT '-'::bpchar,
    consecutive_login_retries bigint DEFAULT 0 NOT NULL,
    consecutive_pin_use_retries bigint DEFAULT 0 NOT NULL,
    deactivate_code character(2) DEFAULT '00'::bpchar,
    deactivate_reason character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.super_agent_users_model OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 24294)
-- Name: super_agent_users_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_users_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_users_model_id_seq OWNER TO postgres;

--
-- TOC entry 8900 (class 0 OID 0)
-- Dependencies: 242
-- Name: super_agent_users_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_users_model_id_seq OWNED BY public.super_agent_users_model.id;


--
-- TOC entry 243 (class 1259 OID 24295)
-- Name: super_agent_users_model_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_users_model_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_users_model_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8901 (class 0 OID 0)
-- Dependencies: 243
-- Name: super_agent_users_model_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_users_model_profile_sys_id_seq OWNED BY public.super_agent_users_model.profile_sys_id;


--
-- TOC entry 246 (class 1259 OID 24347)
-- Name: super_agent_users_profile_sys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_agent_users_profile_sys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_agent_users_profile_sys_id_seq OWNER TO postgres;

--
-- TOC entry 8902 (class 0 OID 0)
-- Dependencies: 246
-- Name: super_agent_users_profile_sys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_agent_users_profile_sys_id_seq OWNED BY public.super_agent_users.profile_detail_id;


--
-- TOC entry 486 (class 1259 OID 87765)
-- Name: super_agent_wallet_instance_refs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_wallet_instance_refs (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    reference_count bigint DEFAULT '-1'::integer NOT NULL,
    update_test_field character(1) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.super_agent_wallet_instance_refs OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 36880)
-- Name: super_agent_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_agent_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    current_balance character(60) DEFAULT '-'::bpchar,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    wallet_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_balance character(60) DEFAULT '-'::bpchar,
    hold_amount_balance character(60) DEFAULT '-'::bpchar,
    transit_trxn_balance character(60) DEFAULT '-'::bpchar,
    pocket_wallet_reversal_bal character(60) DEFAULT '-'::bpchar,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(60) DEFAULT '-'::bpchar,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.super_agent_wallets OWNER TO postgres;

--
-- TOC entry 493 (class 1259 OID 87940)
-- Name: super_customer_swift_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_customer_swift_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    book_balance character(130) DEFAULT '-'::bpchar,
    book_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    date_opened date NOT NULL,
    customer_no bigint DEFAULT '-1'::integer NOT NULL,
    customer_ref character(30) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    scheme_code character(20) DEFAULT '-'::bpchar NOT NULL,
    wallet_account_type_id integer DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar,
    wallet_name character(60) DEFAULT '.jpg'::bpchar NOT NULL,
    last_modified_date date,
    status character(1) DEFAULT 'I'::bpchar,
    parent_id bigint DEFAULT '-1'::integer NOT NULL,
    virtual_nuban character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_bank_code character(40) DEFAULT '-'::bpchar NOT NULL,
    nuban_account_no character(40) DEFAULT '-'::bpchar NOT NULL,
    tracking_ref character(40) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(60) DEFAULT '056'::bpchar,
    available_balance character(130) DEFAULT '-'::bpchar,
    available_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pocket_wallet_balance character(130) DEFAULT '-'::bpchar,
    pocket_wallet_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    hold_amount_balance character(130) DEFAULT '-'::bpchar,
    hold_amount_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    transit_trxn_balance character(130) DEFAULT '-'::bpchar,
    transit_trxn_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    wallet_limit character(60) DEFAULT '-'::bpchar,
    sys_acct_lock character(1) DEFAULT 'N'::bpchar,
    overdraft_balance character(130) DEFAULT '-'::bpchar,
    overdraft_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    pending_debit_count bigint DEFAULT 0 NOT NULL,
    pending_credit_count bigint DEFAULT 0 NOT NULL,
    debit_count bigint DEFAULT 0 NOT NULL,
    credit_count bigint DEFAULT 0 NOT NULL,
    daily_cummulative_debit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_debit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    daily_cummulative_credit character(130) DEFAULT '-'::bpchar,
    daily_cummulative_credit_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    last_credit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_serial character(60) DEFAULT '-'::bpchar,
    last_debit_trxn_date date,
    last_credit_trxn_date date,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.super_customer_swift_wallets OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 20338)
-- Name: sys_app_key_era; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_app_key_era (
    id integer NOT NULL,
    system_key character(50) DEFAULT '-'::bpchar NOT NULL,
    app_key character(50) DEFAULT '-'::bpchar NOT NULL,
    era_name character(50) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.sys_app_key_era OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20337)
-- Name: sys_app_key_era_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_app_key_era_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_app_key_era_id_seq OWNER TO postgres;

--
-- TOC entry 8903 (class 0 OID 0)
-- Dependencies: 227
-- Name: sys_app_key_era_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_app_key_era_id_seq OWNED BY public.sys_app_key_era.id;


--
-- TOC entry 223 (class 1259 OID 19376)
-- Name: sys_key_store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_key_store (
    id bigint DEFAULT '-1'::integer NOT NULL,
    key_name character(15) DEFAULT '-'::bpchar NOT NULL,
    key_value character(20) DEFAULT '-'::bpchar NOT NULL,
    description character(50) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.sys_key_store OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 24917)
-- Name: system_boundary_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_boundary_log (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    request_id character(15) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(3) DEFAULT '-'::bpchar NOT NULL,
    is_active_session boolean DEFAULT true NOT NULL,
    channel_id character(5) DEFAULT '-'::bpchar NOT NULL,
    request_in boolean DEFAULT true,
    request_in_json character(100) DEFAULT '-'::bpchar NOT NULL,
    log_session_id bigint DEFAULT 0 NOT NULL,
    time_of_request timestamp without time zone,
    request_date date,
    user_action character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    response_out boolean DEFAULT false,
    external_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    response_out_json character(200) DEFAULT '-'::bpchar NOT NULL,
    reponse_time time without time zone,
    response_date date
);


ALTER TABLE public.system_boundary_log OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 24916)
-- Name: system_boundary_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_boundary_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_boundary_log_id_seq OWNER TO postgres;

--
-- TOC entry 8904 (class 0 OID 0)
-- Dependencies: 259
-- Name: system_boundary_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_boundary_log_id_seq OWNED BY public.system_boundary_log.id;


--
-- TOC entry 262 (class 1259 OID 25686)
-- Name: system_log_summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_log_summary (
    id bigint NOT NULL,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    unique_cust_id character(14) DEFAULT '-'::bpchar NOT NULL,
    request_id character(15) DEFAULT '-'::bpchar NOT NULL,
    request_date date,
    time_of_request timestamp without time zone,
    scheme_code character(5) DEFAULT '-'::bpchar NOT NULL,
    is_request_in boolean DEFAULT true,
    is_active_session boolean DEFAULT true NOT NULL,
    channel_id character(5) DEFAULT '-'::bpchar NOT NULL,
    user_action character(20) DEFAULT '-'::bpchar NOT NULL,
    rqst_op_code character(20) DEFAULT '-'::bpchar NOT NULL,
    rqst_op_status character(2) DEFAULT '99'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    error_msg character(30) DEFAULT '-'::bpchar NOT NULL,
    external_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    bearer_token character(20) DEFAULT '-'::bpchar NOT NULL,
    is_response_out boolean DEFAULT false,
    log_session_id bigint DEFAULT 0 NOT NULL,
    response_date date,
    reponse_time time without time zone
);


ALTER TABLE public.system_log_summary OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 25685)
-- Name: system_log_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_log_summary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_log_summary_id_seq OWNER TO postgres;

--
-- TOC entry 8905 (class 0 OID 0)
-- Dependencies: 261
-- Name: system_log_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_log_summary_id_seq OWNED BY public.system_log_summary.id;


--
-- TOC entry 484 (class 1259 OID 87485)
-- Name: test_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test_wallets (
    id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_no character(20) DEFAULT '-'::bpchar NOT NULL,
    current_balance character(160) DEFAULT '-'::bpchar,
    current_balance_plain numeric(15,2) DEFAULT 0.00 NOT NULL,
    sys_acct_lock_code character(2) DEFAULT '00'::bpchar
);


ALTER TABLE public.test_wallets OWNER TO postgres;

--
-- TOC entry 439 (class 1259 OID 73381)
-- Name: transaction_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_history (
    id bigint NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    scheme_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    sender_name character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_name character(40) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    reciever_account character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    total_trxn_amount numeric(15,2) DEFAULT 0.00,
    trxn_value_amount numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_amount numeric(15,2) DEFAULT 0.00,
    trxn_process_code integer DEFAULT '-1'::integer NOT NULL,
    trxn_status_code character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_status character(20) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash character(12) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash character(12) DEFAULT '-'::bpchar NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash character(12) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    is_finalized boolean DEFAULT false,
    update_check bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.transaction_history OWNER TO postgres;

--
-- TOC entry 438 (class 1259 OID 73380)
-- Name: transaction_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transaction_history ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transaction_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 437 (class 1259 OID 72639)
-- Name: transaction_register; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_register (
    id integer NOT NULL,
    wallet_id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_number character(15) DEFAULT '-'::bpchar NOT NULL,
    customer_reference character(60) DEFAULT '-'::bpchar NOT NULL,
    current_column_ref integer DEFAULT 0 NOT NULL,
    trxn_date_0 date,
    trxn_time_0 time without time zone,
    trxn_post_type_0 character(2) DEFAULT 'dr'::bpchar NOT NULL,
    trxn_post_function_0 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_0 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_0 numeric(15,2) DEFAULT 0.00,
    auth_user_id_0 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_0 character(20) DEFAULT 'dr'::bpchar NOT NULL,
    reciever_bank_type_0 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_0 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_0 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_1 date,
    trxn_time_1 time without time zone,
    trxn_post_type_1 character(2) DEFAULT 'dr'::bpchar NOT NULL,
    trxn_post_function_1 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_1 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_1 numeric(15,2) DEFAULT 0.00,
    auth_user_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_1 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_1 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_1 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_1 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_1 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_2 date,
    trxn_time_2 time without time zone,
    trxn_post_type_2 character(2) DEFAULT 'dr'::bpchar NOT NULL,
    trxn_post_function_2 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_2 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_2 numeric(15,2) DEFAULT 0.00,
    auth_user_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_2 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_2 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_2 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_2 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_2 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_3 date,
    trxn_time_3 time without time zone,
    trxn_post_type_3 character(2) DEFAULT 'dr'::bpchar NOT NULL,
    trxn_post_function_3 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_3 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_3 numeric(15,2) DEFAULT 0.00,
    auth_user_id_3 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_3 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_3 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_3 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_3 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_3 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_4 date,
    trxn_time_4 time without time zone,
    trxn_post_type_4 character(2) DEFAULT 'dr'::bpchar NOT NULL,
    trxn_post_function_4 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_4 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_4 numeric(15,2) DEFAULT 0.00,
    auth_user_id_4 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_4 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_4 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_4 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_4 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_4 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_5 date,
    trxn_time_5 time without time zone,
    trxn_post_type_5 character(2) DEFAULT 'dr'::bpchar NOT NULL,
    trxn_post_function_5 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_5 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_5 numeric(15,2) DEFAULT 0.00,
    auth_user_id_5 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_5 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_5 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_5 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_5 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_5 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_6 date,
    trxn_time_6 time without time zone,
    trxn_post_type_6 character(2) DEFAULT '-'::bpchar NOT NULL,
    trxn_post_function_6 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_6 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_6 numeric(15,2) DEFAULT 0.00,
    auth_user_id_6 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_6 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_6 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_6 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_6 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_6 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_7 date,
    trxn_time_7 time without time zone,
    trxn_post_type_7 character(2) DEFAULT 'dr'::bpchar NOT NULL,
    trxn_post_function_7 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_7 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_7 numeric(15,2) DEFAULT 0.00,
    auth_user_id_7 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_7 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_7 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_7 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_7 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_7 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_8 date,
    trxn_time_8 time without time zone,
    trxn_post_type_8 character(2) DEFAULT '-'::bpchar NOT NULL,
    trxn_post_function_8 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_8 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_8 numeric(15,2) DEFAULT 0.00,
    auth_user_id_8 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_8 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_8 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_8 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_8 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_8 character(3) DEFAULT '-'::bpchar NOT NULL,
    trxn_date_9 date,
    trxn_time_9 time without time zone,
    trxn_post_type_9 character(2) DEFAULT '-'::bpchar NOT NULL,
    trxn_post_function_9 character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_amount_9 numeric(15,2) DEFAULT 0.00,
    total_trxn_fee_9 numeric(15,2) DEFAULT 0.00,
    auth_user_id_9 bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash_9 character(10) DEFAULT '-'::bpchar NOT NULL,
    auth_factor_2_key_hash_9 character(10) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_type_9 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_accnt_num_9 character(15) DEFAULT '-'::bpchar NOT NULL,
    reciever_bank_code_9 character(3) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.transaction_register OWNER TO postgres;

--
-- TOC entry 436 (class 1259 OID 72638)
-- Name: transaction_register_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transaction_register ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transaction_register_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 268 (class 1259 OID 34372)
-- Name: trxn_bands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trxn_bands (
    id bigint DEFAULT '-1'::integer NOT NULL,
    default_trxn_band boolean DEFAULT true NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    scheme_code character(12),
    trxn_band_code character(12),
    applicable_trxn_type character(20) DEFAULT 'wallettowallet'::bpchar NOT NULL,
    lower_limit numeric(15,2) DEFAULT 0.00 NOT NULL,
    upper_limit numeric(15,2) DEFAULT 5000.00 NOT NULL
);


ALTER TABLE public.trxn_bands OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 24741)
-- Name: u_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.u_p (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT 0 NOT NULL,
    login_retries bigint DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true
);


ALTER TABLE public.u_p OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 24740)
-- Name: u_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.u_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.u_p_id_seq OWNER TO postgres;

--
-- TOC entry 8906 (class 0 OID 0)
-- Dependencies: 251
-- Name: u_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.u_p_id_seq OWNED BY public.u_p.id;


--
-- TOC entry 254 (class 1259 OID 24751)
-- Name: u_s; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.u_s (
    id bigint NOT NULL,
    username character(20) DEFAULT '-'::bpchar
);


ALTER TABLE public.u_s OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 24750)
-- Name: u_s_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.u_s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.u_s_id_seq OWNER TO postgres;

--
-- TOC entry 8907 (class 0 OID 0)
-- Dependencies: 253
-- Name: u_s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.u_s_id_seq OWNED BY public.u_s.id;


--
-- TOC entry 256 (class 1259 OID 24780)
-- Name: unique_bearer_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unique_bearer_tokens (
    id bigint NOT NULL,
    unique_bearer_token character(20) DEFAULT '-'::bpchar,
    currently_in_use boolean DEFAULT false NOT NULL,
    expired boolean DEFAULT false NOT NULL
);


ALTER TABLE public.unique_bearer_tokens OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 24779)
-- Name: unique_bearer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unique_bearer_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unique_bearer_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 8908 (class 0 OID 0)
-- Dependencies: 255
-- Name: unique_bearer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unique_bearer_tokens_id_seq OWNED BY public.unique_bearer_tokens.id;


--
-- TOC entry 258 (class 1259 OID 24816)
-- Name: unique_customer_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unique_customer_keys (
    id bigint NOT NULL,
    unique_cust_id character(10) DEFAULT '-'::bpchar,
    unique_customer_id character(15) DEFAULT '-'::bpchar,
    assigned_to_profile boolean DEFAULT false NOT NULL
);


ALTER TABLE public.unique_customer_keys OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 24815)
-- Name: unique_customer_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unique_customer_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unique_customer_keys_id_seq OWNER TO postgres;

--
-- TOC entry 8909 (class 0 OID 0)
-- Dependencies: 257
-- Name: unique_customer_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unique_customer_keys_id_seq OWNED BY public.unique_customer_keys.id;


--
-- TOC entry 222 (class 1259 OID 19108)
-- Name: user_deactivation_defn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_deactivation_defn (
    id bigint DEFAULT '-1'::integer NOT NULL,
    deactivate_code character(2) DEFAULT '-'::bpchar NOT NULL,
    deactivate_reason character(120) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.user_deactivation_defn OWNER TO postgres;

--
-- TOC entry 365 (class 1259 OID 37657)
-- Name: user_profile_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profile_details (
    id bigint NOT NULL,
    user_sys_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_id character(60) DEFAULT '-'::bpchar NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    middle_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(60) DEFAULT '-'::bpchar NOT NULL,
    email character(60) DEFAULT '-'::bpchar NOT NULL,
    primary_mobile character(14) DEFAULT '-'::bpchar NOT NULL,
    mobile_numbers character(50) DEFAULT '-'::bpchar NOT NULL,
    red_flag boolean DEFAULT false NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    date_of_birth date,
    address character(50) DEFAULT '-'::bpchar NOT NULL,
    city character(50) DEFAULT '-'::bpchar NOT NULL,
    state character(50) DEFAULT '-'::bpchar NOT NULL,
    country character(50) DEFAULT '-'::bpchar NOT NULL,
    photo_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    photo_content_type character(4) DEFAULT '.jpg'::bpchar NOT NULL,
    bvn character(15) DEFAULT '-'::bpchar NOT NULL,
    valid_id_ref bigint DEFAULT '-1'::integer NOT NULL,
    user_id bigint DEFAULT '-1'::integer NOT NULL,
    primary_profile_type_id bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_1 bigint DEFAULT '-1'::integer NOT NULL,
    profile_type_id_2 bigint DEFAULT '-1'::integer NOT NULL,
    kyc_id bigint DEFAULT '-1'::integer NOT NULL,
    device_notification_token character(35) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    mobile_otp_timeout bigint DEFAULT 0 NOT NULL,
    email_otp character(6) DEFAULT '-'::bpchar NOT NULL,
    email_otp_timeout bigint DEFAULT 0 NOT NULL,
    created_by character(30) DEFAULT '-'::bpchar NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character(30) DEFAULT '-'::bpchar NOT NULL,
    last_modified_date timestamp without time zone,
    approval_group_id bigint DEFAULT '-1'::integer NOT NULL,
    security_question character(40) DEFAULT '-'::bpchar NOT NULL,
    security_answer character(20) DEFAULT '-'::bpchar NOT NULL,
    loc_longitude bigint DEFAULT '-1'::integer NOT NULL,
    loc_latitude bigint DEFAULT '-1'::integer NOT NULL,
    awarded_bonus numeric(15,2) DEFAULT 0.00,
    computed_bonus numeric(15,2) DEFAULT 0.00,
    actual_bonus numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.user_profile_details OWNER TO postgres;

--
-- TOC entry 364 (class 1259 OID 37656)
-- Name: user_profile_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_profile_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profile_details_id_seq OWNER TO postgres;

--
-- TOC entry 8910 (class 0 OID 0)
-- Dependencies: 364
-- Name: user_profile_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_profile_details_id_seq OWNED BY public.user_profile_details.id;


--
-- TOC entry 502 (class 1259 OID 96855)
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
-- TOC entry 239 (class 1259 OID 24135)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 8911 (class 0 OID 0)
-- Dependencies: 239
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 221 (class 1259 OID 19102)
-- Name: wallet_acct_lock_defn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_acct_lock_defn (
    id bigint DEFAULT '-1'::integer NOT NULL,
    lock_code character(2) DEFAULT '-'::bpchar NOT NULL,
    lock_reason character(120) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.wallet_acct_lock_defn OWNER TO postgres;

--
-- TOC entry 477 (class 1259 OID 86732)
-- Name: wallet_debit_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_debit_history (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
    processor_node_name character(15) DEFAULT '-'::bpchar NOT NULL,
    processor_node_ip character(12) DEFAULT '-'::bpchar NOT NULL,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    trxn_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_reference character(20) DEFAULT '-'::bpchar NOT NULL,
    processor_auth_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    trxn_event character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_type character(20) DEFAULT '-'::bpchar NOT NULL,
    trxn_mode character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_name character(20) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_code character(4) DEFAULT '-'::bpchar NOT NULL,
    debit_currency_symbol character(1) DEFAULT '-'::bpchar NOT NULL,
    trxn_start_time time without time zone,
    trxn_start_date date,
    trxn_end_time time without time zone,
    trxn_end_date date,
    currency_exchange_log_reference_id bigint DEFAULT '-1'::integer NOT NULL,
    currency_exchange_rate numeric(15,2) DEFAULT 0.00,
    debit_amount numeric(15,2) DEFAULT 0.00,
    total_debit_fee_amount numeric(15,2) DEFAULT 0.00,
    total_debit_amount numeric(15,2) DEFAULT 0.00,
    sender_scheme_code character(20) DEFAULT '-'::bpchar,
    sender_profile_type_code character(5) DEFAULT '-'::bpchar,
    sender_customer_reference character(20) DEFAULT '-'::bpchar,
    sender_name character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet character(40) DEFAULT '-'::bpchar NOT NULL,
    sender_bank_code character(3) DEFAULT '-'::bpchar NOT NULL,
    sender_wallet_name character(15) DEFAULT '-'::bpchar NOT NULL,
    sender_bank character(30) DEFAULT '-'::bpchar NOT NULL,
    auth_user_id bigint DEFAULT '-1'::integer NOT NULL,
    auth_factor_1_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    auth_factor_2_key_hash bigint DEFAULT '-1'::bigint NOT NULL,
    service_provider character(30) DEFAULT '-'::bpchar NOT NULL,
    service_beneficicary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_encrypt character(30) DEFAULT '-'::bpchar NOT NULL,
    purchase_token_hash bigint DEFAULT '-1'::bigint NOT NULL,
    product_provider_customer_name character(30) DEFAULT '-'::bpchar NOT NULL,
    product_provider_customer_address character(40) DEFAULT '-'::bpchar NOT NULL,
    trxn_detail character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(30) DEFAULT '-'::bpchar NOT NULL,
    trxn_comment character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.wallet_debit_history OWNER TO postgres;

--
-- TOC entry 476 (class 1259 OID 86731)
-- Name: wallet_debit_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wallet_debit_history ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wallet_debit_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 411 (class 1259 OID 55112)
-- Name: wallet_register; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_register (
    id integer NOT NULL,
    wallet_id bigint DEFAULT '-1'::integer NOT NULL,
    wallet_accnt_number character(15) DEFAULT '-'::bpchar NOT NULL,
    customer_reference character(60) DEFAULT '-'::bpchar NOT NULL,
    current_column_ref integer DEFAULT 0 NOT NULL,
    balance_0_change_date date,
    balance_0_change_time time without time zone,
    balance_0 numeric(15,2) DEFAULT 0.00,
    balance_1_change_date date,
    balance_1_change_time time without time zone,
    balance_1 numeric(15,2) DEFAULT 0.00,
    balance_2_change_date date,
    balance_2_change_time time without time zone,
    balance_2 numeric(15,2) DEFAULT 0.00,
    balance_3_change_date date,
    balance_3_change_time time without time zone,
    balance_3 numeric(15,2) DEFAULT 0.00,
    balance_4_change_date date,
    balance_4_change_time time without time zone,
    balance_4 numeric(15,2) DEFAULT 0.00,
    balance_5_change_date date,
    balance_5_change_time time without time zone,
    balance_5 numeric(15,2) DEFAULT 0.00,
    balance_6_change_date date,
    balance_6_change_time time without time zone,
    balance_6 numeric(15,2) DEFAULT 0.00,
    balance_7_change_date date,
    balance_7_change_time time without time zone,
    balance_7 numeric(15,2) DEFAULT 0.00,
    balance_8_change_date date,
    balance_8_change_time time without time zone,
    balance_8 numeric(15,2) DEFAULT 0.00,
    balance_9_change_date date,
    balance_9_change_time time without time zone,
    balance_9 numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.wallet_register OWNER TO postgres;

--
-- TOC entry 410 (class 1259 OID 55111)
-- Name: wallet_register_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wallet_register ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wallet_register_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 293 (class 1259 OID 35231)
-- Name: wallet_to_bank_trxn_log_0; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_to_bank_trxn_log_0 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.wallet_to_bank_trxn_log_0 OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 35230)
-- Name: wallet_to_bank_trxn_log_0_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_to_bank_trxn_log_0_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_to_bank_trxn_log_0_id_seq OWNER TO postgres;

--
-- TOC entry 8912 (class 0 OID 0)
-- Dependencies: 292
-- Name: wallet_to_bank_trxn_log_0_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_to_bank_trxn_log_0_id_seq OWNED BY public.wallet_to_bank_trxn_log_0.id;


--
-- TOC entry 295 (class 1259 OID 35280)
-- Name: wallet_to_bank_trxn_log_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_to_bank_trxn_log_1 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.wallet_to_bank_trxn_log_1 OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 35279)
-- Name: wallet_to_bank_trxn_log_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_to_bank_trxn_log_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_to_bank_trxn_log_1_id_seq OWNER TO postgres;

--
-- TOC entry 8913 (class 0 OID 0)
-- Dependencies: 294
-- Name: wallet_to_bank_trxn_log_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_to_bank_trxn_log_1_id_seq OWNED BY public.wallet_to_bank_trxn_log_1.id;


--
-- TOC entry 297 (class 1259 OID 35330)
-- Name: wallet_to_bank_trxn_log_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_to_bank_trxn_log_2 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.wallet_to_bank_trxn_log_2 OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 35329)
-- Name: wallet_to_bank_trxn_log_2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_to_bank_trxn_log_2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_to_bank_trxn_log_2_id_seq OWNER TO postgres;

--
-- TOC entry 8914 (class 0 OID 0)
-- Dependencies: 296
-- Name: wallet_to_bank_trxn_log_2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_to_bank_trxn_log_2_id_seq OWNED BY public.wallet_to_bank_trxn_log_2.id;


--
-- TOC entry 299 (class 1259 OID 35379)
-- Name: wallet_to_bank_trxn_log_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_to_bank_trxn_log_3 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.wallet_to_bank_trxn_log_3 OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 35378)
-- Name: wallet_to_bank_trxn_log_3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_to_bank_trxn_log_3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_to_bank_trxn_log_3_id_seq OWNER TO postgres;

--
-- TOC entry 8915 (class 0 OID 0)
-- Dependencies: 298
-- Name: wallet_to_bank_trxn_log_3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_to_bank_trxn_log_3_id_seq OWNED BY public.wallet_to_bank_trxn_log_3.id;


--
-- TOC entry 301 (class 1259 OID 35428)
-- Name: wallet_to_bank_trxn_log_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_to_bank_trxn_log_4 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_num character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    debit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_accnt_in_memory boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.wallet_to_bank_trxn_log_4 OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 35427)
-- Name: wallet_to_bank_trxn_log_4_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_to_bank_trxn_log_4_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_to_bank_trxn_log_4_id_seq OWNER TO postgres;

--
-- TOC entry 8916 (class 0 OID 0)
-- Dependencies: 300
-- Name: wallet_to_bank_trxn_log_4_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_to_bank_trxn_log_4_id_seq OWNED BY public.wallet_to_bank_trxn_log_4.id;


--
-- TOC entry 303 (class 1259 OID 35477)
-- Name: wallet_to_bank_trxn_log_5; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_to_bank_trxn_log_5 (
    id bigint NOT NULL,
    trxn_originating_cust_no bigint,
    trxn_request_id character(20) DEFAULT '-'::bpchar,
    profile_type_code character(5) DEFAULT '-'::bpchar,
    user_sys_id bigint,
    profile_sys_id bigint,
    profile_id character(20) DEFAULT '-'::bpchar,
    bearer_token character(20) DEFAULT '-'::bpchar,
    debit_scheme_code character(20) DEFAULT '-'::bpchar,
    channel_id character(5) DEFAULT '-'::bpchar,
    debit_accnt_type_id integer DEFAULT 0,
    debit_bank_code character(3) DEFAULT '-'::bpchar,
    debit_wallet_accnt_no character(20) DEFAULT '-'::bpchar,
    debit_currency_code character(3) DEFAULT '056'::bpchar,
    trxn_type_id character(20) DEFAULT '-'::bpchar,
    trxn_amount character(60) DEFAULT '-'::bpchar,
    credit_scheme_code character(20) DEFAULT '-'::bpchar,
    credit_accnt_type_id integer DEFAULT 0,
    credit_bank_code character(3) DEFAULT '-'::bpchar,
    credit_wallet_accnt_no character(20) DEFAULT '-'::bpchar,
    credit_currency_code character(3) DEFAULT '056'::bpchar,
    log_session_id bigint DEFAULT '-1'::integer NOT NULL,
    reference_date date NOT NULL,
    reference_time timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    credit_profile_type_code character(5) DEFAULT '-'::bpchar,
    debit_profile_type_code character(5) DEFAULT '-'::bpchar
);


ALTER TABLE public.wallet_to_bank_trxn_log_5 OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 35476)
-- Name: wallet_to_bank_trxn_log_5_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_to_bank_trxn_log_5_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_to_bank_trxn_log_5_id_seq OWNER TO postgres;

--
-- TOC entry 8917 (class 0 OID 0)
-- Dependencies: 302
-- Name: wallet_to_bank_trxn_log_5_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_to_bank_trxn_log_5_id_seq OWNED BY public.wallet_to_bank_trxn_log_5.id;


--
-- TOC entry 6109 (class 2604 OID 46805)
-- Name: admin_user_device_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user_device_sessions ALTER COLUMN id SET DEFAULT nextval('public.admin_user_device_sessions_id_seq'::regclass);


--
-- TOC entry 5645 (class 2604 OID 37816)
-- Name: agent_profile_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profile_details ALTER COLUMN id SET DEFAULT nextval('public.agent_profile_details_id_seq'::regclass);


--
-- TOC entry 5444 (class 2604 OID 37278)
-- Name: agent_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profiles ALTER COLUMN id SET DEFAULT nextval('public.agent_profiles_id_seq'::regclass);


--
-- TOC entry 5445 (class 2604 OID 37279)
-- Name: agent_profiles user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profiles ALTER COLUMN user_sys_id SET DEFAULT nextval('public.agent_profiles_user_sys_id_seq'::regclass);


--
-- TOC entry 5446 (class 2604 OID 37280)
-- Name: agent_profiles profile_detail_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profiles ALTER COLUMN profile_detail_sys_id SET DEFAULT nextval('public.agent_profiles_profile_sys_id_seq'::regclass);


--
-- TOC entry 5994 (class 2604 OID 46640)
-- Name: agent_user_device_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_user_device_sessions ALTER COLUMN id SET DEFAULT nextval('public.agent_user_device_sessions_id_seq'::regclass);


--
-- TOC entry 4341 (class 2604 OID 24402)
-- Name: agent_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_users ALTER COLUMN id SET DEFAULT nextval('public.agent_users_id_seq'::regclass);


--
-- TOC entry 4342 (class 2604 OID 24403)
-- Name: agent_users profile_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_users ALTER COLUMN profile_sys_id SET DEFAULT nextval('public.agent_users_profile_sys_id_seq'::regclass);


--
-- TOC entry 4053 (class 2604 OID 16975)
-- Name: biller id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biller ALTER COLUMN id SET DEFAULT nextval('public.billing_id_seq'::regclass);


--
-- TOC entry 5606 (class 2604 OID 37763)
-- Name: customer_profile_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_profile_details ALTER COLUMN id SET DEFAULT nextval('public.customer_profile_details_id_seq'::regclass);


--
-- TOC entry 7716 (class 2604 OID 96358)
-- Name: customer_request_security id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request_security ALTER COLUMN id SET DEFAULT nextval('public.customer_request_security_id_seq'::regclass);


--
-- TOC entry 5801 (class 2604 OID 38022)
-- Name: customer_tier_1_profile_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profile_details ALTER COLUMN id SET DEFAULT nextval('public.customer_tier_1_profile_details_id_seq'::regclass);


--
-- TOC entry 5482 (class 2604 OID 37368)
-- Name: customer_tier_1_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profiles ALTER COLUMN id SET DEFAULT nextval('public.customer_tier_1_profiles_id_seq'::regclass);


--
-- TOC entry 5483 (class 2604 OID 37369)
-- Name: customer_tier_1_profiles user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profiles ALTER COLUMN user_sys_id SET DEFAULT nextval('public.customer_tier_1_profiles_user_sys_id_seq'::regclass);


--
-- TOC entry 5484 (class 2604 OID 37370)
-- Name: customer_tier_1_profiles profile_detail_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profiles ALTER COLUMN profile_detail_sys_id SET DEFAULT nextval('public.customer_tier_1_profiles_profile_sys_id_seq'::regclass);


--
-- TOC entry 6155 (class 2604 OID 46873)
-- Name: customer_tier_1_user_device_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_user_device_sessions ALTER COLUMN id SET DEFAULT nextval('public.customer_tier_1_user_device_sessions_id_seq'::regclass);


--
-- TOC entry 5193 (class 2604 OID 36384)
-- Name: customer_tier_1_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_users ALTER COLUMN id SET DEFAULT nextval('public.customer_tier_1_users_id_seq'::regclass);


--
-- TOC entry 5194 (class 2604 OID 36385)
-- Name: customer_tier_1_users profile_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_users ALTER COLUMN profile_sys_id SET DEFAULT nextval('public.customer_tier_1_users_profile_sys_id_seq'::regclass);


--
-- TOC entry 5196 (class 2604 OID 36387)
-- Name: customer_tier_1_users customer_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_users ALTER COLUMN customer_no SET DEFAULT nextval('public.customer_tier_1_users_customer_no_seq'::regclass);


--
-- TOC entry 6017 (class 2604 OID 46673)
-- Name: customer_user_device_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_device_sessions ALTER COLUMN id SET DEFAULT nextval('public.customer_user_device_sessions_id_seq'::regclass);


--
-- TOC entry 5923 (class 2604 OID 38232)
-- Name: customer_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_users ALTER COLUMN id SET DEFAULT nextval('public.customer_users_id_seq'::regclass);


--
-- TOC entry 4559 (class 2604 OID 34840)
-- Name: inter_node_wallet_trxn_log_0 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_0 ALTER COLUMN id SET DEFAULT nextval('public.inter_node_wallet_trxn_log_0_id_seq'::regclass);


--
-- TOC entry 4484 (class 2604 OID 34665)
-- Name: inter_node_wallet_trxn_log_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_1 ALTER COLUMN id SET DEFAULT nextval('public.inter_node_wallet_trxn_log_1_id_seq'::regclass);


--
-- TOC entry 4509 (class 2604 OID 34715)
-- Name: inter_node_wallet_trxn_log_2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_2 ALTER COLUMN id SET DEFAULT nextval('public.inter_node_wallet_trxn_log_2_id_seq'::regclass);


--
-- TOC entry 4534 (class 2604 OID 34764)
-- Name: inter_node_wallet_trxn_log_3 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_3 ALTER COLUMN id SET DEFAULT nextval('public.inter_node_wallet_trxn_log_3_id_seq'::regclass);


--
-- TOC entry 4584 (class 2604 OID 34890)
-- Name: inter_node_wallet_trxn_log_4 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_4 ALTER COLUMN id SET DEFAULT nextval('public.inter_node_wallet_trxn_log_4_id_seq'::regclass);


--
-- TOC entry 4609 (class 2604 OID 34939)
-- Name: inter_node_wallet_trxn_log_5 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_5 ALTER COLUMN id SET DEFAULT nextval('public.inter_node_wallet_trxn_log_5_id_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 35185)
-- Name: intra_node_wallet_trxn_log_0 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_0 ALTER COLUMN id SET DEFAULT nextval('public.intra_node_wallet_trxn_log_0_id_seq'::regclass);


--
-- TOC entry 4709 (class 2604 OID 35135)
-- Name: intra_node_wallet_trxn_log_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_1 ALTER COLUMN id SET DEFAULT nextval('public.intra_node_wallet_trxn_log_1_id_seq'::regclass);


--
-- TOC entry 4684 (class 2604 OID 35086)
-- Name: intra_node_wallet_trxn_log_2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_2 ALTER COLUMN id SET DEFAULT nextval('public.intra_node_wallet_trxn_log_2_id_seq'::regclass);


--
-- TOC entry 4659 (class 2604 OID 35037)
-- Name: intra_node_wallet_trxn_log_3 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_3 ALTER COLUMN id SET DEFAULT nextval('public.intra_node_wallet_trxn_log_3_id_seq'::regclass);


--
-- TOC entry 4634 (class 2604 OID 34988)
-- Name: intra_node_wallet_trxn_log_4 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_4 ALTER COLUMN id SET DEFAULT nextval('public.intra_node_wallet_trxn_log_4_id_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 35529)
-- Name: intra_node_wallet_trxn_log_5 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_5 ALTER COLUMN id SET DEFAULT nextval('public.intra_node_wallet_trxn_log_5_id_seq'::regclass);


--
-- TOC entry 5042 (class 2604 OID 36053)
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);


--
-- TOC entry 5043 (class 2604 OID 36054)
-- Name: inventory user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN user_sys_id SET DEFAULT nextval('public.inventory_user_sys_id_seq'::regclass);


--
-- TOC entry 5044 (class 2604 OID 36055)
-- Name: inventory profile_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN profile_sys_id SET DEFAULT nextval('public.inventory_profile_sys_id_seq'::regclass);


--
-- TOC entry 5097 (class 2604 OID 36139)
-- Name: inventory_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_items ALTER COLUMN id SET DEFAULT nextval('public.inventory_items_id_seq'::regclass);


--
-- TOC entry 5098 (class 2604 OID 36140)
-- Name: inventory_items user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_items ALTER COLUMN user_sys_id SET DEFAULT nextval('public.inventory_items_user_sys_id_seq'::regclass);


--
-- TOC entry 5099 (class 2604 OID 36141)
-- Name: inventory_items profile_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_items ALTER COLUMN profile_sys_id SET DEFAULT nextval('public.inventory_items_profile_sys_id_seq'::regclass);


--
-- TOC entry 7786 (class 2604 OID 96990)
-- Name: journal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal ALTER COLUMN id SET DEFAULT nextval('public.journal_id_seq'::regclass);


--
-- TOC entry 7847 (class 2604 OID 97231)
-- Name: journal_line id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line ALTER COLUMN id SET DEFAULT nextval('public.journal_line_id_seq'::regclass);


--
-- TOC entry 7807 (class 2604 OID 97017)
-- Name: journal_line_summary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary ALTER COLUMN id SET DEFAULT nextval('public.journal_line_summary_id_seq'::regclass);


--
-- TOC entry 5762 (class 2604 OID 37971)
-- Name: merchant_profile_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profile_details ALTER COLUMN id SET DEFAULT nextval('public.merchant_profile_details_id_seq'::regclass);


--
-- TOC entry 5871 (class 2604 OID 38113)
-- Name: merchant_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profiles ALTER COLUMN id SET DEFAULT nextval('public.merchant_profiles_id_seq'::regclass);


--
-- TOC entry 5872 (class 2604 OID 38114)
-- Name: merchant_profiles user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profiles ALTER COLUMN user_sys_id SET DEFAULT nextval('public.merchant_profiles_user_sys_id_seq'::regclass);


--
-- TOC entry 6040 (class 2604 OID 46706)
-- Name: merchant_user_device_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_user_device_sessions ALTER COLUMN id SET DEFAULT nextval('public.merchant_user_device_sessions_id_seq'::regclass);


--
-- TOC entry 5840 (class 2604 OID 38074)
-- Name: merchant_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_users ALTER COLUMN id SET DEFAULT nextval('public.merchant_users_id_seq'::regclass);


--
-- TOC entry 6132 (class 2604 OID 46840)
-- Name: partner_user_device_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_user_device_sessions ALTER COLUMN id SET DEFAULT nextval('public.partner_user_device_sessions_id_seq'::regclass);


--
-- TOC entry 5723 (class 2604 OID 37920)
-- Name: pos_profile_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profile_details ALTER COLUMN id SET DEFAULT nextval('public.pos_profile_details_id_seq'::regclass);


--
-- TOC entry 5425 (class 2604 OID 37200)
-- Name: pos_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profiles ALTER COLUMN id SET DEFAULT nextval('public.pos_profiles_id_seq'::regclass);


--
-- TOC entry 5426 (class 2604 OID 37201)
-- Name: pos_profiles user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profiles ALTER COLUMN user_sys_id SET DEFAULT nextval('public.pos_profiles_user_sys_id_seq'::regclass);


--
-- TOC entry 5427 (class 2604 OID 37202)
-- Name: pos_profiles profile_detail_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profiles ALTER COLUMN profile_detail_sys_id SET DEFAULT nextval('public.pos_profiles_profile_sys_id_seq'::regclass);


--
-- TOC entry 6063 (class 2604 OID 46739)
-- Name: pos_user_device_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_user_device_sessions ALTER COLUMN id SET DEFAULT nextval('public.pos_user_device_sessions_id_seq'::regclass);


--
-- TOC entry 5229 (class 2604 OID 36669)
-- Name: pos_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_users ALTER COLUMN id SET DEFAULT nextval('public.pos_users_id_seq'::regclass);


--
-- TOC entry 5230 (class 2604 OID 36670)
-- Name: pos_users profile_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_users ALTER COLUMN profile_sys_id SET DEFAULT nextval('public.pos_users_profile_sys_id_seq'::regclass);


--
-- TOC entry 5970 (class 2604 OID 46594)
-- Name: product_scheme_recycle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_scheme_recycle ALTER COLUMN id SET DEFAULT nextval('public.product_scheme_recycle_id_seq'::regclass);


--
-- TOC entry 5954 (class 2604 OID 46566)
-- Name: product_schemes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_schemes ALTER COLUMN id SET DEFAULT nextval('public.product_schemes_id_seq'::regclass);


--
-- TOC entry 5567 (class 2604 OID 37712)
-- Name: profile_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_details ALTER COLUMN id SET DEFAULT nextval('public.profile_details_id_seq'::regclass);


--
-- TOC entry 4178 (class 2604 OID 23910)
-- Name: profile_details_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_details_model ALTER COLUMN id SET DEFAULT nextval('public.profile_details_model_id_seq'::regclass);


--
-- TOC entry 4170 (class 2604 OID 22226)
-- Name: profile_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_types ALTER COLUMN id SET DEFAULT nextval('public.profile_types_id_seq'::regclass);


--
-- TOC entry 5058 (class 2604 OID 36083)
-- Name: sales_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_inventory ALTER COLUMN id SET DEFAULT nextval('public.sales_inventory_id_seq'::regclass);


--
-- TOC entry 5059 (class 2604 OID 36084)
-- Name: sales_inventory user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_inventory ALTER COLUMN user_sys_id SET DEFAULT nextval('public.sales_inventory_user_sys_id_seq'::regclass);


--
-- TOC entry 5060 (class 2604 OID 36085)
-- Name: sales_inventory profile_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_inventory ALTER COLUMN profile_sys_id SET DEFAULT nextval('public.sales_inventory_profile_sys_id_seq'::regclass);


--
-- TOC entry 5080 (class 2604 OID 36113)
-- Name: sales_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_items ALTER COLUMN id SET DEFAULT nextval('public.sales_items_id_seq'::regclass);


--
-- TOC entry 5081 (class 2604 OID 36114)
-- Name: sales_items user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_items ALTER COLUMN user_sys_id SET DEFAULT nextval('public.sales_items_user_sys_id_seq'::regclass);


--
-- TOC entry 5082 (class 2604 OID 36115)
-- Name: sales_items profile_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_items ALTER COLUMN profile_sys_id SET DEFAULT nextval('public.sales_items_profile_sys_id_seq'::regclass);


--
-- TOC entry 4425 (class 2604 OID 34203)
-- Name: scheme_recycle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheme_recycle ALTER COLUMN id SET DEFAULT nextval('public.scheme_recycle_id_seq'::regclass);


--
-- TOC entry 4154 (class 2604 OID 20382)
-- Name: schemes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemes ALTER COLUMN id SET DEFAULT nextval('public.schemes_id_seq'::regclass);


--
-- TOC entry 4173 (class 2604 OID 22322)
-- Name: service_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_channels ALTER COLUMN id SET DEFAULT nextval('public.service_channels_id_seq'::regclass);


--
-- TOC entry 4072 (class 2604 OID 16977)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 5684 (class 2604 OID 37868)
-- Name: super_agent_profile_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profile_details ALTER COLUMN id SET DEFAULT nextval('public.super_agent_profile_details_id_seq'::regclass);


--
-- TOC entry 4211 (class 2604 OID 24001)
-- Name: super_agent_profile_details_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profile_details_model ALTER COLUMN id SET DEFAULT nextval('public.super_agent_profile_details_model_id_seq'::regclass);


--
-- TOC entry 5463 (class 2604 OID 37323)
-- Name: super_agent_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profiles ALTER COLUMN id SET DEFAULT nextval('public.super_agent_profiles_id_seq'::regclass);


--
-- TOC entry 5464 (class 2604 OID 37324)
-- Name: super_agent_profiles user_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profiles ALTER COLUMN user_sys_id SET DEFAULT nextval('public.super_agent_profiles_user_sys_id_seq'::regclass);


--
-- TOC entry 5465 (class 2604 OID 37325)
-- Name: super_agent_profiles profile_detail_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profiles ALTER COLUMN profile_detail_sys_id SET DEFAULT nextval('public.super_agent_profiles_profile_sys_id_seq'::regclass);


--
-- TOC entry 6086 (class 2604 OID 46772)
-- Name: super_agent_user_device_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_user_device_sessions ALTER COLUMN id SET DEFAULT nextval('public.super_agent_user_device_sessions_id_seq'::regclass);


--
-- TOC entry 4310 (class 2604 OID 24351)
-- Name: super_agent_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_users ALTER COLUMN id SET DEFAULT nextval('public.super_agent_users_id_seq'::regclass);


--
-- TOC entry 4311 (class 2604 OID 37431)
-- Name: super_agent_users profile_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_users ALTER COLUMN profile_detail_id SET DEFAULT nextval('public.super_agent_users_profile_sys_id_seq'::regclass);


--
-- TOC entry 4275 (class 2604 OID 24299)
-- Name: super_agent_users_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_users_model ALTER COLUMN id SET DEFAULT nextval('public.super_agent_users_model_id_seq'::regclass);


--
-- TOC entry 4276 (class 2604 OID 24300)
-- Name: super_agent_users_model profile_sys_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_users_model ALTER COLUMN profile_sys_id SET DEFAULT nextval('public.super_agent_users_model_profile_sys_id_seq'::regclass);


--
-- TOC entry 4150 (class 2604 OID 20341)
-- Name: sys_app_key_era id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_app_key_era ALTER COLUMN id SET DEFAULT nextval('public.sys_app_key_era_id_seq'::regclass);


--
-- TOC entry 4387 (class 2604 OID 24920)
-- Name: system_boundary_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_boundary_log ALTER COLUMN id SET DEFAULT nextval('public.system_boundary_log_id_seq'::regclass);


--
-- TOC entry 4403 (class 2604 OID 25689)
-- Name: system_log_summary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_log_summary ALTER COLUMN id SET DEFAULT nextval('public.system_log_summary_id_seq'::regclass);


--
-- TOC entry 4373 (class 2604 OID 24744)
-- Name: u_p id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.u_p ALTER COLUMN id SET DEFAULT nextval('public.u_p_id_seq'::regclass);


--
-- TOC entry 4377 (class 2604 OID 24754)
-- Name: u_s id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.u_s ALTER COLUMN id SET DEFAULT nextval('public.u_s_id_seq'::regclass);


--
-- TOC entry 4379 (class 2604 OID 24783)
-- Name: unique_bearer_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_bearer_tokens ALTER COLUMN id SET DEFAULT nextval('public.unique_bearer_tokens_id_seq'::regclass);


--
-- TOC entry 4383 (class 2604 OID 24819)
-- Name: unique_customer_keys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_customer_keys ALTER COLUMN id SET DEFAULT nextval('public.unique_customer_keys_id_seq'::regclass);


--
-- TOC entry 5528 (class 2604 OID 37660)
-- Name: user_profile_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile_details ALTER COLUMN id SET DEFAULT nextval('public.user_profile_details_id_seq'::regclass);


--
-- TOC entry 4244 (class 2604 OID 24140)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4245 (class 2604 OID 24141)
-- Name: users profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN profile_id SET DEFAULT nextval('public.users_profile_sys_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 35234)
-- Name: wallet_to_bank_trxn_log_0 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_0 ALTER COLUMN id SET DEFAULT nextval('public.wallet_to_bank_trxn_log_0_id_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 35283)
-- Name: wallet_to_bank_trxn_log_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_1 ALTER COLUMN id SET DEFAULT nextval('public.wallet_to_bank_trxn_log_1_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 35333)
-- Name: wallet_to_bank_trxn_log_2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_2 ALTER COLUMN id SET DEFAULT nextval('public.wallet_to_bank_trxn_log_2_id_seq'::regclass);


--
-- TOC entry 4832 (class 2604 OID 35382)
-- Name: wallet_to_bank_trxn_log_3 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_3 ALTER COLUMN id SET DEFAULT nextval('public.wallet_to_bank_trxn_log_3_id_seq'::regclass);


--
-- TOC entry 4857 (class 2604 OID 35431)
-- Name: wallet_to_bank_trxn_log_4 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4 ALTER COLUMN id SET DEFAULT nextval('public.wallet_to_bank_trxn_log_4_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 35480)
-- Name: wallet_to_bank_trxn_log_5 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_5 ALTER COLUMN id SET DEFAULT nextval('public.wallet_to_bank_trxn_log_5_id_seq'::regclass);


--
-- TOC entry 8783 (class 0 OID 86783)
-- Dependencies: 479
-- Data for Name: account_credit_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_credit_history (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8515 (class 0 OID 16396)
-- Dependencies: 211
-- Data for Name: actual_bonus_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actual_bonus_log (id, amount, remark, journal_id, profile_id, bonus_log_date) FROM stdin;
\.


--
-- TOC entry 8709 (class 0 OID 46802)
-- Dependencies: 405
-- Data for Name: admin_user_device_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_user_device_sessions (id, profile_type_code, request_partner_code, request_app_code, request_user_id, request_user_type, unique_cust_id, profile_sys_id, customer_ref, ext_customer_ref, is_user_profile_active, bearer_token, scheme_code, request_channel_id, request_channel, device_type, device_os, device_name, is_active_session, era_id, consecutive_login_retries, last_app_request_key, device_id, notification_token, last_login_date, log_session_id) FROM stdin;
\.


--
-- TOC entry 8675 (class 0 OID 37813)
-- Dependencies: 371
-- Data for Name: agent_profile_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent_profile_details (id, user_sys_id, profile_id, first_name, middle_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, city, state, country, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, email_otp, email_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, loc_longitude, loc_latitude, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8657 (class 0 OID 37275)
-- Dependencies: 353
-- Data for Name: agent_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent_profiles (id, user_sys_id, profile_detail_sys_id, profile_id, profile_type_code, customer_no, mobile_number, scheme_code, default_encry_key, key_program_control, encypted_last_key, is_active, red_flagged, kyc_trxn_limit, kyc_daily_limit, consecutive_login_retries, consecutive_pin_retries, deactivate_code, deactivate_reason) FROM stdin;
\.


--
-- TOC entry 8796 (class 0 OID 87846)
-- Dependencies: 492
-- Data for Name: agent_swift_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent_swift_wallets (id, wallet_accnt_no, book_balance, book_balance_plain, date_opened, customer_no, customer_ref, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, available_balance, available_balance_plain, pocket_wallet_balance, pocket_wallet_balance_plain, hold_amount_balance, hold_amount_balance_plain, transit_trxn_balance, transit_trxn_balance_plain, wallet_limit, sys_acct_lock, overdraft_balance, overdraft_balance_plain, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_debit_plain, daily_cummulative_credit, daily_cummulative_credit_plain, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8699 (class 0 OID 46637)
-- Dependencies: 395
-- Data for Name: agent_user_device_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent_user_device_sessions (id, profile_type_code, request_partner_code, request_app_code, request_user_id, request_user_type, unique_cust_id, profile_sys_id, customer_ref, ext_customer_ref, is_user_profile_active, bearer_token, scheme_code, request_channel_id, request_channel, device_type, device_os, device_name, is_active_session, era_id, consecutive_login_retries, last_app_request_key, device_id, notification_token, last_login_date, log_session_id) FROM stdin;
\.


--
-- TOC entry 8554 (class 0 OID 24399)
-- Dependencies: 250
-- Data for Name: agent_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent_users (id, profile_sys_id, profile_id, username, user_password, first_name, last_name, email, image_url, is_active, red_flagged, lang_key, activation_key, reset_key, reset_date, created_by, created_date, last_modified_by, last_modified_date, default_encry_key, key_program_control, encypted_last_key, single_sign_on, status, login_retries, pin, dpin, dpin_operator, dpin_operand, default_scheme_code, current_session_scheme_code, deactivate_code, deactivate_reason, customer_no, authourization_dpin_operand) FROM stdin;
\.


--
-- TOC entry 8791 (class 0 OID 87772)
-- Dependencies: 487
-- Data for Name: agent_wallet_instance_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent_wallet_instance_refs (id, wallet_accnt_no, reference_count, update_test_field) FROM stdin;
\.


--
-- TOC entry 8649 (class 0 OID 37034)
-- Dependencies: 345
-- Data for Name: agent_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent_wallets (id, wallet_accnt_no, current_balance, date_opened, customer_no, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, wallet_balance, pocket_wallet_balance, hold_amount_balance, transit_trxn_balance, pocket_wallet_reversal_bal, wallet_limit, sys_acct_lock, overdraft_balance, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_credit, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8725 (class 0 OID 64416)
-- Dependencies: 421
-- Data for Name: approval_item_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_item_groups (id, company_id, application_code, item_group_name, item_group_description, item_group_creation_date, item_group_creation_time, item_group_modification_date, item_group_modification_time) FROM stdin;
\.


--
-- TOC entry 8721 (class 0 OID 56183)
-- Dependencies: 417
-- Data for Name: approval_item_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_item_types (id, company_id, application_code, approval_item_group_id, item_name, description, is_financial_related, is_physical_object_related, is_relocation_related, approval_item_table, item_type_creator, item_type_creation_date, item_type_creation_time) FROM stdin;
\.


--
-- TOC entry 8739 (class 0 OID 72595)
-- Dependencies: 435
-- Data for Name: approval_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_items (id, company_id, application_code, approval_workflow_id, item_type_id, item_group_id, item_name, approval_batch_id, user_request_id, current_approver_id, current_approver_level, request_user_id, request_user, is_currently_been_reviewed, current_reviewer_user_id, is_approved_final, approve_comment, reject_reason, request_initiation_date, request_initiation_time) FROM stdin;
\.


--
-- TOC entry 8723 (class 0 OID 64395)
-- Dependencies: 419
-- Data for Name: approval_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_requests (id, company_id, application_code, approval_workflow_id, item_type_id, item_group_id, item_group_name, approval_batch_id, approval_item_id, batch_item_count, user_request_id, current_approver_id, current_approver_level, request_user_id, request_user, request_initiation_date, request_initiation_time, is_approved_final, approve_comment, reject_reason, approved_level_1_date, approved_level_1_time, approved_level_2_date, approved_level_2_time, approved_level_3_date, approved_level_3_time) FROM stdin;
\.


--
-- TOC entry 8731 (class 0 OID 64547)
-- Dependencies: 427
-- Data for Name: approval_routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_routes (id, company_id, application_code, item_group_id, item_type_id, approval_workflow_id, is_active_route, approver_user_group_id, approver_user_id, approver_level, approver_description, approver_name, is_final_approver, approver_route_create_date, approver_route_create_time, approver_route_modification_date, approver_route_modification_time) FROM stdin;
\.


--
-- TOC entry 8727 (class 0 OID 64475)
-- Dependencies: 423
-- Data for Name: approval_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_user_groups (id, company_id, application_code, user_group_name, user_group_description, user_group_approval_level, user_group_creation_date, user_group_creation_time, user_group_modification_date, user_group_modification_time) FROM stdin;
\.


--
-- TOC entry 8729 (class 0 OID 64514)
-- Dependencies: 425
-- Data for Name: approval_workflow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_workflow (id, company_id, application_code, item_group_id, item_type_id, total_approval_levels, total_approval_levels_in_words, total_approval_levels_in_words_hash, workflow_create_user_id, workflow_create_user, workflow_create_date, workflow_create_time, workflow_modification_user_id, workflow_modification_user, workflow_modification_date, workflow_modification_time) FROM stdin;
\.


--
-- TOC entry 8667 (class 0 OID 37526)
-- Dependencies: 363
-- Data for Name: beneficiary_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beneficiary_accounts (id, user_id, profile_detail_id, customer_no, profile_type_code, is_wallet, scheme_code, bank_code, bank_name, account_no, bank_account_name, trxn_count, is_active, last_payment_date, last_payment_time) FROM stdin;
\.


--
-- TOC entry 8666 (class 0 OID 37490)
-- Dependencies: 362
-- Data for Name: beneficiary_service_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beneficiary_service_accounts (id, user_id, profile_detail_id, customer_no, profile_type_code, scheme_code, service_type, service_subscription_id, device_account, is_active, is_auto_renewal, service_value, trxn_count, auto_renewal_day_of_month, last_purchase_date, last_purchase_time) FROM stdin;
\.


--
-- TOC entry 8516 (class 0 OID 16424)
-- Dependencies: 212
-- Data for Name: biller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biller (id, billing_reference, biller_id, biller_name, status) FROM stdin;
\.


--
-- TOC entry 8530 (class 0 OID 19892)
-- Dependencies: 226
-- Data for Name: biller_operational_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biller_operational_wallets (id, scheme_code, wallet_account_type_id, wallet_accnt_num, biller_id, public_ledger_biller_id, wallet_name, balance_amount, date_opened, charge_trxn, applicable_trxn_type, share_accrued, use_percentage, lower_trxn_band_perct_or_fixedvalue, medium_trxn_band_perct_or_fixedvalue, upper_trxn_band_perct_or_fixedvalue, last_modified_date, is_active, virtual_nuban, nuban_bank_code, nuban_account_no, hold_amount, charge_name) FROM stdin;
\.


--
-- TOC entry 8528 (class 0 OID 19593)
-- Dependencies: 224
-- Data for Name: biller_settlement_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biller_settlement_accounts (id, biller_id, scheme_code, bank_code, account_num, bank_name, is_active, last_settlement_date, last_settlement_time) FROM stdin;
\.


--
-- TOC entry 8815 (class 0 OID 98044)
-- Dependencies: 512
-- Data for Name: billing_charges_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_charges_config (id, billing_code, partner_code, is_active, service_id, service_name, scheme_code, applicable_trxn_type, trxn_band, lower_limit_value, upper_limit_value, use_percentage, percentage_or_fixedvalue, trxn_charge_cap, date_configured, use_percentage_for_tax, tax_percentage_or_fixedvalue, tax_charge_cap, use_percentage_for_bank_commission, bank_commission_percentage_or_fixedvalue, bank_commission_share_cap, use_percentage_for_partner_commission, partner_commission_percentage_or_fixedvalue, partner_commission_share_cap, use_save_invest_percentage, save_invest_percentage_or_fixedvalue, minimum_save_invest, save_invest_cap, bonus_share, bonus_accelerate) FROM stdin;
1	HJSW                	jahddd              	t	1	test-billing        	ndoadndadd  	WalletToBank        	LOW       	1.00	5000.00	t	20.00	100.00	2024-09-11	f	1.00	10.00	f	0.00	0.00	f	0.00	0.00	f	50.00	500.00	500.00	0.00	f
\.


--
-- TOC entry 8573 (class 0 OID 34387)
-- Dependencies: 269
-- Data for Name: billing_config_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_config_summary (id, billing_reference, is_active, service_id, service_name, scheme_code, applicable_trxn_type, trxn_band, use_percentage, percentage_or_fixedvalue, trxn_charge_cap, date_configured, billing_code, lower_trxn_band_perct_or_fixedvalue, medium_trxn_band_perct_or_fixedvalue, upper_trxn_band_perct_or_fixedvalue, wallet_accnt_num, charge_code, biller_id, lower_trxn_band_cap, medium_trxn_band_cap, upper_trxn_band_cap) FROM stdin;
\.


--
-- TOC entry 8803 (class 0 OID 96640)
-- Dependencies: 500
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (id, name, version) FROM stdin;
1	SystemSpecs  	1.0          
\.


--
-- TOC entry 8804 (class 0 OID 96646)
-- Dependencies: 501
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (id, firstname, lastname, company_id, status, email) FROM stdin;
1	Bolaji Oge   	Ogeyingbo    	1	Contacted    	bogeyingbo@gmail.com   
\.


--
-- TOC entry 8518 (class 0 OID 16464)
-- Dependencies: 214
-- Data for Name: customer_kyc_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_kyc_level (id, description, kyc_level, phone_number_verified, email_address_verified, first_name_verified, last_name_verified, gender_verified, date_of_birth_verified, photo_id_uploaded, bvn_verified, valid_id_verified, evidence_of_address_verified, address_verified, employment_details_verified, payment_transaction_enabled, biller_transaction_enabled) FROM stdin;
\.


--
-- TOC entry 8673 (class 0 OID 37760)
-- Dependencies: 369
-- Data for Name: customer_profile_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_profile_details (id, user_sys_id, profile_id, first_name, middle_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, city, state, country, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, email_otp, email_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, loc_longitude, loc_latitude, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8801 (class 0 OID 96355)
-- Dependencies: 498
-- Data for Name: customer_request_security; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_request_security (id, customer_reference, request_ip, secret_salt, request_hash_key, request_encrytion_key, update_column) FROM stdin;
\.


--
-- TOC entry 8802 (class 0 OID 96590)
-- Dependencies: 499
-- Data for Name: customer_swift_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_swift_wallets (id, wallet_accnt_no, book_balance, book_balance_plain, date_opened, customer_no, customer_ref, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, active_status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, available_balance, available_balance_plain, pocket_wallet_balance, pocket_wallet_balance_plain, hold_amount_balance, hold_amount_balance_plain, transit_trxn_balance, transit_trxn_balance_plain, wallet_limit, sys_acct_lock, overdraft_balance, overdraft_balance_plain, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_debit_plain, daily_cummulative_credit, daily_cummulative_credit_plain, last_credit_trxn_ref, last_debit_trxn_ref, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8683 (class 0 OID 38019)
-- Dependencies: 379
-- Data for Name: customer_tier_1_profile_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tier_1_profile_details (id, user_sys_id, profile_id, first_name, middle_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, city, state, country, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, email_otp, email_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, loc_longitude, loc_latitude, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8665 (class 0 OID 37365)
-- Dependencies: 361
-- Data for Name: customer_tier_1_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tier_1_profiles (id, user_sys_id, profile_detail_sys_id, profile_id, profile_type_code, customer_no, mobile_number, scheme_code, default_encry_key, key_program_control, encypted_last_key, is_active, red_flag, kyc_trxn_limit, kyc_daily_limit, consecutive_login_retries, consecutive_pin_retries, deactivate_code, deactivate_reason) FROM stdin;
\.


--
-- TOC entry 8798 (class 0 OID 87986)
-- Dependencies: 494
-- Data for Name: customer_tier_1_swift_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tier_1_swift_wallets (id, wallet_accnt_no, book_balance, book_balance_plain, date_opened, customer_no, customer_ref, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, available_balance, available_balance_plain, pocket_wallet_balance, pocket_wallet_balance_plain, hold_amount_balance, hold_amount_balance_plain, transit_trxn_balance, transit_trxn_balance_plain, wallet_limit, sys_acct_lock, overdraft_balance, overdraft_balance_plain, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_debit_plain, daily_cummulative_credit, daily_cummulative_credit_plain, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8713 (class 0 OID 46870)
-- Dependencies: 409
-- Data for Name: customer_tier_1_user_device_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tier_1_user_device_sessions (id, profile_type_code, request_partner_code, request_app_code, request_user_id, request_user_type, unique_cust_id, profile_sys_id, customer_ref, ext_customer_ref, is_user_profile_active, bearer_token, scheme_code, request_channel_id, request_channel, device_type, device_os, device_name, is_active_session, era_id, consecutive_login_retries, last_app_request_key, device_id, notification_token, last_login_date, log_session_id) FROM stdin;
\.


--
-- TOC entry 8641 (class 0 OID 36381)
-- Dependencies: 337
-- Data for Name: customer_tier_1_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tier_1_users (id, profile_sys_id, profile_id, customer_no, username, user_password, first_name, last_name, email, image_url, is_active, red_flagged, lang_key, activation_key, reset_key, reset_date, created_by, created_date, last_modified_by, last_modified_date, default_encry_key, key_program_control, encypted_last_key, single_sign_on, status, login_retries, pin, dpin, dpin_operator, dpin_operand, default_scheme_code, current_session_scheme_code, kyc_trxn_limit, kyc_daily_limit, consecutive_login_retries, consecutive_pin_use_retries, deactivate_code, deactivate_reason, authourization_dpin_operand) FROM stdin;
\.


--
-- TOC entry 8794 (class 0 OID 87793)
-- Dependencies: 490
-- Data for Name: customer_tier_1_wallet_instance_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tier_1_wallet_instance_refs (id, wallet_accnt_no, reference_count, update_test_field) FROM stdin;
\.


--
-- TOC entry 8648 (class 0 OID 36994)
-- Dependencies: 344
-- Data for Name: customer_tier_1_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tier_1_wallets (id, wallet_accnt_no, current_balance, date_opened, customer_no, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, wallet_balance, pocket_wallet_balance, hold_amount_balance, transit_trxn_balance, pocket_wallet_reversal_bal, wallet_limit, sys_acct_lock, overdraft_balance, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_credit, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8701 (class 0 OID 46670)
-- Dependencies: 397
-- Data for Name: customer_user_device_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_user_device_sessions (id, profile_type_code, request_partner_code, request_app_code, request_user_id, request_user_type, unique_cust_id, profile_sys_id, customer_ref, ext_customer_ref, is_user_profile_active, bearer_token, scheme_code, request_channel_id, request_channel, device_type, device_os, device_name, is_active_session, era_id, consecutive_login_retries, last_app_request_key, device_id, notification_token, last_login_date, log_session_id) FROM stdin;
\.


--
-- TOC entry 8691 (class 0 OID 38229)
-- Dependencies: 387
-- Data for Name: customer_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_users (id, profile_id, username, user_password, first_name, last_name, email, image_url, is_active, red_flagged, lang_key, activation_key, reset_key, reset_date, created_by, created_date, last_modified_by, last_modified_date, default_encry_key, key_program_control, encypted_last_key, single_sign_on, status, login_count, authourization_pin, authourization_dpin, authourization_dpin_operator, authourization_dpin_operand, dpin_operand, default_scheme_code, current_session_scheme_code, deactivate_code, deactivate_reason, customer_no) FROM stdin;
\.


--
-- TOC entry 8792 (class 0 OID 87779)
-- Dependencies: 488
-- Data for Name: customer_wallet_instance_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_wallet_instance_refs (id, wallet_accnt_no, reference_count, update_test_field) FROM stdin;
\.


--
-- TOC entry 8647 (class 0 OID 36918)
-- Dependencies: 343
-- Data for Name: customer_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_wallets (id, wallet_accnt_no, current_balance, date_opened, customer_no, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, wallet_balance, pocket_wallet_balance, hold_amount_balance, transit_trxn_balance, pocket_wallet_reversal_bal, wallet_limit, sys_acct_lock, overdraft_balance, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_credit, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8519 (class 0 OID 16548)
-- Dependencies: 215
-- Data for Name: demo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.demo (pw) FROM stdin;
\.


--
-- TOC entry 8610 (class 0 OID 35791)
-- Dependencies: 306
-- Data for Name: ext_credit_wallet_rqst_trxn_log_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_credit_wallet_rqst_trxn_log_0 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8611 (class 0 OID 35817)
-- Dependencies: 307
-- Data for Name: ext_credit_wallet_rqst_trxn_log_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_credit_wallet_rqst_trxn_log_1 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8612 (class 0 OID 35843)
-- Dependencies: 308
-- Data for Name: ext_credit_wallet_rqst_trxn_log_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_credit_wallet_rqst_trxn_log_2 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8613 (class 0 OID 35869)
-- Dependencies: 309
-- Data for Name: ext_credit_wallet_rqst_trxn_log_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_credit_wallet_rqst_trxn_log_3 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8614 (class 0 OID 35895)
-- Dependencies: 310
-- Data for Name: ext_credit_wallet_rqst_trxn_log_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_credit_wallet_rqst_trxn_log_4 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8615 (class 0 OID 35921)
-- Dependencies: 311
-- Data for Name: ext_credit_wallet_rqst_trxn_log_5; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_credit_wallet_rqst_trxn_log_5 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8637 (class 0 OID 36262)
-- Dependencies: 333
-- Data for Name: ext_debit_wallet_rqst_trxn_log_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_debit_wallet_rqst_trxn_log_0 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8636 (class 0 OID 36236)
-- Dependencies: 332
-- Data for Name: ext_debit_wallet_rqst_trxn_log_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_debit_wallet_rqst_trxn_log_1 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8635 (class 0 OID 36209)
-- Dependencies: 331
-- Data for Name: ext_debit_wallet_rqst_trxn_log_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_debit_wallet_rqst_trxn_log_2 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8634 (class 0 OID 36183)
-- Dependencies: 330
-- Data for Name: ext_debit_wallet_rqst_trxn_log_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_debit_wallet_rqst_trxn_log_3 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8633 (class 0 OID 36157)
-- Dependencies: 329
-- Data for Name: ext_debit_wallet_rqst_trxn_log_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_debit_wallet_rqst_trxn_log_4 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8616 (class 0 OID 35948)
-- Dependencies: 312
-- Data for Name: ext_debit_wallet_rqst_trxn_log_5; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ext_debit_wallet_rqst_trxn_log_5 (id, trxn_request_id, external_trxn_ref, profile_id, profile_type_code, trxn_dr_cr_request, trxn_amount, scheme_code, accnt_bank_code, wallet_accnt_num, wallet_accnt_type_id, log_session_id, trxn_type_id, credit_currency_code, reference_date, reference_time, processed, selected) FROM stdin;
\.


--
-- TOC entry 8581 (class 0 OID 34837)
-- Dependencies: 277
-- Data for Name: inter_node_wallet_trxn_log_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inter_node_wallet_trxn_log_0 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8575 (class 0 OID 34662)
-- Dependencies: 271
-- Data for Name: inter_node_wallet_trxn_log_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inter_node_wallet_trxn_log_1 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8577 (class 0 OID 34712)
-- Dependencies: 273
-- Data for Name: inter_node_wallet_trxn_log_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inter_node_wallet_trxn_log_2 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8579 (class 0 OID 34761)
-- Dependencies: 275
-- Data for Name: inter_node_wallet_trxn_log_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inter_node_wallet_trxn_log_3 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8583 (class 0 OID 34887)
-- Dependencies: 279
-- Data for Name: inter_node_wallet_trxn_log_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inter_node_wallet_trxn_log_4 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8585 (class 0 OID 34936)
-- Dependencies: 281
-- Data for Name: inter_node_wallet_trxn_log_5; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inter_node_wallet_trxn_log_5 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8595 (class 0 OID 35182)
-- Dependencies: 291
-- Data for Name: intra_node_wallet_trxn_log_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intra_node_wallet_trxn_log_0 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8593 (class 0 OID 35132)
-- Dependencies: 289
-- Data for Name: intra_node_wallet_trxn_log_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intra_node_wallet_trxn_log_1 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8591 (class 0 OID 35083)
-- Dependencies: 287
-- Data for Name: intra_node_wallet_trxn_log_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intra_node_wallet_trxn_log_2 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8589 (class 0 OID 35034)
-- Dependencies: 285
-- Data for Name: intra_node_wallet_trxn_log_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intra_node_wallet_trxn_log_3 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8587 (class 0 OID 34985)
-- Dependencies: 283
-- Data for Name: intra_node_wallet_trxn_log_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intra_node_wallet_trxn_log_4 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8609 (class 0 OID 35526)
-- Dependencies: 305
-- Data for Name: intra_node_wallet_trxn_log_5; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intra_node_wallet_trxn_log_5 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, debit_profile_type_code, credit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8620 (class 0 OID 36050)
-- Dependencies: 316
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (id, user_sys_id, profile_sys_id, customer_no, profile_type_code, profile_id, scheme_code, item_code, item_name, available_units, cost_price, ency_cost_price, purchases_this_week, purchases_this_month, purchases_ytd, encry_margin, last_purchase_date, last_purchase_time, last_sales_date, last_sales_time) FROM stdin;
\.


--
-- TOC entry 8632 (class 0 OID 36136)
-- Dependencies: 328
-- Data for Name: inventory_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_items (id, user_sys_id, profile_sys_id, customer_no, profile_type_code, profile_id, scheme_code, item_code, item_name, item_description, supplier_code, supplier_phone, supplier_email, supplier_whatsapp, last_purchase_price, ency_last_purchase_price, last_purchase_date, last_purchase_time) FROM stdin;
\.


--
-- TOC entry 8807 (class 0 OID 96987)
-- Dependencies: 504
-- Data for Name: journal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal (id, trxn_request_id, trxn_reference, external_trxn_reference, journal_action, source_customer_reference, debit_partner_code, debit_scheme_code, debit_cust_user_id, debit_profile_id, debit_profile_type_code, debit_bank_code, debit_wallet_accnt_no, debit_wallet_accnt_num, trxn_amount, credit_partner_code, credit_scheme_code, credit_cust_user_id, credit_profile_id, credit_profile_type_code, credit_bank_code, credit_wallet_accnt_id, credit_wallet_accnt_num, memo, trxn_channel, trxn_type, service_provider_id, service_provider, service_name, trxn_date, trxn_time, due_date, narration, trans_status_code, sys_comment) FROM stdin;
\.


--
-- TOC entry 8811 (class 0 OID 97228)
-- Dependencies: 508
-- Data for Name: journal_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_line (id, profile_id, profile_type_code, journal_action, credit_debit_partner_code, credit_debit_scheme_code, is_credit_or_debit, credit_debit_value, jounal_id, wallet_account_id, wallet_account_num, current_balance, previous_balance, trxn_date, trxn_time, trxn_reference, external_trxn_reference, trxn_type, trxn_channel) FROM stdin;
\.


--
-- TOC entry 8809 (class 0 OID 97014)
-- Dependencies: 506
-- Data for Name: journal_line_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_line_summary (id, journal_id, journal_action, debit_profile_id, debit_profile_type_code, debit_partner_code, debit_scheme_code, debit_wallet_accnt_id, debit_wallet_accnt_value, credit_partner_code, credit_scheme_code, credit_profile_id, credit_profile_type_code, credit_wallet_accnt_id, credit_wallet_accnt_value, "operational_wallet_accnt_id", operational_wallet_accnt_value, operational_wallet_accnt_credit_debit, host_fee_wallet_id, host_fee_wallet_value, host_fee_wallet_credit_debit, biller_wallet_id, biller_payable_recievable, biller_wallet_value, biller_credit_debit, biller_commission_wallet_id, biller_commission_payable_recievable, biller_commission_wallet_value, biller_commission_wallet_credit_debit, tax_wallet_id, tax_type_id, tax_type, tax_wallet_value, tax_wallet_credit_debit, partner_commission_1_wallet_id, partner_commission_1_payable_recievable, partner_commission_1_wallet_value, partner_commission_1_wallet_credit_debit, partner_commission_2_wallet_id, partner_commission_2_payable_recievable, partner_commission_2_wallet_value, partner_commission_2_wallet_credit_debit, trxn_date, trxn_time, trxn_reference, external_trxn_reference, trxn_type, trxn_channel) FROM stdin;
\.


--
-- TOC entry 8812 (class 0 OID 97479)
-- Dependencies: 509
-- Data for Name: merchant_access_whitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_access_whitelist (ip_address, merchant_full_name, merchant_mobile_num, is_active) FROM stdin;
\.


--
-- TOC entry 8681 (class 0 OID 37968)
-- Dependencies: 377
-- Data for Name: merchant_profile_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_profile_details (id, user_sys_id, profile_id, first_name, middle_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, city, state, country, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, email_otp, email_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, loc_longitude, loc_latitude, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8688 (class 0 OID 38110)
-- Dependencies: 384
-- Data for Name: merchant_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_profiles (id, user_sys_id, profile_detail_sys_id, profile_id, profile_type_code, customer_no, mobile_number, scheme_code, default_encry_key, key_program_control, encypted_last_key, is_active, red_flaged, kyc_trxn_limit, kyc_daily_limit, consecutive_login_retries, consecutive_pin_retries, deactivate_code, deactivate_reason) FROM stdin;
\.


--
-- TOC entry 8789 (class 0 OID 87493)
-- Dependencies: 485
-- Data for Name: merchant_swift_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_swift_wallets (id, wallet_accnt_no, book_balance, book_balance_plain, date_opened, customer_no, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, available_balance, available_balance_plain, pocket_wallet_balance, pocket_wallet_balance_plain, hold_amount_balance, hold_amount_balance_plain, transit_trxn_balance, transit_trxn_balance_plain, wallet_limit, sys_acct_lock, overdraft_balance, overdraft_balance_plain, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_debit_plain, daily_cummulative_credit, daily_cummulative_credit_plain, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8703 (class 0 OID 46703)
-- Dependencies: 399
-- Data for Name: merchant_user_device_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_user_device_sessions (id, profile_type_code, request_partner_code, request_app_code, request_user_id, request_user_type, unique_cust_id, profile_sys_id, customer_ref, ext_customer_ref, is_user_profile_active, bearer_token, scheme_code, request_channel_id, request_channel, device_type, device_os, device_name, is_active_session, era_id, consecutive_login_retries, last_app_request_key, device_id, notification_token, last_login_date, log_session_id) FROM stdin;
\.


--
-- TOC entry 8685 (class 0 OID 38071)
-- Dependencies: 381
-- Data for Name: merchant_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_users (id, profile_detail_id, username, user_password, first_name, last_name, email, image_url, is_active, red_flagged, lang_key, activation_key, reset_key, reset_date, created_by, created_date, last_modified_by, last_modified_date, default_encry_key, key_program_control, encypted_last_key, single_sign_on, status, login_count, pin, dpin, dpin_operator, dpin_operand, default_scheme_code, current_session_scheme_code, deactivate_code, deactivate_reason, customer_no, authourization_dpin_operand) FROM stdin;
\.


--
-- TOC entry 8689 (class 0 OID 38146)
-- Dependencies: 385
-- Data for Name: merchant_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_wallets (id, wallet_accnt_no, current_balance, date_opened, customer_no, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, wallet_balance, pocket_wallet_balance, hold_amount_balance, transit_trxn_balance, pocket_wallet_reversal_bal, wallet_limit, sys_acct_lock, overdraft_balance, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_credit, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8717 (class 0 OID 55669)
-- Dependencies: 413
-- Data for Name: node_in_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.node_in_sessions (id, node_index, node_name, start_in_session_id, end_in_session_id, start_in_session_date, start_in_session_time, end_in_session_date, end_in_session_time) FROM stdin;
\.


--
-- TOC entry 8719 (class 0 OID 55677)
-- Dependencies: 415
-- Data for Name: node_out_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.node_out_sessions (id, node_index, node_name, start_out_session_id, end_out_session_id, start_out_session_date, start_out_session_time, end_out_session_date, end_out_session_time, is_outof_service) FROM stdin;
\.


--
-- TOC entry 8522 (class 0 OID 18957)
-- Dependencies: 218
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nodes (node_id, node_group_code, this_node, wallet_acct_lower_bound, wallet_acct_upper_bound, node_ip_address, node_fail_over_ip, is_active) FROM stdin;
\.


--
-- TOC entry 8571 (class 0 OID 34322)
-- Dependencies: 267
-- Data for Name: operational_charges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operational_charges (id, scheme_code, charge_name, wallet_account_type_id, wallet_accnt_num, public_ledger_biller_id, wallet_name, date_opened, charge_trxn, applicable_trxn_type, all_trxn_bands_rate, use_percentage, lower_trxn_band_perct_or_fixedvalue, medium_trxn_band_perct_or_fixedvalue, upper_trxn_band_perct_or_fixedvalue, last_modified_date, is_active, charge_code, make_scheme_incur_customer_charges) FROM stdin;
\.


--
-- TOC entry 8529 (class 0 OID 19853)
-- Dependencies: 225
-- Data for Name: operational_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operational_wallets (id, scheme_code, wallet_account_type_id, wallet_accnt_num, biller_id, public_ledger_biller_id, wallet_name, balance_amount, date_opened, charge_trxn, applicable_trxn_type, share_accrued, use_percentage, lower_trxn_band_perct_or_fixedvalue, medium_trxn_band_perct_or_fixedvalue, upper_trxn_band_perct_or_fixedvalue, last_modified_date, is_active, virtual_nuban, nuban_bank_code, nuban_account_no, hold_amount, partner_code) FROM stdin;
\.


--
-- TOC entry 8814 (class 0 OID 97497)
-- Dependencies: 511
-- Data for Name: partner_access_blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_access_blacklist (ip_address, user_full_name, user_mobile_num, is_allowed) FROM stdin;
\.


--
-- TOC entry 8813 (class 0 OID 97488)
-- Dependencies: 510
-- Data for Name: partner_access_whitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_access_whitelist (ip_address, partner_full_name, partner_mobile_num, is_active) FROM stdin;
\.


--
-- TOC entry 8735 (class 0 OID 72505)
-- Dependencies: 431
-- Data for Name: partner_loan_tenures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_loan_tenures (id, company_id, partner_code, application_code, loan_name, lender_code, minimum_amount, maximum_amount, minimum_duration, maximum_duration, tenure_type, loan_type, loan_type_id, service_type, rate, is_active) FROM stdin;
\.


--
-- TOC entry 8733 (class 0 OID 72493)
-- Dependencies: 429
-- Data for Name: partner_loan_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_loan_types (id, company_id, partner_code, application_code, loan_name, loan_description, loan_type, short_name, is_active) FROM stdin;
\.


--
-- TOC entry 8711 (class 0 OID 46837)
-- Dependencies: 407
-- Data for Name: partner_user_device_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_user_device_sessions (id, profile_type_code, request_partner_code, request_app_code, request_user_id, request_user_type, unique_cust_id, profile_sys_id, customer_ref, ext_customer_ref, is_user_profile_active, bearer_token, scheme_code, request_channel_id, request_channel, device_type, device_os, device_name, is_active_session, era_id, consecutive_login_retries, last_app_request_key, device_id, notification_token, last_login_date, log_session_id) FROM stdin;
\.


--
-- TOC entry 8745 (class 0 OID 84231)
-- Dependencies: 441
-- Data for Name: pending_bank_credit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8747 (class 0 OID 84280)
-- Dependencies: 443
-- Data for Name: pending_bank_credit_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_0 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8749 (class 0 OID 84380)
-- Dependencies: 445
-- Data for Name: pending_bank_credit_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_1 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8751 (class 0 OID 84478)
-- Dependencies: 447
-- Data for Name: pending_bank_credit_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_2 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8753 (class 0 OID 84527)
-- Dependencies: 449
-- Data for Name: pending_bank_credit_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_3 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8755 (class 0 OID 84576)
-- Dependencies: 451
-- Data for Name: pending_bank_credit_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_4 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8763 (class 0 OID 85515)
-- Dependencies: 459
-- Data for Name: pending_node_credit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8761 (class 0 OID 85466)
-- Dependencies: 457
-- Data for Name: pending_node_credit_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_0 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8759 (class 0 OID 85417)
-- Dependencies: 455
-- Data for Name: pending_node_credit_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_1 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8757 (class 0 OID 85368)
-- Dependencies: 453
-- Data for Name: pending_node_credit_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_2 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8767 (class 0 OID 85615)
-- Dependencies: 463
-- Data for Name: pending_node_credit_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_3 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8765 (class 0 OID 85566)
-- Dependencies: 461
-- Data for Name: pending_node_credit_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_4 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8769 (class 0 OID 86245)
-- Dependencies: 465
-- Data for Name: pending_process_trxn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8779 (class 0 OID 86663)
-- Dependencies: 475
-- Data for Name: pending_process_trxn_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_0 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8771 (class 0 OID 86385)
-- Dependencies: 467
-- Data for Name: pending_process_trxn_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_1 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8773 (class 0 OID 86454)
-- Dependencies: 469
-- Data for Name: pending_process_trxn_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_2 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8775 (class 0 OID 86525)
-- Dependencies: 471
-- Data for Name: pending_process_trxn_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_3 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8777 (class 0 OID 86594)
-- Dependencies: 473
-- Data for Name: pending_process_trxn_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_4 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8679 (class 0 OID 37917)
-- Dependencies: 375
-- Data for Name: pos_profile_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pos_profile_details (id, user_sys_id, profile_id, first_name, middle_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, city, state, country, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, email_otp, email_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, loc_longitude, loc_latitude, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8653 (class 0 OID 37197)
-- Dependencies: 349
-- Data for Name: pos_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pos_profiles (id, user_sys_id, profile_detail_sys_id, profile_id, profile_type_code, customer_no, mobile_number, scheme_code, default_encry_key, key_program_control, encypted_last_key, is_active, red_flagged, kyc_trxn_limit, kyc_daily_limit, consecutive_login_retries, consecutive_pin_retries, deactivate_code, deactivate_reason) FROM stdin;
\.


--
-- TOC entry 8799 (class 0 OID 88032)
-- Dependencies: 495
-- Data for Name: pos_swift_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pos_swift_wallets (id, wallet_accnt_no, book_balance, book_balance_plain, date_opened, customer_no, customer_ref, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, available_balance, available_balance_plain, pocket_wallet_balance, pocket_wallet_balance_plain, hold_amount_balance, hold_amount_balance_plain, transit_trxn_balance, transit_trxn_balance_plain, wallet_limit, sys_acct_lock, overdraft_balance, overdraft_balance_plain, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_debit_plain, daily_cummulative_credit, daily_cummulative_credit_plain, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8705 (class 0 OID 46736)
-- Dependencies: 401
-- Data for Name: pos_user_device_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pos_user_device_sessions (id, profile_type_code, request_partner_code, request_app_code, request_user_id, request_user_type, unique_cust_id, profile_sys_id, customer_ref, ext_customer_ref, is_user_profile_active, bearer_token, scheme_code, request_channel_id, request_channel, device_type, device_os, device_name, is_active_session, era_id, consecutive_login_retries, last_app_request_key, device_id, notification_token, last_login_date, log_session_id) FROM stdin;
\.


--
-- TOC entry 8644 (class 0 OID 36666)
-- Dependencies: 340
-- Data for Name: pos_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pos_users (id, profile_sys_id, profile_id, username, user_password, first_name, last_name, email, image_url, is_active, red_flagged, lang_key, activation_key, reset_key, reset_date, created_by, created_date, last_modified_by, last_modified_date, default_encry_key, key_program_control, encypted_last_key, single_sign_on, status, login_count, pin, dpin, dpin_operator, dpin_operand, default_scheme_code, current_session_scheme_code, deactivate_code, deactivate_reason, authourization_dpin_operand) FROM stdin;
\.


--
-- TOC entry 8793 (class 0 OID 87786)
-- Dependencies: 489
-- Data for Name: pos_wallet_instance_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pos_wallet_instance_refs (id, wallet_accnt_no, reference_count, update_test_field) FROM stdin;
\.


--
-- TOC entry 8645 (class 0 OID 36842)
-- Dependencies: 341
-- Data for Name: pos_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pos_wallets (id, wallet_accnt_no, current_balance, date_opened, customer_no, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, wallet_balance, pocket_wallet_balance, hold_amount_balance, transit_trxn_balance, pocket_wallet_reversal_bal, wallet_limit, sys_acct_lock, overdraft_balance, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_credit, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8696 (class 0 OID 46618)
-- Dependencies: 392
-- Data for Name: product_scheme_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_scheme_promotions (id, product_scheme_code, reward_amount, is_active, target_trxn_count) FROM stdin;
\.


--
-- TOC entry 8697 (class 0 OID 46627)
-- Dependencies: 393
-- Data for Name: product_scheme_promotions_recycle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_scheme_promotions_recycle (id, product_scheme_code, reward_amount, is_active, target_trxn_count) FROM stdin;
\.


--
-- TOC entry 8695 (class 0 OID 46591)
-- Dependencies: 391
-- Data for Name: product_scheme_recycle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_scheme_recycle (id, product_name, scheme_code, era_id, use_scheme_key, pool_bank_code, pool_account_number, pool_account_balance, pool_account_balance_plain, scheme_encry_key, last_trxn_bank_posting_date, last_trxn_bank_posting_time, scheme_create_date, api_key, secret_key, callback_url, is_active, promotions, make_scheme_incur_customer_charges) FROM stdin;
\.


--
-- TOC entry 8693 (class 0 OID 46563)
-- Dependencies: 389
-- Data for Name: product_schemes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_schemes (id, product_name, scheme_code, era_id, use_scheme_key, pool_bank_code, pool_account_number, pool_account_balance, pool_account_balance_plain, scheme_encry_key, last_trxn_bank_posting_date, last_trxn_bank_posting_time, scheme_create_date, api_key, secret_key, callback_url, is_active, promotions, make_scheme_incur_customer_charges) FROM stdin;
\.


--
-- TOC entry 8523 (class 0 OID 19074)
-- Dependencies: 219
-- Data for Name: profile_biometrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_biometrics (id, profile_id, email, primary_mobile, facial_picture, my_device_only) FROM stdin;
\.


--
-- TOC entry 8671 (class 0 OID 37709)
-- Dependencies: 367
-- Data for Name: profile_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_details (id, user_sys_id, profile_id, first_name, middle_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, city, state, country, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, email_otp, email_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, loc_longitude, loc_latitude, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8540 (class 0 OID 23907)
-- Dependencies: 236
-- Data for Name: profile_details_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_details_model (id, user_sys_id, profile_id, first_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, mail_otp, mail_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8524 (class 0 OID 19084)
-- Dependencies: 220
-- Data for Name: profile_display_picture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_display_picture (id, profile_id, email, primary_mobile, display_picture) FROM stdin;
\.


--
-- TOC entry 8536 (class 0 OID 22223)
-- Dependencies: 232
-- Data for Name: profile_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_types (id, profile_type_code, profile_type) FROM stdin;
1	CUTR1	Customer Tier 1 Profile                           
2	CU   	Customer Profile                                  
3	SA   	Super Agent Profile                               
4	AG   	Agent Profile                                     
5	TEL  	Teller Profile                                    
6	SP   	Sales Point                                       
7	ADM  	Administrative Personel                           
\.


--
-- TOC entry 8737 (class 0 OID 72559)
-- Dependencies: 433
-- Data for Name: request_item_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_item_batches (id, company_id, application_code, approval_workflow_id, item_type_id, total_item_count, total_item_count_in_words, total_item_count_in_words_hash, is_currently_been_reviewed, current_reviewer_user_id, is_approved_final, approve_comment, reject_reason, request_batch_date, request_batch_time, approved_level_1_date, approved_level_1_time, approved_level_2_date, approved_level_2_time, approved_level_3_date, approved_level_3_time) FROM stdin;
\.


--
-- TOC entry 8785 (class 0 OID 86947)
-- Dependencies: 481
-- Data for Name: request_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_log (id, request_id, request_company_id, request_partner_code, request_application_code, request_type, request_hash, request_json, is_request_parsed_ok, request_time, request_date, response_sent, is_successfully_processed) FROM stdin;
\.


--
-- TOC entry 8787 (class 0 OID 87035)
-- Dependencies: 483
-- Data for Name: response_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.response_log (id, request_id, response_company_id, response_partner_code, response_application_code, response_direction, response_type, response_hash, response_json, response_time, response_date, is_successfully_processed) FROM stdin;
\.


--
-- TOC entry 8624 (class 0 OID 36080)
-- Dependencies: 320
-- Data for Name: sales_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_inventory (id, user_sys_id, profile_sys_id, customer_no, profile_type_code, profile_id, scheme_code, item_code, item_name, available_units, cost_price, sales_price, ency_cost_price, encry_sales_price, purchases_this_week, sales_this_week, purchases_this_month, sales_this_month, purchases_ytd, sales_ytd, margin, encry_margin, last_purchase_date, last_purchase_time, last_sales_date, last_sales_time) FROM stdin;
\.


--
-- TOC entry 8628 (class 0 OID 36110)
-- Dependencies: 324
-- Data for Name: sales_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_items (id, user_sys_id, profile_sys_id, customer_no, profile_type_code, profile_id, scheme_code, item_code, item_name, item_description, supplier_code, supplier_phone, supplier_email, supplier_whatsapp, last_purchase_price, ency_last_purchase_price, last_markup, last_purchase_date, last_purchase_time, last_sales_date, last_sales_time) FROM stdin;
\.


--
-- TOC entry 8570 (class 0 OID 34225)
-- Dependencies: 266
-- Data for Name: scheme_promotion_recycle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scheme_promotion_recycle (id, scheme_code, reward_amount, is_active, target_trxn_count) FROM stdin;
\.


--
-- TOC entry 8567 (class 0 OID 34189)
-- Dependencies: 263
-- Data for Name: scheme_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scheme_promotions (id, scheme_code, reward_amount, is_active, target_trxn_count) FROM stdin;
1	ABG_Scheme  	2000.00	t	0
\.


--
-- TOC entry 8569 (class 0 OID 34200)
-- Dependencies: 265
-- Data for Name: scheme_recycle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scheme_recycle (id, scheme_name, scheme_code, era_id, use_scheme_key, pool_bank_code, pool_account_number, pool_account_balance, pool_account_balance_plain, scheme_encry_key, last_trxn_bank_posting_date, last_trxn_bank_posting_time, scheme_create_date, api_key, secret_key, callback_url, is_active, promotions) FROM stdin;
\.


--
-- TOC entry 8534 (class 0 OID 20379)
-- Dependencies: 230
-- Data for Name: schemes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schemes (id, scheme_name, scheme_code, era_id, use_scheme_key, pool_bank_code, pool_account_number, pool_account_balance, pool_account_balance_plain, scheme_encry_key, last_trxn_bank_posting_date, last_trxn_bank_posting_time, scheme_create_date, api_key, secret_key, callback_url, is_active, promotions, make_scheme_incur_customer_charges) FROM stdin;
1	ABG_Scheme                                                            	AXTUVRDG    	1	t	111	8924472472     	nxicaumwuiuev                                               	0.00	dndiehhv                                                    	\N	\N	\N	incueeqwce                                                  	mmcsahidda                                                  	no_callback                                                 	t	0	f
2	CDA_Scheme                                                            	LIEDNDJS    	1	t	222	9842848244     	midhhdadada                                                 	0.00	mhdahaddh                                                   	\N	\N	\N	nciwbwsd                                                    	pljdjadd                                                    	new_callback                                                	t	0	f
\.


--
-- TOC entry 8538 (class 0 OID 22319)
-- Dependencies: 234
-- Data for Name: service_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_channels (id, channel_id, channel_code, is_active, channel_name) FROM stdin;
1	T2L5K	WEB                           	t	Web Interface                                                                   
2	Z8N3M	Mobile                        	t	Mobile Phone                                                                    
3	R7GNU	ADMIN                         	t	Administrative Dashboard                                                        
4	S2P0L	P-ADMIN                       	t	Partner Administrative Dashboard                                                
5	MI1XQ	USSD                          	t	USSD                                                                            
6	V9WJB	API-Integration               	t	External Integration API Call                                                   
7	F0K3R	Test                          	t	Test Call                                                                       
\.


--
-- TOC entry 8520 (class 0 OID 16792)
-- Dependencies: 216
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, service_id, service_reference, service_name, description, status) FROM stdin;
\.


--
-- TOC entry 8677 (class 0 OID 37865)
-- Dependencies: 373
-- Data for Name: super_agent_profile_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_profile_details (id, user_sys_id, profile_id, first_name, middle_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, city, state, country, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, email_otp, email_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, loc_longitude, loc_latitude, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8542 (class 0 OID 23998)
-- Dependencies: 238
-- Data for Name: super_agent_profile_details_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_profile_details_model (id, user_sys_id, profile_id, first_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, mail_otp, mail_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8661 (class 0 OID 37320)
-- Dependencies: 357
-- Data for Name: super_agent_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_profiles (id, user_sys_id, profile_detail_sys_id, profile_id, profile_type_code, customer_no, mobile_number, scheme_code, default_encry_key, key_program_control, encypted_last_key, is_active, red_flaged, kyc_trxn_limit, kyc_daily_limit, consecutive_login_retries, consecutive_pin_retries, deactivate_code, deactivate_reason) FROM stdin;
\.


--
-- TOC entry 8795 (class 0 OID 87800)
-- Dependencies: 491
-- Data for Name: super_agent_swift_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_swift_wallets (id, wallet_accnt_no, book_balance, book_balance_plain, date_opened, customer_no, customer_ref, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, available_balance, available_balance_plain, pocket_wallet_balance, pocket_wallet_balance_plain, hold_amount_balance, hold_amount_balance_plain, transit_trxn_balance, transit_trxn_balance_plain, wallet_limit, sys_acct_lock, overdraft_balance, overdraft_balance_plain, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_debit_plain, daily_cummulative_credit, daily_cummulative_credit_plain, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8707 (class 0 OID 46769)
-- Dependencies: 403
-- Data for Name: super_agent_user_device_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_user_device_sessions (id, profile_type_code, request_partner_code, request_app_code, request_user_id, request_user_type, unique_cust_id, profile_sys_id, customer_ref, ext_customer_ref, is_user_profile_active, bearer_token, scheme_code, request_channel_id, request_channel, device_type, device_os, device_name, is_active_session, era_id, consecutive_login_retries, last_app_request_key, device_id, notification_token, last_login_date, log_session_id) FROM stdin;
\.


--
-- TOC entry 8551 (class 0 OID 24348)
-- Dependencies: 247
-- Data for Name: super_agent_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_users (id, profile_detail_id, username, user_password, first_name, last_name, email, image_url, is_active, red_flagged, lang_key, activation_key, reset_key, reset_date, created_by, created_date, last_modified_by, last_modified_date, default_encry_key, key_program_control, encypted_last_key, single_sign_on, status, login_count, pin, dpin, dpin_operator, dpin_operand, default_scheme_code, current_session_scheme_code, deactivate_code, deactivate_reason, customer_no, authourization_dpin_operand) FROM stdin;
\.


--
-- TOC entry 8548 (class 0 OID 24296)
-- Dependencies: 244
-- Data for Name: super_agent_users_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_users_model (id, profile_sys_id, profile_id, username, user_password, first_name, last_name, email, image_url, is_active, red_flag, lang_key, activation_key, reset_key, reset_date, created_by, created_date, last_modified_by, last_modified_date, default_encry_key, key_program_control, encypted_last_key, single_sign_on, status, login_count, login_retries, pin, dpin, dpin_operator, dpin_operand, default_scheme_id, selected_scheme_id, kyc_trxn_limit, kyc_daily_limit, consecutive_login_retries, consecutive_pin_use_retries, deactivate_code, deactivate_reason) FROM stdin;
\.


--
-- TOC entry 8790 (class 0 OID 87765)
-- Dependencies: 486
-- Data for Name: super_agent_wallet_instance_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_wallet_instance_refs (id, wallet_accnt_no, reference_count, update_test_field) FROM stdin;
\.


--
-- TOC entry 8646 (class 0 OID 36880)
-- Dependencies: 342
-- Data for Name: super_agent_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_agent_wallets (id, wallet_accnt_no, current_balance, date_opened, customer_no, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, wallet_balance, pocket_wallet_balance, hold_amount_balance, transit_trxn_balance, pocket_wallet_reversal_bal, wallet_limit, sys_acct_lock, overdraft_balance, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_credit, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8797 (class 0 OID 87940)
-- Dependencies: 493
-- Data for Name: super_customer_swift_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_customer_swift_wallets (id, wallet_accnt_no, book_balance, book_balance_plain, date_opened, customer_no, customer_ref, profile_type_code, scheme_code, wallet_account_type_id, profile_id, wallet_name, last_modified_date, status, parent_id, virtual_nuban, nuban_bank_code, nuban_account_no, tracking_ref, currency_code, available_balance, available_balance_plain, pocket_wallet_balance, pocket_wallet_balance_plain, hold_amount_balance, hold_amount_balance_plain, transit_trxn_balance, transit_trxn_balance_plain, wallet_limit, sys_acct_lock, overdraft_balance, overdraft_balance_plain, pending_debit_count, pending_credit_count, debit_count, credit_count, daily_cummulative_debit, daily_cummulative_debit_plain, daily_cummulative_credit, daily_cummulative_credit_plain, last_credit_trxn_serial, last_debit_trxn_serial, last_debit_trxn_date, last_credit_trxn_date, sys_acct_lock_code) FROM stdin;
\.


--
-- TOC entry 8532 (class 0 OID 20338)
-- Dependencies: 228
-- Data for Name: sys_app_key_era; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_app_key_era (id, system_key, app_key, era_name) FROM stdin;
1	nnhafafafas                                       	8cffahch33d                                       	Test Era II                                       
2	ljhd2h2h42h4                                      	mfs8fs8n3b8                                       	DaisyErasmei                                      
\.


--
-- TOC entry 8527 (class 0 OID 19376)
-- Dependencies: 223
-- Data for Name: sys_key_store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sys_key_store (id, key_name, key_value, description) FROM stdin;
1	app_key        	8FT26K9Z2QR5X7N0C1LF	Mobile App initialization encryption key          
2	system_key     	J7S4H9G2K0V3Z7N6R2T9	System Data saving  encryption key                
\.


--
-- TOC entry 8564 (class 0 OID 24917)
-- Dependencies: 260
-- Data for Name: system_boundary_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_boundary_log (id, profile_type_code, unique_cust_id, request_id, scheme_code, is_active_session, channel_id, request_in, request_in_json, log_session_id, time_of_request, request_date, user_action, trxn_type, trxn_reference, response_out, external_reference, response_out_json, reponse_time, response_date) FROM stdin;
\.


--
-- TOC entry 8566 (class 0 OID 25686)
-- Dependencies: 262
-- Data for Name: system_log_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_log_summary (id, profile_type_code, unique_cust_id, request_id, request_date, time_of_request, scheme_code, is_request_in, is_active_session, channel_id, user_action, rqst_op_code, rqst_op_status, trxn_type, trxn_reference, error_msg, external_reference, bearer_token, is_response_out, log_session_id, response_date, reponse_time) FROM stdin;
\.


--
-- TOC entry 8788 (class 0 OID 87485)
-- Dependencies: 484
-- Data for Name: test_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test_wallets (id, wallet_accnt_no, current_balance, current_balance_plain, sys_acct_lock_code) FROM stdin;
1	674248242           	_                                                                                                                                                               	8532.00	00
2	937484147           	_                                                                                                                                                               	4102.00	00
3	748272742           	_                                                                                                                                                               	9632.00	00
1	674248242           	_                                                                                                                                                               	8532.00	00
2	937484147           	_                                                                                                                                                               	4102.00	00
3	748272742           	_                                                                                                                                                               	9632.00	00
9	349247254           	_                                                                                                                                                               	111.33	00
4	349247254           	ww0EBwMCozGNzM2ZOqV30jgB8Fwk8zpveQQB9ke+TCxXRpwhafnRv2zXeMHzUOFtkE5gOtCZnUag\nt9sqEv7XQ3moIOT0xhB8hA==                                                           	5137.00	00
\.


--
-- TOC entry 8743 (class 0 OID 73381)
-- Dependencies: 439
-- Data for Name: transaction_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_history (id, partner_code, scheme_code, processor_node_name, processor_node_ip, trxn_reference, processor_reference, processor_auth_key_hash, trxn_event, trxn_type, trxn_mode, currency_name, currency_code, currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_name, sender_wallet, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, trxn_process_code, trxn_status_code, trxn_status, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, narration, is_finalized, update_check) FROM stdin;
\.


--
-- TOC entry 8741 (class 0 OID 72639)
-- Dependencies: 437
-- Data for Name: transaction_register; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_register (id, wallet_id, wallet_accnt_number, customer_reference, current_column_ref, trxn_date_0, trxn_time_0, trxn_post_type_0, trxn_post_function_0, trxn_amount_0, total_trxn_fee_0, auth_user_id_0, auth_factor_1_key_hash_0, reciever_bank_type_0, reciever_accnt_num_0, reciever_bank_code_0, trxn_date_1, trxn_time_1, trxn_post_type_1, trxn_post_function_1, trxn_amount_1, total_trxn_fee_1, auth_user_id_1, auth_factor_1_key_hash_1, auth_factor_2_key_hash_1, reciever_bank_type_1, reciever_accnt_num_1, reciever_bank_code_1, trxn_date_2, trxn_time_2, trxn_post_type_2, trxn_post_function_2, trxn_amount_2, total_trxn_fee_2, auth_user_id_2, auth_factor_1_key_hash_2, auth_factor_2_key_hash_2, reciever_bank_type_2, reciever_accnt_num_2, reciever_bank_code_2, trxn_date_3, trxn_time_3, trxn_post_type_3, trxn_post_function_3, trxn_amount_3, total_trxn_fee_3, auth_user_id_3, auth_factor_1_key_hash_3, auth_factor_2_key_hash_3, reciever_bank_type_3, reciever_accnt_num_3, reciever_bank_code_3, trxn_date_4, trxn_time_4, trxn_post_type_4, trxn_post_function_4, trxn_amount_4, total_trxn_fee_4, auth_user_id_4, auth_factor_1_key_hash_4, auth_factor_2_key_hash_4, reciever_bank_type_4, reciever_accnt_num_4, reciever_bank_code_4, trxn_date_5, trxn_time_5, trxn_post_type_5, trxn_post_function_5, trxn_amount_5, total_trxn_fee_5, auth_user_id_5, auth_factor_1_key_hash_5, auth_factor_2_key_hash_5, reciever_bank_type_5, reciever_accnt_num_5, reciever_bank_code_5, trxn_date_6, trxn_time_6, trxn_post_type_6, trxn_post_function_6, trxn_amount_6, total_trxn_fee_6, auth_user_id_6, auth_factor_1_key_hash_6, auth_factor_2_key_hash_6, reciever_bank_type_6, reciever_accnt_num_6, reciever_bank_code_6, trxn_date_7, trxn_time_7, trxn_post_type_7, trxn_post_function_7, trxn_amount_7, total_trxn_fee_7, auth_user_id_7, auth_factor_1_key_hash_7, auth_factor_2_key_hash_7, reciever_bank_type_7, reciever_accnt_num_7, reciever_bank_code_7, trxn_date_8, trxn_time_8, trxn_post_type_8, trxn_post_function_8, trxn_amount_8, total_trxn_fee_8, auth_user_id_8, auth_factor_1_key_hash_8, auth_factor_2_key_hash_8, reciever_bank_type_8, reciever_accnt_num_8, reciever_bank_code_8, trxn_date_9, trxn_time_9, trxn_post_type_9, trxn_post_function_9, trxn_amount_9, total_trxn_fee_9, auth_user_id_9, auth_factor_1_key_hash_9, auth_factor_2_key_hash_9, reciever_bank_type_9, reciever_accnt_num_9, reciever_bank_code_9) FROM stdin;
\.


--
-- TOC entry 8572 (class 0 OID 34372)
-- Dependencies: 268
-- Data for Name: trxn_bands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trxn_bands (id, default_trxn_band, is_active, scheme_code, trxn_band_code, applicable_trxn_type, lower_limit, upper_limit) FROM stdin;
1	t	t	000         	min         	-                   	0.00	500.99
2	t	t	000         	med         	-                   	5001.00	500000.99
5	f	f	111         	med         	all                 	5001.00	500000.99
4	f	f	111         	min         	all                 	0.00	500.99
3	t	t	000         	max         	-                   	500001.00	2000000000000.99
6	f	f	111         	max         	all                 	500001.00	2000000000000.99
\.


--
-- TOC entry 8556 (class 0 OID 24741)
-- Dependencies: 252
-- Data for Name: u_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.u_p (id, user_sys_id, login_retries, is_active) FROM stdin;
1	1	0	t
\.


--
-- TOC entry 8558 (class 0 OID 24751)
-- Dependencies: 254
-- Data for Name: u_s; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.u_s (id, username) FROM stdin;
1	myusername          
\.


--
-- TOC entry 8560 (class 0 OID 24780)
-- Dependencies: 256
-- Data for Name: unique_bearer_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unique_bearer_tokens (id, unique_bearer_token, currently_in_use, expired) FROM stdin;
\.


--
-- TOC entry 8562 (class 0 OID 24816)
-- Dependencies: 258
-- Data for Name: unique_customer_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unique_customer_keys (id, unique_cust_id, unique_customer_id, assigned_to_profile) FROM stdin;
\.


--
-- TOC entry 8526 (class 0 OID 19108)
-- Dependencies: 222
-- Data for Name: user_deactivation_defn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_deactivation_defn (id, deactivate_code, deactivate_reason) FROM stdin;
\.


--
-- TOC entry 8669 (class 0 OID 37657)
-- Dependencies: 365
-- Data for Name: user_profile_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile_details (id, user_sys_id, profile_id, first_name, middle_name, last_name, email, primary_mobile, mobile_numbers, red_flag, gender, date_of_birth, address, city, state, country, photo_id_ref, photo_content_type, bvn, valid_id_ref, user_id, primary_profile_type_id, profile_type_id_1, profile_type_id_2, kyc_id, device_notification_token, mobile_otp, mobile_otp_timeout, email_otp, email_otp_timeout, created_by, created_date, last_modified_by, last_modified_date, approval_group_id, security_question, security_answer, loc_longitude, loc_latitude, awarded_bonus, computed_bonus, actual_bonus) FROM stdin;
\.


--
-- TOC entry 8805 (class 0 OID 96855)
-- Dependencies: 502
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_sessions (ip_address, profile_type_code, customer_ref, partner_code, scheme_code, request_user_type, request_channel, old_request_key, new_request_key, expiry_time, is_active_session, notification_token, consecutive_login_retries, last_login_date, last_login_time) FROM stdin;
\.


--
-- TOC entry 8545 (class 0 OID 24137)
-- Dependencies: 241
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, profile_id, username, user_password, first_name, last_name, email, image_url, is_active, red_flagged, lang_key, activation_key, reset_key, reset_date, created_by, created_date, last_modified_by, last_modified_date, default_encry_key, key_program_control, encypted_last_key, single_sign_on, status, login_count, authourization_pin, authourization_dpin, authourization_dpin_operator, dpin_operand, default_scheme_code, current_session_scheme_code, deactivate_code, deactivate_reason, customer_no, authourization_dpin_operand) FROM stdin;
\.


--
-- TOC entry 8525 (class 0 OID 19102)
-- Dependencies: 221
-- Data for Name: wallet_acct_lock_defn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_acct_lock_defn (id, lock_code, lock_reason) FROM stdin;
\.


--
-- TOC entry 8781 (class 0 OID 86732)
-- Dependencies: 477
-- Data for Name: wallet_debit_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_debit_history (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, debit_amount, total_debit_fee_amount, total_debit_amount, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, sender_bank_code, sender_wallet_name, sender_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 8715 (class 0 OID 55112)
-- Dependencies: 411
-- Data for Name: wallet_register; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_register (id, wallet_id, wallet_accnt_number, customer_reference, current_column_ref, balance_0_change_date, balance_0_change_time, balance_0, balance_1_change_date, balance_1_change_time, balance_1, balance_2_change_date, balance_2_change_time, balance_2, balance_3_change_date, balance_3_change_time, balance_3, balance_4_change_date, balance_4_change_time, balance_4, balance_5_change_date, balance_5_change_time, balance_5, balance_6_change_date, balance_6_change_time, balance_6, balance_7_change_date, balance_7_change_time, balance_7, balance_8_change_date, balance_8_change_time, balance_8, balance_9_change_date, balance_9_change_time, balance_9) FROM stdin;
\.


--
-- TOC entry 8597 (class 0 OID 35231)
-- Dependencies: 293
-- Data for Name: wallet_to_bank_trxn_log_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_to_bank_trxn_log_0 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8599 (class 0 OID 35280)
-- Dependencies: 295
-- Data for Name: wallet_to_bank_trxn_log_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_to_bank_trxn_log_1 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8601 (class 0 OID 35330)
-- Dependencies: 297
-- Data for Name: wallet_to_bank_trxn_log_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_to_bank_trxn_log_2 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8603 (class 0 OID 35379)
-- Dependencies: 299
-- Data for Name: wallet_to_bank_trxn_log_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_to_bank_trxn_log_3 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8605 (class 0 OID 35428)
-- Dependencies: 301
-- Data for Name: wallet_to_bank_trxn_log_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_to_bank_trxn_log_4 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8607 (class 0 OID 35477)
-- Dependencies: 303
-- Data for Name: wallet_to_bank_trxn_log_5; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_to_bank_trxn_log_5 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_no, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_no, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 8918 (class 0 OID 0)
-- Dependencies: 478
-- Name: account_credit_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_credit_history_id_seq', 1, false);


--
-- TOC entry 8919 (class 0 OID 0)
-- Dependencies: 404
-- Name: admin_user_device_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_user_device_sessions_id_seq', 1, false);


--
-- TOC entry 8920 (class 0 OID 0)
-- Dependencies: 370
-- Name: agent_profile_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_profile_details_id_seq', 1, false);


--
-- TOC entry 8921 (class 0 OID 0)
-- Dependencies: 350
-- Name: agent_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_profiles_id_seq', 1, false);


--
-- TOC entry 8922 (class 0 OID 0)
-- Dependencies: 352
-- Name: agent_profiles_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_profiles_profile_sys_id_seq', 1, false);


--
-- TOC entry 8923 (class 0 OID 0)
-- Dependencies: 351
-- Name: agent_profiles_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_profiles_user_sys_id_seq', 1, false);


--
-- TOC entry 8924 (class 0 OID 0)
-- Dependencies: 394
-- Name: agent_user_device_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_user_device_sessions_id_seq', 1, false);


--
-- TOC entry 8925 (class 0 OID 0)
-- Dependencies: 248
-- Name: agent_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_users_id_seq', 1, false);


--
-- TOC entry 8926 (class 0 OID 0)
-- Dependencies: 249
-- Name: agent_users_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_users_profile_sys_id_seq', 1, false);


--
-- TOC entry 8927 (class 0 OID 0)
-- Dependencies: 420
-- Name: approval_item_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_item_groups_id_seq', 1, false);


--
-- TOC entry 8928 (class 0 OID 0)
-- Dependencies: 416
-- Name: approval_item_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_item_types_id_seq', 1, false);


--
-- TOC entry 8929 (class 0 OID 0)
-- Dependencies: 434
-- Name: approval_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_items_id_seq', 1, false);


--
-- TOC entry 8930 (class 0 OID 0)
-- Dependencies: 418
-- Name: approval_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_requests_id_seq', 1, false);


--
-- TOC entry 8931 (class 0 OID 0)
-- Dependencies: 426
-- Name: approval_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_routes_id_seq', 1, false);


--
-- TOC entry 8932 (class 0 OID 0)
-- Dependencies: 422
-- Name: approval_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_user_groups_id_seq', 1, false);


--
-- TOC entry 8933 (class 0 OID 0)
-- Dependencies: 424
-- Name: approval_workflow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_workflow_id_seq', 1, false);


--
-- TOC entry 8934 (class 0 OID 0)
-- Dependencies: 213
-- Name: billing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billing_id_seq', 1, false);


--
-- TOC entry 8935 (class 0 OID 0)
-- Dependencies: 368
-- Name: customer_profile_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_profile_details_id_seq', 1, false);


--
-- TOC entry 8936 (class 0 OID 0)
-- Dependencies: 497
-- Name: customer_request_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_request_security_id_seq', 1, false);


--
-- TOC entry 8937 (class 0 OID 0)
-- Dependencies: 378
-- Name: customer_tier_1_profile_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tier_1_profile_details_id_seq', 1, false);


--
-- TOC entry 8938 (class 0 OID 0)
-- Dependencies: 358
-- Name: customer_tier_1_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tier_1_profiles_id_seq', 1, false);


--
-- TOC entry 8939 (class 0 OID 0)
-- Dependencies: 360
-- Name: customer_tier_1_profiles_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tier_1_profiles_profile_sys_id_seq', 1, false);


--
-- TOC entry 8940 (class 0 OID 0)
-- Dependencies: 359
-- Name: customer_tier_1_profiles_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tier_1_profiles_user_sys_id_seq', 1, false);


--
-- TOC entry 8941 (class 0 OID 0)
-- Dependencies: 408
-- Name: customer_tier_1_user_device_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tier_1_user_device_sessions_id_seq', 1, false);


--
-- TOC entry 8942 (class 0 OID 0)
-- Dependencies: 336
-- Name: customer_tier_1_users_customer_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tier_1_users_customer_no_seq', 1, false);


--
-- TOC entry 8943 (class 0 OID 0)
-- Dependencies: 334
-- Name: customer_tier_1_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tier_1_users_id_seq', 1, false);


--
-- TOC entry 8944 (class 0 OID 0)
-- Dependencies: 335
-- Name: customer_tier_1_users_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tier_1_users_profile_sys_id_seq', 1, false);


--
-- TOC entry 8945 (class 0 OID 0)
-- Dependencies: 396
-- Name: customer_user_device_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_user_device_sessions_id_seq', 1, false);


--
-- TOC entry 8946 (class 0 OID 0)
-- Dependencies: 386
-- Name: customer_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_users_id_seq', 1, false);


--
-- TOC entry 8947 (class 0 OID 0)
-- Dependencies: 276
-- Name: inter_node_wallet_trxn_log_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inter_node_wallet_trxn_log_0_id_seq', 1, false);


--
-- TOC entry 8948 (class 0 OID 0)
-- Dependencies: 270
-- Name: inter_node_wallet_trxn_log_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inter_node_wallet_trxn_log_1_id_seq', 1, false);


--
-- TOC entry 8949 (class 0 OID 0)
-- Dependencies: 272
-- Name: inter_node_wallet_trxn_log_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inter_node_wallet_trxn_log_2_id_seq', 1, false);


--
-- TOC entry 8950 (class 0 OID 0)
-- Dependencies: 274
-- Name: inter_node_wallet_trxn_log_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inter_node_wallet_trxn_log_3_id_seq', 1, false);


--
-- TOC entry 8951 (class 0 OID 0)
-- Dependencies: 278
-- Name: inter_node_wallet_trxn_log_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inter_node_wallet_trxn_log_4_id_seq', 1, false);


--
-- TOC entry 8952 (class 0 OID 0)
-- Dependencies: 280
-- Name: inter_node_wallet_trxn_log_5_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inter_node_wallet_trxn_log_5_id_seq', 1, false);


--
-- TOC entry 8953 (class 0 OID 0)
-- Dependencies: 290
-- Name: intra_node_wallet_trxn_log_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intra_node_wallet_trxn_log_0_id_seq', 1, false);


--
-- TOC entry 8954 (class 0 OID 0)
-- Dependencies: 288
-- Name: intra_node_wallet_trxn_log_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intra_node_wallet_trxn_log_1_id_seq', 1, false);


--
-- TOC entry 8955 (class 0 OID 0)
-- Dependencies: 286
-- Name: intra_node_wallet_trxn_log_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intra_node_wallet_trxn_log_2_id_seq', 1, false);


--
-- TOC entry 8956 (class 0 OID 0)
-- Dependencies: 284
-- Name: intra_node_wallet_trxn_log_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intra_node_wallet_trxn_log_3_id_seq', 1, false);


--
-- TOC entry 8957 (class 0 OID 0)
-- Dependencies: 282
-- Name: intra_node_wallet_trxn_log_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intra_node_wallet_trxn_log_4_id_seq', 1, false);


--
-- TOC entry 8958 (class 0 OID 0)
-- Dependencies: 304
-- Name: intra_node_wallet_trxn_log_5_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intra_node_wallet_trxn_log_5_id_seq', 1, false);


--
-- TOC entry 8959 (class 0 OID 0)
-- Dependencies: 313
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_id_seq', 1, false);


--
-- TOC entry 8960 (class 0 OID 0)
-- Dependencies: 325
-- Name: inventory_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_items_id_seq', 1, false);


--
-- TOC entry 8961 (class 0 OID 0)
-- Dependencies: 327
-- Name: inventory_items_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_items_profile_sys_id_seq', 1, false);


--
-- TOC entry 8962 (class 0 OID 0)
-- Dependencies: 326
-- Name: inventory_items_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_items_user_sys_id_seq', 1, false);


--
-- TOC entry 8963 (class 0 OID 0)
-- Dependencies: 315
-- Name: inventory_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_profile_sys_id_seq', 1, false);


--
-- TOC entry 8964 (class 0 OID 0)
-- Dependencies: 314
-- Name: inventory_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_user_sys_id_seq', 1, false);


--
-- TOC entry 8965 (class 0 OID 0)
-- Dependencies: 503
-- Name: journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_id_seq', 1, false);


--
-- TOC entry 8966 (class 0 OID 0)
-- Dependencies: 507
-- Name: journal_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_line_id_seq', 1, false);


--
-- TOC entry 8967 (class 0 OID 0)
-- Dependencies: 505
-- Name: journal_line_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_line_summary_id_seq', 1, false);


--
-- TOC entry 8968 (class 0 OID 0)
-- Dependencies: 376
-- Name: merchant_profile_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_profile_details_id_seq', 1, false);


--
-- TOC entry 8969 (class 0 OID 0)
-- Dependencies: 382
-- Name: merchant_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_profiles_id_seq', 1, false);


--
-- TOC entry 8970 (class 0 OID 0)
-- Dependencies: 383
-- Name: merchant_profiles_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_profiles_user_sys_id_seq', 1, false);


--
-- TOC entry 8971 (class 0 OID 0)
-- Dependencies: 398
-- Name: merchant_user_device_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_user_device_sessions_id_seq', 1, false);


--
-- TOC entry 8972 (class 0 OID 0)
-- Dependencies: 380
-- Name: merchant_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merchant_users_id_seq', 1, false);


--
-- TOC entry 8973 (class 0 OID 0)
-- Dependencies: 412
-- Name: node_in_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.node_in_sessions_id_seq', 1, false);


--
-- TOC entry 8974 (class 0 OID 0)
-- Dependencies: 414
-- Name: node_out_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.node_out_sessions_id_seq', 1, false);


--
-- TOC entry 8975 (class 0 OID 0)
-- Dependencies: 430
-- Name: partner_loan_tenures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partner_loan_tenures_id_seq', 1, false);


--
-- TOC entry 8976 (class 0 OID 0)
-- Dependencies: 428
-- Name: partner_loan_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partner_loan_types_id_seq', 1, false);


--
-- TOC entry 8977 (class 0 OID 0)
-- Dependencies: 406
-- Name: partner_user_device_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partner_user_device_sessions_id_seq', 1, false);


--
-- TOC entry 8978 (class 0 OID 0)
-- Dependencies: 442
-- Name: pending_bank_credit_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_0_id_seq', 1, false);


--
-- TOC entry 8979 (class 0 OID 0)
-- Dependencies: 444
-- Name: pending_bank_credit_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_1_id_seq', 1, false);


--
-- TOC entry 8980 (class 0 OID 0)
-- Dependencies: 446
-- Name: pending_bank_credit_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_2_id_seq', 1, false);


--
-- TOC entry 8981 (class 0 OID 0)
-- Dependencies: 448
-- Name: pending_bank_credit_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_3_id_seq', 1, false);


--
-- TOC entry 8982 (class 0 OID 0)
-- Dependencies: 450
-- Name: pending_bank_credit_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_4_id_seq', 1, false);


--
-- TOC entry 8983 (class 0 OID 0)
-- Dependencies: 440
-- Name: pending_bank_credit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_id_seq', 1, false);


--
-- TOC entry 8984 (class 0 OID 0)
-- Dependencies: 456
-- Name: pending_node_credit_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_0_id_seq', 1, false);


--
-- TOC entry 8985 (class 0 OID 0)
-- Dependencies: 454
-- Name: pending_node_credit_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_1_id_seq', 1, false);


--
-- TOC entry 8986 (class 0 OID 0)
-- Dependencies: 452
-- Name: pending_node_credit_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_2_id_seq', 1, false);


--
-- TOC entry 8987 (class 0 OID 0)
-- Dependencies: 462
-- Name: pending_node_credit_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_3_id_seq', 1, false);


--
-- TOC entry 8988 (class 0 OID 0)
-- Dependencies: 460
-- Name: pending_node_credit_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_4_id_seq', 1, false);


--
-- TOC entry 8989 (class 0 OID 0)
-- Dependencies: 458
-- Name: pending_node_credit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_id_seq', 1, false);


--
-- TOC entry 8990 (class 0 OID 0)
-- Dependencies: 474
-- Name: pending_process_trxn_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_0_id_seq', 1, false);


--
-- TOC entry 8991 (class 0 OID 0)
-- Dependencies: 466
-- Name: pending_process_trxn_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_1_id_seq', 1, false);


--
-- TOC entry 8992 (class 0 OID 0)
-- Dependencies: 468
-- Name: pending_process_trxn_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_2_id_seq', 1, false);


--
-- TOC entry 8993 (class 0 OID 0)
-- Dependencies: 470
-- Name: pending_process_trxn_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_3_id_seq', 1, false);


--
-- TOC entry 8994 (class 0 OID 0)
-- Dependencies: 472
-- Name: pending_process_trxn_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_4_id_seq', 1, false);


--
-- TOC entry 8995 (class 0 OID 0)
-- Dependencies: 464
-- Name: pending_process_trxn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_id_seq', 1, false);


--
-- TOC entry 8996 (class 0 OID 0)
-- Dependencies: 374
-- Name: pos_profile_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pos_profile_details_id_seq', 1, false);


--
-- TOC entry 8997 (class 0 OID 0)
-- Dependencies: 346
-- Name: pos_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pos_profiles_id_seq', 1, false);


--
-- TOC entry 8998 (class 0 OID 0)
-- Dependencies: 348
-- Name: pos_profiles_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pos_profiles_profile_sys_id_seq', 1, false);


--
-- TOC entry 8999 (class 0 OID 0)
-- Dependencies: 347
-- Name: pos_profiles_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pos_profiles_user_sys_id_seq', 1, false);


--
-- TOC entry 9000 (class 0 OID 0)
-- Dependencies: 400
-- Name: pos_user_device_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pos_user_device_sessions_id_seq', 1, false);


--
-- TOC entry 9001 (class 0 OID 0)
-- Dependencies: 338
-- Name: pos_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pos_users_id_seq', 1, false);


--
-- TOC entry 9002 (class 0 OID 0)
-- Dependencies: 339
-- Name: pos_users_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pos_users_profile_sys_id_seq', 1, false);


--
-- TOC entry 9003 (class 0 OID 0)
-- Dependencies: 390
-- Name: product_scheme_recycle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_scheme_recycle_id_seq', 1, false);


--
-- TOC entry 9004 (class 0 OID 0)
-- Dependencies: 388
-- Name: product_schemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_schemes_id_seq', 1, false);


--
-- TOC entry 9005 (class 0 OID 0)
-- Dependencies: 366
-- Name: profile_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_details_id_seq', 1, false);


--
-- TOC entry 9006 (class 0 OID 0)
-- Dependencies: 235
-- Name: profile_details_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_details_model_id_seq', 1, false);


--
-- TOC entry 9007 (class 0 OID 0)
-- Dependencies: 231
-- Name: profile_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_types_id_seq', 5, true);


--
-- TOC entry 9008 (class 0 OID 0)
-- Dependencies: 432
-- Name: request_item_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_item_batches_id_seq', 1, false);


--
-- TOC entry 9009 (class 0 OID 0)
-- Dependencies: 480
-- Name: request_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_log_id_seq', 1, false);


--
-- TOC entry 9010 (class 0 OID 0)
-- Dependencies: 482
-- Name: response_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.response_log_id_seq', 1, false);


--
-- TOC entry 9011 (class 0 OID 0)
-- Dependencies: 317
-- Name: sales_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_inventory_id_seq', 1, false);


--
-- TOC entry 9012 (class 0 OID 0)
-- Dependencies: 319
-- Name: sales_inventory_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_inventory_profile_sys_id_seq', 1, false);


--
-- TOC entry 9013 (class 0 OID 0)
-- Dependencies: 318
-- Name: sales_inventory_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_inventory_user_sys_id_seq', 1, false);


--
-- TOC entry 9014 (class 0 OID 0)
-- Dependencies: 321
-- Name: sales_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_items_id_seq', 1, false);


--
-- TOC entry 9015 (class 0 OID 0)
-- Dependencies: 323
-- Name: sales_items_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_items_profile_sys_id_seq', 1, false);


--
-- TOC entry 9016 (class 0 OID 0)
-- Dependencies: 322
-- Name: sales_items_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_items_user_sys_id_seq', 1, false);


--
-- TOC entry 9017 (class 0 OID 0)
-- Dependencies: 264
-- Name: scheme_recycle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scheme_recycle_id_seq', 1, false);


--
-- TOC entry 9018 (class 0 OID 0)
-- Dependencies: 229
-- Name: schemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schemes_id_seq', 1, false);


--
-- TOC entry 9019 (class 0 OID 0)
-- Dependencies: 233
-- Name: service_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_channels_id_seq', 7, true);


--
-- TOC entry 9020 (class 0 OID 0)
-- Dependencies: 217
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- TOC entry 9021 (class 0 OID 0)
-- Dependencies: 372
-- Name: super_agent_profile_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_profile_details_id_seq', 1, false);


--
-- TOC entry 9022 (class 0 OID 0)
-- Dependencies: 237
-- Name: super_agent_profile_details_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_profile_details_model_id_seq', 1, false);


--
-- TOC entry 9023 (class 0 OID 0)
-- Dependencies: 354
-- Name: super_agent_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_profiles_id_seq', 1, false);


--
-- TOC entry 9024 (class 0 OID 0)
-- Dependencies: 356
-- Name: super_agent_profiles_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_profiles_profile_sys_id_seq', 1, false);


--
-- TOC entry 9025 (class 0 OID 0)
-- Dependencies: 355
-- Name: super_agent_profiles_user_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_profiles_user_sys_id_seq', 1, false);


--
-- TOC entry 9026 (class 0 OID 0)
-- Dependencies: 402
-- Name: super_agent_user_device_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_user_device_sessions_id_seq', 1, false);


--
-- TOC entry 9027 (class 0 OID 0)
-- Dependencies: 245
-- Name: super_agent_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_users_id_seq', 1, false);


--
-- TOC entry 9028 (class 0 OID 0)
-- Dependencies: 242
-- Name: super_agent_users_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_users_model_id_seq', 1, false);


--
-- TOC entry 9029 (class 0 OID 0)
-- Dependencies: 243
-- Name: super_agent_users_model_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_users_model_profile_sys_id_seq', 1, false);


--
-- TOC entry 9030 (class 0 OID 0)
-- Dependencies: 246
-- Name: super_agent_users_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_agent_users_profile_sys_id_seq', 1, false);


--
-- TOC entry 9031 (class 0 OID 0)
-- Dependencies: 227
-- Name: sys_app_key_era_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_app_key_era_id_seq', 2, true);


--
-- TOC entry 9032 (class 0 OID 0)
-- Dependencies: 259
-- Name: system_boundary_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.system_boundary_log_id_seq', 1, false);


--
-- TOC entry 9033 (class 0 OID 0)
-- Dependencies: 261
-- Name: system_log_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.system_log_summary_id_seq', 1, false);


--
-- TOC entry 9034 (class 0 OID 0)
-- Dependencies: 438
-- Name: transaction_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_history_id_seq', 1, false);


--
-- TOC entry 9035 (class 0 OID 0)
-- Dependencies: 436
-- Name: transaction_register_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_register_id_seq', 1, false);


--
-- TOC entry 9036 (class 0 OID 0)
-- Dependencies: 251
-- Name: u_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.u_p_id_seq', 1, true);


--
-- TOC entry 9037 (class 0 OID 0)
-- Dependencies: 253
-- Name: u_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.u_s_id_seq', 1, true);


--
-- TOC entry 9038 (class 0 OID 0)
-- Dependencies: 255
-- Name: unique_bearer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unique_bearer_tokens_id_seq', 1, false);


--
-- TOC entry 9039 (class 0 OID 0)
-- Dependencies: 257
-- Name: unique_customer_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unique_customer_keys_id_seq', 1, false);


--
-- TOC entry 9040 (class 0 OID 0)
-- Dependencies: 364
-- Name: user_profile_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_profile_details_id_seq', 1, false);


--
-- TOC entry 9041 (class 0 OID 0)
-- Dependencies: 239
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 9042 (class 0 OID 0)
-- Dependencies: 240
-- Name: users_profile_sys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_profile_sys_id_seq', 1, false);


--
-- TOC entry 9043 (class 0 OID 0)
-- Dependencies: 476
-- Name: wallet_debit_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_debit_history_id_seq', 1, false);


--
-- TOC entry 9044 (class 0 OID 0)
-- Dependencies: 410
-- Name: wallet_register_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_register_id_seq', 1, false);


--
-- TOC entry 9045 (class 0 OID 0)
-- Dependencies: 292
-- Name: wallet_to_bank_trxn_log_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_to_bank_trxn_log_0_id_seq', 1, false);


--
-- TOC entry 9046 (class 0 OID 0)
-- Dependencies: 294
-- Name: wallet_to_bank_trxn_log_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_to_bank_trxn_log_1_id_seq', 1, false);


--
-- TOC entry 9047 (class 0 OID 0)
-- Dependencies: 296
-- Name: wallet_to_bank_trxn_log_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_to_bank_trxn_log_2_id_seq', 1, false);


--
-- TOC entry 9048 (class 0 OID 0)
-- Dependencies: 298
-- Name: wallet_to_bank_trxn_log_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_to_bank_trxn_log_3_id_seq', 1, false);


--
-- TOC entry 9049 (class 0 OID 0)
-- Dependencies: 300
-- Name: wallet_to_bank_trxn_log_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_to_bank_trxn_log_4_id_seq', 1, false);


--
-- TOC entry 9050 (class 0 OID 0)
-- Dependencies: 302
-- Name: wallet_to_bank_trxn_log_5_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_to_bank_trxn_log_5_id_seq', 1, false);


--
-- TOC entry 8202 (class 2606 OID 46829)
-- Name: admin_user_device_sessions admin_user_device_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user_device_sessions
    ADD CONSTRAINT admin_user_device_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 8114 (class 2606 OID 37858)
-- Name: agent_profile_details agent_profile_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profile_details
    ADD CONSTRAINT agent_profile_details_pkey PRIMARY KEY (id);


--
-- TOC entry 8080 (class 2606 OID 37299)
-- Name: agent_profiles agent_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profiles
    ADD CONSTRAINT agent_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 8172 (class 2606 OID 46664)
-- Name: agent_user_device_sessions agent_user_device_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_user_device_sessions
    ADD CONSTRAINT agent_user_device_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 7956 (class 2606 OID 24440)
-- Name: agent_users agent_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_users
    ADD CONSTRAINT agent_users_pkey PRIMARY KEY (id);


--
-- TOC entry 8094 (class 2606 OID 37543)
-- Name: beneficiary_accounts beneficiary_accounts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary_accounts
    ADD CONSTRAINT beneficiary_accounts_pk PRIMARY KEY (id);


--
-- TOC entry 8092 (class 2606 OID 37508)
-- Name: beneficiary_service_accounts beneficiary_service_accounts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary_service_accounts
    ADD CONSTRAINT beneficiary_service_accounts_pk PRIMARY KEY (id);


--
-- TOC entry 7906 (class 2606 OID 34300)
-- Name: biller_operational_wallets biller_operational_charges_wallet_accnt_num; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biller_operational_wallets
    ADD CONSTRAINT biller_operational_charges_wallet_accnt_num UNIQUE (wallet_accnt_num);


--
-- TOC entry 7902 (class 2606 OID 19604)
-- Name: biller_settlement_accounts biller_settlement_accounts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biller_settlement_accounts
    ADD CONSTRAINT biller_settlement_accounts_pk PRIMARY KEY (id);


--
-- TOC entry 8238 (class 2606 OID 98073)
-- Name: billing_charges_config billing_charges_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_charges_config
    ADD CONSTRAINT billing_charges_config_pk PRIMARY KEY (id);


--
-- TOC entry 7998 (class 2606 OID 34408)
-- Name: billing_config_summary billing_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_config_summary
    ADD CONSTRAINT billing_config_pk PRIMARY KEY (id);


--
-- TOC entry 8108 (class 2606 OID 37805)
-- Name: customer_profile_details customer_profile_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_profile_details
    ADD CONSTRAINT customer_profile_details_pkey PRIMARY KEY (id);


--
-- TOC entry 8220 (class 2606 OID 96368)
-- Name: customer_request_security customer_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request_security
    ADD CONSTRAINT customer_reference_pkey UNIQUE (customer_reference);


--
-- TOC entry 8222 (class 2606 OID 96366)
-- Name: customer_request_security customer_request_security_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request_security
    ADD CONSTRAINT customer_request_security_pkey PRIMARY KEY (id);


--
-- TOC entry 8138 (class 2606 OID 38064)
-- Name: customer_tier_1_profile_details customer_tier_1_profile_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profile_details
    ADD CONSTRAINT customer_tier_1_profile_details_pkey PRIMARY KEY (id);


--
-- TOC entry 8088 (class 2606 OID 37389)
-- Name: customer_tier_1_profiles customer_tier_1_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profiles
    ADD CONSTRAINT customer_tier_1_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 8214 (class 2606 OID 46897)
-- Name: customer_tier_1_user_device_sessions customer_tier_1_user_device_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_user_device_sessions
    ADD CONSTRAINT customer_tier_1_user_device_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 8068 (class 2606 OID 36422)
-- Name: customer_tier_1_users customer_tier_1_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_users
    ADD CONSTRAINT customer_tier_1_users_pkey PRIMARY KEY (id);


--
-- TOC entry 8178 (class 2606 OID 46697)
-- Name: customer_user_device_sessions customer_user_device_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_device_sessions
    ADD CONSTRAINT customer_user_device_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 8150 (class 2606 OID 38266)
-- Name: customer_users customer_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_users
    ADD CONSTRAINT customer_users_pkey PRIMARY KEY (id);


--
-- TOC entry 8036 (class 2606 OID 35811)
-- Name: ext_credit_wallet_rqst_trxn_log_0 ext_credit_wallet_rqst_trxn_log_0_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_0
    ADD CONSTRAINT ext_credit_wallet_rqst_trxn_log_0_pkey PRIMARY KEY (id);


--
-- TOC entry 8038 (class 2606 OID 35837)
-- Name: ext_credit_wallet_rqst_trxn_log_1 ext_credit_wallet_rqst_trxn_log_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_1
    ADD CONSTRAINT ext_credit_wallet_rqst_trxn_log_1_pkey PRIMARY KEY (id);


--
-- TOC entry 8040 (class 2606 OID 35863)
-- Name: ext_credit_wallet_rqst_trxn_log_2 ext_credit_wallet_rqst_trxn_log_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_2
    ADD CONSTRAINT ext_credit_wallet_rqst_trxn_log_2_pkey PRIMARY KEY (id);


--
-- TOC entry 8042 (class 2606 OID 35889)
-- Name: ext_credit_wallet_rqst_trxn_log_3 ext_credit_wallet_rqst_trxn_log_3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_3
    ADD CONSTRAINT ext_credit_wallet_rqst_trxn_log_3_pkey PRIMARY KEY (id);


--
-- TOC entry 8044 (class 2606 OID 35915)
-- Name: ext_credit_wallet_rqst_trxn_log_4 ext_credit_wallet_rqst_trxn_log_4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_4
    ADD CONSTRAINT ext_credit_wallet_rqst_trxn_log_4_pkey PRIMARY KEY (id);


--
-- TOC entry 8046 (class 2606 OID 35941)
-- Name: ext_credit_wallet_rqst_trxn_log_5 ext_credit_wallet_rqst_trxn_log_5_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_5
    ADD CONSTRAINT ext_credit_wallet_rqst_trxn_log_5_pkey PRIMARY KEY (id);


--
-- TOC entry 8066 (class 2606 OID 36282)
-- Name: ext_debit_wallet_rqst_trxn_log_0 ext_debit_wallet_rqst_trxn_log_0_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_0
    ADD CONSTRAINT ext_debit_wallet_rqst_trxn_log_0_pkey PRIMARY KEY (id);


--
-- TOC entry 8064 (class 2606 OID 36256)
-- Name: ext_debit_wallet_rqst_trxn_log_1 ext_debit_wallet_rqst_trxn_log_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_1
    ADD CONSTRAINT ext_debit_wallet_rqst_trxn_log_1_pkey PRIMARY KEY (id);


--
-- TOC entry 8062 (class 2606 OID 36229)
-- Name: ext_debit_wallet_rqst_trxn_log_2 ext_debit_wallet_rqst_trxn_log_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_2
    ADD CONSTRAINT ext_debit_wallet_rqst_trxn_log_2_pkey PRIMARY KEY (id);


--
-- TOC entry 8060 (class 2606 OID 36203)
-- Name: ext_debit_wallet_rqst_trxn_log_3 ext_debit_wallet_rqst_trxn_log_3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_3
    ADD CONSTRAINT ext_debit_wallet_rqst_trxn_log_3_pkey PRIMARY KEY (id);


--
-- TOC entry 8058 (class 2606 OID 36177)
-- Name: ext_debit_wallet_rqst_trxn_log_4 ext_debit_wallet_rqst_trxn_log_4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_4
    ADD CONSTRAINT ext_debit_wallet_rqst_trxn_log_4_pkey PRIMARY KEY (id);


--
-- TOC entry 8048 (class 2606 OID 35968)
-- Name: ext_debit_wallet_rqst_trxn_log_5 ext_debit_wallet_rqst_trxn_log_5_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_5
    ADD CONSTRAINT ext_debit_wallet_rqst_trxn_log_5_pkey PRIMARY KEY (id);


--
-- TOC entry 8006 (class 2606 OID 34864)
-- Name: inter_node_wallet_trxn_log_0 inter_node_wallet_trxn_log_0_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_0
    ADD CONSTRAINT inter_node_wallet_trxn_log_0_pkey PRIMARY KEY (id);


--
-- TOC entry 8000 (class 2606 OID 34689)
-- Name: inter_node_wallet_trxn_log_1 inter_node_wallet_trxn_log_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_1
    ADD CONSTRAINT inter_node_wallet_trxn_log_1_pkey PRIMARY KEY (id);


--
-- TOC entry 8002 (class 2606 OID 34739)
-- Name: inter_node_wallet_trxn_log_2 inter_node_wallet_trxn_log_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_2
    ADD CONSTRAINT inter_node_wallet_trxn_log_2_pkey PRIMARY KEY (id);


--
-- TOC entry 8004 (class 2606 OID 34788)
-- Name: inter_node_wallet_trxn_log_3 inter_node_wallet_trxn_log_3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_3
    ADD CONSTRAINT inter_node_wallet_trxn_log_3_pkey PRIMARY KEY (id);


--
-- TOC entry 8008 (class 2606 OID 34914)
-- Name: inter_node_wallet_trxn_log_4 inter_node_wallet_trxn_log_4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_4
    ADD CONSTRAINT inter_node_wallet_trxn_log_4_pkey PRIMARY KEY (id);


--
-- TOC entry 8010 (class 2606 OID 34963)
-- Name: inter_node_wallet_trxn_log_5 inter_node_wallet_trxn_log_5_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_5
    ADD CONSTRAINT inter_node_wallet_trxn_log_5_pkey PRIMARY KEY (id);


--
-- TOC entry 8020 (class 2606 OID 35209)
-- Name: intra_node_wallet_trxn_log_0 intra_node_wallet_trxn_log_0_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_0
    ADD CONSTRAINT intra_node_wallet_trxn_log_0_pkey PRIMARY KEY (id);


--
-- TOC entry 8018 (class 2606 OID 35159)
-- Name: intra_node_wallet_trxn_log_1 intra_node_wallet_trxn_log_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_1
    ADD CONSTRAINT intra_node_wallet_trxn_log_1_pkey PRIMARY KEY (id);


--
-- TOC entry 8016 (class 2606 OID 35110)
-- Name: intra_node_wallet_trxn_log_2 intra_node_wallet_trxn_log_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_2
    ADD CONSTRAINT intra_node_wallet_trxn_log_2_pkey PRIMARY KEY (id);


--
-- TOC entry 8014 (class 2606 OID 35061)
-- Name: intra_node_wallet_trxn_log_3 intra_node_wallet_trxn_log_3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_3
    ADD CONSTRAINT intra_node_wallet_trxn_log_3_pkey PRIMARY KEY (id);


--
-- TOC entry 8012 (class 2606 OID 35012)
-- Name: intra_node_wallet_trxn_log_4 intra_node_wallet_trxn_log_4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_4
    ADD CONSTRAINT intra_node_wallet_trxn_log_4_pkey PRIMARY KEY (id);


--
-- TOC entry 8034 (class 2606 OID 35553)
-- Name: intra_node_wallet_trxn_log_5 intra_node_wallet_trxn_log_5_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_5
    ADD CONSTRAINT intra_node_wallet_trxn_log_5_pkey PRIMARY KEY (id);


--
-- TOC entry 8056 (class 2606 OID 36156)
-- Name: inventory_items inventory_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_items
    ADD CONSTRAINT inventory_items_pkey PRIMARY KEY (id);


--
-- TOC entry 8050 (class 2606 OID 36076)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 8230 (class 2606 OID 97249)
-- Name: journal_line journal_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line
    ADD CONSTRAINT journal_line_pkey PRIMARY KEY (id);


--
-- TOC entry 8228 (class 2606 OID 97058)
-- Name: journal_line_summary journal_line_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary
    ADD CONSTRAINT journal_line_summary_pkey PRIMARY KEY (id);


--
-- TOC entry 8226 (class 2606 OID 97012)
-- Name: journal journal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal
    ADD CONSTRAINT journal_pkey PRIMARY KEY (id);


--
-- TOC entry 8232 (class 2606 OID 97487)
-- Name: merchant_access_whitelist merchant_access_whitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_access_whitelist
    ADD CONSTRAINT merchant_access_whitelist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 8132 (class 2606 OID 38013)
-- Name: merchant_profile_details merchant_profile_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profile_details
    ADD CONSTRAINT merchant_profile_details_pkey PRIMARY KEY (id);


--
-- TOC entry 8146 (class 2606 OID 38133)
-- Name: merchant_profiles merchant_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profiles
    ADD CONSTRAINT merchant_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 8184 (class 2606 OID 46730)
-- Name: merchant_user_device_sessions merchant_user_device_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_user_device_sessions
    ADD CONSTRAINT merchant_user_device_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 8144 (class 2606 OID 38107)
-- Name: merchant_users merchant_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_users
    ADD CONSTRAINT merchant_users_pkey PRIMARY KEY (id);


--
-- TOC entry 7992 (class 2606 OID 34343)
-- Name: operational_charges operational_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operational_charges
    ADD CONSTRAINT operational_charges_pkey PRIMARY KEY (id);


--
-- TOC entry 7904 (class 2606 OID 19877)
-- Name: operational_wallets operational_wallets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operational_wallets
    ADD CONSTRAINT operational_wallets_pk PRIMARY KEY (id);


--
-- TOC entry 8234 (class 2606 OID 97496)
-- Name: partner_access_whitelist partner_access_whitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_access_whitelist
    ADD CONSTRAINT partner_access_whitelist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 8208 (class 2606 OID 46864)
-- Name: partner_user_device_sessions partner_user_device_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_user_device_sessions
    ADD CONSTRAINT partner_user_device_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 8126 (class 2606 OID 37962)
-- Name: pos_profile_details pos_profile_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profile_details
    ADD CONSTRAINT pos_profile_details_pkey PRIMARY KEY (id);


--
-- TOC entry 8076 (class 2606 OID 37221)
-- Name: pos_profiles pos_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profiles
    ADD CONSTRAINT pos_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 8190 (class 2606 OID 46763)
-- Name: pos_user_device_sessions pos_user_device_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_user_device_sessions
    ADD CONSTRAINT pos_user_device_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 8072 (class 2606 OID 36706)
-- Name: pos_users pos_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_users
    ADD CONSTRAINT pos_users_pkey PRIMARY KEY (id);


--
-- TOC entry 8168 (class 2606 OID 46626)
-- Name: product_scheme_promotions product_scheme_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_scheme_promotions
    ADD CONSTRAINT product_scheme_promotions_pkey PRIMARY KEY (id);


--
-- TOC entry 8170 (class 2606 OID 46635)
-- Name: product_scheme_promotions_recycle product_scheme_promotions_recycle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_scheme_promotions_recycle
    ADD CONSTRAINT product_scheme_promotions_recycle_pkey PRIMARY KEY (id);


--
-- TOC entry 8152 (class 2606 OID 46583)
-- Name: product_schemes product_schemes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_schemes
    ADD CONSTRAINT product_schemes_pkey PRIMARY KEY (id);


--
-- TOC entry 8160 (class 2606 OID 46611)
-- Name: product_scheme_recycle product_schemes_recycle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_scheme_recycle
    ADD CONSTRAINT product_schemes_recycle_pkey PRIMARY KEY (id);


--
-- TOC entry 7936 (class 2606 OID 23946)
-- Name: profile_details_model profile_details_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_details_model
    ADD CONSTRAINT profile_details_model_pkey PRIMARY KEY (id);


--
-- TOC entry 8102 (class 2606 OID 37754)
-- Name: profile_details profile_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_details
    ADD CONSTRAINT profile_details_pkey PRIMARY KEY (id);


--
-- TOC entry 7922 (class 2606 OID 22230)
-- Name: profile_types profile_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_types
    ADD CONSTRAINT profile_types_pkey PRIMARY KEY (id);


--
-- TOC entry 8052 (class 2606 OID 36106)
-- Name: sales_inventory sales_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_inventory
    ADD CONSTRAINT sales_inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 8054 (class 2606 OID 36131)
-- Name: sales_items sales_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_items
    ADD CONSTRAINT sales_items_pkey PRIMARY KEY (id);


--
-- TOC entry 7980 (class 2606 OID 34196)
-- Name: scheme_promotions scheme_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheme_promotions
    ADD CONSTRAINT scheme_promotions_pkey PRIMARY KEY (id);


--
-- TOC entry 7990 (class 2606 OID 34233)
-- Name: scheme_promotion_recycle scheme_promotions_recycle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheme_promotion_recycle
    ADD CONSTRAINT scheme_promotions_recycle_pkey PRIMARY KEY (id);


--
-- TOC entry 7982 (class 2606 OID 34218)
-- Name: scheme_recycle scheme_recycle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheme_recycle
    ADD CONSTRAINT scheme_recycle_pkey PRIMARY KEY (id);


--
-- TOC entry 7914 (class 2606 OID 20396)
-- Name: schemes schemes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT schemes_pkey PRIMARY KEY (id);


--
-- TOC entry 7928 (class 2606 OID 22328)
-- Name: service_channels service_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_channels
    ADD CONSTRAINT service_channels_pkey PRIMARY KEY (id);


--
-- TOC entry 7942 (class 2606 OID 24037)
-- Name: super_agent_profile_details_model super_agent_profile_details_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profile_details_model
    ADD CONSTRAINT super_agent_profile_details_model_pkey PRIMARY KEY (id);


--
-- TOC entry 8120 (class 2606 OID 37910)
-- Name: super_agent_profile_details super_agent_profile_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profile_details
    ADD CONSTRAINT super_agent_profile_details_pkey PRIMARY KEY (id);


--
-- TOC entry 8084 (class 2606 OID 37344)
-- Name: super_agent_profiles super_agent_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profiles
    ADD CONSTRAINT super_agent_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 8196 (class 2606 OID 46796)
-- Name: super_agent_user_device_sessions super_agent_user_device_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_user_device_sessions
    ADD CONSTRAINT super_agent_user_device_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 7950 (class 2606 OID 24337)
-- Name: super_agent_users_model super_agent_users_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_users_model
    ADD CONSTRAINT super_agent_users_model_pkey PRIMARY KEY (id);


--
-- TOC entry 7954 (class 2606 OID 24389)
-- Name: super_agent_users super_agent_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_users
    ADD CONSTRAINT super_agent_users_pkey PRIMARY KEY (id);


--
-- TOC entry 7908 (class 2606 OID 20348)
-- Name: sys_app_key_era sys_app_key_era_app_key_col; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_app_key_era
    ADD CONSTRAINT sys_app_key_era_app_key_col UNIQUE (app_key);


--
-- TOC entry 7910 (class 2606 OID 20346)
-- Name: sys_app_key_era sys_app_key_era_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_app_key_era
    ADD CONSTRAINT sys_app_key_era_pkey PRIMARY KEY (id);


--
-- TOC entry 7912 (class 2606 OID 20350)
-- Name: sys_app_key_era sys_app_key_era_system_key_col; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_app_key_era
    ADD CONSTRAINT sys_app_key_era_system_key_col UNIQUE (system_key);


--
-- TOC entry 7972 (class 2606 OID 24937)
-- Name: system_boundary_log system_boundary_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_boundary_log
    ADD CONSTRAINT system_boundary_log_pkey PRIMARY KEY (id);


--
-- TOC entry 7976 (class 2606 OID 25708)
-- Name: system_log_summary system_log_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_log_summary
    ADD CONSTRAINT system_log_summary_pkey PRIMARY KEY (id);


--
-- TOC entry 7994 (class 2606 OID 34382)
-- Name: trxn_bands trxn_bands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trxn_bands
    ADD CONSTRAINT trxn_bands_pkey PRIMARY KEY (id);


--
-- TOC entry 7996 (class 2606 OID 34386)
-- Name: trxn_bands trxn_bands_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trxn_bands
    ADD CONSTRAINT trxn_bands_unique_key UNIQUE (scheme_code, trxn_band_code);


--
-- TOC entry 7960 (class 2606 OID 24749)
-- Name: u_p u_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.u_p
    ADD CONSTRAINT u_p_pkey PRIMARY KEY (id);


--
-- TOC entry 7962 (class 2606 OID 24757)
-- Name: u_s u_s_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.u_s
    ADD CONSTRAINT u_s_pkey PRIMARY KEY (id);


--
-- TOC entry 8204 (class 2606 OID 46831)
-- Name: admin_user_device_sessions uk_admin_user_device_sessions_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user_device_sessions
    ADD CONSTRAINT uk_admin_user_device_sessions_bearer_token UNIQUE (bearer_token);


--
-- TOC entry 8206 (class 2606 OID 46833)
-- Name: admin_user_device_sessions uk_admin_user_device_sessions_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user_device_sessions
    ADD CONSTRAINT uk_admin_user_device_sessions_cols UNIQUE (unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 8116 (class 2606 OID 37860)
-- Name: agent_profile_details uk_agent_profile_details_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profile_details
    ADD CONSTRAINT uk_agent_profile_details_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 8118 (class 2606 OID 37862)
-- Name: agent_profile_details uk_agent_profile_details_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profile_details
    ADD CONSTRAINT uk_agent_profile_details_profile_id UNIQUE (profile_id);


--
-- TOC entry 8082 (class 2606 OID 37301)
-- Name: agent_profiles uk_agent_profiles_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profiles
    ADD CONSTRAINT uk_agent_profiles_profile_id UNIQUE (profile_id);


--
-- TOC entry 8174 (class 2606 OID 46666)
-- Name: agent_user_device_sessions uk_agent_user_device_sessions_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_user_device_sessions
    ADD CONSTRAINT uk_agent_user_device_sessions_bearer_token UNIQUE (bearer_token);


--
-- TOC entry 8176 (class 2606 OID 46668)
-- Name: agent_user_device_sessions uk_agent_user_device_sessions_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_user_device_sessions
    ADD CONSTRAINT uk_agent_user_device_sessions_cols UNIQUE (unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 7958 (class 2606 OID 24442)
-- Name: agent_users uk_agent_users_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_users
    ADD CONSTRAINT uk_agent_users_profile_id UNIQUE (profile_id);


--
-- TOC entry 8110 (class 2606 OID 37807)
-- Name: customer_profile_details uk_customer_profile_details_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_profile_details
    ADD CONSTRAINT uk_customer_profile_details_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 8112 (class 2606 OID 37809)
-- Name: customer_profile_details uk_customer_profile_details_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_profile_details
    ADD CONSTRAINT uk_customer_profile_details_profile_id UNIQUE (profile_id);


--
-- TOC entry 8140 (class 2606 OID 38066)
-- Name: customer_tier_1_profile_details uk_customer_tier_1_profile_details_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profile_details
    ADD CONSTRAINT uk_customer_tier_1_profile_details_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 8142 (class 2606 OID 38068)
-- Name: customer_tier_1_profile_details uk_customer_tier_1_profile_details_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profile_details
    ADD CONSTRAINT uk_customer_tier_1_profile_details_profile_id UNIQUE (profile_id);


--
-- TOC entry 8090 (class 2606 OID 37391)
-- Name: customer_tier_1_profiles uk_customer_tier_1_profiles_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profiles
    ADD CONSTRAINT uk_customer_tier_1_profiles_profile_id UNIQUE (profile_id);


--
-- TOC entry 8216 (class 2606 OID 46899)
-- Name: customer_tier_1_user_device_sessions uk_customer_tier_1_user_device_sessions_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_user_device_sessions
    ADD CONSTRAINT uk_customer_tier_1_user_device_sessions_bearer_token UNIQUE (bearer_token);


--
-- TOC entry 8218 (class 2606 OID 46901)
-- Name: customer_tier_1_user_device_sessions uk_customer_tier_1_user_device_sessions_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_user_device_sessions
    ADD CONSTRAINT uk_customer_tier_1_user_device_sessions_cols UNIQUE (unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 8070 (class 2606 OID 36424)
-- Name: customer_tier_1_users uk_customer_tier_1_users_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_users
    ADD CONSTRAINT uk_customer_tier_1_users_profile_id UNIQUE (profile_id);


--
-- TOC entry 8180 (class 2606 OID 46699)
-- Name: customer_user_device_sessions uk_customer_user_device_sessions_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_device_sessions
    ADD CONSTRAINT uk_customer_user_device_sessions_bearer_token UNIQUE (bearer_token);


--
-- TOC entry 8182 (class 2606 OID 46701)
-- Name: customer_user_device_sessions uk_customer_user_device_sessions_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_device_sessions
    ADD CONSTRAINT uk_customer_user_device_sessions_cols UNIQUE (unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 8134 (class 2606 OID 38015)
-- Name: merchant_profile_details uk_merchant_profile_details_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profile_details
    ADD CONSTRAINT uk_merchant_profile_details_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 8136 (class 2606 OID 38017)
-- Name: merchant_profile_details uk_merchant_profile_details_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profile_details
    ADD CONSTRAINT uk_merchant_profile_details_profile_id UNIQUE (profile_id);


--
-- TOC entry 8148 (class 2606 OID 38135)
-- Name: merchant_profiles uk_merchant_profiles_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profiles
    ADD CONSTRAINT uk_merchant_profiles_profile_id UNIQUE (profile_id);


--
-- TOC entry 8186 (class 2606 OID 46732)
-- Name: merchant_user_device_sessions uk_merchant_user_device_sessions_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_user_device_sessions
    ADD CONSTRAINT uk_merchant_user_device_sessions_bearer_token UNIQUE (bearer_token);


--
-- TOC entry 8188 (class 2606 OID 46734)
-- Name: merchant_user_device_sessions uk_merchant_user_device_sessions_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_user_device_sessions
    ADD CONSTRAINT uk_merchant_user_device_sessions_cols UNIQUE (unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 8210 (class 2606 OID 46866)
-- Name: partner_user_device_sessions uk_partner_user_device_sessions_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_user_device_sessions
    ADD CONSTRAINT uk_partner_user_device_sessions_bearer_token UNIQUE (bearer_token);


--
-- TOC entry 8212 (class 2606 OID 46868)
-- Name: partner_user_device_sessions uk_partner_user_device_sessions_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_user_device_sessions
    ADD CONSTRAINT uk_partner_user_device_sessions_cols UNIQUE (unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 8128 (class 2606 OID 37964)
-- Name: pos_profile_details uk_pos_profile_details_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profile_details
    ADD CONSTRAINT uk_pos_profile_details_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 8130 (class 2606 OID 37966)
-- Name: pos_profile_details uk_pos_profile_details_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profile_details
    ADD CONSTRAINT uk_pos_profile_details_profile_id UNIQUE (profile_id);


--
-- TOC entry 8078 (class 2606 OID 37223)
-- Name: pos_profiles uk_pos_profiles_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profiles
    ADD CONSTRAINT uk_pos_profiles_profile_id UNIQUE (profile_id);


--
-- TOC entry 8192 (class 2606 OID 46765)
-- Name: pos_user_device_sessions uk_pos_user_device_sessions_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_user_device_sessions
    ADD CONSTRAINT uk_pos_user_device_sessions_bearer_token UNIQUE (bearer_token);


--
-- TOC entry 8194 (class 2606 OID 46767)
-- Name: pos_user_device_sessions uk_pos_user_device_sessions_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_user_device_sessions
    ADD CONSTRAINT uk_pos_user_device_sessions_cols UNIQUE (unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 8074 (class 2606 OID 36708)
-- Name: pos_users uk_pos_users_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_users
    ADD CONSTRAINT uk_pos_users_profile_id UNIQUE (profile_id);


--
-- TOC entry 8154 (class 2606 OID 46585)
-- Name: product_schemes uk_product_schemes_col_callback_url; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_schemes
    ADD CONSTRAINT uk_product_schemes_col_callback_url UNIQUE (callback_url);


--
-- TOC entry 8156 (class 2606 OID 46587)
-- Name: product_schemes uk_product_schemes_col_scheme_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_schemes
    ADD CONSTRAINT uk_product_schemes_col_scheme_code UNIQUE (scheme_code);


--
-- TOC entry 8158 (class 2606 OID 46589)
-- Name: product_schemes uk_product_schemes_col_secret_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_schemes
    ADD CONSTRAINT uk_product_schemes_col_secret_key UNIQUE (secret_key);


--
-- TOC entry 8162 (class 2606 OID 46613)
-- Name: product_scheme_recycle uk_product_schemes_recycle_col_callback_url; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_scheme_recycle
    ADD CONSTRAINT uk_product_schemes_recycle_col_callback_url UNIQUE (callback_url);


--
-- TOC entry 8164 (class 2606 OID 46615)
-- Name: product_scheme_recycle uk_product_schemes_recycle_col_scheme_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_scheme_recycle
    ADD CONSTRAINT uk_product_schemes_recycle_col_scheme_code UNIQUE (scheme_code);


--
-- TOC entry 8166 (class 2606 OID 46617)
-- Name: product_scheme_recycle uk_product_schemes_recycle_col_secret_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_scheme_recycle
    ADD CONSTRAINT uk_product_schemes_recycle_col_secret_key UNIQUE (secret_key);


--
-- TOC entry 8104 (class 2606 OID 37756)
-- Name: profile_details uk_profile_details_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_details
    ADD CONSTRAINT uk_profile_details_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 7938 (class 2606 OID 23948)
-- Name: profile_details_model uk_profile_details_model_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_details_model
    ADD CONSTRAINT uk_profile_details_model_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 7940 (class 2606 OID 23950)
-- Name: profile_details_model uk_profile_details_model_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_details_model
    ADD CONSTRAINT uk_profile_details_model_profile_id UNIQUE (profile_id);


--
-- TOC entry 8106 (class 2606 OID 37758)
-- Name: profile_details uk_profile_details_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_details
    ADD CONSTRAINT uk_profile_details_profile_id UNIQUE (profile_id);


--
-- TOC entry 7924 (class 2606 OID 22234)
-- Name: profile_types uk_profile_types_profile_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_types
    ADD CONSTRAINT uk_profile_types_profile_type UNIQUE (profile_type);


--
-- TOC entry 7926 (class 2606 OID 22232)
-- Name: profile_types uk_profile_types_profile_type_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_types
    ADD CONSTRAINT uk_profile_types_profile_type_code UNIQUE (profile_type_code);


--
-- TOC entry 7984 (class 2606 OID 34220)
-- Name: scheme_recycle uk_scheme_recycle_col_callback_url; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheme_recycle
    ADD CONSTRAINT uk_scheme_recycle_col_callback_url UNIQUE (callback_url);


--
-- TOC entry 7986 (class 2606 OID 34222)
-- Name: scheme_recycle uk_scheme_recycle_col_scheme_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheme_recycle
    ADD CONSTRAINT uk_scheme_recycle_col_scheme_code UNIQUE (scheme_code);


--
-- TOC entry 7988 (class 2606 OID 34224)
-- Name: scheme_recycle uk_scheme_recycle_col_secret_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheme_recycle
    ADD CONSTRAINT uk_scheme_recycle_col_secret_key UNIQUE (secret_key);


--
-- TOC entry 7916 (class 2606 OID 20398)
-- Name: schemes uk_schemes_col_callback_url; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT uk_schemes_col_callback_url UNIQUE (callback_url);


--
-- TOC entry 7918 (class 2606 OID 20400)
-- Name: schemes uk_schemes_col_scheme_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT uk_schemes_col_scheme_code UNIQUE (scheme_code);


--
-- TOC entry 7920 (class 2606 OID 20402)
-- Name: schemes uk_schemes_col_secret_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT uk_schemes_col_secret_key UNIQUE (secret_key);


--
-- TOC entry 7930 (class 2606 OID 22330)
-- Name: service_channels uk_service_channels_channel_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_channels
    ADD CONSTRAINT uk_service_channels_channel_code UNIQUE (channel_code);


--
-- TOC entry 7932 (class 2606 OID 22332)
-- Name: service_channels uk_service_channels_channel_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_channels
    ADD CONSTRAINT uk_service_channels_channel_id UNIQUE (channel_id);


--
-- TOC entry 7934 (class 2606 OID 22334)
-- Name: service_channels uk_service_channels_channel_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_channels
    ADD CONSTRAINT uk_service_channels_channel_name UNIQUE (channel_name);


--
-- TOC entry 8122 (class 2606 OID 37912)
-- Name: super_agent_profile_details uk_super_agent_profile_details_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profile_details
    ADD CONSTRAINT uk_super_agent_profile_details_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 7944 (class 2606 OID 24039)
-- Name: super_agent_profile_details_model uk_super_agent_profile_details_model_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profile_details_model
    ADD CONSTRAINT uk_super_agent_profile_details_model_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 7946 (class 2606 OID 24041)
-- Name: super_agent_profile_details_model uk_super_agent_profile_details_model_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profile_details_model
    ADD CONSTRAINT uk_super_agent_profile_details_model_profile_id UNIQUE (profile_id);


--
-- TOC entry 8124 (class 2606 OID 37914)
-- Name: super_agent_profile_details uk_super_agent_profile_details_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profile_details
    ADD CONSTRAINT uk_super_agent_profile_details_profile_id UNIQUE (profile_id);


--
-- TOC entry 8086 (class 2606 OID 37346)
-- Name: super_agent_profiles uk_super_agent_profiles_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profiles
    ADD CONSTRAINT uk_super_agent_profiles_profile_id UNIQUE (profile_id);


--
-- TOC entry 8198 (class 2606 OID 46798)
-- Name: super_agent_user_device_sessions uk_super_agent_user_device_sessions_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_user_device_sessions
    ADD CONSTRAINT uk_super_agent_user_device_sessions_bearer_token UNIQUE (bearer_token);


--
-- TOC entry 8200 (class 2606 OID 46800)
-- Name: super_agent_user_device_sessions uk_super_agent_user_device_sessions_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_user_device_sessions
    ADD CONSTRAINT uk_super_agent_user_device_sessions_cols UNIQUE (unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 7952 (class 2606 OID 24339)
-- Name: super_agent_users_model uk_super_agent_users_model_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_users_model
    ADD CONSTRAINT uk_super_agent_users_model_profile_id UNIQUE (profile_id);


--
-- TOC entry 7974 (class 2606 OID 24939)
-- Name: system_boundary_log uk_system_boundary_log_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_boundary_log
    ADD CONSTRAINT uk_system_boundary_log_cols UNIQUE (request_id, unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 7978 (class 2606 OID 25710)
-- Name: system_log_summary uk_system_log_summary_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_log_summary
    ADD CONSTRAINT uk_system_log_summary_cols UNIQUE (request_id, unique_cust_id, scheme_code, profile_type_code);


--
-- TOC entry 7964 (class 2606 OID 24790)
-- Name: unique_bearer_tokens uk_unique_bearer_tokens_unique_bearer_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_bearer_tokens
    ADD CONSTRAINT uk_unique_bearer_tokens_unique_bearer_token UNIQUE (unique_bearer_token);


--
-- TOC entry 7968 (class 2606 OID 24826)
-- Name: unique_customer_keys uk_unique_customer_keys_unique_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_customer_keys
    ADD CONSTRAINT uk_unique_customer_keys_unique_customer_id UNIQUE (unique_customer_id);


--
-- TOC entry 8096 (class 2606 OID 37704)
-- Name: user_profile_details uk_user_profile_details_cols; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile_details
    ADD CONSTRAINT uk_user_profile_details_cols UNIQUE (first_name, last_name, email);


--
-- TOC entry 8098 (class 2606 OID 37706)
-- Name: user_profile_details uk_user_profile_details_profile_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile_details
    ADD CONSTRAINT uk_user_profile_details_profile_id UNIQUE (profile_id);


--
-- TOC entry 7966 (class 2606 OID 24788)
-- Name: unique_bearer_tokens unique_bearer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_bearer_tokens
    ADD CONSTRAINT unique_bearer_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 7970 (class 2606 OID 24824)
-- Name: unique_customer_keys unique_customer_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unique_customer_keys
    ADD CONSTRAINT unique_customer_keys_pkey PRIMARY KEY (id);


--
-- TOC entry 8236 (class 2606 OID 97505)
-- Name: partner_access_blacklist user_access_blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_access_blacklist
    ADD CONSTRAINT user_access_blacklist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 8100 (class 2606 OID 37702)
-- Name: user_profile_details user_profile_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile_details
    ADD CONSTRAINT user_profile_details_pkey PRIMARY KEY (id);


--
-- TOC entry 8224 (class 2606 OID 96874)
-- Name: user_sessions user_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_session_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 7948 (class 2606 OID 24178)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 8022 (class 2606 OID 35258)
-- Name: wallet_to_bank_trxn_log_0 wallet_to_bank_trxn_log_0_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_0
    ADD CONSTRAINT wallet_to_bank_trxn_log_0_pkey PRIMARY KEY (id);


--
-- TOC entry 8024 (class 2606 OID 35307)
-- Name: wallet_to_bank_trxn_log_1 wallet_to_bank_trxn_log_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_1
    ADD CONSTRAINT wallet_to_bank_trxn_log_1_pkey PRIMARY KEY (id);


--
-- TOC entry 8026 (class 2606 OID 35357)
-- Name: wallet_to_bank_trxn_log_2 wallet_to_bank_trxn_log_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_2
    ADD CONSTRAINT wallet_to_bank_trxn_log_2_pkey PRIMARY KEY (id);


--
-- TOC entry 8028 (class 2606 OID 35406)
-- Name: wallet_to_bank_trxn_log_3 wallet_to_bank_trxn_log_3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_3
    ADD CONSTRAINT wallet_to_bank_trxn_log_3_pkey PRIMARY KEY (id);


--
-- TOC entry 8030 (class 2606 OID 35455)
-- Name: wallet_to_bank_trxn_log_4 wallet_to_bank_trxn_log_4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4
    ADD CONSTRAINT wallet_to_bank_trxn_log_4_pkey PRIMARY KEY (id);


--
-- TOC entry 8032 (class 2606 OID 35504)
-- Name: wallet_to_bank_trxn_log_5 wallet_to_bank_trxn_log_5_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_5
    ADD CONSTRAINT wallet_to_bank_trxn_log_5_pkey PRIMARY KEY (id);


--
-- TOC entry 8375 (class 2606 OID 97250)
-- Name: journal_line FKq1qkwi3bp726yehudbih8xe5b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line
    ADD CONSTRAINT "FKq1qkwi3bp726yehudbih8xe5b" FOREIGN KEY (jounal_id) REFERENCES public.journal(id);


--
-- TOC entry 8242 (class 2606 OID 34409)
-- Name: billing_config_summary billing_config_wallet_accnt_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_config_summary
    ADD CONSTRAINT billing_config_wallet_accnt_num FOREIGN KEY (wallet_accnt_num) REFERENCES public.biller_operational_wallets(wallet_accnt_num);


--
-- TOC entry 8366 (class 2606 OID 37307)
-- Name: agent_profiles fk_agent_profiles_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profiles
    ADD CONSTRAINT fk_agent_profiles_scheme_code FOREIGN KEY (scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8367 (class 2606 OID 37312)
-- Name: agent_profiles fk_agent_profiles_user_sys_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_profiles
    ADD CONSTRAINT fk_agent_profiles_user_sys_id FOREIGN KEY (user_sys_id) REFERENCES public.users(id);


--
-- TOC entry 8370 (class 2606 OID 37397)
-- Name: customer_tier_1_profiles fk_customer_tier_1_profiles_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profiles
    ADD CONSTRAINT fk_customer_tier_1_profiles_scheme_code FOREIGN KEY (scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8371 (class 2606 OID 37402)
-- Name: customer_tier_1_profiles fk_customer_tier_1_profiles_user_sys_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tier_1_profiles
    ADD CONSTRAINT fk_customer_tier_1_profiles_user_sys_id FOREIGN KEY (user_sys_id) REFERENCES public.users(id);


--
-- TOC entry 8351 (class 2606 OID 35812)
-- Name: ext_credit_wallet_rqst_trxn_log_0 fk_ext_credit_wallet_rqst_trxn_log_0_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_0
    ADD CONSTRAINT fk_ext_credit_wallet_rqst_trxn_log_0_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8352 (class 2606 OID 35838)
-- Name: ext_credit_wallet_rqst_trxn_log_1 fk_ext_credit_wallet_rqst_trxn_log_1_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_1
    ADD CONSTRAINT fk_ext_credit_wallet_rqst_trxn_log_1_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8353 (class 2606 OID 35864)
-- Name: ext_credit_wallet_rqst_trxn_log_2 fk_ext_credit_wallet_rqst_trxn_log_2_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_2
    ADD CONSTRAINT fk_ext_credit_wallet_rqst_trxn_log_2_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8354 (class 2606 OID 35890)
-- Name: ext_credit_wallet_rqst_trxn_log_3 fk_ext_credit_wallet_rqst_trxn_log_3_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_3
    ADD CONSTRAINT fk_ext_credit_wallet_rqst_trxn_log_3_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8355 (class 2606 OID 35916)
-- Name: ext_credit_wallet_rqst_trxn_log_4 fk_ext_credit_wallet_rqst_trxn_log_4_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_4
    ADD CONSTRAINT fk_ext_credit_wallet_rqst_trxn_log_4_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8356 (class 2606 OID 35942)
-- Name: ext_credit_wallet_rqst_trxn_log_5 fk_ext_credit_wallet_rqst_trxn_log_5_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_credit_wallet_rqst_trxn_log_5
    ADD CONSTRAINT fk_ext_credit_wallet_rqst_trxn_log_5_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8362 (class 2606 OID 36283)
-- Name: ext_debit_wallet_rqst_trxn_log_0 fk_ext_debit_wallet_rqst_trxn_log_0_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_0
    ADD CONSTRAINT fk_ext_debit_wallet_rqst_trxn_log_0_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8361 (class 2606 OID 36257)
-- Name: ext_debit_wallet_rqst_trxn_log_1 fk_ext_debit_wallet_rqst_trxn_log_1_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_1
    ADD CONSTRAINT fk_ext_debit_wallet_rqst_trxn_log_1_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8360 (class 2606 OID 36230)
-- Name: ext_debit_wallet_rqst_trxn_log_2 fk_ext_debit_wallet_rqst_trxn_log_2_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_2
    ADD CONSTRAINT fk_ext_debit_wallet_rqst_trxn_log_2_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8359 (class 2606 OID 36204)
-- Name: ext_debit_wallet_rqst_trxn_log_3 fk_ext_debit_wallet_rqst_trxn_log_3_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_3
    ADD CONSTRAINT fk_ext_debit_wallet_rqst_trxn_log_3_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8358 (class 2606 OID 36178)
-- Name: ext_debit_wallet_rqst_trxn_log_4 fk_ext_debit_wallet_rqst_trxn_log_4_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_4
    ADD CONSTRAINT fk_ext_debit_wallet_rqst_trxn_log_4_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8357 (class 2606 OID 35969)
-- Name: ext_debit_wallet_rqst_trxn_log_5 fk_ext_debit_wallet_rqst_trxn_log_5_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ext_debit_wallet_rqst_trxn_log_5
    ADD CONSTRAINT fk_ext_debit_wallet_rqst_trxn_log_5_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8261 (class 2606 OID 34865)
-- Name: inter_node_wallet_trxn_log_0 fk_inter_node_wallet_trxn_log_0_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_0_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8265 (class 2606 OID 35649)
-- Name: inter_node_wallet_trxn_log_0 fk_inter_node_wallet_trxn_log_0_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_0_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8262 (class 2606 OID 34870)
-- Name: inter_node_wallet_trxn_log_0 fk_inter_node_wallet_trxn_log_0_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_0_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8263 (class 2606 OID 34875)
-- Name: inter_node_wallet_trxn_log_0 fk_inter_node_wallet_trxn_log_0_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_0_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8266 (class 2606 OID 35654)
-- Name: inter_node_wallet_trxn_log_0 fk_inter_node_wallet_trxn_log_0_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_0_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8264 (class 2606 OID 34880)
-- Name: inter_node_wallet_trxn_log_0 fk_inter_node_wallet_trxn_log_0_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_0_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8243 (class 2606 OID 34690)
-- Name: inter_node_wallet_trxn_log_1 fk_inter_node_wallet_trxn_log_1_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_1_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8247 (class 2606 OID 35661)
-- Name: inter_node_wallet_trxn_log_1 fk_inter_node_wallet_trxn_log_1_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_1_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8244 (class 2606 OID 34695)
-- Name: inter_node_wallet_trxn_log_1 fk_inter_node_wallet_trxn_log_1_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_1_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8245 (class 2606 OID 34700)
-- Name: inter_node_wallet_trxn_log_1 fk_inter_node_wallet_trxn_log_1_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_1_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8248 (class 2606 OID 35666)
-- Name: inter_node_wallet_trxn_log_1 fk_inter_node_wallet_trxn_log_1_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_1_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8246 (class 2606 OID 34705)
-- Name: inter_node_wallet_trxn_log_1 fk_inter_node_wallet_trxn_log_1_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_1_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8249 (class 2606 OID 34740)
-- Name: inter_node_wallet_trxn_log_2 fk_inter_node_wallet_trxn_log_2_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_2_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8253 (class 2606 OID 35673)
-- Name: inter_node_wallet_trxn_log_2 fk_inter_node_wallet_trxn_log_2_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_2_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8250 (class 2606 OID 34745)
-- Name: inter_node_wallet_trxn_log_2 fk_inter_node_wallet_trxn_log_2_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_2_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8251 (class 2606 OID 34750)
-- Name: inter_node_wallet_trxn_log_2 fk_inter_node_wallet_trxn_log_2_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_2_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8254 (class 2606 OID 35678)
-- Name: inter_node_wallet_trxn_log_2 fk_inter_node_wallet_trxn_log_2_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_2_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8252 (class 2606 OID 34755)
-- Name: inter_node_wallet_trxn_log_2 fk_inter_node_wallet_trxn_log_2_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_2_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8255 (class 2606 OID 34789)
-- Name: inter_node_wallet_trxn_log_3 fk_inter_node_wallet_trxn_log_3_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_3_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8259 (class 2606 OID 35685)
-- Name: inter_node_wallet_trxn_log_3 fk_inter_node_wallet_trxn_log_3_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_3_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8256 (class 2606 OID 34794)
-- Name: inter_node_wallet_trxn_log_3 fk_inter_node_wallet_trxn_log_3_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_3_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8257 (class 2606 OID 34799)
-- Name: inter_node_wallet_trxn_log_3 fk_inter_node_wallet_trxn_log_3_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_3_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8260 (class 2606 OID 35690)
-- Name: inter_node_wallet_trxn_log_3 fk_inter_node_wallet_trxn_log_3_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_3_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8258 (class 2606 OID 34804)
-- Name: inter_node_wallet_trxn_log_3 fk_inter_node_wallet_trxn_log_3_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_3_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8267 (class 2606 OID 34915)
-- Name: inter_node_wallet_trxn_log_4 fk_inter_node_wallet_trxn_log_4_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_4_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8271 (class 2606 OID 35697)
-- Name: inter_node_wallet_trxn_log_4 fk_inter_node_wallet_trxn_log_4_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_4_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8268 (class 2606 OID 34920)
-- Name: inter_node_wallet_trxn_log_4 fk_inter_node_wallet_trxn_log_4_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_4_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8269 (class 2606 OID 34925)
-- Name: inter_node_wallet_trxn_log_4 fk_inter_node_wallet_trxn_log_4_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_4_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8272 (class 2606 OID 35702)
-- Name: inter_node_wallet_trxn_log_4 fk_inter_node_wallet_trxn_log_4_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_4_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8270 (class 2606 OID 34930)
-- Name: inter_node_wallet_trxn_log_4 fk_inter_node_wallet_trxn_log_4_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_4_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8273 (class 2606 OID 34964)
-- Name: inter_node_wallet_trxn_log_5 fk_inter_node_wallet_trxn_log_5_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_5_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8277 (class 2606 OID 35709)
-- Name: inter_node_wallet_trxn_log_5 fk_inter_node_wallet_trxn_log_5_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_5_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8274 (class 2606 OID 34969)
-- Name: inter_node_wallet_trxn_log_5 fk_inter_node_wallet_trxn_log_5_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_5_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8275 (class 2606 OID 34974)
-- Name: inter_node_wallet_trxn_log_5 fk_inter_node_wallet_trxn_log_5_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_5_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8278 (class 2606 OID 35714)
-- Name: inter_node_wallet_trxn_log_5 fk_inter_node_wallet_trxn_log_5_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_5_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8276 (class 2606 OID 34979)
-- Name: inter_node_wallet_trxn_log_5 fk_inter_node_wallet_trxn_log_5_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inter_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_inter_node_wallet_trxn_log_5_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8303 (class 2606 OID 35210)
-- Name: intra_node_wallet_trxn_log_0 fk_intra_node_wallet_trxn_log_0_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_0_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8307 (class 2606 OID 35637)
-- Name: intra_node_wallet_trxn_log_0 fk_intra_node_wallet_trxn_log_0_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_0_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8304 (class 2606 OID 35215)
-- Name: intra_node_wallet_trxn_log_0 fk_intra_node_wallet_trxn_log_0_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_0_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8305 (class 2606 OID 35220)
-- Name: intra_node_wallet_trxn_log_0 fk_intra_node_wallet_trxn_log_0_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_0_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8308 (class 2606 OID 35642)
-- Name: intra_node_wallet_trxn_log_0 fk_intra_node_wallet_trxn_log_0_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_0_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8306 (class 2606 OID 35225)
-- Name: intra_node_wallet_trxn_log_0 fk_intra_node_wallet_trxn_log_0_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_0
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_0_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8297 (class 2606 OID 35160)
-- Name: intra_node_wallet_trxn_log_1 fk_intra_node_wallet_trxn_log_1_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_1_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8301 (class 2606 OID 35625)
-- Name: intra_node_wallet_trxn_log_1 fk_intra_node_wallet_trxn_log_1_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_1_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8298 (class 2606 OID 35165)
-- Name: intra_node_wallet_trxn_log_1 fk_intra_node_wallet_trxn_log_1_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_1_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8299 (class 2606 OID 35170)
-- Name: intra_node_wallet_trxn_log_1 fk_intra_node_wallet_trxn_log_1_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_1_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8302 (class 2606 OID 35630)
-- Name: intra_node_wallet_trxn_log_1 fk_intra_node_wallet_trxn_log_1_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_1_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8300 (class 2606 OID 35175)
-- Name: intra_node_wallet_trxn_log_1 fk_intra_node_wallet_trxn_log_1_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_1
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_1_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8291 (class 2606 OID 35111)
-- Name: intra_node_wallet_trxn_log_2 fk_intra_node_wallet_trxn_log_2_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_2_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8295 (class 2606 OID 35613)
-- Name: intra_node_wallet_trxn_log_2 fk_intra_node_wallet_trxn_log_2_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_2_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8292 (class 2606 OID 35116)
-- Name: intra_node_wallet_trxn_log_2 fk_intra_node_wallet_trxn_log_2_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_2_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8293 (class 2606 OID 35121)
-- Name: intra_node_wallet_trxn_log_2 fk_intra_node_wallet_trxn_log_2_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_2_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8296 (class 2606 OID 35618)
-- Name: intra_node_wallet_trxn_log_2 fk_intra_node_wallet_trxn_log_2_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_2_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8294 (class 2606 OID 35126)
-- Name: intra_node_wallet_trxn_log_2 fk_intra_node_wallet_trxn_log_2_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_2
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_2_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8285 (class 2606 OID 35062)
-- Name: intra_node_wallet_trxn_log_3 fk_intra_node_wallet_trxn_log_3_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_3_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8289 (class 2606 OID 35601)
-- Name: intra_node_wallet_trxn_log_3 fk_intra_node_wallet_trxn_log_3_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_3_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8286 (class 2606 OID 35067)
-- Name: intra_node_wallet_trxn_log_3 fk_intra_node_wallet_trxn_log_3_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_3_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8287 (class 2606 OID 35072)
-- Name: intra_node_wallet_trxn_log_3 fk_intra_node_wallet_trxn_log_3_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_3_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8290 (class 2606 OID 35606)
-- Name: intra_node_wallet_trxn_log_3 fk_intra_node_wallet_trxn_log_3_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_3_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8288 (class 2606 OID 35077)
-- Name: intra_node_wallet_trxn_log_3 fk_intra_node_wallet_trxn_log_3_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_3
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_3_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8279 (class 2606 OID 35013)
-- Name: intra_node_wallet_trxn_log_4 fk_intra_node_wallet_trxn_log_4_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_4_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8283 (class 2606 OID 35589)
-- Name: intra_node_wallet_trxn_log_4 fk_intra_node_wallet_trxn_log_4_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_4_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8280 (class 2606 OID 35018)
-- Name: intra_node_wallet_trxn_log_4 fk_intra_node_wallet_trxn_log_4_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_4_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8281 (class 2606 OID 35023)
-- Name: intra_node_wallet_trxn_log_4 fk_intra_node_wallet_trxn_log_4_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_4_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8284 (class 2606 OID 35594)
-- Name: intra_node_wallet_trxn_log_4 fk_intra_node_wallet_trxn_log_4_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_4_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8282 (class 2606 OID 35028)
-- Name: intra_node_wallet_trxn_log_4 fk_intra_node_wallet_trxn_log_4_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_4
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_4_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8345 (class 2606 OID 35554)
-- Name: intra_node_wallet_trxn_log_5 fk_intra_node_wallet_trxn_log_5_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_5_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8349 (class 2606 OID 35577)
-- Name: intra_node_wallet_trxn_log_5 fk_intra_node_wallet_trxn_log_5_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_5_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8346 (class 2606 OID 35559)
-- Name: intra_node_wallet_trxn_log_5 fk_intra_node_wallet_trxn_log_5_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_5_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8347 (class 2606 OID 35564)
-- Name: intra_node_wallet_trxn_log_5 fk_intra_node_wallet_trxn_log_5_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_5_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8350 (class 2606 OID 35582)
-- Name: intra_node_wallet_trxn_log_5 fk_intra_node_wallet_trxn_log_5_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_5_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8348 (class 2606 OID 35569)
-- Name: intra_node_wallet_trxn_log_5 fk_intra_node_wallet_trxn_log_5_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intra_node_wallet_trxn_log_5
    ADD CONSTRAINT fk_intra_node_wallet_trxn_log_5_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8374 (class 2606 OID 97059)
-- Name: journal_line_summary fk_journal_line_summary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary
    ADD CONSTRAINT fk_journal_line_summary_id FOREIGN KEY (journal_id) REFERENCES public.journal(id);


--
-- TOC entry 8372 (class 2606 OID 38136)
-- Name: merchant_profiles fk_merchant_profiles_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profiles
    ADD CONSTRAINT fk_merchant_profiles_scheme_code FOREIGN KEY (scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8373 (class 2606 OID 38141)
-- Name: merchant_profiles fk_merchant_profiles_user_sys_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_profiles
    ADD CONSTRAINT fk_merchant_profiles_user_sys_id FOREIGN KEY (user_sys_id) REFERENCES public.merchant_users(id);


--
-- TOC entry 8365 (class 2606 OID 37239)
-- Name: pos_profiles fk_pos_profiles_user_sys_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profiles
    ADD CONSTRAINT fk_pos_profiles_user_sys_id FOREIGN KEY (user_sys_id) REFERENCES public.users(id);


--
-- TOC entry 8363 (class 2606 OID 37229)
-- Name: pos_profiles fk_pos_users_profiles_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profiles
    ADD CONSTRAINT fk_pos_users_profiles_scheme_code FOREIGN KEY (scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8364 (class 2606 OID 37234)
-- Name: pos_profiles fk_pos_users_profiles_user_sys_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos_profiles
    ADD CONSTRAINT fk_pos_users_profiles_user_sys_id FOREIGN KEY (user_sys_id) REFERENCES public.users(id);


--
-- TOC entry 8368 (class 2606 OID 37352)
-- Name: super_agent_profiles fk_super_agent_profiles_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profiles
    ADD CONSTRAINT fk_super_agent_profiles_scheme_code FOREIGN KEY (scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8369 (class 2606 OID 37357)
-- Name: super_agent_profiles fk_super_agent_profiles_user_sys_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_profiles
    ADD CONSTRAINT fk_super_agent_profiles_user_sys_id FOREIGN KEY (user_sys_id) REFERENCES public.users(id);


--
-- TOC entry 8239 (class 2606 OID 24340)
-- Name: super_agent_users_model fk_super_agent_users_model_profile_sys_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_agent_users_model
    ADD CONSTRAINT fk_super_agent_users_model_profile_sys_id FOREIGN KEY (profile_sys_id) REFERENCES public.super_agent_profile_details_model(id);


--
-- TOC entry 8309 (class 2606 OID 35259)
-- Name: wallet_to_bank_trxn_log_0 fk_wallet_to_bank_trxn_log_0_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_0
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_0_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8313 (class 2606 OID 35781)
-- Name: wallet_to_bank_trxn_log_0 fk_wallet_to_bank_trxn_log_0_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_0
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_0_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8310 (class 2606 OID 35264)
-- Name: wallet_to_bank_trxn_log_0 fk_wallet_to_bank_trxn_log_0_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_0
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_0_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8311 (class 2606 OID 35269)
-- Name: wallet_to_bank_trxn_log_0 fk_wallet_to_bank_trxn_log_0_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_0
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_0_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8314 (class 2606 OID 35786)
-- Name: wallet_to_bank_trxn_log_0 fk_wallet_to_bank_trxn_log_0_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_0
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_0_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8312 (class 2606 OID 35274)
-- Name: wallet_to_bank_trxn_log_0 fk_wallet_to_bank_trxn_log_0_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_0
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_0_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8315 (class 2606 OID 35308)
-- Name: wallet_to_bank_trxn_log_1 fk_wallet_to_bank_trxn_log_1_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_1
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_1_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8319 (class 2606 OID 35769)
-- Name: wallet_to_bank_trxn_log_1 fk_wallet_to_bank_trxn_log_1_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_1
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_1_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8316 (class 2606 OID 35313)
-- Name: wallet_to_bank_trxn_log_1 fk_wallet_to_bank_trxn_log_1_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_1
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_1_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8317 (class 2606 OID 35318)
-- Name: wallet_to_bank_trxn_log_1 fk_wallet_to_bank_trxn_log_1_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_1
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_1_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8320 (class 2606 OID 35774)
-- Name: wallet_to_bank_trxn_log_1 fk_wallet_to_bank_trxn_log_1_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_1
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_1_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8318 (class 2606 OID 35323)
-- Name: wallet_to_bank_trxn_log_1 fk_wallet_to_bank_trxn_log_1_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_1
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_1_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8321 (class 2606 OID 35358)
-- Name: wallet_to_bank_trxn_log_2 fk_wallet_to_bank_trxn_log_2_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_2
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_2_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8325 (class 2606 OID 35757)
-- Name: wallet_to_bank_trxn_log_2 fk_wallet_to_bank_trxn_log_2_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_2
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_2_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8322 (class 2606 OID 35363)
-- Name: wallet_to_bank_trxn_log_2 fk_wallet_to_bank_trxn_log_2_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_2
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_2_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8323 (class 2606 OID 35368)
-- Name: wallet_to_bank_trxn_log_2 fk_wallet_to_bank_trxn_log_2_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_2
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_2_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8326 (class 2606 OID 35762)
-- Name: wallet_to_bank_trxn_log_2 fk_wallet_to_bank_trxn_log_2_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_2
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_2_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8324 (class 2606 OID 35373)
-- Name: wallet_to_bank_trxn_log_2 fk_wallet_to_bank_trxn_log_2_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_2
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_2_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8327 (class 2606 OID 35407)
-- Name: wallet_to_bank_trxn_log_3 fk_wallet_to_bank_trxn_log_3_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_3
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_3_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8331 (class 2606 OID 35745)
-- Name: wallet_to_bank_trxn_log_3 fk_wallet_to_bank_trxn_log_3_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_3
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_3_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8328 (class 2606 OID 35412)
-- Name: wallet_to_bank_trxn_log_3 fk_wallet_to_bank_trxn_log_3_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_3
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_3_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8329 (class 2606 OID 35417)
-- Name: wallet_to_bank_trxn_log_3 fk_wallet_to_bank_trxn_log_3_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_3
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_3_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8332 (class 2606 OID 35750)
-- Name: wallet_to_bank_trxn_log_3 fk_wallet_to_bank_trxn_log_3_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_3
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_3_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8330 (class 2606 OID 35422)
-- Name: wallet_to_bank_trxn_log_3 fk_wallet_to_bank_trxn_log_3_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_3
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_3_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8333 (class 2606 OID 35456)
-- Name: wallet_to_bank_trxn_log_4 fk_wallet_to_bank_trxn_log_4_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_4_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8337 (class 2606 OID 35733)
-- Name: wallet_to_bank_trxn_log_4 fk_wallet_to_bank_trxn_log_4_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_4_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8334 (class 2606 OID 35461)
-- Name: wallet_to_bank_trxn_log_4 fk_wallet_to_bank_trxn_log_4_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_4_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8335 (class 2606 OID 35466)
-- Name: wallet_to_bank_trxn_log_4 fk_wallet_to_bank_trxn_log_4_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_4_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8338 (class 2606 OID 35738)
-- Name: wallet_to_bank_trxn_log_4 fk_wallet_to_bank_trxn_log_4_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_4_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8336 (class 2606 OID 35471)
-- Name: wallet_to_bank_trxn_log_4 fk_wallet_to_bank_trxn_log_4_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_4_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8339 (class 2606 OID 35505)
-- Name: wallet_to_bank_trxn_log_5 fk_wallet_to_bank_trxn_log_5_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_5
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_5_channel_id FOREIGN KEY (channel_id) REFERENCES public.service_channels(channel_id);


--
-- TOC entry 8343 (class 2606 OID 35721)
-- Name: wallet_to_bank_trxn_log_5 fk_wallet_to_bank_trxn_log_5_cr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_5
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_5_cr_profile_type_code FOREIGN KEY (credit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8340 (class 2606 OID 35510)
-- Name: wallet_to_bank_trxn_log_5 fk_wallet_to_bank_trxn_log_5_credit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_5
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_5_credit_scheme_code FOREIGN KEY (credit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8341 (class 2606 OID 35515)
-- Name: wallet_to_bank_trxn_log_5 fk_wallet_to_bank_trxn_log_5_debit_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_5
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_5_debit_scheme_code FOREIGN KEY (debit_scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8344 (class 2606 OID 35726)
-- Name: wallet_to_bank_trxn_log_5 fk_wallet_to_bank_trxn_log_5_dr_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_5
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_5_dr_profile_type_code FOREIGN KEY (debit_profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8342 (class 2606 OID 35520)
-- Name: wallet_to_bank_trxn_log_5 fk_wallet_to_bank_trxn_log_5_profile_type_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_5
    ADD CONSTRAINT fk_wallet_to_bank_trxn_log_5_profile_type_code FOREIGN KEY (profile_type_code) REFERENCES public.profile_types(profile_type_code);


--
-- TOC entry 8240 (class 2606 OID 34344)
-- Name: operational_charges operational_charges_scheme_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operational_charges
    ADD CONSTRAINT operational_charges_scheme_code FOREIGN KEY (scheme_code) REFERENCES public.schemes(scheme_code);


--
-- TOC entry 8241 (class 2606 OID 34349)
-- Name: operational_charges operational_charges_wallet_accnt_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operational_charges
    ADD CONSTRAINT operational_charges_wallet_accnt_num FOREIGN KEY (wallet_accnt_num) REFERENCES public.biller_operational_wallets(wallet_accnt_num);


-- Completed on 2024-09-12 12:28:35

--
-- PostgreSQL database dump complete
--

