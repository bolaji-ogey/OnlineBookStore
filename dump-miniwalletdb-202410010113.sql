--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2024-10-01 01:13:27

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 293 (class 1259 OID 86828)
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
-- TOC entry 292 (class 1259 OID 86827)
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
-- TOC entry 235 (class 1259 OID 64424)
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
-- TOC entry 234 (class 1259 OID 64423)
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
-- TOC entry 231 (class 1259 OID 56197)
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
-- TOC entry 230 (class 1259 OID 56196)
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
-- TOC entry 247 (class 1259 OID 72617)
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
-- TOC entry 246 (class 1259 OID 72616)
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
-- TOC entry 233 (class 1259 OID 64354)
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
-- TOC entry 232 (class 1259 OID 64353)
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
-- TOC entry 239 (class 1259 OID 64530)
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
-- TOC entry 238 (class 1259 OID 64529)
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
-- TOC entry 237 (class 1259 OID 64466)
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
-- TOC entry 236 (class 1259 OID 64465)
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
-- TOC entry 308 (class 1259 OID 98076)
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
    bonus_accelerate boolean DEFAULT true NOT NULL,
    use_donation_percentage boolean DEFAULT true NOT NULL,
    donation_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    minimum_donation numeric(15,2) DEFAULT 0.00,
    donation_cap numeric(15,2) DEFAULT 0.00,
    use_communication_percentage boolean DEFAULT true NOT NULL,
    communication_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    minimum_communication_saving numeric(15,2) DEFAULT 0.00,
    communication_save_cap numeric(15,2) DEFAULT 0.00,
    use_utility_percentage boolean DEFAULT true NOT NULL,
    utility_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    minimum_utility_saving numeric(15,2) DEFAULT 0.00,
    utility_save_cap numeric(15,2) DEFAULT 0.00,
    use_healthcare_percentage boolean DEFAULT true NOT NULL,
    healthcare_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    minimum_healthcare_saving numeric(15,2) DEFAULT 0.00,
    healthcare_save_cap numeric(15,2) DEFAULT 0.00,
    use_legal_percentage boolean DEFAULT true NOT NULL,
    legal_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    minimum_legal_saving numeric(15,2) DEFAULT 0.00,
    legal_save_cap numeric(15,2) DEFAULT 0.00,
    use_housing_percentage boolean DEFAULT true NOT NULL,
    housing_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    minimum_housing_saving numeric(15,2) DEFAULT 0.00,
    housing_save_cap numeric(15,2) DEFAULT 0.00,
    use_housing_asset_percentage boolean DEFAULT true NOT NULL,
    housing_asset_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    minimum_housing_asset_saving numeric(15,2) DEFAULT 0.00,
    housing_asset_save_cap numeric(15,2) DEFAULT 0.00,
    use_education_training_percentage boolean DEFAULT true NOT NULL,
    education_training_percentage_or_fixedvalue numeric(15,2) DEFAULT 0.00,
    minimum_education_training_saving numeric(15,2) DEFAULT 0.00,
    education_training_save_cap numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.billing_charges_config OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 55216)
-- Name: de_dynamic_class_4_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.de_dynamic_class_4_students (
    id integer NOT NULL,
    first_name character(60) DEFAULT '-'::bpchar NOT NULL,
    last_name character(15) DEFAULT '-'::bpchar NOT NULL,
    date_of_birth date,
    last_class_grade character(2) DEFAULT '-'::bpchar NOT NULL,
    gender character(1) DEFAULT 'M'::bpchar NOT NULL,
    create_date timestamp without time zone
);


ALTER TABLE public.de_dynamic_class_4_students OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 55215)
-- Name: de_dynamic_class_4_students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.de_dynamic_class_4_students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.de_dynamic_class_4_students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 300 (class 1259 OID 97094)
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
-- TOC entry 299 (class 1259 OID 97093)
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
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 299
-- Name: journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_id_seq OWNED BY public.journal.id;


--
-- TOC entry 304 (class 1259 OID 97200)
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
-- TOC entry 303 (class 1259 OID 97199)
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
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 303
-- Name: journal_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_line_id_seq OWNED BY public.journal_line.id;


--
-- TOC entry 302 (class 1259 OID 97121)
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
-- TOC entry 301 (class 1259 OID 97120)
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
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 301
-- Name: journal_line_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_line_summary_id_seq OWNED BY public.journal_line_summary.id;


--
-- TOC entry 305 (class 1259 OID 97452)
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
-- TOC entry 211 (class 1259 OID 54938)
-- Name: mini_wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mini_wallet (
    id integer NOT NULL,
    customer_reference character(60) DEFAULT '-'::bpchar NOT NULL,
    previous_balance numeric(15,2) DEFAULT 0.00,
    balance numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.mini_wallet OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 54937)
-- Name: mini_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mini_wallet ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mini_wallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 55653)
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
-- TOC entry 226 (class 1259 OID 55652)
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
-- TOC entry 229 (class 1259 OID 55661)
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
-- TOC entry 228 (class 1259 OID 55660)
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
-- TOC entry 307 (class 1259 OID 97470)
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
-- TOC entry 306 (class 1259 OID 97461)
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
-- TOC entry 243 (class 1259 OID 72524)
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
-- TOC entry 242 (class 1259 OID 72523)
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
-- TOC entry 241 (class 1259 OID 72481)
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
-- TOC entry 240 (class 1259 OID 72480)
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
-- TOC entry 255 (class 1259 OID 84676)
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
-- TOC entry 257 (class 1259 OID 84725)
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
-- TOC entry 256 (class 1259 OID 84724)
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
-- TOC entry 259 (class 1259 OID 84774)
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
-- TOC entry 258 (class 1259 OID 84773)
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
-- TOC entry 261 (class 1259 OID 84825)
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
-- TOC entry 260 (class 1259 OID 84824)
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
-- TOC entry 263 (class 1259 OID 84874)
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
-- TOC entry 262 (class 1259 OID 84873)
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
-- TOC entry 265 (class 1259 OID 84923)
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
-- TOC entry 264 (class 1259 OID 84922)
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
-- TOC entry 254 (class 1259 OID 84675)
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
-- TOC entry 267 (class 1259 OID 84974)
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
-- TOC entry 269 (class 1259 OID 85023)
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
-- TOC entry 268 (class 1259 OID 85022)
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
-- TOC entry 271 (class 1259 OID 85072)
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
-- TOC entry 270 (class 1259 OID 85071)
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
-- TOC entry 273 (class 1259 OID 85121)
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
-- TOC entry 272 (class 1259 OID 85120)
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
-- TOC entry 275 (class 1259 OID 85170)
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
-- TOC entry 274 (class 1259 OID 85169)
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
-- TOC entry 277 (class 1259 OID 85219)
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
-- TOC entry 276 (class 1259 OID 85218)
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
-- TOC entry 266 (class 1259 OID 84973)
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
-- TOC entry 291 (class 1259 OID 86107)
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
-- TOC entry 281 (class 1259 OID 85760)
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
-- TOC entry 280 (class 1259 OID 85759)
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
-- TOC entry 283 (class 1259 OID 85829)
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
-- TOC entry 282 (class 1259 OID 85828)
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
-- TOC entry 285 (class 1259 OID 85900)
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
-- TOC entry 284 (class 1259 OID 85899)
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
-- TOC entry 287 (class 1259 OID 85969)
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
-- TOC entry 286 (class 1259 OID 85968)
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
-- TOC entry 289 (class 1259 OID 86038)
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
-- TOC entry 288 (class 1259 OID 86037)
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
-- TOC entry 290 (class 1259 OID 86106)
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
-- TOC entry 245 (class 1259 OID 72543)
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
-- TOC entry 244 (class 1259 OID 72542)
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
-- TOC entry 295 (class 1259 OID 87005)
-- Name: request_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request_log (
    id bigint NOT NULL,
    request_id character(20) DEFAULT '_'::bpchar,
    request_company_id character(20) DEFAULT '_'::bpchar,
    request_partner_code character(20) DEFAULT '_'::bpchar,
    request_application_code character(20) DEFAULT '_'::bpchar,
    request_direction character(3) DEFAULT 'IN'::bpchar,
    request_type character(4) DEFAULT 'POST'::bpchar,
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
-- TOC entry 294 (class 1259 OID 87004)
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
-- TOC entry 297 (class 1259 OID 87022)
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
-- TOC entry 296 (class 1259 OID 87021)
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
-- TOC entry 251 (class 1259 OID 73431)
-- Name: transaction_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_history (
    id bigint NOT NULL,
    init_company_id character(10) DEFAULT '-'::bpchar NOT NULL,
    partner_code character(15) DEFAULT '-'::bpchar NOT NULL,
    application_code character(10) DEFAULT '-'::bpchar NOT NULL,
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
    bonus_credit_amount numeric(15,2) DEFAULT 0.00,
    bonus_debit_amount numeric(15,2) DEFAULT 0.00,
    avail_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    avail_bal_after_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_before_trxn numeric(15,2) DEFAULT 0.00,
    book_bal_after_trxn numeric(15,2) DEFAULT 0.00,
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
-- TOC entry 250 (class 1259 OID 73430)
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
-- TOC entry 215 (class 1259 OID 55131)
-- Name: transaction_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_log (
    id integer NOT NULL,
    trans_id bigint DEFAULT '-1'::integer NOT NULL,
    trans_ref character(60) DEFAULT '-'::bpchar NOT NULL,
    processor_resp_code character(2) DEFAULT '-'::bpchar NOT NULL,
    processor_resp_ref character(60) DEFAULT '-'::bpchar NOT NULL,
    trans_status_code integer DEFAULT 400 NOT NULL,
    trans_status character(60) DEFAULT '-'::bpchar NOT NULL,
    trans_amount numeric(15,2) DEFAULT 0.00,
    trans_value numeric(15,2) DEFAULT 0.00,
    total_trans_fees numeric(15,2) DEFAULT 0.00,
    bonus_pot_debit_amount numeric(15,2) DEFAULT 0.00,
    bonus_pot_credit_amount numeric(15,2) DEFAULT 0.00,
    customer_reference character(60) DEFAULT '-'::bpchar NOT NULL,
    beneficiary_account_name character(80) DEFAULT '-'::bpchar NOT NULL,
    beneficiary_bank_code character(6) DEFAULT '-'::bpchar NOT NULL,
    beneficiary_customer_id character(20) DEFAULT '-'::bpchar NOT NULL,
    beneficiary_bank_name character(40) DEFAULT '-'::bpchar NOT NULL,
    beneficiary_account_number character(15) DEFAULT '-'::bpchar NOT NULL,
    source_account_number character(15) DEFAULT '-'::bpchar NOT NULL,
    source_account_name character(30) DEFAULT '-'::bpchar NOT NULL,
    narration character(120) DEFAULT '-'::bpchar NOT NULL,
    remark character(80) DEFAULT '-'::bpchar NOT NULL,
    trans_start_date character(30) DEFAULT '-'::bpchar NOT NULL,
    trans_end_date character(30) DEFAULT '-'::bpchar NOT NULL,
    trans_date timestamp without time zone,
    trans_mode character(30) DEFAULT '-'::bpchar NOT NULL
);


ALTER TABLE public.transaction_log OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 55130)
-- Name: transaction_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transaction_log ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transaction_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 72748)
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
-- TOC entry 248 (class 1259 OID 72747)
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
-- TOC entry 298 (class 1259 OID 96878)
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
-- TOC entry 225 (class 1259 OID 55605)
-- Name: user_ussd_menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_ussd_menus (
    id bigint NOT NULL,
    ussd_service_code character(5) DEFAULT '-'::bpchar NOT NULL,
    menu_title character(15) DEFAULT '-'::bpchar NOT NULL,
    menu_directory character(30) DEFAULT '-'::bpchar NOT NULL,
    menu_level integer DEFAULT 0 NOT NULL,
    menu_select integer DEFAULT 0 NOT NULL,
    menu_options character(15) DEFAULT '-'::bpchar NOT NULL,
    menu character(30) DEFAULT '-'::bpchar NOT NULL,
    action_command character(30) DEFAULT '-'::bpchar NOT NULL,
    action_url character(120) DEFAULT '-'::bpchar NOT NULL,
    require_authorization boolean DEFAULT false,
    is_final boolean DEFAULT false,
    created_date date,
    created_time time without time zone
);


ALTER TABLE public.user_ussd_menus OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 55604)
-- Name: user_ussd_menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_ussd_menus ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_ussd_menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 55524)
-- Name: user_ussd_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_ussd_sessions (
    id bigint NOT NULL,
    ussd_service_code character(5) DEFAULT '-'::bpchar NOT NULL,
    mobile_number character(15) DEFAULT '-'::bpchar NOT NULL,
    previous_directory character(30) DEFAULT '-'::bpchar NOT NULL,
    current_directory character(30) DEFAULT '-'::bpchar NOT NULL,
    previous_level integer DEFAULT 0 NOT NULL,
    current_level integer DEFAULT 0 NOT NULL,
    action_expected boolean DEFAULT false,
    action_name character(40) DEFAULT '-'::bpchar NOT NULL,
    previous_select_option integer DEFAULT 0 NOT NULL,
    current_select_option integer DEFAULT 0 NOT NULL,
    previous_data_entered character(40) DEFAULT '-'::bpchar NOT NULL,
    current_data_entered character(40) DEFAULT '-'::bpchar NOT NULL,
    action_url character(120) DEFAULT '-'::bpchar NOT NULL,
    require_authorization boolean DEFAULT false,
    is_final boolean DEFAULT false,
    is_active_session boolean DEFAULT false,
    session_init_date timestamp without time zone,
    start_session_id bigint DEFAULT 0 NOT NULL,
    last_session_date date,
    last_session_time time without time zone
);


ALTER TABLE public.user_ussd_sessions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 55523)
-- Name: user_ussd_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_ussd_sessions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_ussd_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 55503)
-- Name: user_ussd_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_ussd_state (
    id bigint NOT NULL,
    ussd_service_code character(5) DEFAULT '-'::bpchar NOT NULL,
    mobile_number character(15) DEFAULT '-'::bpchar NOT NULL,
    previous_directory character(30) DEFAULT '-'::bpchar NOT NULL,
    current_directory character(30) DEFAULT '-'::bpchar NOT NULL,
    previous_level integer DEFAULT 0 NOT NULL,
    current_level integer DEFAULT 0 NOT NULL,
    action_expected boolean DEFAULT false,
    action_name character(40) DEFAULT '-'::bpchar NOT NULL,
    previous_select_option integer DEFAULT 0 NOT NULL,
    current_select_option integer DEFAULT 0 NOT NULL,
    previous_data_entered character(40) DEFAULT '-'::bpchar NOT NULL,
    current_data_entered character(40) DEFAULT '-'::bpchar NOT NULL,
    action_url character(120) DEFAULT '-'::bpchar NOT NULL,
    require_authorization boolean DEFAULT false,
    is_final boolean DEFAULT false,
    is_active_session boolean DEFAULT false,
    session_init_date timestamp without time zone,
    start_session_id bigint DEFAULT 0 NOT NULL,
    last_session_date date,
    last_session_time time without time zone
);


ALTER TABLE public.user_ussd_state OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 55502)
-- Name: user_ussd_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_ussd_state ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_ussd_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 55589)
-- Name: ussd_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ussd_services (
    id integer NOT NULL,
    ussd_service_code character(5) DEFAULT '-'::bpchar NOT NULL,
    current_user_count bigint DEFAULT 0 NOT NULL,
    service_description character(125) DEFAULT '-'::bpchar NOT NULL,
    action_url character(120) DEFAULT '-'::bpchar NOT NULL,
    require_authorization boolean DEFAULT false,
    highest_user_count bigint DEFAULT 0 NOT NULL,
    is_loaded_in_memory boolean DEFAULT false,
    config_approved_level_1 boolean DEFAULT false,
    config_approved_level_2 boolean DEFAULT false,
    last_access_date timestamp without time zone,
    registration_date date,
    registration_time time without time zone
);


ALTER TABLE public.ussd_services OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 55588)
-- Name: ussd_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ussd_services ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ussd_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 55020)
-- Name: wallet_balance_compact_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_balance_compact_history (
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
    balance_7 numeric(15,2) DEFAULT 0.00
);


ALTER TABLE public.wallet_balance_compact_history OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 55019)
-- Name: wallet_balance_compact_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wallet_balance_compact_history ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wallet_balance_compact_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 279 (class 1259 OID 85664)
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
-- TOC entry 278 (class 1259 OID 85663)
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
-- TOC entry 253 (class 1259 OID 81437)
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
-- TOC entry 252 (class 1259 OID 81436)
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
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 252
-- Name: wallet_to_bank_trxn_log_4_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_to_bank_trxn_log_4_id_seq OWNED BY public.wallet_to_bank_trxn_log_4.id;


--
-- TOC entry 4837 (class 2604 OID 97097)
-- Name: journal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal ALTER COLUMN id SET DEFAULT nextval('public.journal_id_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 97203)
-- Name: journal_line id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line ALTER COLUMN id SET DEFAULT nextval('public.journal_line_id_seq'::regclass);


--
-- TOC entry 4858 (class 2604 OID 97124)
-- Name: journal_line_summary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary ALTER COLUMN id SET DEFAULT nextval('public.journal_line_summary_id_seq'::regclass);


--
-- TOC entry 3804 (class 2604 OID 81440)
-- Name: wallet_to_bank_trxn_log_4 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4 ALTER COLUMN id SET DEFAULT nextval('public.wallet_to_bank_trxn_log_4_id_seq'::regclass);


--
-- TOC entry 5226 (class 0 OID 86828)
-- Dependencies: 293
-- Data for Name: account_credit_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_credit_history (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5168 (class 0 OID 64424)
-- Dependencies: 235
-- Data for Name: approval_item_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_item_groups (id, company_id, application_code, item_group_name, item_group_description, item_group_creation_date, item_group_creation_time, item_group_modification_date, item_group_modification_time) FROM stdin;
\.


--
-- TOC entry 5164 (class 0 OID 56197)
-- Dependencies: 231
-- Data for Name: approval_item_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_item_types (id, company_id, application_code, approval_item_group_id, item_name, description, is_financial_related, is_physical_object_related, is_relocation_related, approval_item_table, item_type_creator, item_type_creation_date, item_type_creation_time) FROM stdin;
\.


--
-- TOC entry 5180 (class 0 OID 72617)
-- Dependencies: 247
-- Data for Name: approval_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_items (id, company_id, application_code, approval_workflow_id, item_type_id, item_group_id, item_name, approval_batch_id, user_request_id, current_approver_id, current_approver_level, request_user_id, request_user, is_currently_been_reviewed, current_reviewer_user_id, is_approved_final, approve_comment, reject_reason, request_initiation_date, request_initiation_time) FROM stdin;
\.


--
-- TOC entry 5166 (class 0 OID 64354)
-- Dependencies: 233
-- Data for Name: approval_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_requests (id, company_id, application_code, approval_workflow_id, item_type_id, item_group_id, item_group_name, approval_batch_id, approval_item_id, batch_item_count, user_request_id, current_approver_id, current_approver_level, request_user_id, request_user, request_initiation_date, request_initiation_time, is_approved_final, approve_comment, reject_reason, approved_level_1_date, approved_level_1_time, approved_level_2_date, approved_level_2_time, approved_level_3_date, approved_level_3_time) FROM stdin;
\.


--
-- TOC entry 5172 (class 0 OID 64530)
-- Dependencies: 239
-- Data for Name: approval_routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_routes (id, company_id, application_code, item_group_id, item_type_id, approval_workflow_id, is_active_route, approver_user_group_id, approver_user_id, approver_level, approver_description, approver_name, is_final_approver, approver_route_create_date, approver_route_create_time, approver_route_modification_date, approver_route_modification_time) FROM stdin;
\.


--
-- TOC entry 5170 (class 0 OID 64466)
-- Dependencies: 237
-- Data for Name: approval_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_user_groups (id, company_id, application_code, user_group_name, user_group_description, user_group_approval_level, user_group_creation_date, user_group_creation_time, user_group_modification_date, user_group_modification_time) FROM stdin;
\.


--
-- TOC entry 5241 (class 0 OID 98076)
-- Dependencies: 308
-- Data for Name: billing_charges_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_charges_config (id, billing_code, partner_code, is_active, service_id, service_name, scheme_code, applicable_trxn_type, trxn_band, lower_limit_value, upper_limit_value, use_percentage, percentage_or_fixedvalue, trxn_charge_cap, date_configured, use_percentage_for_tax, tax_percentage_or_fixedvalue, tax_charge_cap, use_percentage_for_bank_commission, bank_commission_percentage_or_fixedvalue, bank_commission_share_cap, use_percentage_for_partner_commission, partner_commission_percentage_or_fixedvalue, partner_commission_share_cap, use_save_invest_percentage, save_invest_percentage_or_fixedvalue, minimum_save_invest, save_invest_cap, bonus_share, bonus_accelerate, use_donation_percentage, donation_percentage_or_fixedvalue, minimum_donation, donation_cap, use_communication_percentage, communication_percentage_or_fixedvalue, minimum_communication_saving, communication_save_cap, use_utility_percentage, utility_percentage_or_fixedvalue, minimum_utility_saving, utility_save_cap, use_healthcare_percentage, healthcare_percentage_or_fixedvalue, minimum_healthcare_saving, healthcare_save_cap, use_legal_percentage, legal_percentage_or_fixedvalue, minimum_legal_saving, legal_save_cap, use_housing_percentage, housing_percentage_or_fixedvalue, minimum_housing_saving, housing_save_cap, use_housing_asset_percentage, housing_asset_percentage_or_fixedvalue, minimum_housing_asset_saving, housing_asset_save_cap, use_education_training_percentage, education_training_percentage_or_fixedvalue, minimum_education_training_saving, education_training_save_cap) FROM stdin;
\.


--
-- TOC entry 5150 (class 0 OID 55216)
-- Dependencies: 217
-- Data for Name: de_dynamic_class_4_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.de_dynamic_class_4_students (id, first_name, last_name, date_of_birth, last_class_grade, gender, create_date) FROM stdin;
1	Darasimi                                                    	Ogeyingbo      	2015-05-15	A 	M	\N
\.


--
-- TOC entry 5233 (class 0 OID 97094)
-- Dependencies: 300
-- Data for Name: journal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal (id, trxn_request_id, trxn_reference, external_trxn_reference, journal_action, source_customer_reference, debit_partner_code, debit_scheme_code, debit_cust_user_id, debit_profile_id, debit_profile_type_code, debit_bank_code, debit_wallet_accnt_no, debit_wallet_accnt_num, trxn_amount, credit_partner_code, credit_scheme_code, credit_cust_user_id, credit_profile_id, credit_profile_type_code, credit_bank_code, credit_wallet_accnt_id, credit_wallet_accnt_num, memo, trxn_channel, trxn_type, service_provider_id, service_provider, service_name, trxn_date, trxn_time, due_date, narration, trans_status_code, sys_comment) FROM stdin;
\.


--
-- TOC entry 5237 (class 0 OID 97200)
-- Dependencies: 304
-- Data for Name: journal_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_line (id, profile_id, profile_type_code, journal_action, credit_debit_partner_code, credit_debit_scheme_code, is_credit_or_debit, credit_debit_value, jounal_id, wallet_account_id, wallet_account_num, current_balance, previous_balance, trxn_date, trxn_time, trxn_reference, external_trxn_reference, trxn_type, trxn_channel) FROM stdin;
\.


--
-- TOC entry 5235 (class 0 OID 97121)
-- Dependencies: 302
-- Data for Name: journal_line_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_line_summary (id, journal_id, journal_action, debit_profile_id, debit_profile_type_code, debit_partner_code, debit_scheme_code, debit_wallet_accnt_id, debit_wallet_accnt_value, credit_partner_code, credit_scheme_code, credit_profile_id, credit_profile_type_code, credit_wallet_accnt_id, credit_wallet_accnt_value, "operational_wallet_accnt_id", operational_wallet_accnt_value, operational_wallet_accnt_credit_debit, host_fee_wallet_id, host_fee_wallet_value, host_fee_wallet_credit_debit, biller_wallet_id, biller_payable_recievable, biller_wallet_value, biller_credit_debit, biller_commission_wallet_id, biller_commission_payable_recievable, biller_commission_wallet_value, biller_commission_wallet_credit_debit, tax_wallet_id, tax_type_id, tax_type, tax_wallet_value, tax_wallet_credit_debit, partner_commission_1_wallet_id, partner_commission_1_payable_recievable, partner_commission_1_wallet_value, partner_commission_1_wallet_credit_debit, partner_commission_2_wallet_id, partner_commission_2_payable_recievable, partner_commission_2_wallet_value, partner_commission_2_wallet_credit_debit, trxn_date, trxn_time, trxn_reference, external_trxn_reference, trxn_type, trxn_channel) FROM stdin;
\.


--
-- TOC entry 5238 (class 0 OID 97452)
-- Dependencies: 305
-- Data for Name: merchant_access_whitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_access_whitelist (ip_address, merchant_full_name, merchant_mobile_num, is_active) FROM stdin;
\.


--
-- TOC entry 5144 (class 0 OID 54938)
-- Dependencies: 211
-- Data for Name: mini_wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mini_wallet (id, customer_reference, previous_balance, balance) FROM stdin;
1	moweuebubq372447424                                         	152700.00	153200.00
\.


--
-- TOC entry 5160 (class 0 OID 55653)
-- Dependencies: 227
-- Data for Name: node_in_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.node_in_sessions (id, node_index, node_name, start_in_session_id, end_in_session_id, start_in_session_date, start_in_session_time, end_in_session_date, end_in_session_time) FROM stdin;
\.


--
-- TOC entry 5162 (class 0 OID 55661)
-- Dependencies: 229
-- Data for Name: node_out_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.node_out_sessions (id, node_index, node_name, start_out_session_id, end_out_session_id, start_out_session_date, start_out_session_time, end_out_session_date, end_out_session_time, is_outof_service) FROM stdin;
\.


--
-- TOC entry 5240 (class 0 OID 97470)
-- Dependencies: 307
-- Data for Name: partner_access_blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_access_blacklist (ip_address, user_full_name, user_mobile_num, is_allowed) FROM stdin;
\.


--
-- TOC entry 5239 (class 0 OID 97461)
-- Dependencies: 306
-- Data for Name: partner_access_whitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_access_whitelist (ip_address, partner_full_name, partner_mobile_num, is_active) FROM stdin;
\.


--
-- TOC entry 5176 (class 0 OID 72524)
-- Dependencies: 243
-- Data for Name: partner_loan_tenures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_loan_tenures (id, company_id, partner_code, application_code, loan_name, lender_code, minimum_amount, maximum_amount, minimum_duration, maximum_duration, tenure_type, loan_type, loan_type_id, service_type, rate, is_active) FROM stdin;
\.


--
-- TOC entry 5174 (class 0 OID 72481)
-- Dependencies: 241
-- Data for Name: partner_loan_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_loan_types (id, company_id, partner_code, application_code, loan_name, loan_description, loan_type, short_name, is_active) FROM stdin;
\.


--
-- TOC entry 5188 (class 0 OID 84676)
-- Dependencies: 255
-- Data for Name: pending_bank_credit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5190 (class 0 OID 84725)
-- Dependencies: 257
-- Data for Name: pending_bank_credit_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_0 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5192 (class 0 OID 84774)
-- Dependencies: 259
-- Data for Name: pending_bank_credit_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_1 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5194 (class 0 OID 84825)
-- Dependencies: 261
-- Data for Name: pending_bank_credit_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_2 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5196 (class 0 OID 84874)
-- Dependencies: 263
-- Data for Name: pending_bank_credit_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_3 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5198 (class 0 OID 84923)
-- Dependencies: 265
-- Data for Name: pending_bank_credit_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_bank_credit_4 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5200 (class 0 OID 84974)
-- Dependencies: 267
-- Data for Name: pending_node_credit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5202 (class 0 OID 85023)
-- Dependencies: 269
-- Data for Name: pending_node_credit_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_0 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5204 (class 0 OID 85072)
-- Dependencies: 271
-- Data for Name: pending_node_credit_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_1 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5206 (class 0 OID 85121)
-- Dependencies: 273
-- Data for Name: pending_node_credit_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_2 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5208 (class 0 OID 85170)
-- Dependencies: 275
-- Data for Name: pending_node_credit_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_3 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5210 (class 0 OID 85219)
-- Dependencies: 277
-- Data for Name: pending_node_credit_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_node_credit_4 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, credit_amount, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, debit_accnt_in_memory, credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5224 (class 0 OID 86107)
-- Dependencies: 291
-- Data for Name: pending_process_trxn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5214 (class 0 OID 85760)
-- Dependencies: 281
-- Data for Name: pending_process_trxn_0; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_0 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5216 (class 0 OID 85829)
-- Dependencies: 283
-- Data for Name: pending_process_trxn_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_1 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5218 (class 0 OID 85900)
-- Dependencies: 285
-- Data for Name: pending_process_trxn_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_2 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5220 (class 0 OID 85969)
-- Dependencies: 287
-- Data for Name: pending_process_trxn_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_3 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5222 (class 0 OID 86038)
-- Dependencies: 289
-- Data for Name: pending_process_trxn_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pending_process_trxn_4 (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, bearer_token_hash, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, currency_exchange_log_reference_id, currency_exchange_rate, reciever_scheme_code, reciever_profile_type_code, reciever_customer_reference, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, credit_currency_name, credit_currency_code, credit_currency_symbol, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, is_processed, is_selected, is_debit_wallet_in_memory, is_credit_accnt_in_memory, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5178 (class 0 OID 72543)
-- Dependencies: 245
-- Data for Name: request_item_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_item_batches (id, company_id, application_code, approval_workflow_id, item_type_id, total_item_count, total_item_count_in_words, total_item_count_in_words_hash, is_currently_been_reviewed, current_reviewer_user_id, is_approved_final, approve_comment, reject_reason, request_batch_date, request_batch_time, approved_level_1_date, approved_level_1_time, approved_level_2_date, approved_level_2_time, approved_level_3_date, approved_level_3_time) FROM stdin;
\.


--
-- TOC entry 5228 (class 0 OID 87005)
-- Dependencies: 295
-- Data for Name: request_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_log (id, request_id, request_company_id, request_partner_code, request_application_code, request_direction, request_type, request_hash, request_json, is_request_parsed_ok, request_time, request_date, response_sent, is_successfully_processed) FROM stdin;
\.


--
-- TOC entry 5230 (class 0 OID 87022)
-- Dependencies: 297
-- Data for Name: response_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.response_log (id, request_id, response_company_id, response_partner_code, response_application_code, response_direction, response_type, response_hash, response_json, response_time, response_date, is_successfully_processed) FROM stdin;
\.


--
-- TOC entry 5184 (class 0 OID 73431)
-- Dependencies: 251
-- Data for Name: transaction_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_history (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_reference, processor_reference, processor_auth_key_hash, trxn_event, trxn_type, trxn_mode, currency_name, currency_code, currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, sender_name, sender_wallet, reciever_name, reciever_bank_code, reciever_account, reciever_bank, total_trxn_amount, trxn_value_amount, total_trxn_fee_amount, trxn_process_code, trxn_status_code, trxn_status, bonus_credit_amount, bonus_debit_amount, avail_bal_before_trxn, avail_bal_after_trxn, book_bal_before_trxn, book_bal_after_trxn, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, narration, is_finalized, update_check) FROM stdin;
\.


--
-- TOC entry 5148 (class 0 OID 55131)
-- Dependencies: 215
-- Data for Name: transaction_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_log (id, trans_id, trans_ref, processor_resp_code, processor_resp_ref, trans_status_code, trans_status, trans_amount, trans_value, total_trans_fees, bonus_pot_debit_amount, bonus_pot_credit_amount, customer_reference, beneficiary_account_name, beneficiary_bank_code, beneficiary_customer_id, beneficiary_bank_name, beneficiary_account_number, source_account_number, source_account_name, narration, remark, trans_start_date, trans_end_date, trans_date, trans_mode) FROM stdin;
149	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
150	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
151	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
152	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
153	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
154	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
155	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
156	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
157	303	SPECS-20231016-UGPZ7JLQ8CV3DO5                              	00	SYSTEMSPECS-20231016-WFU2348BRGDOPVH                        	200	Successful                                                  	107.50	400.00	7.50	0.00	0.00	moweuebubq372447424                                         	NKECHI Agu Obi                                                                  	Wallet	08095510360         	Pouchii                                 	8106690983     	5906528384     	Abdulmalik Agu Obi            	Send Money                                                                                                              	                                                                                	                              	                              	\N	WalletToWallet                
\.


--
-- TOC entry 5182 (class 0 OID 72748)
-- Dependencies: 249
-- Data for Name: transaction_register; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_register (id, wallet_id, wallet_accnt_number, customer_reference, current_column_ref, trxn_date_0, trxn_time_0, trxn_post_type_0, trxn_post_function_0, trxn_amount_0, total_trxn_fee_0, auth_user_id_0, auth_factor_1_key_hash_0, reciever_bank_type_0, reciever_accnt_num_0, reciever_bank_code_0, trxn_date_1, trxn_time_1, trxn_post_type_1, trxn_post_function_1, trxn_amount_1, total_trxn_fee_1, auth_user_id_1, auth_factor_1_key_hash_1, auth_factor_2_key_hash_1, reciever_bank_type_1, reciever_accnt_num_1, reciever_bank_code_1, trxn_date_2, trxn_time_2, trxn_post_type_2, trxn_post_function_2, trxn_amount_2, total_trxn_fee_2, auth_user_id_2, auth_factor_1_key_hash_2, auth_factor_2_key_hash_2, reciever_bank_type_2, reciever_accnt_num_2, reciever_bank_code_2, trxn_date_3, trxn_time_3, trxn_post_type_3, trxn_post_function_3, trxn_amount_3, total_trxn_fee_3, auth_user_id_3, auth_factor_1_key_hash_3, auth_factor_2_key_hash_3, reciever_bank_type_3, reciever_accnt_num_3, reciever_bank_code_3, trxn_date_4, trxn_time_4, trxn_post_type_4, trxn_post_function_4, trxn_amount_4, total_trxn_fee_4, auth_user_id_4, auth_factor_1_key_hash_4, auth_factor_2_key_hash_4, reciever_bank_type_4, reciever_accnt_num_4, reciever_bank_code_4, trxn_date_5, trxn_time_5, trxn_post_type_5, trxn_post_function_5, trxn_amount_5, total_trxn_fee_5, auth_user_id_5, auth_factor_1_key_hash_5, auth_factor_2_key_hash_5, reciever_bank_type_5, reciever_accnt_num_5, reciever_bank_code_5, trxn_date_6, trxn_time_6, trxn_post_type_6, trxn_post_function_6, trxn_amount_6, total_trxn_fee_6, auth_user_id_6, auth_factor_1_key_hash_6, auth_factor_2_key_hash_6, reciever_bank_type_6, reciever_accnt_num_6, reciever_bank_code_6, trxn_date_7, trxn_time_7, trxn_post_type_7, trxn_post_function_7, trxn_amount_7, total_trxn_fee_7, auth_user_id_7, auth_factor_1_key_hash_7, auth_factor_2_key_hash_7, reciever_bank_type_7, reciever_accnt_num_7, reciever_bank_code_7, trxn_date_8, trxn_time_8, trxn_post_type_8, trxn_post_function_8, trxn_amount_8, total_trxn_fee_8, auth_user_id_8, auth_factor_1_key_hash_8, auth_factor_2_key_hash_8, reciever_bank_type_8, reciever_accnt_num_8, reciever_bank_code_8, trxn_date_9, trxn_time_9, trxn_post_type_9, trxn_post_function_9, trxn_amount_9, total_trxn_fee_9, auth_user_id_9, auth_factor_1_key_hash_9, auth_factor_2_key_hash_9, reciever_bank_type_9, reciever_accnt_num_9, reciever_bank_code_9) FROM stdin;
\.


--
-- TOC entry 5231 (class 0 OID 96878)
-- Dependencies: 298
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_sessions (ip_address, profile_type_code, customer_ref, partner_code, scheme_code, request_user_type, request_channel, old_request_key, new_request_key, expiry_time, is_active_session, notification_token, consecutive_login_retries, last_login_date, last_login_time) FROM stdin;
\.


--
-- TOC entry 5158 (class 0 OID 55605)
-- Dependencies: 225
-- Data for Name: user_ussd_menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_ussd_menus (id, ussd_service_code, menu_title, menu_directory, menu_level, menu_select, menu_options, menu, action_command, action_url, require_authorization, is_final, created_date, created_time) FROM stdin;
\.


--
-- TOC entry 5154 (class 0 OID 55524)
-- Dependencies: 221
-- Data for Name: user_ussd_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_ussd_sessions (id, ussd_service_code, mobile_number, previous_directory, current_directory, previous_level, current_level, action_expected, action_name, previous_select_option, current_select_option, previous_data_entered, current_data_entered, action_url, require_authorization, is_final, is_active_session, session_init_date, start_session_id, last_session_date, last_session_time) FROM stdin;
\.


--
-- TOC entry 5152 (class 0 OID 55503)
-- Dependencies: 219
-- Data for Name: user_ussd_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_ussd_state (id, ussd_service_code, mobile_number, previous_directory, current_directory, previous_level, current_level, action_expected, action_name, previous_select_option, current_select_option, previous_data_entered, current_data_entered, action_url, require_authorization, is_final, is_active_session, session_init_date, start_session_id, last_session_date, last_session_time) FROM stdin;
\.


--
-- TOC entry 5156 (class 0 OID 55589)
-- Dependencies: 223
-- Data for Name: ussd_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ussd_services (id, ussd_service_code, current_user_count, service_description, action_url, require_authorization, highest_user_count, is_loaded_in_memory, config_approved_level_1, config_approved_level_2, last_access_date, registration_date, registration_time) FROM stdin;
\.


--
-- TOC entry 5146 (class 0 OID 55020)
-- Dependencies: 213
-- Data for Name: wallet_balance_compact_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_balance_compact_history (id, wallet_id, wallet_accnt_number, customer_reference, current_column_ref, balance_0_change_date, balance_0_change_time, balance_0, balance_1_change_date, balance_1_change_time, balance_1, balance_2_change_date, balance_2_change_time, balance_2, balance_3_change_date, balance_3_change_time, balance_3, balance_4_change_date, balance_4_change_time, balance_4, balance_5_change_date, balance_5_change_time, balance_5, balance_6_change_date, balance_6_change_time, balance_6, balance_7_change_date, balance_7_change_time, balance_7) FROM stdin;
14	-1	-              	moweuebubq372447424                                         	8	2023-11-09	19:08:20.637146	500.00	2023-11-09	19:08:22.256831	500.00	2023-11-09	19:08:24.106183	500.00	2023-11-09	19:08:26.356622	500.00	2023-11-09	19:08:28.785519	500.00	2023-11-09	19:08:31.2816	500.00	2023-11-09	19:08:33.771835	500.00	2023-11-09	19:08:36.278052	500.00
11	-1	-              	moweuebubq372447424                                         	8	2023-11-09	19:06:11.252541	500.00	2023-11-09	19:06:12.881822	500.00	2023-11-09	19:06:14.819208	500.00	2023-11-09	19:06:17.054477	500.00	2023-11-09	19:06:19.443938	500.00	2023-11-09	19:06:22.744787	500.00	2023-11-09	19:06:25.222203	500.00	2023-11-09	19:07:04.922245	500.00
8	-1	-              	moweuebubq372447424                                         	8	2023-11-09	18:57:30.822504	500.00	2023-11-09	18:57:32.778826	500.00	2023-11-09	18:57:34.572428	500.00	2023-11-09	18:57:36.100597	500.00	2023-11-09	18:57:37.764484	500.00	2023-11-09	18:57:39.482574	500.00	2023-11-09	18:57:41.346699	500.00	2023-11-09	18:57:43.161781	500.00
19	-1	-              	moweuebubq372447424                                         	8	2023-11-10	14:55:45.708336	500.00	2023-11-10	14:55:46.296649	500.00	2023-11-10	14:55:46.882398	500.00	2023-11-10	14:55:47.372122	500.00	2023-11-10	14:55:47.681345	500.00	2023-11-10	14:55:48.077673	500.00	2023-11-10	14:55:48.427227	500.00	2023-11-10	14:55:48.762049	500.00
17	-1	-              	moweuebubq372447424                                         	8	2023-11-10	05:15:22.378705	500.00	2023-11-10	05:21:52.55788	500.00	2023-11-10	05:25:29.925671	500.00	2023-11-10	07:53:35.154266	500.00	2023-11-10	07:53:48.437231	500.00	2023-11-10	07:56:20.53558	500.00	2023-11-10	07:57:28.62631	500.00	2023-11-10	07:57:31.434548	500.00
12	-1	-              	moweuebubq372447424                                         	8	2023-11-09	19:07:07.371251	500.00	2023-11-09	19:07:09.689631	500.00	2023-11-09	19:07:11.890251	500.00	2023-11-09	19:07:14.132016	500.00	2023-11-09	19:07:16.48743	500.00	2023-11-09	19:07:18.89831	500.00	2023-11-09	19:07:21.395867	500.00	2023-11-09	19:07:23.609116	500.00
9	-1	-              	moweuebubq372447424                                         	8	2023-11-09	19:03:38.729399	500.00	2023-11-09	19:03:54.927883	500.00	2023-11-09	19:03:56.710711	500.00	2023-11-09	19:03:58.561905	500.00	2023-11-09	19:04:00.190052	500.00	2023-11-09	19:04:01.755377	500.00	2023-11-09	19:04:03.366865	500.00	2023-11-09	19:04:05.050885	500.00
15	-1	-              	moweuebubq372447424                                         	8	2023-11-09	19:17:34.267785	500.00	2023-11-09	19:17:36.185943	500.00	2023-11-09	19:17:37.802312	500.00	2023-11-09	19:17:39.483863	500.00	2023-11-09	19:17:41.042451	500.00	2023-11-09	19:17:43.959305	500.00	2023-11-09	19:17:45.617491	500.00	2023-11-09	19:17:47.421701	500.00
21	-1	-              	moweuebubq372447424                                         	8	2023-11-10	14:56:07.57257	500.00	2023-11-10	14:56:07.916515	500.00	2023-11-10	14:56:08.632702	500.00	2023-11-10	14:56:54.306719	500.00	2023-11-10	14:56:55.907866	500.00	2023-11-10	14:56:57.292947	500.00	2023-11-10	14:56:59.872269	500.00	2023-11-10	14:57:01.125091	500.00
13	-1	-              	moweuebubq372447424                                         	8	2023-11-09	19:07:25.798771	500.00	2023-11-09	19:07:28.150488	500.00	2023-11-09	19:08:09.291512	500.00	2023-11-09	19:08:11.825058	500.00	2023-11-09	19:08:13.721302	500.00	2023-11-09	19:08:15.324937	500.00	2023-11-09	19:08:17.115315	500.00	2023-11-09	19:08:18.793865	500.00
10	-1	-              	moweuebubq372447424                                         	8	2023-11-09	19:04:06.929914	500.00	2023-11-09	19:04:09.058166	500.00	2023-11-09	19:06:01.210216	500.00	2023-11-09	19:06:03.061653	500.00	2023-11-09	19:06:04.850147	500.00	2023-11-09	19:06:06.519158	500.00	2023-11-09	19:06:08.048142	500.00	2023-11-09	19:06:09.639272	500.00
27	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:31:18.499299	500.00	2023-11-11	06:31:19.103934	500.00	2023-11-11	06:31:19.595647	500.00	2023-11-11	06:31:20.098381	500.00	2023-11-11	06:38:09.367708	500.00	2023-11-11	06:38:10.211549	500.00	2023-11-11	06:38:11.002728	500.00	2023-11-11	06:38:12.028798	500.00
25	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:26:30.87047	500.00	2023-11-11	06:26:31.258187	500.00	2023-11-11	06:26:31.606697	500.00	2023-11-11	06:26:31.94039	500.00	2023-11-11	06:26:32.335215	500.00	2023-11-11	06:26:32.699454	500.00	2023-11-11	06:26:33.362988	500.00	2023-11-11	06:26:33.748714	500.00
18	-1	-              	moweuebubq372447424                                         	8	2023-11-10	07:57:49.718955	500.00	2023-11-10	07:57:52.241613	500.00	2023-11-10	14:55:41.477764	500.00	2023-11-10	14:55:42.289762	500.00	2023-11-10	14:55:43.136049	500.00	2023-11-10	14:55:43.863665	500.00	2023-11-10	14:55:44.537766	500.00	2023-11-10	14:55:45.061882	500.00
16	-1	-              	moweuebubq372447424                                         	8	2023-11-09	19:17:49.165192	500.00	2023-11-09	19:17:51.154383	500.00	2023-11-09	19:17:53.523167	500.00	2023-11-09	19:17:56.012111	500.00	2023-11-09	19:17:58.434373	500.00	2023-11-09	19:18:01.261544	500.00	2023-11-09	21:44:12.631462	500.00	2023-11-09	22:55:00.717156	500.00
24	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:10:42.256985	500.00	2023-11-11	06:10:43.077834	500.00	2023-11-11	06:26:27.559963	500.00	2023-11-11	06:26:28.031485	500.00	2023-11-11	06:26:28.731254	500.00	2023-11-11	06:26:29.365177	500.00	2023-11-11	06:26:29.955656	500.00	2023-11-11	06:26:30.435791	500.00
20	-1	-              	moweuebubq372447424                                         	8	2023-11-10	14:55:49.694073	500.00	2023-11-10	14:56:03.183066	500.00	2023-11-10	14:56:03.712451	500.00	2023-11-10	14:56:05.020074	500.00	2023-11-10	14:56:05.405233	500.00	2023-11-10	14:56:05.73067	500.00	2023-11-10	14:56:06.783561	500.00	2023-11-10	14:56:07.209438	500.00
23	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:08:40.540679	500.00	2023-11-11	06:10:36.380174	500.00	2023-11-11	06:10:37.351181	500.00	2023-11-11	06:10:38.313048	500.00	2023-11-11	06:10:39.078712	500.00	2023-11-11	06:10:39.834057	500.00	2023-11-11	06:10:40.643826	500.00	2023-11-11	06:10:41.424078	500.00
22	-1	-              	moweuebubq372447424                                         	8	2023-11-10	14:57:02.245706	500.00	2023-11-10	14:57:44.228456	500.00	2023-11-10	14:57:45.642106	500.00	2023-11-10	14:57:46.961203	500.00	2023-11-10	14:57:48.42879	500.00	2023-11-10	14:57:49.637545	500.00	2023-11-10	14:57:50.941138	500.00	2023-11-10	14:57:53.817953	500.00
28	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:38:12.929452	500.00	2023-11-11	06:38:13.570422	500.00	2023-11-11	06:38:14.341137	500.00	2023-11-11	06:38:14.9984	500.00	2023-11-11	06:38:15.71509	500.00	2023-11-11	06:38:16.272204	500.00	2023-11-11	06:38:16.649264	500.00	2023-11-11	06:38:17.084672	500.00
26	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:26:34.149592	500.00	2023-11-11	06:26:34.968664	500.00	2023-11-11	06:28:09.24915	500.00	2023-11-11	06:31:14.242864	500.00	2023-11-11	06:31:15.444939	500.00	2023-11-11	06:31:16.294024	500.00	2023-11-11	06:31:17.089303	500.00	2023-11-11	06:31:17.792985	500.00
30	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:52:10.172767	500.00	2023-11-11	06:52:11.041753	500.00	2023-11-11	06:52:11.819979	500.00	2023-11-11	06:52:12.550736	500.00	2023-11-11	06:52:13.270506	500.00	2023-11-11	06:52:13.912119	500.00	2023-11-11	06:52:14.634865	500.00	2023-11-11	06:52:15.999008	500.00
29	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:38:17.660257	500.00	2023-11-11	06:38:18.062278	500.00	2023-11-11	06:38:18.441408	500.00	2023-11-11	06:38:18.880588	500.00	2023-11-11	06:38:19.241071	500.00	2023-11-11	06:38:19.699337	500.00	2023-11-11	06:38:20.097989	500.00	2023-11-11	06:38:20.51696	500.00
31	-1	-              	moweuebubq372447424                                         	8	2023-11-11	06:52:16.651456	500.00	2023-11-11	06:57:52.508999	500.00	2023-11-11	06:57:53.359685	500.00	2023-11-11	06:57:54.117008	500.00	2023-11-11	12:03:46.758751	500.00	2023-11-11	12:03:47.817937	500.00	2023-11-11	12:03:48.614186	500.00	2023-11-11	12:03:49.360434	500.00
32	-1	-              	moweuebubq372447424                                         	8	2023-11-11	12:03:50.049468	500.00	2023-11-11	12:03:50.53585	500.00	2023-11-11	12:03:51.0279	500.00	2023-11-11	12:03:51.583733	500.00	2023-11-11	12:03:51.988618	500.00	2023-11-11	12:03:52.415404	500.00	2023-11-11	12:03:52.7616	500.00	2023-11-11	12:03:53.243704	500.00
36	-1	-              	moweuebubq372447424                                         	8	2024-03-24	12:59:35.407504	500.00	2024-03-25	11:16:14.270069	500.00	2024-03-25	11:16:15.818656	500.00	2024-03-26	15:54:52.323864	500.00	2024-03-26	15:54:59.140978	500.00	2024-03-26	15:55:00.824006	500.00	2024-03-26	15:55:03.80588	500.00	2024-03-26	15:55:12.511893	500.00
33	-1	-              	moweuebubq372447424                                         	8	2023-11-11	12:03:53.990435	500.00	2023-11-11	12:03:54.411348	500.00	2023-11-11	12:03:54.962859	500.00	2023-11-11	12:03:55.612205	500.00	2023-11-11	12:03:56.792337	500.00	2023-11-16	09:16:30.451046	500.00	2023-11-16	09:16:35.441552	500.00	2023-11-16	09:16:38.191367	500.00
34	-1	-              	moweuebubq372447424                                         	8	2023-11-16	09:16:40.47053	500.00	2023-11-16	09:16:51.845268	500.00	2023-11-16	09:17:50.374697	500.00	2023-11-16	09:17:52.010375	500.00	2023-11-16	09:18:25.789556	500.00	2023-11-16	09:18:28.834625	500.00	2023-11-16	09:18:32.532533	500.00	2023-11-16	09:21:57.638743	500.00
35	-1	-              	moweuebubq372447424                                         	8	2023-11-16	09:21:58.492367	500.00	2023-11-16	09:21:59.198996	500.00	2023-11-16	09:21:59.932897	500.00	2023-11-16	09:22:00.646922	500.00	2023-11-16	09:22:01.567061	500.00	2023-11-16	09:22:02.127128	500.00	2023-11-16	09:22:02.738821	500.00	2023-11-19	22:25:43.252737	500.00
\.


--
-- TOC entry 5212 (class 0 OID 85664)
-- Dependencies: 279
-- Data for Name: wallet_debit_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_debit_history (id, init_company_id, partner_code, application_code, processor_node_name, processor_node_ip, trxn_request_id, trxn_reference, processor_reference, processor_auth_key_hash, trxn_type_id, log_session_id, trxn_event, trxn_type, trxn_mode, debit_currency_name, debit_currency_code, debit_currency_symbol, trxn_start_time, trxn_start_date, trxn_end_time, trxn_end_date, currency_exchange_log_reference_id, currency_exchange_rate, debit_amount, total_debit_fee_amount, total_debit_amount, sender_scheme_code, sender_profile_type_code, sender_customer_reference, sender_name, sender_wallet, sender_bank_code, sender_wallet_name, sender_bank, auth_user_id, auth_factor_1_key_hash, auth_factor_2_key_hash, service_provider, service_beneficicary_customer_id, purchase_token_encrypt, purchase_token_hash, product_provider_customer_name, product_provider_customer_address, trxn_detail, narration, trxn_comment) FROM stdin;
\.


--
-- TOC entry 5186 (class 0 OID 81437)
-- Dependencies: 253
-- Data for Name: wallet_to_bank_trxn_log_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_to_bank_trxn_log_4 (id, trxn_originating_cust_no, trxn_request_id, profile_type_code, user_sys_id, profile_sys_id, profile_id, bearer_token, debit_scheme_code, channel_id, debit_accnt_type_id, debit_bank_code, debit_wallet_accnt_num, debit_currency_code, trxn_type_id, trxn_amount, credit_scheme_code, credit_accnt_type_id, credit_bank_code, credit_wallet_accnt_num, credit_currency_code, log_session_id, reference_date, reference_time, processed, selected, debit_accnt_in_memory, credit_accnt_in_memory, credit_profile_type_code, debit_profile_type_code) FROM stdin;
\.


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 292
-- Name: account_credit_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_credit_history_id_seq', 1, false);


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 234
-- Name: approval_item_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_item_groups_id_seq', 1, false);


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 230
-- Name: approval_item_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_item_types_id_seq', 1, false);


--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 246
-- Name: approval_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_items_id_seq', 1, false);


--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 232
-- Name: approval_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_requests_id_seq', 1, false);


--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 238
-- Name: approval_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_routes_id_seq', 1, false);


--
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 236
-- Name: approval_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.approval_user_groups_id_seq', 1, false);


--
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 216
-- Name: de_dynamic_class_4_students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.de_dynamic_class_4_students_id_seq', 1, true);


--
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 299
-- Name: journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_id_seq', 1, false);


--
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 303
-- Name: journal_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_line_id_seq', 1, false);


--
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 301
-- Name: journal_line_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_line_summary_id_seq', 1, false);


--
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 210
-- Name: mini_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mini_wallet_id_seq', 1, true);


--
-- TOC entry 5264 (class 0 OID 0)
-- Dependencies: 226
-- Name: node_in_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.node_in_sessions_id_seq', 1, false);


--
-- TOC entry 5265 (class 0 OID 0)
-- Dependencies: 228
-- Name: node_out_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.node_out_sessions_id_seq', 1, false);


--
-- TOC entry 5266 (class 0 OID 0)
-- Dependencies: 242
-- Name: partner_loan_tenures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partner_loan_tenures_id_seq', 1, false);


--
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 240
-- Name: partner_loan_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partner_loan_types_id_seq', 1, false);


--
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 256
-- Name: pending_bank_credit_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_0_id_seq', 1, false);


--
-- TOC entry 5269 (class 0 OID 0)
-- Dependencies: 258
-- Name: pending_bank_credit_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_1_id_seq', 1, false);


--
-- TOC entry 5270 (class 0 OID 0)
-- Dependencies: 260
-- Name: pending_bank_credit_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_2_id_seq', 1, false);


--
-- TOC entry 5271 (class 0 OID 0)
-- Dependencies: 262
-- Name: pending_bank_credit_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_3_id_seq', 1, false);


--
-- TOC entry 5272 (class 0 OID 0)
-- Dependencies: 264
-- Name: pending_bank_credit_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_4_id_seq', 1, false);


--
-- TOC entry 5273 (class 0 OID 0)
-- Dependencies: 254
-- Name: pending_bank_credit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_bank_credit_id_seq', 1, false);


--
-- TOC entry 5274 (class 0 OID 0)
-- Dependencies: 268
-- Name: pending_node_credit_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_0_id_seq', 1, false);


--
-- TOC entry 5275 (class 0 OID 0)
-- Dependencies: 270
-- Name: pending_node_credit_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_1_id_seq', 1, false);


--
-- TOC entry 5276 (class 0 OID 0)
-- Dependencies: 272
-- Name: pending_node_credit_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_2_id_seq', 1, false);


--
-- TOC entry 5277 (class 0 OID 0)
-- Dependencies: 274
-- Name: pending_node_credit_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_3_id_seq', 1, false);


--
-- TOC entry 5278 (class 0 OID 0)
-- Dependencies: 276
-- Name: pending_node_credit_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_4_id_seq', 1, false);


--
-- TOC entry 5279 (class 0 OID 0)
-- Dependencies: 266
-- Name: pending_node_credit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_node_credit_id_seq', 1, false);


--
-- TOC entry 5280 (class 0 OID 0)
-- Dependencies: 280
-- Name: pending_process_trxn_0_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_0_id_seq', 1, false);


--
-- TOC entry 5281 (class 0 OID 0)
-- Dependencies: 282
-- Name: pending_process_trxn_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_1_id_seq', 1, false);


--
-- TOC entry 5282 (class 0 OID 0)
-- Dependencies: 284
-- Name: pending_process_trxn_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_2_id_seq', 1, false);


--
-- TOC entry 5283 (class 0 OID 0)
-- Dependencies: 286
-- Name: pending_process_trxn_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_3_id_seq', 1, false);


--
-- TOC entry 5284 (class 0 OID 0)
-- Dependencies: 288
-- Name: pending_process_trxn_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_4_id_seq', 1, false);


--
-- TOC entry 5285 (class 0 OID 0)
-- Dependencies: 290
-- Name: pending_process_trxn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pending_process_trxn_id_seq', 1, false);


--
-- TOC entry 5286 (class 0 OID 0)
-- Dependencies: 244
-- Name: request_item_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_item_batches_id_seq', 1, false);


--
-- TOC entry 5287 (class 0 OID 0)
-- Dependencies: 294
-- Name: request_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_log_id_seq', 1, false);


--
-- TOC entry 5288 (class 0 OID 0)
-- Dependencies: 296
-- Name: response_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.response_log_id_seq', 1, false);


--
-- TOC entry 5289 (class 0 OID 0)
-- Dependencies: 250
-- Name: transaction_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_history_id_seq', 1, false);


--
-- TOC entry 5290 (class 0 OID 0)
-- Dependencies: 214
-- Name: transaction_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_log_id_seq', 157, true);


--
-- TOC entry 5291 (class 0 OID 0)
-- Dependencies: 248
-- Name: transaction_register_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_register_id_seq', 1, false);


--
-- TOC entry 5292 (class 0 OID 0)
-- Dependencies: 224
-- Name: user_ussd_menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_ussd_menus_id_seq', 1, false);


--
-- TOC entry 5293 (class 0 OID 0)
-- Dependencies: 220
-- Name: user_ussd_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_ussd_sessions_id_seq', 1, false);


--
-- TOC entry 5294 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_ussd_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_ussd_state_id_seq', 1, false);


--
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 222
-- Name: ussd_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ussd_services_id_seq', 1, false);


--
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 212
-- Name: wallet_balance_compact_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_balance_compact_history_id_seq', 36, true);


--
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 278
-- Name: wallet_debit_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_debit_history_id_seq', 1, false);


--
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 252
-- Name: wallet_to_bank_trxn_log_4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_to_bank_trxn_log_4_id_seq', 1, false);


--
-- TOC entry 5001 (class 2606 OID 98137)
-- Name: billing_charges_config billing_charges_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_charges_config
    ADD CONSTRAINT billing_charges_config_pk PRIMARY KEY (id);


--
-- TOC entry 4993 (class 2606 OID 97221)
-- Name: journal_line journal_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line
    ADD CONSTRAINT journal_line_pkey PRIMARY KEY (id);


--
-- TOC entry 4991 (class 2606 OID 97165)
-- Name: journal_line_summary journal_line_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary
    ADD CONSTRAINT journal_line_summary_pkey PRIMARY KEY (id);


--
-- TOC entry 4989 (class 2606 OID 97119)
-- Name: journal journal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal
    ADD CONSTRAINT journal_pkey PRIMARY KEY (id);


--
-- TOC entry 4995 (class 2606 OID 97460)
-- Name: merchant_access_whitelist merchant_access_whitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_access_whitelist
    ADD CONSTRAINT merchant_access_whitelist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 4997 (class 2606 OID 97469)
-- Name: partner_access_whitelist partner_access_whitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_access_whitelist
    ADD CONSTRAINT partner_access_whitelist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 4999 (class 2606 OID 97478)
-- Name: partner_access_blacklist user_access_blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_access_blacklist
    ADD CONSTRAINT user_access_blacklist_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 4987 (class 2606 OID 96897)
-- Name: user_sessions user_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_session_pkey PRIMARY KEY (ip_address);


--
-- TOC entry 4985 (class 2606 OID 81466)
-- Name: wallet_to_bank_trxn_log_4 wallet_to_bank_trxn_log_4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_to_bank_trxn_log_4
    ADD CONSTRAINT wallet_to_bank_trxn_log_4_pkey PRIMARY KEY (id);


--
-- TOC entry 5003 (class 2606 OID 97222)
-- Name: journal_line FKq1qkwi3bp726yehudbih8xe5b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line
    ADD CONSTRAINT "FKq1qkwi3bp726yehudbih8xe5b" FOREIGN KEY (jounal_id) REFERENCES public.journal(id);


--
-- TOC entry 5002 (class 2606 OID 97166)
-- Name: journal_line_summary fk_journal_line_summary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_line_summary
    ADD CONSTRAINT fk_journal_line_summary_id FOREIGN KEY (journal_id) REFERENCES public.journal(id);


-- Completed on 2024-10-01 01:13:28

--
-- PostgreSQL database dump complete
--

