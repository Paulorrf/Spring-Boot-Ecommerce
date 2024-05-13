--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg120+2)
-- Dumped by pg_dump version 16.0

-- Started on 2024-05-01 18:51:11

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
-- TOC entry 255 (class 1259 OID 17021)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- TOC entry 284 (class 1259 OID 17464)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- TOC entry 258 (class 1259 OID 17036)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- TOC entry 257 (class 1259 OID 17031)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- TOC entry 256 (class 1259 OID 17026)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- TOC entry 259 (class 1259 OID 17041)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- TOC entry 285 (class 1259 OID 17479)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- TOC entry 308 (class 1259 OID 18110)
-- Name: category; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.category OWNER TO keycloak;

--
-- TOC entry 307 (class 1259 OID 18109)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: keycloak
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO keycloak;

--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 307
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keycloak
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 216 (class 1259 OID 16402)
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- TOC entry 239 (class 1259 OID 16760)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- TOC entry 296 (class 1259 OID 17729)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- TOC entry 295 (class 1259 OID 17603)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- TOC entry 241 (class 1259 OID 16770)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- TOC entry 273 (class 1259 OID 17269)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- TOC entry 274 (class 1259 OID 17283)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- TOC entry 297 (class 1259 OID 17770)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- TOC entry 275 (class 1259 OID 17288)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- TOC entry 217 (class 1259 OID 16413)
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- TOC entry 262 (class 1259 OID 17059)
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- TOC entry 240 (class 1259 OID 16765)
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- TOC entry 254 (class 1259 OID 16943)
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- TOC entry 218 (class 1259 OID 16418)
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- TOC entry 263 (class 1259 OID 17140)
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- TOC entry 293 (class 1259 OID 17524)
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- TOC entry 292 (class 1259 OID 17519)
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- TOC entry 219 (class 1259 OID 16421)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- TOC entry 220 (class 1259 OID 16424)
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- TOC entry 215 (class 1259 OID 16394)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- TOC entry 214 (class 1259 OID 16389)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- TOC entry 298 (class 1259 OID 17786)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- TOC entry 221 (class 1259 OID 16429)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- TOC entry 286 (class 1259 OID 17484)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- TOC entry 287 (class 1259 OID 17489)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- TOC entry 300 (class 1259 OID 17812)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- TOC entry 288 (class 1259 OID 17498)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- TOC entry 289 (class 1259 OID 17507)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- TOC entry 290 (class 1259 OID 17510)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- TOC entry 291 (class 1259 OID 17516)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- TOC entry 244 (class 1259 OID 16806)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- TOC entry 294 (class 1259 OID 17581)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- TOC entry 306 (class 1259 OID 18100)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO keycloak;

--
-- TOC entry 270 (class 1259 OID 17208)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- TOC entry 269 (class 1259 OID 17205)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- TOC entry 245 (class 1259 OID 16811)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- TOC entry 246 (class 1259 OID 16820)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- TOC entry 251 (class 1259 OID 16924)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- TOC entry 252 (class 1259 OID 16929)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- TOC entry 268 (class 1259 OID 17202)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- TOC entry 222 (class 1259 OID 16437)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- TOC entry 250 (class 1259 OID 16921)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- TOC entry 267 (class 1259 OID 17193)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- TOC entry 266 (class 1259 OID 17188)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- TOC entry 280 (class 1259 OID 17407)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- TOC entry 242 (class 1259 OID 16795)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- TOC entry 243 (class 1259 OID 16801)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- TOC entry 223 (class 1259 OID 16443)
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- TOC entry 224 (class 1259 OID 16460)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- TOC entry 272 (class 1259 OID 17217)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- TOC entry 249 (class 1259 OID 16913)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- TOC entry 225 (class 1259 OID 16468)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- TOC entry 305 (class 1259 OID 17920)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- TOC entry 226 (class 1259 OID 16471)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- TOC entry 227 (class 1259 OID 16478)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- TOC entry 247 (class 1259 OID 16829)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- TOC entry 228 (class 1259 OID 16488)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- TOC entry 265 (class 1259 OID 17152)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- TOC entry 264 (class 1259 OID 17145)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- TOC entry 302 (class 1259 OID 17851)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- TOC entry 282 (class 1259 OID 17434)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- TOC entry 281 (class 1259 OID 17419)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- TOC entry 276 (class 1259 OID 17357)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- TOC entry 301 (class 1259 OID 17827)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- TOC entry 279 (class 1259 OID 17393)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- TOC entry 277 (class 1259 OID 17365)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- TOC entry 278 (class 1259 OID 17379)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- TOC entry 303 (class 1259 OID 17869)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- TOC entry 304 (class 1259 OID 17879)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- TOC entry 229 (class 1259 OID 16491)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- TOC entry 283 (class 1259 OID 17449)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- TOC entry 231 (class 1259 OID 16497)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- TOC entry 253 (class 1259 OID 16934)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- TOC entry 299 (class 1259 OID 17802)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- TOC entry 232 (class 1259 OID 16502)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- TOC entry 233 (class 1259 OID 16510)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- TOC entry 260 (class 1259 OID 17046)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- TOC entry 261 (class 1259 OID 17051)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- TOC entry 234 (class 1259 OID 16515)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- TOC entry 271 (class 1259 OID 17214)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- TOC entry 235 (class 1259 OID 16520)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- TOC entry 236 (class 1259 OID 16523)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- TOC entry 237 (class 1259 OID 16526)
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- TOC entry 248 (class 1259 OID 16832)
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- TOC entry 230 (class 1259 OID 16494)
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- TOC entry 238 (class 1259 OID 16537)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- TOC entry 3552 (class 2604 OID 18113)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 4108 (class 0 OID 17021)
-- Dependencies: 255
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- TOC entry 4137 (class 0 OID 17464)
-- Dependencies: 284
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- TOC entry 4111 (class 0 OID 17036)
-- Dependencies: 258
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
a19c3cfa-e73c-4f9b-b39c-14255ad18474	\N	auth-cookie	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	3641d9e7-db30-4930-9374-49635c94556c	2	10	f	\N	\N
54e85e2f-28e3-4e8c-a5ed-328e153d1f65	\N	auth-spnego	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	3641d9e7-db30-4930-9374-49635c94556c	3	20	f	\N	\N
aed6e56b-14ed-456a-a31c-8efd70ff6985	\N	identity-provider-redirector	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	3641d9e7-db30-4930-9374-49635c94556c	2	25	f	\N	\N
d010c16c-9ccb-4e34-9046-f6df9efce643	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	3641d9e7-db30-4930-9374-49635c94556c	2	30	t	5198a29a-c442-4f86-bf30-be2843361a85	\N
0fe4989a-f2d4-4fa5-8db3-aea69fc489c7	\N	auth-username-password-form	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	5198a29a-c442-4f86-bf30-be2843361a85	0	10	f	\N	\N
1e02d460-7d32-40bf-90e0-b70d83fa4ef6	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	5198a29a-c442-4f86-bf30-be2843361a85	1	20	t	82754d8c-d0f9-480c-93a5-b0b74e52f13c	\N
f3fd6c49-d962-4356-a50a-fae7a6f5d621	\N	conditional-user-configured	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	82754d8c-d0f9-480c-93a5-b0b74e52f13c	0	10	f	\N	\N
9517fd1f-60f3-4a1e-b80a-c2c8ccb519a1	\N	auth-otp-form	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	82754d8c-d0f9-480c-93a5-b0b74e52f13c	0	20	f	\N	\N
c455af70-cfde-4286-b4d6-fff597b14ec1	\N	direct-grant-validate-username	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	c96d7bc9-1d51-43ab-a883-1c6004d223dc	0	10	f	\N	\N
845af552-8bfc-4423-be84-346db740401f	\N	direct-grant-validate-password	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	c96d7bc9-1d51-43ab-a883-1c6004d223dc	0	20	f	\N	\N
507c09e1-f410-4f48-90be-a352ec5136f9	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	c96d7bc9-1d51-43ab-a883-1c6004d223dc	1	30	t	b41e7f1f-7289-481f-bb71-fd2df547224d	\N
73e44244-d7b9-48c9-a1da-6f4f7d4d2ad0	\N	conditional-user-configured	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	b41e7f1f-7289-481f-bb71-fd2df547224d	0	10	f	\N	\N
c340ce1a-5f8c-4ece-87d4-bd27423e2605	\N	direct-grant-validate-otp	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	b41e7f1f-7289-481f-bb71-fd2df547224d	0	20	f	\N	\N
749639c6-e67c-45df-855e-ac299a6cb9d8	\N	registration-page-form	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	89a1b7e9-af75-4c58-af2d-1bfe1ac1c469	0	10	t	47ff038c-0db7-4558-b1bc-0ee9db6dfa69	\N
ef2494e8-49cc-4377-a7b4-8600116828a6	\N	registration-user-creation	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	47ff038c-0db7-4558-b1bc-0ee9db6dfa69	0	20	f	\N	\N
fd5e2aeb-43f1-4119-b42c-b7e579104ae9	\N	registration-password-action	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	47ff038c-0db7-4558-b1bc-0ee9db6dfa69	0	50	f	\N	\N
aaf8381c-60e5-41d1-bcbe-c9f8d70dc7a8	\N	registration-recaptcha-action	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	47ff038c-0db7-4558-b1bc-0ee9db6dfa69	3	60	f	\N	\N
86ba97ef-7dfe-41b6-a1fc-9070a836276f	\N	registration-terms-and-conditions	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	47ff038c-0db7-4558-b1bc-0ee9db6dfa69	3	70	f	\N	\N
0507bb6a-4c4d-465d-a32d-5d7e83b864a9	\N	reset-credentials-choose-user	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	64a1bc8b-a945-4e5f-b693-fcca98165618	0	10	f	\N	\N
ad610797-de57-4b42-b7bb-c9e6e917338a	\N	reset-credential-email	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	64a1bc8b-a945-4e5f-b693-fcca98165618	0	20	f	\N	\N
4da7dfeb-dc09-4188-96c9-4e9b7ab26fe2	\N	reset-password	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	64a1bc8b-a945-4e5f-b693-fcca98165618	0	30	f	\N	\N
3af377e9-5a71-42c2-b658-c977ab182e53	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	64a1bc8b-a945-4e5f-b693-fcca98165618	1	40	t	171a43b5-2c16-47a5-ae96-3330202408c5	\N
3f8883df-82eb-4389-8c4b-4a37fc07070f	\N	conditional-user-configured	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	171a43b5-2c16-47a5-ae96-3330202408c5	0	10	f	\N	\N
1726f476-769e-409e-a0fb-e1eda99bd5de	\N	reset-otp	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	171a43b5-2c16-47a5-ae96-3330202408c5	0	20	f	\N	\N
5c1fae8e-0240-4abd-8497-050439bd51c6	\N	client-secret	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	3a0f354e-1302-45aa-8e95-8dc3e671dc18	2	10	f	\N	\N
fc2524f2-e9e6-4ddd-82d3-2cb80995b56a	\N	client-jwt	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	3a0f354e-1302-45aa-8e95-8dc3e671dc18	2	20	f	\N	\N
977c2b3d-034f-4ee5-8d40-895018d7917a	\N	client-secret-jwt	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	3a0f354e-1302-45aa-8e95-8dc3e671dc18	2	30	f	\N	\N
f6832c45-a26c-420b-ac81-68a653868ea4	\N	client-x509	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	3a0f354e-1302-45aa-8e95-8dc3e671dc18	2	40	f	\N	\N
4b748936-3d06-4cdc-b9f3-8accefcdbd92	\N	idp-review-profile	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	1475d1b2-2c86-4dd4-8147-1caea6f8e4c4	0	10	f	\N	4839b81f-71e3-461b-b22e-9ac92618cfe7
d350f169-b80e-413c-83a4-206870536ab1	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	1475d1b2-2c86-4dd4-8147-1caea6f8e4c4	0	20	t	10ee16c7-c688-4ade-86ff-8b6ecb168e38	\N
1e1d8a45-91f8-4520-8361-e03d1d3ae1c3	\N	idp-create-user-if-unique	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	10ee16c7-c688-4ade-86ff-8b6ecb168e38	2	10	f	\N	20e3603e-8e7f-44c0-aebb-25519e4d2caa
9b47325f-be6c-4e30-90df-dd8789f0d039	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	10ee16c7-c688-4ade-86ff-8b6ecb168e38	2	20	t	f3dae9c1-8751-4687-bccf-1c1e806a3503	\N
d337a348-26af-4f46-8ac3-4a37c54faa3b	\N	idp-confirm-link	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f3dae9c1-8751-4687-bccf-1c1e806a3503	0	10	f	\N	\N
ef702616-4230-4012-b386-914518c9ffe9	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f3dae9c1-8751-4687-bccf-1c1e806a3503	0	20	t	08c4f097-d936-42dd-9285-05271e46e474	\N
c1daa739-15ca-401f-92ad-d10ce81d5355	\N	idp-email-verification	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	08c4f097-d936-42dd-9285-05271e46e474	2	10	f	\N	\N
3244d6f3-9a8b-45f8-b752-a6ff7c9ed42f	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	08c4f097-d936-42dd-9285-05271e46e474	2	20	t	11481e43-b668-4820-b599-730ad7bf9ab6	\N
23d35a47-99ff-4ef3-843e-1c95314fb06b	\N	idp-username-password-form	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	11481e43-b668-4820-b599-730ad7bf9ab6	0	10	f	\N	\N
fee68837-9279-48a6-9ede-1abb4223a7f5	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	11481e43-b668-4820-b599-730ad7bf9ab6	1	20	t	50aa5673-c437-42c3-bd3f-235ee9df2a21	\N
9d674525-b749-495f-a561-fba4faa18b41	\N	conditional-user-configured	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	50aa5673-c437-42c3-bd3f-235ee9df2a21	0	10	f	\N	\N
87e8e407-6c4f-4367-aa22-b5c0a724b6a6	\N	auth-otp-form	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	50aa5673-c437-42c3-bd3f-235ee9df2a21	0	20	f	\N	\N
d8a6d6aa-9511-457d-9ac2-b57c28b8c41a	\N	http-basic-authenticator	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	8e811e8d-193b-4fd5-9fb5-f9c7bc422dae	0	10	f	\N	\N
a0ffea24-2a8e-4068-9047-24d72aac212a	\N	docker-http-basic-authenticator	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	48f87936-3ef3-4fdd-a421-f213c604aa52	0	10	f	\N	\N
83b56ed0-d0b6-40d8-8aa1-e3ecdb1c84db	\N	auth-cookie	959ad7c1-9708-4b39-8f74-c6064f245370	db2420cd-7d9c-4092-ba00-37e459443ea0	2	10	f	\N	\N
9f943b74-f0b6-4323-835f-2b853d6b6632	\N	auth-spnego	959ad7c1-9708-4b39-8f74-c6064f245370	db2420cd-7d9c-4092-ba00-37e459443ea0	3	20	f	\N	\N
7cafa1e6-fdba-4f68-97e5-13f32a7418b1	\N	identity-provider-redirector	959ad7c1-9708-4b39-8f74-c6064f245370	db2420cd-7d9c-4092-ba00-37e459443ea0	2	25	f	\N	\N
c1dc5c10-6168-413e-abd7-3be3244c6fcc	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	db2420cd-7d9c-4092-ba00-37e459443ea0	2	30	t	60806749-c96c-4b95-98e2-ccb446f8d067	\N
4aafba7d-378d-4a61-acce-594db6c2d8cd	\N	auth-username-password-form	959ad7c1-9708-4b39-8f74-c6064f245370	60806749-c96c-4b95-98e2-ccb446f8d067	0	10	f	\N	\N
859aad1b-9742-483a-8cbb-3c1e91a3067c	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	60806749-c96c-4b95-98e2-ccb446f8d067	1	20	t	63dc6c64-4cb6-49b7-81ab-383caf3b5945	\N
c65d3419-b028-4001-b391-747be78d01c9	\N	conditional-user-configured	959ad7c1-9708-4b39-8f74-c6064f245370	63dc6c64-4cb6-49b7-81ab-383caf3b5945	0	10	f	\N	\N
4fe8e3d8-0aca-4dc2-a750-ebefa5b6872a	\N	auth-otp-form	959ad7c1-9708-4b39-8f74-c6064f245370	63dc6c64-4cb6-49b7-81ab-383caf3b5945	0	20	f	\N	\N
22d5a4c4-4f63-4439-89ef-6b633ebb0622	\N	direct-grant-validate-username	959ad7c1-9708-4b39-8f74-c6064f245370	6f5b794e-0551-45ee-b5d7-0933fc2daf22	0	10	f	\N	\N
bc648c97-f22a-4ed6-a05e-60952ab6fbfe	\N	direct-grant-validate-password	959ad7c1-9708-4b39-8f74-c6064f245370	6f5b794e-0551-45ee-b5d7-0933fc2daf22	0	20	f	\N	\N
4f68b67b-1e78-4030-aa5f-ad0ee8b6b963	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	6f5b794e-0551-45ee-b5d7-0933fc2daf22	1	30	t	37e4f770-b214-49be-9cb7-5ef427152fce	\N
943cec8f-0b9b-4b02-bbf4-54c985c10899	\N	conditional-user-configured	959ad7c1-9708-4b39-8f74-c6064f245370	37e4f770-b214-49be-9cb7-5ef427152fce	0	10	f	\N	\N
f117a025-7149-4f1b-816b-11be5b661869	\N	direct-grant-validate-otp	959ad7c1-9708-4b39-8f74-c6064f245370	37e4f770-b214-49be-9cb7-5ef427152fce	0	20	f	\N	\N
e90fc2d4-6b76-422c-8bd9-5c5a9035ca07	\N	registration-page-form	959ad7c1-9708-4b39-8f74-c6064f245370	0a804270-bd88-4f39-b4ec-638cab694245	0	10	t	9ca201c2-5754-4997-a4f8-d496d8e9be15	\N
372e98c6-d376-4717-be47-31487c366448	\N	registration-user-creation	959ad7c1-9708-4b39-8f74-c6064f245370	9ca201c2-5754-4997-a4f8-d496d8e9be15	0	20	f	\N	\N
c3bdaddc-2830-44e0-9475-bca60fe18fa5	\N	registration-password-action	959ad7c1-9708-4b39-8f74-c6064f245370	9ca201c2-5754-4997-a4f8-d496d8e9be15	0	50	f	\N	\N
18394662-9758-46c2-a4f9-d282bba5c3a2	\N	registration-recaptcha-action	959ad7c1-9708-4b39-8f74-c6064f245370	9ca201c2-5754-4997-a4f8-d496d8e9be15	3	60	f	\N	\N
f3b2d3cc-46db-419b-a246-0395e71a22de	\N	reset-credentials-choose-user	959ad7c1-9708-4b39-8f74-c6064f245370	b14f4ae2-d9ce-4b68-a068-fb1c66e07a49	0	10	f	\N	\N
5a2780b6-0b19-48bd-bff6-97b811eb32df	\N	reset-credential-email	959ad7c1-9708-4b39-8f74-c6064f245370	b14f4ae2-d9ce-4b68-a068-fb1c66e07a49	0	20	f	\N	\N
ea05e071-ec25-4abe-af4b-7de929c36321	\N	reset-password	959ad7c1-9708-4b39-8f74-c6064f245370	b14f4ae2-d9ce-4b68-a068-fb1c66e07a49	0	30	f	\N	\N
d9c6e8bd-a8bc-4e58-97a2-b88255d627cf	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	b14f4ae2-d9ce-4b68-a068-fb1c66e07a49	1	40	t	2adacce0-1682-4475-9638-e871f2e76a05	\N
0ec3ac3e-ef14-46fb-ac61-6483cf0403a3	\N	conditional-user-configured	959ad7c1-9708-4b39-8f74-c6064f245370	2adacce0-1682-4475-9638-e871f2e76a05	0	10	f	\N	\N
e9a77895-55e7-4452-967d-d423bf0bd8a3	\N	reset-otp	959ad7c1-9708-4b39-8f74-c6064f245370	2adacce0-1682-4475-9638-e871f2e76a05	0	20	f	\N	\N
dcc9a8a5-4713-4f7e-8f38-f407e98bc298	\N	client-secret	959ad7c1-9708-4b39-8f74-c6064f245370	9838051b-c521-44e5-8202-c091638db510	2	10	f	\N	\N
f7a03ac1-722c-4074-b22e-440bfce35ec9	\N	client-jwt	959ad7c1-9708-4b39-8f74-c6064f245370	9838051b-c521-44e5-8202-c091638db510	2	20	f	\N	\N
4b07aac4-e678-4c6e-b90d-21e1a1f30b36	\N	client-secret-jwt	959ad7c1-9708-4b39-8f74-c6064f245370	9838051b-c521-44e5-8202-c091638db510	2	30	f	\N	\N
17cce14c-0199-40e0-9d0c-ace8b7f42fd8	\N	client-x509	959ad7c1-9708-4b39-8f74-c6064f245370	9838051b-c521-44e5-8202-c091638db510	2	40	f	\N	\N
bd5efabd-4938-4802-8192-0b3905a9b1da	\N	idp-review-profile	959ad7c1-9708-4b39-8f74-c6064f245370	09afff2c-a77c-418e-a173-d5c801672ef6	0	10	f	\N	eea297a8-d555-4adc-90dc-7374b1baab4d
322d40f2-c76f-46a1-9a99-79000ebd12ca	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	09afff2c-a77c-418e-a173-d5c801672ef6	0	20	t	b98fac85-d7d4-41d9-9e42-b1436fe0d65f	\N
55820315-eab1-4945-ad74-932db487b494	\N	idp-create-user-if-unique	959ad7c1-9708-4b39-8f74-c6064f245370	b98fac85-d7d4-41d9-9e42-b1436fe0d65f	2	10	f	\N	2ec0530f-b38f-4fa8-b47d-5d218eab1c20
6c81eeaa-16a3-4416-bf8f-152baf76e7ee	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	b98fac85-d7d4-41d9-9e42-b1436fe0d65f	2	20	t	fa626b38-7b1d-4318-9dbe-af205d527de5	\N
de87fe6f-55fe-4e3c-9f80-95f11dbe629d	\N	idp-confirm-link	959ad7c1-9708-4b39-8f74-c6064f245370	fa626b38-7b1d-4318-9dbe-af205d527de5	0	10	f	\N	\N
3a099a37-a2ab-43bb-9002-c5d33c625eef	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	fa626b38-7b1d-4318-9dbe-af205d527de5	0	20	t	f6c21e3a-cef7-44c3-a8dc-2e180fcf67b3	\N
c291f6ae-72ef-410b-82eb-7856790cb74a	\N	idp-email-verification	959ad7c1-9708-4b39-8f74-c6064f245370	f6c21e3a-cef7-44c3-a8dc-2e180fcf67b3	2	10	f	\N	\N
27cbb012-ffe5-4175-92b9-3278d7ac6633	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	f6c21e3a-cef7-44c3-a8dc-2e180fcf67b3	2	20	t	7a44b5ad-95cd-4844-ab97-c18b37085f75	\N
9d7d46c7-b23b-4c76-8852-541bfb5feb96	\N	idp-username-password-form	959ad7c1-9708-4b39-8f74-c6064f245370	7a44b5ad-95cd-4844-ab97-c18b37085f75	0	10	f	\N	\N
5466b216-b3ae-4f23-b83e-5afe08c5c492	\N	\N	959ad7c1-9708-4b39-8f74-c6064f245370	7a44b5ad-95cd-4844-ab97-c18b37085f75	1	20	t	51343a41-e555-4c73-b73a-715ff6a5384a	\N
7e8ded18-21c7-4ccb-8500-ff09cfbe52d1	\N	conditional-user-configured	959ad7c1-9708-4b39-8f74-c6064f245370	51343a41-e555-4c73-b73a-715ff6a5384a	0	10	f	\N	\N
48f0d2e4-55bf-4bff-a5a8-2a2a14537d10	\N	auth-otp-form	959ad7c1-9708-4b39-8f74-c6064f245370	51343a41-e555-4c73-b73a-715ff6a5384a	0	20	f	\N	\N
2969add9-2ce8-4b13-b83e-752026b1041e	\N	http-basic-authenticator	959ad7c1-9708-4b39-8f74-c6064f245370	c0287bef-0e57-401a-9a30-0e2b01e5517e	0	10	f	\N	\N
74bdc70b-67f2-487e-8cbd-3f68876eba01	\N	docker-http-basic-authenticator	959ad7c1-9708-4b39-8f74-c6064f245370	9a23c240-81e3-409c-8de9-ecee62e8aec4	0	10	f	\N	\N
\.


--
-- TOC entry 4110 (class 0 OID 17031)
-- Dependencies: 257
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
3641d9e7-db30-4930-9374-49635c94556c	browser	browser based authentication	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	t	t
5198a29a-c442-4f86-bf30-be2843361a85	forms	Username, password, otp and other auth forms.	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
82754d8c-d0f9-480c-93a5-b0b74e52f13c	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
c96d7bc9-1d51-43ab-a883-1c6004d223dc	direct grant	OpenID Connect Resource Owner Grant	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	t	t
b41e7f1f-7289-481f-bb71-fd2df547224d	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
89a1b7e9-af75-4c58-af2d-1bfe1ac1c469	registration	registration flow	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	t	t
47ff038c-0db7-4558-b1bc-0ee9db6dfa69	registration form	registration form	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	form-flow	f	t
64a1bc8b-a945-4e5f-b693-fcca98165618	reset credentials	Reset credentials for a user if they forgot their password or something	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	t	t
171a43b5-2c16-47a5-ae96-3330202408c5	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
3a0f354e-1302-45aa-8e95-8dc3e671dc18	clients	Base authentication for clients	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	client-flow	t	t
1475d1b2-2c86-4dd4-8147-1caea6f8e4c4	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	t	t
10ee16c7-c688-4ade-86ff-8b6ecb168e38	User creation or linking	Flow for the existing/non-existing user alternatives	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
f3dae9c1-8751-4687-bccf-1c1e806a3503	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
08c4f097-d936-42dd-9285-05271e46e474	Account verification options	Method with which to verity the existing account	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
11481e43-b668-4820-b599-730ad7bf9ab6	Verify Existing Account by Re-authentication	Reauthentication of existing account	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
50aa5673-c437-42c3-bd3f-235ee9df2a21	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	f	t
8e811e8d-193b-4fd5-9fb5-f9c7bc422dae	saml ecp	SAML ECP Profile Authentication Flow	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	t	t
48f87936-3ef3-4fdd-a421-f213c604aa52	docker auth	Used by Docker clients to authenticate against the IDP	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	basic-flow	t	t
db2420cd-7d9c-4092-ba00-37e459443ea0	browser	browser based authentication	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	t	t
60806749-c96c-4b95-98e2-ccb446f8d067	forms	Username, password, otp and other auth forms.	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
63dc6c64-4cb6-49b7-81ab-383caf3b5945	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
6f5b794e-0551-45ee-b5d7-0933fc2daf22	direct grant	OpenID Connect Resource Owner Grant	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	t	t
37e4f770-b214-49be-9cb7-5ef427152fce	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
0a804270-bd88-4f39-b4ec-638cab694245	registration	registration flow	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	t	t
9ca201c2-5754-4997-a4f8-d496d8e9be15	registration form	registration form	959ad7c1-9708-4b39-8f74-c6064f245370	form-flow	f	t
b14f4ae2-d9ce-4b68-a068-fb1c66e07a49	reset credentials	Reset credentials for a user if they forgot their password or something	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	t	t
2adacce0-1682-4475-9638-e871f2e76a05	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
9838051b-c521-44e5-8202-c091638db510	clients	Base authentication for clients	959ad7c1-9708-4b39-8f74-c6064f245370	client-flow	t	t
09afff2c-a77c-418e-a173-d5c801672ef6	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	t	t
b98fac85-d7d4-41d9-9e42-b1436fe0d65f	User creation or linking	Flow for the existing/non-existing user alternatives	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
fa626b38-7b1d-4318-9dbe-af205d527de5	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
f6c21e3a-cef7-44c3-a8dc-2e180fcf67b3	Account verification options	Method with which to verity the existing account	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
7a44b5ad-95cd-4844-ab97-c18b37085f75	Verify Existing Account by Re-authentication	Reauthentication of existing account	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
51343a41-e555-4c73-b73a-715ff6a5384a	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	f	t
c0287bef-0e57-401a-9a30-0e2b01e5517e	saml ecp	SAML ECP Profile Authentication Flow	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	t	t
9a23c240-81e3-409c-8de9-ecee62e8aec4	docker auth	Used by Docker clients to authenticate against the IDP	959ad7c1-9708-4b39-8f74-c6064f245370	basic-flow	t	t
\.


--
-- TOC entry 4109 (class 0 OID 17026)
-- Dependencies: 256
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
4839b81f-71e3-461b-b22e-9ac92618cfe7	review profile config	6dfa9a1f-db1c-4207-83d3-57fb5fee5244
20e3603e-8e7f-44c0-aebb-25519e4d2caa	create unique user config	6dfa9a1f-db1c-4207-83d3-57fb5fee5244
eea297a8-d555-4adc-90dc-7374b1baab4d	review profile config	959ad7c1-9708-4b39-8f74-c6064f245370
2ec0530f-b38f-4fa8-b47d-5d218eab1c20	create unique user config	959ad7c1-9708-4b39-8f74-c6064f245370
\.


--
-- TOC entry 4112 (class 0 OID 17041)
-- Dependencies: 259
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
20e3603e-8e7f-44c0-aebb-25519e4d2caa	false	require.password.update.after.registration
4839b81f-71e3-461b-b22e-9ac92618cfe7	missing	update.profile.on.first.login
2ec0530f-b38f-4fa8-b47d-5d218eab1c20	false	require.password.update.after.registration
eea297a8-d555-4adc-90dc-7374b1baab4d	missing	update.profile.on.first.login
\.


--
-- TOC entry 4138 (class 0 OID 17479)
-- Dependencies: 285
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4161 (class 0 OID 18110)
-- Dependencies: 308
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.category (id, name, description) FROM stdin;
\.


--
-- TOC entry 4069 (class 0 OID 16402)
-- Dependencies: 216
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	f	master-realm	0	f	\N	\N	t	\N	f	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
66052ff1-7515-4245-94c2-0d346b310437	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	t	f	broker	0	f	\N	\N	t	\N	f	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
41a19e86-99ca-47c6-b7de-a3c37158a587	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	t	f	admin-cli	0	t	\N	\N	f	\N	f	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	f	my-realm-realm	0	f	\N	\N	t	\N	f	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N	0	f	f	my-realm Realm	f	client-secret	\N	\N	\N	t	f	f	f
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	f	realm-management	0	f	\N	\N	t	\N	f	959ad7c1-9708-4b39-8f74-c6064f245370	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
cec288ee-a963-41d2-9b50-89c7a550691a	t	f	account	0	t	\N	/realms/my-realm/account/	f	\N	f	959ad7c1-9708-4b39-8f74-c6064f245370	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	t	f	account-console	0	t	\N	/realms/my-realm/account/	f	\N	f	959ad7c1-9708-4b39-8f74-c6064f245370	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
aea6652f-b8cf-46c0-954b-708ec284f9e3	t	f	broker	0	f	\N	\N	t	\N	f	959ad7c1-9708-4b39-8f74-c6064f245370	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
67f0818c-fd4a-4618-afd5-245e74dac6f0	t	f	security-admin-console	0	t	\N	/admin/my-realm/console/	f	\N	f	959ad7c1-9708-4b39-8f74-c6064f245370	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
54087540-4e83-44ae-970e-65f909a552e6	t	f	admin-cli	0	t	\N	\N	f	\N	f	959ad7c1-9708-4b39-8f74-c6064f245370	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
d447806d-45c0-4c3d-a53e-6cae5729ef3d	t	t	authenticationClientId	0	f	Pg9u52F1WAA6jloJayRlEzMwJzxzfdxe		f		f	959ad7c1-9708-4b39-8f74-c6064f245370	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
\.


--
-- TOC entry 4092 (class 0 OID 16760)
-- Dependencies: 239
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	post.logout.redirect.uris	+
66052ff1-7515-4245-94c2-0d346b310437	post.logout.redirect.uris	+
66052ff1-7515-4245-94c2-0d346b310437	pkce.code.challenge.method	S256
41a19e86-99ca-47c6-b7de-a3c37158a587	post.logout.redirect.uris	+
41a19e86-99ca-47c6-b7de-a3c37158a587	pkce.code.challenge.method	S256
cec288ee-a963-41d2-9b50-89c7a550691a	post.logout.redirect.uris	+
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	post.logout.redirect.uris	+
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	pkce.code.challenge.method	S256
67f0818c-fd4a-4618-afd5-245e74dac6f0	post.logout.redirect.uris	+
67f0818c-fd4a-4618-afd5-245e74dac6f0	pkce.code.challenge.method	S256
d447806d-45c0-4c3d-a53e-6cae5729ef3d	client.secret.creation.time	1714527000
d447806d-45c0-4c3d-a53e-6cae5729ef3d	oauth2.device.authorization.grant.enabled	false
d447806d-45c0-4c3d-a53e-6cae5729ef3d	oidc.ciba.grant.enabled	false
d447806d-45c0-4c3d-a53e-6cae5729ef3d	backchannel.logout.session.required	true
d447806d-45c0-4c3d-a53e-6cae5729ef3d	backchannel.logout.revoke.offline.tokens	false
\.


--
-- TOC entry 4149 (class 0 OID 17729)
-- Dependencies: 296
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- TOC entry 4148 (class 0 OID 17603)
-- Dependencies: 295
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- TOC entry 4094 (class 0 OID 16770)
-- Dependencies: 241
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- TOC entry 4126 (class 0 OID 17269)
-- Dependencies: 273
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	offline_access	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	OpenID Connect built-in scope: offline_access	openid-connect
1b934fb1-d066-439c-abef-46e16257f317	role_list	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	SAML role list	saml
7d6a2678-71d7-4a0c-8c2f-f15ae831415c	profile	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	OpenID Connect built-in scope: profile	openid-connect
29558f8c-f2dd-4c6e-8ba0-3014189b706f	email	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	OpenID Connect built-in scope: email	openid-connect
8fc8d947-3f9c-4203-8700-2b2289c7f2fc	address	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	OpenID Connect built-in scope: address	openid-connect
f4f0217c-d949-4cfa-a812-1917ecbc145c	phone	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	OpenID Connect built-in scope: phone	openid-connect
f55ac800-a2fc-4679-a1ae-510523d50fce	roles	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	OpenID Connect scope for add user roles to the access token	openid-connect
0652010a-6916-407c-ae70-f8e83d85409f	web-origins	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	OpenID Connect scope for add allowed web origins to the access token	openid-connect
4fdcfd08-80ac-4544-be15-27563bd8eafa	microprofile-jwt	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	Microprofile - JWT built-in scope	openid-connect
915a61fa-a0ce-4825-b60f-f8011460e85f	acr	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
3a6b0e2a-090b-486a-b49c-0e244f5dff5f	offline_access	959ad7c1-9708-4b39-8f74-c6064f245370	OpenID Connect built-in scope: offline_access	openid-connect
fe3861bb-df6c-47ab-bed8-03db84b3ab20	role_list	959ad7c1-9708-4b39-8f74-c6064f245370	SAML role list	saml
e7b79684-34ac-462c-80bc-63965decdf8c	profile	959ad7c1-9708-4b39-8f74-c6064f245370	OpenID Connect built-in scope: profile	openid-connect
5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	email	959ad7c1-9708-4b39-8f74-c6064f245370	OpenID Connect built-in scope: email	openid-connect
62b51ba0-a3f3-4402-91bd-4b2f1748e577	address	959ad7c1-9708-4b39-8f74-c6064f245370	OpenID Connect built-in scope: address	openid-connect
75085f73-3878-47a0-8ff8-03a6cac8eb0a	phone	959ad7c1-9708-4b39-8f74-c6064f245370	OpenID Connect built-in scope: phone	openid-connect
46fded59-2fd9-4c87-94d7-e76097a7bac2	roles	959ad7c1-9708-4b39-8f74-c6064f245370	OpenID Connect scope for add user roles to the access token	openid-connect
7ed8c6e4-13e5-45c8-b504-b3d17dd49360	web-origins	959ad7c1-9708-4b39-8f74-c6064f245370	OpenID Connect scope for add allowed web origins to the access token	openid-connect
82a5fda7-8317-4223-96c5-2db3d65bfb07	microprofile-jwt	959ad7c1-9708-4b39-8f74-c6064f245370	Microprofile - JWT built-in scope	openid-connect
b082daf1-9478-4165-a77c-976a880fac7a	acr	959ad7c1-9708-4b39-8f74-c6064f245370	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- TOC entry 4127 (class 0 OID 17283)
-- Dependencies: 274
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	true	display.on.consent.screen
b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	${offlineAccessScopeConsentText}	consent.screen.text
1b934fb1-d066-439c-abef-46e16257f317	true	display.on.consent.screen
1b934fb1-d066-439c-abef-46e16257f317	${samlRoleListScopeConsentText}	consent.screen.text
7d6a2678-71d7-4a0c-8c2f-f15ae831415c	true	display.on.consent.screen
7d6a2678-71d7-4a0c-8c2f-f15ae831415c	${profileScopeConsentText}	consent.screen.text
7d6a2678-71d7-4a0c-8c2f-f15ae831415c	true	include.in.token.scope
29558f8c-f2dd-4c6e-8ba0-3014189b706f	true	display.on.consent.screen
29558f8c-f2dd-4c6e-8ba0-3014189b706f	${emailScopeConsentText}	consent.screen.text
29558f8c-f2dd-4c6e-8ba0-3014189b706f	true	include.in.token.scope
8fc8d947-3f9c-4203-8700-2b2289c7f2fc	true	display.on.consent.screen
8fc8d947-3f9c-4203-8700-2b2289c7f2fc	${addressScopeConsentText}	consent.screen.text
8fc8d947-3f9c-4203-8700-2b2289c7f2fc	true	include.in.token.scope
f4f0217c-d949-4cfa-a812-1917ecbc145c	true	display.on.consent.screen
f4f0217c-d949-4cfa-a812-1917ecbc145c	${phoneScopeConsentText}	consent.screen.text
f4f0217c-d949-4cfa-a812-1917ecbc145c	true	include.in.token.scope
f55ac800-a2fc-4679-a1ae-510523d50fce	true	display.on.consent.screen
f55ac800-a2fc-4679-a1ae-510523d50fce	${rolesScopeConsentText}	consent.screen.text
f55ac800-a2fc-4679-a1ae-510523d50fce	false	include.in.token.scope
0652010a-6916-407c-ae70-f8e83d85409f	false	display.on.consent.screen
0652010a-6916-407c-ae70-f8e83d85409f		consent.screen.text
0652010a-6916-407c-ae70-f8e83d85409f	false	include.in.token.scope
4fdcfd08-80ac-4544-be15-27563bd8eafa	false	display.on.consent.screen
4fdcfd08-80ac-4544-be15-27563bd8eafa	true	include.in.token.scope
915a61fa-a0ce-4825-b60f-f8011460e85f	false	display.on.consent.screen
915a61fa-a0ce-4825-b60f-f8011460e85f	false	include.in.token.scope
3a6b0e2a-090b-486a-b49c-0e244f5dff5f	true	display.on.consent.screen
3a6b0e2a-090b-486a-b49c-0e244f5dff5f	${offlineAccessScopeConsentText}	consent.screen.text
fe3861bb-df6c-47ab-bed8-03db84b3ab20	true	display.on.consent.screen
fe3861bb-df6c-47ab-bed8-03db84b3ab20	${samlRoleListScopeConsentText}	consent.screen.text
e7b79684-34ac-462c-80bc-63965decdf8c	true	display.on.consent.screen
e7b79684-34ac-462c-80bc-63965decdf8c	${profileScopeConsentText}	consent.screen.text
e7b79684-34ac-462c-80bc-63965decdf8c	true	include.in.token.scope
5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	true	display.on.consent.screen
5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	${emailScopeConsentText}	consent.screen.text
5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	true	include.in.token.scope
62b51ba0-a3f3-4402-91bd-4b2f1748e577	true	display.on.consent.screen
62b51ba0-a3f3-4402-91bd-4b2f1748e577	${addressScopeConsentText}	consent.screen.text
62b51ba0-a3f3-4402-91bd-4b2f1748e577	true	include.in.token.scope
75085f73-3878-47a0-8ff8-03a6cac8eb0a	true	display.on.consent.screen
75085f73-3878-47a0-8ff8-03a6cac8eb0a	${phoneScopeConsentText}	consent.screen.text
75085f73-3878-47a0-8ff8-03a6cac8eb0a	true	include.in.token.scope
46fded59-2fd9-4c87-94d7-e76097a7bac2	true	display.on.consent.screen
46fded59-2fd9-4c87-94d7-e76097a7bac2	${rolesScopeConsentText}	consent.screen.text
46fded59-2fd9-4c87-94d7-e76097a7bac2	false	include.in.token.scope
7ed8c6e4-13e5-45c8-b504-b3d17dd49360	false	display.on.consent.screen
7ed8c6e4-13e5-45c8-b504-b3d17dd49360		consent.screen.text
7ed8c6e4-13e5-45c8-b504-b3d17dd49360	false	include.in.token.scope
82a5fda7-8317-4223-96c5-2db3d65bfb07	false	display.on.consent.screen
82a5fda7-8317-4223-96c5-2db3d65bfb07	true	include.in.token.scope
b082daf1-9478-4165-a77c-976a880fac7a	false	display.on.consent.screen
b082daf1-9478-4165-a77c-976a880fac7a	false	include.in.token.scope
\.


--
-- TOC entry 4150 (class 0 OID 17770)
-- Dependencies: 297
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	915a61fa-a0ce-4825-b60f-f8011460e85f	t
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	7d6a2678-71d7-4a0c-8c2f-f15ae831415c	t
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	29558f8c-f2dd-4c6e-8ba0-3014189b706f	t
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	0652010a-6916-407c-ae70-f8e83d85409f	t
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	f55ac800-a2fc-4679-a1ae-510523d50fce	t
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	8fc8d947-3f9c-4203-8700-2b2289c7f2fc	f
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	f4f0217c-d949-4cfa-a812-1917ecbc145c	f
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	4fdcfd08-80ac-4544-be15-27563bd8eafa	f
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	f
66052ff1-7515-4245-94c2-0d346b310437	915a61fa-a0ce-4825-b60f-f8011460e85f	t
66052ff1-7515-4245-94c2-0d346b310437	7d6a2678-71d7-4a0c-8c2f-f15ae831415c	t
66052ff1-7515-4245-94c2-0d346b310437	29558f8c-f2dd-4c6e-8ba0-3014189b706f	t
66052ff1-7515-4245-94c2-0d346b310437	0652010a-6916-407c-ae70-f8e83d85409f	t
66052ff1-7515-4245-94c2-0d346b310437	f55ac800-a2fc-4679-a1ae-510523d50fce	t
66052ff1-7515-4245-94c2-0d346b310437	8fc8d947-3f9c-4203-8700-2b2289c7f2fc	f
66052ff1-7515-4245-94c2-0d346b310437	f4f0217c-d949-4cfa-a812-1917ecbc145c	f
66052ff1-7515-4245-94c2-0d346b310437	4fdcfd08-80ac-4544-be15-27563bd8eafa	f
66052ff1-7515-4245-94c2-0d346b310437	b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	f
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	915a61fa-a0ce-4825-b60f-f8011460e85f	t
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	7d6a2678-71d7-4a0c-8c2f-f15ae831415c	t
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	29558f8c-f2dd-4c6e-8ba0-3014189b706f	t
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	0652010a-6916-407c-ae70-f8e83d85409f	t
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	f55ac800-a2fc-4679-a1ae-510523d50fce	t
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	8fc8d947-3f9c-4203-8700-2b2289c7f2fc	f
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	f4f0217c-d949-4cfa-a812-1917ecbc145c	f
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	4fdcfd08-80ac-4544-be15-27563bd8eafa	f
6f679901-b07c-4fa9-ba96-1371eb8a6c7c	b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	f
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	915a61fa-a0ce-4825-b60f-f8011460e85f	t
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	7d6a2678-71d7-4a0c-8c2f-f15ae831415c	t
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	29558f8c-f2dd-4c6e-8ba0-3014189b706f	t
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	0652010a-6916-407c-ae70-f8e83d85409f	t
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	f55ac800-a2fc-4679-a1ae-510523d50fce	t
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	8fc8d947-3f9c-4203-8700-2b2289c7f2fc	f
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	f4f0217c-d949-4cfa-a812-1917ecbc145c	f
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	4fdcfd08-80ac-4544-be15-27563bd8eafa	f
cfb7eb7d-c78d-46c0-860d-64816e7e00ff	b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	f
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	915a61fa-a0ce-4825-b60f-f8011460e85f	t
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	7d6a2678-71d7-4a0c-8c2f-f15ae831415c	t
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	29558f8c-f2dd-4c6e-8ba0-3014189b706f	t
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	0652010a-6916-407c-ae70-f8e83d85409f	t
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	f55ac800-a2fc-4679-a1ae-510523d50fce	t
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	8fc8d947-3f9c-4203-8700-2b2289c7f2fc	f
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	f4f0217c-d949-4cfa-a812-1917ecbc145c	f
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	4fdcfd08-80ac-4544-be15-27563bd8eafa	f
0e97b996-d27d-4396-b6ec-a9b9e8162f4c	b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	f
41a19e86-99ca-47c6-b7de-a3c37158a587	915a61fa-a0ce-4825-b60f-f8011460e85f	t
41a19e86-99ca-47c6-b7de-a3c37158a587	7d6a2678-71d7-4a0c-8c2f-f15ae831415c	t
41a19e86-99ca-47c6-b7de-a3c37158a587	29558f8c-f2dd-4c6e-8ba0-3014189b706f	t
41a19e86-99ca-47c6-b7de-a3c37158a587	0652010a-6916-407c-ae70-f8e83d85409f	t
41a19e86-99ca-47c6-b7de-a3c37158a587	f55ac800-a2fc-4679-a1ae-510523d50fce	t
41a19e86-99ca-47c6-b7de-a3c37158a587	8fc8d947-3f9c-4203-8700-2b2289c7f2fc	f
41a19e86-99ca-47c6-b7de-a3c37158a587	f4f0217c-d949-4cfa-a812-1917ecbc145c	f
41a19e86-99ca-47c6-b7de-a3c37158a587	4fdcfd08-80ac-4544-be15-27563bd8eafa	f
41a19e86-99ca-47c6-b7de-a3c37158a587	b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	f
cec288ee-a963-41d2-9b50-89c7a550691a	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	t
cec288ee-a963-41d2-9b50-89c7a550691a	7ed8c6e4-13e5-45c8-b504-b3d17dd49360	t
cec288ee-a963-41d2-9b50-89c7a550691a	e7b79684-34ac-462c-80bc-63965decdf8c	t
cec288ee-a963-41d2-9b50-89c7a550691a	b082daf1-9478-4165-a77c-976a880fac7a	t
cec288ee-a963-41d2-9b50-89c7a550691a	46fded59-2fd9-4c87-94d7-e76097a7bac2	t
cec288ee-a963-41d2-9b50-89c7a550691a	82a5fda7-8317-4223-96c5-2db3d65bfb07	f
cec288ee-a963-41d2-9b50-89c7a550691a	62b51ba0-a3f3-4402-91bd-4b2f1748e577	f
cec288ee-a963-41d2-9b50-89c7a550691a	75085f73-3878-47a0-8ff8-03a6cac8eb0a	f
cec288ee-a963-41d2-9b50-89c7a550691a	3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	t
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	7ed8c6e4-13e5-45c8-b504-b3d17dd49360	t
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	e7b79684-34ac-462c-80bc-63965decdf8c	t
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	b082daf1-9478-4165-a77c-976a880fac7a	t
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	46fded59-2fd9-4c87-94d7-e76097a7bac2	t
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	82a5fda7-8317-4223-96c5-2db3d65bfb07	f
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	62b51ba0-a3f3-4402-91bd-4b2f1748e577	f
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	75085f73-3878-47a0-8ff8-03a6cac8eb0a	f
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f
54087540-4e83-44ae-970e-65f909a552e6	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	t
54087540-4e83-44ae-970e-65f909a552e6	7ed8c6e4-13e5-45c8-b504-b3d17dd49360	t
54087540-4e83-44ae-970e-65f909a552e6	e7b79684-34ac-462c-80bc-63965decdf8c	t
54087540-4e83-44ae-970e-65f909a552e6	b082daf1-9478-4165-a77c-976a880fac7a	t
54087540-4e83-44ae-970e-65f909a552e6	46fded59-2fd9-4c87-94d7-e76097a7bac2	t
54087540-4e83-44ae-970e-65f909a552e6	82a5fda7-8317-4223-96c5-2db3d65bfb07	f
54087540-4e83-44ae-970e-65f909a552e6	62b51ba0-a3f3-4402-91bd-4b2f1748e577	f
54087540-4e83-44ae-970e-65f909a552e6	75085f73-3878-47a0-8ff8-03a6cac8eb0a	f
54087540-4e83-44ae-970e-65f909a552e6	3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f
aea6652f-b8cf-46c0-954b-708ec284f9e3	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	t
aea6652f-b8cf-46c0-954b-708ec284f9e3	7ed8c6e4-13e5-45c8-b504-b3d17dd49360	t
aea6652f-b8cf-46c0-954b-708ec284f9e3	e7b79684-34ac-462c-80bc-63965decdf8c	t
aea6652f-b8cf-46c0-954b-708ec284f9e3	b082daf1-9478-4165-a77c-976a880fac7a	t
aea6652f-b8cf-46c0-954b-708ec284f9e3	46fded59-2fd9-4c87-94d7-e76097a7bac2	t
aea6652f-b8cf-46c0-954b-708ec284f9e3	82a5fda7-8317-4223-96c5-2db3d65bfb07	f
aea6652f-b8cf-46c0-954b-708ec284f9e3	62b51ba0-a3f3-4402-91bd-4b2f1748e577	f
aea6652f-b8cf-46c0-954b-708ec284f9e3	75085f73-3878-47a0-8ff8-03a6cac8eb0a	f
aea6652f-b8cf-46c0-954b-708ec284f9e3	3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	t
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	7ed8c6e4-13e5-45c8-b504-b3d17dd49360	t
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	e7b79684-34ac-462c-80bc-63965decdf8c	t
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	b082daf1-9478-4165-a77c-976a880fac7a	t
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	46fded59-2fd9-4c87-94d7-e76097a7bac2	t
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	82a5fda7-8317-4223-96c5-2db3d65bfb07	f
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	62b51ba0-a3f3-4402-91bd-4b2f1748e577	f
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	75085f73-3878-47a0-8ff8-03a6cac8eb0a	f
5050e1fe-3f5d-4567-a1f7-aafcc43bc412	3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f
67f0818c-fd4a-4618-afd5-245e74dac6f0	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	t
67f0818c-fd4a-4618-afd5-245e74dac6f0	7ed8c6e4-13e5-45c8-b504-b3d17dd49360	t
67f0818c-fd4a-4618-afd5-245e74dac6f0	e7b79684-34ac-462c-80bc-63965decdf8c	t
67f0818c-fd4a-4618-afd5-245e74dac6f0	b082daf1-9478-4165-a77c-976a880fac7a	t
67f0818c-fd4a-4618-afd5-245e74dac6f0	46fded59-2fd9-4c87-94d7-e76097a7bac2	t
67f0818c-fd4a-4618-afd5-245e74dac6f0	82a5fda7-8317-4223-96c5-2db3d65bfb07	f
67f0818c-fd4a-4618-afd5-245e74dac6f0	62b51ba0-a3f3-4402-91bd-4b2f1748e577	f
67f0818c-fd4a-4618-afd5-245e74dac6f0	75085f73-3878-47a0-8ff8-03a6cac8eb0a	f
67f0818c-fd4a-4618-afd5-245e74dac6f0	3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f
d447806d-45c0-4c3d-a53e-6cae5729ef3d	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	t
d447806d-45c0-4c3d-a53e-6cae5729ef3d	7ed8c6e4-13e5-45c8-b504-b3d17dd49360	t
d447806d-45c0-4c3d-a53e-6cae5729ef3d	82a5fda7-8317-4223-96c5-2db3d65bfb07	t
d447806d-45c0-4c3d-a53e-6cae5729ef3d	e7b79684-34ac-462c-80bc-63965decdf8c	t
d447806d-45c0-4c3d-a53e-6cae5729ef3d	b082daf1-9478-4165-a77c-976a880fac7a	t
d447806d-45c0-4c3d-a53e-6cae5729ef3d	46fded59-2fd9-4c87-94d7-e76097a7bac2	t
d447806d-45c0-4c3d-a53e-6cae5729ef3d	62b51ba0-a3f3-4402-91bd-4b2f1748e577	f
d447806d-45c0-4c3d-a53e-6cae5729ef3d	75085f73-3878-47a0-8ff8-03a6cac8eb0a	f
d447806d-45c0-4c3d-a53e-6cae5729ef3d	3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f
\.


--
-- TOC entry 4128 (class 0 OID 17288)
-- Dependencies: 275
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	eeb84ebf-2da8-40fa-9ff8-13d8da4f3649
3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f40ac6b2-eb7f-4c53-9e5d-74005011df35
\.


--
-- TOC entry 4070 (class 0 OID 16413)
-- Dependencies: 217
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- TOC entry 4115 (class 0 OID 17059)
-- Dependencies: 262
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- TOC entry 4093 (class 0 OID 16765)
-- Dependencies: 240
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 4107 (class 0 OID 16943)
-- Dependencies: 254
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- TOC entry 4071 (class 0 OID 16418)
-- Dependencies: 218
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- TOC entry 4116 (class 0 OID 17140)
-- Dependencies: 263
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 4146 (class 0 OID 17524)
-- Dependencies: 293
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
f4a2d549-76fa-41b9-af5a-ed3ea5edb77d	Trusted Hosts	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	anonymous
f8ec6479-b065-4a6f-94a3-8185b8d8afba	Consent Required	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	anonymous
de22c96d-3441-4a23-9baa-b3791168405d	Full Scope Disabled	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	anonymous
447693b7-df0a-4d0f-ba1c-6a5b42f398d8	Max Clients Limit	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	anonymous
252c5cb8-f318-410f-a539-1224b01f4699	Allowed Protocol Mapper Types	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	anonymous
f7e2fa39-6d61-486b-a8c3-ba8830c53941	Allowed Client Scopes	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	anonymous
14e785ba-3c46-4fc5-a310-ef5b561122d1	Allowed Protocol Mapper Types	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	authenticated
e45289ed-3d2e-4e30-8d18-2312bdb1bf22	Allowed Client Scopes	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	authenticated
8605465d-13cf-423e-a897-5fd628f4ebbe	rsa-generated	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	rsa-generated	org.keycloak.keys.KeyProvider	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N
4e61820e-37e0-4b20-b442-3e2a131c13fc	rsa-enc-generated	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	rsa-enc-generated	org.keycloak.keys.KeyProvider	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N
445fa391-3e4d-4ac6-87c9-2919cabf4714	hmac-generated	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	hmac-generated	org.keycloak.keys.KeyProvider	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N
301f3a35-05ce-4978-b130-bc23f7821bd6	aes-generated	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	aes-generated	org.keycloak.keys.KeyProvider	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N
d171863a-cdf5-4b94-a43c-67d464d4e8b8	rsa-generated	959ad7c1-9708-4b39-8f74-c6064f245370	rsa-generated	org.keycloak.keys.KeyProvider	959ad7c1-9708-4b39-8f74-c6064f245370	\N
44b412d7-77b0-4f34-9b06-b74144140884	rsa-enc-generated	959ad7c1-9708-4b39-8f74-c6064f245370	rsa-enc-generated	org.keycloak.keys.KeyProvider	959ad7c1-9708-4b39-8f74-c6064f245370	\N
3fe40a01-d110-4d16-b356-247051d61d09	hmac-generated	959ad7c1-9708-4b39-8f74-c6064f245370	hmac-generated	org.keycloak.keys.KeyProvider	959ad7c1-9708-4b39-8f74-c6064f245370	\N
2391d244-ec23-4b39-ab80-bf903594ee8f	aes-generated	959ad7c1-9708-4b39-8f74-c6064f245370	aes-generated	org.keycloak.keys.KeyProvider	959ad7c1-9708-4b39-8f74-c6064f245370	\N
86c3202b-e908-42a1-8a00-b39165fad3ea	Trusted Hosts	959ad7c1-9708-4b39-8f74-c6064f245370	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	anonymous
d7b635d9-2f93-4416-a1e9-7b4cc528a02b	Consent Required	959ad7c1-9708-4b39-8f74-c6064f245370	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	anonymous
5d2add6d-53d7-4ad1-8758-82939506c669	Full Scope Disabled	959ad7c1-9708-4b39-8f74-c6064f245370	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	anonymous
76d37d6d-33ac-4e03-92f4-e8a69242ade7	Max Clients Limit	959ad7c1-9708-4b39-8f74-c6064f245370	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	anonymous
ce775445-464a-470f-b6b5-00c3afcab0d4	Allowed Protocol Mapper Types	959ad7c1-9708-4b39-8f74-c6064f245370	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	anonymous
caa3d6fc-42cd-463e-a363-b310096f3567	Allowed Client Scopes	959ad7c1-9708-4b39-8f74-c6064f245370	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	anonymous
6a21cf86-f85f-4eec-b392-bfa043a6e3a8	Allowed Protocol Mapper Types	959ad7c1-9708-4b39-8f74-c6064f245370	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	authenticated
a8c2df65-4f78-40a6-af1c-9087bc6d7815	Allowed Client Scopes	959ad7c1-9708-4b39-8f74-c6064f245370	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	authenticated
\.


--
-- TOC entry 4145 (class 0 OID 17519)
-- Dependencies: 292
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
fecc630f-bb3d-4055-a10e-6126c8fd05c9	252c5cb8-f318-410f-a539-1224b01f4699	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
954a0553-bcb9-45c3-9860-cb96ea23306f	252c5cb8-f318-410f-a539-1224b01f4699	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
6baf75ff-9d61-479c-9973-ebb6d52bbbac	252c5cb8-f318-410f-a539-1224b01f4699	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
92ce5f9e-dcd0-4f36-bd98-05610e561af5	252c5cb8-f318-410f-a539-1224b01f4699	allowed-protocol-mapper-types	saml-user-property-mapper
1c807eec-2a5c-4513-8f09-a7ce397d56b9	252c5cb8-f318-410f-a539-1224b01f4699	allowed-protocol-mapper-types	oidc-address-mapper
ecab4c4d-432b-4da8-9260-fe83b52e0757	252c5cb8-f318-410f-a539-1224b01f4699	allowed-protocol-mapper-types	saml-user-attribute-mapper
3974717b-6d9e-4b64-a1ab-e3a118c3cb2e	252c5cb8-f318-410f-a539-1224b01f4699	allowed-protocol-mapper-types	saml-role-list-mapper
67828393-aaa9-4371-a1aa-b0a8d6d928da	252c5cb8-f318-410f-a539-1224b01f4699	allowed-protocol-mapper-types	oidc-full-name-mapper
185b3b64-94cc-491c-ab04-228e6aecd2b9	f4a2d549-76fa-41b9-af5a-ed3ea5edb77d	client-uris-must-match	true
678d98c9-091d-4e41-97ca-c86f046e4700	f4a2d549-76fa-41b9-af5a-ed3ea5edb77d	host-sending-registration-request-must-match	true
c482ef32-911d-4ab0-b2fd-c1e3e5f0f7e0	14e785ba-3c46-4fc5-a310-ef5b561122d1	allowed-protocol-mapper-types	saml-user-property-mapper
c0b04276-ed0c-4d9b-93a9-de627a7d5412	14e785ba-3c46-4fc5-a310-ef5b561122d1	allowed-protocol-mapper-types	oidc-address-mapper
27b0f8fd-60aa-4eec-b9c2-ef855f45423f	14e785ba-3c46-4fc5-a310-ef5b561122d1	allowed-protocol-mapper-types	saml-user-attribute-mapper
70ee3a60-62c9-4c1a-ac66-9d8fd98bf218	14e785ba-3c46-4fc5-a310-ef5b561122d1	allowed-protocol-mapper-types	oidc-full-name-mapper
66fa6198-58fa-45a6-82f3-99b475f5a32a	14e785ba-3c46-4fc5-a310-ef5b561122d1	allowed-protocol-mapper-types	saml-role-list-mapper
cfab147f-5a7f-46c4-80bd-0bc4d585ad94	14e785ba-3c46-4fc5-a310-ef5b561122d1	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
7ab262a6-8bcb-4a64-9ebd-160a20667fb8	14e785ba-3c46-4fc5-a310-ef5b561122d1	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b1595669-b041-4ec0-b8f2-3efb0e43b766	14e785ba-3c46-4fc5-a310-ef5b561122d1	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
bb121e74-c8d2-4906-a959-291766ad9bdb	447693b7-df0a-4d0f-ba1c-6a5b42f398d8	max-clients	200
716c6a5c-ed93-4fa2-a3df-8ddebb31d4d1	f7e2fa39-6d61-486b-a8c3-ba8830c53941	allow-default-scopes	true
2925b855-6c99-4912-930a-ef4e44e26224	e45289ed-3d2e-4e30-8d18-2312bdb1bf22	allow-default-scopes	true
d5c42479-7b99-45ed-a64a-5b65bfba24cd	4e61820e-37e0-4b20-b442-3e2a131c13fc	privateKey	MIIEowIBAAKCAQEAqAUia20/vcHqXqPgK8Z9NQs3vxRJ8d5cM93lFDIR2Y/6QEKmS5n6880JPhEPY5520LeIWs6j4oUX153LSVhD3zXH5wkxmowY6P4dUtNf5Z8AgUJY/R3zq1pb0rwf+mjwRWLnZpzlKNlcfYwsLgy3Tl8ULEQwv5BiIkAOrYUrqrC0UimvD4eL4Xi16S3WFiiA4t1b4G3fe9vAdtK+GQxhEVy3STM/hyzAR+3kPElK/9ogJf0e0XDwabIfpVsQ9AtqGIQzr39YMqqqXEKMejpGf0Yg+hdTU5Yqqc07MVKmLjljJv5Jigf0CXstbvBSScGTnUNCc6+xXIa/Y8JV1P+ujwIDAQABAoIBAA4gpGTBAl+Luw+rGtHDdkqr/0t3QsJuDnWj/juE/EA9XW7iy8XGlDXEsza/S3p2XAovrGzqPBhzVW5hS7MGk2pkxMK14LBcgEmy+Dc7I7CUfn/f2sipqI/rYJYnEE9HXJCRAOD9Zz1YjXDXBO34Tr9tui4Aq9KnqsCzfyhy7pmC8Bxjb/EBnVDwU4fL7GQP1CRIlONuSaKpgO2zlLcl5Y26hmA99PYaQUvyKK42537IWAkgGnU2cLnwgXzODA4W+iSuoy9CP+ovhd6K45kxEoDzZTHq82kk5yw9erlH+fV5pB2thxvYYhLkqpaeqZYgIJmhBJXrVDQZyeDQfOevBq0CgYEA4i7U3xwnxhZWv3Y9SBG80nWYgr7pc4Q6tSpUhudNG/+YGsDYmv4gf2O8Kzm+fcjeswLfC9BLZo3C5phAiJazN0YAb9yO3/DmBdZgXs/06PHY/xgZ2KH3yrSOVE1qK+1iH2u0MpttiNtO90nhfurC5jc2uHzB5g/XlBJ1HxNaxm0CgYEAvitvjls5wYpLrqrmI8V2JdypcTrT+dNLHj5epu94q1yDZ488yOiBp4c8fqqGok2jJMg92MeLg5HfIQTDVv96JcinH+3pGSm02EXUswnq4b59RPFuJRfDM0h9Oa/1zKt6TORZu3D8BzFMIM7MnX23TywimI4OhGjoOBaiCKPeW2sCgYBBhmOxBw0Wu94BtZVnTYwwRFUce4ZSKtp/JXY7ZsLV+6PrDDc0H672eMRImX/wHMM3hPttBrjxStxNxYnciBv/RU5XGcRiZ/2bb1GX5hMDcRz2OdszASkyFkCtd4fslea5R5B6oMCIx1AHH+YtyIESBKjbpXje13QSt44qpIbFuQKBgQCh98i5zITyjGFNUQ1WZjXspXZDlEE6xHV0OtbPA6MZAGCC8YJp822KTCqAD6k/zzQmfc3/NmVjF/ic3Luq+0kDqVR+Y1lnLxhyI3e3TbkZr+5tq9uOCCEfKpxNZ8rIGTy/BLZQaTiev6QBRWEMuihIbGTC3isLJ3axXsV+6mLWJQKBgGwrGXGXJDkRZSHYNIPVBmPC91dg7BiWOclAcbZDn4RB9PY4O19YIsR78XxSRKU1sCY7VV5o3cSHNcWfdPMKG1eJamcfejqrCPrn+6TwIXGKW5gkVdklDVU6qveTgjPSCCyjg6Jrcj9lWV+p5xPtpQnoEJ8Zx6sZUFE9oJfRYrIE
1b49f967-59a4-456d-b383-4634c8f755e6	4e61820e-37e0-4b20-b442-3e2a131c13fc	keyUse	ENC
b86ee9e0-3ed8-469c-baf0-35390d5a0904	4e61820e-37e0-4b20-b442-3e2a131c13fc	certificate	MIICmzCCAYMCBgGPJbLG9TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNDI4MTcxMjA0WhcNMzQwNDI4MTcxMzQ0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCoBSJrbT+9wepeo+Arxn01Cze/FEnx3lwz3eUUMhHZj/pAQqZLmfrzzQk+EQ9jnnbQt4hazqPihRfXnctJWEPfNcfnCTGajBjo/h1S01/lnwCBQlj9HfOrWlvSvB/6aPBFYudmnOUo2Vx9jCwuDLdOXxQsRDC/kGIiQA6thSuqsLRSKa8Ph4vheLXpLdYWKIDi3Vvgbd9728B20r4ZDGERXLdJMz+HLMBH7eQ8SUr/2iAl/R7RcPBpsh+lWxD0C2oYhDOvf1gyqqpcQox6OkZ/RiD6F1NTliqpzTsxUqYuOWMm/kmKB/QJey1u8FJJwZOdQ0Jzr7Fchr9jwlXU/66PAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACwWHTpDZCg5jZ3vMysa6sYG2JB/A1uVXKL7cpsMazZnBcrAafLyRDB9b5ql4TZCnFJhOGhcQIhQO/sOXdv4rIZaMieSQoSMu78lo9DY9KjYFujwgkZC67/L3qzHfY06iO+Nb1+06E7nVyprLFg3MsTB9SJ/2yQPK3HcBBi4DLBn/5Xz4ktY6pj/Kkx75eZMvkCx9DAhI+VGVKnh4LwgYWSX6jgyGmvU3Hn3Yr+4EEUO3xRSBOK+pBV4eRoXlCd2oT1mxHo+YMaLZcmqsq5NLCH10FjHNApIaBvWV2EK1elkwoIlyEpBulFWRZ/jDnV2VbH0JgE2fY3rzz1tTzUkP/g=
dc6a87cd-b30d-48e0-a604-189f74a8c471	4e61820e-37e0-4b20-b442-3e2a131c13fc	algorithm	RSA-OAEP
1ca56fc6-abb5-4ef5-b61f-c9e49873848f	4e61820e-37e0-4b20-b442-3e2a131c13fc	priority	100
948307fe-ee3b-4d98-8161-68b8ce35dc02	445fa391-3e4d-4ac6-87c9-2919cabf4714	secret	wZwJddYqvuiIj36hDdhHmzL07WaMXq2w2tOf8EedLKvin-o_28B5oalMNOjtbKsQC9SNQQxILtkK6RlA_sCHiw
e07e773e-ae36-482b-bc8d-e0381bbfc668	445fa391-3e4d-4ac6-87c9-2919cabf4714	kid	8597ef11-4cf2-470c-b212-a80c887da184
0cde05ec-57ef-49e2-8ef8-7a3702262f03	445fa391-3e4d-4ac6-87c9-2919cabf4714	algorithm	HS256
c92ebb48-f2eb-40a2-ac74-e8bdb685e521	445fa391-3e4d-4ac6-87c9-2919cabf4714	priority	100
9382c041-1ca5-4448-9602-d0199d9078b8	8605465d-13cf-423e-a897-5fd628f4ebbe	privateKey	MIIEowIBAAKCAQEAkf+/bEC0qGX3SmoBeQT2AL03ogUpLJ/TS2BJtFeXZyV8gp+BwX1eeSDGXmxPtEE42rcLO2PiHY25jYuqt7KUgOdwT5ttckObI2iflM2mcXtl3QX6LI4cGtwJSY+Ufd14wOohwGNQgEwjqMoOa/jutAZw6jiVr4WB8g5vZz5ncOmVBNPJglef5X0B1XaSjv1ivq2keQHmqeNIIR5z/DPk73jvkMxcGalAew0zDnyv9dd9UuaN+gruEVRgItU6kgtuwV6kTkSedaXqAuyocQmG0yHf7MqraK3bXT0ko3QjjPfkFm/gPWL6BcJPIlQ/7Xf9YLWBRVQMdk3F89mP9YVz5QIDAQABAoIBAAH5JKdsJXTsMeAr2BrAXinK5ORX8QNFIrgvVDevgmCWwVzLlpecn+j/sCapDJe5VPEhzbFPC4iOOI6I73T9oSOv3RT6WwuTDdb37EY41FHO0uTelo/BGPCk/iwkGGPuGRp0X6HnxbgCL24x0umTKvi8aIzF2IIPih7RIqDQ11mPjWPThSjBBxfUXa+I8SeF3dHEdLpowH1PTybd2vO/IXIw02ZOg4Gu90gKRvnlUDh7mDUcpc5VMKyfqnnYaA0i5DjBAK9Tz6pyZaKXz3MlF3qumQqbkZnmWfxXZTXvZYj7OEy6ED6G5rbuYYwCQBElywgXib7BRzp3uRAwcse2C/ECgYEAzJ5vkGIskDaTaeFNuivgBl9yUccQBfLy4RSAA/myYvBgKiD2jaSoJOwJk9lBORm/Y8mYVUl2yYUAvcEHvkE10ahqwQkHQBfAF7P5IxqfGtgeTIgL9fJ5D5HgpPaQT0RVAf8WLexzxCTJZ128dv8zu7ex8XrxRdo5YVWv4s4iq1ECgYEAtqkJZxKsuy+cWTFSoFPKYp6XmBlZA+KRLmw13U1pGiUrPhCOQW4l5UsTzWa3NCeneKL/fLAAc4EsXvb4ptyXqOfBHC8z+jgElBl/ifmOS/byBoJD9Y+nWoPKdL3WwnjUOXaMyg/c3C+z6HM4UF3L+Nw5AVz8GyY+3sEhhTkQ8lUCgYEAsnh2go6+o8KWbUFwlDN0oNpbUey4kxfGtH828UC3UQisN9KsefrmFd4ytFxIQU+t2ZGaZrk+/KIfdWKKKG2kTYwCIQCI7GRKzeHSKcYshDOAqev30rt80BHCyN+uGxVUt/sQE1or1ybm7Fub6IbLTq34bNF45B5k8frVAJQfNSECgYBSqpXSzCTYYmfEBgp6/PDvSQ8aiv46P+OsutR1337dkkzLvfpjqlIEP8Iqh34KYJfuhPZTm+PYYnGOWP+XpOYOTzSaaNKBP7Dyxcduzj6UKqLGR1YyYF1BHbwWsYPsZ3rEtt5o5Fz0WbJ2VQ77cDfL3P7/mvGN5/U0Ivvkqzr8MQKBgGSb9bTt8UstAqCkmg6CHX/ZajCSHYA/55iyOdOZJRRV4bfamIJco8ZHFsBHIYMcf0vyu+siGALukXEfFbsXQKvB3fHycDE3CUhTpdfl5EqfQv/yxMqhhLoI4uBVfLBwriVcxtyUgVRJDc3wWEmpthsyQ/CQu9hD2oWnwQZkJnUm
701c1083-1ae4-4025-99cd-f2b56fd24e48	8605465d-13cf-423e-a897-5fd628f4ebbe	certificate	MIICmzCCAYMCBgGPJbLEADANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNDI4MTcxMjAzWhcNMzQwNDI4MTcxMzQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCR/79sQLSoZfdKagF5BPYAvTeiBSksn9NLYEm0V5dnJXyCn4HBfV55IMZebE+0QTjatws7Y+IdjbmNi6q3spSA53BPm21yQ5sjaJ+UzaZxe2XdBfosjhwa3AlJj5R93XjA6iHAY1CATCOoyg5r+O60BnDqOJWvhYHyDm9nPmdw6ZUE08mCV5/lfQHVdpKO/WK+raR5Aeap40ghHnP8M+TveO+QzFwZqUB7DTMOfK/1131S5o36Cu4RVGAi1TqSC27BXqRORJ51peoC7KhxCYbTId/syqtordtdPSSjdCOM9+QWb+A9YvoFwk8iVD/td/1gtYFFVAx2TcXz2Y/1hXPlAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFFGwG30U+AdhScmhugVZcv4F35ITf+DYSHsbhtU7MzpShCqUfUHim9wUHzCNB9KqucIUMagNF3HWf/71gsSsHLeolfAFwGmQ86L/drnYEJkdddTYwQGaCZEQUkVPrvjb/lsm6s6ktGiIGdQTdNgNwVVWgu2V3DtUBt+Um1mEueKNamPUOK+OXzvv5iPjhGe2MT1YKMbk1iSrqL+FyGROYFDiyb2XlN4JJJRwXkxfvk83lG+A1mTvr1F16eIsh2wPbmsmFe0X/VRcTmRJrsHR2ywjlJcxNyuLQzFEhgbNP6xfYMRZC1tYNzhaHEuVcWgg8IT99y1NRF8vItiHy0Czkg=
77cc9925-dec4-47d2-8357-a79fb3423dba	8605465d-13cf-423e-a897-5fd628f4ebbe	priority	100
f51f0ac9-ab44-40df-84ef-33ea8c89e9a4	8605465d-13cf-423e-a897-5fd628f4ebbe	keyUse	SIG
e06c5194-e2af-4d59-916a-3c13752f5bb4	301f3a35-05ce-4978-b130-bc23f7821bd6	priority	100
6e401eeb-94ab-4f1d-8e09-2c81793cc842	301f3a35-05ce-4978-b130-bc23f7821bd6	kid	5c392a7d-0e5f-4f28-9439-549cb27689ac
146c36de-c613-4c6a-be87-02f01c8fb1d3	301f3a35-05ce-4978-b130-bc23f7821bd6	secret	yJhIDLxYT1VXSXDWsUidIA
f5998bf3-7b00-40da-bd99-57aa118942e6	3fe40a01-d110-4d16-b356-247051d61d09	priority	100
14ca4e54-3bc8-45ee-bcf4-a7897764679b	3fe40a01-d110-4d16-b356-247051d61d09	kid	53672235-ece2-44aa-a8d9-9762821a68f9
bda0e614-6ca7-4dce-8b5b-991507d4a4b1	3fe40a01-d110-4d16-b356-247051d61d09	secret	jEDRy8-xZkeTHGE-mz7q8sfyA4pCs2HfMpac79iPJpT66QUWtmhVEbtbimzmtE12eHNfv66Muh49JkHwwjk8RA
85b8cdbb-b4e7-41cd-91c4-13cdc5edab1c	3fe40a01-d110-4d16-b356-247051d61d09	algorithm	HS256
5682fc77-3c41-4200-9d5f-d2a973c3dbbc	44b412d7-77b0-4f34-9b06-b74144140884	algorithm	RSA-OAEP
bcfea34d-ed83-4870-a88f-5d6b4b1bbb59	44b412d7-77b0-4f34-9b06-b74144140884	privateKey	MIIEowIBAAKCAQEAyrllnoVx4cS0X8ZwEDxU3VgVfLzaBpa9yn+k5mvzgj3y4zmP6NVDOwwOZY5SDWsI55UUfXy16C3MaUETGoFpd6RRzfFnrlak/Zy67/Km0W8PJXtOj3oLiT8TCWMFuVLccAWXwzi0HlNZGVRr3nY52aWHzKNWXpYrjFZdSRegHIY743ZZR0uVjVIG/HZoo2UovqgZOFQ4bQqhbLiI6u8zpIqat5KwHcvFTNT7EgbjKuoANi/u4zL1pwaMYPKO4ByQYXMo89g7VtGmAeOfXzKk/nLoPum6lrwvgfSJ80nRMQVBVAy6GpMq95tZT9Jxlj85cOzCbsXan8aX6hVyAWiXxQIDAQABAoIBAASXvixg+BNGFlMMJxpLD54jInt8uNDI5fxaN3Vr8SycdC3/Lho3iKokDAhzeLrql51NhJUSN/nOXdDtoz3ovCe0fpD0nOV3e43uWNLaU7qvci+mc0FvYacGmYsPJgBMlwdnrQhEdtowB7b58WatFYLvi9vQQILskoh/pWXkReGXg5uFD2Eavm5cWDikzwoIrTQWlr2WvQtuOQ3m9y6UNLnF3tL6Ek3Ihv8jyKAvCJOfOYnQ2S1Bor2pnygVAV5qXrRMfNtWMz87uqw6W2F86KPJtJg9AuLVNYZwJIPLssdUXJmBjSvBH8b76bewb8VSE4h8mDKxe6k90Dh8mLG4jRkCgYEA7YRalNFTk4yUp6M3H/dbV2473tQrQNKyZN4mNanhwg7abs8+FoI1ja0TeT7QMdCZnAzDFJhMywzBsrJPqGhXaYbXEYTUBWH63eK8HqF7NBuY2GYOp+/wAsnQ1/JfTvGBtOsvwyPhhhZUYvJvQHPmQQD9JH3/G4Pg6OiGs1a1YlkCgYEA2n/s7gdXIltMd3I+LLldGTXn7PG4WqwDwOkWpIrTBvJj5vdOTSop7r950i2eyhF1N+LWw0Gp8wg1y3cs7j2Jj2W4IEHgNChPctMRrE3ELZDDfsQEj7nKWH0OifhCINODCx4i5Lh8XGbppgrxvynfyOG1/zjF/uibVY4GX2+7u00CgYBmHywbJE18+UrJMSH4epApbVoMmsjmHDFbsTBYjmxk1aIRVsXpQ57nBW2ECf/WC0ygjdQqvLj37MoznPsm+4Xp93HtNGE81z3XvS8JNIEWjG8RTAAtMLrPWBqVXr6f4LLWKPDmRD0pO9yYlohC/BIaDOTKlenj2LYRLjkMTtG6MQKBgQCKW3URKK7BP6TFAh9ivKG6JAtPW6TMLZ5W2oIPASUtgfFGwJThgfB5kN+3+lFRTQq3r7kkfQD7ttgxla5q0aa4mcWlD3HENT5RzFulirzNyZwxOjhVNmVt8QpyzTQ6ixSwxo173WJKNJSBIu7/iKl/D4XqLe4aQvqRi1R3vE3ZBQKBgAKJ0G8Sqs5bJmRAUOa6+S0s+hHSrRWh7NrGsxTEnVuLiQ/y+siArcdVX1nuPj+sKW4x2ZPsvQGVxsxx9uN+MbPqgnU7a7szFUtZ3ES5DAFgtKnR7TEJbSQ/F336POqrkFPhfgPaAwI5pU0vqOiLxMuuBNKPgb/nr+KWka/nkKqg
6bc91d2a-ecd5-4923-83b8-a98858841198	44b412d7-77b0-4f34-9b06-b74144140884	certificate	MIICnzCCAYcCBgGPJcvQDTANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhteS1yZWFsbTAeFw0yNDA0MjgxNzM5MjVaFw0zNDA0MjgxNzQxMDVaMBMxETAPBgNVBAMMCG15LXJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyrllnoVx4cS0X8ZwEDxU3VgVfLzaBpa9yn+k5mvzgj3y4zmP6NVDOwwOZY5SDWsI55UUfXy16C3MaUETGoFpd6RRzfFnrlak/Zy67/Km0W8PJXtOj3oLiT8TCWMFuVLccAWXwzi0HlNZGVRr3nY52aWHzKNWXpYrjFZdSRegHIY743ZZR0uVjVIG/HZoo2UovqgZOFQ4bQqhbLiI6u8zpIqat5KwHcvFTNT7EgbjKuoANi/u4zL1pwaMYPKO4ByQYXMo89g7VtGmAeOfXzKk/nLoPum6lrwvgfSJ80nRMQVBVAy6GpMq95tZT9Jxlj85cOzCbsXan8aX6hVyAWiXxQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQDG9K0OWBN42Sj9TGu8GpL8lE8YVlmKSemu4h3dWgOGbOoLBT/E18RU2RAVsZErvjGkcuSCsUtP6VoYJGwpV544QwHOULAWR/kc01raAjN6WXoH9XwACig+xbi5Gc09ceFZEMGBBqP0sL9CAxGIoFc8E/dzBjVEdMMQ+3pp2VTynGQteHh2q7FwaIRF1F5j3w8FKc13P841gt898wAdC2nvAwKhOdTLsXa6cXRRMc4KTXE9h0M6EJ+M/GOWxk4v0Jc09ptuQeh9mrVMHLbkGuyMQy68gcKEpxRpkkDBJgj1bsxgluZHlLamQZy507ipsYU19pdgDwZZS3EoNZssQ1WE
3ab73cf4-6471-41d2-b8c0-06b0d65f5eed	44b412d7-77b0-4f34-9b06-b74144140884	keyUse	ENC
14572931-f639-4b87-8809-288186de2416	44b412d7-77b0-4f34-9b06-b74144140884	priority	100
0443b5f7-cae8-4ee7-a8e2-2e2cf0f049f5	2391d244-ec23-4b39-ab80-bf903594ee8f	secret	n2aRy88ppTSh4xfia6cF4w
bb4f3854-bb0b-4dee-b50c-7f162ac9af48	2391d244-ec23-4b39-ab80-bf903594ee8f	kid	296ffcb5-b9cd-45f7-bd58-dfddb9b6b8ae
8a7b7b47-d25a-4c05-9975-13b9ffed85c4	2391d244-ec23-4b39-ab80-bf903594ee8f	priority	100
c5cb068c-3901-4d5b-9fc6-eb505bc71e27	d171863a-cdf5-4b94-a43c-67d464d4e8b8	priority	100
41dba588-d94a-4704-b088-e141a319349f	d171863a-cdf5-4b94-a43c-67d464d4e8b8	privateKey	MIIEowIBAAKCAQEAyCPaT+bQYUsS/JfANOuV31lfER+0G/fwZ3QrtxFZfltM/EAyNHTqhXsoCGy+90ZDCjRXKO0BvzPTNNGT8cKjReWrQ3eQFjUsYex1kIpR5P2g8c3SBKUZsUKpp4FzW6XEtrSqB4icu5XoU9f43IWLtjnQt92SaWk5OWK3wS5BQyrbyakAY7C6+CezHSnRQh5LYDGrx3ALaCBsk1xvze+NN+1HkOpANQk4rNvDkV1v6LOuLlkai8H+XhPNdbKEs7Shp1wSG4vZicjzGiIqMpzQgS2vC6c2YKF3e7ruPFGkP6/Og6h3kdaHC6r80kp9y1Y7/JbDKYTcKUJ1msJ9R2P2DQIDAQABAoIBAAk7crrrIDo8uS6i3fvJ0SIMt1moS+CkHwX9iQfYjwm2ji9u98+fqHwgYogVh4rCRh37PvjlLxjfstmcm5x9X3Ir+uGj2N37GfOXA++b0dT/yG0fEt8P+zRIFzv0S1GzPwbrJNud0oPqbO+8nUg6UfohGTEdiFF3WpAhHMlx8RJ3LdlQvYdLj/XOo1hwz3TC6JBPe+MXcFDR6kCCLrNS16wJ3q5FU+QFxGIuV/9tlhAd56f7ImEFH0qFwJWezEoLsIrMv3JkRF1mJFYcq7zP6/oHD6V31s+FFLevZTR0apvKVBzSjWqU421wJxQGi6J4zKYLUaiXcKbuOA0QJMXnGykCgYEA9WyzjhzMSgL/pmQqzLgRIHE6PNcMC15Dt51zLiG0JgLbX6bQ19pZ1hYQwe6hgrHaZg7MOxu1i6oFK0IQTdGFjFcaco2HKBpPSdfgGu/ZQ43hrirYc7jlLDXnKI+o3tJuw2pWcJJzo8bfAGqjOxlOSMVpzWmqFDLG4lklCKqoCGMCgYEA0MOdHTTrng+TCT58t0ZTK61SxjtUQF+chn7vZXMZfsVCKTooUmR24ZbgZzkEF8wU/QJzPqdHMI/e8xy5vSnAooS4qZ6wMN731SyXZ9sSW3P+zYRnnuCyt5kw90LjvU3eBjYBx14IZniVgUoF45klkNe1JpTEruPsrE9RFoRCes8CgYBFJ9s0qVK7bDrjhQg2ZYuV67HwYNxo+6fzPm+tSRv9NgLg4h2pJUL5O4B/VSG3tSwIZBUSds1iTIdmWBhGBUsvb3/pVY4HM9qxwR3KGVnMWleEf1g8y5XwLkQzvr9kAkHp2LYAxJPHS4udD29tgMT5Zn9YvXSKeoBmWZ5A4e21ZwKBgF9XFqfCBWD4J+Ru3zIsMcueqlDRw5Zqk+dwjRA90oTsvVxqrQOD0i8QYoeBqHbdwzARMGSKrJ5m9iD9G25iZRFTn6oHSNvo2DJI3RSXHfkaLmHZeCE86SGkGpKxv6QyrZUUkRdlwFxb8ZtMHQhmZpuRh6+I/ZIJkYrX5mZsHJhNAoGBAKE8ixwMsl8qSb/PIFhH7qSwNIJ2wvQPXyRfj0kJpYX/tQsMyqc0NViHC/scnjOy+Hbv/7d4fDKcx6KGwSuaJFZgu8qMMPQ9MhqmO/EK4at/gMbpwryP9EbxiiGxVZNeEUbplTI4IUbNwmdS3PQsDnjRHSClWblYK7dwGBgI7+Ce
7d990338-33d1-4336-984f-c96dc7b20885	d171863a-cdf5-4b94-a43c-67d464d4e8b8	keyUse	SIG
ada98d11-b3ac-491d-8458-0e734aa60163	d171863a-cdf5-4b94-a43c-67d464d4e8b8	certificate	MIICnzCCAYcCBgGPJcvNrTANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhteS1yZWFsbTAeFw0yNDA0MjgxNzM5MjRaFw0zNDA0MjgxNzQxMDRaMBMxETAPBgNVBAMMCG15LXJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyCPaT+bQYUsS/JfANOuV31lfER+0G/fwZ3QrtxFZfltM/EAyNHTqhXsoCGy+90ZDCjRXKO0BvzPTNNGT8cKjReWrQ3eQFjUsYex1kIpR5P2g8c3SBKUZsUKpp4FzW6XEtrSqB4icu5XoU9f43IWLtjnQt92SaWk5OWK3wS5BQyrbyakAY7C6+CezHSnRQh5LYDGrx3ALaCBsk1xvze+NN+1HkOpANQk4rNvDkV1v6LOuLlkai8H+XhPNdbKEs7Shp1wSG4vZicjzGiIqMpzQgS2vC6c2YKF3e7ruPFGkP6/Og6h3kdaHC6r80kp9y1Y7/JbDKYTcKUJ1msJ9R2P2DQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBe46byHWTtX/6wLvn/40ia/PkMsM1RXtM20C8CGCUzuH45jduSGZ2ojZi9gWzW3wuoNMopvBr7vQVqUqQvqJYerJyE6vS5atcPRKCz/eQUk0+OiryY6cxZl5Sqdb9o5W7/OJ4o7qK0fO/AF/AHBCcxmKdQ83FT/CeO3tU9XqtcXE/Rcm3MmQ6+5pp+wj+Qs2UqIMHGFHW6Yvcj6anav05vmUKhTddhqSzE2K/yIUKiyfmuzsEsJcIjE3qevdLXxHtHdZHMrICLiPirFo3y0ZmZ9uEE/FD7BRe3U/WCMyMKdOuFt/46UTl8NjVBszPxVDcygtE4sx+fJ+e0gTq9gM+2
e54e4b85-b2b1-490f-8e36-8c2b667ae668	6a21cf86-f85f-4eec-b392-bfa043a6e3a8	allowed-protocol-mapper-types	saml-role-list-mapper
bb0c7761-66df-483f-baa7-88ff9be86b96	6a21cf86-f85f-4eec-b392-bfa043a6e3a8	allowed-protocol-mapper-types	oidc-address-mapper
e220ad48-a72b-4250-a57c-4aa1055404ec	6a21cf86-f85f-4eec-b392-bfa043a6e3a8	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c3bacda5-7b26-46fb-afc3-14ed70cc54a0	6a21cf86-f85f-4eec-b392-bfa043a6e3a8	allowed-protocol-mapper-types	oidc-full-name-mapper
e09ca3b7-e0ca-48f8-b184-3a83f9684b62	6a21cf86-f85f-4eec-b392-bfa043a6e3a8	allowed-protocol-mapper-types	saml-user-attribute-mapper
bececd74-9ba6-43f7-9a30-809baa19ed32	6a21cf86-f85f-4eec-b392-bfa043a6e3a8	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d2ff0a76-c529-4a76-b5de-d7e8eeabf4e7	6a21cf86-f85f-4eec-b392-bfa043a6e3a8	allowed-protocol-mapper-types	saml-user-property-mapper
7a032e09-fb12-48ab-9f04-9f5c3190add1	6a21cf86-f85f-4eec-b392-bfa043a6e3a8	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2dbc619e-1190-4815-bc3a-60c479c1e652	caa3d6fc-42cd-463e-a363-b310096f3567	allow-default-scopes	true
a789f8a2-4336-4a91-b11a-d537817c39d2	a8c2df65-4f78-40a6-af1c-9087bc6d7815	allow-default-scopes	true
7b419014-db17-4918-91f7-dc2c9d0252d6	ce775445-464a-470f-b6b5-00c3afcab0d4	allowed-protocol-mapper-types	oidc-full-name-mapper
5a1cfd86-396f-420a-834e-260cf633cc58	ce775445-464a-470f-b6b5-00c3afcab0d4	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
89121293-7a92-4cd6-b174-9f9ec2e38d02	ce775445-464a-470f-b6b5-00c3afcab0d4	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
48a62bf8-b655-4083-8b4a-90c9789c72e6	ce775445-464a-470f-b6b5-00c3afcab0d4	allowed-protocol-mapper-types	saml-user-attribute-mapper
68a069b1-ca1a-4f0e-b9e9-d0f37f5aa52e	ce775445-464a-470f-b6b5-00c3afcab0d4	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
51fa74d9-2753-4c47-9fb0-e6ff3ef9dfd4	ce775445-464a-470f-b6b5-00c3afcab0d4	allowed-protocol-mapper-types	saml-user-property-mapper
6e44fe6d-aa88-4352-bc89-0fe1a5df9d0e	ce775445-464a-470f-b6b5-00c3afcab0d4	allowed-protocol-mapper-types	oidc-address-mapper
922407bc-9d39-48d1-b786-8e7e96a0b493	ce775445-464a-470f-b6b5-00c3afcab0d4	allowed-protocol-mapper-types	saml-role-list-mapper
c45bc11f-d6f4-4395-baac-e4c3be5b326e	86c3202b-e908-42a1-8a00-b39165fad3ea	host-sending-registration-request-must-match	true
df22f1c5-5dad-45ed-b280-7576d79afe9a	86c3202b-e908-42a1-8a00-b39165fad3ea	client-uris-must-match	true
3770fff6-2387-494b-9282-be471d9f5066	76d37d6d-33ac-4e03-92f4-e8a69242ade7	max-clients	200
\.


--
-- TOC entry 4072 (class 0 OID 16421)
-- Dependencies: 219
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
1c1b51ec-8c91-402d-ae74-7bccad40973c	844beb4d-c507-42c4-8b70-9f005b75b79a
1c1b51ec-8c91-402d-ae74-7bccad40973c	8355068d-62bc-4619-b948-783bb0c41d51
1c1b51ec-8c91-402d-ae74-7bccad40973c	5f93daa1-02ed-4d14-93b7-5748264d2123
1c1b51ec-8c91-402d-ae74-7bccad40973c	702375fa-c883-4198-8c1c-683fee2294a3
1c1b51ec-8c91-402d-ae74-7bccad40973c	996cf281-0702-49ef-8cc1-482ba6e77ab3
1c1b51ec-8c91-402d-ae74-7bccad40973c	cc5d26b9-775c-44ec-91c2-2031968cdff8
1c1b51ec-8c91-402d-ae74-7bccad40973c	262558bc-863f-4a51-b964-630300e81441
1c1b51ec-8c91-402d-ae74-7bccad40973c	b1af5dea-b336-4627-9b27-73bd6433ed80
1c1b51ec-8c91-402d-ae74-7bccad40973c	52dd4276-4f42-4e0a-923f-9b83726d5505
1c1b51ec-8c91-402d-ae74-7bccad40973c	670ef44f-ada0-4e31-92e5-8c2ef1e3f764
1c1b51ec-8c91-402d-ae74-7bccad40973c	dc2c9b0e-cf6a-40cf-8454-68da08543ecb
1c1b51ec-8c91-402d-ae74-7bccad40973c	7204307b-a934-40fe-b088-48b752160585
1c1b51ec-8c91-402d-ae74-7bccad40973c	ff594fe6-30b7-442a-a336-507c85272c35
1c1b51ec-8c91-402d-ae74-7bccad40973c	5013ea32-c9f6-4aee-a320-fa342372f4b0
1c1b51ec-8c91-402d-ae74-7bccad40973c	a325749c-aae9-4745-94f6-5e1f810265eb
1c1b51ec-8c91-402d-ae74-7bccad40973c	68753beb-5b08-4f70-b306-5d745a368bdc
1c1b51ec-8c91-402d-ae74-7bccad40973c	b5c1286b-240f-4f71-8645-0415bc3791dd
1c1b51ec-8c91-402d-ae74-7bccad40973c	3a327340-3f15-4a3b-854d-d5e121012233
702375fa-c883-4198-8c1c-683fee2294a3	a325749c-aae9-4745-94f6-5e1f810265eb
702375fa-c883-4198-8c1c-683fee2294a3	3a327340-3f15-4a3b-854d-d5e121012233
996cf281-0702-49ef-8cc1-482ba6e77ab3	68753beb-5b08-4f70-b306-5d745a368bdc
a77105e9-ee98-4159-a917-ff6e9ae68b85	c83ac578-69df-443e-99bd-59ef89c15603
a77105e9-ee98-4159-a917-ff6e9ae68b85	2c24bac6-61c1-451b-8223-a1d16ab8f6dc
2c24bac6-61c1-451b-8223-a1d16ab8f6dc	1eea3331-2598-4ed5-94a7-4b229f52219e
0a7f8bc7-0c56-46f7-8dfa-ee0fb23d7fd2	87f37a74-dce9-4262-beb7-017180940a58
1c1b51ec-8c91-402d-ae74-7bccad40973c	6c7d6375-a6d8-4599-94b8-c698b32f3109
a77105e9-ee98-4159-a917-ff6e9ae68b85	eeb84ebf-2da8-40fa-9ff8-13d8da4f3649
a77105e9-ee98-4159-a917-ff6e9ae68b85	83b7919d-a635-4a9e-9cd7-129555787341
1c1b51ec-8c91-402d-ae74-7bccad40973c	904b1f3a-d2c4-4d34-aa49-c56b1b1d53a3
1c1b51ec-8c91-402d-ae74-7bccad40973c	3fcebf3c-1ce4-4c2f-b978-69f6aa16779b
1c1b51ec-8c91-402d-ae74-7bccad40973c	d28f8c3d-d49d-40bd-8af8-08ffb6dba0e6
1c1b51ec-8c91-402d-ae74-7bccad40973c	56260072-48b0-43d3-abac-60c5562c6e28
1c1b51ec-8c91-402d-ae74-7bccad40973c	8bcaa76f-96b1-4ae8-b898-6fe9458c4d6c
1c1b51ec-8c91-402d-ae74-7bccad40973c	84c49801-50d3-4c7d-b54c-a1f4bf90232c
1c1b51ec-8c91-402d-ae74-7bccad40973c	fd8c6b17-6cab-4eca-a3ab-e327989d861e
1c1b51ec-8c91-402d-ae74-7bccad40973c	5393af83-31c4-43f9-bd71-cded0f83209a
1c1b51ec-8c91-402d-ae74-7bccad40973c	1a9160f3-66ee-48f7-8caf-59cf99929f6e
1c1b51ec-8c91-402d-ae74-7bccad40973c	91862542-443a-466d-b5dc-18374444aa17
1c1b51ec-8c91-402d-ae74-7bccad40973c	4a6b6499-074f-4b60-b6db-e916092d0850
1c1b51ec-8c91-402d-ae74-7bccad40973c	038b0d50-1787-4ab1-b009-630d415f5f40
1c1b51ec-8c91-402d-ae74-7bccad40973c	dfa9c708-68a5-4b45-a56d-708b317e1e0a
1c1b51ec-8c91-402d-ae74-7bccad40973c	2a3c910d-2958-4153-a8f9-ebdf0f5594f3
1c1b51ec-8c91-402d-ae74-7bccad40973c	d99c4d84-a2df-4858-a6d7-95e814c0de3d
1c1b51ec-8c91-402d-ae74-7bccad40973c	4319f979-7e4a-4f71-a291-d06ee0b060fe
1c1b51ec-8c91-402d-ae74-7bccad40973c	5e0b0448-74b9-46cc-b548-65af4b754651
56260072-48b0-43d3-abac-60c5562c6e28	d99c4d84-a2df-4858-a6d7-95e814c0de3d
d28f8c3d-d49d-40bd-8af8-08ffb6dba0e6	5e0b0448-74b9-46cc-b548-65af4b754651
d28f8c3d-d49d-40bd-8af8-08ffb6dba0e6	2a3c910d-2958-4153-a8f9-ebdf0f5594f3
6891a449-918a-4875-95bf-1c2f5f92b852	2e3d6fde-2a20-4034-9f2e-33933de62276
6891a449-918a-4875-95bf-1c2f5f92b852	28f7e2b9-c818-4ae9-a0c0-3b01c47c7e40
6891a449-918a-4875-95bf-1c2f5f92b852	0c9351cf-999d-47c1-b703-7eb4f29fd031
6891a449-918a-4875-95bf-1c2f5f92b852	aa205c53-edad-4c1f-a06e-5c4ae7c1df0a
6891a449-918a-4875-95bf-1c2f5f92b852	d957976b-445f-494d-87b4-06a156c7540e
6891a449-918a-4875-95bf-1c2f5f92b852	e4ed1461-975d-4a6d-b37d-b424e9f484a7
6891a449-918a-4875-95bf-1c2f5f92b852	ea993011-cce5-4826-beab-b2d56fb7e3db
6891a449-918a-4875-95bf-1c2f5f92b852	98814e36-6826-4b54-ac19-d598bebb39b4
6891a449-918a-4875-95bf-1c2f5f92b852	d189776a-ecb8-4ae0-9ea3-565b9da84e79
6891a449-918a-4875-95bf-1c2f5f92b852	d623df25-f75e-48c0-b2d6-56bc1e20a95d
6891a449-918a-4875-95bf-1c2f5f92b852	019bb31d-dc02-4560-a09f-f84df10b3feb
6891a449-918a-4875-95bf-1c2f5f92b852	15714f61-7c6e-4597-bbe2-80d6edaae20a
6891a449-918a-4875-95bf-1c2f5f92b852	be6acac4-8e8f-4b65-8cf3-599a08daa2be
6891a449-918a-4875-95bf-1c2f5f92b852	20dfe6bf-e6dd-4687-ac26-ec3dee59cae3
6891a449-918a-4875-95bf-1c2f5f92b852	e0bcf084-5752-41f5-b8ff-29a258e4eeca
6891a449-918a-4875-95bf-1c2f5f92b852	bbe5df5f-8e42-4f3b-ac65-11cb8b2c0a5b
6891a449-918a-4875-95bf-1c2f5f92b852	b8759ebe-1ca3-4699-b0b8-cf9468584a78
0c9351cf-999d-47c1-b703-7eb4f29fd031	20dfe6bf-e6dd-4687-ac26-ec3dee59cae3
0c9351cf-999d-47c1-b703-7eb4f29fd031	b8759ebe-1ca3-4699-b0b8-cf9468584a78
432ea4f8-cdec-4dde-998b-abc1de75e242	99f9e558-e3ec-45ca-90eb-4fb9fa1bb05d
aa205c53-edad-4c1f-a06e-5c4ae7c1df0a	e0bcf084-5752-41f5-b8ff-29a258e4eeca
432ea4f8-cdec-4dde-998b-abc1de75e242	467a7cf7-50cb-46dc-b72f-a67a3391cd9f
467a7cf7-50cb-46dc-b72f-a67a3391cd9f	2959d59d-abcd-40da-96cc-fbd0b6384014
12642d18-99aa-4e1f-987c-20d32a99b175	84299c4a-c110-4154-959c-058225304921
1c1b51ec-8c91-402d-ae74-7bccad40973c	465e1393-ba9a-4640-b945-d762e0c2f677
6891a449-918a-4875-95bf-1c2f5f92b852	0bf057d5-0eeb-4603-ac09-2b640616848f
432ea4f8-cdec-4dde-998b-abc1de75e242	f40ac6b2-eb7f-4c53-9e5d-74005011df35
432ea4f8-cdec-4dde-998b-abc1de75e242	8974acef-02c6-438d-849e-7a9d69b501c3
432ea4f8-cdec-4dde-998b-abc1de75e242	f3c8d500-03b2-4c29-ae40-0419443789fd
\.


--
-- TOC entry 4073 (class 0 OID 16424)
-- Dependencies: 220
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
21f0e9ba-af7e-4899-b429-02601f44d19c	\N	password	f1740b31-1317-425e-95db-f2b8221a9d00	1714324425744	\N	{"value":"mO5HnS1hEC7mjKJAegH08iRRR6rGtIAydJOA6D3QeCI=","salt":"EyIjYmsyx373xcH6YD3wNA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
77181df2-36db-443c-8f80-db1ae0b87976	\N	password	706471c7-b204-4281-9f96-60182be00471	1714332990976	My password	{"value":"u82J7a+ztHHlRXtSFusUuwejblBrfawCXGzPFePeSv0=","salt":"eTuSSZCzwI28OPez6qsLgg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- TOC entry 4068 (class 0 OID 16394)
-- Dependencies: 215
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-04-28 17:12:02.589918	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	4324302010
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-04-28 17:12:02.967845	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	4324302010
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-04-28 17:12:06.161886	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.23.2	\N	\N	4324302010
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-04-28 17:12:06.678991	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4324302010
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-04-28 17:12:12.107787	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	4324302010
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-04-28 17:12:12.331063	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	4324302010
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-04-28 17:12:17.178577	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	4324302010
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-04-28 17:12:17.375439	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	4324302010
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-04-28 17:12:17.631483	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.23.2	\N	\N	4324302010
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-04-28 17:12:22.965118	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.23.2	\N	\N	4324302010
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-04-28 17:12:25.756481	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4324302010
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-04-28 17:12:25.915664	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4324302010
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-04-28 17:12:26.242441	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4324302010
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-04-28 17:12:27.338866	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.23.2	\N	\N	4324302010
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-04-28 17:12:27.402851	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4324302010
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-04-28 17:12:27.448867	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.23.2	\N	\N	4324302010
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-04-28 17:12:27.520695	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.23.2	\N	\N	4324302010
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-04-28 17:12:29.800636	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.23.2	\N	\N	4324302010
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-04-28 17:12:31.955191	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	4324302010
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-04-28 17:12:32.253728	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	4324302010
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-04-28 17:12:32.450725	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	4324302010
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-04-28 17:12:32.607279	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	4324302010
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-04-28 17:12:33.133352	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.23.2	\N	\N	4324302010
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-04-28 17:12:33.361276	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	4324302010
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-04-28 17:12:33.570431	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	4324302010
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-04-28 17:12:36.01073	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.23.2	\N	\N	4324302010
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-04-28 17:12:41.555877	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.23.2	\N	\N	4324302010
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-04-28 17:12:41.754064	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	4324302010
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-04-28 17:12:46.533987	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.23.2	\N	\N	4324302010
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-04-28 17:12:47.259607	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.23.2	\N	\N	4324302010
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-04-28 17:12:47.834772	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.23.2	\N	\N	4324302010
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-04-28 17:12:47.890797	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.23.2	\N	\N	4324302010
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-04-28 17:12:48.043496	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4324302010
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-04-28 17:12:48.109393	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	4324302010
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-04-28 17:12:49.682889	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	4324302010
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-04-28 17:12:50.151029	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.23.2	\N	\N	4324302010
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-04-28 17:12:50.58834	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4324302010
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-04-28 17:12:50.716445	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.23.2	\N	\N	4324302010
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-04-28 17:12:50.870551	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.23.2	\N	\N	4324302010
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-04-28 17:12:50.915421	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	4324302010
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-04-28 17:12:50.979954	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	4324302010
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-04-28 17:12:51.060044	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.23.2	\N	\N	4324302010
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-04-28 17:13:06.716879	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.23.2	\N	\N	4324302010
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-04-28 17:13:06.840718	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.23.2	\N	\N	4324302010
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-28 17:13:06.9978	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	4324302010
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-28 17:13:07.074947	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.23.2	\N	\N	4324302010
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-28 17:13:07.162513	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	4324302010
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-28 17:13:08.606486	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.23.2	\N	\N	4324302010
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-28 17:13:09.06496	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.23.2	\N	\N	4324302010
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-04-28 17:13:12.508988	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.23.2	\N	\N	4324302010
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-04-28 17:13:15.105241	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.23.2	\N	\N	4324302010
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-04-28 17:13:15.250521	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4324302010
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-04-28 17:13:15.364608	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.23.2	\N	\N	4324302010
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-04-28 17:13:15.468067	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.23.2	\N	\N	4324302010
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-04-28 17:13:15.689632	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.23.2	\N	\N	4324302010
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-04-28 17:13:15.798078	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.23.2	\N	\N	4324302010
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-04-28 17:13:16.955456	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.23.2	\N	\N	4324302010
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-04-28 17:13:22.029551	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.23.2	\N	\N	4324302010
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-04-28 17:13:23.112188	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.23.2	\N	\N	4324302010
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-04-28 17:13:23.314521	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	4324302010
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-04-28 17:13:23.520822	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.23.2	\N	\N	4324302010
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-04-28 17:13:23.909473	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.23.2	\N	\N	4324302010
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-04-28 17:13:24.043095	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	4324302010
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-04-28 17:13:24.170006	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	4324302010
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-04-28 17:13:24.288297	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.23.2	\N	\N	4324302010
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-04-28 17:13:25.226361	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.23.2	\N	\N	4324302010
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-04-28 17:13:25.586212	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.23.2	\N	\N	4324302010
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-04-28 17:13:25.736173	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.23.2	\N	\N	4324302010
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-04-28 17:13:25.934725	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.23.2	\N	\N	4324302010
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-04-28 17:13:26.125089	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.23.2	\N	\N	4324302010
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-04-28 17:13:26.357174	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	4324302010
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-28 17:13:26.539037	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4324302010
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-28 17:13:26.697264	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4324302010
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-28 17:13:26.807312	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4324302010
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-28 17:13:26.983392	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.23.2	\N	\N	4324302010
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-28 17:13:27.52587	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.23.2	\N	\N	4324302010
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-04-28 17:13:28.013938	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.23.2	\N	\N	4324302010
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-04-28 17:13:28.209971	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.23.2	\N	\N	4324302010
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-04-28 17:13:29.438077	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.23.2	\N	\N	4324302010
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-04-28 17:13:29.594064	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.23.2	\N	\N	4324302010
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-28 17:13:30.014447	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.23.2	\N	\N	4324302010
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-28 17:13:30.196724	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4324302010
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-28 17:13:30.491623	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4324302010
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-28 17:13:30.556155	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4324302010
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-28 17:13:31.190791	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4324302010
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-04-28 17:13:31.661471	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.23.2	\N	\N	4324302010
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-04-28 17:13:32.04131	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.23.2	\N	\N	4324302010
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-04-28 17:13:32.487075	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.23.2	\N	\N	4324302010
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-28 17:13:32.678536	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.23.2	\N	\N	4324302010
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-28 17:13:32.850783	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.23.2	\N	\N	4324302010
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-28 17:13:33.172487	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4324302010
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-28 17:13:33.348245	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.23.2	\N	\N	4324302010
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-28 17:13:33.406135	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	4324302010
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-28 17:13:33.853495	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	4324302010
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-28 17:13:33.942215	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.23.2	\N	\N	4324302010
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-28 17:13:34.189429	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.23.2	\N	\N	4324302010
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-28 17:13:34.791896	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4324302010
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-28 17:13:34.891545	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4324302010
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-28 17:13:35.062745	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4324302010
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-28 17:13:35.310853	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4324302010
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-28 17:13:35.383141	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4324302010
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-28 17:13:35.809462	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.23.2	\N	\N	4324302010
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-28 17:13:35.885956	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.23.2	\N	\N	4324302010
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-04-28 17:13:36.023519	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.23.2	\N	\N	4324302010
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-04-28 17:13:36.382583	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.23.2	\N	\N	4324302010
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-04-28 17:13:36.743907	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.23.2	\N	\N	4324302010
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-04-28 17:13:36.825628	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.23.2	\N	\N	4324302010
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-04-28 17:13:37.106933	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	4324302010
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-04-28 17:13:37.226005	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	4324302010
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-04-28 17:13:37.407685	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4324302010
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-04-28 17:13:37.49559	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.23.2	\N	\N	4324302010
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-04-28 17:13:39.396168	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	4324302010
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-04-28 17:13:39.555497	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.23.2	\N	\N	4324302010
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-04-28 17:13:39.730759	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.23.2	\N	\N	4324302010
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-04-28 17:13:39.871773	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.23.2	\N	\N	4324302010
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-04-28 17:13:40.243694	116	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.23.2	\N	\N	4324302010
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-04-28 17:13:40.5967	117	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4324302010
\.


--
-- TOC entry 4067 (class 0 OID 16389)
-- Dependencies: 214
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- TOC entry 4151 (class 0 OID 17786)
-- Dependencies: 298
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	b3a81eab-1a08-4ae0-bf09-5a0065c8a8ab	f
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	1b934fb1-d066-439c-abef-46e16257f317	t
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	7d6a2678-71d7-4a0c-8c2f-f15ae831415c	t
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	29558f8c-f2dd-4c6e-8ba0-3014189b706f	t
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	8fc8d947-3f9c-4203-8700-2b2289c7f2fc	f
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f4f0217c-d949-4cfa-a812-1917ecbc145c	f
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f55ac800-a2fc-4679-a1ae-510523d50fce	t
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0652010a-6916-407c-ae70-f8e83d85409f	t
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	4fdcfd08-80ac-4544-be15-27563bd8eafa	f
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	915a61fa-a0ce-4825-b60f-f8011460e85f	t
959ad7c1-9708-4b39-8f74-c6064f245370	3a6b0e2a-090b-486a-b49c-0e244f5dff5f	f
959ad7c1-9708-4b39-8f74-c6064f245370	fe3861bb-df6c-47ab-bed8-03db84b3ab20	t
959ad7c1-9708-4b39-8f74-c6064f245370	e7b79684-34ac-462c-80bc-63965decdf8c	t
959ad7c1-9708-4b39-8f74-c6064f245370	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc	t
959ad7c1-9708-4b39-8f74-c6064f245370	62b51ba0-a3f3-4402-91bd-4b2f1748e577	f
959ad7c1-9708-4b39-8f74-c6064f245370	75085f73-3878-47a0-8ff8-03a6cac8eb0a	f
959ad7c1-9708-4b39-8f74-c6064f245370	46fded59-2fd9-4c87-94d7-e76097a7bac2	t
959ad7c1-9708-4b39-8f74-c6064f245370	7ed8c6e4-13e5-45c8-b504-b3d17dd49360	t
959ad7c1-9708-4b39-8f74-c6064f245370	b082daf1-9478-4165-a77c-976a880fac7a	t
959ad7c1-9708-4b39-8f74-c6064f245370	82a5fda7-8317-4223-96c5-2db3d65bfb07	t
\.


--
-- TOC entry 4074 (class 0 OID 16429)
-- Dependencies: 221
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- TOC entry 4139 (class 0 OID 17484)
-- Dependencies: 286
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- TOC entry 4140 (class 0 OID 17489)
-- Dependencies: 287
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4153 (class 0 OID 17812)
-- Dependencies: 300
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4141 (class 0 OID 17498)
-- Dependencies: 288
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- TOC entry 4142 (class 0 OID 17507)
-- Dependencies: 289
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4143 (class 0 OID 17510)
-- Dependencies: 290
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4144 (class 0 OID 17516)
-- Dependencies: 291
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4097 (class 0 OID 16806)
-- Dependencies: 244
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4147 (class 0 OID 17581)
-- Dependencies: 294
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- TOC entry 4159 (class 0 OID 18100)
-- Dependencies: 306
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	keycloak	2024-04-30 23:08:37.171097	0	t
2	2	create category table	SQL	V2__create_category_table.sql	1682338767	keycloak	2024-04-30 23:08:37.643446	221	t
\.


--
-- TOC entry 4123 (class 0 OID 17208)
-- Dependencies: 270
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- TOC entry 4122 (class 0 OID 17205)
-- Dependencies: 269
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- TOC entry 4098 (class 0 OID 16811)
-- Dependencies: 245
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
d428d722-485e-4ecb-96fb-a51de8365866	t	google	google	f	f	959ad7c1-9708-4b39-8f74-c6064f245370	f	f	09afff2c-a77c-418e-a173-d5c801672ef6	\N	\N	f
\.


--
-- TOC entry 4099 (class 0 OID 16820)
-- Dependencies: 246
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
d428d722-485e-4ecb-96fb-a51de8365866	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	clientSecret
d428d722-485e-4ecb-96fb-a51de8365866	309598922298-8hhu6ns16ovso4iothtvvllpr31t2a4l.apps.googleusercontent.com	clientId
\.


--
-- TOC entry 4104 (class 0 OID 16924)
-- Dependencies: 251
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4105 (class 0 OID 16929)
-- Dependencies: 252
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4121 (class 0 OID 17202)
-- Dependencies: 268
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- TOC entry 4075 (class 0 OID 16437)
-- Dependencies: 222
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
a77105e9-ee98-4159-a917-ff6e9ae68b85	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f	${role_default-roles}	default-roles-master	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N	\N
1c1b51ec-8c91-402d-ae74-7bccad40973c	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f	${role_admin}	admin	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N	\N
844beb4d-c507-42c4-8b70-9f005b75b79a	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f	${role_create-realm}	create-realm	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N	\N
8355068d-62bc-4619-b948-783bb0c41d51	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_create-client}	create-client	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
5f93daa1-02ed-4d14-93b7-5748264d2123	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_view-realm}	view-realm	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
702375fa-c883-4198-8c1c-683fee2294a3	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_view-users}	view-users	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
996cf281-0702-49ef-8cc1-482ba6e77ab3	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_view-clients}	view-clients	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
cc5d26b9-775c-44ec-91c2-2031968cdff8	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_view-events}	view-events	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
262558bc-863f-4a51-b964-630300e81441	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_view-identity-providers}	view-identity-providers	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
b1af5dea-b336-4627-9b27-73bd6433ed80	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_view-authorization}	view-authorization	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
52dd4276-4f42-4e0a-923f-9b83726d5505	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_manage-realm}	manage-realm	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
670ef44f-ada0-4e31-92e5-8c2ef1e3f764	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_manage-users}	manage-users	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
dc2c9b0e-cf6a-40cf-8454-68da08543ecb	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_manage-clients}	manage-clients	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
7204307b-a934-40fe-b088-48b752160585	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_manage-events}	manage-events	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
ff594fe6-30b7-442a-a336-507c85272c35	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_manage-identity-providers}	manage-identity-providers	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
5013ea32-c9f6-4aee-a320-fa342372f4b0	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_manage-authorization}	manage-authorization	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
a325749c-aae9-4745-94f6-5e1f810265eb	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_query-users}	query-users	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
68753beb-5b08-4f70-b306-5d745a368bdc	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_query-clients}	query-clients	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
b5c1286b-240f-4f71-8645-0415bc3791dd	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_query-realms}	query-realms	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
3a327340-3f15-4a3b-854d-d5e121012233	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_query-groups}	query-groups	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
c83ac578-69df-443e-99bd-59ef89c15603	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	${role_view-profile}	view-profile	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	\N
2c24bac6-61c1-451b-8223-a1d16ab8f6dc	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	${role_manage-account}	manage-account	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	\N
1eea3331-2598-4ed5-94a7-4b229f52219e	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	${role_manage-account-links}	manage-account-links	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	\N
a8e9520a-f7ab-4099-9756-e14b13719312	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	${role_view-applications}	view-applications	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	\N
87f37a74-dce9-4262-beb7-017180940a58	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	${role_view-consent}	view-consent	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	\N
0a7f8bc7-0c56-46f7-8dfa-ee0fb23d7fd2	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	${role_manage-consent}	manage-consent	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	\N
d7f73b0a-98fd-4e25-957a-ff9048236ecd	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	${role_view-groups}	view-groups	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	\N
ea13ce47-586b-4d8f-b9fe-ee39816788e2	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	t	${role_delete-account}	delete-account	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	\N
d412ca91-18a6-45ae-86f0-17a27bef514b	cfb7eb7d-c78d-46c0-860d-64816e7e00ff	t	${role_read-token}	read-token	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	cfb7eb7d-c78d-46c0-860d-64816e7e00ff	\N
6c7d6375-a6d8-4599-94b8-c698b32f3109	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	t	${role_impersonation}	impersonation	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	\N
eeb84ebf-2da8-40fa-9ff8-13d8da4f3649	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f	${role_offline-access}	offline_access	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N	\N
83b7919d-a635-4a9e-9cd7-129555787341	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f	${role_uma_authorization}	uma_authorization	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	\N	\N
432ea4f8-cdec-4dde-998b-abc1de75e242	959ad7c1-9708-4b39-8f74-c6064f245370	f	${role_default-roles}	default-roles-my-realm	959ad7c1-9708-4b39-8f74-c6064f245370	\N	\N
904b1f3a-d2c4-4d34-aa49-c56b1b1d53a3	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_create-client}	create-client	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
3fcebf3c-1ce4-4c2f-b978-69f6aa16779b	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_view-realm}	view-realm	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
d28f8c3d-d49d-40bd-8af8-08ffb6dba0e6	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_view-users}	view-users	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
56260072-48b0-43d3-abac-60c5562c6e28	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_view-clients}	view-clients	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
8bcaa76f-96b1-4ae8-b898-6fe9458c4d6c	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_view-events}	view-events	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
84c49801-50d3-4c7d-b54c-a1f4bf90232c	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_view-identity-providers}	view-identity-providers	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
fd8c6b17-6cab-4eca-a3ab-e327989d861e	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_view-authorization}	view-authorization	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
5393af83-31c4-43f9-bd71-cded0f83209a	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_manage-realm}	manage-realm	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
1a9160f3-66ee-48f7-8caf-59cf99929f6e	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_manage-users}	manage-users	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
91862542-443a-466d-b5dc-18374444aa17	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_manage-clients}	manage-clients	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
4a6b6499-074f-4b60-b6db-e916092d0850	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_manage-events}	manage-events	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
038b0d50-1787-4ab1-b009-630d415f5f40	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_manage-identity-providers}	manage-identity-providers	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
dfa9c708-68a5-4b45-a56d-708b317e1e0a	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_manage-authorization}	manage-authorization	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
2a3c910d-2958-4153-a8f9-ebdf0f5594f3	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_query-users}	query-users	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
d99c4d84-a2df-4858-a6d7-95e814c0de3d	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_query-clients}	query-clients	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
4319f979-7e4a-4f71-a291-d06ee0b060fe	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_query-realms}	query-realms	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
5e0b0448-74b9-46cc-b548-65af4b754651	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_query-groups}	query-groups	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
6891a449-918a-4875-95bf-1c2f5f92b852	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_realm-admin}	realm-admin	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
2e3d6fde-2a20-4034-9f2e-33933de62276	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_create-client}	create-client	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
28f7e2b9-c818-4ae9-a0c0-3b01c47c7e40	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_view-realm}	view-realm	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
0c9351cf-999d-47c1-b703-7eb4f29fd031	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_view-users}	view-users	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
aa205c53-edad-4c1f-a06e-5c4ae7c1df0a	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_view-clients}	view-clients	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
d957976b-445f-494d-87b4-06a156c7540e	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_view-events}	view-events	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
e4ed1461-975d-4a6d-b37d-b424e9f484a7	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_view-identity-providers}	view-identity-providers	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
ea993011-cce5-4826-beab-b2d56fb7e3db	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_view-authorization}	view-authorization	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
98814e36-6826-4b54-ac19-d598bebb39b4	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_manage-realm}	manage-realm	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
d189776a-ecb8-4ae0-9ea3-565b9da84e79	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_manage-users}	manage-users	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
d623df25-f75e-48c0-b2d6-56bc1e20a95d	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_manage-clients}	manage-clients	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
019bb31d-dc02-4560-a09f-f84df10b3feb	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_manage-events}	manage-events	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
15714f61-7c6e-4597-bbe2-80d6edaae20a	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_manage-identity-providers}	manage-identity-providers	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
be6acac4-8e8f-4b65-8cf3-599a08daa2be	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_manage-authorization}	manage-authorization	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
20dfe6bf-e6dd-4687-ac26-ec3dee59cae3	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_query-users}	query-users	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
e0bcf084-5752-41f5-b8ff-29a258e4eeca	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_query-clients}	query-clients	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
bbe5df5f-8e42-4f3b-ac65-11cb8b2c0a5b	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_query-realms}	query-realms	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
b8759ebe-1ca3-4699-b0b8-cf9468584a78	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_query-groups}	query-groups	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
99f9e558-e3ec-45ca-90eb-4fb9fa1bb05d	cec288ee-a963-41d2-9b50-89c7a550691a	t	${role_view-profile}	view-profile	959ad7c1-9708-4b39-8f74-c6064f245370	cec288ee-a963-41d2-9b50-89c7a550691a	\N
467a7cf7-50cb-46dc-b72f-a67a3391cd9f	cec288ee-a963-41d2-9b50-89c7a550691a	t	${role_manage-account}	manage-account	959ad7c1-9708-4b39-8f74-c6064f245370	cec288ee-a963-41d2-9b50-89c7a550691a	\N
2959d59d-abcd-40da-96cc-fbd0b6384014	cec288ee-a963-41d2-9b50-89c7a550691a	t	${role_manage-account-links}	manage-account-links	959ad7c1-9708-4b39-8f74-c6064f245370	cec288ee-a963-41d2-9b50-89c7a550691a	\N
71467597-1c34-41d7-9d71-c7bb8d40a429	cec288ee-a963-41d2-9b50-89c7a550691a	t	${role_view-applications}	view-applications	959ad7c1-9708-4b39-8f74-c6064f245370	cec288ee-a963-41d2-9b50-89c7a550691a	\N
84299c4a-c110-4154-959c-058225304921	cec288ee-a963-41d2-9b50-89c7a550691a	t	${role_view-consent}	view-consent	959ad7c1-9708-4b39-8f74-c6064f245370	cec288ee-a963-41d2-9b50-89c7a550691a	\N
12642d18-99aa-4e1f-987c-20d32a99b175	cec288ee-a963-41d2-9b50-89c7a550691a	t	${role_manage-consent}	manage-consent	959ad7c1-9708-4b39-8f74-c6064f245370	cec288ee-a963-41d2-9b50-89c7a550691a	\N
acfc96de-bddf-476c-8402-56725a8d839a	cec288ee-a963-41d2-9b50-89c7a550691a	t	${role_view-groups}	view-groups	959ad7c1-9708-4b39-8f74-c6064f245370	cec288ee-a963-41d2-9b50-89c7a550691a	\N
229259d1-827a-4c7a-82ab-acd6cda8fdf7	cec288ee-a963-41d2-9b50-89c7a550691a	t	${role_delete-account}	delete-account	959ad7c1-9708-4b39-8f74-c6064f245370	cec288ee-a963-41d2-9b50-89c7a550691a	\N
465e1393-ba9a-4640-b945-d762e0c2f677	73fdaac1-77f4-4941-9e35-bf58d59d0e23	t	${role_impersonation}	impersonation	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	73fdaac1-77f4-4941-9e35-bf58d59d0e23	\N
0bf057d5-0eeb-4603-ac09-2b640616848f	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	t	${role_impersonation}	impersonation	959ad7c1-9708-4b39-8f74-c6064f245370	5050e1fe-3f5d-4567-a1f7-aafcc43bc412	\N
fbadb5e8-fa24-432b-a9fc-8a0663c44845	aea6652f-b8cf-46c0-954b-708ec284f9e3	t	${role_read-token}	read-token	959ad7c1-9708-4b39-8f74-c6064f245370	aea6652f-b8cf-46c0-954b-708ec284f9e3	\N
f40ac6b2-eb7f-4c53-9e5d-74005011df35	959ad7c1-9708-4b39-8f74-c6064f245370	f	${role_offline-access}	offline_access	959ad7c1-9708-4b39-8f74-c6064f245370	\N	\N
8974acef-02c6-438d-849e-7a9d69b501c3	959ad7c1-9708-4b39-8f74-c6064f245370	f	${role_uma_authorization}	uma_authorization	959ad7c1-9708-4b39-8f74-c6064f245370	\N	\N
f3c8d500-03b2-4c29-ae40-0419443789fd	959ad7c1-9708-4b39-8f74-c6064f245370	f		user	959ad7c1-9708-4b39-8f74-c6064f245370	\N	\N
768cf916-e4db-43e6-bf4b-9735bc196a74	959ad7c1-9708-4b39-8f74-c6064f245370	f		admin	959ad7c1-9708-4b39-8f74-c6064f245370	\N	\N
\.


--
-- TOC entry 4103 (class 0 OID 16921)
-- Dependencies: 250
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
fn2ck	23.0.7	1714324421
\.


--
-- TOC entry 4120 (class 0 OID 17193)
-- Dependencies: 267
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4119 (class 0 OID 17188)
-- Dependencies: 266
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- TOC entry 4133 (class 0 OID 17407)
-- Dependencies: 280
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- TOC entry 4095 (class 0 OID 16795)
-- Dependencies: 242
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
b3199989-2737-44e0-9f87-ea843f639e89	audience resolve	openid-connect	oidc-audience-resolve-mapper	66052ff1-7515-4245-94c2-0d346b310437	\N
d63766be-9df0-43f5-98d2-ec3f77549218	locale	openid-connect	oidc-usermodel-attribute-mapper	41a19e86-99ca-47c6-b7de-a3c37158a587	\N
19d83d7b-807b-4140-80f8-a855a3db4faa	role list	saml	saml-role-list-mapper	\N	1b934fb1-d066-439c-abef-46e16257f317
06b94de3-8c13-4115-9922-a4707aeafb01	full name	openid-connect	oidc-full-name-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
b3f3e54b-1fc2-4dba-a7f1-688cbb2849ae	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
b2fc383e-bd27-4b5e-9f6a-c68f4b6e9259	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
766c6fdb-3bdd-4f7a-953d-4cb8944692eb	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
2c97bc7b-3e60-4f71-94d5-b36f756ec0f9	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
2f20e4c4-30e7-4f11-90b2-750f81e833fd	username	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
7f50afb2-c319-498b-bd51-4cf96dd87f7d	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
1160cce7-10c1-48de-9839-65ce05d6d731	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
b70a0ba2-f6a6-4a0e-8ca0-6b2a111e44a8	website	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
f3c69468-d29c-44cd-ba70-e148ebc56f19	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
0bef6602-0e01-4bc2-b9e6-6011559b0723	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
7e355be6-b8a6-4d94-9556-2c282e9e0aca	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
ff9c8c46-4ffc-4326-aff3-e3feb6c645fc	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
7aa83d38-b18f-4d91-8b2a-b1fce5323978	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	7d6a2678-71d7-4a0c-8c2f-f15ae831415c
fda0dcbe-d948-43c7-87ec-1a4b1f35e31b	email	openid-connect	oidc-usermodel-attribute-mapper	\N	29558f8c-f2dd-4c6e-8ba0-3014189b706f
6975c1ed-b0bc-40c0-b4ef-a13997a74a0c	email verified	openid-connect	oidc-usermodel-property-mapper	\N	29558f8c-f2dd-4c6e-8ba0-3014189b706f
46e93d86-b3ce-4b85-97f7-44fb9577ce96	address	openid-connect	oidc-address-mapper	\N	8fc8d947-3f9c-4203-8700-2b2289c7f2fc
c7a5a551-089a-4b40-80d9-e8a8d3f524a3	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	f4f0217c-d949-4cfa-a812-1917ecbc145c
985cc2a0-56f3-4596-b14d-8b041b8adad8	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	f4f0217c-d949-4cfa-a812-1917ecbc145c
2ee6ea29-4bb3-434d-8df3-370746eceda7	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	f55ac800-a2fc-4679-a1ae-510523d50fce
f01d643b-1442-4896-845e-876733b8d0b4	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	f55ac800-a2fc-4679-a1ae-510523d50fce
0767ef77-0eeb-4540-9a4d-ee68113a34dc	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	f55ac800-a2fc-4679-a1ae-510523d50fce
0c5bcd82-21df-4cdf-9de1-3d8edf85d2fd	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	0652010a-6916-407c-ae70-f8e83d85409f
16cc5b54-cda8-451f-b21f-ba250ef97183	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	4fdcfd08-80ac-4544-be15-27563bd8eafa
67fc09e8-59b7-41e0-8ec6-a2a79614cde7	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	4fdcfd08-80ac-4544-be15-27563bd8eafa
8f160256-eacd-4a76-ba40-ef20e3249ad6	acr loa level	openid-connect	oidc-acr-mapper	\N	915a61fa-a0ce-4825-b60f-f8011460e85f
c0735cbd-5166-4999-ab58-1a7d65921d49	audience resolve	openid-connect	oidc-audience-resolve-mapper	d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	\N
d65dce39-6681-4556-a96f-07762cda3d04	role list	saml	saml-role-list-mapper	\N	fe3861bb-df6c-47ab-bed8-03db84b3ab20
435b3e3d-fbc4-4203-90e8-3966348ae060	full name	openid-connect	oidc-full-name-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
7b0d25f9-e465-46c0-9d07-9eed9585add0	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
6ff1d6db-ea36-4f54-bfc3-88645763f9e5	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
12775955-ca28-4b32-9ddf-e9434c4f7dd2	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
da2b015d-70b8-45ec-b380-eaf9efc95ce3	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
47122043-a228-4b13-bdfc-8c5441aef64b	username	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
888db1b1-0854-4dcb-954c-bed0ee96feb2	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
63112b5d-49da-4fde-a2dd-783db66c71b1	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
e36af0e5-e586-465d-9e29-360b01bf3f02	website	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
d45e645d-6547-42ab-b85f-e2ede8835c0a	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
f7f84f36-8641-4344-82a7-da0376fc9e25	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
22ade097-8c78-4b8a-98fa-918158308521	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
e4d0016b-8453-41f6-b78f-0361a1766faa	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
6e101b39-0ac9-4d53-a77a-79cc700fc51e	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	e7b79684-34ac-462c-80bc-63965decdf8c
528ab686-39ea-4cab-afda-4255be4881e2	email	openid-connect	oidc-usermodel-attribute-mapper	\N	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc
b83f08d3-e7c3-445e-b8ec-0abea54bc8af	email verified	openid-connect	oidc-usermodel-property-mapper	\N	5ebc35f4-c61e-41e8-adf0-7970fcbe13fc
43af3e7c-84aa-4d43-9176-22402fadd736	address	openid-connect	oidc-address-mapper	\N	62b51ba0-a3f3-4402-91bd-4b2f1748e577
9ccb1882-0484-4407-ab88-c4a9ddcc02b7	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	75085f73-3878-47a0-8ff8-03a6cac8eb0a
f5fd219a-c431-4816-ac97-5eee4b2aacab	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	75085f73-3878-47a0-8ff8-03a6cac8eb0a
eb511c08-7422-4d5e-a702-96fafd01c877	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	46fded59-2fd9-4c87-94d7-e76097a7bac2
4da58fcb-b387-47c6-9bfe-366d177a9d34	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	46fded59-2fd9-4c87-94d7-e76097a7bac2
35fd9c0d-8f14-4621-836b-66c6175c2956	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	46fded59-2fd9-4c87-94d7-e76097a7bac2
79b8c296-5dfc-4f8f-9647-eae4bc964b73	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	7ed8c6e4-13e5-45c8-b504-b3d17dd49360
e2e1290a-9635-4e87-ba54-fdb212478d6b	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	82a5fda7-8317-4223-96c5-2db3d65bfb07
c3f9bdda-d609-4e90-9d63-a2a5c2b32af8	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	82a5fda7-8317-4223-96c5-2db3d65bfb07
b00f0d24-a6d3-4f81-9de2-76f295d1febb	acr loa level	openid-connect	oidc-acr-mapper	\N	b082daf1-9478-4165-a77c-976a880fac7a
f991b234-9226-419a-8f52-bef89e9ec5ca	locale	openid-connect	oidc-usermodel-attribute-mapper	67f0818c-fd4a-4618-afd5-245e74dac6f0	\N
\.


--
-- TOC entry 4096 (class 0 OID 16801)
-- Dependencies: 243
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
d63766be-9df0-43f5-98d2-ec3f77549218	true	introspection.token.claim
d63766be-9df0-43f5-98d2-ec3f77549218	true	userinfo.token.claim
d63766be-9df0-43f5-98d2-ec3f77549218	locale	user.attribute
d63766be-9df0-43f5-98d2-ec3f77549218	true	id.token.claim
d63766be-9df0-43f5-98d2-ec3f77549218	true	access.token.claim
d63766be-9df0-43f5-98d2-ec3f77549218	locale	claim.name
d63766be-9df0-43f5-98d2-ec3f77549218	String	jsonType.label
19d83d7b-807b-4140-80f8-a855a3db4faa	false	single
19d83d7b-807b-4140-80f8-a855a3db4faa	Basic	attribute.nameformat
19d83d7b-807b-4140-80f8-a855a3db4faa	Role	attribute.name
06b94de3-8c13-4115-9922-a4707aeafb01	true	introspection.token.claim
06b94de3-8c13-4115-9922-a4707aeafb01	true	userinfo.token.claim
06b94de3-8c13-4115-9922-a4707aeafb01	true	id.token.claim
06b94de3-8c13-4115-9922-a4707aeafb01	true	access.token.claim
0bef6602-0e01-4bc2-b9e6-6011559b0723	true	introspection.token.claim
0bef6602-0e01-4bc2-b9e6-6011559b0723	true	userinfo.token.claim
0bef6602-0e01-4bc2-b9e6-6011559b0723	birthdate	user.attribute
0bef6602-0e01-4bc2-b9e6-6011559b0723	true	id.token.claim
0bef6602-0e01-4bc2-b9e6-6011559b0723	true	access.token.claim
0bef6602-0e01-4bc2-b9e6-6011559b0723	birthdate	claim.name
0bef6602-0e01-4bc2-b9e6-6011559b0723	String	jsonType.label
1160cce7-10c1-48de-9839-65ce05d6d731	true	introspection.token.claim
1160cce7-10c1-48de-9839-65ce05d6d731	true	userinfo.token.claim
1160cce7-10c1-48de-9839-65ce05d6d731	picture	user.attribute
1160cce7-10c1-48de-9839-65ce05d6d731	true	id.token.claim
1160cce7-10c1-48de-9839-65ce05d6d731	true	access.token.claim
1160cce7-10c1-48de-9839-65ce05d6d731	picture	claim.name
1160cce7-10c1-48de-9839-65ce05d6d731	String	jsonType.label
2c97bc7b-3e60-4f71-94d5-b36f756ec0f9	true	introspection.token.claim
2c97bc7b-3e60-4f71-94d5-b36f756ec0f9	true	userinfo.token.claim
2c97bc7b-3e60-4f71-94d5-b36f756ec0f9	nickname	user.attribute
2c97bc7b-3e60-4f71-94d5-b36f756ec0f9	true	id.token.claim
2c97bc7b-3e60-4f71-94d5-b36f756ec0f9	true	access.token.claim
2c97bc7b-3e60-4f71-94d5-b36f756ec0f9	nickname	claim.name
2c97bc7b-3e60-4f71-94d5-b36f756ec0f9	String	jsonType.label
2f20e4c4-30e7-4f11-90b2-750f81e833fd	true	introspection.token.claim
2f20e4c4-30e7-4f11-90b2-750f81e833fd	true	userinfo.token.claim
2f20e4c4-30e7-4f11-90b2-750f81e833fd	username	user.attribute
2f20e4c4-30e7-4f11-90b2-750f81e833fd	true	id.token.claim
2f20e4c4-30e7-4f11-90b2-750f81e833fd	true	access.token.claim
2f20e4c4-30e7-4f11-90b2-750f81e833fd	preferred_username	claim.name
2f20e4c4-30e7-4f11-90b2-750f81e833fd	String	jsonType.label
766c6fdb-3bdd-4f7a-953d-4cb8944692eb	true	introspection.token.claim
766c6fdb-3bdd-4f7a-953d-4cb8944692eb	true	userinfo.token.claim
766c6fdb-3bdd-4f7a-953d-4cb8944692eb	middleName	user.attribute
766c6fdb-3bdd-4f7a-953d-4cb8944692eb	true	id.token.claim
766c6fdb-3bdd-4f7a-953d-4cb8944692eb	true	access.token.claim
766c6fdb-3bdd-4f7a-953d-4cb8944692eb	middle_name	claim.name
766c6fdb-3bdd-4f7a-953d-4cb8944692eb	String	jsonType.label
7aa83d38-b18f-4d91-8b2a-b1fce5323978	true	introspection.token.claim
7aa83d38-b18f-4d91-8b2a-b1fce5323978	true	userinfo.token.claim
7aa83d38-b18f-4d91-8b2a-b1fce5323978	updatedAt	user.attribute
7aa83d38-b18f-4d91-8b2a-b1fce5323978	true	id.token.claim
7aa83d38-b18f-4d91-8b2a-b1fce5323978	true	access.token.claim
7aa83d38-b18f-4d91-8b2a-b1fce5323978	updated_at	claim.name
7aa83d38-b18f-4d91-8b2a-b1fce5323978	long	jsonType.label
7e355be6-b8a6-4d94-9556-2c282e9e0aca	true	introspection.token.claim
7e355be6-b8a6-4d94-9556-2c282e9e0aca	true	userinfo.token.claim
7e355be6-b8a6-4d94-9556-2c282e9e0aca	zoneinfo	user.attribute
7e355be6-b8a6-4d94-9556-2c282e9e0aca	true	id.token.claim
7e355be6-b8a6-4d94-9556-2c282e9e0aca	true	access.token.claim
7e355be6-b8a6-4d94-9556-2c282e9e0aca	zoneinfo	claim.name
7e355be6-b8a6-4d94-9556-2c282e9e0aca	String	jsonType.label
7f50afb2-c319-498b-bd51-4cf96dd87f7d	true	introspection.token.claim
7f50afb2-c319-498b-bd51-4cf96dd87f7d	true	userinfo.token.claim
7f50afb2-c319-498b-bd51-4cf96dd87f7d	profile	user.attribute
7f50afb2-c319-498b-bd51-4cf96dd87f7d	true	id.token.claim
7f50afb2-c319-498b-bd51-4cf96dd87f7d	true	access.token.claim
7f50afb2-c319-498b-bd51-4cf96dd87f7d	profile	claim.name
7f50afb2-c319-498b-bd51-4cf96dd87f7d	String	jsonType.label
b2fc383e-bd27-4b5e-9f6a-c68f4b6e9259	true	introspection.token.claim
b2fc383e-bd27-4b5e-9f6a-c68f4b6e9259	true	userinfo.token.claim
b2fc383e-bd27-4b5e-9f6a-c68f4b6e9259	firstName	user.attribute
b2fc383e-bd27-4b5e-9f6a-c68f4b6e9259	true	id.token.claim
b2fc383e-bd27-4b5e-9f6a-c68f4b6e9259	true	access.token.claim
b2fc383e-bd27-4b5e-9f6a-c68f4b6e9259	given_name	claim.name
b2fc383e-bd27-4b5e-9f6a-c68f4b6e9259	String	jsonType.label
b3f3e54b-1fc2-4dba-a7f1-688cbb2849ae	true	introspection.token.claim
b3f3e54b-1fc2-4dba-a7f1-688cbb2849ae	true	userinfo.token.claim
b3f3e54b-1fc2-4dba-a7f1-688cbb2849ae	lastName	user.attribute
b3f3e54b-1fc2-4dba-a7f1-688cbb2849ae	true	id.token.claim
b3f3e54b-1fc2-4dba-a7f1-688cbb2849ae	true	access.token.claim
b3f3e54b-1fc2-4dba-a7f1-688cbb2849ae	family_name	claim.name
b3f3e54b-1fc2-4dba-a7f1-688cbb2849ae	String	jsonType.label
b70a0ba2-f6a6-4a0e-8ca0-6b2a111e44a8	true	introspection.token.claim
b70a0ba2-f6a6-4a0e-8ca0-6b2a111e44a8	true	userinfo.token.claim
b70a0ba2-f6a6-4a0e-8ca0-6b2a111e44a8	website	user.attribute
b70a0ba2-f6a6-4a0e-8ca0-6b2a111e44a8	true	id.token.claim
b70a0ba2-f6a6-4a0e-8ca0-6b2a111e44a8	true	access.token.claim
b70a0ba2-f6a6-4a0e-8ca0-6b2a111e44a8	website	claim.name
b70a0ba2-f6a6-4a0e-8ca0-6b2a111e44a8	String	jsonType.label
f3c69468-d29c-44cd-ba70-e148ebc56f19	true	introspection.token.claim
f3c69468-d29c-44cd-ba70-e148ebc56f19	true	userinfo.token.claim
f3c69468-d29c-44cd-ba70-e148ebc56f19	gender	user.attribute
f3c69468-d29c-44cd-ba70-e148ebc56f19	true	id.token.claim
f3c69468-d29c-44cd-ba70-e148ebc56f19	true	access.token.claim
f3c69468-d29c-44cd-ba70-e148ebc56f19	gender	claim.name
f3c69468-d29c-44cd-ba70-e148ebc56f19	String	jsonType.label
ff9c8c46-4ffc-4326-aff3-e3feb6c645fc	true	introspection.token.claim
ff9c8c46-4ffc-4326-aff3-e3feb6c645fc	true	userinfo.token.claim
ff9c8c46-4ffc-4326-aff3-e3feb6c645fc	locale	user.attribute
ff9c8c46-4ffc-4326-aff3-e3feb6c645fc	true	id.token.claim
ff9c8c46-4ffc-4326-aff3-e3feb6c645fc	true	access.token.claim
ff9c8c46-4ffc-4326-aff3-e3feb6c645fc	locale	claim.name
ff9c8c46-4ffc-4326-aff3-e3feb6c645fc	String	jsonType.label
6975c1ed-b0bc-40c0-b4ef-a13997a74a0c	true	introspection.token.claim
6975c1ed-b0bc-40c0-b4ef-a13997a74a0c	true	userinfo.token.claim
6975c1ed-b0bc-40c0-b4ef-a13997a74a0c	emailVerified	user.attribute
6975c1ed-b0bc-40c0-b4ef-a13997a74a0c	true	id.token.claim
6975c1ed-b0bc-40c0-b4ef-a13997a74a0c	true	access.token.claim
6975c1ed-b0bc-40c0-b4ef-a13997a74a0c	email_verified	claim.name
6975c1ed-b0bc-40c0-b4ef-a13997a74a0c	boolean	jsonType.label
fda0dcbe-d948-43c7-87ec-1a4b1f35e31b	true	introspection.token.claim
fda0dcbe-d948-43c7-87ec-1a4b1f35e31b	true	userinfo.token.claim
fda0dcbe-d948-43c7-87ec-1a4b1f35e31b	email	user.attribute
fda0dcbe-d948-43c7-87ec-1a4b1f35e31b	true	id.token.claim
fda0dcbe-d948-43c7-87ec-1a4b1f35e31b	true	access.token.claim
fda0dcbe-d948-43c7-87ec-1a4b1f35e31b	email	claim.name
fda0dcbe-d948-43c7-87ec-1a4b1f35e31b	String	jsonType.label
46e93d86-b3ce-4b85-97f7-44fb9577ce96	formatted	user.attribute.formatted
46e93d86-b3ce-4b85-97f7-44fb9577ce96	country	user.attribute.country
46e93d86-b3ce-4b85-97f7-44fb9577ce96	true	introspection.token.claim
46e93d86-b3ce-4b85-97f7-44fb9577ce96	postal_code	user.attribute.postal_code
46e93d86-b3ce-4b85-97f7-44fb9577ce96	true	userinfo.token.claim
46e93d86-b3ce-4b85-97f7-44fb9577ce96	street	user.attribute.street
46e93d86-b3ce-4b85-97f7-44fb9577ce96	true	id.token.claim
46e93d86-b3ce-4b85-97f7-44fb9577ce96	region	user.attribute.region
46e93d86-b3ce-4b85-97f7-44fb9577ce96	true	access.token.claim
46e93d86-b3ce-4b85-97f7-44fb9577ce96	locality	user.attribute.locality
985cc2a0-56f3-4596-b14d-8b041b8adad8	true	introspection.token.claim
985cc2a0-56f3-4596-b14d-8b041b8adad8	true	userinfo.token.claim
985cc2a0-56f3-4596-b14d-8b041b8adad8	phoneNumberVerified	user.attribute
985cc2a0-56f3-4596-b14d-8b041b8adad8	true	id.token.claim
985cc2a0-56f3-4596-b14d-8b041b8adad8	true	access.token.claim
985cc2a0-56f3-4596-b14d-8b041b8adad8	phone_number_verified	claim.name
985cc2a0-56f3-4596-b14d-8b041b8adad8	boolean	jsonType.label
c7a5a551-089a-4b40-80d9-e8a8d3f524a3	true	introspection.token.claim
c7a5a551-089a-4b40-80d9-e8a8d3f524a3	true	userinfo.token.claim
c7a5a551-089a-4b40-80d9-e8a8d3f524a3	phoneNumber	user.attribute
c7a5a551-089a-4b40-80d9-e8a8d3f524a3	true	id.token.claim
c7a5a551-089a-4b40-80d9-e8a8d3f524a3	true	access.token.claim
c7a5a551-089a-4b40-80d9-e8a8d3f524a3	phone_number	claim.name
c7a5a551-089a-4b40-80d9-e8a8d3f524a3	String	jsonType.label
0767ef77-0eeb-4540-9a4d-ee68113a34dc	true	introspection.token.claim
0767ef77-0eeb-4540-9a4d-ee68113a34dc	true	access.token.claim
2ee6ea29-4bb3-434d-8df3-370746eceda7	true	introspection.token.claim
2ee6ea29-4bb3-434d-8df3-370746eceda7	true	multivalued
2ee6ea29-4bb3-434d-8df3-370746eceda7	foo	user.attribute
2ee6ea29-4bb3-434d-8df3-370746eceda7	true	access.token.claim
2ee6ea29-4bb3-434d-8df3-370746eceda7	realm_access.roles	claim.name
2ee6ea29-4bb3-434d-8df3-370746eceda7	String	jsonType.label
f01d643b-1442-4896-845e-876733b8d0b4	true	introspection.token.claim
f01d643b-1442-4896-845e-876733b8d0b4	true	multivalued
f01d643b-1442-4896-845e-876733b8d0b4	foo	user.attribute
f01d643b-1442-4896-845e-876733b8d0b4	true	access.token.claim
f01d643b-1442-4896-845e-876733b8d0b4	resource_access.${client_id}.roles	claim.name
f01d643b-1442-4896-845e-876733b8d0b4	String	jsonType.label
0c5bcd82-21df-4cdf-9de1-3d8edf85d2fd	true	introspection.token.claim
0c5bcd82-21df-4cdf-9de1-3d8edf85d2fd	true	access.token.claim
16cc5b54-cda8-451f-b21f-ba250ef97183	true	introspection.token.claim
16cc5b54-cda8-451f-b21f-ba250ef97183	true	userinfo.token.claim
16cc5b54-cda8-451f-b21f-ba250ef97183	username	user.attribute
16cc5b54-cda8-451f-b21f-ba250ef97183	true	id.token.claim
16cc5b54-cda8-451f-b21f-ba250ef97183	true	access.token.claim
16cc5b54-cda8-451f-b21f-ba250ef97183	upn	claim.name
16cc5b54-cda8-451f-b21f-ba250ef97183	String	jsonType.label
67fc09e8-59b7-41e0-8ec6-a2a79614cde7	true	introspection.token.claim
67fc09e8-59b7-41e0-8ec6-a2a79614cde7	true	multivalued
67fc09e8-59b7-41e0-8ec6-a2a79614cde7	foo	user.attribute
67fc09e8-59b7-41e0-8ec6-a2a79614cde7	true	id.token.claim
67fc09e8-59b7-41e0-8ec6-a2a79614cde7	true	access.token.claim
67fc09e8-59b7-41e0-8ec6-a2a79614cde7	groups	claim.name
67fc09e8-59b7-41e0-8ec6-a2a79614cde7	String	jsonType.label
8f160256-eacd-4a76-ba40-ef20e3249ad6	true	introspection.token.claim
8f160256-eacd-4a76-ba40-ef20e3249ad6	true	id.token.claim
8f160256-eacd-4a76-ba40-ef20e3249ad6	true	access.token.claim
d65dce39-6681-4556-a96f-07762cda3d04	false	single
d65dce39-6681-4556-a96f-07762cda3d04	Basic	attribute.nameformat
d65dce39-6681-4556-a96f-07762cda3d04	Role	attribute.name
12775955-ca28-4b32-9ddf-e9434c4f7dd2	true	introspection.token.claim
12775955-ca28-4b32-9ddf-e9434c4f7dd2	true	userinfo.token.claim
12775955-ca28-4b32-9ddf-e9434c4f7dd2	middleName	user.attribute
12775955-ca28-4b32-9ddf-e9434c4f7dd2	true	id.token.claim
12775955-ca28-4b32-9ddf-e9434c4f7dd2	true	access.token.claim
12775955-ca28-4b32-9ddf-e9434c4f7dd2	middle_name	claim.name
12775955-ca28-4b32-9ddf-e9434c4f7dd2	String	jsonType.label
22ade097-8c78-4b8a-98fa-918158308521	true	introspection.token.claim
22ade097-8c78-4b8a-98fa-918158308521	true	userinfo.token.claim
22ade097-8c78-4b8a-98fa-918158308521	zoneinfo	user.attribute
22ade097-8c78-4b8a-98fa-918158308521	true	id.token.claim
22ade097-8c78-4b8a-98fa-918158308521	true	access.token.claim
22ade097-8c78-4b8a-98fa-918158308521	zoneinfo	claim.name
22ade097-8c78-4b8a-98fa-918158308521	String	jsonType.label
435b3e3d-fbc4-4203-90e8-3966348ae060	true	introspection.token.claim
435b3e3d-fbc4-4203-90e8-3966348ae060	true	userinfo.token.claim
435b3e3d-fbc4-4203-90e8-3966348ae060	true	id.token.claim
435b3e3d-fbc4-4203-90e8-3966348ae060	true	access.token.claim
47122043-a228-4b13-bdfc-8c5441aef64b	true	introspection.token.claim
47122043-a228-4b13-bdfc-8c5441aef64b	true	userinfo.token.claim
47122043-a228-4b13-bdfc-8c5441aef64b	username	user.attribute
47122043-a228-4b13-bdfc-8c5441aef64b	true	id.token.claim
47122043-a228-4b13-bdfc-8c5441aef64b	true	access.token.claim
47122043-a228-4b13-bdfc-8c5441aef64b	preferred_username	claim.name
47122043-a228-4b13-bdfc-8c5441aef64b	String	jsonType.label
63112b5d-49da-4fde-a2dd-783db66c71b1	true	introspection.token.claim
63112b5d-49da-4fde-a2dd-783db66c71b1	true	userinfo.token.claim
63112b5d-49da-4fde-a2dd-783db66c71b1	picture	user.attribute
63112b5d-49da-4fde-a2dd-783db66c71b1	true	id.token.claim
63112b5d-49da-4fde-a2dd-783db66c71b1	true	access.token.claim
63112b5d-49da-4fde-a2dd-783db66c71b1	picture	claim.name
63112b5d-49da-4fde-a2dd-783db66c71b1	String	jsonType.label
6e101b39-0ac9-4d53-a77a-79cc700fc51e	true	introspection.token.claim
6e101b39-0ac9-4d53-a77a-79cc700fc51e	true	userinfo.token.claim
6e101b39-0ac9-4d53-a77a-79cc700fc51e	updatedAt	user.attribute
6e101b39-0ac9-4d53-a77a-79cc700fc51e	true	id.token.claim
6e101b39-0ac9-4d53-a77a-79cc700fc51e	true	access.token.claim
6e101b39-0ac9-4d53-a77a-79cc700fc51e	updated_at	claim.name
6e101b39-0ac9-4d53-a77a-79cc700fc51e	long	jsonType.label
6ff1d6db-ea36-4f54-bfc3-88645763f9e5	true	introspection.token.claim
6ff1d6db-ea36-4f54-bfc3-88645763f9e5	true	userinfo.token.claim
6ff1d6db-ea36-4f54-bfc3-88645763f9e5	firstName	user.attribute
6ff1d6db-ea36-4f54-bfc3-88645763f9e5	true	id.token.claim
6ff1d6db-ea36-4f54-bfc3-88645763f9e5	true	access.token.claim
6ff1d6db-ea36-4f54-bfc3-88645763f9e5	given_name	claim.name
6ff1d6db-ea36-4f54-bfc3-88645763f9e5	String	jsonType.label
7b0d25f9-e465-46c0-9d07-9eed9585add0	true	introspection.token.claim
7b0d25f9-e465-46c0-9d07-9eed9585add0	true	userinfo.token.claim
7b0d25f9-e465-46c0-9d07-9eed9585add0	lastName	user.attribute
7b0d25f9-e465-46c0-9d07-9eed9585add0	true	id.token.claim
7b0d25f9-e465-46c0-9d07-9eed9585add0	true	access.token.claim
7b0d25f9-e465-46c0-9d07-9eed9585add0	family_name	claim.name
7b0d25f9-e465-46c0-9d07-9eed9585add0	String	jsonType.label
888db1b1-0854-4dcb-954c-bed0ee96feb2	true	introspection.token.claim
888db1b1-0854-4dcb-954c-bed0ee96feb2	true	userinfo.token.claim
888db1b1-0854-4dcb-954c-bed0ee96feb2	profile	user.attribute
888db1b1-0854-4dcb-954c-bed0ee96feb2	true	id.token.claim
888db1b1-0854-4dcb-954c-bed0ee96feb2	true	access.token.claim
888db1b1-0854-4dcb-954c-bed0ee96feb2	profile	claim.name
888db1b1-0854-4dcb-954c-bed0ee96feb2	String	jsonType.label
d45e645d-6547-42ab-b85f-e2ede8835c0a	true	introspection.token.claim
d45e645d-6547-42ab-b85f-e2ede8835c0a	true	userinfo.token.claim
d45e645d-6547-42ab-b85f-e2ede8835c0a	gender	user.attribute
d45e645d-6547-42ab-b85f-e2ede8835c0a	true	id.token.claim
d45e645d-6547-42ab-b85f-e2ede8835c0a	true	access.token.claim
d45e645d-6547-42ab-b85f-e2ede8835c0a	gender	claim.name
d45e645d-6547-42ab-b85f-e2ede8835c0a	String	jsonType.label
da2b015d-70b8-45ec-b380-eaf9efc95ce3	true	introspection.token.claim
da2b015d-70b8-45ec-b380-eaf9efc95ce3	true	userinfo.token.claim
da2b015d-70b8-45ec-b380-eaf9efc95ce3	nickname	user.attribute
da2b015d-70b8-45ec-b380-eaf9efc95ce3	true	id.token.claim
da2b015d-70b8-45ec-b380-eaf9efc95ce3	true	access.token.claim
da2b015d-70b8-45ec-b380-eaf9efc95ce3	nickname	claim.name
da2b015d-70b8-45ec-b380-eaf9efc95ce3	String	jsonType.label
e36af0e5-e586-465d-9e29-360b01bf3f02	true	introspection.token.claim
e36af0e5-e586-465d-9e29-360b01bf3f02	true	userinfo.token.claim
e36af0e5-e586-465d-9e29-360b01bf3f02	website	user.attribute
e36af0e5-e586-465d-9e29-360b01bf3f02	true	id.token.claim
e36af0e5-e586-465d-9e29-360b01bf3f02	true	access.token.claim
e36af0e5-e586-465d-9e29-360b01bf3f02	website	claim.name
e36af0e5-e586-465d-9e29-360b01bf3f02	String	jsonType.label
e4d0016b-8453-41f6-b78f-0361a1766faa	true	introspection.token.claim
e4d0016b-8453-41f6-b78f-0361a1766faa	true	userinfo.token.claim
e4d0016b-8453-41f6-b78f-0361a1766faa	locale	user.attribute
e4d0016b-8453-41f6-b78f-0361a1766faa	true	id.token.claim
e4d0016b-8453-41f6-b78f-0361a1766faa	true	access.token.claim
e4d0016b-8453-41f6-b78f-0361a1766faa	locale	claim.name
e4d0016b-8453-41f6-b78f-0361a1766faa	String	jsonType.label
f7f84f36-8641-4344-82a7-da0376fc9e25	true	introspection.token.claim
f7f84f36-8641-4344-82a7-da0376fc9e25	true	userinfo.token.claim
f7f84f36-8641-4344-82a7-da0376fc9e25	birthdate	user.attribute
f7f84f36-8641-4344-82a7-da0376fc9e25	true	id.token.claim
f7f84f36-8641-4344-82a7-da0376fc9e25	true	access.token.claim
f7f84f36-8641-4344-82a7-da0376fc9e25	birthdate	claim.name
f7f84f36-8641-4344-82a7-da0376fc9e25	String	jsonType.label
528ab686-39ea-4cab-afda-4255be4881e2	true	introspection.token.claim
528ab686-39ea-4cab-afda-4255be4881e2	true	userinfo.token.claim
528ab686-39ea-4cab-afda-4255be4881e2	email	user.attribute
528ab686-39ea-4cab-afda-4255be4881e2	true	id.token.claim
528ab686-39ea-4cab-afda-4255be4881e2	true	access.token.claim
528ab686-39ea-4cab-afda-4255be4881e2	email	claim.name
528ab686-39ea-4cab-afda-4255be4881e2	String	jsonType.label
b83f08d3-e7c3-445e-b8ec-0abea54bc8af	true	introspection.token.claim
b83f08d3-e7c3-445e-b8ec-0abea54bc8af	true	userinfo.token.claim
b83f08d3-e7c3-445e-b8ec-0abea54bc8af	emailVerified	user.attribute
b83f08d3-e7c3-445e-b8ec-0abea54bc8af	true	id.token.claim
b83f08d3-e7c3-445e-b8ec-0abea54bc8af	true	access.token.claim
b83f08d3-e7c3-445e-b8ec-0abea54bc8af	email_verified	claim.name
b83f08d3-e7c3-445e-b8ec-0abea54bc8af	boolean	jsonType.label
43af3e7c-84aa-4d43-9176-22402fadd736	formatted	user.attribute.formatted
43af3e7c-84aa-4d43-9176-22402fadd736	country	user.attribute.country
43af3e7c-84aa-4d43-9176-22402fadd736	true	introspection.token.claim
43af3e7c-84aa-4d43-9176-22402fadd736	postal_code	user.attribute.postal_code
43af3e7c-84aa-4d43-9176-22402fadd736	true	userinfo.token.claim
43af3e7c-84aa-4d43-9176-22402fadd736	street	user.attribute.street
43af3e7c-84aa-4d43-9176-22402fadd736	true	id.token.claim
43af3e7c-84aa-4d43-9176-22402fadd736	region	user.attribute.region
43af3e7c-84aa-4d43-9176-22402fadd736	true	access.token.claim
43af3e7c-84aa-4d43-9176-22402fadd736	locality	user.attribute.locality
9ccb1882-0484-4407-ab88-c4a9ddcc02b7	true	introspection.token.claim
9ccb1882-0484-4407-ab88-c4a9ddcc02b7	true	userinfo.token.claim
9ccb1882-0484-4407-ab88-c4a9ddcc02b7	phoneNumber	user.attribute
9ccb1882-0484-4407-ab88-c4a9ddcc02b7	true	id.token.claim
9ccb1882-0484-4407-ab88-c4a9ddcc02b7	true	access.token.claim
9ccb1882-0484-4407-ab88-c4a9ddcc02b7	phone_number	claim.name
9ccb1882-0484-4407-ab88-c4a9ddcc02b7	String	jsonType.label
f5fd219a-c431-4816-ac97-5eee4b2aacab	true	introspection.token.claim
f5fd219a-c431-4816-ac97-5eee4b2aacab	true	userinfo.token.claim
f5fd219a-c431-4816-ac97-5eee4b2aacab	phoneNumberVerified	user.attribute
f5fd219a-c431-4816-ac97-5eee4b2aacab	true	id.token.claim
f5fd219a-c431-4816-ac97-5eee4b2aacab	true	access.token.claim
f5fd219a-c431-4816-ac97-5eee4b2aacab	phone_number_verified	claim.name
f5fd219a-c431-4816-ac97-5eee4b2aacab	boolean	jsonType.label
35fd9c0d-8f14-4621-836b-66c6175c2956	true	introspection.token.claim
35fd9c0d-8f14-4621-836b-66c6175c2956	true	access.token.claim
4da58fcb-b387-47c6-9bfe-366d177a9d34	true	introspection.token.claim
4da58fcb-b387-47c6-9bfe-366d177a9d34	true	multivalued
4da58fcb-b387-47c6-9bfe-366d177a9d34	foo	user.attribute
4da58fcb-b387-47c6-9bfe-366d177a9d34	true	access.token.claim
4da58fcb-b387-47c6-9bfe-366d177a9d34	resource_access.${client_id}.roles	claim.name
4da58fcb-b387-47c6-9bfe-366d177a9d34	String	jsonType.label
eb511c08-7422-4d5e-a702-96fafd01c877	true	introspection.token.claim
eb511c08-7422-4d5e-a702-96fafd01c877	true	multivalued
eb511c08-7422-4d5e-a702-96fafd01c877	foo	user.attribute
eb511c08-7422-4d5e-a702-96fafd01c877	true	access.token.claim
eb511c08-7422-4d5e-a702-96fafd01c877	realm_access.roles	claim.name
eb511c08-7422-4d5e-a702-96fafd01c877	String	jsonType.label
79b8c296-5dfc-4f8f-9647-eae4bc964b73	true	introspection.token.claim
79b8c296-5dfc-4f8f-9647-eae4bc964b73	true	access.token.claim
c3f9bdda-d609-4e90-9d63-a2a5c2b32af8	true	introspection.token.claim
c3f9bdda-d609-4e90-9d63-a2a5c2b32af8	true	multivalued
c3f9bdda-d609-4e90-9d63-a2a5c2b32af8	foo	user.attribute
c3f9bdda-d609-4e90-9d63-a2a5c2b32af8	true	id.token.claim
c3f9bdda-d609-4e90-9d63-a2a5c2b32af8	true	access.token.claim
c3f9bdda-d609-4e90-9d63-a2a5c2b32af8	groups	claim.name
c3f9bdda-d609-4e90-9d63-a2a5c2b32af8	String	jsonType.label
e2e1290a-9635-4e87-ba54-fdb212478d6b	true	introspection.token.claim
e2e1290a-9635-4e87-ba54-fdb212478d6b	true	userinfo.token.claim
e2e1290a-9635-4e87-ba54-fdb212478d6b	username	user.attribute
e2e1290a-9635-4e87-ba54-fdb212478d6b	true	id.token.claim
e2e1290a-9635-4e87-ba54-fdb212478d6b	true	access.token.claim
e2e1290a-9635-4e87-ba54-fdb212478d6b	upn	claim.name
e2e1290a-9635-4e87-ba54-fdb212478d6b	String	jsonType.label
b00f0d24-a6d3-4f81-9de2-76f295d1febb	true	introspection.token.claim
b00f0d24-a6d3-4f81-9de2-76f295d1febb	true	id.token.claim
b00f0d24-a6d3-4f81-9de2-76f295d1febb	true	access.token.claim
f991b234-9226-419a-8f52-bef89e9ec5ca	true	introspection.token.claim
f991b234-9226-419a-8f52-bef89e9ec5ca	true	userinfo.token.claim
f991b234-9226-419a-8f52-bef89e9ec5ca	locale	user.attribute
f991b234-9226-419a-8f52-bef89e9ec5ca	true	id.token.claim
f991b234-9226-419a-8f52-bef89e9ec5ca	true	access.token.claim
f991b234-9226-419a-8f52-bef89e9ec5ca	locale	claim.name
f991b234-9226-419a-8f52-bef89e9ec5ca	String	jsonType.label
eb511c08-7422-4d5e-a702-96fafd01c877	true	userinfo.token.claim
eb511c08-7422-4d5e-a702-96fafd01c877	true	id.token.claim
\.


--
-- TOC entry 4076 (class 0 OID 16443)
-- Dependencies: 223
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	0e97b996-d27d-4396-b6ec-a9b9e8162f4c	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	3641d9e7-db30-4930-9374-49635c94556c	89a1b7e9-af75-4c58-af2d-1bfe1ac1c469	c96d7bc9-1d51-43ab-a883-1c6004d223dc	64a1bc8b-a945-4e5f-b693-fcca98165618	3a0f354e-1302-45aa-8e95-8dc3e671dc18	2592000	f	900	t	f	48f87936-3ef3-4fdd-a421-f213c604aa52	0	f	0	0	a77105e9-ee98-4159-a917-ff6e9ae68b85
959ad7c1-9708-4b39-8f74-c6064f245370	60	300	300	\N	\N	\N	t	f	0	\N	my-realm	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	73fdaac1-77f4-4941-9e35-bf58d59d0e23	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	db2420cd-7d9c-4092-ba00-37e459443ea0	0a804270-bd88-4f39-b4ec-638cab694245	6f5b794e-0551-45ee-b5d7-0933fc2daf22	b14f4ae2-d9ce-4b68-a068-fb1c66e07a49	9838051b-c521-44e5-8202-c091638db510	2592000	f	900	t	f	9a23c240-81e3-409c-8de9-ecee62e8aec4	0	f	0	0	432ea4f8-cdec-4dde-998b-abc1de75e242
\.


--
-- TOC entry 4077 (class 0 OID 16460)
-- Dependencies: 224
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	
_browser_header.xContentTypeOptions	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	nosniff
_browser_header.referrerPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	no-referrer
_browser_header.xRobotsTag	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	none
_browser_header.xFrameOptions	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	SAMEORIGIN
_browser_header.contentSecurityPolicy	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	1; mode=block
_browser_header.strictTransportSecurity	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	max-age=31536000; includeSubDomains
bruteForceProtected	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	false
permanentLockout	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	false
maxFailureWaitSeconds	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	900
minimumQuickLoginWaitSeconds	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	60
waitIncrementSeconds	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	60
quickLoginCheckMilliSeconds	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	1000
maxDeltaTimeSeconds	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	43200
failureFactor	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	30
realmReusableOtpCode	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	false
displayName	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	Keycloak
displayNameHtml	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	RS256
offlineSessionMaxLifespanEnabled	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	false
offlineSessionMaxLifespan	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	5184000
_browser_header.contentSecurityPolicyReportOnly	959ad7c1-9708-4b39-8f74-c6064f245370	
_browser_header.xContentTypeOptions	959ad7c1-9708-4b39-8f74-c6064f245370	nosniff
_browser_header.referrerPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	no-referrer
_browser_header.xRobotsTag	959ad7c1-9708-4b39-8f74-c6064f245370	none
_browser_header.xFrameOptions	959ad7c1-9708-4b39-8f74-c6064f245370	SAMEORIGIN
_browser_header.contentSecurityPolicy	959ad7c1-9708-4b39-8f74-c6064f245370	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	959ad7c1-9708-4b39-8f74-c6064f245370	1; mode=block
_browser_header.strictTransportSecurity	959ad7c1-9708-4b39-8f74-c6064f245370	max-age=31536000; includeSubDomains
bruteForceProtected	959ad7c1-9708-4b39-8f74-c6064f245370	false
permanentLockout	959ad7c1-9708-4b39-8f74-c6064f245370	false
maxFailureWaitSeconds	959ad7c1-9708-4b39-8f74-c6064f245370	900
minimumQuickLoginWaitSeconds	959ad7c1-9708-4b39-8f74-c6064f245370	60
waitIncrementSeconds	959ad7c1-9708-4b39-8f74-c6064f245370	60
quickLoginCheckMilliSeconds	959ad7c1-9708-4b39-8f74-c6064f245370	1000
maxDeltaTimeSeconds	959ad7c1-9708-4b39-8f74-c6064f245370	43200
failureFactor	959ad7c1-9708-4b39-8f74-c6064f245370	30
realmReusableOtpCode	959ad7c1-9708-4b39-8f74-c6064f245370	false
defaultSignatureAlgorithm	959ad7c1-9708-4b39-8f74-c6064f245370	RS256
offlineSessionMaxLifespanEnabled	959ad7c1-9708-4b39-8f74-c6064f245370	false
offlineSessionMaxLifespan	959ad7c1-9708-4b39-8f74-c6064f245370	5184000
actionTokenGeneratedByAdminLifespan	959ad7c1-9708-4b39-8f74-c6064f245370	43200
actionTokenGeneratedByUserLifespan	959ad7c1-9708-4b39-8f74-c6064f245370	300
oauth2DeviceCodeLifespan	959ad7c1-9708-4b39-8f74-c6064f245370	600
oauth2DevicePollingInterval	959ad7c1-9708-4b39-8f74-c6064f245370	5
webAuthnPolicyRpEntityName	959ad7c1-9708-4b39-8f74-c6064f245370	keycloak
webAuthnPolicySignatureAlgorithms	959ad7c1-9708-4b39-8f74-c6064f245370	ES256
webAuthnPolicyRpId	959ad7c1-9708-4b39-8f74-c6064f245370	
webAuthnPolicyAttestationConveyancePreference	959ad7c1-9708-4b39-8f74-c6064f245370	not specified
webAuthnPolicyAuthenticatorAttachment	959ad7c1-9708-4b39-8f74-c6064f245370	not specified
webAuthnPolicyRequireResidentKey	959ad7c1-9708-4b39-8f74-c6064f245370	not specified
webAuthnPolicyUserVerificationRequirement	959ad7c1-9708-4b39-8f74-c6064f245370	not specified
webAuthnPolicyCreateTimeout	959ad7c1-9708-4b39-8f74-c6064f245370	0
webAuthnPolicyAvoidSameAuthenticatorRegister	959ad7c1-9708-4b39-8f74-c6064f245370	false
webAuthnPolicyRpEntityNamePasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	ES256
webAuthnPolicyRpIdPasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	
webAuthnPolicyAttestationConveyancePreferencePasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	not specified
webAuthnPolicyRequireResidentKeyPasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	not specified
webAuthnPolicyCreateTimeoutPasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	959ad7c1-9708-4b39-8f74-c6064f245370	false
cibaBackchannelTokenDeliveryMode	959ad7c1-9708-4b39-8f74-c6064f245370	poll
cibaExpiresIn	959ad7c1-9708-4b39-8f74-c6064f245370	120
cibaInterval	959ad7c1-9708-4b39-8f74-c6064f245370	5
cibaAuthRequestedUserHint	959ad7c1-9708-4b39-8f74-c6064f245370	login_hint
parRequestUriLifespan	959ad7c1-9708-4b39-8f74-c6064f245370	60
\.


--
-- TOC entry 4125 (class 0 OID 17217)
-- Dependencies: 272
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- TOC entry 4102 (class 0 OID 16913)
-- Dependencies: 249
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4078 (class 0 OID 16468)
-- Dependencies: 225
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
6dfa9a1f-db1c-4207-83d3-57fb5fee5244	jboss-logging
959ad7c1-9708-4b39-8f74-c6064f245370	jboss-logging
\.


--
-- TOC entry 4158 (class 0 OID 17920)
-- Dependencies: 305
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- TOC entry 4079 (class 0 OID 16471)
-- Dependencies: 226
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	6dfa9a1f-db1c-4207-83d3-57fb5fee5244
password	password	t	t	959ad7c1-9708-4b39-8f74-c6064f245370
\.


--
-- TOC entry 4080 (class 0 OID 16478)
-- Dependencies: 227
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- TOC entry 4100 (class 0 OID 16829)
-- Dependencies: 247
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4081 (class 0 OID 16488)
-- Dependencies: 228
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
e0fc6d47-760a-4d5c-89e3-c81c9c7210cd	/realms/master/account/*
66052ff1-7515-4245-94c2-0d346b310437	/realms/master/account/*
41a19e86-99ca-47c6-b7de-a3c37158a587	/admin/master/console/*
cec288ee-a963-41d2-9b50-89c7a550691a	/realms/my-realm/account/*
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	/realms/my-realm/account/*
67f0818c-fd4a-4618-afd5-245e74dac6f0	/admin/my-realm/console/*
d447806d-45c0-4c3d-a53e-6cae5729ef3d	/*
\.


--
-- TOC entry 4118 (class 0 OID 17152)
-- Dependencies: 265
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- TOC entry 4117 (class 0 OID 17145)
-- Dependencies: 264
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
1cb37c62-28a3-4c7b-a2ed-c231ecb3036e	VERIFY_EMAIL	Verify Email	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	t	f	VERIFY_EMAIL	50
15d05fd1-460a-4f11-a258-d215e4094eac	UPDATE_PROFILE	Update Profile	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	t	f	UPDATE_PROFILE	40
59d68887-8eb1-4616-bb03-19dcba054eac	CONFIGURE_TOTP	Configure OTP	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	t	f	CONFIGURE_TOTP	10
4a55829c-394d-43f8-823c-d320110a1b6b	UPDATE_PASSWORD	Update Password	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	t	f	UPDATE_PASSWORD	30
1c5ebbb7-9f7f-49fd-b9fa-04a7b0c4cade	TERMS_AND_CONDITIONS	Terms and Conditions	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f	f	TERMS_AND_CONDITIONS	20
bfa80d2a-4c59-45de-a490-1d50453fe86f	delete_account	Delete Account	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	f	f	delete_account	60
98ed9df8-7a0e-404d-a300-2d992e48da56	update_user_locale	Update User Locale	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	t	f	update_user_locale	1000
ebb2be3d-e0c9-41aa-818a-5480365a1bca	webauthn-register	Webauthn Register	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	t	f	webauthn-register	70
af164f2b-b350-4932-8855-79fa36d7a0f6	webauthn-register-passwordless	Webauthn Register Passwordless	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	t	f	webauthn-register-passwordless	80
0bd1ece9-6a3f-4d3b-953f-6f3d506f791a	VERIFY_EMAIL	Verify Email	959ad7c1-9708-4b39-8f74-c6064f245370	t	f	VERIFY_EMAIL	50
bde6d2de-1bb8-4bab-b3ce-4c661a30719d	UPDATE_PROFILE	Update Profile	959ad7c1-9708-4b39-8f74-c6064f245370	t	f	UPDATE_PROFILE	40
834c2848-5481-4fb3-a5bc-fe105075fb11	CONFIGURE_TOTP	Configure OTP	959ad7c1-9708-4b39-8f74-c6064f245370	t	f	CONFIGURE_TOTP	10
3fd92f52-ff1b-4961-bdea-755314129a17	UPDATE_PASSWORD	Update Password	959ad7c1-9708-4b39-8f74-c6064f245370	t	f	UPDATE_PASSWORD	30
0c551b43-efc0-40dc-8882-ee91ba4ac727	TERMS_AND_CONDITIONS	Terms and Conditions	959ad7c1-9708-4b39-8f74-c6064f245370	f	f	TERMS_AND_CONDITIONS	20
86aeb6b0-10aa-41b6-977e-35cc0f4b2c5e	delete_account	Delete Account	959ad7c1-9708-4b39-8f74-c6064f245370	f	f	delete_account	60
3ee28144-26c7-446d-9628-f9781dc5d5b5	update_user_locale	Update User Locale	959ad7c1-9708-4b39-8f74-c6064f245370	t	f	update_user_locale	1000
2251b5f1-fa20-456e-b21e-b9a0ef6a8057	webauthn-register	Webauthn Register	959ad7c1-9708-4b39-8f74-c6064f245370	t	f	webauthn-register	70
8dace038-68ed-43a6-90a5-28d83338bd79	webauthn-register-passwordless	Webauthn Register Passwordless	959ad7c1-9708-4b39-8f74-c6064f245370	t	f	webauthn-register-passwordless	80
\.


--
-- TOC entry 4155 (class 0 OID 17851)
-- Dependencies: 302
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- TOC entry 4135 (class 0 OID 17434)
-- Dependencies: 282
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4134 (class 0 OID 17419)
-- Dependencies: 281
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4129 (class 0 OID 17357)
-- Dependencies: 276
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- TOC entry 4154 (class 0 OID 17827)
-- Dependencies: 301
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4132 (class 0 OID 17393)
-- Dependencies: 279
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- TOC entry 4130 (class 0 OID 17365)
-- Dependencies: 277
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- TOC entry 4131 (class 0 OID 17379)
-- Dependencies: 278
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- TOC entry 4156 (class 0 OID 17869)
-- Dependencies: 303
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- TOC entry 4157 (class 0 OID 17879)
-- Dependencies: 304
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- TOC entry 4082 (class 0 OID 16491)
-- Dependencies: 229
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
66052ff1-7515-4245-94c2-0d346b310437	2c24bac6-61c1-451b-8223-a1d16ab8f6dc
66052ff1-7515-4245-94c2-0d346b310437	d7f73b0a-98fd-4e25-957a-ff9048236ecd
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	467a7cf7-50cb-46dc-b72f-a67a3391cd9f
d2c9b7ed-f3a3-48fd-bc55-014ce97e8298	acfc96de-bddf-476c-8402-56725a8d839a
\.


--
-- TOC entry 4136 (class 0 OID 17449)
-- Dependencies: 283
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4084 (class 0 OID 16497)
-- Dependencies: 231
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- TOC entry 4106 (class 0 OID 16934)
-- Dependencies: 253
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4152 (class 0 OID 17802)
-- Dependencies: 299
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4085 (class 0 OID 16502)
-- Dependencies: 232
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
f1740b31-1317-425e-95db-f2b8221a9d00	\N	ec799b57-05ad-43eb-a080-d532c0246976	f	t	\N	\N	\N	6dfa9a1f-db1c-4207-83d3-57fb5fee5244	admin	1714324425508	\N	0
706471c7-b204-4281-9f96-60182be00471	usuario@mail.com	usuario@mail.com	f	t	\N	usu	ario	959ad7c1-9708-4b39-8f74-c6064f245370	usuario	1714332977541	\N	0
\.


--
-- TOC entry 4086 (class 0 OID 16510)
-- Dependencies: 233
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4113 (class 0 OID 17046)
-- Dependencies: 260
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- TOC entry 4114 (class 0 OID 17051)
-- Dependencies: 261
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4087 (class 0 OID 16515)
-- Dependencies: 234
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4124 (class 0 OID 17214)
-- Dependencies: 271
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- TOC entry 4088 (class 0 OID 16520)
-- Dependencies: 235
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
706471c7-b204-4281-9f96-60182be00471	UPDATE_PASSWORD
\.


--
-- TOC entry 4089 (class 0 OID 16523)
-- Dependencies: 236
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
a77105e9-ee98-4159-a917-ff6e9ae68b85	f1740b31-1317-425e-95db-f2b8221a9d00
1c1b51ec-8c91-402d-ae74-7bccad40973c	f1740b31-1317-425e-95db-f2b8221a9d00
904b1f3a-d2c4-4d34-aa49-c56b1b1d53a3	f1740b31-1317-425e-95db-f2b8221a9d00
3fcebf3c-1ce4-4c2f-b978-69f6aa16779b	f1740b31-1317-425e-95db-f2b8221a9d00
d28f8c3d-d49d-40bd-8af8-08ffb6dba0e6	f1740b31-1317-425e-95db-f2b8221a9d00
56260072-48b0-43d3-abac-60c5562c6e28	f1740b31-1317-425e-95db-f2b8221a9d00
8bcaa76f-96b1-4ae8-b898-6fe9458c4d6c	f1740b31-1317-425e-95db-f2b8221a9d00
84c49801-50d3-4c7d-b54c-a1f4bf90232c	f1740b31-1317-425e-95db-f2b8221a9d00
fd8c6b17-6cab-4eca-a3ab-e327989d861e	f1740b31-1317-425e-95db-f2b8221a9d00
5393af83-31c4-43f9-bd71-cded0f83209a	f1740b31-1317-425e-95db-f2b8221a9d00
1a9160f3-66ee-48f7-8caf-59cf99929f6e	f1740b31-1317-425e-95db-f2b8221a9d00
91862542-443a-466d-b5dc-18374444aa17	f1740b31-1317-425e-95db-f2b8221a9d00
4a6b6499-074f-4b60-b6db-e916092d0850	f1740b31-1317-425e-95db-f2b8221a9d00
038b0d50-1787-4ab1-b009-630d415f5f40	f1740b31-1317-425e-95db-f2b8221a9d00
dfa9c708-68a5-4b45-a56d-708b317e1e0a	f1740b31-1317-425e-95db-f2b8221a9d00
2a3c910d-2958-4153-a8f9-ebdf0f5594f3	f1740b31-1317-425e-95db-f2b8221a9d00
d99c4d84-a2df-4858-a6d7-95e814c0de3d	f1740b31-1317-425e-95db-f2b8221a9d00
4319f979-7e4a-4f71-a291-d06ee0b060fe	f1740b31-1317-425e-95db-f2b8221a9d00
5e0b0448-74b9-46cc-b548-65af4b754651	f1740b31-1317-425e-95db-f2b8221a9d00
432ea4f8-cdec-4dde-998b-abc1de75e242	706471c7-b204-4281-9f96-60182be00471
\.


--
-- TOC entry 4090 (class 0 OID 16526)
-- Dependencies: 237
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- TOC entry 4101 (class 0 OID 16832)
-- Dependencies: 248
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- TOC entry 4083 (class 0 OID 16494)
-- Dependencies: 230
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- TOC entry 4091 (class 0 OID 16537)
-- Dependencies: 238
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
41a19e86-99ca-47c6-b7de-a3c37158a587	+
67f0818c-fd4a-4618-afd5-245e74dac6f0	+
d447806d-45c0-4c3d-a53e-6cae5729ef3d	/*
\.


--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 307
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keycloak
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3603 (class 2606 OID 17593)
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- TOC entry 3576 (class 2606 OID 17903)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3819 (class 2606 OID 17733)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3821 (class 2606 OID 17932)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3850 (class 2606 OID 18117)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3816 (class 2606 OID 17607)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3733 (class 2606 OID 17255)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3781 (class 2606 OID 17530)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3702 (class 2606 OID 17164)
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- TOC entry 3807 (class 2606 OID 17550)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3810 (class 2606 OID 17548)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3799 (class 2606 OID 17546)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3783 (class 2606 OID 17532)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 17534)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3791 (class 2606 OID 17540)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3795 (class 2606 OID 17542)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3803 (class 2606 OID 17544)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3814 (class 2606 OID 17587)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3735 (class 2606 OID 17692)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3661 (class 2606 OID 17709)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3590 (class 2606 OID 17711)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3656 (class 2606 OID 17713)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3649 (class 2606 OID 16841)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3633 (class 2606 OID 16775)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3573 (class 2606 OID 16549)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3645 (class 2606 OID 16843)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3582 (class 2606 OID 16551)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3564 (class 2606 OID 16553)
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- TOC entry 3628 (class 2606 OID 16555)
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- TOC entry 3619 (class 2606 OID 16557)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3635 (class 2606 OID 16777)
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- TOC entry 3556 (class 2606 OID 16561)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3561 (class 2606 OID 16563)
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- TOC entry 3600 (class 2606 OID 16565)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3637 (class 2606 OID 16779)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3587 (class 2606 OID 16567)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3593 (class 2606 OID 16569)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3578 (class 2606 OID 16571)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3679 (class 2606 OID 17696)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3692 (class 2606 OID 17072)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3688 (class 2606 OID 17070)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3685 (class 2606 OID 17068)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3682 (class 2606 OID 17066)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 17076)
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- TOC entry 3625 (class 2606 OID 16573)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3566 (class 2606 OID 17690)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3677 (class 2606 OID 16959)
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- TOC entry 3654 (class 2606 OID 16845)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3767 (class 2606 OID 17413)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3595 (class 2606 OID 16575)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3570 (class 2606 OID 16577)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3617 (class 2606 OID 16579)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3834 (class 2606 OID 17831)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3752 (class 2606 OID 17371)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3762 (class 2606 OID 17399)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3778 (class 2606 OID 17468)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3772 (class 2606 OID 17438)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3757 (class 2606 OID 17385)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3769 (class 2606 OID 17423)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3775 (class 2606 OID 17453)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3609 (class 2606 OID 16581)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3698 (class 2606 OID 17080)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3694 (class 2606 OID 17078)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3832 (class 2606 OID 17816)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3829 (class 2606 OID 17806)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3672 (class 2606 OID 16953)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3719 (class 2606 OID 17222)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3726 (class 2606 OID 17229)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3723 (class 2606 OID 17243)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3667 (class 2606 OID 16949)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3670 (class 2606 OID 17129)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3664 (class 2606 OID 16947)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3715 (class 2606 OID 17909)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3709 (class 2606 OID 17199)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3639 (class 2606 OID 16839)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3643 (class 2606 OID 17122)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3597 (class 2606 OID 17715)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3707 (class 2606 OID 17162)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3704 (class 2606 OID 17160)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3622 (class 2606 OID 17074)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3840 (class 2606 OID 17878)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3842 (class 2606 OID 17885)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3605 (class 2606 OID 17158)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3730 (class 2606 OID 17236)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3659 (class 2606 OID 16849)
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- TOC entry 3630 (class 2606 OID 17717)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3554 (class 2606 OID 16393)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3847 (class 2606 OID 18107)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 3744 (class 2606 OID 17339)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3739 (class 2606 OID 17298)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3750 (class 2606 OID 17670)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3748 (class 2606 OID 17327)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3827 (class 2606 OID 17791)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3845 (class 2606 OID 17926)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3838 (class 2606 OID 17858)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3721 (class 2606 OID 17599)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3652 (class 2606 OID 16896)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3559 (class 2606 OID 16585)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3741 (class 2606 OID 17744)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3613 (class 2606 OID 16589)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3755 (class 2606 OID 17917)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3836 (class 2606 OID 17913)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3765 (class 2606 OID 17661)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3760 (class 2606 OID 17665)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3675 (class 2606 OID 17905)
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3585 (class 2606 OID 16597)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3615 (class 2606 OID 17589)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3848 (class 1259 OID 18108)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 3680 (class 1259 OID 17942)
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- TOC entry 3779 (class 1259 OID 17613)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3683 (class 1259 OID 17617)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3689 (class 1259 OID 17615)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3690 (class 1259 OID 17614)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3686 (class 1259 OID 17616)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3822 (class 1259 OID 17933)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3557 (class 1259 OID 17918)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3817 (class 1259 OID 17658)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3562 (class 1259 OID 17621)
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- TOC entry 3742 (class 1259 OID 17821)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3823 (class 1259 OID 17930)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3640 (class 1259 OID 17818)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3745 (class 1259 OID 17819)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3808 (class 1259 OID 17623)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3811 (class 1259 OID 17892)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3812 (class 1259 OID 17622)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3567 (class 1259 OID 17624)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3568 (class 1259 OID 17625)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3824 (class 1259 OID 17824)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3825 (class 1259 OID 17825)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3574 (class 1259 OID 17919)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3646 (class 1259 OID 17356)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3647 (class 1259 OID 17355)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3784 (class 1259 OID 17718)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3787 (class 1259 OID 17738)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3788 (class 1259 OID 17901)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3789 (class 1259 OID 17720)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3792 (class 1259 OID 17721)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3793 (class 1259 OID 17722)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3796 (class 1259 OID 17723)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3797 (class 1259 OID 17724)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3800 (class 1259 OID 17725)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3801 (class 1259 OID 17726)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3804 (class 1259 OID 17727)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3805 (class 1259 OID 17728)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3727 (class 1259 OID 17943)
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- TOC entry 3728 (class 1259 OID 17629)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3724 (class 1259 OID 17630)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3668 (class 1259 OID 17632)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3650 (class 1259 OID 17631)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3579 (class 1259 OID 17633)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3580 (class 1259 OID 17634)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3716 (class 1259 OID 17936)
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- TOC entry 3710 (class 1259 OID 17937)
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- TOC entry 3711 (class 1259 OID 17938)
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- TOC entry 3712 (class 1259 OID 17896)
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- TOC entry 3713 (class 1259 OID 17927)
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- TOC entry 3641 (class 1259 OID 17635)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3588 (class 1259 OID 17638)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3737 (class 1259 OID 17817)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3736 (class 1259 OID 17639)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3591 (class 1259 OID 17642)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3662 (class 1259 OID 17641)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3583 (class 1259 OID 17637)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3657 (class 1259 OID 17643)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3598 (class 1259 OID 17644)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3705 (class 1259 OID 17645)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3773 (class 1259 OID 17646)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3770 (class 1259 OID 17647)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3763 (class 1259 OID 17666)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3753 (class 1259 OID 17667)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3758 (class 1259 OID 17668)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3843 (class 1259 OID 17891)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3746 (class 1259 OID 17820)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3601 (class 1259 OID 17651)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3776 (class 1259 OID 17652)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3665 (class 1259 OID 17899)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3717 (class 1259 OID 17345)
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- TOC entry 3830 (class 1259 OID 17826)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3606 (class 1259 OID 17352)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3607 (class 1259 OID 17940)
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- TOC entry 3673 (class 1259 OID 17349)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3571 (class 1259 OID 17353)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3610 (class 1259 OID 17346)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3731 (class 1259 OID 17348)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3623 (class 1259 OID 17354)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3626 (class 1259 OID 17347)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3611 (class 1259 OID 17941)
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- TOC entry 3695 (class 1259 OID 17654)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3696 (class 1259 OID 17655)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3620 (class 1259 OID 17656)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3631 (class 1259 OID 17657)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3892 (class 2606 OID 17081)
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3876 (class 2606 OID 16850)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3869 (class 2606 OID 16780)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3875 (class 2606 OID 16860)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3871 (class 2606 OID 17007)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3870 (class 2606 OID 16785)
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3879 (class 2606 OID 16890)
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- TOC entry 3852 (class 2606 OID 16600)
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3861 (class 2606 OID 16605)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3865 (class 2606 OID 16610)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3884 (class 2606 OID 16985)
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3859 (class 2606 OID 16620)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3922 (class 2606 OID 17859)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3863 (class 2606 OID 16625)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3866 (class 2606 OID 16635)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3856 (class 2606 OID 16640)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- TOC entry 3860 (class 2606 OID 16645)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3857 (class 2606 OID 16660)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3853 (class 2606 OID 16665)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3887 (class 2606 OID 17101)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- TOC entry 3888 (class 2606 OID 17096)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3886 (class 2606 OID 17091)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3885 (class 2606 OID 17086)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3851 (class 2606 OID 16670)
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- TOC entry 3867 (class 2606 OID 16675)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3899 (class 2606 OID 17765)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3900 (class 2606 OID 17755)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3893 (class 2606 OID 17170)
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3872 (class 2606 OID 17750)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3915 (class 2606 OID 17608)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3913 (class 2606 OID 17556)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- TOC entry 3914 (class 2606 OID 17551)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3898 (class 2606 OID 17256)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3891 (class 2606 OID 17116)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- TOC entry 3889 (class 2606 OID 17111)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3890 (class 2606 OID 17106)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3911 (class 2606 OID 17474)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3909 (class 2606 OID 17459)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3918 (class 2606 OID 17832)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3901 (class 2606 OID 17676)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3919 (class 2606 OID 17837)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3920 (class 2606 OID 17842)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3912 (class 2606 OID 17469)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3910 (class 2606 OID 17454)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3921 (class 2606 OID 17864)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3903 (class 2606 OID 17671)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3905 (class 2606 OID 17424)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3907 (class 2606 OID 17439)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3908 (class 2606 OID 17444)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3906 (class 2606 OID 17429)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3902 (class 2606 OID 17681)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3854 (class 2606 OID 16690)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3917 (class 2606 OID 17807)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- TOC entry 3883 (class 2606 OID 16970)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3896 (class 2606 OID 17230)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3895 (class 2606 OID 17244)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3880 (class 2606 OID 16916)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3858 (class 2606 OID 16700)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3881 (class 2606 OID 16960)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3882 (class 2606 OID 17130)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- TOC entry 3868 (class 2606 OID 16710)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3862 (class 2606 OID 16720)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3873 (class 2606 OID 16855)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3855 (class 2606 OID 16735)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3874 (class 2606 OID 17123)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- TOC entry 3916 (class 2606 OID 17792)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3894 (class 2606 OID 17165)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3923 (class 2606 OID 17872)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3924 (class 2606 OID 17886)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3878 (class 2606 OID 16885)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3864 (class 2606 OID 16755)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3897 (class 2606 OID 17237)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3904 (class 2606 OID 17414)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3877 (class 2606 OID 16865)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


-- Completed on 2024-05-01 18:51:14

--
-- PostgreSQL database dump complete
--

