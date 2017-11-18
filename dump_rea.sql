--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO rea_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO rea_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO rea_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO rea_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO rea_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO rea_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO rea_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO rea_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO rea_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO rea_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO rea_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO rea_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO rea_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO rea_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO rea_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO rea_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO rea_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO rea_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO rea_user;

--
-- Name: protoExt_customdefinition; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoExt_customdefinition" (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    active boolean NOT NULL,
    "overWrite" boolean NOT NULL,
    "metaDefinition" jsonb NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE "protoExt_customdefinition" OWNER TO rea_user;

--
-- Name: protoExt_customdefinition_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoExt_customdefinition_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoExt_customdefinition_id_seq" OWNER TO rea_user;

--
-- Name: protoExt_customdefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoExt_customdefinition_id_seq" OWNED BY "protoExt_customdefinition".id;


--
-- Name: protoExt_parameters; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoExt_parameters" (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "smInfo" jsonb NOT NULL,
    "parameterKey" character varying(250) NOT NULL,
    "parameterTag" character varying(250),
    "parameterValue" character varying(250) NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE "protoExt_parameters" OWNER TO rea_user;

--
-- Name: protoExt_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoExt_parameters_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoExt_parameters_id_seq" OWNER TO rea_user;

--
-- Name: protoExt_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoExt_parameters_id_seq" OWNED BY "protoExt_parameters".id;


--
-- Name: protoExt_viewdefinition; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoExt_viewdefinition" (
    id integer NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    active boolean NOT NULL,
    "overWrite" boolean NOT NULL,
    "metaDefinition" jsonb NOT NULL
);


ALTER TABLE "protoExt_viewdefinition" OWNER TO rea_user;

--
-- Name: protoExt_viewdefinition_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoExt_viewdefinition_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoExt_viewdefinition_id_seq" OWNER TO rea_user;

--
-- Name: protoExt_viewdefinition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoExt_viewdefinition_id_seq" OWNED BY "protoExt_viewdefinition".id;


--
-- Name: protoLib_contextentity; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoLib_contextentity" (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "propName" character varying(200),
    active boolean NOT NULL,
    "contextVar_id" integer NOT NULL,
    entity_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE "protoLib_contextentity" OWNER TO rea_user;

--
-- Name: protoLib_contextentity_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoLib_contextentity_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoLib_contextentity_id_seq" OWNER TO rea_user;

--
-- Name: protoLib_contextentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoLib_contextentity_id_seq" OWNED BY "protoLib_contextentity".id;


--
-- Name: protoLib_contextuser; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoLib_contextuser" (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "propValue" character varying(200),
    description text,
    active boolean NOT NULL,
    "contextVar_id" integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE "protoLib_contextuser" OWNER TO rea_user;

--
-- Name: protoLib_contextuser_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoLib_contextuser_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoLib_contextuser_id_seq" OWNER TO rea_user;

--
-- Name: protoLib_contextuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoLib_contextuser_id_seq" OWNED BY "protoLib_contextuser".id;


--
-- Name: protoLib_contextvar; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoLib_contextvar" (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "propName" character varying(500) NOT NULL,
    description text,
    "modelCType_id" integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE "protoLib_contextvar" OWNER TO rea_user;

--
-- Name: protoLib_contextvar_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoLib_contextvar_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoLib_contextvar_id_seq" OWNER TO rea_user;

--
-- Name: protoLib_contextvar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoLib_contextvar_id_seq" OWNED BY "protoLib_contextvar".id;


--
-- Name: protoLib_entitymap; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoLib_entitymap" (
    id integer NOT NULL,
    "entityConfig" jsonb NOT NULL,
    "entityBase_id" integer NOT NULL
);


ALTER TABLE "protoLib_entitymap" OWNER TO rea_user;

--
-- Name: protoLib_entitymap_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoLib_entitymap_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoLib_entitymap_id_seq" OWNER TO rea_user;

--
-- Name: protoLib_entitymap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoLib_entitymap_id_seq" OWNED BY "protoLib_entitymap".id;


--
-- Name: protoLib_logger; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoLib_logger" (
    id integer NOT NULL,
    "smCreatedOn" timestamp with time zone,
    "logType" character varying(10) NOT NULL,
    "logObject" character varying(250),
    "logNotes" character varying(250),
    "logInfo" text,
    "logKey" character varying(5) NOT NULL,
    "smCreatedBy_id" integer,
    "smOwningTeam_id" integer
);


ALTER TABLE "protoLib_logger" OWNER TO rea_user;

--
-- Name: protoLib_logger_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoLib_logger_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoLib_logger_id_seq" OWNER TO rea_user;

--
-- Name: protoLib_logger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoLib_logger_id_seq" OWNED BY "protoLib_logger".id;


--
-- Name: protoLib_teamhierarchy; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoLib_teamhierarchy" (
    id integer NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    site integer,
    "parentNode_id" integer
);


ALTER TABLE "protoLib_teamhierarchy" OWNER TO rea_user;

--
-- Name: protoLib_teamhierarchy_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoLib_teamhierarchy_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoLib_teamhierarchy_id_seq" OWNER TO rea_user;

--
-- Name: protoLib_teamhierarchy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoLib_teamhierarchy_id_seq" OWNED BY "protoLib_teamhierarchy".id;


--
-- Name: protoLib_userprofile; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE "protoLib_userprofile" (
    id integer NOT NULL,
    language character varying(500),
    "userTree" character varying(500),
    "userConfig" jsonb NOT NULL,
    user_id integer NOT NULL,
    "userTeam_id" integer
);


ALTER TABLE "protoLib_userprofile" OWNER TO rea_user;

--
-- Name: protoLib_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE "protoLib_userprofile_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "protoLib_userprofile_id_seq" OWNER TO rea_user;

--
-- Name: protoLib_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE "protoLib_userprofile_id_seq" OWNED BY "protoLib_userprofile".id;


--
-- Name: prototype_diagram; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_diagram (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "smInfo" jsonb NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    notes text,
    title character varying(100),
    prefix character varying(20),
    "graphLevel" integer,
    "grphMode" integer,
    "graphForm" integer,
    "showPrpType" boolean NOT NULL,
    "showBorder" boolean NOT NULL,
    "showFKey" boolean NOT NULL,
    project_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "smVersion_id" integer NOT NULL
);


ALTER TABLE prototype_diagram OWNER TO rea_user;

--
-- Name: prototype_diagram_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_diagram_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_diagram_id_seq OWNER TO rea_user;

--
-- Name: prototype_diagram_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_diagram_id_seq OWNED BY prototype_diagram.id;


--
-- Name: prototype_diagramentity; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_diagramentity (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "smInfo" jsonb NOT NULL,
    info jsonb NOT NULL,
    diagram_id integer NOT NULL,
    entity_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "smVersion_id" integer NOT NULL
);


ALTER TABLE prototype_diagramentity OWNER TO rea_user;

--
-- Name: prototype_diagramentity_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_diagramentity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_diagramentity_id_seq OWNER TO rea_user;

--
-- Name: prototype_diagramentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_diagramentity_id_seq OWNED BY prototype_diagramentity.id;


--
-- Name: prototype_entity; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_entity (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "smInfo" jsonb NOT NULL,
    code character varying(200) NOT NULL,
    "dbName" character varying(200),
    description text,
    model_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "smVersion_id" integer NOT NULL
);


ALTER TABLE prototype_entity OWNER TO rea_user;

--
-- Name: prototype_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_entity_id_seq OWNER TO rea_user;

--
-- Name: prototype_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_entity_id_seq OWNED BY prototype_entity.id;


--
-- Name: prototype_model; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_model (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "smInfo" jsonb NOT NULL,
    code character varying(200) NOT NULL,
    category character varying(50),
    "modelPrefix" character varying(50),
    description text,
    project_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "smVersion_id" integer NOT NULL
);


ALTER TABLE prototype_model OWNER TO rea_user;

--
-- Name: prototype_model_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_model_id_seq OWNER TO rea_user;

--
-- Name: prototype_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_model_id_seq OWNED BY prototype_model.id;


--
-- Name: prototype_project; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_project (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "smInfo" jsonb NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    "dbEngine" character varying(20),
    "dbName" character varying(200),
    "dbUser" character varying(200),
    "dbPassword" character varying(200),
    "dbHost" character varying(200),
    "dbPort" character varying(200),
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "smVersion_id" integer NOT NULL
);


ALTER TABLE prototype_project OWNER TO rea_user;

--
-- Name: prototype_project_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_project_id_seq OWNER TO rea_user;

--
-- Name: prototype_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_project_id_seq OWNED BY prototype_project.id;


--
-- Name: prototype_property; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_property (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "smInfo" jsonb NOT NULL,
    code character varying(200) NOT NULL,
    "baseType" character varying(50),
    "prpLength" integer,
    "prpScale" integer,
    "prpDefault" character varying(50),
    "prpChoices" text,
    description text,
    notes text,
    "isPrimary" boolean NOT NULL,
    "isLookUpResult" boolean NOT NULL,
    "isNullable" boolean NOT NULL,
    "isRequired" boolean NOT NULL,
    "isReadOnly" boolean NOT NULL,
    "isForeign" boolean NOT NULL,
    "vType" character varying(50),
    "isSensitive" boolean NOT NULL,
    "isEssential" boolean NOT NULL,
    "crudType" character varying(20),
    "dbName" character varying(200),
    entity_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "smVersion_id" integer NOT NULL
);


ALTER TABLE prototype_property OWNER TO rea_user;

--
-- Name: prototype_property_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_property_id_seq OWNER TO rea_user;

--
-- Name: prototype_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_property_id_seq OWNED BY prototype_property.id;


--
-- Name: prototype_propertyequivalence; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_propertyequivalence (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "smInfo" jsonb NOT NULL,
    description text,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "smVersion_id" integer NOT NULL,
    "sourceProperty_id" integer,
    "targetProperty_id" integer
);


ALTER TABLE prototype_propertyequivalence OWNER TO rea_user;

--
-- Name: prototype_propertyequivalence_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_propertyequivalence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_propertyequivalence_id_seq OWNER TO rea_user;

--
-- Name: prototype_propertyequivalence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_propertyequivalence_id_seq OWNED BY prototype_propertyequivalence.id;


--
-- Name: prototype_prototable; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_prototable (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    info jsonb NOT NULL,
    entity_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE prototype_prototable OWNER TO rea_user;

--
-- Name: prototype_prototable_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_prototable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_prototable_id_seq OWNER TO rea_user;

--
-- Name: prototype_prototable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_prototable_id_seq OWNED BY prototype_prototable.id;


--
-- Name: prototype_prototype; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_prototype (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    notes text,
    "metaDefinition" jsonb,
    entity_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "smVersion_id" integer NOT NULL
);


ALTER TABLE prototype_prototype OWNER TO rea_user;

--
-- Name: prototype_prototype_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_prototype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_prototype_id_seq OWNER TO rea_user;

--
-- Name: prototype_prototype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_prototype_id_seq OWNED BY prototype_prototype.id;


--
-- Name: prototype_protoversiontitle; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_protoversiontitle (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    "versionCode" character varying(50),
    description text,
    active boolean NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "versionBase_id" integer
);


ALTER TABLE prototype_protoversiontitle OWNER TO rea_user;

--
-- Name: prototype_protoversiontitle_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE prototype_protoversiontitle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_protoversiontitle_id_seq OWNER TO rea_user;

--
-- Name: prototype_protoversiontitle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE prototype_protoversiontitle_id_seq OWNED BY prototype_protoversiontitle.id;


--
-- Name: prototype_relationship; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE prototype_relationship (
    property_ptr_id integer NOT NULL,
    "relatedName" character varying(50),
    "baseMin" character varying(50),
    "baseMax" character varying(50),
    "refMin" character varying(50),
    "refMax" character varying(50),
    "onRefDelete" character varying(50),
    "typeRelation" character varying(50),
    "refEntity_id" integer
);


ALTER TABLE prototype_relationship OWNER TO rea_user;

--
-- Name: rai01ref_artefact; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_artefact (
    id integer NOT NULL,
    "smNaturalCode" character varying(75),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    info jsonb NOT NULL,
    "copyFrom_id" integer,
    "docType_id" integer,
    "refArtefact_id" integer,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    capacity_id integer,
    requirement_id integer
);


ALTER TABLE rai01ref_artefact OWNER TO rea_user;

--
-- Name: rai01ref_artefact_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_artefact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_artefact_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_artefact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_artefact_id_seq OWNED BY rai01ref_artefact.id;


--
-- Name: rai01ref_artefactcapacity; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_artefactcapacity (
    id integer NOT NULL,
    "smNaturalCode" character varying(75),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    notes text,
    description text,
    artefact_id integer NOT NULL,
    capacity_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "isMain" boolean NOT NULL
);


ALTER TABLE rai01ref_artefactcapacity OWNER TO rea_user;

--
-- Name: rai01ref_artefactcapacity_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_artefactcapacity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_artefactcapacity_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_artefactcapacity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_artefactcapacity_id_seq OWNED BY rai01ref_artefactcapacity.id;


--
-- Name: rai01ref_artefactcomposition; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_artefactcomposition (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    condition text,
    notes text,
    description text,
    "containerArt_id" integer NOT NULL,
    "inputArt_id" integer NOT NULL,
    "outputArt_id" integer,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_artefactcomposition OWNER TO rea_user;

--
-- Name: rai01ref_artefactcomposition_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_artefactcomposition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_artefactcomposition_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_artefactcomposition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_artefactcomposition_id_seq OWNED BY rai01ref_artefactcomposition.id;


--
-- Name: rai01ref_artefactrequirement; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_artefactrequirement (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    notes text,
    description text,
    artefact_id integer NOT NULL,
    requirement_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    "isMain" boolean NOT NULL
);


ALTER TABLE rai01ref_artefactrequirement OWNER TO rea_user;

--
-- Name: rai01ref_artefactrequirement_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_artefactrequirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_artefactrequirement_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_artefactrequirement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_artefactrequirement_id_seq OWNED BY rai01ref_artefactrequirement.id;


--
-- Name: rai01ref_artefactsource; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_artefactsource (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    notes text,
    description text,
    artefact_id integer,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer,
    source_id integer
);


ALTER TABLE rai01ref_artefactsource OWNER TO rea_user;

--
-- Name: rai01ref_artefactsource_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_artefactsource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_artefactsource_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_artefactsource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_artefactsource_id_seq OWNED BY rai01ref_artefactsource.id;


--
-- Name: rai01ref_capacity; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_capacity (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    info jsonb NOT NULL,
    "copyFrom_id" integer,
    "docType_id" integer,
    "refCapacity_id" integer,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_capacity OWNER TO rea_user;

--
-- Name: rai01ref_capacity_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_capacity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_capacity_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_capacity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_capacity_id_seq OWNED BY rai01ref_capacity.id;


--
-- Name: rai01ref_docattribute; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_docattribute (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    code character varying(200) NOT NULL,
    "baseType" character varying(50),
    "prpLength" integer,
    "prpScale" integer,
    "vType" character varying(75),
    "prpDefault" character varying(50),
    "prpChoices" text,
    "isRequired" boolean NOT NULL,
    "isSensitive" boolean NOT NULL,
    "crudType" character varying(20),
    description text,
    "docType_id" integer,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_docattribute OWNER TO rea_user;

--
-- Name: rai01ref_docattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_docattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_docattribute_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_docattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_docattribute_id_seq OWNED BY rai01ref_docattribute.id;


--
-- Name: rai01ref_doctype; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_doctype (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    document character varying(11) NOT NULL,
    dtype character varying(200) NOT NULL,
    category character varying(50),
    notes text,
    description text,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_doctype OWNER TO rea_user;

--
-- Name: rai01ref_doctype_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_doctype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_doctype_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_doctype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_doctype_id_seq OWNED BY rai01ref_doctype.id;


--
-- Name: rai01ref_projectartefact; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_projectartefact (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    notes text,
    description text,
    artefact_id integer NOT NULL,
    projet_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_projectartefact OWNER TO rea_user;

--
-- Name: rai01ref_projectartefact_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_projectartefact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_projectartefact_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_projectartefact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_projectartefact_id_seq OWNED BY rai01ref_projectartefact.id;


--
-- Name: rai01ref_projectcapacity; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_projectcapacity (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    notes text,
    description text,
    capacity_id integer NOT NULL,
    projet_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_projectcapacity OWNER TO rea_user;

--
-- Name: rai01ref_projectcapacity_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_projectcapacity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_projectcapacity_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_projectcapacity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_projectcapacity_id_seq OWNED BY rai01ref_projectcapacity.id;


--
-- Name: rai01ref_projectrequirement; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_projectrequirement (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    notes text,
    description text,
    projet_id integer NOT NULL,
    requirement_id integer NOT NULL,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_projectrequirement OWNER TO rea_user;

--
-- Name: rai01ref_projectrequirement_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_projectrequirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_projectrequirement_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_projectrequirement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_projectrequirement_id_seq OWNED BY rai01ref_projectrequirement.id;


--
-- Name: rai01ref_projet; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_projet (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    code character varying(200) NOT NULL,
    notes text,
    description text,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_projet OWNER TO rea_user;

--
-- Name: rai01ref_projet_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_projet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_projet_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_projet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_projet_id_seq OWNED BY rai01ref_projet.id;


--
-- Name: rai01ref_requirement; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_requirement (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    code character varying(200) NOT NULL,
    description text,
    info jsonb NOT NULL,
    "copyFrom_id" integer,
    "docType_id" integer,
    "refRequirement_id" integer,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_requirement OWNER TO rea_user;

--
-- Name: rai01ref_requirement_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_requirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_requirement_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_requirement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_requirement_id_seq OWNED BY rai01ref_requirement.id;


--
-- Name: rai01ref_source; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE rai01ref_source (
    id integer NOT NULL,
    "smNaturalCode" character varying(50),
    "smRegStatus" character varying(50),
    "smWflowStatus" character varying(50),
    "smCreatedOn" timestamp with time zone,
    "smModifiedOn" timestamp with time zone,
    "smUUID" uuid NOT NULL,
    code character varying(200) NOT NULL,
    reference character varying(200),
    notes text,
    description text,
    "smCreatedBy_id" integer,
    "smModifiedBy_id" integer,
    "smOwningTeam_id" integer,
    "smOwningUser_id" integer
);


ALTER TABLE rai01ref_source OWNER TO rea_user;

--
-- Name: rai01ref_source_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE rai01ref_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rai01ref_source_id_seq OWNER TO rea_user;

--
-- Name: rai01ref_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE rai01ref_source_id_seq OWNED BY rai01ref_source.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE taggit_tag OWNER TO rea_user;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_tag_id_seq OWNER TO rea_user;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: rea_user
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE taggit_taggeditem OWNER TO rea_user;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: rea_user
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_taggeditem_id_seq OWNER TO rea_user;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rea_user
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: protoExt_customdefinition id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_customdefinition" ALTER COLUMN id SET DEFAULT nextval('"protoExt_customdefinition_id_seq"'::regclass);


--
-- Name: protoExt_parameters id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_parameters" ALTER COLUMN id SET DEFAULT nextval('"protoExt_parameters_id_seq"'::regclass);


--
-- Name: protoExt_viewdefinition id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_viewdefinition" ALTER COLUMN id SET DEFAULT nextval('"protoExt_viewdefinition_id_seq"'::regclass);


--
-- Name: protoLib_contextentity id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity" ALTER COLUMN id SET DEFAULT nextval('"protoLib_contextentity_id_seq"'::regclass);


--
-- Name: protoLib_contextuser id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextuser" ALTER COLUMN id SET DEFAULT nextval('"protoLib_contextuser_id_seq"'::regclass);


--
-- Name: protoLib_contextvar id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextvar" ALTER COLUMN id SET DEFAULT nextval('"protoLib_contextvar_id_seq"'::regclass);


--
-- Name: protoLib_entitymap id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_entitymap" ALTER COLUMN id SET DEFAULT nextval('"protoLib_entitymap_id_seq"'::regclass);


--
-- Name: protoLib_logger id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_logger" ALTER COLUMN id SET DEFAULT nextval('"protoLib_logger_id_seq"'::regclass);


--
-- Name: protoLib_teamhierarchy id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_teamhierarchy" ALTER COLUMN id SET DEFAULT nextval('"protoLib_teamhierarchy_id_seq"'::regclass);


--
-- Name: protoLib_userprofile id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_userprofile" ALTER COLUMN id SET DEFAULT nextval('"protoLib_userprofile_id_seq"'::regclass);


--
-- Name: prototype_diagram id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram ALTER COLUMN id SET DEFAULT nextval('prototype_diagram_id_seq'::regclass);


--
-- Name: prototype_diagramentity id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity ALTER COLUMN id SET DEFAULT nextval('prototype_diagramentity_id_seq'::regclass);


--
-- Name: prototype_entity id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity ALTER COLUMN id SET DEFAULT nextval('prototype_entity_id_seq'::regclass);


--
-- Name: prototype_model id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model ALTER COLUMN id SET DEFAULT nextval('prototype_model_id_seq'::regclass);


--
-- Name: prototype_project id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_project ALTER COLUMN id SET DEFAULT nextval('prototype_project_id_seq'::regclass);


--
-- Name: prototype_property id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property ALTER COLUMN id SET DEFAULT nextval('prototype_property_id_seq'::regclass);


--
-- Name: prototype_propertyequivalence id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence ALTER COLUMN id SET DEFAULT nextval('prototype_propertyequivalence_id_seq'::regclass);


--
-- Name: prototype_prototable id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototable ALTER COLUMN id SET DEFAULT nextval('prototype_prototable_id_seq'::regclass);


--
-- Name: prototype_prototype id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype ALTER COLUMN id SET DEFAULT nextval('prototype_prototype_id_seq'::regclass);


--
-- Name: prototype_protoversiontitle id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_protoversiontitle ALTER COLUMN id SET DEFAULT nextval('prototype_protoversiontitle_id_seq'::regclass);


--
-- Name: rai01ref_artefact id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact ALTER COLUMN id SET DEFAULT nextval('rai01ref_artefact_id_seq'::regclass);


--
-- Name: rai01ref_artefactcapacity id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity ALTER COLUMN id SET DEFAULT nextval('rai01ref_artefactcapacity_id_seq'::regclass);


--
-- Name: rai01ref_artefactcomposition id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition ALTER COLUMN id SET DEFAULT nextval('rai01ref_artefactcomposition_id_seq'::regclass);


--
-- Name: rai01ref_artefactrequirement id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement ALTER COLUMN id SET DEFAULT nextval('rai01ref_artefactrequirement_id_seq'::regclass);


--
-- Name: rai01ref_artefactsource id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource ALTER COLUMN id SET DEFAULT nextval('rai01ref_artefactsource_id_seq'::regclass);


--
-- Name: rai01ref_capacity id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity ALTER COLUMN id SET DEFAULT nextval('rai01ref_capacity_id_seq'::regclass);


--
-- Name: rai01ref_docattribute id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_docattribute ALTER COLUMN id SET DEFAULT nextval('rai01ref_docattribute_id_seq'::regclass);


--
-- Name: rai01ref_doctype id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_doctype ALTER COLUMN id SET DEFAULT nextval('rai01ref_doctype_id_seq'::regclass);


--
-- Name: rai01ref_projectartefact id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact ALTER COLUMN id SET DEFAULT nextval('rai01ref_projectartefact_id_seq'::regclass);


--
-- Name: rai01ref_projectcapacity id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity ALTER COLUMN id SET DEFAULT nextval('rai01ref_projectcapacity_id_seq'::regclass);


--
-- Name: rai01ref_projectrequirement id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement ALTER COLUMN id SET DEFAULT nextval('rai01ref_projectrequirement_id_seq'::regclass);


--
-- Name: rai01ref_projet id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projet ALTER COLUMN id SET DEFAULT nextval('rai01ref_projet_id_seq'::regclass);


--
-- Name: rai01ref_requirement id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement ALTER COLUMN id SET DEFAULT nextval('rai01ref_requirement_id_seq'::regclass);


--
-- Name: rai01ref_source id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_source ALTER COLUMN id SET DEFAULT nextval('rai01ref_source_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY auth_group (id, name) FROM stdin;
1	base
2	g1
3	g2
4	users
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('auth_group_id_seq', 4, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	55
53	1	56
54	1	57
55	1	58
56	1	59
57	1	60
58	1	61
59	1	62
60	1	63
61	1	64
62	1	65
63	1	66
64	1	78
65	1	79
66	1	80
67	1	81
68	1	90
69	1	91
70	1	92
71	1	99
72	1	100
73	1	101
74	1	102
75	1	103
76	1	104
77	1	105
78	1	106
79	1	107
80	1	108
81	1	109
82	1	110
83	1	111
84	1	112
85	1	113
86	1	114
87	1	115
88	1	116
89	1	117
90	1	118
91	1	119
92	1	120
93	1	121
94	1	122
95	1	123
96	1	124
97	1	125
98	1	126
99	1	127
100	1	128
101	1	129
102	1	130
103	1	131
104	1	132
105	1	133
106	1	134
107	1	135
108	1	136
109	1	137
110	1	138
111	1	139
112	1	140
113	1	141
114	1	142
115	1	143
116	1	144
117	1	145
118	1	146
119	1	147
120	1	148
121	1	149
122	1	150
123	1	151
124	1	152
125	1	153
126	1	154
127	1	155
128	1	156
129	1	157
130	1	158
131	1	159
132	1	160
133	1	161
134	1	162
135	1	163
136	1	164
137	1	165
138	1	166
139	1	167
140	1	168
141	1	169
142	1	170
143	1	171
144	1	172
145	1	173
146	1	174
147	1	175
148	1	176
149	1	177
150	1	178
151	1	179
152	1	180
153	1	181
154	1	182
155	1	183
156	1	184
157	1	185
158	1	186
159	1	187
160	1	188
161	1	189
162	1	190
163	1	191
164	1	192
165	1	193
166	1	194
167	1	195
168	1	196
169	1	197
170	1	198
171	1	199
172	1	200
173	1	201
174	1	202
175	1	203
176	1	204
177	1	205
178	1	206
179	1	207
180	1	208
181	1	209
182	1	210
183	1	211
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 183, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can see on menu log entry	1	menu_logentry
5	Can list log entry	1	list_logentry
6	Can config log entry	1	config_logentry
7	Can customize log entry	1	custom_logentry
8	Can add permission	2	add_permission
9	Can change permission	2	change_permission
10	Can delete permission	2	delete_permission
11	Can add group	3	add_group
12	Can change group	3	change_group
13	Can delete group	3	delete_group
14	Can add user	4	add_user
15	Can change user	4	change_user
16	Can delete user	4	delete_user
17	Can see on menu permission	2	menu_permission
18	Can list permission	2	list_permission
19	Can config permission	2	config_permission
20	Can customize permission	2	custom_permission
21	Can see on menu group	3	menu_group
22	Can list group	3	list_group
23	Can config group	3	config_group
24	Can customize group	3	custom_group
25	Can see on menu user	4	menu_user
26	Can list user	4	list_user
27	Can config user	4	config_user
28	Can customize user	4	custom_user
29	Can add content type	5	add_contenttype
30	Can change content type	5	change_contenttype
31	Can delete content type	5	delete_contenttype
32	Can see on menu content type	5	menu_contenttype
33	Can list content type	5	list_contenttype
34	Can config content type	5	config_contenttype
35	Can customize content type	5	custom_contenttype
36	Can add session	6	add_session
37	Can change session	6	change_session
38	Can delete session	6	delete_session
39	Can see on menu session	6	menu_session
40	Can list session	6	list_session
41	Can config session	6	config_session
42	Can customize session	6	custom_session
43	Can add team hierarchy	7	add_teamhierarchy
44	Can change team hierarchy	7	change_teamhierarchy
45	Can delete team hierarchy	7	delete_teamhierarchy
46	Can add user profile	8	add_userprofile
47	Can change user profile	8	change_userprofile
48	Can delete user profile	8	delete_userprofile
49	Can add entity map	9	add_entitymap
50	Can change entity map	9	change_entitymap
51	Can delete entity map	9	delete_entitymap
52	Can add logger	10	add_logger
53	Can change logger	10	change_logger
54	Can delete logger	10	delete_logger
55	Can add context var	11	add_contextvar
56	Can change context var	11	change_contextvar
57	Can delete context var	11	delete_contextvar
58	Can add context entity	12	add_contextentity
59	Can change context entity	12	change_contextentity
60	Can delete context entity	12	delete_contextentity
61	Can add context user	13	add_contextuser
62	Can change context user	13	change_contextuser
63	Can delete context user	13	delete_contextuser
64	Can see on menu team hierarchy	7	menu_teamhierarchy
65	Can list team hierarchy	7	list_teamhierarchy
66	Can config team hierarchy	7	config_teamhierarchy
67	Can customize team hierarchy	7	custom_teamhierarchy
68	Can see on menu user profile	8	menu_userprofile
69	Can list user profile	8	list_userprofile
70	Can config user profile	8	config_userprofile
71	Can customize user profile	8	custom_userprofile
72	Can see on menu entity map	9	menu_entitymap
73	Can list entity map	9	list_entitymap
74	Can config entity map	9	config_entitymap
75	Can customize entity map	9	custom_entitymap
76	Can see on menu logger	10	menu_logger
77	Can list logger	10	list_logger
78	Can config logger	10	config_logger
79	Can customize logger	10	custom_logger
80	Can see on menu context var	11	menu_contextvar
81	Can list context var	11	list_contextvar
82	Can config context var	11	config_contextvar
83	Can customize context var	11	custom_contextvar
84	Can see on menu context entity	12	menu_contextentity
85	Can list context entity	12	list_contextentity
86	Can config context entity	12	config_contextentity
87	Can customize context entity	12	custom_contextentity
88	Can see on menu context user	13	menu_contextuser
89	Can list context user	13	list_contextuser
90	Can config context user	13	config_contextuser
91	Can customize context user	13	custom_contextuser
92	Can add parameters	14	add_parameters
93	Can change parameters	14	change_parameters
94	Can delete parameters	14	delete_parameters
95	Can add view definition	15	add_viewdefinition
96	Can change view definition	15	change_viewdefinition
97	Can delete view definition	15	delete_viewdefinition
98	Can add custom definition	16	add_customdefinition
99	Can change custom definition	16	change_customdefinition
100	Can delete custom definition	16	delete_customdefinition
101	Can see on menu parameters	14	menu_parameters
102	Can list parameters	14	list_parameters
103	Can config parameters	14	config_parameters
104	Can customize parameters	14	custom_parameters
105	Can see on menu view definition	15	menu_viewdefinition
106	Can list view definition	15	list_viewdefinition
107	Can config view definition	15	config_viewdefinition
108	Can customize view definition	15	custom_viewdefinition
109	Can see on menu custom definition	16	menu_customdefinition
110	Can list custom definition	16	list_customdefinition
111	Can config custom definition	16	config_customdefinition
112	Can customize custom definition	16	custom_customdefinition
113	Can add proto version title	17	add_protoversiontitle
114	Can change proto version title	17	change_protoversiontitle
115	Can delete proto version title	17	delete_protoversiontitle
116	Can add project	18	add_project
117	Can change project	18	change_project
118	Can delete project	18	delete_project
119	Can add model	19	add_model
120	Can change model	19	change_model
121	Can delete model	19	delete_model
122	Can add entity	20	add_entity
123	Can change entity	20	change_entity
124	Can delete entity	20	delete_entity
125	Can add property	21	add_property
126	Can change property	21	change_property
127	Can delete property	21	delete_property
128	Can add relationship	22	add_relationship
129	Can change relationship	22	change_relationship
130	Can delete relationship	22	delete_relationship
131	Can add property equivalence	23	add_propertyequivalence
132	Can change property equivalence	23	change_propertyequivalence
133	Can delete property equivalence	23	delete_propertyequivalence
134	Can add prototype	24	add_prototype
135	Can change prototype	24	change_prototype
136	Can delete prototype	24	delete_prototype
137	Can add proto table	25	add_prototable
138	Can change proto table	25	change_prototable
139	Can delete proto table	25	delete_prototable
140	Can list available %(class)s	25	list_%(class)
141	Can add diagram	26	add_diagram
142	Can change diagram	26	change_diagram
143	Can delete diagram	26	delete_diagram
144	Can add diagram entity	27	add_diagramentity
145	Can change diagram entity	27	change_diagramentity
146	Can delete diagram entity	27	delete_diagramentity
147	Can see on menu proto version title	17	menu_protoversiontitle
148	Can list proto version title	17	list_protoversiontitle
149	Can config proto version title	17	config_protoversiontitle
150	Can customize proto version title	17	custom_protoversiontitle
151	Can see on menu project	18	menu_project
152	Can list project	18	list_project
153	Can config project	18	config_project
154	Can customize project	18	custom_project
155	Can see on menu model	19	menu_model
156	Can list model	19	list_model
157	Can config model	19	config_model
158	Can customize model	19	custom_model
159	Can see on menu entity	20	menu_entity
160	Can list entity	20	list_entity
161	Can config entity	20	config_entity
162	Can customize entity	20	custom_entity
163	Can see on menu property	21	menu_property
164	Can list property	21	list_property
165	Can config property	21	config_property
166	Can customize property	21	custom_property
167	Can see on menu relationship	22	menu_relationship
168	Can list relationship	22	list_relationship
169	Can config relationship	22	config_relationship
170	Can customize relationship	22	custom_relationship
171	Can see on menu property equivalence	23	menu_propertyequivalence
172	Can list property equivalence	23	list_propertyequivalence
173	Can config property equivalence	23	config_propertyequivalence
174	Can customize property equivalence	23	custom_propertyequivalence
175	Can see on menu prototype	24	menu_prototype
176	Can list prototype	24	list_prototype
177	Can config prototype	24	config_prototype
178	Can customize prototype	24	custom_prototype
179	Can see on menu proto table	25	menu_prototable
180	Can list proto table	25	list_prototable
181	Can config proto table	25	config_prototable
182	Can customize proto table	25	custom_prototable
183	Can see on menu diagram	26	menu_diagram
184	Can list diagram	26	list_diagram
185	Can config diagram	26	config_diagram
186	Can customize diagram	26	custom_diagram
187	Can see on menu diagram entity	27	menu_diagramentity
188	Can list diagram entity	27	list_diagramentity
189	Can config diagram entity	27	config_diagramentity
190	Can customize diagram entity	27	custom_diagramentity
191	Can add doc type	28	add_doctype
192	Can change doc type	28	change_doctype
193	Can delete doc type	28	delete_doctype
194	Can add doc attribute	29	add_docattribute
195	Can change doc attribute	29	change_docattribute
196	Can delete doc attribute	29	delete_docattribute
197	Can add capacity	30	add_capacity
198	Can change capacity	30	change_capacity
199	Can delete capacity	30	delete_capacity
200	Can add requirement	31	add_requirement
201	Can change requirement	31	change_requirement
202	Can delete requirement	31	delete_requirement
203	Can add artefact	32	add_artefact
204	Can change artefact	32	change_artefact
205	Can delete artefact	32	delete_artefact
206	Can add artefact composition	33	add_artefactcomposition
207	Can change artefact composition	33	change_artefactcomposition
208	Can delete artefact composition	33	delete_artefactcomposition
209	Can add artefact requirement	34	add_artefactrequirement
210	Can change artefact requirement	34	change_artefactrequirement
211	Can delete artefact requirement	34	delete_artefactrequirement
212	Can add artefact capacity	35	add_artefactcapacity
213	Can change artefact capacity	35	change_artefactcapacity
214	Can delete artefact capacity	35	delete_artefactcapacity
215	Can add projet	36	add_projet
216	Can change projet	36	change_projet
217	Can delete projet	36	delete_projet
218	Can add project artefact	37	add_projectartefact
219	Can change project artefact	37	change_projectartefact
220	Can delete project artefact	37	delete_projectartefact
221	Can add project capacity	38	add_projectcapacity
222	Can change project capacity	38	change_projectcapacity
223	Can delete project capacity	38	delete_projectcapacity
224	Can add project requirement	39	add_projectrequirement
225	Can change project requirement	39	change_projectrequirement
226	Can delete project requirement	39	delete_projectrequirement
227	Can add source	40	add_source
228	Can change source	40	change_source
229	Can delete source	40	delete_source
230	Can add artefact source	41	add_artefactsource
231	Can change artefact source	41	change_artefactsource
232	Can delete artefact source	41	delete_artefactsource
233	Can see on menu doc type	28	menu_doctype
234	Can list doc type	28	list_doctype
235	Can config doc type	28	config_doctype
236	Can customize doc type	28	custom_doctype
237	Can see on menu doc attribute	29	menu_docattribute
238	Can list doc attribute	29	list_docattribute
239	Can config doc attribute	29	config_docattribute
240	Can customize doc attribute	29	custom_docattribute
241	Can see on menu capacity	30	menu_capacity
242	Can list capacity	30	list_capacity
243	Can config capacity	30	config_capacity
244	Can customize capacity	30	custom_capacity
245	Can see on menu requirement	31	menu_requirement
246	Can list requirement	31	list_requirement
247	Can config requirement	31	config_requirement
248	Can customize requirement	31	custom_requirement
249	Can see on menu artefact	32	menu_artefact
250	Can list artefact	32	list_artefact
251	Can config artefact	32	config_artefact
252	Can customize artefact	32	custom_artefact
253	Can see on menu artefact composition	33	menu_artefactcomposition
254	Can list artefact composition	33	list_artefactcomposition
255	Can config artefact composition	33	config_artefactcomposition
256	Can customize artefact composition	33	custom_artefactcomposition
257	Can see on menu artefact requirement	34	menu_artefactrequirement
258	Can list artefact requirement	34	list_artefactrequirement
259	Can config artefact requirement	34	config_artefactrequirement
260	Can customize artefact requirement	34	custom_artefactrequirement
261	Can see on menu artefact capacity	35	menu_artefactcapacity
262	Can list artefact capacity	35	list_artefactcapacity
263	Can config artefact capacity	35	config_artefactcapacity
264	Can customize artefact capacity	35	custom_artefactcapacity
265	Can see on menu projet	36	menu_projet
266	Can list projet	36	list_projet
267	Can config projet	36	config_projet
268	Can customize projet	36	custom_projet
269	Can see on menu project artefact	37	menu_projectartefact
270	Can list project artefact	37	list_projectartefact
271	Can config project artefact	37	config_projectartefact
272	Can customize project artefact	37	custom_projectartefact
273	Can see on menu project capacity	38	menu_projectcapacity
274	Can list project capacity	38	list_projectcapacity
275	Can config project capacity	38	config_projectcapacity
276	Can customize project capacity	38	custom_projectcapacity
277	Can see on menu project requirement	39	menu_projectrequirement
278	Can list project requirement	39	list_projectrequirement
279	Can config project requirement	39	config_projectrequirement
280	Can customize project requirement	39	custom_projectrequirement
281	Can see on menu source	40	menu_source
282	Can list source	40	list_source
283	Can config source	40	config_source
284	Can customize source	40	custom_source
285	Can see on menu artefact source	41	menu_artefactsource
286	Can list artefact source	41	list_artefactsource
287	Can config artefact source	41	config_artefactsource
288	Can customize artefact source	41	custom_artefactsource
289	Can add Tag	42	add_tag
290	Can change Tag	42	change_tag
291	Can delete Tag	42	delete_tag
292	Can add Tagged Item	43	add_taggeditem
293	Can change Tagged Item	43	change_taggeditem
294	Can delete Tagged Item	43	delete_taggeditem
295	Can see on menu Tag	42	menu_tag
296	Can list Tag	42	list_tag
297	Can config Tag	42	config_tag
298	Can customize Tag	42	custom_tag
299	Can see on menu Tagged Item	43	menu_taggeditem
300	Can list Tagged Item	43	list_taggeditem
301	Can config Tagged Item	43	config_taggeditem
302	Can customize Tagged Item	43	custom_taggeditem
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('auth_permission_id_seq', 302, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$20000$nnVub1JTCigy$x4HeKWvpZCy41R4caFgsEKl/E1fkDhe5QOOy/vQ8jFo=	2016-10-20 23:40:40.105+00	t	daniel			daniel@pascot.ca	t	t	2015-06-10 20:44:37.692+00
7	pbkdf2_sha256$20000$ZS206WwNzyIZ$P97sObGAzg2dE7N1eUFUwd8FsFOjh/BqM0yTAydnb+g=	2016-06-15 04:00:00+00	t	miguel	Miguel	Ross	miguelross762@gmail.com	t	t	2016-06-15 14:40:28.437+00
15	pbkdf2_sha256$20000$yCJdVHC8R8Eq$pXtvhalZf2o16jg9xHZCfUExT5GGZh04kksB+8yP9Oc=	2016-12-15 00:28:07.725+00	t	patrick			patrick.boisvert@retraitequebec.gouv.qc.ca	t	t	2016-12-15 00:00:51.949+00
1	pbkdf2_sha256$20000$4jspXguBDS99$xcd9Sqjhl6HeAUx33Q9darN8g/E3teNT9cGmbk4BP8E=	2017-11-17 18:13:42.550135+00	t	dario			dariogomezt@gmail.com	t	t	2015-06-10 17:07:45+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
2	4	1
3	7	1
4	15	1
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 4, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('auth_user_id_seq', 15, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	protoLib	teamhierarchy
8	protoLib	userprofile
9	protoLib	entitymap
10	protoLib	logger
11	protoLib	contextvar
12	protoLib	contextentity
13	protoLib	contextuser
14	protoExt	parameters
15	protoExt	viewdefinition
16	protoExt	customdefinition
17	prototype	protoversiontitle
18	prototype	project
19	prototype	model
20	prototype	entity
21	prototype	property
22	prototype	relationship
23	prototype	propertyequivalence
24	prototype	prototype
25	prototype	prototable
26	prototype	diagram
27	prototype	diagramentity
28	rai01ref	doctype
29	rai01ref	docattribute
30	rai01ref	capacity
31	rai01ref	requirement
32	rai01ref	artefact
33	rai01ref	artefactcomposition
34	rai01ref	artefactrequirement
35	rai01ref	artefactcapacity
36	rai01ref	projet
37	rai01ref	projectartefact
38	rai01ref	projectcapacity
39	rai01ref	projectrequirement
40	rai01ref	source
41	rai01ref	artefactsource
42	taggit	tag
43	taggit	taggeditem
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('django_content_type_id_seq', 43, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-11-14 20:29:47.080615+00
2	auth	0001_initial	2017-11-14 20:29:47.21306+00
3	admin	0001_initial	2017-11-14 20:29:47.251666+00
4	contenttypes	0002_remove_content_type_name	2017-11-14 20:29:47.304755+00
5	auth	0002_alter_permission_name_max_length	2017-11-14 20:29:47.325423+00
6	auth	0003_alter_user_email_max_length	2017-11-14 20:29:47.346621+00
7	auth	0004_alter_user_username_opts	2017-11-14 20:29:47.365788+00
8	auth	0005_alter_user_last_login_null	2017-11-14 20:29:47.386802+00
9	auth	0006_require_contenttypes_0002	2017-11-14 20:29:47.391346+00
10	protoLib	0001_initial	2017-11-14 20:29:48.212367+00
11	protoExt	0001_initial	2017-11-14 20:29:48.509416+00
12	taggit	0001_initial	2017-11-14 20:29:48.600274+00
13	prototype	0001_initial	2017-11-14 20:29:53.363824+00
14	rai01ref	0001_initial	2017-11-14 20:30:02.938962+00
15	rai01ref	0002_auto_20160428_0958	2017-11-14 20:30:04.906847+00
16	rai01ref	0003_auto_20170822_1029	2017-11-14 20:30:06.350108+00
17	rai01ref	0004_auto_20171114_1505	2017-11-14 20:30:06.506484+00
18	sessions	0001_initial	2017-11-14 20:30:06.541378+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('django_migrations_id_seq', 18, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
1sojpcjy969c0m73iz3h1rsko7vzm2pp	MTg1NGZkZjkxYmZmYmFiMDcyMmM0MTRjYTMzNzNlZjFmZjgwZDU2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-10-21 18:37:32.852+00
4h0uluu87b92t66q0ni71q9csd2nvz10	MTg1NGZkZjkxYmZmYmFiMDcyMmM0MTRjYTMzNzNlZjFmZjgwZDU2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-06-30 16:01:05.875+00
68bmth69ysjd16wi3e7eh3116u7dyecv	Y2QzOTAyZjljMDE3OTg3MjNlYjNhNzFlMGRkYzY4MDI3ZDkwMmY0YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYmUzNmQwYjdiZTRhOWJhNDc0MDJhNjAwN2QzYjM1YTA5Y2FjYTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-10-27 23:28:03.261+00
6mchpg2ixwz9jipg3wf4ek99wf6gawx2	MTg1NGZkZjkxYmZmYmFiMDcyMmM0MTRjYTMzNzNlZjFmZjgwZDU2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-21 23:18:08.154+00
778tcaddkpttsw4l6d3d6ggvih47w60w	M2I5Y2FlZTQ4YTdkMGFmMzU1NzkzOGZhMmM4MTE5NDQ4YTg0OGNmMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYmUzNmQwYjdiZTRhOWJhNDc0MDJhNjAwN2QzYjM1YTA5Y2FjYTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-10-25 14:48:55.082+00
c3ae4nxae0n1swek0fqe9557gsjyh4la	NWVmMDExZmMzNzZiZDI5MDA4Zjg3ZjRjMTdhNWNkY2E0MjdmYTA3Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkM2JlMzZkMGI3YmU0YTliYTQ3NDAyYTYwMDdkM2IzNWEwOWNhY2E5In0=	2017-09-18 15:15:24.206+00
ce6mckuqv3t0mf47yrpd2koayohw7mdn	MTg1NGZkZjkxYmZmYmFiMDcyMmM0MTRjYTMzNzNlZjFmZjgwZDU2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-10-28 18:14:51.838+00
dvlcchkmgs9j4p1o97qnfhf7yrtu9guv	Y2QzOTAyZjljMDE3OTg3MjNlYjNhNzFlMGRkYzY4MDI3ZDkwMmY0YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYmUzNmQwYjdiZTRhOWJhNDc0MDJhNjAwN2QzYjM1YTA5Y2FjYTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-26 16:16:17.889+00
eolr19jjdakiq8j1ivv40wd9uo7art3m	MTg1NGZkZjkxYmZmYmFiMDcyMmM0MTRjYTMzNzNlZjFmZjgwZDU2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-04-24 16:33:36.101+00
fpvk99cfl7jvw03qh7i98o91expl0me8	M2I5Y2FlZTQ4YTdkMGFmMzU1NzkzOGZhMmM4MTE5NDQ4YTg0OGNmMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYmUzNmQwYjdiZTRhOWJhNDc0MDJhNjAwN2QzYjM1YTA5Y2FjYTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-09-09 19:27:00.867+00
ibuvse9w5fbxev20w1wdxrlv9s9ecc94	MzY3Njc5MDI3M2E1MDhkZmVkYzIyMmYyYjIxMTE0ZWQwZTFkZmJiMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2JlMzZkMGI3YmU0YTliYTQ3NDAyYTYwMDdkM2IzNWEwOWNhY2E5In0=	2016-11-20 18:40:59.87+00
l450um8x0m310bkxq8w2rvwieh487wqy	ZGIxOTMwM2NjZTI5MDA3ZDNmNzJmNjg3Y2RmNGE1M2U4ZWRlNjQxNzp7fQ==	2016-10-16 23:35:38.499+00
l51v6tmxtoajx6axx0mknxhc78wyf94i	M2I5Y2FlZTQ4YTdkMGFmMzU1NzkzOGZhMmM4MTE5NDQ4YTg0OGNmMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYmUzNmQwYjdiZTRhOWJhNDc0MDJhNjAwN2QzYjM1YTA5Y2FjYTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-02-15 15:40:55.955+00
lo993x3ylxhwye22up0787dbcsqcbgaf	NWVmMDExZmMzNzZiZDI5MDA4Zjg3ZjRjMTdhNWNkY2E0MjdmYTA3Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkM2JlMzZkMGI3YmU0YTliYTQ3NDAyYTYwMDdkM2IzNWEwOWNhY2E5In0=	2016-09-07 00:24:11.523+00
nncncuypxmyi9rr5r4hksggxonnsthcp	M2I5Y2FlZTQ4YTdkMGFmMzU1NzkzOGZhMmM4MTE5NDQ4YTg0OGNmMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYmUzNmQwYjdiZTRhOWJhNDc0MDJhNjAwN2QzYjM1YTA5Y2FjYTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-10-16 20:58:59.751+00
p6qv7aar8pxcqiiq7cb4f2vsoyp97o1f	MDYwMDg5ZWE5OGJkNmJhMDlhYzAyNGQ4NmE3MDNiMWU1MjIwZTQ1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-09-15 15:12:12.324+00
prv398q7jh53xwsghe4fcjcym19p9csy	MDYwMDg5ZWE5OGJkNmJhMDlhYzAyNGQ4NmE3MDNiMWU1MjIwZTQ1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-11-28 18:03:20.065+00
qln7j9l88h5s42da97w6933wdhorqp9f	M2I5Y2FlZTQ4YTdkMGFmMzU1NzkzOGZhMmM4MTE5NDQ4YTg0OGNmMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYmUzNmQwYjdiZTRhOWJhNDc0MDJhNjAwN2QzYjM1YTA5Y2FjYTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-10-31 14:13:27.856+00
qto70qhw54sscuzn2oq2ud0ka2f38xba	MDYwMDg5ZWE5OGJkNmJhMDlhYzAyNGQ4NmE3MDNiMWU1MjIwZTQ1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-09-21 15:52:31.003+00
rsjb4ef1pjbbfst0lg05u9c6zo5waqnk	MTg1NGZkZjkxYmZmYmFiMDcyMmM0MTRjYTMzNzNlZjFmZjgwZDU2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-10-21 14:25:17.817+00
tgkk58rnnisv8r5obqdzk7fzv065awm5	MTg1NGZkZjkxYmZmYmFiMDcyMmM0MTRjYTMzNzNlZjFmZjgwZDU2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-04-24 15:56:34.718+00
v2utu90xjf3hybmkz77oble645ee7zl9	ZGY4ZTE4ZTY1MmMyMGU3NDcyN2M3MzYxZjViMWMxNTg0YWI5MGE1MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjN2Q0NTZmOThmYmRkNGY4OWQ1YmRlMDVhYmE5ZmNhYWVjMGJhNTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9	2016-12-29 00:28:07.964+00
vagvaqg0xbskxdww6jv12e4km48k4r8g	Y2QzOTAyZjljMDE3OTg3MjNlYjNhNzFlMGRkYzY4MDI3ZDkwMmY0YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYmUzNmQwYjdiZTRhOWJhNDc0MDJhNjAwN2QzYjM1YTA5Y2FjYTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-29 14:15:17.833+00
wzupjgko6677g2khn7d7dmps46n4vshv	MzY3Njc5MDI3M2E1MDhkZmVkYzIyMmYyYjIxMTE0ZWQwZTFkZmJiMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2JlMzZkMGI3YmU0YTliYTQ3NDAyYTYwMDdkM2IzNWEwOWNhY2E5In0=	2016-11-07 16:48:24.829+00
xpeks3xhy4px4zrqrxaal7nyblezow8e	MTg1NGZkZjkxYmZmYmFiMDcyMmM0MTRjYTMzNzNlZjFmZjgwZDU2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNiZTM2ZDBiN2JlNGE5YmE0NzQwMmE2MDA3ZDNiMzVhMDljYWNhOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-08 22:19:03.943+00
ykwe6pymmh7rtbp192nzilzhc3zkzcl2	NWVmMDExZmMzNzZiZDI5MDA4Zjg3ZjRjMTdhNWNkY2E0MjdmYTA3Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkM2JlMzZkMGI3YmU0YTliYTQ3NDAyYTYwMDdkM2IzNWEwOWNhY2E5In0=	2016-05-19 22:15:02.951+00
zkkczwlpuampi7vmle76kb237cjihc7d	NWVmMDExZmMzNzZiZDI5MDA4Zjg3ZjRjMTdhNWNkY2E0MjdmYTA3Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkM2JlMzZkMGI3YmU0YTliYTQ3NDAyYTYwMDdkM2IzNWEwOWNhY2E5In0=	2016-11-22 15:00:09.005+00
6uqquupz59vn5qi1y4k9ms4v1xyk7ni2	MzY3Njc5MDI3M2E1MDhkZmVkYzIyMmYyYjIxMTE0ZWQwZTFkZmJiMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2JlMzZkMGI3YmU0YTliYTQ3NDAyYTYwMDdkM2IzNWEwOWNhY2E5In0=	2017-11-28 20:31:32.297459+00
f1o76z5jhwtx4y3t7k5sw7o90lywtmmj	N2Y2Y2M4ZGQ3MmMwMjI1OWY4YjE1NWU4ODRhYzgzZGY0ZGE2MWIwNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmFmNjhiY2MxMzYzNDYyMDQ2MDdjOTk4NWI0ZTNhMDdlZTc1MTZjIn0=	2017-12-01 18:13:42.563988+00
\.


--
-- Data for Name: protoExt_customdefinition; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoExt_customdefinition" (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", code, description, active, "overWrite", "metaDefinition", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
5	__menu	\N	\N	2015-06-22 01:33:43.908+00	2017-09-13 17:53:52.662+00	49648fb1-d776-498e-90c6-def3ab3ab757	__menu	Menu	t	f	[{"id": "protoMenu-ext-5381", "leaf": false, "qtip": "", "text": "Design prototypes", "index": 0, "qtitle": "", "iconCls": "", "children": [{"id": "protoMenu-ext-5382", "leaf": true, "qtip": "", "text": "Domaines", "index": 0, "qtitle": "", "iconCls": "icon-1", "children": [], "expanded": false, "viewCode": "prototype.Project"}, {"id": "protoMenu-ext-5383", "leaf": true, "qtip": "", "text": "Modèles", "index": 1, "qtitle": "", "iconCls": "icon-1", "children": [], "expanded": false, "viewCode": "prototype.Model"}, {"id": "protoMenu-ext-5384", "leaf": true, "qtip": "", "text": "Entités", "index": 2, "qtitle": "", "iconCls": "icon-1", "children": [], "expanded": false, "viewCode": "prototype.Entity"}, {"id": "protoMenu-ext-5385", "leaf": true, "qtip": "", "text": "Données", "index": 3, "qtitle": "", "iconCls": "icon-1", "children": [], "expanded": false, "viewCode": "prototype.Property"}, {"id": "protoMenu-ext-5386", "leaf": true, "qtip": "", "text": "Connecteurs", "index": 4, "qtitle": "", "iconCls": "icon-1", "children": [], "expanded": false, "viewCode": "prototype.Relationship"}], "expanded": true, "viewCode": "Softmachine.view.main.MenuTreeModel-1"}, {"id": "protoMenu-ext-5387", "leaf": false, "qtip": "", "text": "Proto PIAFS", "index": 1, "qtitle": "", "iconCls": "", "children": [{"id": "protoMenu-ext-5388", "leaf": false, "qtip": "", "text": "Transactions", "index": 0, "qtitle": "", "iconCls": "", "children": [{"id": "protoMenu-ext-5389", "leaf": true, "qtip": "", "text": "Module groupes", "index": 0, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-groupes"}, {"id": "protoMenu-ext-5390", "leaf": true, "qtip": "", "text": "Module familles", "index": 1, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-familles"}], "expanded": true, "viewCode": "Softmachine.view.main.MenuTreeModel-1081"}, {"id": "protoMenu-ext-5391", "leaf": false, "qtip": "", "text": "Opérations", "index": 1, "qtitle": "", "iconCls": "", "children": [{"id": "protoMenu-ext-5392", "leaf": true, "qtip": "", "text": "Installation", "index": 0, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-installations"}, {"id": "protoMenu-ext-5393", "leaf": true, "qtip": "", "text": "Composante", "index": 1, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-composantes"}, {"id": "protoMenu-ext-5394", "leaf": true, "qtip": "", "text": "Opération Groupe", "index": 2, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-operations-groupe"}, {"id": "protoMenu-ext-5395", "leaf": true, "qtip": "", "text": "Opération famille", "index": 3, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-operations-famille"}], "expanded": true, "viewCode": "Softmachine.view.main.MenuTreeModel-1083"}, {"id": "protoMenu-ext-5396", "leaf": false, "qtip": "", "text": "Traitements", "index": 2, "qtitle": "", "iconCls": "", "children": [{"id": "protoMenu-ext-5397", "leaf": true, "qtip": "", "text": "Ffactures groupes", "index": 0, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-factures-groupe"}, {"id": "protoMenu-ext-5398", "leaf": true, "qtip": "", "text": "Factures familles", "index": 1, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-factures-familles"}], "expanded": true, "viewCode": "Softmachine.view.main.MenuTreeModel-1084"}, {"id": "protoMenu-ext-5399", "leaf": false, "qtip": "", "text": "Paramètres", "index": 3, "qtitle": "", "iconCls": "", "children": [{"id": "protoMenu-ext-5400", "leaf": true, "qtip": "", "text": "Fiche type composante ", "index": 0, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-types-composantes"}, {"id": "protoMenu-ext-5401", "leaf": true, "qtip": "", "text": "Fiche type opération", "index": 1, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-types-operations"}, {"id": "protoMenu-ext-5402", "leaf": true, "qtip": "", "text": "Fiche Opérateur", "index": 2, "qtitle": "", "iconCls": "icon-proto", "children": [], "expanded": false, "viewCode": "prototype.ProtoTable.piafs-d-operateurs"}], "expanded": true, "viewCode": "Softmachine.view.main.MenuTreeModel-1082"}], "expanded": true, "viewCode": "Softmachine.view.main.MenuTreeModel-1080"}, {"id": "prototype.auto.nodes", "leaf": false, "text": "AutoMenu", "index": 1000, "children": [{"text": "admin", "index": 1, "children": [{"leaf": true, "text": "Log Entry", "index": 1, "iconCls": "icon-1", "viewCode": "admin.LogEntry"}], "expanded": false}, {"text": "auth", "index": 2, "children": [{"leaf": true, "text": "Permission", "index": 2, "iconCls": "icon-1", "viewCode": "auth.Permission"}, {"leaf": true, "text": "Group-Permission Relationship", "index": 3, "iconCls": "icon-1", "viewCode": "auth.Group_permissions"}, {"leaf": true, "text": "Group", "index": 4, "iconCls": "icon-1", "viewCode": "auth.Group"}, {"leaf": true, "text": "User-Group Relationship", "index": 5, "iconCls": "icon-1", "viewCode": "auth.User_groups"}, {"leaf": true, "text": "User-Permission Relationship", "index": 6, "iconCls": "icon-1", "viewCode": "auth.User_user_permissions"}, {"leaf": true, "text": "User", "index": 7, "iconCls": "icon-1", "viewCode": "auth.User"}, {"leaf": true, "text": "Content Type", "index": 8, "iconCls": "icon-1", "viewCode": "contenttypes.ContentType"}], "expanded": false}, {"text": "sessions", "index": 3, "children": [{"leaf": true, "text": "Session", "index": 9, "iconCls": "icon-1", "viewCode": "sessions.Session"}], "expanded": false}, {"text": "protoLib", "index": 4, "children": [{"leaf": true, "text": "Team Hierarchy", "index": 10, "iconCls": "icon-1", "viewCode": "protoLib.TeamHierarchy"}, {"leaf": true, "text": "User Profile", "index": 11, "iconCls": "icon-1", "viewCode": "protoLib.UserProfile"}, {"leaf": true, "text": "Entity Map", "index": 12, "iconCls": "icon-1", "viewCode": "protoLib.EntityMap"}, {"leaf": true, "text": "Logger", "index": 13, "iconCls": "icon-1", "viewCode": "protoLib.Logger"}, {"leaf": true, "text": "Context Var", "index": 14, "iconCls": "icon-1", "viewCode": "protoLib.ContextVar"}, {"leaf": true, "text": "Context Entity", "index": 15, "iconCls": "icon-1", "viewCode": "protoLib.ContextEntity"}, {"leaf": true, "text": "Context User", "index": 16, "iconCls": "icon-1", "viewCode": "protoLib.ContextUser"}], "expanded": false}, {"text": "protoExt", "index": 5, "children": [{"leaf": true, "text": "Parameters", "index": 17, "iconCls": "icon-1", "viewCode": "protoExt.Parameters"}, {"leaf": true, "text": "View Definition", "index": 18, "iconCls": "icon-1", "viewCode": "protoExt.ViewDefinition"}, {"leaf": true, "text": "Custom Definition", "index": 19, "iconCls": "icon-1", "viewCode": "protoExt.CustomDefinition"}], "expanded": false}, {"text": "prototype", "index": 6, "children": [{"leaf": true, "text": "Proto Version Title", "index": 20, "iconCls": "icon-1", "viewCode": "prototype.ProtoVersionTitle"}, {"leaf": true, "text": "Project", "index": 21, "iconCls": "icon-1", "viewCode": "prototype.Project"}, {"leaf": true, "text": "Model", "index": 22, "iconCls": "icon-1", "viewCode": "prototype.Model"}, {"leaf": true, "text": "Entity", "index": 23, "iconCls": "icon-1", "viewCode": "prototype.Entity"}, {"leaf": true, "text": "Property", "index": 24, "iconCls": "icon-1", "viewCode": "prototype.Property"}, {"leaf": true, "text": "Relationship", "index": 25, "iconCls": "icon-1", "viewCode": "prototype.Relationship"}, {"leaf": true, "text": "Property Equivalence", "index": 26, "iconCls": "icon-1", "viewCode": "prototype.PropertyEquivalence"}, {"leaf": true, "text": "Prototype", "index": 27, "iconCls": "icon-1", "viewCode": "prototype.Prototype"}, {"leaf": true, "text": "Proto Table", "index": 28, "iconCls": "icon-1", "viewCode": "prototype.ProtoTable"}, {"leaf": true, "text": "Diagram", "index": 29, "iconCls": "icon-1", "viewCode": "prototype.Diagram"}, {"leaf": true, "text": "Diagram Entity", "index": 30, "iconCls": "icon-1", "viewCode": "prototype.DiagramEntity"}], "expanded": false}, {"text": "rai01ref", "index": 7, "children": [{"leaf": true, "text": "Doc Type", "index": 31, "iconCls": "icon-1", "viewCode": "rai01ref.DocType"}, {"leaf": true, "text": "Doc Attribute", "index": 32, "iconCls": "icon-1", "viewCode": "rai01ref.DocAttribute"}, {"leaf": true, "text": "Capacity", "index": 33, "iconCls": "icon-1", "viewCode": "rai01ref.Capacity"}, {"leaf": true, "text": "Requirement", "index": 34, "iconCls": "icon-1", "viewCode": "rai01ref.Requirement"}, {"leaf": true, "text": "Artefact", "index": 35, "iconCls": "icon-1", "viewCode": "rai01ref.Artefact"}, {"leaf": true, "text": "Artefact Composition", "index": 36, "iconCls": "icon-1", "viewCode": "rai01ref.ArtefactComposition"}, {"leaf": true, "text": "Artefact Requirement", "index": 37, "iconCls": "icon-1", "viewCode": "rai01ref.ArtefactRequirement"}, {"leaf": true, "text": "Artefact Capacity", "index": 38, "iconCls": "icon-1", "viewCode": "rai01ref.ArtefactCapacity"}, {"leaf": true, "text": "Projet", "index": 39, "iconCls": "icon-1", "viewCode": "rai01ref.Projet"}, {"leaf": true, "text": "Project Artefact", "index": 40, "iconCls": "icon-1", "viewCode": "rai01ref.ProjectArtefact"}, {"leaf": true, "text": "Project Capacity", "index": 41, "iconCls": "icon-1", "viewCode": "rai01ref.ProjectCapacity"}, {"leaf": true, "text": "Project Requirement", "index": 42, "iconCls": "icon-1", "viewCode": "rai01ref.ProjectRequirement"}, {"leaf": true, "text": "Source", "index": 43, "iconCls": "icon-1", "viewCode": "rai01ref.Source"}, {"leaf": true, "text": "Artefact Source", "index": 44, "iconCls": "icon-1", "viewCode": "rai01ref.ArtefactSource"}], "expanded": false}, {"text": "taggit", "index": 8, "children": [{"leaf": true, "text": "Tag", "index": 45, "iconCls": "icon-1", "viewCode": "taggit.Tag"}, {"leaf": true, "text": "Tagged Item", "index": 46, "iconCls": "icon-1", "viewCode": "taggit.TaggedItem"}], "expanded": false}, {"leaf": false, "text": "ProtoViews", "index": 2000, "children": [{"leaf": false, "text": "prototype", "index": 0, "children": [{"leaf": false, "text": "Diagram", "index": 1, "children": [{"leaf": true, "text": "prototype.Diagram", "index": 0, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Diagram"}], "expanded": false}, {"leaf": false, "text": "Prototype", "index": 4, "children": [{"leaf": true, "text": "prototype.Prototype", "index": 2, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Prototype"}, {"leaf": true, "text": "prototype.Prototype.1", "index": 58, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Prototype.1"}], "expanded": false}, {"leaf": false, "text": "PropertyEquivalence", "index": 5, "children": [{"leaf": true, "text": "prototype.PropertyEquivalence", "index": 3, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.PropertyEquivalence"}], "expanded": false}, {"leaf": false, "text": "DiagramEntity", "index": 6, "children": [{"leaf": true, "text": "prototype.DiagramEntity", "index": 4, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.DiagramEntity"}], "expanded": false}, {"leaf": false, "text": "ProtoTable", "index": 8, "children": [{"leaf": true, "text": "prototype.ProtoTable", "index": 6, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.ProtoTable"}], "expanded": false}, {"leaf": false, "text": "Model", "index": 13, "children": [{"leaf": true, "text": "prototype.Model", "index": 9, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Model"}], "expanded": false}, {"leaf": false, "text": "Entity", "index": 14, "children": [{"leaf": true, "text": "prototype.Entity", "index": 10, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Entity"}, {"leaf": true, "text": "prototype.Entity.nv-prop", "index": 26, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Entity.nv-prop"}], "expanded": false}, {"leaf": false, "text": "Property", "index": 15, "children": [{"leaf": true, "text": "prototype.Property", "index": 11, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Property"}], "expanded": false}, {"leaf": false, "text": "Project", "index": 23, "children": [{"leaf": true, "text": "prototype.Project", "index": 16, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Project"}], "expanded": false}, {"leaf": false, "text": "ProtoVersionTitle", "index": 25, "children": [{"leaf": true, "text": "prototype.ProtoVersionTitle", "index": 18, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.ProtoVersionTitle"}], "expanded": false}, {"leaf": false, "text": "Relationship", "index": 53, "children": [{"leaf": true, "text": "prototype.Relationship", "index": 57, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Relationship"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "protoExt", "index": 2, "children": [{"leaf": false, "text": "CustomDefinition", "index": 3, "children": [{"leaf": true, "text": "protoExt.CustomDefinition", "index": 1, "iconCls": "icon-1", "expanded": true, "viewCode": "protoExt.CustomDefinition"}], "expanded": false}, {"leaf": false, "text": "ViewDefinition", "index": 7, "children": [{"leaf": true, "text": "protoExt.ViewDefinition", "index": 5, "iconCls": "icon-1", "expanded": true, "viewCode": "protoExt.ViewDefinition"}], "expanded": false}, {"leaf": false, "text": "Parameters", "index": 33, "children": [{"leaf": true, "text": "protoExt.Parameters", "index": 27, "iconCls": "icon-1", "expanded": true, "viewCode": "protoExt.Parameters"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "auth", "index": 9, "children": [{"leaf": false, "text": "User", "index": 10, "children": [{"leaf": true, "text": "auth.User", "index": 7, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.User"}], "expanded": false}, {"leaf": false, "text": "Permission", "index": 20, "children": [{"leaf": true, "text": "auth.Permission", "index": 14, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.Permission"}], "expanded": false}, {"leaf": false, "text": "Group", "index": 29, "children": [{"leaf": true, "text": "auth.Group", "index": 22, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.Group"}], "expanded": false}, {"leaf": false, "text": "Group_permissions", "index": 30, "children": [{"leaf": true, "text": "auth.Group_permissions", "index": 23, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.Group_permissions"}], "expanded": false}, {"leaf": false, "text": "User_groups", "index": 31, "children": [{"leaf": true, "text": "auth.User_groups", "index": 24, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.User_groups"}], "expanded": false}, {"leaf": false, "text": "User_user_permissions", "index": 51, "children": [{"leaf": true, "text": "auth.User_user_permissions", "index": 55, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.User_user_permissions"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "admin", "index": 11, "children": [{"leaf": false, "text": "LogEntry", "index": 12, "children": [{"leaf": true, "text": "admin.LogEntry", "index": 8, "iconCls": "icon-1", "expanded": true, "viewCode": "admin.LogEntry"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "protoLib", "index": 16, "children": [{"leaf": false, "text": "EntityMap", "index": 17, "children": [{"leaf": true, "text": "protoLib.EntityMap", "index": 12, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.EntityMap"}], "expanded": false}, {"leaf": false, "text": "ContextUser", "index": 24, "children": [{"leaf": true, "text": "protoLib.ContextUser", "index": 17, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.ContextUser"}], "expanded": false}, {"leaf": false, "text": "ContextVar", "index": 26, "children": [{"leaf": true, "text": "protoLib.ContextVar", "index": 19, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.ContextVar"}], "expanded": false}, {"leaf": false, "text": "ContextEntity", "index": 27, "children": [{"leaf": true, "text": "protoLib.ContextEntity", "index": 20, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.ContextEntity"}], "expanded": false}, {"leaf": false, "text": "TeamHierarchy", "index": 28, "children": [{"leaf": true, "text": "protoLib.TeamHierarchy", "index": 21, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.TeamHierarchy"}], "expanded": false}, {"leaf": false, "text": "UserProfile", "index": 32, "children": [{"leaf": true, "text": "protoLib.UserProfile", "index": 25, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.UserProfile"}], "expanded": false}, {"leaf": false, "text": "Logger", "index": 50, "children": [{"leaf": true, "text": "protoLib.Logger", "index": 54, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.Logger"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "taggit", "index": 18, "children": [{"leaf": false, "text": "TaggedItem", "index": 19, "children": [{"leaf": true, "text": "taggit.TaggedItem", "index": 13, "iconCls": "icon-1", "expanded": true, "viewCode": "taggit.TaggedItem"}], "expanded": false}, {"leaf": false, "text": "Tag", "index": 52, "children": [{"leaf": true, "text": "taggit.Tag", "index": 56, "iconCls": "icon-1", "expanded": true, "viewCode": "taggit.Tag"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "contenttypes", "index": 21, "children": [{"leaf": false, "text": "ContentType", "index": 22, "children": [{"leaf": true, "text": "contenttypes.ContentType", "index": 15, "iconCls": "icon-1", "expanded": true, "viewCode": "contenttypes.ContentType"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "rai01ref", "index": 34, "children": [{"leaf": false, "text": "DocType", "index": 35, "children": [{"leaf": true, "text": "rai01ref.DocType", "index": 28, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.DocType"}], "expanded": false}, {"leaf": false, "text": "Artefact", "index": 36, "children": [{"leaf": true, "text": "rai01ref.Artefact", "index": 29, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact"}, {"leaf": true, "text": "rai01ref.Artefact.tree", "index": 33, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.tree"}, {"leaf": true, "text": "rai01ref.Artefact.71", "index": 41, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.71"}, {"leaf": true, "text": "rai01ref.Artefact.77", "index": 43, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.77"}, {"leaf": true, "text": "rai01ref.Artefact.78", "index": 44, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.78"}, {"leaf": true, "text": "rai01ref.Artefact.74", "index": 48, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.74"}, {"leaf": true, "text": "rai01ref.Artefact.79", "index": 50, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.79"}], "expanded": false}, {"leaf": false, "text": "Requirement", "index": 37, "children": [{"leaf": true, "text": "rai01ref.Requirement", "index": 30, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Requirement"}, {"leaf": true, "text": "rai01ref.Requirement.tree", "index": 35, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Requirement.tree"}], "expanded": false}, {"leaf": false, "text": "DocAttribute", "index": 38, "children": [{"leaf": true, "text": "rai01ref.DocAttribute", "index": 31, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.DocAttribute"}], "expanded": false}, {"leaf": false, "text": "Capacity", "index": 39, "children": [{"leaf": true, "text": "rai01ref.Capacity", "index": 32, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity"}, {"leaf": true, "text": "rai01ref.Capacity.tree", "index": 34, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.tree"}, {"leaf": true, "text": "rai01ref.Capacity.75", "index": 46, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.75"}, {"leaf": true, "text": "rai01ref.Capacity.80", "index": 49, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.80"}, {"leaf": true, "text": "rai01ref.Capacity.76", "index": 51, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.76"}, {"leaf": true, "text": "rai01ref.Capacity.81", "index": 52, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.81"}], "expanded": false}, {"leaf": false, "text": "ArtefactComposition", "index": 40, "children": [{"leaf": true, "text": "rai01ref.ArtefactComposition", "index": 36, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ArtefactComposition"}], "expanded": false}, {"leaf": false, "text": "ArtefactRequirement", "index": 41, "children": [{"leaf": true, "text": "rai01ref.ArtefactRequirement", "index": 37, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ArtefactRequirement"}], "expanded": false}, {"leaf": false, "text": "ProjectArtefact", "index": 42, "children": [{"leaf": true, "text": "rai01ref.ProjectArtefact", "index": 38, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ProjectArtefact"}], "expanded": false}, {"leaf": false, "text": "ArtefactCapacity", "index": 43, "children": [{"leaf": true, "text": "rai01ref.ArtefactCapacity", "index": 39, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ArtefactCapacity"}], "expanded": false}, {"leaf": false, "text": "ArtefactSource", "index": 44, "children": [{"leaf": true, "text": "rai01ref.ArtefactSource", "index": 40, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ArtefactSource"}], "expanded": false}, {"leaf": false, "text": "ProjectCapacity", "index": 45, "children": [{"leaf": true, "text": "rai01ref.ProjectCapacity", "index": 42, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ProjectCapacity"}], "expanded": false}, {"leaf": false, "text": "Source", "index": 46, "children": [{"leaf": true, "text": "rai01ref.Source", "index": 45, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Source"}], "expanded": false}, {"leaf": false, "text": "ProjectRequirement", "index": 47, "children": [{"leaf": true, "text": "rai01ref.ProjectRequirement", "index": 47, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ProjectRequirement"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "sessions", "index": 48, "children": [{"leaf": false, "text": "Session", "index": 49, "children": [{"leaf": true, "text": "sessions.Session", "index": 53, "iconCls": "icon-1", "expanded": true, "viewCode": "sessions.Session"}], "expanded": false}], "expanded": false}], "expanded": true}, {"leaf": false, "text": "ProtoOptions", "index": 1000, "children": [{"leaf": false, "text": "Serveurs", "index": 54, "children": [{"leaf": false, "text": "piafs", "index": 55, "children": [{"leaf": false, "text": "Familles", "index": 56, "children": [{"leaf": true, "text": "piafs-familles", "index": 0, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-familles"}, {"leaf": true, "text": "piafs-voir-famille", "index": 15, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-voir-famille"}, {"leaf": true, "text": "piafs-ligne-famille", "index": 30, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-ligne-famille"}, {"leaf": true, "text": "piafs-d-familles", "index": 31, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-familles"}], "expanded": false}, {"leaf": false, "text": "Groupes", "index": 57, "children": [{"leaf": true, "text": "piafs-groupes", "index": 1, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-groupes"}, {"leaf": true, "text": "piafs-d-groupes", "index": 16, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-groupes"}], "expanded": false}, {"leaf": false, "text": "Opérateurs", "index": 58, "children": [{"leaf": true, "text": "piafs-operateurs", "index": 2, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-operateurs"}, {"leaf": true, "text": "piafs-d-operateurs", "index": 17, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-operateurs"}], "expanded": false}, {"leaf": false, "text": "Opérations famille", "index": 59, "children": [{"leaf": true, "text": "piafs-operations-famille", "index": 3, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-operations-famille"}, {"leaf": true, "text": "piafs-d-operations-famille", "index": 18, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-operations-famille"}], "expanded": false}, {"leaf": false, "text": "Factures famille", "index": 60, "children": [{"leaf": true, "text": "piafs-factures-famille", "index": 4, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-factures-famille"}, {"leaf": true, "text": "piafs-d-factures-familles", "index": 19, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-factures-familles"}], "expanded": false}, {"leaf": false, "text": "Facture groupe", "index": 61, "children": [{"leaf": true, "text": "piafs-facture-groupe", "index": 5, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-facture-groupe"}, {"leaf": true, "text": "piafs-d-factures-groupe", "index": 20, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-factures-groupe"}], "expanded": false}, {"leaf": false, "text": "Opérations groupe", "index": 62, "children": [{"leaf": true, "text": "piafs-operations-groupe", "index": 6, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-operations-groupe"}, {"leaf": true, "text": "piafs-d-operations-groupe", "index": 21, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-operations-groupe"}], "expanded": false}, {"leaf": false, "text": "Clauses", "index": 63, "children": [{"leaf": true, "text": "piafs-clauses", "index": 7, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-clauses"}, {"leaf": true, "text": "piafs-d-clauses", "index": 32, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-clauses"}], "expanded": false}, {"leaf": false, "text": "Lignes contrat", "index": 64, "children": [{"leaf": true, "text": "piafs-lignes-contrat", "index": 8, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-lignes-contrat"}, {"leaf": true, "text": "piafs-d-lignes-contrat", "index": 22, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-lignes-contrat"}], "expanded": false}, {"leaf": false, "text": "Types opération", "index": 65, "children": [{"leaf": true, "text": "piafs-types-operation", "index": 9, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-types-operation"}, {"leaf": true, "text": "piafs-d-types-operations", "index": 23, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-types-operations"}], "expanded": false}, {"leaf": false, "text": "Lignes planification", "index": 66, "children": [{"leaf": true, "text": "piafs-lignes-planification", "index": 10, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-lignes-planification"}, {"leaf": true, "text": "piafs-d-lignes-planification", "index": 24, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-lignes-planification"}], "expanded": false}, {"leaf": false, "text": "Installations", "index": 67, "children": [{"leaf": true, "text": "piafs-installations", "index": 11, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-installations"}, {"leaf": true, "text": "piafs-d-installations", "index": 25, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-installations"}], "expanded": false}, {"leaf": false, "text": "Composantes", "index": 68, "children": [{"leaf": true, "text": "piafs-composantes", "index": 12, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-composantes"}, {"leaf": true, "text": "piafs-d-composantes", "index": 26, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-composantes"}, {"leaf": true, "text": "piafs-ligne-composante", "index": 29, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-ligne-composante"}], "expanded": false}, {"leaf": false, "text": "Composantes installées", "index": 69, "children": [{"leaf": true, "text": "piafs-composantes-installees", "index": 13, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-composantes-installees"}, {"leaf": true, "text": "piafs-d-composantes-installees", "index": 28, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-composantes-installees"}], "expanded": false}, {"leaf": false, "text": "Types composante", "index": 70, "children": [{"leaf": true, "text": "piafs-types-composante", "index": 14, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-types-composante"}, {"leaf": true, "text": "piafs-d-types-composantes", "index": 27, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.piafs-d-types-composantes"}], "expanded": false}], "expanded": false}], "expanded": false}], "expanded": true}], "expanded": true}]	1	1	1	1
8	__menu	\N	\N	2016-12-15 00:02:10.948+00	2016-12-15 00:23:38.277+00	c13ee789-1925-43e7-8e15-b7acd90b790b	__menu	Menu	t	f	[{"id": "prototype.auto.nodes", "leaf": false, "text": "AutoMenu", "index": 1000, "children": [{"text": "admin", "index": 1, "children": [{"leaf": true, "text": "Log Entry", "index": 1, "iconCls": "icon-1", "viewCode": "admin.LogEntry"}], "expanded": false}, {"text": "auth", "index": 2, "children": [{"leaf": true, "text": "Permission", "index": 2, "iconCls": "icon-1", "viewCode": "auth.Permission"}, {"leaf": true, "text": "Group-Permission Relationship", "index": 3, "iconCls": "icon-1", "viewCode": "auth.Group_permissions"}, {"leaf": true, "text": "Group", "index": 4, "iconCls": "icon-1", "viewCode": "auth.Group"}, {"leaf": true, "text": "User-Group Relationship", "index": 5, "iconCls": "icon-1", "viewCode": "auth.User_groups"}, {"leaf": true, "text": "User-Permission Relationship", "index": 6, "iconCls": "icon-1", "viewCode": "auth.User_user_permissions"}, {"leaf": true, "text": "User", "index": 7, "iconCls": "icon-1", "viewCode": "auth.User"}, {"leaf": true, "text": "Content Type", "index": 8, "iconCls": "icon-1", "viewCode": "contenttypes.ContentType"}], "expanded": false}, {"text": "sessions", "index": 3, "children": [{"leaf": true, "text": "Session", "index": 9, "iconCls": "icon-1", "viewCode": "sessions.Session"}], "expanded": false}, {"text": "reversion", "index": 4, "children": [{"leaf": true, "text": "Revision", "index": 10, "iconCls": "icon-1", "viewCode": "reversion.Revision"}, {"leaf": true, "text": "Version", "index": 11, "iconCls": "icon-1", "viewCode": "reversion.Version"}], "expanded": false}, {"text": "protoLib", "index": 5, "children": [{"leaf": true, "text": "Team Hierarchy", "index": 12, "iconCls": "icon-1", "viewCode": "protoLib.TeamHierarchy"}, {"leaf": true, "text": "User Profile", "index": 13, "iconCls": "icon-1", "viewCode": "protoLib.UserProfile"}, {"leaf": true, "text": "Entity Map", "index": 14, "iconCls": "icon-1", "viewCode": "protoLib.EntityMap"}, {"leaf": true, "text": "Logger", "index": 15, "iconCls": "icon-1", "viewCode": "protoLib.Logger"}, {"leaf": true, "text": "Context Var", "index": 16, "iconCls": "icon-1", "viewCode": "protoLib.ContextVar"}, {"leaf": true, "text": "Context Entity", "index": 17, "iconCls": "icon-1", "viewCode": "protoLib.ContextEntity"}, {"leaf": true, "text": "Context User", "index": 18, "iconCls": "icon-1", "viewCode": "protoLib.ContextUser"}], "expanded": false}, {"text": "protoExt", "index": 6, "children": [{"leaf": true, "text": "Parameters", "index": 19, "iconCls": "icon-1", "viewCode": "protoExt.Parameters"}, {"leaf": true, "text": "View Definition", "index": 20, "iconCls": "icon-1", "viewCode": "protoExt.ViewDefinition"}, {"leaf": true, "text": "Custom Definition", "index": 21, "iconCls": "icon-1", "viewCode": "protoExt.CustomDefinition"}], "expanded": false}, {"text": "prototype", "index": 7, "children": [{"leaf": true, "text": "Proto Version Title", "index": 22, "iconCls": "icon-1", "viewCode": "prototype.ProtoVersionTitle"}, {"leaf": true, "text": "Project", "index": 23, "iconCls": "icon-1", "viewCode": "prototype.Project"}, {"leaf": true, "text": "Model", "index": 24, "iconCls": "icon-1", "viewCode": "prototype.Model"}, {"leaf": true, "text": "Entity", "index": 25, "iconCls": "icon-1", "viewCode": "prototype.Entity"}, {"leaf": true, "text": "Property", "index": 26, "iconCls": "icon-1", "viewCode": "prototype.Property"}, {"leaf": true, "text": "Relationship", "index": 27, "iconCls": "icon-1", "viewCode": "prototype.Relationship"}, {"leaf": true, "text": "Property Equivalence", "index": 28, "iconCls": "icon-1", "viewCode": "prototype.PropertyEquivalence"}, {"leaf": true, "text": "Prototype", "index": 29, "iconCls": "icon-1", "viewCode": "prototype.Prototype"}, {"leaf": true, "text": "Proto Table", "index": 30, "iconCls": "icon-1", "viewCode": "prototype.ProtoTable"}, {"leaf": true, "text": "Diagram", "index": 31, "iconCls": "icon-1", "viewCode": "prototype.Diagram"}, {"leaf": true, "text": "Diagram Entity", "index": 32, "iconCls": "icon-1", "viewCode": "prototype.DiagramEntity"}], "expanded": false}, {"text": "rai01ref", "index": 8, "children": [{"leaf": true, "text": "Doc Type", "index": 33, "iconCls": "icon-1", "viewCode": "rai01ref.DocType"}, {"leaf": true, "text": "Doc Attribute", "index": 34, "iconCls": "icon-1", "viewCode": "rai01ref.DocAttribute"}, {"leaf": true, "text": "Capacity", "index": 35, "iconCls": "icon-1", "viewCode": "rai01ref.Capacity"}, {"leaf": true, "text": "Requirement", "index": 36, "iconCls": "icon-1", "viewCode": "rai01ref.Requirement"}, {"leaf": true, "text": "Artefact", "index": 37, "iconCls": "icon-1", "viewCode": "rai01ref.Artefact"}, {"leaf": true, "text": "Artefact Composition", "index": 38, "iconCls": "icon-1", "viewCode": "rai01ref.ArtefactComposition"}, {"leaf": true, "text": "Artefact Requirement", "index": 39, "iconCls": "icon-1", "viewCode": "rai01ref.ArtefactRequirement"}, {"leaf": true, "text": "Artefact Capacity", "index": 40, "iconCls": "icon-1", "viewCode": "rai01ref.ArtefactCapacity"}, {"leaf": true, "text": "Projet", "index": 41, "iconCls": "icon-1", "viewCode": "rai01ref.Projet"}, {"leaf": true, "text": "Project Artefact", "index": 42, "iconCls": "icon-1", "viewCode": "rai01ref.ProjectArtefact"}, {"leaf": true, "text": "Project Capacity", "index": 43, "iconCls": "icon-1", "viewCode": "rai01ref.ProjectCapacity"}, {"leaf": true, "text": "Project Requirement", "index": 44, "iconCls": "icon-1", "viewCode": "rai01ref.ProjectRequirement"}, {"leaf": true, "text": "Source", "index": 45, "iconCls": "icon-1", "viewCode": "rai01ref.Source"}, {"leaf": true, "text": "Artefact Source", "index": 46, "iconCls": "icon-1", "viewCode": "rai01ref.ArtefactSource"}], "expanded": false}, {"text": "taggit", "index": 9, "children": [{"leaf": true, "text": "Tag", "index": 47, "iconCls": "icon-1", "viewCode": "taggit.Tag"}, {"leaf": true, "text": "Tagged Item", "index": 48, "iconCls": "icon-1", "viewCode": "taggit.TaggedItem"}], "expanded": false}, {"leaf": false, "text": "ProtoViews", "index": 2000, "children": [{"leaf": false, "text": "prototype", "index": 314, "children": [{"leaf": false, "text": "Diagram", "index": 315, "children": [{"leaf": true, "text": "prototype.Diagram", "index": 0, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Diagram"}], "expanded": false}, {"leaf": false, "text": "Prototype", "index": 318, "children": [{"leaf": true, "text": "prototype.Prototype", "index": 2, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Prototype"}], "expanded": false}, {"leaf": false, "text": "PropertyEquivalence", "index": 319, "children": [{"leaf": true, "text": "prototype.PropertyEquivalence", "index": 3, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.PropertyEquivalence"}], "expanded": false}, {"leaf": false, "text": "DiagramEntity", "index": 320, "children": [{"leaf": true, "text": "prototype.DiagramEntity", "index": 4, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.DiagramEntity"}], "expanded": false}, {"leaf": false, "text": "ProtoTable", "index": 322, "children": [{"leaf": true, "text": "prototype.ProtoTable", "index": 6, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.ProtoTable"}], "expanded": false}, {"leaf": false, "text": "Model", "index": 329, "children": [{"leaf": true, "text": "prototype.Model", "index": 10, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Model"}], "expanded": false}, {"leaf": false, "text": "Entity", "index": 330, "children": [{"leaf": true, "text": "prototype.Entity", "index": 11, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Entity"}, {"leaf": true, "text": "prototype.Entity.nv-prop", "index": 28, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Entity.nv-prop"}], "expanded": false}, {"leaf": false, "text": "Property", "index": 331, "children": [{"leaf": true, "text": "prototype.Property", "index": 12, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Property"}], "expanded": false}, {"leaf": false, "text": "Project", "index": 340, "children": [{"leaf": true, "text": "prototype.Project", "index": 18, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Project"}], "expanded": false}, {"leaf": false, "text": "ProtoVersionTitle", "index": 342, "children": [{"leaf": true, "text": "prototype.ProtoVersionTitle", "index": 20, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.ProtoVersionTitle"}], "expanded": false}, {"leaf": false, "text": "Relationship", "index": 362, "children": [{"leaf": true, "text": "prototype.Relationship", "index": 44, "iconCls": "icon-1", "expanded": true, "viewCode": "prototype.Relationship"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "protoExt", "index": 316, "children": [{"leaf": false, "text": "CustomDefinition", "index": 317, "children": [{"leaf": true, "text": "protoExt.CustomDefinition", "index": 1, "iconCls": "icon-1", "expanded": true, "viewCode": "protoExt.CustomDefinition"}], "expanded": false}, {"leaf": false, "text": "ViewDefinition", "index": 321, "children": [{"leaf": true, "text": "protoExt.ViewDefinition", "index": 5, "iconCls": "icon-1", "expanded": true, "viewCode": "protoExt.ViewDefinition"}], "expanded": false}, {"leaf": false, "text": "Parameters", "index": 350, "children": [{"leaf": true, "text": "protoExt.Parameters", "index": 29, "iconCls": "icon-1", "expanded": true, "viewCode": "protoExt.Parameters"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "auth", "index": 323, "children": [{"leaf": false, "text": "User", "index": 324, "children": [{"leaf": true, "text": "auth.User", "index": 7, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.User"}], "expanded": false}, {"leaf": false, "text": "Permission", "index": 337, "children": [{"leaf": true, "text": "auth.Permission", "index": 16, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.Permission"}], "expanded": false}, {"leaf": false, "text": "Group", "index": 346, "children": [{"leaf": true, "text": "auth.Group", "index": 24, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.Group"}], "expanded": false}, {"leaf": false, "text": "Group_permissions", "index": 347, "children": [{"leaf": true, "text": "auth.Group_permissions", "index": 25, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.Group_permissions"}], "expanded": false}, {"leaf": false, "text": "User_groups", "index": 348, "children": [{"leaf": true, "text": "auth.User_groups", "index": 26, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.User_groups"}], "expanded": false}, {"leaf": false, "text": "User_user_permissions", "index": 369, "children": [{"leaf": true, "text": "auth.User_user_permissions", "index": 58, "iconCls": "icon-1", "expanded": true, "viewCode": "auth.User_user_permissions"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "admin", "index": 325, "children": [{"leaf": false, "text": "LogEntry", "index": 326, "children": [{"leaf": true, "text": "admin.LogEntry", "index": 8, "iconCls": "icon-1", "expanded": true, "viewCode": "admin.LogEntry"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "reversion", "index": 327, "children": [{"leaf": false, "text": "Revision", "index": 328, "children": [{"leaf": true, "text": "reversion.Revision", "index": 9, "iconCls": "icon-1", "expanded": true, "viewCode": "reversion.Revision"}], "expanded": false}, {"leaf": false, "text": "Version", "index": 336, "children": [{"leaf": true, "text": "reversion.Version", "index": 15, "iconCls": "icon-1", "expanded": true, "viewCode": "reversion.Version"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "protoLib", "index": 332, "children": [{"leaf": false, "text": "EntityMap", "index": 333, "children": [{"leaf": true, "text": "protoLib.EntityMap", "index": 13, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.EntityMap"}], "expanded": false}, {"leaf": false, "text": "ContextUser", "index": 341, "children": [{"leaf": true, "text": "protoLib.ContextUser", "index": 19, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.ContextUser"}], "expanded": false}, {"leaf": false, "text": "ContextVar", "index": 343, "children": [{"leaf": true, "text": "protoLib.ContextVar", "index": 21, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.ContextVar"}], "expanded": false}, {"leaf": false, "text": "ContextEntity", "index": 344, "children": [{"leaf": true, "text": "protoLib.ContextEntity", "index": 22, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.ContextEntity"}], "expanded": false}, {"leaf": false, "text": "TeamHierarchy", "index": 345, "children": [{"leaf": true, "text": "protoLib.TeamHierarchy", "index": 23, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.TeamHierarchy"}], "expanded": false}, {"leaf": false, "text": "UserProfile", "index": 349, "children": [{"leaf": true, "text": "protoLib.UserProfile", "index": 27, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.UserProfile"}], "expanded": false}, {"leaf": false, "text": "Logger", "index": 368, "children": [{"leaf": true, "text": "protoLib.Logger", "index": 57, "iconCls": "icon-1", "expanded": true, "viewCode": "protoLib.Logger"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "taggit", "index": 334, "children": [{"leaf": false, "text": "TaggedItem", "index": 335, "children": [{"leaf": true, "text": "taggit.TaggedItem", "index": 14, "iconCls": "icon-1", "expanded": true, "viewCode": "taggit.TaggedItem"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "contenttypes", "index": 338, "children": [{"leaf": false, "text": "ContentType", "index": 339, "children": [{"leaf": true, "text": "contenttypes.ContentType", "index": 17, "iconCls": "icon-1", "expanded": true, "viewCode": "contenttypes.ContentType"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "rai01ref", "index": 351, "children": [{"leaf": false, "text": "DocType", "index": 352, "children": [{"leaf": true, "text": "rai01ref.DocType", "index": 30, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.DocType"}], "expanded": false}, {"leaf": false, "text": "Artefact", "index": 353, "children": [{"leaf": true, "text": "rai01ref.Artefact", "index": 31, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact"}, {"leaf": true, "text": "rai01ref.Artefact.tree", "index": 35, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.tree"}, {"leaf": true, "text": "rai01ref.Artefact.71", "index": 43, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.71"}, {"leaf": true, "text": "rai01ref.Artefact.77", "index": 46, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.77"}, {"leaf": true, "text": "rai01ref.Artefact.78", "index": 47, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.78"}, {"leaf": true, "text": "rai01ref.Artefact.74", "index": 51, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.74"}, {"leaf": true, "text": "rai01ref.Artefact.79", "index": 53, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Artefact.79"}], "expanded": false}, {"leaf": false, "text": "Requirement", "index": 354, "children": [{"leaf": true, "text": "rai01ref.Requirement", "index": 32, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Requirement"}, {"leaf": true, "text": "rai01ref.Requirement.tree", "index": 37, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Requirement.tree"}], "expanded": false}, {"leaf": false, "text": "DocAttribute", "index": 355, "children": [{"leaf": true, "text": "rai01ref.DocAttribute", "index": 33, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.DocAttribute"}], "expanded": false}, {"leaf": false, "text": "Capacity", "index": 356, "children": [{"leaf": true, "text": "rai01ref.Capacity", "index": 34, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity"}, {"leaf": true, "text": "rai01ref.Capacity.tree", "index": 36, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.tree"}, {"leaf": true, "text": "rai01ref.Capacity.75", "index": 49, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.75"}, {"leaf": true, "text": "rai01ref.Capacity.80", "index": 52, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.80"}, {"leaf": true, "text": "rai01ref.Capacity.76", "index": 54, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.76"}, {"leaf": true, "text": "rai01ref.Capacity.81", "index": 55, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Capacity.81"}], "expanded": false}, {"leaf": false, "text": "ArtefactComposition", "index": 357, "children": [{"leaf": true, "text": "rai01ref.ArtefactComposition", "index": 38, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ArtefactComposition"}], "expanded": false}, {"leaf": false, "text": "ArtefactRequirement", "index": 358, "children": [{"leaf": true, "text": "rai01ref.ArtefactRequirement", "index": 39, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ArtefactRequirement"}], "expanded": false}, {"leaf": false, "text": "ProjectArtefact", "index": 359, "children": [{"leaf": true, "text": "rai01ref.ProjectArtefact", "index": 40, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ProjectArtefact"}], "expanded": false}, {"leaf": false, "text": "ArtefactCapacity", "index": 360, "children": [{"leaf": true, "text": "rai01ref.ArtefactCapacity", "index": 41, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ArtefactCapacity"}], "expanded": false}, {"leaf": false, "text": "ArtefactSource", "index": 361, "children": [{"leaf": true, "text": "rai01ref.ArtefactSource", "index": 42, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ArtefactSource"}], "expanded": false}, {"leaf": false, "text": "ProjectCapacity", "index": 363, "children": [{"leaf": true, "text": "rai01ref.ProjectCapacity", "index": 45, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ProjectCapacity"}], "expanded": false}, {"leaf": false, "text": "Source", "index": 364, "children": [{"leaf": true, "text": "rai01ref.Source", "index": 48, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.Source"}], "expanded": false}, {"leaf": false, "text": "ProjectRequirement", "index": 365, "children": [{"leaf": true, "text": "rai01ref.ProjectRequirement", "index": 50, "iconCls": "icon-1", "expanded": true, "viewCode": "rai01ref.ProjectRequirement"}], "expanded": false}], "expanded": false}, {"leaf": false, "text": "sessions", "index": 366, "children": [{"leaf": false, "text": "Session", "index": 367, "children": [{"leaf": true, "text": "sessions.Session", "index": 56, "iconCls": "icon-1", "expanded": true, "viewCode": "sessions.Session"}], "expanded": false}], "expanded": false}], "expanded": true}, {"leaf": false, "text": "ProtoOptions", "index": 1000, "children": [{"leaf": false, "text": "Ref-RQ", "index": 370, "children": [{"leaf": false, "text": "MCD-Carra", "index": 371, "children": [{"leaf": false, "text": "téléphone participant", "index": 372, "children": [{"leaf": true, "text": "mcd-carra-telephone-participant", "index": 0, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-telephone-participant"}], "expanded": false}, {"leaf": false, "text": "courriel", "index": 373, "children": [{"leaf": true, "text": "mcd-carra-courriel", "index": 1, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-courriel"}, {"leaf": true, "text": "mcd-carra-autreciurriel", "index": 46, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-autreciurriel"}], "expanded": false}, {"leaf": false, "text": "type intervenant", "index": 374, "children": [{"leaf": true, "text": "mcd-carra-type-intervenant", "index": 2, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-type-intervenant"}], "expanded": false}, {"leaf": false, "text": "exonération cotisation", "index": 375, "children": [{"leaf": true, "text": "mcd-carra-exoneration-cotisation", "index": 3, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-exoneration-cotisation"}], "expanded": false}, {"leaf": false, "text": "absence", "index": 376, "children": [{"leaf": true, "text": "mcd-carra-absence", "index": 4, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-absence"}], "expanded": false}, {"leaf": false, "text": "type absence", "index": 377, "children": [{"leaf": true, "text": "mcd-carra-type-absence", "index": 5, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-type-absence"}], "expanded": false}, {"leaf": false, "text": "modalité paiement", "index": 378, "children": [{"leaf": true, "text": "mcd-carra-modalite-paiement", "index": 6, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-modalite-paiement"}], "expanded": false}, {"leaf": false, "text": "période à racheter", "index": 379, "children": [{"leaf": true, "text": "mcd-carra-periode-a-racheter", "index": 7, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-periode-a-racheter"}], "expanded": false}, {"leaf": false, "text": "rachat période service", "index": 380, "children": [{"leaf": true, "text": "mcd-carra-rachat-periode-service", "index": 8, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-rachat-periode-service"}], "expanded": false}, {"leaf": false, "text": "paye", "index": 381, "children": [{"leaf": true, "text": "mcd-carra-paye", "index": 9, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-paye"}], "expanded": false}, {"leaf": false, "text": "période de paye", "index": 382, "children": [{"leaf": true, "text": "mcd-carra-periode-de-paye", "index": 10, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-periode-de-paye"}], "expanded": false}, {"leaf": false, "text": "résidence", "index": 383, "children": [{"leaf": true, "text": "mcd-carra-residence", "index": 11, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-residence"}], "expanded": false}, {"leaf": false, "text": "adresse", "index": 384, "children": [{"leaf": true, "text": "mcd-carra-adresse", "index": 12, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-adresse"}], "expanded": false}, {"leaf": false, "text": "province", "index": 385, "children": [{"leaf": true, "text": "mcd-carra-province", "index": 13, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-province"}], "expanded": false}, {"leaf": false, "text": "code postal", "index": 386, "children": [{"leaf": true, "text": "mcd-carra-code-postal", "index": 14, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-code-postal"}], "expanded": false}, {"leaf": false, "text": "ville", "index": 387, "children": [{"leaf": true, "text": "mcd-carra-ville", "index": 15, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-ville"}], "expanded": false}, {"leaf": false, "text": "pays", "index": 388, "children": [{"leaf": true, "text": "mcd-carra-pays", "index": 16, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-pays"}], "expanded": false}, {"leaf": false, "text": "départ progressif", "index": 389, "children": [{"leaf": true, "text": "mcd-carra-depart-progressif", "index": 17, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-depart-progressif"}], "expanded": false}, {"leaf": false, "text": "citoyen", "index": 390, "children": [{"leaf": true, "text": "mcd-carra-citoyen", "index": 18, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-citoyen"}], "expanded": false}, {"leaf": false, "text": "événement matrimonial", "index": 391, "children": [{"leaf": true, "text": "mcd-carra-evenement-matrimonial", "index": 19, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-evenement-matrimonial"}], "expanded": false}, {"leaf": false, "text": "retraite graduelle", "index": 392, "children": [{"leaf": true, "text": "mcd-carra-retraite-graduelle", "index": 20, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-retraite-graduelle"}], "expanded": false}, {"leaf": false, "text": "participation au régime", "index": 393, "children": [{"leaf": true, "text": "mcd-carra-participation-au-regime", "index": 21, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-participation-au-regime"}], "expanded": false}, {"leaf": false, "text": "paiement rente familiale", "index": 394, "children": [{"leaf": true, "text": "mcd-carra-paiement-rente-familiale", "index": 22, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-paiement-rente-familiale"}], "expanded": false}, {"leaf": false, "text": "retraite", "index": 395, "children": [{"leaf": true, "text": "mcd-carra-retraite", "index": 23, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-retraite"}], "expanded": false}, {"leaf": false, "text": "paiement d'une rente", "index": 396, "children": [{"leaf": true, "text": "mcd-carra-paiement-dune-rente", "index": 24, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-paiement-dune-rente"}], "expanded": false}, {"leaf": false, "text": "régime matrimonial", "index": 397, "children": [{"leaf": true, "text": "mcd-carra-regime-matrimonial", "index": 25, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-regime-matrimonial"}], "expanded": false}, {"leaf": false, "text": "type événement matrimonial", "index": 398, "children": [{"leaf": true, "text": "mcd-carra-type-evenement-matrimonial", "index": 26, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-type-evenement-matrimonial"}], "expanded": false}, {"leaf": false, "text": "enfant à charge", "index": 399, "children": [{"leaf": true, "text": "mcd-carra-enfant-a-charge", "index": 27, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-enfant-a-charge"}], "expanded": false}, {"leaf": false, "text": "période année", "index": 400, "children": [{"leaf": true, "text": "mcd-carra-periode-annee", "index": 28, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-periode-annee"}], "expanded": false}, {"leaf": false, "text": "période contribution", "index": 401, "children": [{"leaf": true, "text": "mcd-carra-periode-contribution", "index": 29, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-periode-contribution"}], "expanded": false}, {"leaf": false, "text": "groupe", "index": 402, "children": [{"leaf": true, "text": "mcd-carra-groupe", "index": 30, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-groupe"}], "expanded": false}, {"leaf": false, "text": "régime de retraite", "index": 403, "children": [{"leaf": true, "text": "mcd-carra-regime-de-retraite", "index": 31, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-regime-de-retraite"}], "expanded": false}, {"leaf": false, "text": "transfert interrégimes", "index": 404, "children": [{"leaf": true, "text": "mcd-carra-transfert-interregimes", "index": 32, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-transfert-interregimes"}], "expanded": false}, {"leaf": false, "text": "remboursement cotisation", "index": 405, "children": [{"leaf": true, "text": "mcd-carra-remboursement-cotisation", "index": 33, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-remboursement-cotisation"}], "expanded": false}, {"leaf": false, "text": "base de rémunération", "index": 406, "children": [{"leaf": true, "text": "mcd-carra-base-de-remuneration", "index": 34, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-base-de-remuneration"}], "expanded": false}, {"leaf": false, "text": "emploi contributif", "index": 407, "children": [{"leaf": true, "text": "mcd-carra-emploi-contributif", "index": 35, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-emploi-contributif"}], "expanded": false}, {"leaf": false, "text": "organisme public", "index": 408, "children": [{"leaf": true, "text": "mcd-carra-organisme-public", "index": 36, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-organisme-public"}], "expanded": false}, {"leaf": false, "text": "régime applicable", "index": 409, "children": [{"leaf": true, "text": "mcd-carra-regime-applicable", "index": 37, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-regime-applicable"}], "expanded": false}, {"leaf": false, "text": "adresse OP", "index": 410, "children": [{"leaf": true, "text": "mcd-carra-adresse-op", "index": 38, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-adresse-op"}], "expanded": false}, {"leaf": false, "text": "participation composition organisme public", "index": 411, "children": [{"leaf": true, "text": "mcd-carra-participation-composition-organisme-public", "index": 39, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-participation-composition-organisme-public"}], "expanded": false}, {"leaf": false, "text": "composition organisme public", "index": 412, "children": [{"leaf": true, "text": "mcd-carra-composition-organisme-public", "index": 40, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-composition-organisme-public"}], "expanded": false}, {"leaf": false, "text": "établissement scolaire", "index": 413, "children": [{"leaf": true, "text": "mcd-carra-etablissement-scolaire", "index": 41, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-etablissement-scolaire"}], "expanded": false}, {"leaf": false, "text": "diplôme", "index": 414, "children": [{"leaf": true, "text": "mcd-carra-diplome", "index": 42, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-diplome"}], "expanded": false}, {"leaf": false, "text": "formation scolaire", "index": 415, "children": [{"leaf": true, "text": "mcd-carra-formation-scolaire", "index": 43, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-formation-scolaire"}], "expanded": false}, {"leaf": false, "text": "intervenant", "index": 416, "children": [{"leaf": true, "text": "mcd-carra-intervenant", "index": 44, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-intervenant"}], "expanded": false}, {"leaf": false, "text": "participant", "index": 417, "children": [{"leaf": true, "text": "mcd-carra-participant", "index": 45, "iconCls": "icon-proto", "expanded": true, "viewCode": "prototype.ProtoTable.mcd-carra-participant"}], "expanded": false}], "expanded": false}], "expanded": false}], "expanded": true}], "expanded": true}]	15	15	1	15
\.


--
-- Name: protoExt_customdefinition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoExt_customdefinition_id_seq"', 8, true);


--
-- Data for Name: protoExt_parameters; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoExt_parameters" (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "smInfo", "parameterKey", "parameterTag", "parameterValue", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
1	wikiPath.~/tmp/wiki	\N	\N	2015-06-29 11:48:16.068+00	2015-06-29 11:48:16.068+00	a81c943a-12e9-49e3-b749-8fa925a8b908	{}	wikiPath	\N	~/tmp/wiki	1	1	1	1
2	a.a	\N	\N	2016-04-27 14:24:34.078+00	2016-04-27 14:24:34.078+00	fbaf36cf-62ef-41fb-9024-5ca8b051384e	{}	a	a	a	1	1	1	1
3	x.x	\N	\N	2016-04-27 16:41:48.209+00	2016-04-27 16:41:48.209+00	fb6842a5-68a1-4a9a-ace1-8ba5ee84a982	{}	x	x	x	1	1	1	1
\.


--
-- Name: protoExt_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoExt_parameters_id_seq"', 3, true);


--
-- Data for Name: protoExt_viewdefinition; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoExt_viewdefinition" (id, code, description, active, "overWrite", "metaDefinition") FROM stdin;
3	prototype.Diagram	Diagram	t	f	{"fields": [{"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "showFKey", "type": "bool", "header": "showFKey", "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "sortable": true, "searchable": true}, {"name": "title", "type": "string", "header": "title", "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "showPrpType", "type": "bool", "header": "showPrpType", "sortable": true, "searchable": true}, {"name": "prefix", "type": "string", "header": "prefix", "sortable": true, "searchable": true}, {"name": "showBorder", "type": "bool", "header": "showBorder", "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smInfo", "type": "text", "header": "smInfo", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "grphMode", "type": "int", "header": "grphMode", "sortable": true, "prpDefault": 0, "searchable": true}, {"fkId": "project_id", "name": "project", "type": "foreigntext", "header": "project", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Project", "searchable": false}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Diagram", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.Diagram"}, {"name": "project_id", "type": "foreignid", "header": "project_id", "hidden": true, "fkField": "project", "readOnly": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "graphForm", "type": "int", "header": "graphForm", "sortable": true, "prpDefault": 0, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "graphLevel", "type": "int", "header": "graphLevel", "sortable": true, "prpDefault": 0, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}], "actions": [{"name": "doDiagram", "menuText": "doDiagram", "selectionMode": "multiple"}], "exclude": [], "gridSets": {"filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Diagram", "viewIcon": "icon-1", "contextTo": [], "formConfig": {"items": [{"items": [{"name": "project", "__ptType": "formField", "fieldLabel": "Nom projet"}, {"name": "code", "__ptType": "formField", "fieldLabel": "Nom modèle"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "showFKey", "__ptType": "formField"}, {"name": "showPrpType", "__ptType": "formField"}, {"name": "showBorder", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "title", "__ptType": "formField", "fieldLabel": "Titre"}, {"name": "prefix", "__ptType": "formField"}, {"name": "grphMode", "__ptType": "formField"}, {"name": "graphForm", "__ptType": "formField"}, {"name": "graphLevel", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "notes", "__ptType": "formField"}, {"name": "description", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "description", "notes", "title", "prefix"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "description", "notes", "title", "prefix"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Diagram", "updateTime": "2016-10-10 10:47:54", "viewEntity": "prototype.Diagram", "description": "Diagram", "metaVersion": "130310", "sheetConfig": [], "businessRules": {}, "detailsConfig": [{"menuText": "Diagramentity.diagram", "detailName": "diagramentity.diagram", "detailField": "diagram__pk", "masterField": "pk", "conceptDetail": "prototype.DiagramEntity"}]}
4	protoExt.CustomDefinition	Custom Definition	t	f	{"fields": [{"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "active", "type": "bool", "header": "active", "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "overWrite", "type": "bool", "header": "overWrite", "sortable": true, "searchable": true}, {"name": "metaDefinition", "type": "text", "header": "metaDefinition", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Custom Definition", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoExt.CustomDefinition"}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "Descriptions", "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "exclude": [], "gridSets": {"filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "protoExt.CustomDefinition", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "active", "__ptType": "formField"}, {"name": "overWrite", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "description", "__ptType": "formField"}, {"name": "metaDefinition", "xtype": "textarea", "__ptType": "formField", "readOnly": true, "fieldLabel": "<strong>metaDefinition</strong>", "labelAlign": "top"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smWflowStatus", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}, {"name": "smRegStatus", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "metaDefinition"], "initialSort": [], "listDisplay": ["__str__", "description", "smOwningUser"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "metaDefinition"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Custom Definition", "updateTime": "2015-06-21 23:06:26", "viewEntity": "protoExt.CustomDefinition", "description": "Custom Definition", "metaVersion": "130310", "sheetConfig": [], "usrDefProps": {}, "businessRules": {}, "detailsConfig": []}
9	prototype.Prototype	Prototype	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Prototype", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.Prototype"}, {"name": "code", "type": "string", "header": "code", "__ptType": "field", "required": true, "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "entity_id", "name": "entity", "type": "foreigntext", "header": "entity", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Entity"}, {"name": "metaDefinition", "type": "text", "header": "metaDefinition", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "fkField": "entity", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Prototype", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "entity", "__ptType": "formField"}, {"name": "code", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "notes", "__ptType": "formField"}, {"name": "description", "__ptType": "formField"}, {"name": "metaDefinition", "xtype": "textarea", "__ptType": "formField", "readOnly": true, "fieldLabel": "MetaDefinition", "labelAlign": "top"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smRegStatus", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "notes", "metaDefinition"], "initialSort": [], "listDisplay": ["__str__", "entity", "smOwningTeam"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "notes", "metaDefinition"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Prototype", "updateTime": "2017-09-07 11:48:23", "viewEntity": "prototype.Prototype", "description": "Prototype", "metaVersion": "130310", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
10	prototype.PropertyEquivalence	Property Equivalence	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Property Equivalence", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.PropertyEquivalence"}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "smInfo", "type": "text", "header": "smInfo", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"fkId": "sourceProperty_id", "name": "sourceProperty", "type": "foreigntext", "header": "Donnée source", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "prototype.Property", "fieldLabel": "Donnée source"}, {"name": "sourceProperty__code", "type": "string", "header": "Donnée source", "__ptType": "field", "readOnly": true, "fieldLabel": "Donnée source"}, {"fkId": "entity_id", "name": "sourceProperty__entity", "type": "foreigntext", "header": "Entité source", "__ptType": "field", "cellLink": true, "readOnly": true, "zoomModel": "prototype.Entity", "fieldLabel": "Entité source"}, {"name": "sourceProperty__entity__code", "type": "string", "header": "Entité source", "__ptType": "field", "readOnly": true, "fieldLabel": "Entité source"}, {"fkId": "model_id", "name": "sourceProperty__entity__model", "type": "foreigntext", "header": "model", "__ptType": "field", "cellLink": true, "readOnly": true, "zoomModel": "prototype.Model"}, {"name": "sourceProperty__entity__model__code", "type": "string", "header": "Modèle source", "__ptType": "field", "readOnly": true, "fieldLabel": "Modèle source"}, {"fkId": "targetProperty_id", "name": "targetProperty", "type": "foreigntext", "header": "targetProperty", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "prototype.Property"}, {"name": "targetProperty__code", "type": "string", "header": "Donnée cible", "__ptType": "field", "readOnly": true, "fieldLabel": "Donnée cible"}, {"fkId": "entity_id", "name": "targetProperty__entity", "type": "foreigntext", "header": "entity", "__ptType": "field", "cellLink": true, "readOnly": true, "zoomModel": "prototype.Entity"}, {"name": "targetProperty__entity__code", "type": "string", "header": "Entité cible", "__ptType": "field", "readOnly": true, "fieldLabel": "Entité cible"}, {"fkId": "model_id", "name": "targetProperty__entity__model", "type": "foreigntext", "header": "model", "__ptType": "field", "cellLink": true, "readOnly": true, "zoomModel": "prototype.Model"}, {"name": "targetProperty__entity__model__code", "type": "string", "header": "Modèle cible", "__ptType": "field", "readOnly": true, "fieldLabel": "Modèle cible"}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "sourceProperty_id", "type": "foreignid", "header": "sourceProperty_id", "hidden": true, "fkField": "sourceProperty", "__ptType": "field", "readOnly": true}, {"name": "targetProperty_id", "type": "foreignid", "header": "targetProperty_id", "hidden": true, "fkField": "targetProperty", "__ptType": "field", "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.PropertyEquivalence", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "sourceProperty", "__ptType": "formField", "fieldLabel": "Donnée origine"}, {"name": "targetProperty", "__ptType": "formField", "fieldLabel": "Donnée cible"}, {"name": "sourceProperty__entity__code", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Entité source"}, {"name": "targetProperty__entity", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Enité cible"}, {"name": "sourceProperty__entity__model", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Modèle source"}, {"name": "targetProperty__entity__model__code", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Modèle cible"}], "title": "Correspondance entre données", "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "description", "__ptType": "formField"}], "__ptType": "fieldset"}, {"items": [{"name": "smRegStatus", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "description"], "initialSort": [], "listDisplay": ["sourceProperty__code", "sourceProperty__entity__code", "sourceProperty__entity__model__code", "targetProperty__code", "targetProperty__entity__code", "targetProperty__entity__model__code", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Property Equivalence", "updateTime": "2016-10-21 13:30:15", "viewEntity": "prototype.PropertyEquivalence", "description": "Property Equivalence", "metaVersion": "130310", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
11	prototype.DiagramEntity	Diagram Entity	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Diagram Entity", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.DiagramEntity"}, {"fkId": "diagram_id", "name": "diagram", "type": "foreigntext", "header": "diagram", "__ptType": "field", "required": true, "sortable": true, "zoomModel": "prototype.Diagram"}, {"fkId": "entity_id", "name": "entity", "type": "foreigntext", "header": "entity", "__ptType": "field", "required": true, "sortable": true, "zoomModel": "prototype.Entity", "zoomMultiple": true}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "diagram_id", "type": "foreignid", "hidden": true, "fkField": "diagram", "__ptType": "field", "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "fkField": "entity", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smInfo", "type": "text", "header": "smInfo", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.DiagramEntity", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "entity", "__ptType": "formField"}, {"name": "diagram", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smRegStatus", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "info"], "initialSort": [], "listDisplay": ["__str__"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Diagram Entity", "updateTime": "2016-02-15 14:50:03", "viewEntity": "prototype.DiagramEntity", "description": "Diagram Entity", "metaVersion": "130310", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
12	protoExt.ViewDefinition	View Definition	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "View Definition", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoExt.ViewDefinition"}, {"name": "active", "type": "bool", "header": "active", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "code", "__ptType": "field", "required": true, "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "Description", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "metaDefinition", "type": "text", "header": "metaDefinition", "__ptType": "field", "crudType": "editable", "required": true, "sortable": true}, {"name": "overWrite", "type": "bool", "header": "overWrite", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "protoExt.ViewDefinition", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "active", "__ptType": "formField"}, {"name": "overWrite", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "metaDefinition", "xtype": "textarea", "__ptType": "formField", "fieldLabel": "<strong>metaDefinition</strong>", "labelAlign": "top"}, {"name": "description", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["code", "description", "metaDefinition"], "initialSort": [], "listDisplay": ["__str__", "code", "description", "active", "overWrite"], "hiddenFields": ["id"], "searchFields": ["code", "description", "metaDefinition"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "View Definition", "updateTime": "2016-10-20 18:36:48", "viewEntity": "protoExt.ViewDefinition", "description": "View Definition", "metaVersion": "14.0201", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
66	prototype.Project	Project	t	f	{"fields": [{"name": "code", "type": "string", "header": "nom domaine", "__ptType": "field", "required": true, "sortable": true, "zoomModel": "prototype.Project", "fieldLabel": "nom domaine", "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true}, {"name": "smInfo__Courriel", "type": "string", "header": "Courriel", "__ptType": "field"}, {"name": "smInfo__Responsable", "type": "string", "header": "Responsable", "__ptType": "field"}, {"name": "smInfo__Tel", "type": "string", "header": "Tel", "__ptType": "field"}, {"name": "smInfo__version", "type": "string", "header": "version", "__ptType": "field"}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true}], "actions": [{"name": "doImportSchema", "__ptType": "actionDef", "menuText": "doImportSchema", "actionParams": [], "selectionMode": "single"}, {"name": "doSetContext", "__ptType": "actionDef", "menuText": "doSetContext", "actionParams": [], "selectionMode": "optional"}], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Project", "viewIcon": "icon-1", "jsonField": "smInfo", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom domaine"}, {"name": "description", "__ptType": "formField"}, {"name": "smInfo__version", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Version"}], "title": "Fiche du domaine", "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"__ptType": "smGrid", "menuText": "Modèle", "viewCode": "prototype.Model"}], "title": "Modèles du domaine", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "smInfo__Responsable", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Responsable"}, {"name": "smInfo__Courriel", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Courriel"}, {"name": "smInfo__Tel", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Tel"}], "title": "Responsable", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "smCreatedBy", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Créé par"}, {"name": "smCreatedOn", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Date création"}, {"name": "smModifiedBy", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Modifié par"}, {"name": "smModifiedOn", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Date modif."}], "title": "Gérance", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "title": "Fiche projet", "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "description", "dbEngine", "dbName", "dbUser", "dbPassword", "dbHost", "dbPort"], "initialSort": [], "listDisplay": ["code", "description", "smInfo__version", "smInfo__testdp"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "description", "dbEngine", "dbName", "dbUser", "dbPassword", "dbHost", "dbPort"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Domaines", "updateTime": "2017-08-24 13:42:31", "viewEntity": "prototype.Project", "description": "Domaine", "metaVersion": "150625", "sheetConfig": [{"name": "exportWiki", "__ptType": "sheetDef", "template": "prototype/wikiproject.txt", "sheetType": "printerOnly", "sheetDetails": []}], "usrDefProps": {"__ptType": "usrDefProps", "keyField": "tcpp", "propertyName": "test champs pour projet"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Modèles", "detailName": "Modèl", "detailField": "project__pk", "masterField": "pk", "conceptDetail": "prototype.Model"}]}
15	prototype.ProtoTable	Proto Table	t	f	{"fields": [{"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "info", "type": "text", "header": "info", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Proto Table", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable"}, {"name": "entity_id", "type": "foreignid", "hidden": true, "fkField": "entity", "readOnly": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "entity_id", "name": "entity", "type": "foreigntext", "header": "entity", "required": true, "sortable": true, "zoomModel": "prototype.Entity", "searchable": false}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smVersion", "type": "string", "header": "smVersion", "readOnly": true, "required": false}], "actions": [], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable", "viewIcon": "icon-1", "defaultTo": [], "formConfig": {"items": [{"items": [{"name": "entity", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smRegStatus", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "info"], "initialSort": [], "listDisplay": ["__str__", "smOwningTeam", "entity_id", "id", "entity", "smVersion"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "info"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Proto Table", "updateTime": "2016-02-10 15:22:52", "viewEntity": "prototype.ProtoTable", "description": "Proto Table", "metaVersion": "14.0201", "sheetConfig": [], "businessRules": {}, "detailsConfig": []}
16	auth.User	User	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "User", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "auth.User"}, {"name": "date_joined", "type": "datetime", "xtype": "datefield", "header": "date joined", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "email", "type": "string", "header": "email address", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "first_name", "type": "string", "header": "first name", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "is_active", "type": "bool", "header": "active", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "is_staff", "type": "bool", "header": "staff status", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "is_superuser", "type": "bool", "header": "superuser status", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "last_login", "type": "datetime", "header": "last login", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "last_name", "type": "string", "header": "last name", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "username", "type": "string", "header": "username", "__ptType": "field", "required": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}], "actions": [{"name": "doAddUser", "__ptType": "actionDef", "menuText": "doAddUser", "actionParams": [{"name": "User", "type": "string", "tooltip": "UserName", "__ptType": "actionParam", "required": true}, {"name": "Pwd", "type": "string", "tooltip": "Pwd", "__ptType": "actionParam"}, {"name": "EMail", "type": "string", "tooltip": "Email", "__ptType": "actionParam"}, {"name": "Team", "type": "string", "tooltip": "Tean", "__ptType": "actionParam"}, {"name": "Groups", "type": "string", "tooltip": "gr1,gr2,...", "__ptType": "actionParam"}], "selectionMode": "none", "refreshOnComplete": true}, {"name": "doAddUsers", "__ptType": "actionDef", "menuText": "doAddUsers", "actionParams": [{"name": "Users", "type": "text", "tooltip": "Usr, Pwd, email, team, group1, .. group(n)", "__ptType": "actionParam", "required": true}], "selectionMode": "none", "refreshOnComplete": true}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "auth.User", "viewIcon": "icon-1", "contextTo": [], "defaultTo": [], "formConfig": {"items": [{"items": [{"name": "username", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "first_name", "__ptType": "formField"}, {"name": "last_name", "__ptType": "formField"}, {"name": "email", "__ptType": "formField"}], "title": "Personal info", "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "is_active", "__ptType": "formField"}, {"name": "is_staff", "__ptType": "formField"}, {"name": "is_superuser", "__ptType": "formField"}], "title": "Permissions", "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "last_login", "__ptType": "formField"}, {"name": "date_joined", "type": "date", "__ptType": "formField"}], "title": "Important dates", "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["password", "username", "first_name", "last_name"], "initialSort": [], "listDisplay": ["username", "email", "first_name", "last_name", "is_staff", "is_active", "is_superuser", "last_login"], "hiddenFields": ["id"], "searchFields": ["password", "username", "first_name", "last_name"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "User", "updateTime": "2016-08-23 19:30:40", "viewEntity": "auth.User", "description": "User", "metaVersion": "14.0201", "sheetConfig": [], "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Logentry.user", "detailName": "logentry.user", "detailField": "user__pk", "masterField": "pk", "conceptDetail": "admin.LogEntry"}, {"__ptType": "detailDef", "menuText": "Revision.user", "detailName": "revision.user", "detailField": "user__pk", "masterField": "pk", "conceptDetail": "reversion.Revision"}, {"__ptType": "detailDef", "menuText": "Userprofile.user", "detailName": "userprofile.user", "detailField": "user__pk", "masterField": "pk", "conceptDetail": "protoLib.UserProfile"}]}
17	admin.LogEntry	Log Entry	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Log Entry", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "admin.LogEntry"}, {"name": "action_time", "type": "datetime", "header": "action time", "readOnly": true, "sortable": true, "searchable": true}, {"name": "content_type_id", "type": "foreignid", "hidden": true, "fkField": "content_type", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "user_id", "type": "foreignid", "hidden": true, "fkField": "user", "readOnly": true}, {"name": "action_flag", "type": "string", "header": "action flag", "required": true, "sortable": true, "searchable": true}, {"fkId": "user_id", "name": "user", "type": "foreigntext", "header": "user", "required": true, "sortable": true, "zoomModel": "auth.User", "searchable": false}, {"fkId": "content_type_id", "name": "content_type", "type": "foreigntext", "header": "content type", "sortable": true, "zoomModel": "contenttypes.ContentType", "searchable": false}, {"name": "object_repr", "type": "string", "header": "object repr", "required": true, "sortable": true, "searchable": true}, {"name": "object_id", "type": "text", "vType": "plainText", "header": "object id", "sortable": true, "searchable": true}, {"name": "change_message", "type": "text", "vType": "plainText", "header": "change message", "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "admin.LogEntry", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "action_flag", "__ptType": "formField"}, {"name": "user", "__ptType": "formField"}, {"name": "object_repr", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "action_time", "__ptType": "formField"}, {"name": "content_type", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "object_id", "__ptType": "formField"}, {"name": "change_message", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["object_id", "object_repr", "change_message"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["object_id", "object_repr", "change_message"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Log Entry", "viewEntity": "admin.LogEntry", "description": "Log Entry", "metaVersion": "150625", "detailsConfig": []}
18	reversion.Revision	Revision	t	f	{"fields": [{"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "user_id", "type": "foreignid", "hidden": true, "fkField": "user", "readOnly": true}, {"name": "manager_slug", "type": "string", "header": "manager slug", "required": true, "sortable": true, "searchable": true}, {"fkId": "user_id", "name": "user", "type": "foreigntext", "header": "user", "tooltip": "The user who created this revision.", "sortable": true, "zoomModel": "auth.User", "searchable": false}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Revision", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "reversion.Revision"}, {"name": "comment", "type": "text", "vType": "plainText", "header": "comment", "tooltip": "A text comment on this revision.", "sortable": true, "searchable": true}, {"name": "date_created", "type": "datetime", "header": "date created", "tooltip": "The date and time this revision was created.", "readOnly": true, "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "reversion.Revision", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "manager_slug", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "user", "__ptType": "formField"}, {"name": "date_created", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "comment", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["manager_slug", "comment"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["manager_slug", "comment"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Revision", "viewEntity": "reversion.Revision", "description": "Revision", "metaVersion": "150625", "detailsConfig": [{"menuText": "Version.revision", "detailName": "version.revision", "detailField": "revision__pk", "masterField": "pk", "conceptDetail": "reversion.Version"}]}
23	prototype.Model	Model	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "lien modèle", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.Model", "fieldLabel": "lien modèle"}, {"name": "category", "type": "string", "header": "catégorie", "__ptType": "field", "sortable": true, "fieldLabel": "catégorie", "searchable": true}, {"name": "code", "type": "string", "header": "nom modèle", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "nom modèle", "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "modelPrefix", "type": "string", "header": "modelPrefix", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "project_id", "name": "project", "type": "foreigntext", "header": "domaine", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Project"}, {"name": "project__code", "type": "string", "header": "nom domaine", "__ptType": "field", "qbeField": true, "readOnly": true, "fieldLabel": "Prj Code", "searchable": true}, {"name": "smInfo__Courriel", "type": "string", "header": "Courriel", "__ptType": "field"}, {"name": "smInfo__responsable", "type": "string", "header": "responsable", "__ptType": "field"}, {"name": "smInfo__Tel", "type": "string", "header": "Tel", "__ptType": "field"}, {"name": "smVersion", "type": "string", "header": "smVersion", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "project_id", "type": "foreignid", "header": "project_id", "hidden": true, "fkField": "project", "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true}, {"name": "smInfo", "type": "text", "header": "smInfo", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true}], "actions": [{"name": "doModelDiagram", "title": "diagramme", "__ptType": "actionDef", "menuText": "doModelDiagram", "actionParams": []}, {"name": "doModelPrototype", "__ptType": "actionDef", "menuText": "doModelPrototype", "actionParams": []}, {"name": "doExportProtoModel", "__ptType": "actionDef", "menuText": "doExportProtoModel", "actionParams": []}, {"name": "doImportProtoModel", "__ptType": "actionDef", "menuText": "doImportProtoModel", "actionParams": [{"name": "file", "type": "filefield", "tooltip": "Select a file to upload", "__ptType": "actionParam", "required": true}]}, {"name": "doExportDjModels", "__ptType": "actionDef", "menuText": "doExportDjModels", "actionParams": []}, {"name": "doExportDjViews", "__ptType": "actionDef", "menuText": "doExportDjViews", "actionParams": []}, {"name": "doSetDefaults", "__ptType": "actionDef", "menuText": "doSetDefaults", "actionParams": [], "selectionMode": "optional"}], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Model", "viewIcon": "icon-1", "contextTo": [], "jsonField": "smInfo", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom modèle"}, {"name": "project", "__ptType": "formField", "fieldLabel": "Nom domaine"}, {"name": "description", "__ptType": "formField"}, {"name": "category", "__ptType": "formField", "fieldLabel": "Categorie"}], "title": "modèles du domaine", "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"__ptType": "smGrid", "menuText": "Entity.model", "viewCode": "prototype.Entity"}], "title": "Entités du modèle", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "smInfo__responsable", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Nom"}, {"name": "smInfo__Courriel", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Courriel"}, {"name": "smInfo__Tel", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Tel"}], "title": "Responsable", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "smCreatedBy", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Créé par"}, {"name": "smCreatedOn", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Date création"}, {"name": "smModifiedBy", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Modifié par"}, {"name": "smModifiedOn", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Date modif."}], "title": "Gérance", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "code", "category", "modelPrefix", "description"], "initialSort": [], "listDisplay": ["code", "project__code", "description", "category"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "code", "category", "modelPrefix", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Modèles", "updateTime": "2017-08-23 19:32:22", "viewEntity": "prototype.Model", "description": "Modèles", "metaVersion": "150625", "sheetConfig": [{"name": "exportWiki", "__ptType": "sheetDef", "template": "prototype/wikimodel.txt", "sheetType": "printerOnly", "sheetDetails": []}], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Entités", "detailName": "Entités", "detailField": "model__pk", "masterField": "pk", "conceptDetail": "prototype.Entity"}]}
24	prototype.Entity	Entity	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "lien entité", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.Entity", "fieldLabel": "lien entité"}, {"name": "code", "type": "string", "header": "nom entité", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "nom entité", "searchable": true}, {"name": "dbName", "type": "string", "header": "dbName", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "model_id", "name": "model", "type": "foreigntext", "header": "lien modèle", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Model", "fieldLabel": "lien modèle"}, {"name": "model__code", "type": "string", "header": "nom modèle", "__ptType": "field", "readOnly": true, "fieldLabel": "nom modèle"}, {"name": "model__project__code", "type": "string", "header": "nom domaine", "__ptType": "field", "readOnly": true, "fieldLabel": "nom domaine"}, {"name": "smInfo__Courriel", "type": "string", "header": "Courriel", "__ptType": "field"}, {"name": "smInfo__Responsable", "type": "string", "header": "Responsable", "__ptType": "field"}, {"name": "smInfo__Tel", "type": "string", "header": "Tel", "__ptType": "field"}, {"name": "smVersion", "type": "string", "header": "smVersion", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "model_id", "type": "foreignid", "header": "model_id", "hidden": true, "fkField": "model", "__ptType": "field", "readOnly": true, "prpDefault": 11}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smInfo", "type": "text", "header": "smInfo", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doEntityPrototype", "__ptType": "actionDef", "menuText": "doEntityPrototype", "actionParams": [{"name": "viewCode", "type": "string", "tooltip": "option de menu (msi)", "__ptType": "actionParam", "required": true}], "selectionMode": "single"}, {"name": "DoModelDiagram", "title": "Diagramme", "__ptType": "actionDef", "menuText": "DoModelDiagram", "actionParams": []}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Entity", "viewIcon": "icon-1", "contextTo": [], "jsonField": "smInfo", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom entité"}, {"name": "model", "__ptType": "formField", "fieldLabel": "Nom modèle"}, {"name": "model__project__code", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom domaine"}, {"name": "description", "__ptType": "formField"}], "title": "Fiche entité", "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"__ptType": "smGrid", "menuText": "Données", "viewCode": "prototype.Property"}], "title": "Données de l'entité", "__ptType": "fieldset", "fsLayout": "1col", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Relations", "viewCode": "prototype.Relationship"}], "title": "Entités enfant", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "smInfo__Responsable", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Nom"}, {"name": "smInfo__Courriel", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Courriel"}, {"name": "smInfo__Tel", "xtype": "textfield", "__ptType": "formField", "fieldLabel": "Tel"}], "title": "Responsable", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "smCreatedBy", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Créé par"}, {"name": "smCreatedOn", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Date création"}, {"name": "smModifiedBy", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Modifié par"}, {"name": "smModifiedOn", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Date modif."}], "title": "Gérance", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "title": "Entité", "height": 1200, "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "dbName", "description"], "initialSort": [], "listDisplay": ["code", "model__code", "model__project__code", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "dbName", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Entités", "updateTime": "2017-08-23 18:55:29", "viewEntity": "prototype.Entity", "description": "Entités", "metaVersion": "150625", "sheetConfig": [{"name": "exportWiki", "__ptType": "sheetDef", "template": "prototype/wikientity.txt", "sheetType": "printerOnly", "sheetDetails": []}], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Données", "detailName": "Données", "detailField": "entity__pk", "masterField": "pk", "conceptDetail": "prototype.Property"}, {"__ptType": "detailDef", "menuText": "Entités enfant", "detailName": "Entités enfant", "detailField": "refEntity__pk", "masterField": "pk", "conceptDetail": "prototype.Relationship"}]}
25	prototype.Property	Property	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Donnée", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.Property", "fieldLabel": "Donnée"}, {"name": "baseType", "type": "combo", "header": "baseType", "choices": "string,text,bool,int,sequence,decimal,money,combo,date,datetime,time", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "nom donnée", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "nom donnée", "searchable": true}, {"name": "crudType", "type": "combo", "header": "crudType", "choices": "storeOnly,readOnly,insertOnly,updateOnly", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "dbName", "type": "string", "header": "dbName", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "entity_id", "name": "entity", "type": "foreigntext", "header": "lien entité", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Entity", "fieldLabel": "lien entité"}, {"name": "entity__code", "type": "string", "header": "nom entité", "__ptType": "field", "readOnly": true, "fieldLabel": "nom entité"}, {"fkId": "model_id", "name": "entity__model", "type": "foreigntext", "header": "model", "__ptType": "field", "cellLink": true, "readOnly": true, "zoomModel": "prototype.Model"}, {"name": "entity__model__code", "type": "string", "header": "nom modèle", "__ptType": "field", "readOnly": true, "fieldLabel": "nom modèle"}, {"name": "isEssential", "type": "bool", "header": "isEssential", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isForeign", "type": "bool", "header": "clé étrangère", "__ptType": "field", "readOnly": true, "sortable": true, "fieldLabel": "clé étrangère", "searchable": true}, {"name": "isLookUpResult", "type": "bool", "header": "isLookUpResult", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isNullable", "type": "bool", "header": "valeur nulle", "__ptType": "field", "sortable": true, "fieldLabel": "valeur nullle", "searchable": true}, {"name": "isPrimary", "type": "bool", "header": "clé primaire", "__ptType": "field", "sortable": true, "fieldLabel": "clé primaire", "searchable": true}, {"name": "isReadOnly", "type": "bool", "header": "isReadOnly", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isRequired", "type": "bool", "header": "requis", "__ptType": "field", "sortable": true, "fieldLabel": "requis", "searchable": true}, {"name": "isSensitive", "type": "bool", "header": "isSensitive", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "prpChoices", "type": "text", "vType": "plainText", "header": "prpChoices", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "prpDefault", "type": "string", "header": "prpDefault", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "prpLength", "type": "int", "header": "prpLength", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "prpScale", "type": "int", "header": "prpScale", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "smVersion", "type": "string", "header": "smVersion", "__ptType": "field", "readOnly": true}, {"name": "vType", "type": "combo", "header": "vType", "choices": "string,text,bool,int,sequence,decimal,money,combo,date,datetime,time", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "fkField": "entity", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smInfo", "type": "text", "header": "smInfo", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Property", "viewIcon": "icon-1", "contextTo": [], "jsonField": "smInfo", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom "}, {"name": "entity", "__ptType": "formField", "fieldLabel": "Entité"}, {"name": "entity__model__code", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom modèle"}, {"name": "description", "__ptType": "formField"}, {"items": [{"name": "isPrimary", "__ptType": "formField", "__ptConfig": {"name": "isPrimary", "__ptType": "formField"}}, {"name": "baseType", "__ptType": "formField", "__ptConfig": {"name": "baseType", "__ptType": "formField"}}, {"name": "prpLength", "__ptType": "formField", "__ptConfig": {"name": "prpLength", "__ptType": "formField", "fieldLabel": "longueur"}, "fieldLabel": "longueur"}], "__ptType": "fieldset", "fsLayout": "3col"}], "title": "Fiche donnée", "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "isRequired", "__ptType": "formField"}, {"name": "isForeign", "__ptType": "formField"}, {"name": "isReadOnly", "__ptType": "formField"}, {"name": "isNullable", "__ptType": "formField"}, {"name": "isSensitive", "__ptType": "formField"}, {"name": "prpDefault", "__ptType": "formField", "fieldLabel": "valeur par défaut"}, {"name": "prpScale", "__ptType": "formField", "fieldLabel": "décimales"}, {"name": "crudType", "__ptType": "formField"}, {"name": "vType", "__ptType": "formField"}, {"name": "prpChoices", "xtype": "textarea", "__ptType": "formField", "fieldLabel": "PrpChoices", "labelAlign": "top"}], "title": "Autres caractéristiques", "__ptType": "fieldset", "fsLayout": "2col", "collapsible": true}, {"items": [{"name": "notes", "__ptType": "formField"}], "title": "Documentation", "__ptType": "fieldset", "fsLayout": "1col", "collapsed": true, "collapsible": true}], "title": "Fiche donnée", "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "baseType", "prpDefault", "prpChoices", "description", "notes", "vType", "crudType", "dbName"], "initialSort": [], "listDisplay": ["code", "entity__code", "isPrimary", "isForeign", "isRequired", "baseType", "prpLength", "entity__model__code", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "baseType", "prpDefault", "prpChoices", "description", "notes", "vType", "crudType", "dbName"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Données", "updateTime": "2017-08-29 22:44:22", "viewEntity": "prototype.Property", "description": "Données", "metaVersion": "150625", "sheetConfig": [{"name": "exportWiki", "__ptType": "sheetDef", "template": "prototype/wikiproperty.txt", "sheetType": "printerOnly", "sheetDetails": []}], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
53	auth.Permission	Permission	t	f	{"fields": [{"name": "codename", "type": "string", "header": "codename", "required": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Permission", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "auth.Permission"}, {"name": "content_type_id", "type": "foreignid", "hidden": true, "fkField": "content_type", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"fkId": "content_type_id", "name": "content_type", "type": "foreigntext", "header": "content type", "required": true, "sortable": true, "zoomModel": "contenttypes.ContentType", "searchable": false}, {"name": "name", "type": "string", "header": "name", "required": true, "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "auth.Permission", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "codename", "__ptType": "formField"}, {"name": "content_type", "__ptType": "formField"}, {"name": "name", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["name", "codename"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["name", "codename"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Permission", "viewEntity": "auth.Permission", "description": "Permission", "metaVersion": "150625", "detailsConfig": []}
49	protoLib.VersionHeaders	Version Headers	t	f	{"fields": [{"fkId": "modelCType_id", "name": "modelCType", "type": "foreigntext", "header": "modelCType", "required": true, "sortable": true, "zoomModel": "contenttypes.ContentType", "searchable": false}, {"name": "modelCType_id", "type": "foreignid", "hidden": true, "fkField": "modelCType", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Version Headers", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoLib.VersionHeaders"}, {"name": "exclude", "type": "bool", "header": "exclude", "sortable": true, "searchable": true}], "actions": [], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "protoLib.VersionHeaders", "viewIcon": "icon-1", "defaultTo": [], "formConfig": {"items": [{"items": [{"name": "modelCType", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "exclude", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": [], "initialSort": [], "listDisplay": ["__str__", "exclude"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": [], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Version Headers", "updateTime": "2016-02-10 17:02:51", "viewEntity": "protoLib.VersionHeaders", "description": "Version Headers", "metaVersion": "150625", "sheetConfig": [], "businessRules": {}, "detailsConfig": []}
50	protoLib.EntityMap	Entity Map	t	f	{"fields": [{"name": "entityBase", "type": "proto121", "header": "entityBase", "required": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Entity Map", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoLib.EntityMap"}, {"name": "entityConfig", "type": "text", "header": "entityConfig", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": false, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "protoLib.EntityMap", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "entityBase", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["entityConfig"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["entityConfig"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Entity Map", "viewEntity": "protoLib.EntityMap", "description": "Entity Map", "metaVersion": "150625", "detailsConfig": []}
51	taggit.TaggedItem	Tagged Item	t	f	{"fields": [{"fkId": "tag_id", "name": "tag", "type": "foreigntext", "header": "tag", "required": true, "sortable": true, "zoomModel": "taggit.Tag", "searchable": false}, {"name": "tag_id", "type": "foreignid", "hidden": true, "fkField": "tag", "readOnly": true}, {"name": "object_id", "type": "int", "header": "Object id", "required": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "content_type_id", "type": "foreignid", "hidden": true, "fkField": "content_type", "readOnly": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Tagged Item", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "taggit.TaggedItem"}, {"fkId": "content_type_id", "name": "content_type", "type": "foreigntext", "header": "Content type", "required": true, "sortable": true, "zoomModel": "contenttypes.ContentType", "searchable": false}], "exclude": [], "gridSets": {}, "viewCode": "taggit.TaggedItem", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "tag", "__ptType": "formField"}, {"name": "object_id", "__ptType": "formField"}, {"name": "content_type", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": [], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": [], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Tagged Item", "viewEntity": "taggit.TaggedItem", "description": "Tagged Item", "metaVersion": "150625", "detailsConfig": []}
52	reversion.Version	Version	t	f	{"fields": [{"fkId": "content_type_id", "name": "content_type", "type": "foreigntext", "header": "content type", "tooltip": "Content type of the model under version control.", "required": true, "sortable": true, "zoomModel": "contenttypes.ContentType", "searchable": false}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Version", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "reversion.Version"}, {"name": "format", "type": "string", "header": "format", "tooltip": "The serialization format used by this model.", "required": true, "sortable": true, "searchable": true}, {"name": "revision_id", "type": "foreignid", "hidden": true, "fkField": "revision", "readOnly": true}, {"name": "serialized_data", "type": "text", "vType": "plainText", "header": "serialized data", "tooltip": "The serialized form of this version of the model.", "required": true, "sortable": true, "searchable": true}, {"name": "object_id", "type": "text", "vType": "plainText", "header": "object id", "tooltip": "Primary key of the model under version control.", "required": true, "sortable": true, "searchable": true}, {"name": "object_id_int", "type": "int", "header": "object id int", "tooltip": "An indexed, integer version of the stored model's primary key, used for faster lookups.", "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "content_type_id", "type": "foreignid", "hidden": true, "fkField": "content_type", "readOnly": true}, {"name": "object_repr", "type": "text", "vType": "plainText", "header": "object repr", "tooltip": "A string representation of the object.", "required": true, "sortable": true, "searchable": true}, {"fkId": "revision_id", "name": "revision", "type": "foreigntext", "header": "revision", "tooltip": "The revision that contains this version.", "required": true, "sortable": true, "zoomModel": "reversion.Revision", "searchable": false}], "exclude": [], "gridSets": {}, "viewCode": "reversion.Version", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "content_type", "__ptType": "formField"}, {"name": "format", "__ptType": "formField"}, {"name": "revision", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "object_id_int", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "serialized_data", "__ptType": "formField"}, {"name": "object_id", "__ptType": "formField"}, {"name": "object_repr", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["object_id", "format", "serialized_data", "object_repr"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["object_id", "format", "serialized_data", "object_repr"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Version", "viewEntity": "reversion.Version", "description": "Version", "metaVersion": "150625", "detailsConfig": []}
61	contenttypes.ContentType	Content Type	t	f	{"fields": [{"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "model", "type": "string", "header": "python model class name", "required": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Content Type", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "contenttypes.ContentType"}, {"name": "app_label", "type": "string", "header": "app label", "required": true, "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "contenttypes.ContentType", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "model", "__ptType": "formField"}, {"name": "app_label", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["app_label", "model"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["app_label", "model"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Content Type", "viewEntity": "contenttypes.ContentType", "description": "Content Type", "metaVersion": "150625", "detailsConfig": [{"menuText": "Logentry.content_type", "detailName": "logentry.content_type", "detailField": "content_type__pk", "masterField": "pk", "conceptDetail": "admin.LogEntry"}, {"menuText": "Permission.content_type", "detailName": "permission.content_type", "detailField": "content_type__pk", "masterField": "pk", "conceptDetail": "auth.Permission"}, {"menuText": "Version.content_type", "detailName": "version.content_type", "detailField": "content_type__pk", "masterField": "pk", "conceptDetail": "reversion.Version"}, {"menuText": "Entitymap.entityBase", "detailName": "entitymap.entityBase", "detailField": "entityBase__pk", "masterField": "pk", "conceptDetail": "protoLib.EntityMap"}, {"menuText": "Contextvar.modelCType", "detailName": "contextvar.modelCType", "detailField": "modelCType__pk", "masterField": "pk", "conceptDetail": "protoLib.ContextVar"}, {"menuText": "Contextentity.entity", "detailName": "contextentity.entity", "detailField": "entity__pk", "masterField": "pk", "conceptDetail": "protoLib.ContextEntity"}, {"menuText": "Versionheaders.modelCType", "detailName": "versionheaders.modelCType", "detailField": "modelCType__pk", "masterField": "pk", "conceptDetail": "protoLib.VersionHeaders"}, {"menuText": "Taggeditem.content_type", "detailName": "taggeditem.content_type", "detailField": "content_type__pk", "masterField": "pk", "conceptDetail": "taggit.TaggedItem"}]}
69	protoLib.ContextUser	Context User	t	f	{"fields": [{"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "contextVar_id", "name": "contextVar", "type": "foreigntext", "header": "contextVar", "required": true, "sortable": true, "zoomModel": "protoLib.ContextVar", "searchable": false}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "propValue", "type": "string", "header": "propValue", "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Context User", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoLib.ContextUser"}, {"name": "active", "type": "bool", "header": "active", "sortable": true, "searchable": true}, {"name": "contextVar_id", "type": "foreignid", "hidden": true, "fkField": "contextVar", "readOnly": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "protoLib.ContextUser", "viewIcon": "icon-1", "contextTo": [], "formConfig": {"items": [{"items": [{"name": "contextVar", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "active", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "propValue", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "description", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smUUID", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smRegStatus", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "propValue", "description"], "initialSort": [], "listDisplay": ["__str__", "propValue", "description", "contextVar", "smOwningUser"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "propValue", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Context User", "updateTime": "2016-02-18 15:30:32", "viewEntity": "protoLib.ContextUser", "description": "Context User", "metaVersion": "150625", "sheetConfig": [], "businessRules": {}, "detailsConfig": []}
70	prototype.ProtoVersionTitle	Proto Version Title	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Proto Version Title", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoVersionTitle"}, {"name": "active", "type": "bool", "header": "active", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "Descriptions", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "versionBase_id", "name": "versionBase", "type": "foreigntext", "header": "versionBase", "__ptType": "field", "sortable": true, "zoomModel": "prototype.ProtoVersionTitle"}, {"name": "versionCode", "type": "string", "header": "versionCode", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "versionBase_id", "type": "foreignid", "hidden": true, "fkField": "versionBase", "__ptType": "field", "readOnly": true}], "actions": [{"name": "doCopyVersion", "__ptType": "actionDef", "menuText": "doCopyVersion", "actionParams": [], "selectionMode": "single"}, {"name": "doDeleteVersion", "__ptType": "actionDef", "menuText": "doDeleteVersion", "actionParams": [], "selectionMode": "single"}, {"name": "doSetContext", "__ptType": "actionDef", "menuText": "doSetContext", "actionParams": [], "selectionMode": "optional"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoVersionTitle", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "active", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "versionBase", "__ptType": "formField"}, {"name": "versionCode", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "description", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smRegStatus", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "versionCode", "description"], "initialSort": [], "listDisplay": ["__str__", "description", "smCreatedBy"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "versionCode", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Proto Version Title", "updateTime": "2016-04-13 15:24:08", "viewEntity": "prototype.ProtoVersionTitle", "description": "Proto Version Title", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Protoversiontitle.versionBase", "detailName": "protoversiontitle.versionBase", "detailField": "versionBase__pk", "masterField": "pk", "conceptDetail": "prototype.ProtoVersionTitle"}, {"__ptType": "detailDef", "menuText": "Project.smVersion", "detailName": "project.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.Project"}, {"__ptType": "detailDef", "menuText": "Model.smVersion", "detailName": "model.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.Model"}, {"__ptType": "detailDef", "menuText": "Entity.smVersion", "detailName": "entity.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.Entity"}, {"__ptType": "detailDef", "menuText": "Property.smVersion", "detailName": "property.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.Property"}, {"__ptType": "detailDef", "menuText": "Propertyequivalence.smVersion", "detailName": "propertyequivalence.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.PropertyEquivalence"}, {"__ptType": "detailDef", "menuText": "Prototype.smVersion", "detailName": "prototype.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.Prototype"}, {"__ptType": "detailDef", "menuText": "Prototable.smVersion", "detailName": "prototable.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.ProtoTable"}, {"__ptType": "detailDef", "menuText": "Diagram.smVersion", "detailName": "diagram.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.Diagram"}, {"__ptType": "detailDef", "menuText": "Diagramentity.smVersion", "detailName": "diagramentity.smVersion", "detailField": "smVersion__pk", "masterField": "pk", "conceptDetail": "prototype.DiagramEntity"}]}
71	prototype.ProtoVersionHeader	Proto Version Header	t	f	{"fields": [{"fkId": "modelCType_id", "name": "modelCType", "type": "foreigntext", "header": "modelCType", "required": true, "sortable": true, "zoomModel": "contenttypes.ContentType", "searchable": false}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Proto Version Header", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoVersionHeader"}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "modelCType_id", "type": "foreignid", "hidden": true, "fkField": "modelCType", "readOnly": true}, {"name": "exclude", "type": "bool", "header": "exclude", "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}], "exclude": [], "gridSets": {}, "viewCode": "prototype.ProtoVersionHeader", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "modelCType", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "exclude", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smRegStatus", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Proto Version Header", "viewEntity": "prototype.ProtoVersionHeader", "description": "Proto Version Header", "metaVersion": "150625", "detailsConfig": []}
72	protoLib.ContextVar	Context Var	t	f	{"fields": [{"fkId": "modelCType_id", "name": "modelCType", "type": "foreigntext", "header": "modelCType", "required": true, "sortable": true, "zoomModel": "contenttypes.ContentType", "searchable": false}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Context Var", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoLib.ContextVar"}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "propName", "type": "string", "header": "propName", "required": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "modelCType_id", "type": "foreignid", "hidden": true, "fkField": "modelCType", "readOnly": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}], "exclude": [], "gridSets": {}, "viewCode": "protoLib.ContextVar", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "modelCType", "__ptType": "formField"}, {"name": "propName", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "description", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smRegStatus", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "propName", "description"], "initialSort": [], "listDisplay": ["__str__", "propName", "description"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "propName", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Context Var", "viewEntity": "protoLib.ContextVar", "description": "Context Var", "metaVersion": "150625", "detailsConfig": [{"menuText": "Contextentity.contextVar", "detailName": "contextentity.contextVar", "detailField": "contextVar__pk", "masterField": "pk", "conceptDetail": "protoLib.ContextEntity"}, {"menuText": "Contextuser.contextVar", "detailName": "contextuser.contextVar", "detailField": "contextVar__pk", "masterField": "pk", "conceptDetail": "protoLib.ContextUser"}]}
73	protoLib.ContextEntity	Context Entity	t	f	{"fields": [{"fkId": "entity_id", "name": "entity", "type": "foreigntext", "header": "entity", "required": true, "sortable": true, "zoomModel": "contenttypes.ContentType", "searchable": false}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Context Entity", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoLib.ContextEntity"}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "fkField": "entity", "readOnly": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "contextVar_id", "name": "contextVar", "type": "foreigntext", "header": "contextVar", "required": true, "sortable": true, "zoomModel": "protoLib.ContextVar", "searchable": false}, {"name": "propName", "type": "string", "header": "propName", "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "active", "type": "bool", "header": "active", "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "contextVar_id", "type": "foreignid", "hidden": true, "fkField": "contextVar", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}], "exclude": [], "gridSets": {}, "viewCode": "protoLib.ContextEntity", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "entity", "__ptType": "formField"}, {"name": "contextVar", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "active", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "propName", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smNaturalCode", "__ptType": "formField"}, {"name": "smRegStatus", "__ptType": "formField"}, {"name": "smWflowStatus", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smUUID", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "propName"], "initialSort": [], "listDisplay": ["__str__", "propName"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "propName"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Context Entity", "viewEntity": "protoLib.ContextEntity", "description": "Context Entity", "metaVersion": "150625", "detailsConfig": []}
81	protoLib.TeamHierarchy	Team Hierarchy	t	f	{"fields": [{"fkId": "parentNode_id", "name": "parentNode", "type": "foreigntext", "header": "parentNode", "sortable": true, "zoomModel": "protoLib.TeamHierarchy", "searchable": false}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Team Hierarchy", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoLib.TeamHierarchy"}, {"name": "parentNode_id", "type": "foreignid", "hidden": true, "fkField": "parentNode", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "site", "type": "int", "header": "site", "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "Descriptions", "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "protoLib.TeamHierarchy", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "parentNode", "__ptType": "formField"}, {"name": "site", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "description", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["code", "description"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["code", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Team Hierarchy", "viewEntity": "protoLib.TeamHierarchy", "description": "Team Hierarchy", "metaVersion": "150625", "detailsConfig": [{"menuText": "Teamhierarchy.parentNode", "detailName": "teamhierarchy.parentNode", "detailField": "parentNode__pk", "masterField": "pk", "conceptDetail": "protoLib.TeamHierarchy"}, {"menuText": "Userprofile.userTeam", "detailName": "userprofile.userTeam", "detailField": "userTeam__pk", "masterField": "pk", "conceptDetail": "protoLib.UserProfile"}]}
241	auth.Group	Group	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Group", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "auth.Group"}, {"name": "name", "type": "string", "header": "name", "__ptType": "field", "required": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "auth.Group", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "name", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["name"], "initialSort": [], "listDisplay": ["__str__"], "hiddenFields": ["id"], "searchFields": ["name"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Group", "updateTime": "2016-06-15 16:33:38", "viewEntity": "auth.Group", "description": "Group", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Group_permissions.group", "detailName": "group_permissions.group", "detailField": "group__pk", "masterField": "pk", "conceptDetail": "auth.Group_permissions"}, {"__ptType": "detailDef", "menuText": "User_groups.group", "detailName": "user_groups.group", "detailField": "group__pk", "masterField": "pk", "conceptDetail": "auth.User_groups"}]}
242	auth.Group_permissions	Group-Permission Relationship	t	f	{"fields": [{"name": "group_id", "type": "foreignid", "hidden": true, "fkField": "group", "readOnly": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Group-Permission Relationship", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "auth.Group_permissions"}, {"fkId": "permission_id", "name": "permission", "type": "foreigntext", "header": "permission", "required": true, "sortable": true, "zoomModel": "auth.Permission", "searchable": false}, {"name": "permission_id", "type": "foreignid", "hidden": true, "fkField": "permission", "readOnly": true}, {"fkId": "group_id", "name": "group", "type": "foreigntext", "header": "group", "required": true, "sortable": true, "zoomModel": "auth.Group", "searchable": false}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}], "actions": [], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "auth.Group_permissions", "viewIcon": "icon-1", "contextTo": [], "formConfig": {"items": [{"items": [{"name": "permission", "__ptType": "formField"}, {"name": "group", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": [], "initialSort": [], "listDisplay": ["__str__", "permission", "group"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": [], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Group-Permission Relationship", "updateTime": "2016-06-15 16:32:32", "viewEntity": "auth.Group_permissions", "description": "Group-Permission Relationship", "metaVersion": "150625", "sheetConfig": [], "businessRules": {}, "detailsConfig": []}
243	auth.User_groups	User-Group Relationship	t	f	{"fields": [{"name": "group_id", "type": "foreignid", "hidden": true, "fkField": "group", "readOnly": true}, {"name": "user_id", "type": "foreignid", "hidden": true, "fkField": "user", "readOnly": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "User-Group Relationship", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "auth.User_groups"}, {"fkId": "group_id", "name": "group", "type": "foreigntext", "header": "group", "cellLink": true, "required": true, "sortable": true, "zoomModel": "auth.Group", "searchable": false}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"fkId": "user_id", "name": "user", "type": "foreigntext", "header": "user", "cellLink": true, "required": true, "sortable": true, "zoomModel": "auth.User", "searchable": false}], "actions": [], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "auth.User_groups", "viewIcon": "icon-1", "contextTo": [], "formConfig": {"items": [{"items": [{"name": "group", "__ptType": "formField"}, {"name": "user", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": [], "initialSort": [], "listDisplay": ["group", "user"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": [], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "User-Group Relationship", "updateTime": "2016-06-15 16:30:54", "viewEntity": "auth.User_groups", "description": "User-Group Relationship", "metaVersion": "150625", "sheetConfig": [], "businessRules": {}, "detailsConfig": []}
245	protoLib.UserProfile	User Profile	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "User Profile", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoLib.UserProfile"}, {"name": "language", "type": "string", "header": "language", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "user", "type": "string", "header": "user", "__ptType": "field", "required": true, "sortable": true}, {"name": "userConfig", "type": "text", "header": "userConfig", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"fkId": "userTeam_id", "name": "userTeam", "type": "foreigntext", "header": "userTeam", "__ptType": "field", "sortable": true, "zoomModel": "protoLib.TeamHierarchy"}, {"name": "userTree", "type": "string", "header": "userTree", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "userTeam_id", "type": "foreignid", "hidden": true, "fkField": "userTeam", "__ptType": "field", "readOnly": true}], "actions": [{"name": "doAddUser", "__ptType": "actionDef", "menuText": "doAddUser", "actionParams": [{"name": "User", "type": "string", "tooltip": "UserName", "__ptType": "actionParam", "required": true}, {"name": "Pwd", "type": "string", "tooltip": "Pwd", "__ptType": "actionParam"}, {"name": "EMail", "type": "string", "tooltip": "Email", "__ptType": "actionParam"}, {"name": "Team", "type": "string", "tooltip": "Tean", "__ptType": "actionParam"}, {"name": "Groups", "type": "string", "tooltip": "gr1,gr2,...", "__ptType": "actionParam"}], "selectionMode": "none", "refreshOnComplete": true}, {"name": "doAddUsers", "__ptType": "actionDef", "menuText": "doAddUsers", "actionParams": [{"name": "Users", "type": "text", "tooltip": "Usr, Pwd, email, team, group1, .. group(n)", "__ptType": "actionParam", "required": true}], "selectionMode": "none", "refreshOnComplete": true}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "protoLib.UserProfile", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "user", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "language", "__ptType": "formField"}, {"name": "userTeam", "__ptType": "formField"}, {"name": "userTree", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["language", "userTree", "userConfig"], "initialSort": [], "listDisplay": ["__str__"], "hiddenFields": ["id"], "searchFields": ["language", "userTree", "userConfig"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "User Profile", "updateTime": "2016-08-24 15:38:19", "viewEntity": "protoLib.UserProfile", "description": "User Profile", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
331	rai01ref.ProjectCapacity	Project Capacity	t	f	{"fields": [{"name": "projet_id", "type": "foreignid", "hidden": true, "fkField": "projet", "readOnly": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "projet_id", "name": "projet", "type": "foreigntext", "header": "projet", "required": true, "sortable": true, "zoomModel": "rai01ref.Projet", "searchable": false}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "required": true, "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "capacity_id", "type": "foreignid", "hidden": true, "fkField": "capacity", "readOnly": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Project Capacity", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.ProjectCapacity"}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}], "exclude": [], "gridSets": {}, "viewCode": "rai01ref.ProjectCapacity", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "projet", "__ptType": "formField"}, {"name": "capacity", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "notes", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Project Capacity", "viewEntity": "rai01ref.ProjectCapacity", "description": "Project Capacity", "metaVersion": "150625", "detailsConfig": []}
246	prototype.Entity.nv-prop	\N	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Entity", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.Entity"}, {"name": "code", "type": "string", "header": "code", "__ptType": "field", "required": true, "sortable": true, "searchable": true}, {"name": "dbName", "type": "string", "header": "dbName", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "model_id", "name": "model", "type": "foreigntext", "header": "model", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Model", "prpDefault": "aaaa"}, {"name": "smInfo", "type": "text", "header": "smInfo", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smVersion", "type": "string", "header": "smVersion", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "model_id", "type": "foreignid", "header": "model_id", "hidden": true, "fkField": "model", "__ptType": "field", "readOnly": true, "prpDefault": 11}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doEntityPrototype", "__ptType": "actionDef", "actionParams": [{"name": "viewCode", "type": "string", "tooltip": "option de menu (msi)", "__ptType": "actionParam", "required": true}], "selectionMode": "single"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Entity.nv-prop", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "model", "__ptType": "formField"}, {"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField"}], "title": "carra", "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"__ptType": "smGrid", "menuText": "Properties", "viewCode": "prototype.Property"}], "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "dbName", "description"], "initialSort": [], "listDisplay": ["__str__", "description", "smOwningTeam", "smVersion"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "dbName", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Entity", "updateTime": "2016-10-04 17:29:58", "viewEntity": "prototype.Entity", "description": "Entity", "metaVersion": "150625", "sheetConfig": [{"name": "exportWiki", "__ptType": "sheetDef", "template": "prototype/wikientity.txt", "sheetType": "printerOnly", "sheetDetails": []}], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Properties", "detailName": "entity", "detailField": "entity__pk", "masterField": "pk", "conceptDetail": "prototype.Property"}, {"__ptType": "detailDef", "menuText": "Relationships", "detailName": "entity", "detailField": "entity__pk", "masterField": "pk", "conceptDetail": "prototype.Relationship"}, {"__ptType": "detailDef", "menuText": "Views", "detailName": "entity", "detailField": "entity__pk", "masterField": "pk", "conceptDetail": "prototype.Prototype"}, {"name": "nouvelleformeprop", "__ptType": "detailDef"}]}
266	protoExt.Parameters	Parameters	t	f	{"fields": [{"name": "smInfo", "type": "text", "header": "smInfo", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": false, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "parameterKey", "type": "string", "header": "parameterKey", "required": true, "sortable": true, "searchable": true}, {"name": "parameterValue", "type": "string", "header": "parameterValue", "required": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Parameters", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoExt.Parameters"}, {"name": "parameterTag", "type": "string", "header": "parameterTag", "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "protoExt.Parameters", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "parameterKey", "__ptType": "formField"}, {"name": "parameterValue", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "parameterTag", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "parameterKey", "parameterTag", "parameterValue"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "parameterKey", "parameterTag", "parameterValue"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Parameters", "viewEntity": "protoExt.Parameters", "description": "Parameters", "metaVersion": "150625", "detailsConfig": []}
308	rai01ref.DocType	Doc Type	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Composante", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.DocType", "fieldLabel": "Composante"}, {"name": "category", "type": "string", "header": "Catégorie", "__ptType": "field", "sortable": true, "fieldLabel": "Catégorie", "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom composante", "__ptType": "field", "sortable": true, "fieldLabel": "Nom composante", "searchable": true}, {"name": "document", "type": "combo", "header": "Concept", "choices": "Artefact,Capacity,Requirement", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Concept", "searchable": true}, {"name": "dtype", "type": "string", "header": "Nom Menu Composante", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom Menu Composante", "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doRaiMenu", "__ptType": "actionDef", "menuText": "doRaiMenu", "actionParams": [], "selectionMode": "multiple"}], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.DocType", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "document", "__ptType": "formField", "fieldLabel": "Concept"}, {"name": "dtype", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "category", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"__ptType": "smGrid", "menuText": "Docattribute.docType", "viewCode": "rai01ref.DocAttribute"}], "title": "Champs", "__ptType": "fieldset", "fsLayout": "1col", "collapsed": true, "collapsible": true}, {"items": [{"name": "notes", "__ptType": "formField"}], "title": "Notes", "__ptType": "fieldset", "fsLayout": "1col", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Artefact.docType/Artefactsource.artefact", "viewCode": "rai01ref.ArtefactSource"}], "title": "Sources", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "title": "Composante", "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "document", "dtype", "category", "notes", "description"], "initialSort": [], "listDisplay": ["document", "dtype", "category", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "document", "dtype", "category", "notes", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Composante", "updateTime": "2016-11-03 18:14:23", "viewEntity": "rai01ref.DocType", "description": "Composante", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Docattribute.docType", "detailName": "docattribute.docType", "detailField": "docType__pk", "masterField": "pk", "conceptDetail": "rai01ref.DocAttribute"}, {"__ptType": "detailDef", "menuText": "Capacity.docType", "detailName": "capacity.docType", "detailField": "docType__pk", "masterField": "pk", "conceptDetail": "rai01ref.Capacity"}, {"__ptType": "detailDef", "menuText": "Requirement.docType", "detailName": "requirement.docType", "detailField": "docType__pk", "masterField": "pk", "conceptDetail": "rai01ref.Requirement"}, {"__ptType": "detailDef", "menuText": "Artefact.docType", "detailName": "artefact.docType", "detailField": "docType__pk", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}, {"__ptType": "detailDef", "menuText": "Artefact.docType/Artefactsource.artefact", "detailField": "artefactsource.artefact__docType__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}]}
309	rai01ref.Artefact	Artefact	t	f	{"fields": [{"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"name": "refArtefact_id", "type": "foreignid", "header": "refArtefact_id", "hidden": true, "fkField": "refArtefact", "readOnly": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Requirement", "searchable": false}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"name": "requirement_id", "type": "foreignid", "header": "requirement_id", "hidden": true, "fkField": "requirement", "readOnly": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "info", "type": "text", "header": "info", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"fkId": "refArtefact_id", "name": "refArtefact", "type": "foreigntext", "header": "Parent", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "copyFrom_id", "type": "foreignid", "header": "copyFrom_id", "hidden": true, "fkField": "copyFrom", "readOnly": true}, {"name": "capacity_id", "type": "foreignid", "header": "capacity_id", "hidden": true, "fkField": "capacity", "readOnly": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "searchable": false}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "docType__category", "type": "string", "header": "category", "readOnly": true, "required": false}, {"name": "docType__description", "type": "text", "vType": "plainText", "header": "description", "readOnly": true, "required": false}, {"name": "docType__document", "type": "combo", "header": "document", "choices": "Artefact,Capacity,Requirement", "readOnly": true, "required": false}, {"name": "docType__dtype", "type": "string", "header": "DocType", "readOnly": true, "required": false}, {"name": "docType__notes", "type": "text", "vType": "plainText", "header": "notes", "readOnly": true, "required": false}], "actions": [{"name": "doBusinessProcessDiagram", "menuText": "doBusinessProcessDiagram", "selectionMode": "sinlge"}, {"name": "doUpdateMeta", "menuText": "doUpdateMeta", "selectionMode": "none"}], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Artefact", "viewIcon": "icon-1", "contextTo": [], "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "capacity", "__ptType": "formField"}, {"name": "requirement", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}, {"name": "refArtefact", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description", "docType__dtype"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Artefact", "updateTime": "2016-11-03 15:35:13", "viewEntity": "rai01ref.Artefact", "description": "Artefact", "metaVersion": "150625", "sheetConfig": [], "businessRules": {}, "detailsConfig": [{"menuText": "Artefact.refArtefact", "detailName": "artefact.refArtefact", "detailField": "refArtefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}, {"menuText": "Artefact.copyFrom", "detailName": "artefact.copyFrom", "detailField": "copyFrom__pk", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}, {"menuText": "Artefactcomposition.containerArt", "detailName": "artefactcomposition.containerArt", "detailField": "containerArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"menuText": "Artefactcomposition.inputArt", "detailName": "artefactcomposition.inputArt", "detailField": "inputArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"menuText": "Artefactcomposition.outputArt", "detailName": "artefactcomposition.outputArt", "detailField": "outputArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"menuText": "Artefactrequirement.artefact", "detailName": "artefactrequirement.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"menuText": "Artefactcapacity.artefact", "detailName": "artefactcapacity.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"menuText": "Projectartefact.artefact", "detailName": "projectartefact.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectArtefact"}, {"menuText": "Artefactsource.artefact", "detailName": "artefactsource.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}]}
310	rai01ref.Requirement	Requirement	t	f	{"fields": [{"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "info", "type": "text", "header": "info", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": false, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "refRequirement_id", "name": "refRequirement", "type": "foreigntext", "header": "Parent", "sortable": true, "zoomModel": "rai01ref.Requirement", "searchable": false}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Requirement", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Requirement"}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "copyFrom_id", "type": "foreignid", "hidden": true, "fkField": "copyFrom", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "refRequirement_id", "type": "foreignid", "hidden": true, "fkField": "refRequirement", "readOnly": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "sortable": true, "zoomModel": "rai01ref.DocType", "searchable": false}, {"name": "docType_id", "type": "foreignid", "hidden": true, "fkField": "docType", "readOnly": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "sortable": true, "zoomModel": "rai01ref.Requirement", "searchable": false}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doUpdateMeta", "selectionMode": "none"}], "exclude": [], "gridSets": {}, "viewCode": "rai01ref.Requirement", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "refRequirement", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Requirement", "viewEntity": "rai01ref.Requirement", "description": "Requirement", "metaVersion": "150625", "detailsConfig": [{"menuText": "Requirement.refRequirement", "detailName": "requirement.refRequirement", "detailField": "refRequirement__pk", "masterField": "pk", "conceptDetail": "rai01ref.Requirement"}, {"menuText": "Requirement.copyFrom", "detailName": "requirement.copyFrom", "detailField": "copyFrom__pk", "masterField": "pk", "conceptDetail": "rai01ref.Requirement"}, {"menuText": "Artefact.requirement", "detailName": "artefact.requirement", "detailField": "requirement__pk", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}, {"menuText": "Artefactrequirement.requirement", "detailName": "artefactrequirement.requirement", "detailField": "requirement__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"menuText": "Projectrequirement.requirement", "detailName": "projectrequirement.requirement", "detailField": "requirement__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectRequirement"}]}
311	rai01ref.DocAttribute	Doc Attribute	t	f	{"fields": [{"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "isSensitive", "type": "bool", "header": "isSensitive", "sortable": true, "searchable": true}, {"name": "prpLength", "type": "int", "header": "prpLength", "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "prpDefault", "type": "string", "header": "prpDefault", "sortable": true, "searchable": true}, {"name": "crudType", "type": "combo", "header": "crudType", "choices": "editable,readOnly,insertOnly,updateOnly,storeOnly,screenOnly", "sortable": true, "searchable": true}, {"name": "baseType", "type": "combo", "header": "baseType", "choices": "string,text,bool,int,sequence,decimal,money,combo,date,datetime,time", "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "readOnly": true}, {"name": "isRequired", "type": "bool", "header": "isRequired", "sortable": true, "searchable": true}, {"name": "vType", "type": "combo", "header": "vType", "choices": "string,text,bool,int,sequence,decimal,money,combo,date,datetime,time", "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Doc Attribute", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.DocAttribute"}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "searchable": false}, {"name": "prpChoices", "type": "text", "vType": "plainText", "header": "prpChoices", "sortable": true, "searchable": true}, {"name": "prpScale", "type": "int", "header": "prpScale", "sortable": true, "searchable": true}], "actions": [], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.DocAttribute", "viewIcon": "icon-1", "contextTo": [], "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "isSensitive", "__ptType": "formField"}, {"name": "isRequired", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "prpLength", "__ptType": "formField"}, {"name": "prpDefault", "__ptType": "formField"}, {"name": "crudType", "__ptType": "formField"}, {"name": "baseType", "__ptType": "formField"}, {"name": "vType", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}, {"name": "prpScale", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "prpChoices", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "baseType", "vType", "prpDefault", "prpChoices", "crudType", "description"], "initialSort": [], "listDisplay": ["docType", "code", "isRequired", "description"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "baseType", "vType", "prpDefault", "prpChoices", "crudType", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Doc Attribute", "updateTime": "2016-11-01 15:59:03", "viewEntity": "rai01ref.DocAttribute", "description": "Doc Attribute", "metaVersion": "150625", "sheetConfig": [], "businessRules": {}, "detailsConfig": []}
312	rai01ref.Capacity	Capacity	t	f	{"fields": [{"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "info", "type": "text", "header": "info", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "refCapacity_id", "name": "refCapacity", "type": "foreigntext", "header": "Parent", "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "copyFrom_id", "type": "foreignid", "hidden": true, "fkField": "copyFrom", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Capacity", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "sortable": true, "zoomModel": "rai01ref.DocType", "searchable": false}, {"name": "docType_id", "type": "foreignid", "hidden": true, "fkField": "docType", "readOnly": true}, {"name": "refCapacity_id", "type": "foreignid", "hidden": true, "fkField": "refCapacity", "readOnly": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "docType__dtype", "type": "string", "header": "DocType", "readOnly": true, "required": false}, {"name": "docType__document", "type": "combo", "header": "document", "choices": "Artefact,Capacity,Requirement", "readOnly": true, "required": false}, {"name": "docType__category", "type": "string", "header": "category", "readOnly": true, "required": false}, {"name": "docType__description", "type": "text", "vType": "plainText", "header": "description", "readOnly": true, "required": false}], "actions": [{"name": "doUpdateMeta", "menuText": "doUpdateMeta", "selectionMode": "none"}], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Capacity", "viewIcon": "icon-1", "contextTo": [], "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "refCapacity", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description", "docType__dtype"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Capacity", "updateTime": "2016-11-02 20:39:45", "viewEntity": "rai01ref.Capacity", "description": "Capacity", "metaVersion": "150625", "sheetConfig": [], "businessRules": {}, "detailsConfig": [{"menuText": "Capacity.refCapacity", "detailName": "capacity.refCapacity", "detailField": "refCapacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.Capacity"}, {"menuText": "Capacity.copyFrom", "detailName": "capacity.copyFrom", "detailField": "copyFrom__pk", "masterField": "pk", "conceptDetail": "rai01ref.Capacity"}, {"menuText": "Artefact.capacity", "detailName": "artefact.capacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}, {"menuText": "Artefactcapacity.capacity", "detailName": "artefactcapacity.capacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"menuText": "Projectcapacity.capacity", "detailName": "projectcapacity.capacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectCapacity"}]}
314	rai01ref.Artefact.tree	Tree Artefact	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Artefact.tree"}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "__ptType": "field", "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "code", "type": "string", "header": "code", "__ptType": "field", "required": true, "sortable": true, "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "sortable": true, "zoomModel": "rai01ref.DocType", "zoomFilter": "document, =Artefact"}, {"name": "iconCls", "type": "string", "__ptType": "field", "crudType": "readOnly"}, {"name": "info__caracteristiques", "type": "string", "header": "Caractéristiques", "__ptType": "field"}, {"name": "info__critere-dentree", "type": "string", "header": "Critère d'entrée", "__ptType": "field"}, {"name": "info__criteres-de-sortie", "type": "string", "header": "Critères de sortie", "__ptType": "field"}, {"name": "info__date-revision", "type": "date", "header": "Date révision", "__ptType": "field"}, {"name": "info__description-sommaire", "type": "text", "header": "Description sommaire", "__ptType": "field"}, {"name": "info__etat", "type": "string", "header": "État", "__ptType": "field"}, {"name": "info__evenement-declencheur", "type": "string", "header": "Événement déclencheur", "__ptType": "field"}, {"name": "info__frequence", "type": "string", "header": "Fréquence", "__ptType": "field"}, {"name": "info__intrant", "type": "string", "header": "Intrant", "__ptType": "field"}, {"name": "info__mode-de-traitement", "type": "string", "header": "Mode de traitement", "__ptType": "field"}, {"name": "info__redacteur", "type": "string", "header": "Rédacteur", "__ptType": "field"}, {"name": "info__responsable", "type": "string", "header": "Responsable", "__ptType": "field"}, {"name": "info__type-extrant", "type": "string", "header": "Type extrant", "__ptType": "field"}, {"name": "info__version", "type": "string", "header": "Version", "__ptType": "field"}, {"name": "info__volume", "type": "text", "header": "Volume", "__ptType": "field"}, {"fkId": "refArtefact_id", "name": "refArtefact", "type": "foreigntext", "header": "Parent", "__ptType": "field", "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "__ptType": "field", "sortable": true, "zoomModel": "rai01ref.Requirement"}, {"name": "capacity_id", "type": "foreignid", "hidden": true, "fkField": "capacity", "__ptType": "field", "readOnly": true}, {"name": "copyFrom_id", "type": "foreignid", "hidden": true, "fkField": "copyFrom", "__ptType": "field", "readOnly": true}, {"name": "docType_id", "type": "foreignid", "hidden": true, "fkField": "docType", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "refArtefact_id", "type": "foreignid", "hidden": true, "fkField": "refArtefact", "__ptType": "field", "readOnly": true}, {"name": "requirement_id", "type": "foreignid", "hidden": true, "fkField": "requirement", "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doBusinessProcessDiagram", "__ptType": "actionDef", "menuText": "doBusinessProcessDiagram", "actionParams": [], "selectionMode": "multiple"}, {"name": "doUpdateMeta", "__ptType": "actionDef", "menuText": "doUpdateMeta", "actionParams": [], "selectionMode": "none"}, {"name": "doTreeDiagram", "__ptType": "actionDef", "menuText": "doTreeDiagram", "actionParams": [], "selectionMode": "single"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "pciStyle": "tree", "viewCode": "rai01ref.Artefact.tree", "viewIcon": "icon-tree", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "refArtefact", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "capacity", "__ptType": "formField"}, {"name": "requirement", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Artefact", "updateTime": "2016-11-11 16:09:47", "viewEntity": "rai01ref.Artefact", "description": "Tree Artefact", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "formSelector": "docType_id", "treeRefField": "refArtefact", "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Composition", "detailName": "artefactcomposition.containerArt", "detailField": "containerArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"__ptType": "detailDef", "menuText": "Requirements", "detailName": "artefactrequirement.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"__ptType": "detailDef", "menuText": "Capacities", "detailName": "artefactcapacity.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"__ptType": "detailDef", "menuText": "Projects", "detailName": "projectartefact.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectArtefact"}, {"__ptType": "detailDef", "menuText": "Sources", "detailName": "artefactsource.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}, {"__ptType": "detailDef", "menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}]}
315	rai01ref.Capacity.tree	Tree Capacity	t	f	{"fields": [{"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "docType_id", "type": "foreignid", "hidden": true, "fkField": "docType", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": false, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Capacity", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Capacity.tree"}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "copyFrom_id", "type": "foreignid", "hidden": true, "fkField": "copyFrom", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "refCapacity_id", "type": "foreignid", "hidden": true, "fkField": "refCapacity", "readOnly": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "sortable": true, "zoomModel": "rai01ref.DocType", "searchable": false, "zoomFilter": "document, =Capacity"}, {"fkId": "refCapacity_id", "name": "refCapacity", "type": "foreigntext", "header": "Parent", "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "iconCls", "crudType": "readOnly"}], "actions": [{"name": "doTreeDependecy", "selectionMode": "multiple"}, {"name": "doUpdateMeta", "selectionMode": "none"}], "exclude": [], "gridSets": {}, "pciStyle": "tree", "viewCode": "rai01ref.Capacity.tree", "viewIcon": "icon-tree", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "refCapacity", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Capacity", "viewEntity": "rai01ref.Capacity", "description": "Tree Capacity", "metaVersion": "150625", "formSelector": "docType_id", "treeRefField": "refCapacity", "detailsConfig": [{"menuText": "Artefacts", "detailName": "artefactcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"menuText": "Projects", "detailName": "projectcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectCapacity"}, {"menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Capacity"}]}
335	rai01ref.Artefact.77	Artefact: Étape	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Artefact.77"}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "code", "type": "string", "header": "Nom codé", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom codé", "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom", "__ptType": "field", "sortable": true, "fieldLabel": "Nom", "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "Étape", "zoomFilter": "document, =Artefact"}, {"name": "info__caracteristiques", "type": "string", "header": "Caractéristiques", "__ptType": "field"}, {"name": "info__critere-dentree", "type": "string", "header": "Critère d'entrée", "__ptType": "field"}, {"name": "info__criteres-de-sortie", "type": "string", "header": "Critères de sortie", "__ptType": "field"}, {"name": "info__date-revision", "type": "date", "header": "Date révision", "__ptType": "field"}, {"name": "info__description-sommaire", "type": "text", "header": "Description sommaire", "__ptType": "field"}, {"name": "info__etat", "type": "string", "header": "État", "__ptType": "field"}, {"name": "info__evenement-declencheur", "type": "string", "header": "Événement déclencheur", "__ptType": "field"}, {"name": "info__frequence", "type": "string", "header": "Fréquence", "__ptType": "field"}, {"name": "info__intrant", "type": "string", "header": "Intrant", "__ptType": "field"}, {"name": "info__mode-de-traitement", "type": "string", "header": "Mode de traitement", "__ptType": "field"}, {"name": "info__redacteur", "type": "string", "header": "Rédacteur", "__ptType": "field"}, {"name": "info__responsable", "type": "string", "header": "Responsable", "__ptType": "field"}, {"name": "info__type-extrant", "type": "string", "header": "Type extrant", "__ptType": "field"}, {"name": "info__version", "type": "string", "header": "Version", "__ptType": "field"}, {"name": "info__volume", "type": "text", "header": "Volume", "__ptType": "field"}, {"fkId": "refArtefact_id", "name": "refArtefact", "type": "foreigntext", "header": "Parent", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Requirement"}, {"name": "capacity_id", "type": "foreignid", "header": "capacity_id", "hidden": true, "fkField": "capacity", "__ptType": "field", "readOnly": true}, {"name": "copyFrom_id", "type": "foreignid", "header": "copyFrom_id", "hidden": true, "fkField": "copyFrom", "__ptType": "field", "readOnly": true}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "__ptType": "field", "readOnly": true, "prpDefault": "77"}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "refArtefact_id", "type": "foreignid", "header": "refArtefact_id", "hidden": true, "fkField": "refArtefact", "__ptType": "field", "readOnly": true}, {"name": "requirement_id", "type": "foreignid", "header": "requirement_id", "hidden": true, "fkField": "requirement", "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doBusinessProcessDiagram", "__ptType": "actionDef", "menuText": "doBusinessProcessDiagram", "actionParams": [], "selectionMode": "sinlge"}, {"name": "doUpdateMeta", "__ptType": "actionDef", "menuText": "doUpdateMeta", "actionParams": [], "selectionMode": "none"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Artefact.77", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom de la demande"}, {"name": "docType", "__ptType": "formField", "fieldLabel": "Compposante"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "refArtefact", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "docType", "filterStmt": "=77"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Procédure afministrative", "updateTime": "2016-11-03 13:29:06", "viewEntity": "rai01ref.Artefact", "description": "Artefact: Procédure administrative", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Composition", "detailName": "artefactcomposition.containerArt", "detailField": "containerArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"__ptType": "detailDef", "menuText": "Requirements", "detailName": "artefactrequirement.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"__ptType": "detailDef", "menuText": "Capacities", "detailName": "artefactcapacity.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"__ptType": "detailDef", "menuText": "Projects", "detailName": "projectartefact.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectArtefact"}, {"__ptType": "detailDef", "menuText": "Sources", "detailName": "artefactsource.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}, {"__ptType": "detailDef", "menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}]}
336	rai01ref.Artefact.78	Artefact: Unité de traitement	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Artefact.78"}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "code", "type": "string", "header": "Nom codé", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom codé", "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom", "__ptType": "field", "sortable": true, "fieldLabel": "Nom", "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "Unité de traitement", "zoomFilter": "document, =Artefact"}, {"fkId": "refArtefact_id", "name": "refArtefact", "type": "foreigntext", "header": "Parent", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Requirement"}, {"name": "capacity_id", "type": "foreignid", "header": "capacity_id", "hidden": true, "fkField": "capacity", "__ptType": "field", "readOnly": true}, {"name": "copyFrom_id", "type": "foreignid", "header": "copyFrom_id", "hidden": true, "fkField": "copyFrom", "__ptType": "field", "readOnly": true}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "__ptType": "field", "readOnly": true, "prpDefault": "78"}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "refArtefact_id", "type": "foreignid", "header": "refArtefact_id", "hidden": true, "fkField": "refArtefact", "__ptType": "field", "readOnly": true}, {"name": "requirement_id", "type": "foreignid", "header": "requirement_id", "hidden": true, "fkField": "requirement", "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doBusinessProcessDiagram", "__ptType": "actionDef", "menuText": "doBusinessProcessDiagram", "actionParams": [], "selectionMode": "sinlge"}, {"name": "doUpdateMeta", "__ptType": "actionDef", "menuText": "doUpdateMeta", "actionParams": [], "selectionMode": "none"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Artefact.78", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom codé unité de traitement"}, {"name": "docType", "__ptType": "formField", "fieldLabel": "Composante"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "refArtefact", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "title": "Fiche unité de traitement", "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"fkId": "capacity_id", "name": "capacity", "xtype": "protoZoom", "__ptType": "formField", "zoomModel": "rai01ref.Capacity", "fieldLabel": "Capacity"}, {"fkId": "requirement_id", "name": "requirement", "xtype": "protoZoom", "__ptType": "formField", "zoomModel": "rai01ref.Requirement", "fieldLabel": "Requirement"}], "__ptType": "fieldset"}], "title": "Unité de traitement", "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "docType", "filterStmt": "=78"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Unité de traitement", "updateTime": "2016-11-03 13:29:56", "viewEntity": "rai01ref.Artefact", "description": "Artefact: Unité de traitement", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Composition", "detailName": "artefactcomposition.containerArt", "detailField": "containerArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"__ptType": "detailDef", "menuText": "Requirements", "detailName": "artefactrequirement.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"__ptType": "detailDef", "menuText": "Capacities", "detailName": "artefactcapacity.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"__ptType": "detailDef", "menuText": "Projects", "detailName": "projectartefact.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectArtefact"}, {"__ptType": "detailDef", "menuText": "Sources", "detailName": "artefactsource.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}, {"__ptType": "detailDef", "menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}]}
316	rai01ref.Requirement.tree	Tree Requirement	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Requirement", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Requirement.tree"}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "refRequirement_id", "name": "refRequirement", "type": "foreigntext", "header": "Parent", "sortable": true, "zoomModel": "rai01ref.Requirement", "searchable": false}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "docType_id", "type": "foreignid", "hidden": true, "fkField": "docType", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": false, "searchable": true}, {"name": "copyFrom_id", "type": "foreignid", "hidden": true, "fkField": "copyFrom", "readOnly": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "sortable": true, "zoomModel": "rai01ref.Requirement", "searchable": false}, {"name": "refRequirement_id", "type": "foreignid", "hidden": true, "fkField": "refRequirement", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "sortable": true, "zoomModel": "rai01ref.DocType", "searchable": false, "zoomFilter": "document, =Requirement"}, {"name": "iconCls", "crudType": "readOnly"}], "actions": [{"name": "doTreeDependecy", "selectionMode": "multiple"}, {"name": "doUpdateMeta", "selectionMode": "none"}], "exclude": [], "gridSets": {}, "pciStyle": "tree", "viewCode": "rai01ref.Requirement.tree", "viewIcon": "icon-tree", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "refRequirement", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Requirement", "viewEntity": "rai01ref.Requirement", "description": "Tree Requirement", "metaVersion": "150625", "formSelector": "docType_id", "treeRefField": "refRequirement", "detailsConfig": [{"menuText": "Artefacts", "detailName": "artefactrequirement", "detailField": "requirement__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"menuText": "Projects", "detailName": "projectrequirement", "detailField": "requirement__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectRequirement"}, {"menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Requirement"}]}
317	rai01ref.ArtefactComposition	Artefact Composition	t	f	{"fields": [{"name": "containerArt_id", "type": "foreignid", "header": "containerArt_id", "hidden": true, "fkField": "containerArt", "readOnly": true}, {"name": "outputArt_id", "type": "foreignid", "header": "outputArt_id", "hidden": true, "fkField": "outputArt", "readOnly": true}, {"name": "condition", "type": "text", "vType": "plainText", "header": "condition", "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"fkId": "outputArt_id", "name": "outputArt", "type": "foreigntext", "header": "out", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"fkId": "containerArt_id", "name": "containerArt", "type": "foreigntext", "header": "Artefact", "cellLink": true, "required": true, "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact Composition", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.ArtefactComposition"}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "inputArt_id", "name": "inputArt", "type": "foreigntext", "header": "in", "cellLink": true, "required": true, "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "inputArt__code", "type": "string", "header": "code", "readOnly": true, "required": false}, {"name": "inputArt__description", "type": "text", "vType": "plainText", "header": "description", "readOnly": true, "required": false}, {"name": "inputArt__docType__category", "type": "string", "header": "category", "readOnly": true, "required": false}, {"name": "inputArt__docType__description", "type": "text", "vType": "plainText", "header": "description", "readOnly": true, "required": false}, {"name": "inputArt__docType__document", "type": "combo", "header": "document", "choices": "Artefact,Capacity,Requirement", "readOnly": true, "required": false}, {"name": "inputArt__docType__dtype", "type": "string", "header": "DocType", "readOnly": true, "required": false}, {"name": "inputArt__docType__notes", "type": "text", "vType": "plainText", "header": "notes", "readOnly": true, "required": false}, {"name": "inputArt__info", "type": "text", "header": "info", "readOnly": true, "required": false}, {"name": "outputArt__code", "type": "string", "header": "code", "readOnly": true, "required": false}, {"fkId": "docType_id", "name": "outputArt__docType", "type": "foreigntext", "header": "docType", "readOnly": true, "required": false, "zoomModel": "rai01ref.DocType"}, {"name": "outputArt__description", "type": "text", "vType": "plainText", "header": "description", "readOnly": true, "required": false}, {"name": "outputArt__info", "type": "text", "header": "info", "readOnly": true, "required": false}, {"name": "outputArt__docType__category", "type": "string", "header": "category", "readOnly": true, "required": false}, {"name": "outputArt__docType__description", "type": "text", "vType": "plainText", "header": "description", "readOnly": true, "required": false}, {"name": "outputArt__docType__document", "type": "combo", "header": "document", "choices": "Artefact,Capacity,Requirement", "readOnly": true, "required": false}, {"name": "outputArt__docType__dtype", "type": "string", "header": "DocType", "readOnly": true, "required": false}, {"name": "outputArt__docType__notes", "type": "text", "vType": "plainText", "header": "notes", "readOnly": true, "required": false}, {"name": "containerArt__code", "type": "string", "header": "code", "readOnly": true, "required": false}, {"name": "containerArt__description", "type": "text", "vType": "plainText", "header": "description", "readOnly": true, "required": false}, {"name": "containerArt__info", "type": "text", "header": "info", "readOnly": true, "required": false}, {"name": "inputArt_id", "type": "foreignid", "fkField": "inputArt", "readOnly": true, "required": true}, {"fkId": "docType_id", "name": "inputArt__docType", "type": "foreigntext", "header": "docType", "readOnly": true, "required": false, "zoomModel": "rai01ref.DocType"}], "actions": [], "exclude": [], "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.ArtefactComposition", "viewIcon": "icon-1", "contextTo": [], "formConfig": {"items": [{"items": [{"name": "containerArt", "__ptType": "formField", "fieldLabel": "Racine"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "inputArt", "__ptType": "formField", "fieldLabel": "Noeud début"}, {"name": "outputArt", "__ptType": "formField", "fieldLabel": "Noeud fin"}, {"name": "condition", "__ptType": "formField"}, {"name": "notes", "__ptType": "formField"}], "title": "Arc", "__ptType": "fieldset", "fsLayout": "1col"}], "title": "Arc de composition", "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "condition", "notes", "description"], "initialSort": [], "listDisplay": ["__str__", "containerArt_id", "inputArt", "outputArt", "condition", "containerArt__code", "containerArt__description"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "condition", "notes", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Artefact Composition", "updateTime": "2016-11-10 12:14:12", "viewEntity": "rai01ref.ArtefactComposition", "description": "Artefact Composition", "metaVersion": "150625", "sheetConfig": [], "businessRules": {}, "detailsConfig": []}
318	rai01ref.ArtefactRequirement	Artefact Requirement	t	f	{"fields": [{"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "isMain", "type": "bool", "header": "isMain", "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact Requirement", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.ArtefactRequirement"}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "sortable": true, "searchable": true}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "required": true, "sortable": true, "zoomModel": "rai01ref.Requirement", "searchable": false}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "artefact_id", "name": "artefact", "type": "foreigntext", "header": "artefact", "required": true, "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"name": "artefact_id", "type": "foreignid", "hidden": true, "fkField": "artefact", "readOnly": true}, {"name": "requirement_id", "type": "foreignid", "hidden": true, "fkField": "requirement", "readOnly": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "rai01ref.ArtefactRequirement", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "requirement", "__ptType": "formField"}, {"name": "artefact", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "isMain", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "notes", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Artefact Requirement", "viewEntity": "rai01ref.ArtefactRequirement", "description": "Artefact Requirement", "metaVersion": "150625", "detailsConfig": []}
319	rai01ref.ProjectArtefact	Project Artefact	t	f	{"fields": [{"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"fkId": "projet_id", "name": "projet", "type": "foreigntext", "header": "projet", "required": true, "sortable": true, "zoomModel": "rai01ref.Projet", "searchable": false}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Project Artefact", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.ProjectArtefact"}, {"name": "projet_id", "type": "foreignid", "hidden": true, "fkField": "projet", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "artefact_id", "name": "artefact", "type": "foreigntext", "header": "artefact", "required": true, "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"name": "artefact_id", "type": "foreignid", "hidden": true, "fkField": "artefact", "readOnly": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "rai01ref.ProjectArtefact", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "projet", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "artefact", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "notes", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Project Artefact", "viewEntity": "rai01ref.ProjectArtefact", "description": "Project Artefact", "metaVersion": "150625", "detailsConfig": []}
320	rai01ref.ArtefactCapacity	Artefact Capacity	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact Capacity", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.ArtefactCapacity"}, {"fkId": "artefact_id", "name": "artefact", "type": "foreigntext", "header": "artefact", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"name": "artefact__code", "type": "string", "header": "Nom codé Concept", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom codé Concept"}, {"name": "artefact__description", "type": "text", "vType": "plainText", "header": "Nom Concept", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom Concept"}, {"fkId": "docType_id", "name": "artefact__docType", "type": "foreigntext", "header": "Ressource-Composante", "__ptType": "field", "readOnly": true, "zoomModel": "rai01ref.DocType", "fieldLabel": "Ressource-Composante"}, {"name": "artefact__docType__category", "type": "string", "header": "Catégorie", "__ptType": "field", "readOnly": true, "fieldLabel": "Catégorie"}, {"name": "artefact__docType__description", "type": "text", "vType": "plainText", "header": "description", "__ptType": "field", "readOnly": true}, {"name": "artefact__docType__document", "type": "combo", "header": "document", "choices": "Artefact,Capacity,Requirement", "__ptType": "field", "readOnly": true}, {"name": "artefact__docType__dtype", "type": "string", "header": "Composante concept", "__ptType": "field", "readOnly": true, "fieldLabel": "Composante concept"}, {"name": "artefact__docType__notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "readOnly": true}, {"name": "artefact__info", "type": "text", "header": "info", "__ptType": "field", "readOnly": true}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "capacity__code", "type": "string", "header": "Nom codé Ressource", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom codé Ressource"}, {"fkId": "copyFrom_id", "name": "capacity__copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "readOnly": true, "zoomModel": "rai01ref.Capacity"}, {"name": "capacity__description", "type": "text", "vType": "plainText", "header": "Nom Ressource", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom Ressource"}, {"fkId": "docType_id", "name": "capacity__docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "readOnly": true, "zoomModel": "rai01ref.DocType"}, {"name": "capacity__docType__category", "type": "string", "header": "category", "__ptType": "field", "readOnly": true}, {"name": "capacity__docType__description", "type": "text", "vType": "plainText", "header": "description", "__ptType": "field", "readOnly": true}, {"name": "capacity__docType__document", "type": "combo", "header": "document", "choices": "Artefact,Capacity,Requirement", "__ptType": "field", "readOnly": true}, {"name": "capacity__docType__dtype", "type": "string", "header": "Composante ressource", "__ptType": "field", "readOnly": true, "fieldLabel": "Composante ressource"}, {"name": "capacity__info", "type": "text", "header": "info", "__ptType": "field", "readOnly": true}, {"fkId": "refCapacity_id", "name": "capacity__refCapacity", "type": "foreigntext", "header": "Parent", "__ptType": "field", "readOnly": true, "zoomModel": "rai01ref.Capacity"}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isMain", "type": "bool", "header": "isMain", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "artefact_id", "type": "foreignid", "header": "artefact_id", "hidden": true, "fkField": "artefact", "__ptType": "field", "readOnly": true}, {"name": "capacity_id", "type": "foreignid", "header": "capacity_id", "hidden": true, "fkField": "capacity", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.ArtefactCapacity", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "capacity", "__ptType": "formField", "fieldLabel": "Ressource"}, {"name": "artefact", "__ptType": "formField", "fieldLabel": "Concept"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "isMain", "__ptType": "formField"}, {"name": "notes", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialSort": [], "listDisplay": ["__str__", "artefact__code", "artefact__description", "artefact__docType__dtype", "capacity__code", "capacity__description", "capacity__docType__dtype"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Concept > Ressource", "updateTime": "2016-11-03 14:08:25", "viewEntity": "rai01ref.ArtefactCapacity", "description": "Concept > Ressource", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
321	rai01ref.ArtefactSource	Artefact Source	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Source", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.ArtefactSource", "fieldLabel": "Source"}, {"fkId": "artefact_id", "name": "artefact", "type": "foreigntext", "header": "artefact", "__ptType": "field", "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"name": "artefact__code", "type": "string", "header": "Nom codé Concept", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom codé Concept"}, {"name": "artefact__description", "type": "text", "vType": "plainText", "header": "Nom concept", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom concept"}, {"name": "description", "type": "text", "vType": "plainText", "header": "Nom", "__ptType": "field", "sortable": true, "fieldLabel": "Nom", "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "source_id", "name": "source", "type": "foreigntext", "header": "Source", "__ptType": "field", "sortable": true, "zoomModel": "rai01ref.Source"}, {"name": "source__code", "type": "string", "header": "Nom codé source", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom codé source"}, {"name": "source__description", "type": "text", "vType": "plainText", "header": "Nom source", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom source"}, {"name": "source__notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "readOnly": true}, {"name": "source__reference", "type": "string", "header": "Référence", "__ptType": "field", "readOnly": true, "fieldLabel": "Référence"}, {"name": "artefact_id", "type": "foreignid", "hidden": true, "fkField": "artefact", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "source_id", "type": "foreignid", "hidden": true, "fkField": "source", "__ptType": "field", "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.ArtefactSource", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "description", "__ptType": "formField", "prpLength": "1"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "source", "__ptType": "formField"}, {"name": "artefact", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "notes", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialSort": [], "listDisplay": ["artefact__code", "artefact__description", "source__code", "source__description", "source__reference"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Source (concept)", "updateTime": "2016-11-03 15:03:30", "viewEntity": "rai01ref.ArtefactSource", "description": "Source (concept)", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
324	rai01ref.Artefact.71	Artefact: test proc	t	f	{"fields": [{"name": "refArtefact_id", "type": "foreignid", "hidden": true, "fkField": "refArtefact", "readOnly": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "copyFrom_id", "type": "foreignid", "hidden": true, "fkField": "copyFrom", "readOnly": true}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "sortable": true, "zoomModel": "rai01ref.Requirement", "searchable": false}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Artefact.71"}, {"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "info", "type": "text", "header": "info", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": false, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "info__teat-proc-att1", "type": "", "vType": "", "header": "teat proc att1", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "refArtefact_id", "name": "refArtefact", "type": "foreigntext", "header": "Parent", "sortable": true, "zoomModel": "rai01ref.Artefact", "searchable": false}, {"name": "capacity_id", "type": "foreignid", "hidden": true, "fkField": "capacity", "readOnly": true}, {"name": "docType_id", "type": "foreignid", "hidden": true, "fkField": "docType", "readOnly": true, "prpDefault": "71"}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "test proc", "searchable": false, "zoomFilter": "document, =Artefact"}, {"name": "requirement_id", "type": "foreignid", "hidden": true, "fkField": "requirement", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doBusinessProcessDiagram", "selectionMode": "sinlge"}, {"name": "doUpdateMeta", "selectionMode": "none"}], "exclude": [], "gridSets": {}, "viewCode": "rai01ref.Artefact.71", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "refArtefact", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "capacity", "__ptType": "formField"}, {"name": "requirement", "__ptType": "formField"}, {"name": "info__teat-proc-att1", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [{"property": "docType", "filterStmt": "=71"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "test proc", "viewEntity": "rai01ref.Artefact", "description": "Artefact: test proc", "metaVersion": "150625", "detailsConfig": [{"menuText": "Composition", "detailName": "artefactcomposition.containerArt", "detailField": "containerArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"menuText": "Requirements", "detailName": "artefactrequirement.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"menuText": "Capacities", "detailName": "artefactcapacity.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"menuText": "Projects", "detailName": "projectartefact.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectArtefact"}, {"menuText": "Sources", "detailName": "artefactsource.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}, {"menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}]}
340	rai01ref.Source	Source	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Source", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Source"}, {"name": "code", "type": "string", "header": "Nom codé", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom codé", "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom", "__ptType": "field", "sortable": true, "fieldLabel": "Nom", "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "reference", "type": "string", "header": "Référence", "__ptType": "field", "sortable": true, "fieldLabel": "Référence", "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Source", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom de la source"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "reference", "__ptType": "formField"}], "title": "Fiche source", "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "notes", "__ptType": "formField"}], "title": "Notes", "__ptType": "fieldset", "fsLayout": "1col", "collapsed": true, "collapsible": true}], "title": "Fiche Source", "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "reference", "notes", "description"], "initialSort": [], "listDisplay": ["code", "description", "reference"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "reference", "notes", "description"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Source", "updateTime": "2016-11-03 14:59:47", "viewEntity": "rai01ref.Source", "description": "Source", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Artefactsource.source", "detailName": "artefactsource.source", "detailField": "source__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}]}
344	rai01ref.Capacity.75	Capacity: Service	t	f	{"fields": [{"name": "refCapacity__copyFrom__code", "type": "string", "header": "code", "__ptType": "field", "readOnly": true}, {"name": "refCapacity__description", "type": "text", "vType": "plainText", "header": "Nom parent", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom parent"}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "Nom codé", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom codé", "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Capacity", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Capacity.75"}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "copyFrom_id", "type": "foreignid", "header": "copyFrom_id", "hidden": true, "fkField": "copyFrom", "__ptType": "field", "readOnly": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "__ptType": "field", "readOnly": true, "prpDefault": "75"}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom", "__ptType": "field", "sortable": true, "fieldLabel": "Nom", "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "refCapacity__code", "type": "string", "header": "Nom codé parent", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom codé parent"}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "Service", "zoomFilter": "document, =Capacity"}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "refCapacity_id", "type": "foreignid", "header": "refCapacity_id", "hidden": true, "fkField": "refCapacity", "__ptType": "field", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"fkId": "refCapacity_id", "name": "refCapacity", "type": "foreigntext", "header": "Lien parent", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity", "fieldLabel": "Lien parent"}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doUpdateMeta", "__ptType": "actionDef", "menuText": "doUpdateMeta", "actionParams": [], "selectionMode": "none"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Capacity.75", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom codé service"}, {"name": "description", "__ptType": "formField", "prpLength": "1", "fieldLabel": "Nom de service"}, {"name": "docType", "__ptType": "formField", "fieldLabel": "Composante"}, {"name": "refCapacity", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "title": "Fiche de Service", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "docType", "filterStmt": "=75"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description", "refCapacity__code", "refCapacity__description", "refCapacity"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Service", "updateTime": "2016-11-03 17:53:21", "viewEntity": "rai01ref.Capacity", "description": "Capacity: Service", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Artefacts", "detailName": "artefactcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"__ptType": "detailDef", "menuText": "Projects", "detailName": "projectcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectCapacity"}, {"__ptType": "detailDef", "menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Capacity"}]}
345	rai01ref.ProjectRequirement	Project Requirement	t	f	{"fields": [{"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "requirement_id", "type": "foreignid", "hidden": true, "fkField": "requirement", "readOnly": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"name": "projet_id", "type": "foreignid", "hidden": true, "fkField": "projet", "readOnly": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "projet_id", "name": "projet", "type": "foreigntext", "header": "projet", "required": true, "sortable": true, "zoomModel": "rai01ref.Projet", "searchable": false}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "required": true, "sortable": true, "zoomModel": "rai01ref.Requirement", "searchable": false}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Project Requirement", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.ProjectRequirement"}], "exclude": [], "gridSets": {}, "viewCode": "rai01ref.ProjectRequirement", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "projet", "__ptType": "formField"}, {"name": "requirement", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "notes", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "notes", "description"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Project Requirement", "viewEntity": "rai01ref.ProjectRequirement", "description": "Project Requirement", "metaVersion": "150625", "detailsConfig": []}
349	rai01ref.Artefact.74	Artefact: Procédure opérationnelle	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Artefact.74"}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "code", "type": "string", "header": "Nom codé", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom codé", "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom", "__ptType": "field", "sortable": true, "fieldLabel": "Nom", "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "Procédure", "zoomFilter": "document, =Artefact"}, {"name": "info__caracteristiques", "type": "string", "header": "Caractéristiques", "__ptType": "field"}, {"name": "info__critere-dentree", "type": "string", "header": "Critère d'entrée", "__ptType": "field"}, {"name": "info__criteres-de-sortie", "type": "string", "header": "Critères de sortie", "__ptType": "field"}, {"name": "info__date-revision", "type": "date", "header": "Date révision", "__ptType": "field"}, {"name": "info__description-sommaire", "type": "text", "header": "Description sommaire", "__ptType": "field"}, {"name": "info__etat", "type": "string", "header": "État", "__ptType": "field"}, {"name": "info__evenement-declencheur", "type": "string", "header": "Événement déclencheur", "__ptType": "field"}, {"name": "info__frequence", "type": "string", "header": "Fréquence", "__ptType": "field"}, {"name": "info__intrant", "type": "string", "header": "Intrant", "__ptType": "field"}, {"name": "info__mode-de-traitement", "type": "string", "header": "Mode de traitement", "__ptType": "field"}, {"name": "info__redacteur", "type": "string", "header": "Rédacteur", "__ptType": "field"}, {"name": "info__responsable", "type": "string", "header": "Responsable", "__ptType": "field"}, {"name": "info__type-extrant", "type": "string", "header": "Type extrant", "__ptType": "field"}, {"name": "info__version", "type": "string", "header": "Version", "__ptType": "field"}, {"name": "info__volume", "type": "text", "header": "Volume", "__ptType": "field"}, {"fkId": "refArtefact_id", "name": "refArtefact", "type": "foreigntext", "header": "Parent", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Requirement"}, {"name": "capacity_id", "type": "foreignid", "header": "capacity_id", "hidden": true, "fkField": "capacity", "__ptType": "field", "readOnly": true}, {"name": "copyFrom_id", "type": "foreignid", "header": "copyFrom_id", "hidden": true, "fkField": "copyFrom", "__ptType": "field", "readOnly": true}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "__ptType": "field", "readOnly": true, "prpDefault": "74"}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "refArtefact_id", "type": "foreignid", "header": "refArtefact_id", "hidden": true, "fkField": "refArtefact", "__ptType": "field", "readOnly": true}, {"name": "requirement_id", "type": "foreignid", "header": "requirement_id", "hidden": true, "fkField": "requirement", "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doBusinessProcessDiagram", "__ptType": "actionDef", "menuText": "doBusinessProcessDiagram", "actionParams": [], "selectionMode": "sinlge"}, {"name": "doUpdateMeta", "__ptType": "actionDef", "menuText": "doUpdateMeta", "actionParams": [], "selectionMode": "none"}], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Artefact.74", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom codé procédure"}, {"name": "description", "__ptType": "formField", "prpLength": "1", "fieldLabel": "Nom"}, {"name": "docType", "__ptType": "formField", "fieldLabel": "Composante"}], "title": "Fiche procédure opérationnelle", "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "refArtefact", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}, {"name": "requirement", "__ptType": "formField"}, {"name": "capacity", "__ptType": "formField"}], "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "info__mode-de-traitement", "__ptType": "formField"}, {"name": "info__frequence", "__ptType": "formField"}, {"name": "info__critere-dentree", "__ptType": "formField"}, {"name": "info__intrant", "__ptType": "formField"}, {"name": "info__criteres-de-sortie", "__ptType": "formField"}, {"name": "info__caracteristiques", "__ptType": "formField"}, {"name": "info__responsable", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "docType", "filterStmt": "=74"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Procédure opérationnelle", "updateTime": "2016-11-03 13:27:25", "viewEntity": "rai01ref.Artefact", "description": "Artefact: Procédure opérationnellle", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Composition", "detailName": "artefactcomposition.containerArt", "detailField": "containerArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"__ptType": "detailDef", "menuText": "Requirements", "detailName": "artefactrequirement.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"__ptType": "detailDef", "menuText": "Capacities", "detailName": "artefactcapacity.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"__ptType": "detailDef", "menuText": "Projects", "detailName": "projectartefact.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectArtefact"}, {"__ptType": "detailDef", "menuText": "Sources", "detailName": "artefactsource.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}, {"__ptType": "detailDef", "menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}]}
352	rai01ref.Capacity.80	Capacity: Organigramme	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Capacity", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Capacity.80"}, {"name": "code", "type": "string", "header": "Nom codé", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom codé", "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom", "__ptType": "field", "sortable": true, "fieldLabel": "Nom", "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "Organigramme", "zoomFilter": "document, =Capacity"}, {"name": "docType__category", "type": "string", "header": "Catégorie", "__ptType": "field", "readOnly": true, "fieldLabel": "Catégorie"}, {"name": "docType__description", "type": "text", "vType": "plainText", "header": "description", "__ptType": "field", "readOnly": true}, {"name": "docType__document", "type": "combo", "header": "document", "choices": "Artefact,Capacity,Requirement", "__ptType": "field", "readOnly": true}, {"name": "docType__dtype", "type": "string", "header": "Composante", "__ptType": "field", "readOnly": true, "fieldLabel": "Composante"}, {"name": "docType__notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "readOnly": true}, {"fkId": "refCapacity_id", "name": "refCapacity", "type": "foreigntext", "header": "Lien parent", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity", "fieldLabel": "Lien parent"}, {"name": "refCapacity__code", "type": "string", "header": "Nom codé parent", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom codé parent"}, {"name": "refCapacity__description", "type": "text", "vType": "plainText", "header": "Nom parent", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom parent"}, {"name": "copyFrom_id", "type": "foreignid", "header": "copyFrom_id", "hidden": true, "fkField": "copyFrom", "__ptType": "field", "readOnly": true}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "__ptType": "field", "readOnly": true, "prpDefault": "80"}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "refCapacity_id", "type": "foreignid", "header": "refCapacity_id", "hidden": true, "fkField": "refCapacity", "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doUpdateMeta", "__ptType": "actionDef", "menuText": "doUpdateMeta", "actionParams": [], "selectionMode": "none"}, {"name": "doTreeDiagram", "__ptType": "actionDef", "menuText": "doTreeDiagram", "actionParams": [], "selectionMode": "single"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Capacity.80", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField", "fieldLabel": "Nom codé organigramme"}, {"name": "docType", "__ptType": "formField", "fieldLabel": "Composante"}, {"name": "description", "__ptType": "formField", "prpLength": "1", "fieldLabel": "Nom organigramme"}, {"name": "refCapacity", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "title": "Fiche de composante d'organigramme", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "docType", "filterStmt": "=80"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description", "refCapacity__code", "refCapacity__description", "refCapacity"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Organigramme", "updateTime": "2016-11-11 16:04:34", "viewEntity": "rai01ref.Capacity", "description": "Capacity: Organigramme", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Artefacts", "detailName": "artefactcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"__ptType": "detailDef", "menuText": "Projects", "detailName": "projectcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectCapacity"}, {"__ptType": "detailDef", "menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Capacity"}]}
355	rai01ref.Artefact.79	Artefact: P. organisationnel	t	f	{"fields": [{"name": "info__caracteristiques", "type": "", "vType": "", "header": "Caractéristiques", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "copyFrom_id", "type": "foreignid", "header": "copyFrom_id", "hidden": true, "fkField": "copyFrom", "__ptType": "field", "readOnly": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"fkId": "refArtefact_id", "name": "refArtefact", "type": "foreigntext", "header": "Parent", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Artefact"}, {"fkId": "docType_id", "name": "refArtefact__docType", "type": "foreigntext", "header": "Lien parent", "__ptType": "field", "readOnly": true, "zoomModel": "rai01ref.DocType", "fieldLabel": "Lien parent"}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "info__mode-de-traitement", "type": "", "vType": "", "header": "Mode de traitement", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "refArtefact__docType__dtype", "type": "string", "header": "DocType", "__ptType": "field", "readOnly": true}, {"name": "info__redacteur", "type": "", "vType": "", "header": "Rédacteur", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "P. organisationnel", "zoomFilter": "document, =Artefact"}, {"name": "info__description-sommaire", "type": "text", "vType": "", "header": "Description sommaire", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "refArtefact_id", "type": "foreignid", "header": "refArtefact_id", "hidden": true, "fkField": "refArtefact", "__ptType": "field", "readOnly": true}, {"name": "code", "type": "string", "header": "Nom codé", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom codé", "searchable": true}, {"name": "info__date-revision", "type": "date", "vType": "", "header": "Date révision", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__frequence", "type": "", "vType": "", "header": "Fréquence", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "refArtefact__code", "type": "string", "header": "Nom codé parent", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom codé parent"}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "info__version", "type": "", "vType": "", "header": "Version", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info__type-extrant", "type": "", "vType": "", "header": "Type extrant", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "info__critere-dentree", "type": "", "vType": "", "header": "Critère d'entrée", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Artefact", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Artefact.79"}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "requirement_id", "name": "requirement", "type": "foreigntext", "header": "requirement", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Requirement"}, {"name": "refArtefact__docType__category", "type": "string", "header": "category", "__ptType": "field", "readOnly": true}, {"name": "capacity_id", "type": "foreignid", "header": "capacity_id", "hidden": true, "fkField": "capacity", "__ptType": "field", "readOnly": true}, {"name": "requirement_id", "type": "foreignid", "header": "requirement_id", "hidden": true, "fkField": "requirement", "__ptType": "field", "readOnly": true}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "__ptType": "field", "readOnly": true, "prpDefault": "79"}, {"fkId": "capacity_id", "name": "capacity", "type": "foreigntext", "header": "capacity", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "info__responsable", "type": "", "vType": "", "header": "Responsable", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__volume", "type": "text", "vType": "", "header": "Volume", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom", "__ptType": "field", "sortable": true, "fieldLabel": "Nom", "searchable": true}, {"name": "info__evenement-declencheur", "type": "", "vType": "", "header": "Événement déclencheur", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__intrant", "type": "", "vType": "", "header": "Intrant", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__criteres-de-sortie", "type": "", "vType": "", "header": "Critères de sortie", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "info__etat", "type": "", "vType": "", "header": "État", "choices": "", "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "refArtefact__description", "type": "text", "vType": "plainText", "header": "Nom parent", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom parent"}], "actions": [{"name": "doBusinessProcessDiagram", "__ptType": "actionDef", "menuText": "doBusinessProcessDiagram", "actionParams": [], "selectionMode": "sinlge"}, {"name": "doUpdateMeta", "__ptType": "actionDef", "menuText": "doUpdateMeta", "actionParams": [], "selectionMode": "none"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Artefact.79", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "docType", "__ptType": "formField", "fieldLabel": "Composante"}, {"name": "refArtefact", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "title": "Fiche Processus Organisationnel", "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"__ptType": "smGrid", "menuText": "Requirements", "viewCode": "rai01ref.ArtefactRequirement"}], "title": "Exigences", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Capacities", "viewCode": "rai01ref.ArtefactCapacity"}], "title": "Ressources", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Sources", "viewCode": "rai01ref.ArtefactSource"}], "title": "Sources", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "docType", "filterStmt": "=79"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description", "refArtefact__code", "refArtefact__description", "refArtefact__docType"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "P. organisationnel", "updateTime": "2016-11-03 17:26:47", "viewEntity": "rai01ref.Artefact", "description": "Artefact: P. organisationnel", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Composition", "detailName": "artefactcomposition.containerArt", "detailField": "containerArt__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactComposition"}, {"__ptType": "detailDef", "menuText": "Requirements", "detailName": "artefactrequirement.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactRequirement"}, {"__ptType": "detailDef", "menuText": "Capacities", "detailName": "artefactcapacity.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"__ptType": "detailDef", "menuText": "Projects", "detailName": "projectartefact.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectArtefact"}, {"__ptType": "detailDef", "menuText": "Sources", "detailName": "artefactsource.artefact", "detailField": "artefact__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactSource"}, {"__ptType": "detailDef", "menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Artefact"}]}
356	rai01ref.Capacity.76	Capacity: Poste	t	f	{"fields": [{"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "readOnly": true, "sortable": true, "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "text", "vType": "plainText", "header": "description", "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Capacity", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Capacity.76"}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "refCapacity_id", "type": "foreignid", "hidden": true, "fkField": "refCapacity", "readOnly": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "Poste", "searchable": false, "zoomFilter": "document, =Capacity"}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "readOnly": true, "sortable": true, "searchable": true}, {"name": "docType_id", "type": "foreignid", "hidden": true, "fkField": "docType", "readOnly": true, "prpDefault": "76"}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "readOnly": true, "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "code", "required": true, "sortable": true, "searchable": true}, {"fkId": "refCapacity_id", "name": "refCapacity", "type": "foreigntext", "header": "Parent", "sortable": true, "zoomModel": "rai01ref.Capacity", "searchable": false}, {"name": "copyFrom_id", "type": "foreignid", "hidden": true, "fkField": "copyFrom", "readOnly": true}, {"name": "info", "type": "text", "header": "info", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": false, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doUpdateMeta", "selectionMode": "none"}], "exclude": [], "gridSets": {}, "viewCode": "rai01ref.Capacity.76", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "docType", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "refCapacity", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "smOwningUser", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [{"property": "docType", "filterStmt": "=76"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Poste", "viewEntity": "rai01ref.Capacity", "description": "Capacity: Poste", "metaVersion": "150625", "detailsConfig": [{"menuText": "Artefacts", "detailName": "artefactcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"menuText": "Projects", "detailName": "projectcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectCapacity"}, {"menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Capacity"}]}
357	rai01ref.Capacity.81	Capacity: Poste	t	f	{"fields": [{"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "refCapacity__description", "type": "text", "vType": "plainText", "header": "Nom parent", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom parent"}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "refCapacity_id", "type": "foreignid", "header": "refCapacity_id", "hidden": true, "fkField": "refCapacity", "__ptType": "field", "readOnly": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Capacity", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "rai01ref.Capacity.81"}, {"name": "refCapacity__refCapacity__description", "type": "text", "vType": "plainText", "header": "description", "__ptType": "field", "readOnly": true}, {"name": "copyFrom_id", "type": "foreignid", "header": "copyFrom_id", "hidden": true, "fkField": "copyFrom", "__ptType": "field", "readOnly": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "docType_id", "type": "foreignid", "header": "docType_id", "hidden": true, "fkField": "docType", "__ptType": "field", "readOnly": true, "prpDefault": "81"}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "Nom Poste", "__ptType": "field", "sortable": true, "fieldLabel": "Nom Poste", "searchable": true}, {"fkId": "copyFrom_id", "name": "copyFrom", "type": "foreigntext", "header": "copyFrom", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity"}, {"name": "info", "type": "text", "header": "info", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "refCapacity__code", "type": "string", "header": "Nom codé parent", "__ptType": "field", "readOnly": true, "fieldLabel": "Nom codé parent"}, {"fkId": "refCapacity_id", "name": "refCapacity", "type": "foreigntext", "header": "Lien parent", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.Capacity", "fieldLabel": "Lien parent"}, {"fkId": "docType_id", "name": "docType", "type": "foreigntext", "header": "docType", "__ptType": "field", "cellLink": true, "sortable": true, "zoomModel": "rai01ref.DocType", "prpDefault": "Poste", "zoomFilter": "document, =Capacity"}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "refCapacity__refCapacity__code", "type": "string", "header": "code", "__ptType": "field", "readOnly": true}, {"name": "code", "type": "string", "header": "Nom codé poste", "__ptType": "field", "required": true, "sortable": true, "fieldLabel": "Nom codé poste", "searchable": true}, {"fkId": "refCapacity_id", "name": "refCapacity__refCapacity", "type": "foreigntext", "header": "Parent", "__ptType": "field", "cellLink": true, "readOnly": true, "zoomModel": "rai01ref.Capacity"}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}], "actions": [{"name": "doUpdateMeta", "__ptType": "actionDef", "menuText": "doUpdateMeta", "actionParams": [], "selectionMode": "none"}], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "rai01ref.Capacity.81", "viewIcon": "icon-1", "jsonField": "info", "formConfig": {"items": [{"items": [{"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "docType", "__ptType": "formField", "fieldLabel": "Composante"}, {"name": "refCapacity", "__ptType": "formField"}, {"name": "copyFrom", "__ptType": "formField"}], "title": "Fiche poste de travail", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "docType", "filterStmt": "=81"}], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialSort": [], "listDisplay": ["code", "description", "refCapacity__code", "refCapacity__description", "refCapacity"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Poste", "updateTime": "2016-11-03 18:22:31", "viewEntity": "rai01ref.Capacity", "description": "Capacity: Poste", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Artefacts", "detailName": "artefactcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ArtefactCapacity"}, {"__ptType": "detailDef", "menuText": "Projects", "detailName": "projectcapacity", "detailField": "capacity__pk", "masterField": "pk", "conceptDetail": "rai01ref.ProjectCapacity"}, {"__ptType": "detailDef", "menuText": "Copies", "detailName": "copyto", "detailField": "copyFrom_id", "masterField": "pk", "conceptDetail": "rai01ref.Capacity"}]}
358	sessions.Session	Session	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Session", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "sessions.Session"}, {"name": "session_key", "type": "string", "header": "session key", "required": true, "sortable": true, "searchable": true}, {"name": "session_data", "type": "text", "vType": "plainText", "header": "session data", "required": true, "sortable": true, "searchable": true}, {"name": "expire_date", "type": "datetime", "header": "expire date", "required": true, "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "sessions.Session", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "session_key", "__ptType": "formField"}, {"name": "expire_date", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "session_data", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["session_key", "session_data"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["session_key", "session_data"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Session", "viewEntity": "sessions.Session", "description": "Session", "metaVersion": "150625", "detailsConfig": []}
360	protoLib.Logger	Logger	t	f	{"fields": [{"name": "logType", "type": "string", "header": "logType", "required": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true, "sortable": true, "searchable": true}, {"name": "logKey", "type": "combo", "header": "logKey", "choices": "INF,WAR,ERR,INS,UPD,DEL", "required": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "readOnly": true, "sortable": true, "searchable": true}, {"name": "logObject", "type": "string", "header": "logObject", "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Logger", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "protoLib.Logger"}, {"name": "logNotes", "type": "string", "header": "logNotes", "sortable": true, "searchable": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "readOnly": true, "sortable": true, "searchable": true}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "logInfo", "type": "text", "vType": "plainText", "header": "logInfo", "sortable": true, "searchable": true}], "actions": [{"name": "doClearLog", "selectionMode": "none", "refreshOnComplete": true}], "exclude": [], "gridSets": {}, "viewCode": "protoLib.Logger", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "logType", "__ptType": "formField"}, {"name": "logKey", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "logObject", "__ptType": "formField"}, {"name": "logNotes", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "logInfo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}]}, "gridConfig": {"baseFilter": [], "sortFields": ["logType", "logObject", "logNotes", "logInfo", "logKey"], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["logType", "logObject", "logNotes", "logInfo", "logKey"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Logger", "viewEntity": "protoLib.Logger", "description": "Logger", "metaVersion": "150625", "detailsConfig": []}
361	auth.User_user_permissions	User-Permission Relationship	t	f	{"fields": [{"name": "permission_id", "type": "foreignid", "hidden": true, "fkField": "permission", "readOnly": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "User-Permission Relationship", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "auth.User_user_permissions"}, {"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "user_id", "type": "foreignid", "hidden": true, "fkField": "user", "readOnly": true}, {"fkId": "permission_id", "name": "permission", "type": "foreigntext", "header": "permission", "required": true, "sortable": true, "zoomModel": "auth.Permission", "searchable": false}, {"fkId": "user_id", "name": "user", "type": "foreigntext", "header": "user", "required": true, "sortable": true, "zoomModel": "auth.User", "searchable": false}], "exclude": [], "gridSets": {}, "viewCode": "auth.User_user_permissions", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "permission", "__ptType": "formField"}, {"name": "user", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": [], "initialSort": [], "listDisplay": ["__str__"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": [], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "User-Permission Relationship", "viewEntity": "auth.User_user_permissions", "description": "User-Permission Relationship", "metaVersion": "150625", "detailsConfig": []}
362	taggit.Tag	Tag	t	f	{"fields": [{"name": "id", "type": "autofield", "header": "ID", "readOnly": true, "required": false, "sortable": false, "searchable": false}, {"name": "name", "type": "string", "header": "Name", "required": true, "sortable": true, "searchable": true}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Tag", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "taggit.Tag"}, {"name": "slug", "type": "string", "header": "Slug", "required": true, "sortable": true, "searchable": true}], "exclude": [], "gridSets": {}, "viewCode": "taggit.Tag", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "name", "__ptType": "formField"}, {"name": "slug", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}]}, "gridConfig": {"baseFilter": [], "sortFields": ["name"], "initialSort": [], "listDisplay": ["name", "slug"], "filterSetABC": "", "hiddenFields": ["id"], "searchFields": ["name"], "initialFilter": [], "hideRowNumbers": false, "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Tag", "viewEntity": "taggit.Tag", "description": "Tag", "metaVersion": "150625", "detailsConfig": [{"menuText": "Model.smTags", "detailName": "model.smTags", "detailField": "smTags__pk", "masterField": "pk", "conceptDetail": "prototype.Model"}, {"menuText": "Taggeditem.tag", "detailName": "taggeditem.tag", "detailField": "tag__pk", "masterField": "pk", "conceptDetail": "taggit.TaggedItem"}]}
363	prototype.Relationship	Relationship	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Relationship", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.Relationship"}, {"name": "baseMax", "type": "string", "header": "baseMax", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "baseMin", "type": "string", "header": "baseMin", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "code", "type": "string", "header": "clé étrangère", "__ptType": "field", "required": true, "sortable": true, "searchable": true}, {"name": "crudType", "type": "combo", "header": "crudType", "choices": "editable,readOnly,insertOnly,updateOnly,storeOnly,screenOnly", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "dbName", "type": "string", "header": "dbName", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "entity_id", "name": "entity", "type": "foreigntext", "header": "entité enfant", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Entity"}, {"name": "entity__code", "type": "string", "header": "entité enfant", "__ptType": "field", "readOnly": true}, {"fkId": "model_id", "name": "entity__model", "type": "foreigntext", "header": "model", "__ptType": "field", "cellLink": true, "readOnly": true, "zoomModel": "prototype.Model"}, {"name": "entity__model__code", "type": "string", "header": "code", "__ptType": "field", "readOnly": true}, {"name": "isEssential", "type": "bool", "header": "isEssential", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isForeign", "type": "bool", "header": "isForeign", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "isLookUpResult", "type": "bool", "header": "isLookUpResult", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isNullable", "type": "bool", "header": "isNullable", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isPrimary", "type": "bool", "header": "isPrimary", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isReadOnly", "type": "bool", "header": "isReadOnly", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isRequired", "type": "bool", "header": "isRequired", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "isSensitive", "type": "bool", "header": "isSensitive", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "onRefDelete", "type": "combo", "header": "onRefDelete", "choices": "CASCADE,PROTECT,SET_NULL,SET_DEFAULT,DO_NOTHING", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "property_ptr", "type": "autofield", "header": "property ptr", "__ptType": "field", "readOnly": true}, {"name": "prpScale", "type": "int", "header": "prpScale", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "refEntity_id", "name": "refEntity", "type": "foreigntext", "header": "entité parent", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Entity"}, {"name": "refEntity__code", "type": "string", "header": "entité parent", "__ptType": "field", "readOnly": true}, {"fkId": "model_id", "name": "refEntity__model", "type": "foreigntext", "header": "model", "__ptType": "field", "cellLink": true, "readOnly": true, "zoomModel": "prototype.Model"}, {"name": "refEntity__model__code", "type": "string", "header": "code", "__ptType": "field", "readOnly": true}, {"name": "refMax", "type": "string", "header": "refMax", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "refMin", "type": "string", "header": "refMin", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "relatedName", "type": "string", "header": "relatedName", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "smInfo", "type": "text", "header": "smInfo", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"fkId": "smVersion_id", "name": "smVersion", "type": "foreigntext", "header": "smVersion", "__ptType": "field", "sortable": true, "zoomModel": "prototype.ProtoVersionTitle"}, {"name": "typeRelation", "type": "string", "header": "typeRelation", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "vType", "type": "combo", "header": "vType", "choices": "string,text,bool,int,sequence,decimal,money,combo,date,datetime,time", "__ptType": "field", "sortable": true, "searchable": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "fkField": "entity", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "refEntity_id", "type": "foreignid", "header": "refEntity_id", "hidden": true, "fkField": "refEntity", "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smVersion_id", "type": "foreignid", "header": "smVersion_id", "hidden": true, "fkField": "smVersion", "__ptType": "field", "readOnly": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Relationship", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "refEntity", "__ptType": "formField"}, {"name": "entity", "__ptType": "formField"}, {"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}, {"name": "smVersion", "__ptType": "formField"}], "title": "Connecteur", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "baseType", "prpDefault", "prpChoices", "description", "notes", "vType", "crudType", "dbName", "relatedName", "baseMin", "baseMax", "refMin", "refMax", "onRefDelete", "typeRelation"], "initialSort": [], "listDisplay": ["refEntity__code", "entity__code", "code", "description"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "smInfo", "code", "baseType", "prpDefault", "prpChoices", "description", "notes", "vType", "crudType", "dbName", "relatedName", "baseMin", "baseMax", "refMin", "refMax", "onRefDelete", "typeRelation"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Connecteurs", "updateTime": "2017-09-07 11:23:47", "viewEntity": "prototype.Relationship", "description": "Relationship", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
364	prototype.Prototype.1	Prototype	t	f	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "Prototype", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.Prototype.1"}, {"name": "code", "type": "string", "header": "code", "__ptType": "field", "required": true, "sortable": true, "searchable": true}, {"name": "description", "type": "string", "vType": "plainText", "header": "description", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "entity_id", "name": "entity", "type": "foreigntext", "header": "entity", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.Entity"}, {"name": "metaDefinition", "type": "text", "header": "metaDefinition", "__ptType": "field", "crudType": "storeOnly", "readOnly": true, "sortable": true, "searchable": true}, {"name": "notes", "type": "text", "vType": "plainText", "header": "notes", "__ptType": "field", "sortable": true, "searchable": true}, {"fkId": "smVersion_id", "name": "smVersion", "type": "foreigntext", "header": "smVersion", "__ptType": "field", "cellLink": true, "required": true, "sortable": true, "zoomModel": "prototype.ProtoVersionTitle"}, {"name": "entity_id", "type": "foreignid", "hidden": true, "fkField": "entity", "__ptType": "field", "readOnly": true}, {"name": "id", "type": "autofield", "header": "ID", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "smCreatedBy", "type": "foreigntext", "header": "smCreatedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedBy", "type": "foreigntext", "header": "smModifiedBy", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smModifiedOn", "type": "datetime", "header": "smModifiedOn", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smNaturalCode", "type": "string", "header": "smNaturalCode", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "searchable": true}, {"name": "smRegStatus", "type": "string", "header": "smRegStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}, {"name": "smUUID", "type": "string", "header": "smUUID", "__ptType": "field", "readOnly": true, "required": true, "sortable": true, "searchable": true}, {"name": "smVersion_id", "type": "foreignid", "hidden": true, "fkField": "smVersion", "__ptType": "field", "readOnly": true}, {"name": "smWflowStatus", "type": "string", "header": "smWflowStatus", "__ptType": "field", "readOnly": true, "sortable": true, "searchable": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.Prototype.1", "viewIcon": "icon-1", "formConfig": {"items": [{"items": [{"name": "smVersion", "__ptType": "formField"}, {"name": "entity", "__ptType": "formField"}, {"name": "code", "__ptType": "formField"}, {"name": "description", "__ptType": "formField", "prpLength": "1"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "notes", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}, {"items": [{"name": "smOwningTeam", "__ptType": "formField"}, {"name": "smCreatedBy", "__ptType": "formField"}, {"name": "smModifiedOn", "__ptType": "formField"}, {"name": "smCreatedOn", "__ptType": "formField"}, {"name": "smModifiedBy", "__ptType": "formField"}, {"name": "smOwningUser", "__ptType": "formField"}], "title": "Admin", "__ptType": "fieldset", "fsLayout": "2col", "collapsed": true, "collapsible": true}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [], "sortFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "notes", "metaDefinition"], "initialSort": [], "listDisplay": ["__str__", "entity", "smOwningTeam"], "hiddenFields": ["id"], "searchFields": ["smNaturalCode", "smRegStatus", "smWflowStatus", "code", "description", "notes", "metaDefinition"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Prototype", "updateTime": "2017-09-07 11:51:39", "viewEntity": "prototype.Prototype", "description": "Prototype", "metaVersion": "150625", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": []}
\.


--
-- Name: protoExt_viewdefinition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoExt_viewdefinition_id_seq"', 364, true);


--
-- Data for Name: protoLib_contextentity; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoLib_contextentity" (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "propName", active, "contextVar_id", entity_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: protoLib_contextentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoLib_contextentity_id_seq"', 1, false);


--
-- Data for Name: protoLib_contextuser; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoLib_contextuser" (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "propValue", description, active, "contextVar_id", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: protoLib_contextuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoLib_contextuser_id_seq"', 1, false);


--
-- Data for Name: protoLib_contextvar; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoLib_contextvar" (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "propName", description, "modelCType_id", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: protoLib_contextvar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoLib_contextvar_id_seq"', 1, false);


--
-- Data for Name: protoLib_entitymap; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoLib_entitymap" (id, "entityConfig", "entityBase_id") FROM stdin;
\.


--
-- Name: protoLib_entitymap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoLib_entitymap_id_seq"', 1, false);


--
-- Data for Name: protoLib_logger; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoLib_logger" (id, "smCreatedOn", "logType", "logObject", "logNotes", "logInfo", "logKey", "smCreatedBy_id", "smOwningTeam_id") FROM stdin;
\.


--
-- Name: protoLib_logger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoLib_logger_id_seq"', 1, false);


--
-- Data for Name: protoLib_teamhierarchy; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoLib_teamhierarchy" (id, code, description, site, "parentNode_id") FROM stdin;
1	proto	\N	\N	\N
2	Dos	\N	\N	1
3	Tres	\N	\N	2
4	nuevo	\N	\N	\N
5	t1	\N	\N	\N
6	t2	\N	\N	\N
\.


--
-- Name: protoLib_teamhierarchy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoLib_teamhierarchy_id_seq"', 6, true);


--
-- Data for Name: protoLib_userprofile; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY "protoLib_userprofile" (id, language, "userTree", "userConfig", user_id, "userTeam_id") FROM stdin;
6	\N	\N	{}	7	1
14	\N	1,3,2	{}	4	1
15	\N	2,3,1	{}	15	1
1	fr	3,2,1	{}	1	1
\.


--
-- Name: protoLib_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('"protoLib_userprofile_id_seq"', 15, true);


--
-- Data for Name: prototype_diagram; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_diagram (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "smInfo", code, description, notes, title, prefix, "graphLevel", "grphMode", "graphForm", "showPrpType", "showBorder", "showFKey", project_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "smVersion_id") FROM stdin;
50	serveurs-g-piafs	\N	\N	2017-08-23 20:17:30.872+00	2017-08-23 20:17:30.872+00	94b124a3-895e-4d8c-8165-827a6ec518b9	{}	G-PIAFS	\N	\N	\N	\N	0	0	0	f	f	f	38	1	1	1	1	1
51	serveurs-piafs	\N	\N	2017-08-23 23:39:59.889+00	2017-08-23 23:39:59.889+00	be4871f9-2a06-44cc-a47f-77bad707225f	{}	piafs	\N	\N	\N	\N	0	0	0	f	f	f	38	1	1	1	1	1
\.


--
-- Name: prototype_diagram_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_diagram_id_seq', 51, true);


--
-- Data for Name: prototype_diagramentity; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_diagramentity (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "smInfo", info, diagram_id, entity_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "smVersion_id") FROM stdin;
676	g-piafs-famille	\N	\N	2017-08-23 20:17:30.885+00	2017-08-23 20:17:30.885+00	3c8f41a3-fb50-4b2b-965f-b662f90ec06a	{}	{}	50	760	1	1	1	1	1
678	g-piafs-groupe	\N	\N	2017-08-23 20:17:30.914+00	2017-08-23 20:17:30.914+00	aea5c554-e478-43f6-bda9-cce852692ff4	{}	{}	50	762	1	1	1	1	1
681	piafs-famille	\N	\N	2017-08-23 23:39:59.907+00	2017-08-23 23:39:59.907+00	f26a64db-d299-4f4c-9d60-a7be764f0b80	{}	{}	51	760	1	1	1	1	1
683	piafs-groupe	\N	\N	2017-08-23 23:39:59.923+00	2017-08-23 23:39:59.924+00	78a9cae6-78c9-4874-acc1-c09c9b7c9274	{}	{}	51	762	1	1	1	1	1
686	piafs-operateur	\N	\N	2017-08-24 01:08:29.046+00	2017-08-24 01:08:29.046+00	70b1c9c9-731f-4df6-9600-a5abffc8f575	{}	{}	51	765	1	1	1	1	1
687	piafs-operation	\N	\N	2017-08-24 01:16:39.525+00	2017-08-24 01:16:39.525+00	b2d99114-551b-4e55-9758-3e9639dc1c96	{}	{}	51	766	1	1	1	1	1
688	piafs-compte-famille	\N	\N	2017-08-24 01:32:41.984+00	2017-08-24 01:32:41.984+00	16b3a41f-bfb6-4acd-8001-5813a29b92fe	{}	{}	51	767	1	1	1	1	1
689	piafs-compte-groupe	\N	\N	2017-08-24 01:35:44.024+00	2017-08-24 01:35:44.024+00	a6e1e98a-9ca8-4e3b-a1d4-1c3c4b783412	{}	{}	51	768	1	1	1	1	1
690	piafs-operation-groupe	\N	\N	2017-08-24 01:42:09.935+00	2017-08-24 01:42:09.935+00	56d9c5de-77e6-42fa-9e30-ea8c7db14a57	{}	{}	51	769	1	1	1	1	1
692	piafs-clause-contrat	\N	\N	2017-08-24 15:13:52.438+00	2017-08-24 15:13:52.438+00	bbc842ab-154a-4c2d-9a32-181ca6267c9f	{}	{}	51	771	1	1	1	1	1
693	piafs-contenu-contrat	\N	\N	2017-08-24 15:13:52.446+00	2017-08-24 15:13:52.446+00	0a9986cd-f2bb-4b2a-848a-0f685d6214a7	{}	{}	51	772	1	1	1	1	1
694	piafs-types-operation	\N	\N	2017-08-24 15:21:55.743+00	2017-08-24 15:21:55.743+00	17739543-6155-459d-b3a2-ed4239bf3785	{}	{}	51	773	1	1	1	1	1
695	piafs-planification-groupe	\N	\N	2017-08-24 15:21:55.751+00	2017-08-24 15:21:55.751+00	af9fc36a-33f9-4e99-8f41-fb9f2a80e20d	{}	{}	51	774	1	1	1	1	1
696	piafs-installation	\N	\N	2017-08-24 15:38:01.236+00	2017-08-24 15:38:01.236+00	37af08c9-52dc-4efa-8980-3d67ef90388f	{}	{}	51	775	1	1	1	1	1
700	piafs-composante	\N	\N	2017-08-30 01:21:44.476+00	2017-08-30 01:21:44.476+00	6378f504-b593-46ac-9af4-be678153e4e2	{}	{}	51	779	1	1	1	1	1
701	piafs-composante-installation	\N	\N	2017-08-30 01:25:02.812+00	2017-08-30 01:25:02.812+00	58b1adc2-059a-4f85-90b5-69be74875256	{}	{}	51	780	1	1	1	1	1
702	piafs-type-composante	\N	\N	2017-08-30 17:22:10.244+00	2017-08-30 17:22:10.244+00	3da47c4b-d98c-4166-9806-025a42a75a03	{}	{}	51	781	1	1	1	1	1
\.


--
-- Name: prototype_diagramentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_diagramentity_id_seq', 702, true);


--
-- Data for Name: prototype_entity; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_entity (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "smInfo", code, "dbName", description, model_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "smVersion_id") FROM stdin;
760	piafs-familles	\N	\N	2017-08-23 19:35:16.857+00	2017-09-06 14:56:10.27+00	ad0dfb76-d138-4036-ba4b-c18abcd966dc	{"Tel": "", "Courriel": "", "Responsable": ""}	Familles		compte de famille	44	1	1	1	1	1
762	piafs-groupes	\N	\N	2017-08-23 20:14:29.744+00	2017-09-06 14:56:18.55+00	7bc25a6f-4ce9-4382-b78a-26a96c1b78a7	{"Tel": "", "Courriel": "", "Responsable": ""}	Groupes		groupe de famille	44	1	1	1	1	1
765	piafs-operateurs	\N	\N	2017-08-24 01:06:20.037+00	2017-09-06 14:56:26.394+00	12fe5b69-8e7c-481e-bc69-c084d9d81c76	{"Tel": "", "Courriel": "", "Responsable": ""}	Opérateurs			44	1	1	1	1	1
766	piafs-operations-famille	\N	\N	2017-08-24 01:10:28.649+00	2017-09-06 14:56:40.096+00	6b8de814-9e22-43f6-973c-ed791e107324	{"Tel": "", "Courriel": "", "Responsable": ""}	Opérations famille			44	1	1	1	1	1
767	piafs-factures-famille	\N	\N	2017-08-24 01:29:55.307+00	2017-09-06 15:05:38.403+00	7468e08f-bd27-4121-a394-7628ef9e273d	{"Tel": "", "Courriel": "", "Responsable": ""}	Factures famille			44	1	1	1	1	1
768	piafs-facture-groupe	\N	\N	2017-08-24 01:33:28.476+00	2017-09-06 14:57:04.94+00	a391bbe1-ada4-46a9-bafa-740a985e362a	{"Tel": "", "Courriel": "", "Responsable": ""}	Facture groupe			44	1	1	1	1	1
769	piafs-operations-groupe	\N	\N	2017-08-24 01:36:58.278+00	2017-09-06 14:57:21.732+00	ad2c4edc-96bb-4582-979f-b95f75d239aa	{"Tel": "", "Courriel": "", "Responsable": ""}	Opérations groupe			44	1	1	1	1	1
771	piafs-clauses	\N	\N	2017-08-24 15:06:19.129+00	2017-09-06 14:57:40.822+00	10ab8eb7-53ed-4a08-bec1-8e082e8f1902	{"Tel": "", "Courriel": "", "Responsable": ""}	Clauses			44	1	1	1	1	1
772	piafs-lignes-contrat	\N	\N	2017-08-24 15:11:12.939+00	2017-09-06 14:58:12.577+00	f2a8a479-c263-4b56-b04a-e63328932c18	{"Tel": "", "Courriel": "", "Responsable": ""}	Lignes contrat			44	1	1	1	1	1
773	piafs-types-operation	\N	\N	2017-08-24 15:15:03.769+00	2017-09-06 14:58:29.161+00	5ec3887d-cdf8-4d07-b078-91c93d5b8bef	{"Tel": "", "Courriel": "", "Responsable": ""}	Types opération			44	1	1	1	1	1
774	piafs-lignes-planification	\N	\N	2017-08-24 15:18:12.862+00	2017-09-06 14:59:07.72+00	769dbc2d-c202-4257-b945-bc785f9e5bc6	{"Tel": "", "Courriel": "", "Responsable": ""}	Lignes planification			44	1	1	1	1	1
775	piafs-installations	\N	\N	2017-08-24 15:30:29.037+00	2017-09-06 15:06:02.972+00	ced52d3d-1d37-4d3e-a7b9-bf253fbc60fb	{"Tel": "", "Courriel": "", "Responsable": ""}	Installations			44	1	1	1	1	1
779	piafs-composantes	\N	\N	2017-08-30 01:17:36.831+00	2017-09-06 15:06:13.496+00	d0a00f2e-53ce-4fc6-a223-8edea53adaed	{"Tel": "", "Courriel": "", "Responsable": ""}	Composantes		Composante logiciel	44	1	1	1	1	1
780	piafs-composantes-installees	\N	\N	2017-08-30 01:22:52.158+00	2017-09-06 15:06:23.931+00	f50e9c9b-300d-4f32-be8a-90a29227a026	{"Tel": "", "Courriel": "", "Responsable": ""}	Composantes installées			44	1	1	1	1	1
781	piafs-types-composante	\N	\N	2017-08-30 17:17:46.475+00	2017-09-06 15:06:35.792+00	0c37f984-7b40-46ab-9f87-f1df914b8849	{"Tel": "", "Courriel": "", "Responsable": ""}	Types composante			44	1	1	1	1	1
\.


--
-- Name: prototype_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_entity_id_seq', 781, true);


--
-- Data for Name: prototype_model; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_model (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "smInfo", code, category, "modelPrefix", description, project_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "smVersion_id") FROM stdin;
44	piafs	\N	\N	2017-08-23 19:03:03.841+00	2017-08-23 23:23:15.114+00	8b997e40-1965-4e14-9ca2-3083055dfdf5	{"Tel": "", "Courriel": "", "responsable": ""}	piafs	analyse pour Odoo		gestion des comptes et des composantes	38	1	1	1	1	1
\.


--
-- Name: prototype_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_model_id_seq', 44, true);


--
-- Data for Name: prototype_project; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_project (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "smInfo", code, description, "dbEngine", "dbName", "dbUser", "dbPassword", "dbHost", "dbPort", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "smVersion_id") FROM stdin;
38	serveurs	\N	\N	2017-08-23 18:53:05.551+00	2017-08-23 19:13:18.86+00	45615f66-d2b7-4ec8-98d8-130d5f27d719	{"Tel": "", "version": "0.1", "Courriel": "", "Responsable": ""}	Serveurs	Gestion du déploiement des applis sur les serveurs	sqlite3	\N	\N	\N	\N	\N	1	1	1	1	1
\.


--
-- Name: prototype_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_project_id_seq', 38, true);


--
-- Data for Name: prototype_property; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_property (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "smInfo", code, "baseType", "prpLength", "prpScale", "prpDefault", "prpChoices", description, notes, "isPrimary", "isLookUpResult", "isNullable", "isRequired", "isReadOnly", "isForeign", "vType", "isSensitive", "isEssential", "crudType", "dbName", entity_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "smVersion_id") FROM stdin;
4631	groupes-nom	\N	\N	2017-08-23 20:14:48.246+00	2017-09-06 15:07:48.587+00	ee821dfc-6b16-4131-916b-4750c7b1b514	{}	Nom	string	50	0					f	t	f	f	f	f	string	f	f			762	1	1	1	1	1
4632	familles-code	\N	\N	2017-08-23 20:19:27.408+00	2017-09-06 15:07:37.983+00	d10d9146-0a67-49c2-b54a-5238a0339146	{}	Code	string	25	0					t	t	f	t	f	f		f	f			760	1	1	1	1	1
4635	familles-groupe	\N	\N	2017-08-23 20:51:55.187+00	2017-09-06 15:08:07.197+00	0ef3ed16-3ed6-46e6-9c48-b9c2678b3b17	{}	Groupe	string	25	0					f	f	f	f	f	t		f	f			760	1	1	1	1	1
4636	familles-courriel	\N	\N	2017-08-24 00:04:18.316+00	2017-09-06 15:09:44.61+00	01d54215-d126-46f3-a26c-baacf24141e1	{}	Courriel	string	50	0			Normalement celui de l'administrtaeur		f	f	f	f	f	f		f	f			760	1	1	1	1	1
4642	familles-date-installation	\N	\N	2017-08-24 00:45:04.441+00	2017-09-06 15:10:03.044+00	69d1369e-8c98-458e-a3c0-a76403542ff6	{}	Date installation	date	0	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4643	groupes-code	\N	\N	2017-08-24 00:47:11.157+00	2017-09-06 15:10:13.925+00	a5e7fbb5-7352-4e20-b7ab-47c044a9a460	{}	Code	string	25	0					t	t	f	t	f	f		f	f			762	1	1	1	1	1
4644	familles-nom-administrateur	\N	\N	2017-08-24 00:49:58.667+00	2017-09-06 15:10:33.151+00	e8a019a0-b1cb-4a65-a963-476ca066effc	{}	Nom administrateur	string	50	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4645	familles-mot-passe	\N	\N	2017-08-24 00:50:24.59+00	2017-09-06 15:11:12.035+00	d1dda020-793f-4019-a89e-5c1b552caa15	{}	Mot passe 	string	25	0			Celui de l'administrateur, en fait celui du compte		f	f	f	f	f	f		f	f			760	1	1	1	1	1
4646	groupes-date-signature-contrat	\N	\N	2017-08-24 00:53:06.189+00	2017-09-06 15:11:47.093+00	97cc7293-1071-4e1d-8bef-a785d14d48fd	{}	Date signature contrat	date	0	0					f	f	f	f	f	f		f	f			762	1	1	1	1	1
4647	groupes-nom-administrateur	\N	\N	2017-08-24 00:53:32.857+00	2017-09-06 15:11:42.803+00	16fe98b1-9263-4cf4-81e9-170001d065e1	{}	Nom administrateur	string	50	0					f	f	f	f	f	f		f	f			762	1	1	1	1	1
4648	groupes-login-admin	\N	\N	2017-08-24 00:54:00.588+00	2017-09-06 15:38:53.427+00	fb186a5b-666d-4f1e-a0f6-80169b801e1d	{}	Login admin	string	25	0					f	f	f	f	f	f		f	f			762	1	1	1	1	1
4649	groupes-mot-passe-admin	\N	\N	2017-08-24 00:54:31.928+00	2017-09-06 15:12:26.455+00	28728f7a-3b75-4134-a1ff-f9a6154e2997	{}	Mot passe admin	string	25	0					f	f	f	f	f	f		f	f			762	1	1	1	1	1
4650	groupes-courriel-admin	\N	\N	2017-08-24 00:54:55.187+00	2017-09-06 15:12:41.897+00	1b3c3dd4-e143-4eb2-b26f-6316ff99da1a	{}	Courriel admin	string	50	0					f	f	f	f	f	f		f	f			762	1	1	1	1	1
4651	groupes-activite	\N	\N	2017-08-24 00:55:45.835+00	2017-09-06 15:38:50.624+00	47dce4b8-a424-4ac4-800e-229cf3d0096e	{}	Activité	bool	0	0			Si vrai le groupe est en service		f	f	f	f	f	f		f	f			762	1	1	1	1	1
4652	groupes-memo	\N	\N	2017-08-24 01:04:47.513+00	2017-09-06 15:13:51.271+00	11e89ca8-f429-4fc5-85b4-9a64b3d50015	{}	Mémo	text	0	0			notes sur l'activité		f	f	f	f	f	f		f	f			762	1	1	1	1	1
4653	operateurs-code	\N	\N	2017-08-24 01:06:58.229+00	2017-09-08 17:55:03.511+00	81a75508-4b34-42a3-a85f-8f1af3a68f0c	{}	Code	string	25	0					t	t	f	t	f	f		f	f			765	1	1	1	1	1
4654	operateurs-mot-de-passe	\N	\N	2017-08-24 01:07:33.821+00	2017-09-06 15:14:33.155+00	3153f4bd-2675-4d2f-ae1e-8a94a81d4c0c	{}	Mot de passe	string	25	0					f	f	f	f	f	f		f	f			765	1	1	1	1	1
4655	operateurs-date-chgt-mot-de-passe	\N	\N	2017-08-24 01:08:07.33+00	2017-09-06 15:14:47.698+00	2c29f970-b883-4895-a266-803150ab44ec	{}	Date  chgt mot de passe	date	0	0					f	f	f	f	f	f		f	f			765	1	1	1	1	1
4656	operations-famille-code	\N	\N	2017-08-24 01:11:02.357+00	2017-09-06 15:15:28.648+00	56308fe1-249a-46c2-9ea5-c45d34acc21e	{}	Code	string	25	0					t	t	f	t	f	f		f	f			766	1	1	1	1	1
4658	operations-famille-date-operation	\N	\N	2017-08-24 01:13:56.361+00	2017-09-06 15:15:45.398+00	d8ca08cb-89b6-49b3-9caa-95178f07a3c1	{}	Date opération	date	0	0					f	f	f	f	f	f		f	f			766	1	1	1	1	1
4659	operations-famille-complete	\N	\N	2017-08-24 01:14:32.368+00	2017-09-06 15:16:24.845+00	f9330c1f-b5d1-4364-8b23-008ae04f2e0a	{}	Complété	bool	0	0	0		Si vrai l'opération est complétée		f	f	f	f	f	f		f	f			766	1	1	1	1	1
4662	operations-famille-operateur	\N	\N	2017-08-24 01:27:14.845+00	2017-09-06 15:44:03.647+00	18a076cb-785f-465c-8f67-6e2074b29ec3	{}	Opérateur	string	25	0					f	f	f	f	f	t		f	f			766	1	1	1	1	1
4663	factures-famille-code	\N	\N	2017-08-24 01:30:28.363+00	2017-09-06 15:17:10.463+00	2a2ed240-cfd8-433b-a048-7033f87cfdf5	{}	Code	string	25	0					t	t	f	t	f	f		f	f			767	1	1	1	1	1
4664	factures-famille-date-ouverture	\N	\N	2017-08-24 01:30:47.68+00	2017-09-06 15:17:23.436+00	b0902afb-c83c-4b50-afef-d13eefd60e3e	{}	Date ouverture	date	0	0					f	f	f	f	f	f		f	f			767	1	1	1	1	1
4665	factures-famille-date-cloture	\N	\N	2017-08-24 01:31:07.442+00	2017-09-06 15:17:35.63+00	d3c936e1-86e0-42be-84d5-a81442bf6e02	{}	Date cloture	date	0	0					f	f	f	f	f	f		f	f			767	1	1	1	1	1
4667	facture-groupe-date-debut	\N	\N	2017-08-24 01:34:09.273+00	2017-09-06 15:17:45.921+00	cee0702e-912e-463e-904b-47f6a8c46256	{}	Date début	date	0	0					f	f	f	f	f	f		f	f			768	1	1	1	1	1
4668	facture-groupe-date-fin	\N	\N	2017-08-24 01:34:27.054+00	2017-09-06 15:17:55.107+00	a6731e33-70fc-495b-b658-9e84cd373809	{}	Date fin	date	0	0					f	f	f	f	f	f		f	f			768	1	1	1	1	1
4669	facture-groupe-code	\N	\N	2017-08-24 01:34:49.318+00	2017-09-06 15:18:12.927+00	f7443707-f7f8-4270-977b-5a1cd901e490	{}	Code	string	25	0					t	t	f	t	f	f		f	f			768	1	1	1	1	1
4670	facture-groupe-groupe	\N	\N	2017-08-24 01:35:29.933+00	2017-09-06 15:44:12.106+00	c1e2a9a2-6a36-48bc-ad6c-2064a1ced5e2	{}	Groupe	string	25	0					f	f	f	f	f	t		f	f			768	1	1	1	1	1
4671	operations-groupe-code	\N	\N	2017-08-24 01:37:29.967+00	2017-09-06 15:19:09.035+00	9f324214-7a74-4357-8b44-f6e12d0167c4	{}	Code	sequence	0	0					t	t	f	t	f	f		f	f			769	1	1	1	1	1
4673	operations-groupe-date-execution	\N	\N	2017-08-24 01:38:07.404+00	2017-09-06 15:53:21.804+00	eb003a4a-9cea-469f-bb26-577cedd85531	{}	Date exécution	date	0	0					f	f	f	f	f	f		f	f			769	1	1	1	1	1
4674	operations-groupe-duree	\N	\N	2017-08-24 01:38:32.664+00	2017-09-06 15:54:02.804+00	345f9b27-68bf-4af1-97ee-93a5f301a3ee	{}	Durée 	datetime	0	0					f	f	f	f	f	f		f	f			769	1	1	1	1	1
4675	operations-groupe-statut	\N	\N	2017-08-24 01:38:54.963+00	2017-09-06 16:04:35.383+00	59fe5b63-8c0d-427f-996e-5b99603f9d3c	{}	Statut 	combo	0	0		prévu, préparé, en cours, terminé			f	f	f	f	f	f		f	f			769	1	1	1	1	1
4676	operations-groupe-memo	\N	\N	2017-08-24 01:39:41.814+00	2017-09-06 15:57:21.141+00	d92d6ed8-15fb-4b85-93cf-abc871ab8310	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			769	1	1	1	1	1
4677	operations-groupe-operateur	\N	\N	2017-08-24 01:41:12.256+00	2017-09-06 15:44:20.013+00	e37264d7-c973-4a25-80e1-e929ead7f929	{}	Opérateur	string	25	0					f	f	f	f	f	t		f	f			769	1	1	1	1	1
4679	familles-code-bd	\N	\N	2017-08-24 01:48:00.342+00	2017-09-06 15:54:59.216+00	f26af02e-1678-4d37-8acc-086a9f72edfc	{}	Code BD	string	25	0					f	t	f	f	f	f		f	f			760	1	1	1	1	1
4681	clauses-code	\N	\N	2017-08-24 15:06:54.28+00	2017-09-06 15:30:35.424+00	0dcf9126-c095-4a2c-b55f-5373498b1701	{}	Code	string	25	0					t	t	f	t	f	f		f	f			771	1	1	1	1	1
4682	clauses-nom	\N	\N	2017-08-24 15:07:22.424+00	2017-09-06 15:59:18.22+00	a80bb3ac-05c5-423c-82a2-09a5472e87d6	{}	Nom 	string	50	0					f	f	f	f	f	f		f	f			771	1	1	1	1	1
4683	clauses-prix	\N	\N	2017-08-24 15:07:55.887+00	2017-09-06 16:01:43.241+00	e6594284-b611-456e-a25b-3e144b365432	{}	Prix	money	2	0					f	f	f	f	f	f		f	f			771	1	1	1	1	1
4684	clauses-decription	\N	\N	2017-08-24 15:10:32.948+00	2017-09-06 15:53:48.838+00	91ce4908-dc3c-4829-906e-7d1fd4ae568e	{}	Decription	text	0	0					f	f	f	f	f	f		f	f			771	1	1	1	1	1
4687	types-operation-code	\N	\N	2017-08-24 15:15:47.356+00	2017-09-06 15:30:00.345+00	5209b6f1-578f-458b-a1e5-b67697d64f90	{}	Code	string	25	0					t	t	f	t	f	f		f	f			773	1	1	1	1	1
4688	types-operation-nom	\N	\N	2017-08-24 15:16:13.853+00	2017-09-06 16:00:36.69+00	c03cc262-9b7a-415e-bab0-e87cf87d25d1	{}	Nom	string	50	0					f	f	f	f	f	f		f	f			773	1	1	1	1	1
4689	types-operation-frequence	\N	\N	2017-08-24 15:17:28.533+00	2017-09-06 15:55:13.676+00	ffe4ca1a-fd24-4880-ad0a-b784a15082cb	{}	Fréquence	combo	0	0		jour, semaine, mois, an, variable, création, fermeture			f	f	f	f	f	f		f	f			773	1	1	1	1	1
4690	types-operation-script	\N	\N	2017-08-24 15:17:47.109+00	2017-09-06 16:01:02.3+00	5f33dcb4-cbfa-4829-9ffa-36faf8617622	{}	Script	text	0	0					f	f	f	f	f	f		f	f			773	1	1	1	1	1
4693	operations-groupe-type-operation	\N	\N	2017-08-24 15:21:20.596+00	2017-09-06 15:44:29.123+00	8b18b309-88e4-40e2-aaa9-8a1a62c2d2e4	{}	Type opération	string	25	0					f	f	f	f	f	t		f	f			769	1	1	1	1	1
4694	facture-groupe-montant-ht	\N	\N	2017-08-24 15:24:46.977+00	2017-09-06 15:56:15.113+00	13cf0730-45a3-4aca-9ba8-1655e6132b28	{}	Montant HT	money	2	0					f	f	f	f	f	f		f	f			768	1	1	1	1	1
4695	facture-groupe-mntant-taxes	\N	\N	2017-08-24 15:25:07.13+00	2017-09-06 15:57:05.858+00	70de7099-429f-4ac5-952f-dafb1382a7fa	{}	Mntant taxes	money	2	0					f	f	f	f	f	f		f	f			768	1	1	1	1	1
4696	facture-groupe-montant-ttc	\N	\N	2017-08-24 15:25:28.189+00	2017-09-06 15:56:07.316+00	4a669488-ace1-4660-8f16-bdf7354d6aa4	{}	Montant TTC	money	2	0					f	f	f	f	f	f		f	f			768	1	1	1	1	1
4697	facture-groupe-date-paiement	\N	\N	2017-08-24 15:25:41.134+00	2017-09-06 15:53:31.881+00	017421bb-d823-404e-af31-6a280690d704	{}	Date paiement	date	0	0					f	f	f	f	f	f		f	f			768	1	1	1	1	1
4698	operations-groupe-facturable	\N	\N	2017-08-24 15:26:58.378+00	2017-09-06 15:54:14.877+00	268cdfbe-a034-4f53-a2c7-6a2de0106086	{}	Facturable	bool	0	0					f	f	f	f	f	f		f	f			769	1	1	1	1	1
4699	operations-groupe-montant-facture	\N	\N	2017-08-24 15:27:17.41+00	2017-09-06 15:56:46.179+00	0030b912-4272-445b-94f2-09d20fd97d50	{}	Montant facturé	money	2	0					f	f	f	f	f	f		f	f			769	1	1	1	1	1
4700	operations-groupe-planifiee	\N	\N	2017-08-24 15:27:59.841+00	2017-09-06 16:01:58.86+00	b12cbd1a-c96a-4154-b6e3-ed7e1906317e	{}	Planifiée	bool	0	0					f	f	f	f	f	f		f	f			769	1	1	1	1	1
4701	familles-facturable	\N	\N	2017-08-24 15:29:16.29+00	2017-09-06 15:54:26.844+00	0bf411ff-eef5-46bc-b200-ff7353335fb2	{}	Facturable	bool	0	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4702	installations-code	\N	\N	2017-08-24 15:31:04.595+00	2017-09-06 15:29:31.921+00	2b05aaa7-1955-41d5-ba81-a3cec9a54987	{}	Code	string	25	0					t	t	f	t	f	f		f	f			775	1	1	1	1	1
4703	installations-date-creation	\N	\N	2017-08-24 15:31:28.194+00	2017-09-06 15:51:02.215+00	53aafa16-62e9-4121-ad76-db315e81b7d3	{}	Date création	date	0	0					f	f	f	f	f	f		f	f			775	1	1	1	1	1
4704	installations-date-mise-en-service	\N	\N	2017-08-24 15:32:05.006+00	2017-09-06 15:52:56.66+00	c9d2451f-c437-4061-96bc-142bc7ae01b8	{}	Date mise en service	date	0	0					f	f	f	f	f	f		f	f			775	1	1	1	1	1
4705	installations-date-fin-usage	\N	\N	2017-08-24 15:32:20.386+00	2017-09-06 15:51:15.195+00	81438585-6bd9-433c-824c-7c36956d7065	{}	Date fin usage	date	0	0					f	f	f	f	f	f		f	f			775	1	1	1	1	1
4715	lignes-contrat-clause	\N	\N	2017-08-30 00:35:01.79+00	2017-09-06 15:44:38.932+00	7e26b6be-9e67-4a33-956f-cecfc23849d8	{}	Clause 	string	25	0					f	f	f	f	f	t		f	f			772	1	1	1	1	1
4716	lignes-contrat-groupe	\N	\N	2017-08-30 00:35:56.614+00	2017-09-06 15:44:47.535+00	ed4f6654-a3bd-4eb8-980c-7567b6781a21	{}	Groupe 	string	25	0					f	f	f	f	f	t		f	f			772	1	1	1	1	1
4718	lignes-planification-type-operation	\N	\N	2017-08-30 00:44:04.248+00	2017-09-06 15:44:56.891+00	2244afcd-78a2-4b4a-9d74-e635fdebef67	{}	Type opération 	string	25	0					f	f	f	f	f	t		f	f			774	1	1	1	1	1
4719	lignes-planification-groupe	\N	\N	2017-08-30 00:45:13.141+00	2017-09-06 15:45:06.151+00	ebf6b3a3-cf18-40c3-ac69-d60dbf20aa44	{}	Groupe 	string	25	0					f	f	f	f	f	t		f	f			774	1	1	1	1	1
4722	composantes-code	\N	\N	2017-08-30 01:18:23.337+00	2017-09-06 15:29:41.954+00	fe85fc2e-a45b-4803-a285-279fd821c646	{}	Code	string	25	0					t	t	f	t	f	f		f	f			779	1	1	1	1	1
4724	composantes-nom	\N	\N	2017-08-30 01:20:12.907+00	2017-09-06 15:59:34.09+00	1d6bf72e-9c03-4017-86f1-696d28f4919d	{}	Nom 	string	50	0					f	f	f	f	f	f		f	f			779	1	1	1	1	1
4725	composantes-version	\N	\N	2017-08-30 01:20:34.72+00	2017-09-06 16:01:20.219+00	83d1aeb3-5013-402a-997c-2ee58da0e6ef	{}	Version 	string	50	0					f	f	f	f	f	f		f	f			779	1	1	1	1	1
4726	composantes-memo	\N	\N	2017-08-30 01:20:53.565+00	2017-09-06 15:57:30.976+00	87614d58-94cf-45bf-8902-c409363eead5	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			779	1	1	1	1	1
4727	composantes-script	\N	\N	2017-08-30 01:21:13.032+00	2017-09-06 16:00:50.379+00	a4e8fe7c-4704-4da0-91c4-8f14e798f0e9	{}	Script	text	0	0					f	f	f	f	f	f		f	f			779	1	1	1	1	1
4728	composantes-installees-installation	\N	\N	2017-08-30 01:23:55.959+00	2017-09-06 15:42:33.949+00	81dcf24d-195a-4c76-ab8e-3276c89b3dcc	{}	Installation 	string	25	0					f	f	f	f	f	t		f	f			780	1	1	1	1	1
4729	composantes-installees-composante	\N	\N	2017-08-30 01:24:40.609+00	2017-09-06 15:45:14.334+00	2c2fef68-219f-4aa3-85d2-78cdbbd5f37e	{}	Composante 	string	25	0					f	f	f	f	f	t		f	f			780	1	1	1	1	1
4730	operations-groupe-groupe	\N	\N	2017-08-30 01:30:34.344+00	2017-09-06 15:46:14.307+00	5bce6b27-38fc-4617-8995-ed8d2e4a0f73	{}	Groupe	string	25	0					f	f	f	f	f	t		f	f			769	1	1	1	1	1
4732	familles-date-ouverture	\N	\N	2017-08-30 13:03:10.04+00	2017-09-06 15:51:30.467+00	0531fc3c-0d37-4e2b-b03b-a5373675bf06	{}	Date ouverture	date	0	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4735	familles-date-fermeture	\N	\N	2017-08-30 16:22:43.002+00	2017-09-06 15:50:52.976+00	1038113e-0df0-4d95-89dd-629741f8e4e5	{}	Date fermeture	date	0	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4736	famille-en-activite	\N	\N	2017-08-30 16:23:04.013+00	2017-08-30 16:23:04.013+00	dd5d2df3-9d81-4fc4-ada9-55c27338a5cc	{}	En activité	bool	0	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4737	familles-nom	\N	\N	2017-08-30 16:23:52.171+00	2017-09-06 16:03:08.909+00	1064f12b-0f93-43c1-84b6-16c94a12359a	{}	Nom	string	50	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4738	familles-memo	\N	\N	2017-08-30 16:26:13.702+00	2017-09-06 15:59:04.121+00	5210ed3a-f16e-4ce7-b3d1-62d8b757094b	{}	Mémo 	text	0	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4739	familles-date-mise-en-service	\N	\N	2017-08-30 16:26:45.961+00	2017-09-06 16:08:13.094+00	387be49e-cc57-4f9d-ba9d-868f46b12f3b	{}	Date mise en service	date	0	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4740	familles-date-arret-instance	\N	\N	2017-08-30 16:27:02.002+00	2017-09-06 15:50:28.634+00	31afe87c-1d5c-4641-b5aa-1cda35fdb8da	{}	Date arrêt instance	date	0	0					f	f	f	f	f	f		f	f			760	1	1	1	1	1
4741	familles-active	\N	\N	2017-08-30 16:27:22.557+00	2017-09-06 15:49:38.77+00	d6773715-ad05-4dc2-9f2a-47b807558839	{}	Active	bool	0	0			Vrai si en activité		f	f	f	f	f	f		f	f			760	1	1	1	1	1
4742	operateurs-nom	\N	\N	2017-08-30 16:28:26.595+00	2017-09-06 16:00:15.983+00	fd6805ec-94f4-46c6-999b-a50a16200969	{}	Nom	string	50	0					f	f	f	f	f	f		f	f			765	1	1	1	1	1
4743	operations-famille-type-operation	\N	\N	2017-08-30 16:30:40.717+00	2017-09-06 15:46:06.901+00	39af618d-025d-4a57-a490-3cbc10620bce	{}	Type opération	string	25	0					f	f	f	f	f	t		f	f			766	1	1	1	1	1
4744	operations-famille-memo	\N	\N	2017-08-30 16:32:33.577+00	2017-09-06 15:57:44.87+00	829011b0-83ba-4f6b-aa47-a14f4113e909	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			766	1	1	1	1	1
4745	factures-famille-montant	\N	\N	2017-08-30 16:33:38.303+00	2017-09-06 15:56:23.407+00	59270a74-6efd-4042-9c42-371ce7a585b8	{}	Montant	money	2	0					f	f	f	f	f	f		f	f			767	1	1	1	1	1
4746	factures-famille-memo	\N	\N	2017-08-30 16:33:57.784+00	2017-09-06 15:57:53.562+00	b1e86b0a-d77b-4d8e-8df7-c4ca5ff1c711	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			767	1	1	1	1	1
4747	facture-groupe-memo	\N	\N	2017-08-30 17:09:51.76+00	2017-09-06 15:58:03.62+00	bab9f924-82da-412b-af7c-b828bfc21942	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			768	1	1	1	1	1
4751	types-operation-memo	\N	\N	2017-08-30 17:13:54.618+00	2017-09-06 15:58:12.37+00	571c04f8-337a-4ac8-bd49-282c137d299f	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			773	1	1	1	1	1
4752	lignes-planification-memo	\N	\N	2017-08-30 17:14:54.435+00	2017-09-06 15:58:20.727+00	e7af6af3-1eb9-4eff-8f89-74301199a1b3	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			774	1	1	1	1	1
4753	installations-memo	\N	\N	2017-08-30 17:15:33.544+00	2017-09-06 15:58:31.714+00	5cde88a1-e4ee-4235-8596-c176f90e8525	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			775	1	1	1	1	1
4754	installations-active	\N	\N	2017-08-30 17:15:45.241+00	2017-09-06 15:49:04.098+00	23554ab3-f758-4121-a775-269f9c746bb8	{}	Active	bool	0	0					f	f	f	f	f	f		f	f			775	1	1	1	1	1
4755	composantes-installees-memo	\N	\N	2017-08-30 17:17:03.283+00	2017-09-06 15:58:40.273+00	ec105ddb-6d73-4ad6-885d-095acf88f268	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			780	1	1	1	1	1
4756	types-composante-code	\N	\N	2017-08-30 17:18:32.315+00	2017-09-06 15:30:51.02+00	0bf72ab8-9e64-4bea-b576-918b7340ffb0	{}	Code	string	25	0					t	t	f	t	f	f		f	f			781	1	1	1	1	1
4757	types-composante-nom	\N	\N	2017-08-30 17:18:57.192+00	2017-09-06 16:00:28.378+00	67ba35ab-cd24-4f58-959d-05f7d3bd6c4e	{}	Nom	string	50	0					f	f	f	f	f	f		f	f			781	1	1	1	1	1
4758	types-composante-memo	\N	\N	2017-08-30 17:19:16.562+00	2017-09-06 15:58:50.202+00	9c055649-a612-47e7-980c-d1e717435615	{}	Mémo	text	0	0					f	f	f	f	f	f		f	f			781	1	1	1	1	1
4759	composantes-type-composante	\N	\N	2017-08-30 17:21:51.284+00	2017-09-06 15:45:59.62+00	64872664-2a39-4290-87b2-5abb232a3a76	{}	Type composante	string	25	0					f	f	f	f	f	t		f	f			779	1	1	1	1	1
4761	operations-famille-famille	\N	\N	2017-09-03 23:18:39.812+00	2017-09-06 15:45:49.745+00	0415df79-676f-4632-a7ec-5a0e8295d7e1	{}	Famille	string	25	0					f	f	f	f	f	t		f	f			766	1	1	1	1	1
4762	factures-famille-famille	\N	\N	2017-09-03 23:19:53.076+00	2017-09-06 15:45:42.011+00	7beca5f3-255e-421b-8a16-7bcad17840c4	{}	Famille 	string	25	0					f	f	f	f	f	t		f	f			767	1	1	1	1	1
4763	familles-installation	\N	\N	2017-09-03 23:32:27.916+00	2017-09-06 15:45:30.696+00	2a481d97-e1d9-448b-a658-4d2b269d18aa	{}	Installation 	string	25	0					f	f	f	f	f	t		f	f			760	1	1	1	1	1
\.


--
-- Name: prototype_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_property_id_seq', 4763, true);


--
-- Data for Name: prototype_propertyequivalence; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_propertyequivalence (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "smInfo", description, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "smVersion_id", "sourceProperty_id", "targetProperty_id") FROM stdin;
\.


--
-- Name: prototype_propertyequivalence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_propertyequivalence_id_seq', 1, false);


--
-- Data for Name: prototype_prototable; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_prototable (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", info, entity_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
86	\N	\N	\N	2017-09-06 16:27:24.831+00	2017-09-12 21:56:27.851+00	40db5e53-2c4d-4b06-bf4b-b0948f86ef23	{"nom": "piwigo", "code": "TC1", "memo": "Le nom inclue la version"}	781	1	1	1	1
87	\N	\N	\N	2017-09-06 16:27:49.757+00	2017-09-06 16:27:49.757+00	3d258fe5-68f8-4784-8c35-84fa8cfb250b	{"nom": "Extension", "code": "TC2", "memo": ""}	781	1	1	1	1
88	\N	\N	\N	2017-09-06 16:28:34.723+00	2017-09-06 16:28:34.723+00	26acf15f-3f86-449e-a946-f9583475709d	{"nom": "Docker file", "code": "TC3", "memo": ""}	781	1	1	1	1
89	\N	\N	\N	2017-09-06 16:29:02.55+00	2017-09-06 16:29:02.55+00	00844c8f-c297-45cd-ba16-0b81026c4bf1	{"nom": "BD mysql", "code": "TC4", "memo": ""}	781	1	1	1	1
90	\N	\N	\N	2017-09-06 16:29:52.02+00	2017-09-06 16:29:52.02+00	7e28b907-1205-43e1-9412-f47b2c6d4627	{"nom": "Piwigo 2.9.2", "code": "CC1", "memo": "", "script": "", "version": "", "type-composante": "tc1", "type-composante_id": "86"}	779	1	1	1	1
91	\N	\N	\N	2017-09-06 16:30:19.71+00	2017-09-06 16:30:19.71+00	dd65df95-6310-4677-9e63-3163d7d52e06	{"nom": "Charlie", "code": "CC2", "memo": "", "script": "", "version": "", "type-composante": "tc2", "type-composante_id": "87"}	779	1	1	1	1
92	\N	\N	\N	2017-09-06 16:30:37.994+00	2017-09-06 16:30:37.994+00	0db2b4b5-b899-483d-bf19-f128b774a390	{"nom": "Community", "code": "CC3", "memo": "", "script": "", "version": "", "type-composante": "tc2", "type-composante_id": "87"}	779	1	1	1	1
93	\N	\N	\N	2017-09-06 18:00:30.288+00	2017-09-07 00:11:43.798+00	1ae01570-ba3b-4beb-be1f-baa63ae54c7e	{"nom": "nb de comptes", "code": "CL1", "prix": "8", "decription": "prix par compte et par an"}	771	1	1	1	1
94	\N	\N	\N	2017-09-06 18:01:23.094+00	2017-09-06 18:02:46.644+00	44fb62f0-661c-4aa9-b22a-3c557079bf79	{"nom": "Backup quotidien", "code": "CL2", "prix": "1", "decription": "Par compte par an"}	771	1	1	1	1
95	\N	\N	\N	2017-09-06 18:01:53.208+00	2017-09-06 18:01:53.208+00	e41f1823-4e37-4fd9-8ad6-01b44fc3b01a	{"nom": "Cryptage", "code": "CL3", "prix": "200", "decription": "Forfait"}	771	1	1	1	1
96	\N	\N	\N	2017-09-06 18:03:41.612+00	2017-09-06 18:03:41.612+00	17de9285-3f87-4443-8808-20ef1eccff12	{"nom": "Renouvelable", "code": "CL4", "prix": "0", "decription": ""}	771	1	1	1	1
97	\N	\N	\N	2017-09-06 18:04:33.87+00	2017-09-06 18:04:33.87+00	4f67c44d-fd97-4823-ab02-bb67c8a4c7ec	{"nom": "Pierre", "code": "OP1", "mot-de-passe": "/123456/", "date-chgt-mot-de-passe": "2017-08-01"}	765	1	1	1	1
98	\N	\N	\N	2017-09-06 18:04:57.625+00	2017-09-06 18:04:57.625+00	150315c0-2c8e-477b-a97c-e01bfb40c580	{"nom": "Benoit", "code": "OP2", "mot-de-passe": "qwerty", "date-chgt-mot-de-passe": "2017-09-02"}	765	1	1	1	1
99	\N	\N	\N	2017-09-06 18:05:31.159+00	2017-09-06 18:28:12.954+00	e855e5a9-cc3f-4c1d-befe-3698ca71a0af	{"nom": "François", "code": "OP4", "mot-de-passe": "asdfg", "date-chgt-mot-de-passe": "2017-09-01"}	765	1	1	1	1
100	\N	\N	\N	2017-09-06 18:06:17.574+00	2017-09-06 18:06:17.574+00	20b474aa-d695-4858-9822-09d3fb66420b	{"nom": "Mise en service instance", "code": "TO1", "memo": "", "script": "", "frequence": " variable"}	773	1	1	1	1
101	\N	\N	\N	2017-09-06 18:06:39.223+00	2017-09-06 18:06:39.223+00	3de5cfc4-5eb1-4832-ac27-64f22295153c	{"nom": "Backup", "code": "TO2", "memo": "", "script": "", "frequence": "jour"}	773	1	1	1	1
102	\N	\N	\N	2017-09-06 18:07:26.391+00	2017-09-06 18:07:46.733+00	d0b81c44-393a-4022-a170-c2c08cb936ca	{"nom": "Mise a jour applications", "code": "TO3", "memo": "", "script": "", "frequence": " variable"}	773	1	1	1	1
103	\N	\N	\N	2017-09-06 18:08:11.884+00	2017-09-06 18:08:11.884+00	4bad3cee-15a3-4d56-a8a4-641d1332600b	{"nom": "Mise a jour serveur", "code": "TO4", "memo": "", "script": "", "frequence": " variable"}	773	1	1	1	1
104	\N	\N	\N	2017-09-06 18:08:45.096+00	2017-09-06 18:08:45.096+00	028af5f7-e860-4633-ba8d-6645848b1b94	{"nom": "Archivage", "code": "TO5", "memo": "", "script": "", "frequence": " fermeture"}	773	1	1	1	1
105	\N	\N	\N	2017-09-06 18:10:13.225+00	2017-09-06 18:10:13.225+00	c3c64cb8-e452-4a84-99cf-f19f924ccd18	{"code": "INST1", "memo": "", "active": true, "date-creation": "2017-08-01", "date-fin-usage": null, "date-mise-en-service": "2017-08-07"}	775	1	1	1	1
106	\N	\N	\N	2017-09-06 18:10:33.503+00	2017-09-06 18:10:33.503+00	2c6571c4-f03b-4c8b-afd3-64e715973261	{"code": "INST2", "memo": "", "active": false, "date-creation": "2017-09-01", "date-fin-usage": null, "date-mise-en-service": null}	775	1	1	1	1
107	\N	\N	\N	2017-09-06 18:11:29.492+00	2017-09-06 18:11:29.492+00	7d7e11c1-997a-4c0f-b084-51dcc7345289	{"memo": "", "composante": "cc1", "installation": "inst1", "composante_id": "90", "installation_id": "105"}	780	1	1	1	1
108	\N	\N	\N	2017-09-06 18:12:06.179+00	2017-09-06 18:12:06.179+00	6705cdff-a45d-40c0-b357-85e40fa6798c	{"memo": "", "composante": "cc2", "installation": "inst1", "composante_id": "91", "installation_id": "105"}	780	1	1	1	1
109	\N	\N	\N	2017-09-06 18:12:21.703+00	2017-09-06 18:12:21.703+00	24039c8f-5921-4cec-a4dc-ebbe4655c611	{"memo": "", "composante": "cc3", "installation": "inst1", "composante_id": "92", "installation_id": "105"}	780	1	1	1	1
110	\N	\N	\N	2017-09-06 18:14:06.233+00	2017-09-06 18:14:06.233+00	87863c45-ba00-49cc-88b4-bd16d685b889	{"nom": "Les vieux", "code": "G1", "memo": "", "activite": true, "login-admin": "toto", "courriel-admin": "toto@loli.com", "mot-passe-admin": "125690", "nom-administrateur": "Toto", "date-signature-contrat": "2017-08-01"}	762	1	1	1	1
111	\N	\N	\N	2017-09-06 18:18:15.935+00	2017-09-06 18:18:15.936+00	2ff99164-8679-426c-a2d5-94298480c978	{"nom": "Colibris", "code": "G2", "memo": "", "activite": false, "login-admin": "Ludo", "courriel-admin": "Ludocic@loli.com", "mot-passe-admin": "cicod", "nom-administrateur": "Ludocic", "date-signature-contrat": "2017-09-01"}	762	1	1	1	1
112	\N	\N	\N	2017-09-06 18:18:58.612+00	2017-09-06 18:18:58.612+00	a40bfb39-1832-4de0-b462-4393081dba3d	{"clause": "cl1", "groupe": "les-vieux.g1", "clause_id": "93", "groupe_id": "110"}	772	1	1	1	1
113	\N	\N	\N	2017-09-06 18:19:10.463+00	2017-09-06 18:19:10.463+00	bf16f1be-02f8-4100-8dfc-ac29126ba230	{"clause": "cl2", "groupe": "les-vieux.g1", "clause_id": "94", "groupe_id": "110"}	772	1	1	1	1
114	\N	\N	\N	2017-09-06 18:19:23.654+00	2017-09-06 18:19:23.654+00	581a51aa-71fb-4214-8e3e-5fbddaf4f428	{"clause": "cl4", "groupe": "les-vieux.g1", "clause_id": "96", "groupe_id": "110"}	772	1	1	1	1
115	\N	\N	\N	2017-09-06 18:20:30.329+00	2017-09-06 18:20:30.329+00	4a527621-b80b-494b-9d98-872f580a8b32	{"memo": "", "groupe": "les-vieux.g1", "groupe_id": "110", "type-operation": "to1", "type-operation_id": "100"}	774	1	1	1	1
116	\N	\N	\N	2017-09-06 18:20:45.059+00	2017-09-06 18:20:45.059+00	360bc5d7-7eff-436c-95dc-67e3e1cf082f	{"memo": "", "groupe": "les-vieux.g1", "groupe_id": "110", "type-operation": "to2", "type-operation_id": "101"}	774	1	1	1	1
117	\N	\N	\N	2017-09-06 18:24:36.918+00	2017-09-06 18:24:36.918+00	adf0ccfc-6eeb-4a63-b41a-b9be51f34e72	{"nom": "Les Jo", "code": "F1", "memo": "", "active": true, "groupe": "les-vieux.g1", "code-bd": "BDJB1", "courriel": "Jo@lesvieux.ca", "groupe_id": "110", "mot-passe": "jbjbjb", "facturable": false, "en-activite": true, "installation": "inst1", "date-fermeture": null, "date-ouverture": "2017-08-08", "installation_id": "105", "date-installation": "2017-08-10", "nom-administrateur": "JoBlo", "date-arret-instance": null, "date-mise-en-service": "2017-08-14"}	760	1	1	1	1
118	\N	\N	\N	2017-09-06 18:26:34.775+00	2017-09-06 18:26:34.775+00	fda1f01e-77b4-47ca-90fc-41d026da681c	{"code": "OPG1", "memo": "", "duree": "", "groupe": "les-vieux.g1", "statut": " terminé", "groupe_id": "110", "operateur": "op1", "planifiee": false, "facturable": false, "operateur_id": "97", "date-execution": "2017-08-15", "type-operation": "to1", "montant-facture": "", "type-operation_id": "100"}	769	1	1	1	1
120	\N	\N	\N	2017-09-06 18:47:44.147+00	2017-09-13 15:25:48.098+00	2923990e-3326-4375-afb1-1596eb040765	{"code": "OF1", "memo": "", "famille": "f1.bdjb1", "complete": true, "operateur": "op2", "famille_id": "117", "operateur_id": "98", "date-operation": "2017-08-16", "type-operation": "to1", "type-operation_id": "100", "famille__info__nom": "Les Jo", "operateur__info__nom": "Benoit", "type-operation__info__nom": ""}	766	1	1	1	1
121	\N	\N	\N	2017-09-06 19:04:20.828+00	2017-09-06 19:04:20.828+00	cdbbd4b4-10b7-484b-aac4-4b48f6935f4f	{"nom": "Linuq", "code": "G3", "memo": "", "activite": true, "login-admin": "FRDJ", "courriel-admin": "fr@linuq.org", "mot-passe-admin": "passmoi", "nom-administrateur": "François", "date-signature-contrat": "2017-09-01"}	762	1	1	1	1
122	\N	\N	\N	2017-09-06 19:06:06.599+00	2017-09-06 19:06:06.599+00	8d89b6ad-bb92-4e8e-b939-b17287dd663e	{"nom": "Syl", "code": "F5", "memo": "", "active": true, "groupe": "linuq.g3", "code-bd": "BD45", "courriel": "s@linuq.org", "groupe_id": "121", "mot-passe": "poiuyhjkl", "facturable": true, "en-activite": true, "installation": "inst1", "date-fermeture": null, "date-ouverture": "2017-09-19", "installation_id": "105", "date-installation": "2017-09-02", "nom-administrateur": "Syl", "date-arret-instance": null, "date-mise-en-service": null}	760	1	1	1	1
\.


--
-- Name: prototype_prototable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_prototable_id_seq', 122, true);


--
-- Data for Name: prototype_prototype; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_prototype (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", code, description, notes, "metaDefinition", entity_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "smVersion_id") FROM stdin;
332	piafs-familles	\N	\N	2017-09-06 23:59:06.222+00	2017-11-14 19:00:09.515+00	4b35ff29-e194-48b7-8538-be3c608a6260	piafs-familles	compte de famille	\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 760}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__groupe_id", "type": "foreignid", "hidden": true, "fkField": "info__groupe_id", "readOnly": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "vType": "", "header": "Groupe", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes", "prpDefault": ""}, {"name": "info__courriel", "type": "string", "vType": "", "header": "Courriel", "choices": "", "primary": false, "tooltip": "Normalement celui de l'administrtaeur", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__date-installation", "type": "date", "vType": "", "header": "Date installation", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__nom-administrateur", "type": "string", "vType": "", "header": "Nom administrateur", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__mot-passe", "type": "string", "vType": "", "header": "Mot passe ", "choices": "", "primary": false, "tooltip": "Celui de l'administrateur, en fait celui du compte", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "prpDefault": ""}, {"name": "info__code-bd", "type": "string", "vType": "", "header": "Code BD", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "prpDefault": ""}, {"name": "info__facturable", "type": "bool", "vType": "", "header": "Facturable", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-ouverture", "type": "date", "vType": "", "header": "Date ouverture", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-fermeture", "type": "date", "vType": "", "header": "Date fermeture", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__en-activite", "type": "bool", "vType": "", "header": "En activité", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__nom", "type": "string", "vType": "", "header": "Nom", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-mise-en-service", "type": "date", "vType": "", "header": "Date mise en service", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-arret-instance", "type": "date", "vType": "", "header": "Date arrêt instance", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__active", "type": "bool", "vType": "", "header": "Active", "choices": "", "primary": false, "tooltip": "Vrai si en activité", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__installation_id", "type": "foreignid", "hidden": true, "fkField": "info__installation_id", "readOnly": true}, {"fkId": "info__installation_id", "name": "info__installation", "type": "foreigntext", "vType": "", "header": "Installation ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-installations", "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-familles", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-familles", "physicalName": "@myStr(\\"info__code\\",\\"info__code-bd\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-familles", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__courriel", "__ptType": "formField"}, {"name": "info__date-installation", "__ptType": "formField"}, {"name": "info__nom-administrateur", "__ptType": "formField"}, {"name": "info__mot-passe", "__ptType": "formField"}, {"name": "info__code-bd", "__ptType": "formField"}, {"name": "info__facturable", "__ptType": "formField"}, {"name": "info__date-ouverture", "__ptType": "formField"}, {"name": "info__date-fermeture", "__ptType": "formField"}, {"name": "info__en-activite", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"name": "info__date-mise-en-service", "__ptType": "formField"}, {"name": "info__date-arret-instance", "__ptType": "formField"}, {"name": "info__active", "__ptType": "formField"}, {"name": "info__installation", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=760"}], "sortFields": ["info__code", "info__groupe", "info__courriel", "info__date-installation", "info__nom-administrateur", "info__mot-passe", "info__code-bd", "info__facturable", "info__date-ouverture", "info__date-fermeture", "info__en-activite", "info__nom", "info__memo", "info__date-mise-en-service", "info__date-arret-instance", "info__active", "info__installation", "__str__"], "listDisplay": ["info__code", "info__groupe", "info__courriel", "info__date-installation", "info__nom-administrateur", "info__mot-passe", "info__code-bd", "info__facturable"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-familles", "updateTime": "2017-11-14T14:00:09.475", "viewEntity": "prototype.ProtoTable", "description": "compte de famille", "metaVersion": "13.0301", "protoEntity": "piafs-familles", "detailsConfig": [{"menuText": "Opérations famille", "detailName": "operations-famille", "detailField": "info__famille_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-famille"}, {"menuText": "Factures famille", "detailName": "factures-famille", "detailField": "info__famille_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-factures-famille"}], "protoEntityId": 760}	760	1	1	1	1	1
333	piafs-groupes	\N	\N	2017-09-06 23:59:06.261+00	2017-11-14 19:00:09.588+00	b281f9a9-daef-448b-a74c-950d93c64364	piafs-groupes	groupe de famille	\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 762}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__nom", "type": "string", "vType": "string", "header": "Nom", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__date-signature-contrat", "type": "date", "vType": "", "header": "Date signature contrat", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__nom-administrateur", "type": "string", "vType": "", "header": "Nom administrateur", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__login-admin", "type": "string", "vType": "", "header": "Login admin", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "prpDefault": ""}, {"name": "info__mot-passe-admin", "type": "string", "vType": "", "header": "Mot passe admin", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "prpDefault": ""}, {"name": "info__courriel-admin", "type": "string", "vType": "", "header": "Courriel admin", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__activite", "type": "bool", "vType": "", "header": "Activité", "choices": "", "primary": false, "tooltip": "Si vrai le groupe est en service", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "notes sur l'activité", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-groupes", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-groupes", "physicalName": "@myStr(\\"info__nom\\",\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-groupes", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__nom", "__ptType": "formField"}, {"name": "info__code", "__ptType": "formField"}, {"name": "info__date-signature-contrat", "__ptType": "formField"}, {"name": "info__nom-administrateur", "__ptType": "formField"}, {"name": "info__login-admin", "__ptType": "formField"}, {"name": "info__mot-passe-admin", "__ptType": "formField"}, {"name": "info__courriel-admin", "__ptType": "formField"}, {"name": "info__activite", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=762"}], "sortFields": ["info__nom", "info__code", "info__date-signature-contrat", "info__nom-administrateur", "info__login-admin", "info__mot-passe-admin", "info__courriel-admin", "info__activite", "info__memo", "__str__"], "listDisplay": ["info__nom", "info__code", "info__date-signature-contrat", "info__nom-administrateur", "info__login-admin", "info__mot-passe-admin", "info__courriel-admin", "info__activite"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-groupes", "updateTime": "2017-11-14T14:00:09.564", "viewEntity": "prototype.ProtoTable", "description": "groupe de famille", "metaVersion": "13.0301", "protoEntity": "piafs-groupes", "detailsConfig": [{"menuText": "Familles", "detailName": "familles", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-familles"}, {"menuText": "Facture groupe", "detailName": "facture-groupe", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-facture-groupe"}, {"menuText": "Lignes contrat", "detailName": "lignes-contrat", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-lignes-contrat"}, {"menuText": "Lignes planification", "detailName": "lignes-planification", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-lignes-planification"}, {"menuText": "Opérations groupe", "detailName": "operations-groupe", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-groupe"}], "protoEntityId": 762}	762	1	1	1	1	1
334	piafs-operateurs	\N	\N	2017-09-06 23:59:06.284+00	2017-11-14 19:00:09.641+00	f0b54b3b-b9e9-4d83-ac5b-5018fed286b3	piafs-operateurs		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 765}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__mot-de-passe", "type": "string", "vType": "", "header": "Mot de passe", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "prpDefault": ""}, {"name": "info__date-chgt-mot-de-passe", "type": "date", "vType": "", "header": "Date  chgt mot de passe", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__nom", "type": "string", "vType": "", "header": "Nom", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-operateurs", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-operateurs", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-operateurs", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__mot-de-passe", "__ptType": "formField"}, {"name": "info__date-chgt-mot-de-passe", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=765"}], "sortFields": ["info__code", "info__mot-de-passe", "info__date-chgt-mot-de-passe", "info__nom", "__str__"], "listDisplay": ["info__code", "info__mot-de-passe", "info__date-chgt-mot-de-passe", "info__nom"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-operateurs", "updateTime": "2017-11-14T14:00:09.627", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-operateurs", "detailsConfig": [{"menuText": "Opérations famille", "detailName": "operations-famille", "detailField": "info__operateur_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-famille"}, {"menuText": "Opérations groupe", "detailName": "operations-groupe", "detailField": "info__operateur_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-groupe"}], "protoEntityId": 765}	765	1	1	1	1	1
335	piafs-operations-famille	\N	\N	2017-09-06 23:59:06.32+00	2017-11-14 19:00:09.67+00	19a90af7-8478-44a1-b15d-6f3c35537397	piafs-operations-famille		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 766}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__date-operation", "type": "date", "vType": "", "header": "Date opération", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__complete", "type": "bool", "vType": "", "header": "Complété", "choices": "", "primary": false, "tooltip": "Si vrai l'opération est complétée", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": "0"}, {"name": "info__operateur_id", "type": "foreignid", "hidden": true, "fkField": "info__operateur_id", "readOnly": true}, {"fkId": "info__operateur_id", "name": "info__operateur", "type": "foreigntext", "vType": "", "header": "Opérateur", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-operateurs", "prpDefault": ""}, {"name": "info__type-operation_id", "type": "foreignid", "hidden": true, "fkField": "info__type-operation_id", "readOnly": true}, {"fkId": "info__type-operation_id", "name": "info__type-operation", "type": "foreigntext", "vType": "", "header": "Type opération", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-operation", "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__famille_id", "type": "foreignid", "hidden": true, "fkField": "info__famille_id", "readOnly": true}, {"fkId": "info__famille_id", "name": "info__famille", "type": "foreigntext", "vType": "", "header": "Famille", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-familles", "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-operations-famille", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-operations-famille", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-operations-famille", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__date-operation", "__ptType": "formField"}, {"name": "info__complete", "__ptType": "formField"}, {"name": "info__operateur", "__ptType": "formField"}, {"name": "info__type-operation", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"name": "info__famille", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=766"}], "sortFields": ["info__code", "info__date-operation", "info__complete", "info__operateur", "info__type-operation", "info__memo", "info__famille", "__str__"], "listDisplay": ["info__code", "info__date-operation", "info__complete", "info__operateur", "info__type-operation", "info__memo", "info__famille"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-operations-famille", "updateTime": "2017-11-14T14:00:09.647", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-operations-famille", "detailsConfig": [], "protoEntityId": 766}	766	1	1	1	1	1
336	piafs-factures-famille	\N	\N	2017-09-06 23:59:06.342+00	2017-11-14 19:00:09.689+00	ad7f30fb-91bd-4bde-9cd9-13aaa5f3cbe6	piafs-factures-famille		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 767}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__date-ouverture", "type": "date", "vType": "", "header": "Date ouverture", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-cloture", "type": "date", "vType": "", "header": "Date cloture", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__montant", "type": "money", "vType": "", "header": "Montant", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 2, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__famille_id", "type": "foreignid", "hidden": true, "fkField": "info__famille_id", "readOnly": true}, {"fkId": "info__famille_id", "name": "info__famille", "type": "foreigntext", "vType": "", "header": "Famille ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-familles", "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-factures-famille", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-factures-famille", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-factures-famille", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__date-ouverture", "__ptType": "formField"}, {"name": "info__date-cloture", "__ptType": "formField"}, {"name": "info__montant", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"name": "info__famille", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=767"}], "sortFields": ["info__code", "info__date-ouverture", "info__date-cloture", "info__montant", "info__memo", "info__famille", "__str__"], "listDisplay": ["info__code", "info__date-ouverture", "info__date-cloture", "info__montant", "info__memo", "info__famille"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-factures-famille", "updateTime": "2017-11-14T14:00:09.677", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-factures-famille", "detailsConfig": [], "protoEntityId": 767}	767	1	1	1	1	1
337	piafs-facture-groupe	\N	\N	2017-09-06 23:59:06.368+00	2017-11-14 19:00:09.708+00	5389c2e1-f17d-40bb-a985-9c8fee96ab22	piafs-facture-groupe		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 768}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__date-debut", "type": "date", "vType": "", "header": "Date début", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-fin", "type": "date", "vType": "", "header": "Date fin", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__groupe_id", "type": "foreignid", "hidden": true, "fkField": "info__groupe_id", "readOnly": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "vType": "", "header": "Groupe", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes", "prpDefault": ""}, {"name": "info__montant-ht", "type": "money", "vType": "", "header": "Montant HT", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 2, "prpDefault": ""}, {"name": "info__mntant-taxes", "type": "money", "vType": "", "header": "Mntant taxes", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 2, "prpDefault": ""}, {"name": "info__montant-ttc", "type": "money", "vType": "", "header": "Montant TTC", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 2, "prpDefault": ""}, {"name": "info__date-paiement", "type": "date", "vType": "", "header": "Date paiement", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-facture-groupe", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-facture-groupe", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-facture-groupe", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__date-debut", "__ptType": "formField"}, {"name": "info__date-fin", "__ptType": "formField"}, {"name": "info__code", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__montant-ht", "__ptType": "formField"}, {"name": "info__mntant-taxes", "__ptType": "formField"}, {"name": "info__montant-ttc", "__ptType": "formField"}, {"name": "info__date-paiement", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=768"}], "sortFields": ["info__date-debut", "info__date-fin", "info__code", "info__groupe", "info__montant-ht", "info__mntant-taxes", "info__montant-ttc", "info__date-paiement", "info__memo", "__str__"], "listDisplay": ["info__date-debut", "info__date-fin", "info__code", "info__groupe", "info__montant-ht", "info__mntant-taxes", "info__montant-ttc", "info__date-paiement"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-facture-groupe", "updateTime": "2017-11-14T14:00:09.695", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-facture-groupe", "detailsConfig": [], "protoEntityId": 768}	768	1	1	1	1	1
338	piafs-operations-groupe	\N	\N	2017-09-06 23:59:06.395+00	2017-11-14 19:00:09.738+00	ec71969a-814b-4e3e-94f1-1c2072690641	piafs-operations-groupe		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 769}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "sequence", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-execution", "type": "date", "vType": "", "header": "Date exécution", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__duree", "type": "datetime", "vType": "", "header": "Durée ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__statut", "type": "combo", "vType": "", "header": "Statut ", "choices": "prévu, préparé, en cours, terminé", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__operateur_id", "type": "foreignid", "hidden": true, "fkField": "info__operateur_id", "readOnly": true}, {"fkId": "info__operateur_id", "name": "info__operateur", "type": "foreigntext", "vType": "", "header": "Opérateur", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-operateurs", "prpDefault": ""}, {"name": "info__type-operation_id", "type": "foreignid", "hidden": true, "fkField": "info__type-operation_id", "readOnly": true}, {"fkId": "info__type-operation_id", "name": "info__type-operation", "type": "foreigntext", "vType": "", "header": "Type opération", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-operation", "prpDefault": ""}, {"name": "info__facturable", "type": "bool", "vType": "", "header": "Facturable", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__montant-facture", "type": "money", "vType": "", "header": "Montant facturé", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 2, "prpDefault": ""}, {"name": "info__planifiee", "type": "bool", "vType": "", "header": "Planifiée", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__groupe_id", "type": "foreignid", "hidden": true, "fkField": "info__groupe_id", "readOnly": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "vType": "", "header": "Groupe", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes", "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-operations-groupe", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-operations-groupe", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-operations-groupe", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__date-execution", "__ptType": "formField"}, {"name": "info__duree", "__ptType": "formField"}, {"name": "info__statut", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"name": "info__operateur", "__ptType": "formField"}, {"name": "info__type-operation", "__ptType": "formField"}, {"name": "info__facturable", "__ptType": "formField"}, {"name": "info__montant-facture", "__ptType": "formField"}, {"name": "info__planifiee", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=769"}], "sortFields": ["info__code", "info__date-execution", "info__duree", "info__statut", "info__memo", "info__operateur", "info__type-operation", "info__facturable", "info__montant-facture", "info__planifiee", "info__groupe", "__str__"], "listDisplay": ["info__code", "info__date-execution", "info__duree", "info__statut", "info__memo", "info__operateur", "info__type-operation", "info__facturable"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-operations-groupe", "updateTime": "2017-11-14T14:00:09.714", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-operations-groupe", "detailsConfig": [], "protoEntityId": 769}	769	1	1	1	1	1
339	piafs-clauses	\N	\N	2017-09-06 23:59:06.415+00	2017-11-14 19:00:09.754+00	f8b50eac-6bdf-4be2-a457-c042f2dc94ee	piafs-clauses		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 771}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__nom", "type": "string", "vType": "", "header": "Nom ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__prix", "type": "money", "vType": "", "header": "Prix", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 2, "prpDefault": ""}, {"name": "info__decription", "type": "text", "vType": "", "header": "Decription", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-clauses", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-clauses", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-clauses", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__prix", "__ptType": "formField"}, {"name": "info__decription", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=771"}], "sortFields": ["info__code", "info__nom", "info__prix", "info__decription", "__str__"], "listDisplay": ["info__code", "info__nom", "info__prix", "info__decription"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-clauses", "updateTime": "2017-11-14T14:00:09.744", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-clauses", "detailsConfig": [{"menuText": "Lignes contrat", "detailName": "lignes-contrat", "detailField": "info__clause_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-lignes-contrat"}], "protoEntityId": 771}	771	1	1	1	1	1
340	piafs-lignes-contrat	\N	\N	2017-09-06 23:59:06.439+00	2017-11-14 19:00:09.777+00	e7d8ee1e-ba5e-4ef1-8d8d-27f1d7f86028	piafs-lignes-contrat		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 772}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__clause_id", "type": "foreignid", "hidden": true, "fkField": "info__clause_id", "readOnly": true}, {"fkId": "info__clause_id", "name": "info__clause", "type": "foreigntext", "vType": "", "header": "Clause ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-clauses", "prpDefault": ""}, {"name": "info__groupe_id", "type": "foreignid", "hidden": true, "fkField": "info__groupe_id", "readOnly": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "vType": "", "header": "Groupe ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes", "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-lignes-contrat", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-lignes-contrat", "physicalName": "@myStr(\\"\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-lignes-contrat", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__clause", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=772"}], "sortFields": ["info__clause", "info__groupe", "__str__"], "listDisplay": ["info__clause", "info__groupe"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-lignes-contrat", "updateTime": "2017-11-14T14:00:09.759", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-lignes-contrat", "detailsConfig": [], "protoEntityId": 772}	772	1	1	1	1	1
341	piafs-types-operation	\N	\N	2017-09-06 23:59:06.474+00	2017-11-14 19:00:09.799+00	101e596e-3db0-47a7-ad76-e92dee5cc365	piafs-types-operation		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 773}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__nom", "type": "string", "vType": "", "header": "Nom", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__frequence", "type": "combo", "vType": "", "header": "Fréquence", "choices": "jour, semaine, mois, an, variable, création, fermeture", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__script", "type": "text", "vType": "", "header": "Script", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-types-operation", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-types-operation", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-types-operation", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__frequence", "__ptType": "formField"}, {"name": "info__script", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=773"}], "sortFields": ["info__code", "info__nom", "info__frequence", "info__script", "info__memo", "__str__"], "listDisplay": ["info__code", "info__nom", "info__frequence", "info__script", "info__memo"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-types-operation", "updateTime": "2017-11-14T14:00:09.782", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-types-operation", "detailsConfig": [{"menuText": "Opérations groupe", "detailName": "operations-groupe", "detailField": "info__type-operation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-groupe"}, {"menuText": "Lignes planification", "detailName": "lignes-planification", "detailField": "info__type-operation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-lignes-planification"}, {"menuText": "Opérations famille", "detailName": "operations-famille", "detailField": "info__type-operation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-famille"}], "protoEntityId": 773}	773	1	1	1	1	1
342	piafs-lignes-planification	\N	\N	2017-09-06 23:59:06.538+00	2017-11-14 19:00:09.822+00	f9cbd6aa-d092-44ad-9455-263bb06b1b6d	piafs-lignes-planification		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 774}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__type-operation_id", "type": "foreignid", "hidden": true, "fkField": "info__type-operation_id", "readOnly": true}, {"fkId": "info__type-operation_id", "name": "info__type-operation", "type": "foreigntext", "vType": "", "header": "Type opération ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-operation", "prpDefault": ""}, {"name": "info__groupe_id", "type": "foreignid", "hidden": true, "fkField": "info__groupe_id", "readOnly": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "vType": "", "header": "Groupe ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes", "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-lignes-planification", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-lignes-planification", "physicalName": "@myStr(\\"\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-lignes-planification", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__type-operation", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=774"}], "sortFields": ["info__type-operation", "info__groupe", "info__memo", "__str__"], "listDisplay": ["info__type-operation", "info__groupe", "info__memo"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-lignes-planification", "updateTime": "2017-11-14T14:00:09.806", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-lignes-planification", "detailsConfig": [], "protoEntityId": 774}	774	1	1	1	1	1
343	piafs-installations	\N	\N	2017-09-06 23:59:06.588+00	2017-11-14 19:00:09.842+00	9d3af506-4d7e-4596-9e77-419467e886e8	piafs-installations		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 775}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__date-creation", "type": "date", "vType": "", "header": "Date création", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-mise-en-service", "type": "date", "vType": "", "header": "Date mise en service", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__date-fin-usage", "type": "date", "vType": "", "header": "Date fin usage", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__active", "type": "bool", "vType": "", "header": "Active", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-installations", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-installations", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-installations", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__date-creation", "__ptType": "formField"}, {"name": "info__date-mise-en-service", "__ptType": "formField"}, {"name": "info__date-fin-usage", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"name": "info__active", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=775"}], "sortFields": ["info__code", "info__date-creation", "info__date-mise-en-service", "info__date-fin-usage", "info__memo", "info__active", "__str__"], "listDisplay": ["info__code", "info__date-creation", "info__date-mise-en-service", "info__date-fin-usage", "info__memo", "info__active"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-installations", "updateTime": "2017-11-14T14:00:09.828", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-installations", "detailsConfig": [{"menuText": "Composantes installées", "detailName": "composantes-installees", "detailField": "info__installation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-composantes-installees"}, {"menuText": "Familles", "detailName": "familles", "detailField": "info__installation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-familles"}], "protoEntityId": 775}	775	1	1	1	1	1
344	piafs-composantes	\N	\N	2017-09-06 23:59:06.629+00	2017-11-14 19:00:09.864+00	17d2eb5a-22ad-4fcd-918f-e7cf5f719787	piafs-composantes	Composante logiciel	\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 779}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__nom", "type": "string", "vType": "", "header": "Nom ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__version", "type": "string", "vType": "", "header": "Version ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__script", "type": "text", "vType": "", "header": "Script", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"name": "info__type-composante_id", "type": "foreignid", "hidden": true, "fkField": "info__type-composante_id", "readOnly": true}, {"fkId": "info__type-composante_id", "name": "info__type-composante", "type": "foreigntext", "vType": "", "header": "Type composante", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-composante", "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-composantes", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-composantes", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-composantes", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__version", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"name": "info__script", "__ptType": "formField"}, {"name": "info__type-composante", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=779"}], "sortFields": ["info__code", "info__nom", "info__version", "info__memo", "info__script", "info__type-composante", "__str__"], "listDisplay": ["info__code", "info__nom", "info__version", "info__memo", "info__script", "info__type-composante"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-composantes", "updateTime": "2017-11-14T14:00:09.847", "viewEntity": "prototype.ProtoTable", "description": "Composante logiciel", "metaVersion": "13.0301", "protoEntity": "piafs-composantes", "detailsConfig": [{"menuText": "Composantes installées", "detailName": "composantes-installees", "detailField": "info__composante_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-composantes-installees"}], "protoEntityId": 779}	779	1	1	1	1	1
345	piafs-composantes-installees	\N	\N	2017-09-06 23:59:06.661+00	2017-11-14 19:00:09.887+00	57d18883-e594-4b77-88ce-6379fd3bc308	piafs-composantes-installees		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 780}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__installation_id", "type": "foreignid", "hidden": true, "fkField": "info__installation_id", "readOnly": true}, {"fkId": "info__installation_id", "name": "info__installation", "type": "foreigntext", "vType": "", "header": "Installation ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-installations", "prpDefault": ""}, {"name": "info__composante_id", "type": "foreignid", "hidden": true, "fkField": "info__composante_id", "readOnly": true}, {"fkId": "info__composante_id", "name": "info__composante", "type": "foreigntext", "vType": "", "header": "Composante ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-composantes", "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-composantes-installees", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-composantes-installees", "physicalName": "@myStr(\\"\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-composantes-installees", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__installation", "__ptType": "formField"}, {"name": "info__composante", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=780"}], "sortFields": ["info__installation", "info__composante", "info__memo", "__str__"], "listDisplay": ["info__installation", "info__composante", "info__memo"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-composantes-installees", "updateTime": "2017-11-14T14:00:09.869", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-composantes-installees", "detailsConfig": [], "protoEntityId": 780}	780	1	1	1	1	1
346	piafs-types-composante	\N	\N	2017-09-06 23:59:06.683+00	2017-11-14 19:00:09.909+00	c7065ee4-dfdb-4e67-ae07-6c37e0174980	piafs-types-composante		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 781}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__nom", "type": "string", "vType": "", "header": "Nom", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 50, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-types-composante", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-types-composante", "physicalName": "@myStr(\\"info__code\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-types-composante", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=781"}], "sortFields": ["info__code", "info__nom", "info__memo", "__str__"], "listDisplay": ["info__code", "info__nom", "info__memo"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-types-composante", "updateTime": "2017-11-14T14:00:09.892", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-types-composante", "detailsConfig": [{"menuText": "Composantes", "detailName": "composantes", "detailField": "info__type-composante_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-composantes"}], "protoEntityId": 781}	781	1	1	1	1	1
347	piafs-voir-famille	\N	\N	2017-09-07 00:56:32.673+00	2017-09-07 01:03:41.31+00	b56ef5ee-3fc4-4bf9-aabc-cb6e75fe105f	piafs-voir-famille	compte de famille	\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-voir-famille", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-voir-famille", "physicalName": "@myStr(\\"info__code\\",\\"info__code-bd\\")"}, {"name": "info__active", "type": "bool", "header": "Active", "tooltip": "Vrai si en activité", "__ptType": "field", "sortable": true}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__code-bd", "type": "string", "header": "Code BD", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__courriel", "type": "string", "header": "Courriel", "tooltip": "Normalement celui de l'administrtaeur", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__date-arret-instance", "type": "date", "header": "Date arrêt instance", "__ptType": "field", "sortable": true}, {"name": "info__date-fermeture", "type": "date", "header": "Date fermeture", "__ptType": "field", "sortable": true}, {"name": "info__date-installation", "type": "date", "header": "Date installation", "__ptType": "field", "sortable": true}, {"name": "info__date-mise-en-service", "type": "date", "header": "Date mise en service", "__ptType": "field", "sortable": true}, {"name": "info__date-ouverture", "type": "date", "header": "Date ouverture", "__ptType": "field", "sortable": true}, {"name": "info__en-activite", "type": "bool", "header": "En activité", "__ptType": "field", "sortable": true}, {"name": "info__facturable", "type": "bool", "header": "Facturable", "__ptType": "field", "sortable": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "header": "Groupe", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes"}, {"fkId": "info__installation_id", "name": "info__installation", "type": "foreigntext", "header": "Installation ", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-installations"}, {"name": "info__memo", "type": "text", "header": "Mémo ", "__ptType": "field", "sortable": true}, {"name": "info__mot-passe", "type": "string", "header": "Mot passe ", "tooltip": "Celui de l'administrateur, en fait celui du compte", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__nom", "type": "string", "header": "Nom", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__nom-administrateur", "type": "string", "header": "Nom administrateur", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 760}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__groupe_id", "type": "foreignid", "header": "groupe_id", "hidden": true, "fkField": "info__groupe_id", "__ptType": "field", "readOnly": true}, {"name": "info__installation_id", "type": "foreignid", "header": "installation_id", "hidden": true, "fkField": "info__installation_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-voir-famille", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__courriel", "__ptType": "formField"}, {"name": "info__date-installation", "__ptType": "formField"}, {"name": "info__nom-administrateur", "__ptType": "formField"}, {"name": "info__mot-passe", "__ptType": "formField"}, {"name": "info__code-bd", "__ptType": "formField"}, {"name": "info__facturable", "__ptType": "formField"}, {"name": "info__date-ouverture", "__ptType": "formField"}, {"name": "info__date-fermeture", "__ptType": "formField"}, {"name": "info__en-activite", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"name": "info__date-mise-en-service", "__ptType": "formField"}, {"name": "info__date-arret-instance", "__ptType": "formField"}, {"name": "info__active", "__ptType": "formField"}, {"name": "info__installation", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=760"}], "sortFields": ["info__code", "info__groupe", "info__courriel", "info__date-installation", "info__nom-administrateur", "info__mot-passe", "info__code-bd", "info__facturable", "info__date-ouverture", "info__date-fermeture", "info__en-activite", "info__nom", "info__memo", "info__date-mise-en-service", "info__date-arret-instance", "info__active", "info__installation", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__nom", "info__groupe", "info__active"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-voir-famille", "updateTime": "2017-09-06 21:03:41", "viewEntity": "prototype.ProtoTable", "description": "compte de famille", "metaVersion": "13.0301", "protoEntity": "piafs-familles", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [], "protoEntityId": 760}	760	1	1	1	1	1
349	piafs-d-groupes	\N	\N	2017-09-11 19:08:53.059+00	2017-09-13 00:54:59.116+00	9e5be2e8-ddf8-4064-932d-ed0f7db54059	piafs-d-groupes	groupe de famille	\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-groupes", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-groupes", "physicalName": "@myStr(\\"info__nom\\",\\"info__code\\")"}, {"name": "info__activite", "type": "bool", "header": "Activité", "tooltip": "Si vrai le groupe est en service", "__ptType": "field", "sortable": true}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__courriel-admin", "type": "string", "header": "Courriel admin", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__date-signature-contrat", "type": "date", "header": "Date signature contrat", "__ptType": "field", "sortable": true}, {"name": "info__login-admin", "type": "string", "header": "Login admin", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__memo", "type": "text", "header": "Mémo", "tooltip": "notes sur l'activité", "__ptType": "field", "sortable": true}, {"name": "info__mot-passe-admin", "type": "string", "header": "Mot passe admin", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__nom", "type": "string", "vType": "string", "header": "Nom", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__nom-administrateur", "type": "string", "header": "Nom administrateur", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 762}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-groupes", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__nom", "__ptType": "formField"}, {"name": "info__code", "__ptType": "formField"}, {"name": "info__date-signature-contrat", "__ptType": "formField"}, {"name": "info__activite", "__ptType": "formField"}, {"items": [{"items": [{"name": "info__nom-administrateur", "__ptType": "formField"}, {"name": "info__login-admin", "__ptType": "formField"}, {"name": "info__mot-passe-admin", "__ptType": "formField"}, {"name": "info__courriel-admin", "__ptType": "formField"}], "title": "Administrateur", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "info__memo", "__ptType": "formField"}], "title": "Mémo", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "__ptType": "fieldset", "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Lignes contrat", "viewCode": "prototype.ProtoTable.piafs-lignes-contrat"}], "title": "Clauses du contrat", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Familles", "viewCode": "prototype.ProtoTable.piafs-familles"}], "title": "Familles", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Opérations groupe", "viewCode": "prototype.ProtoTable.piafs-operations-groupe"}], "title": "Opérations", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Lignes planification", "viewCode": "prototype.ProtoTable.piafs-lignes-planification"}], "title": "Planification", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Facture groupe", "viewCode": "prototype.ProtoTable.piafs-facture-groupe"}], "title": "Factures", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "title": "Module groupe", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=762"}], "sortFields": ["info__nom", "info__code", "info__date-signature-contrat", "info__nom-administrateur", "info__login-admin", "info__mot-passe-admin", "info__courriel-admin", "info__activite", "info__memo", "__str__"], "initialSort": [], "listDisplay": ["info__nom", "info__code", "info__date-signature-contrat", "info__nom-administrateur", "info__activite"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "M. groupes", "updateTime": "2017-09-12 20:54:59", "viewEntity": "prototype.ProtoTable", "description": "groupe de famille", "metaVersion": "13.0301", "protoEntity": "piafs-groupes", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Familles", "detailName": "familles", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-familles"}, {"__ptType": "detailDef", "menuText": "Facture groupe", "detailName": "facture-groupe", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-facture-groupe"}, {"__ptType": "detailDef", "menuText": "Lignes contrat", "detailName": "lignes-contrat", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-lignes-contrat"}, {"__ptType": "detailDef", "menuText": "Lignes planification", "detailName": "lignes-planification", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-lignes-planification"}, {"__ptType": "detailDef", "menuText": "Opérations groupe", "detailName": "operations-groupe", "detailField": "info__groupe_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-groupe"}], "protoEntityId": 762}	762	1	1	1	1	1
350	piafs-d-operateurs	\N	\N	2017-09-11 19:09:38.034+00	2017-09-13 00:12:40.625+00	3bb713a3-c9b9-42c6-b030-ea901c8874a9	piafs-d-operateurs		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-operateurs", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-operateurs", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__date-chgt-mot-de-passe", "type": "date", "header": "Date  chgt mot de passe", "__ptType": "field", "sortable": true}, {"name": "info__mot-de-passe", "type": "string", "header": "Mot de passe", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__nom", "type": "string", "header": "Nom", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 765}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-operateurs", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__nom", "__ptType": "formField"}, {"name": "info__code", "__ptType": "formField"}, {"name": "info__mot-de-passe", "__ptType": "formField"}, {"name": "info__date-chgt-mot-de-passe", "__ptType": "formField"}], "title": "Fiche opérateur", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=765"}], "sortFields": ["info__code", "info__mot-de-passe", "info__date-chgt-mot-de-passe", "info__nom", "__str__"], "initialSort": [], "listDisplay": ["info__nom", "info__code", "info__mot-de-passe", "info__date-chgt-mot-de-passe"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Opérateurs", "updateTime": "2017-09-12 20:12:40", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-operateurs", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Opérations famille", "detailName": "operations-famille", "detailField": "info__operateur_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-famille"}, {"__ptType": "detailDef", "menuText": "Opérations groupe", "detailName": "operations-groupe", "detailField": "info__operateur_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-groupe"}], "protoEntityId": 765}	765	1	1	1	1	1
351	piafs-d-operations-famille	\N	\N	2017-09-11 19:10:12.22+00	2017-09-13 15:30:50.951+00	514fea2c-ed3f-41d4-b94d-9725a1feda42	piafs-d-operations-famille		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-operations-famille", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-operations-famille", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__complete", "type": "bool", "header": "Complété", "tooltip": "Si vrai l'opération est complétée", "__ptType": "field", "sortable": true, "fieldLabel": "Complétée", "prpDefault": "0"}, {"name": "info__date-operation", "type": "date", "header": "Date opération", "__ptType": "field", "sortable": true}, {"fkId": "info__famille_id", "name": "info__famille", "type": "foreigntext", "header": "Famille", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-familles"}, {"name": "info__famille__info__nom", "type": "string", "header": "Famille", "__ptType": "field", "readOnly": true, "cpFromZoom": "info__famille", "cpFromField": "info__nom"}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"fkId": "info__operateur_id", "name": "info__operateur", "type": "foreigntext", "header": "Opérateur", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-operateurs"}, {"name": "info__operateur__info__nom", "type": "string", "header": "Opérateur", "__ptType": "field", "readOnly": true, "cpFromZoom": "info__operateur", "cpFromField": "info__nom"}, {"fkId": "info__type-operation_id", "name": "info__type-operation", "type": "foreigntext", "header": "Type opération", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-operation"}, {"name": "info__type-operation__info__nom", "type": "string", "header": "Nom", "__ptType": "field", "readOnly": true, "cpFromZoom": "info__type-operation", "fieldLabel": "Type opération", "cpFromField": "info__nom"}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 766}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__famille_id", "type": "foreignid", "header": "famille_id", "hidden": true, "fkField": "info__famille_id", "__ptType": "field", "readOnly": true}, {"name": "info__operateur_id", "type": "foreignid", "header": "operateur_id", "hidden": true, "fkField": "info__operateur_id", "__ptType": "field", "readOnly": true}, {"name": "info__type-operation_id", "type": "foreignid", "header": "type-operation_id", "hidden": true, "fkField": "info__type-operation_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-operations-famille", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__date-operation", "__ptType": "formField"}, {"name": "info__famille", "__ptType": "formField"}, {"name": "info__famille__info__nom", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom"}, {"name": "info__type-operation", "__ptType": "formField"}, {"name": "info__type-operation__info__nom", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom"}, {"name": "info__operateur", "__ptType": "formField"}, {"name": "info__operateur__info__nom", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"name": "info__complete", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=766"}], "sortFields": ["info__code", "info__date-operation", "info__complete", "info__operateur", "info__type-operation", "info__memo", "info__famille", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__complete", "info__famille__info__nom", "info__type-operation__info__nom", "info__operateur__info__nom", "info__date-operation"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "OP. famille", "updateTime": "2017-09-13 11:30:50", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-operations-famille", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [], "protoEntityId": 766}	766	1	1	1	1	1
352	piafs-d-factures-familles	\N	\N	2017-09-11 19:10:34.873+00	2017-09-13 17:48:02.862+00	d409ceea-7430-45d2-8899-d7ce6d894390	piafs-d-factures-familles		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-factures-familles", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-factures-familles", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__date-cloture", "type": "date", "header": "Date cloture", "__ptType": "field", "sortable": true}, {"name": "info__date-ouverture", "type": "date", "header": "Date ouverture", "__ptType": "field", "sortable": true}, {"fkId": "info__famille_id", "name": "info__famille", "type": "foreigntext", "header": "Famille ", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-familles"}, {"name": "info__famille__info__nom", "type": "string", "header": "Nom", "__ptType": "field", "readOnly": true, "cpFromZoom": "info__famille", "cpFromField": "info__nom"}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"name": "info__montant", "type": "string", "header": "Montant", "__ptType": "field", "sortable": true, "prpLength": 2}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 767}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__famille_id", "type": "foreignid", "header": "famille_id", "hidden": true, "fkField": "info__famille_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-factures-familles", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__famille", "__ptType": "formField"}, {"name": "info__famille__info__nom", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom"}, {"name": "info__date-ouverture", "__ptType": "formField"}, {"name": "info__date-cloture", "__ptType": "formField"}, {"name": "info__montant", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "title": "Facture Famille", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=767"}], "sortFields": ["info__code", "info__date-ouverture", "info__date-cloture", "info__montant", "info__memo", "info__famille", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__famille", "info__famille__info__nom", "info__montant", "info__date-ouverture", "info__date-cloture"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Fac. famille", "updateTime": "2017-09-13 13:48:02", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-factures-famille", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [], "protoEntityId": 767}	767	1	1	1	1	1
353	piafs-d-factures-groupe	\N	\N	2017-09-11 19:10:57.032+00	2017-09-13 17:53:37.139+00	56b1b1b4-dd58-4869-8d9a-9bcac116d61c	piafs-d-factures-groupe		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-factures-groupe", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-factures-groupe", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__date-debut", "type": "date", "header": "Date début", "__ptType": "field", "sortable": true}, {"name": "info__date-fin", "type": "date", "header": "Date fin", "__ptType": "field", "sortable": true}, {"name": "info__date-paiement", "type": "date", "header": "Date paiement", "__ptType": "field", "sortable": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "header": "Groupe", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes"}, {"name": "info__groupe__info__nom", "type": "string", "vType": "string", "header": "Nom", "__ptType": "field", "readOnly": true, "cpFromZoom": "info__groupe", "cpFromField": "info__nom"}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"name": "info__mntant-taxes", "type": "string", "header": "Mntant taxes", "__ptType": "field", "sortable": true, "prpLength": 2}, {"name": "info__montant-ht", "type": "string", "header": "Montant HT", "__ptType": "field", "sortable": true, "prpLength": 2}, {"name": "info__montant-ttc", "type": "string", "header": "Montant TTC", "__ptType": "field", "sortable": true, "prpLength": 2}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 768}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__groupe_id", "type": "foreignid", "header": "groupe_id", "hidden": true, "fkField": "info__groupe_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-factures-groupe", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__groupe__info__nom", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom"}, {"name": "info__date-debut", "__ptType": "formField"}, {"name": "info__date-fin", "__ptType": "formField"}, {"name": "info__montant-ht", "__ptType": "formField"}, {"name": "info__mntant-taxes", "__ptType": "formField"}, {"name": "info__montant-ttc", "__ptType": "formField"}, {"name": "info__date-paiement", "__ptType": "formField"}, {"items": [{"name": "info__memo", "__ptType": "formField"}], "title": "M/mo", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "title": "Facture groupe", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=768"}], "sortFields": ["info__date-debut", "info__date-fin", "info__code", "info__groupe", "info__montant-ht", "info__mntant-taxes", "info__montant-ttc", "info__date-paiement", "info__memo", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__groupe", "info__groupe__info__nom", "info__montant-ttc", "info__date-fin", "info__date-paiement"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Fac. groupe", "updateTime": "2017-09-13 13:53:37", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-facture-groupe", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [], "protoEntityId": 768}	768	1	1	1	1	1
354	piafs-d-operations-groupe	\N	\N	2017-09-11 19:11:10.775+00	2017-09-13 15:20:07.694+00	ad0df64b-183d-4a48-a6c9-7f1067ece2e2	piafs-d-operations-groupe		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-operations-groupe", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-operations-groupe", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true}, {"name": "info__date-execution", "type": "date", "header": "Date exécution", "__ptType": "field", "sortable": true}, {"name": "info__duree", "type": "datetime", "header": "Durée ", "__ptType": "field", "sortable": true}, {"name": "info__facturable", "type": "bool", "header": "Facturable", "__ptType": "field", "sortable": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "header": "Groupe", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes"}, {"name": "info__groupe__info__nom", "type": "string", "vType": "string", "header": "Groupe", "__ptType": "field", "readOnly": true, "cpFromZoom": "info__groupe", "fieldLabel": "Groupe", "cpFromField": "info__nom"}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"name": "info__montant-facture", "type": "string", "header": "Montant facturé", "__ptType": "field", "sortable": true, "prpLength": 2}, {"fkId": "info__operateur_id", "name": "info__operateur", "type": "foreigntext", "header": "Opérateur", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-operateurs"}, {"name": "info__operateur__info__nom", "type": "string", "header": "Opérateur", "__ptType": "field", "readOnly": true, "cpFromZoom": "info__operateur", "fieldLabel": "Opérateur", "cpFromField": "info__nom"}, {"name": "info__planifiee", "type": "bool", "header": "Planifiée", "__ptType": "field", "sortable": true}, {"name": "info__statut", "type": "combo", "header": "Statut ", "choices": "prévu, préparé, en cours, terminé", "__ptType": "field", "sortable": true}, {"fkId": "info__type-operation_id", "name": "info__type-operation", "type": "foreigntext", "header": "Type opération", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-operation"}, {"name": "info__type-operation__info__nom", "type": "string", "header": "Type opération", "__ptType": "field", "readOnly": true, "cpFromZoom": "info__type-operation", "fieldLabel": "Type opération", "cpFromField": "info__nom"}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 769}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__groupe_id", "type": "foreignid", "header": "groupe_id", "hidden": true, "fkField": "info__groupe_id", "__ptType": "field", "readOnly": true}, {"name": "info__operateur_id", "type": "foreignid", "header": "operateur_id", "hidden": true, "fkField": "info__operateur_id", "__ptType": "field", "readOnly": true}, {"name": "info__type-operation_id", "type": "foreignid", "header": "type-operation_id", "hidden": true, "fkField": "info__type-operation_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-operations-groupe", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__statut", "__ptType": "formField"}, {"name": "info__operateur", "__ptType": "formField"}, {"name": "info__operateur__info__nom", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__groupe__info__nom", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom"}, {"name": "info__type-operation", "__ptType": "formField"}, {"name": "info__type-operation__info__nom", "xtype": "textfield", "__ptType": "formField", "readOnly": true, "fieldLabel": "Nom"}], "__ptType": "fieldset", "fsLayout": "2col"}, {"items": [{"name": "info__planifiee", "__ptType": "formField"}, {"name": "info__date-execution", "__ptType": "formField"}, {"name": "info__duree", "__ptType": "formField"}], "title": "Exécution", "__ptType": "fieldset"}, {"items": [{"name": "info__memo", "__ptType": "formField"}], "title": "Mémo", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "info__facturable", "__ptType": "formField"}, {"name": "info__montant-facture", "__ptType": "formField"}], "title": "Facture", "__ptType": "fieldset", "fsLayout": "2col"}], "title": "Module Opération Groupe", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=769"}], "sortFields": ["info__code", "info__date-execution", "info__duree", "info__statut", "info__memo", "info__operateur", "info__type-operation", "info__facturable", "info__montant-facture", "info__planifiee", "info__groupe", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__groupe__info__nom", "info__type-operation__info__nom", "info__operateur__info__nom", "info__statut"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Op. groupe", "updateTime": "2017-09-13 11:20:07", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-operations-groupe", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [], "protoEntityId": 769}	769	1	1	1	1	1
356	piafs-d-lignes-contrat	\N	\N	2017-09-11 19:11:54.413+00	2017-09-13 00:22:18.239+00	0ab3666a-c381-4979-bda3-f40bcfd30a59	piafs-d-lignes-contrat		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-lignes-contrat", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-lignes-contrat", "physicalName": "@myStr(\\"\\")"}, {"fkId": "info__clause_id", "name": "info__clause", "type": "foreigntext", "header": "Clause ", "__ptType": "field", "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-clauses"}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "header": "Groupe ", "__ptType": "field", "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes"}, {"name": "entity", "type": "foreigntext", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 772}, {"name": "id", "type": "autofield", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__clause_id", "type": "foreignid", "hidden": true, "fkField": "info__clause_id", "__ptType": "field", "readOnly": true}, {"name": "info__groupe_id", "type": "foreignid", "hidden": true, "fkField": "info__groupe_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "__ptType": "field", "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "__ptType": "field", "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-lignes-contrat", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__clause", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=772"}], "sortFields": ["info__clause", "info__groupe", "__str__"], "initialSort": [], "listDisplay": ["info__clause", "info__groupe"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Ligne contrat", "updateTime": "2017-09-12 20:22:18", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-lignes-contrat", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [], "protoEntityId": 772}	772	1	1	1	1	1
357	piafs-d-types-operations	\N	\N	2017-09-11 19:12:10.212+00	2017-09-12 23:38:21.276+00	e4caafd6-abf7-48bd-ad57-abd4d18ef389	piafs-d-types-operations		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-types-operations", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-types-operations", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__frequence", "type": "combo", "header": "Fréquence", "choices": "jour, semaine, mois, an, variable, création, fermeture", "__ptType": "field", "sortable": true}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"name": "info__nom", "type": "string", "header": "Nom", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__script", "type": "text", "header": "Script", "__ptType": "field", "sortable": true}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 773}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-types-operations", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__frequence", "__ptType": "formField"}, {"items": [{"items": [{"name": "info__script", "__ptType": "formField"}], "title": "Script", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "info__memo", "__ptType": "formField"}], "title": "Mémo", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "__ptType": "fieldset", "collapsible": true}], "title": "Fiche Type d'opération", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=773"}], "sortFields": ["info__code", "info__nom", "info__frequence", "info__script", "info__memo", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__nom", "info__frequence"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "T. opérations", "updateTime": "2017-09-12 19:38:21", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-types-operation", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Opérations groupe", "detailName": "operations-groupe", "detailField": "info__type-operation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-groupe"}, {"__ptType": "detailDef", "menuText": "Lignes planification", "detailName": "lignes-planification", "detailField": "info__type-operation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-lignes-planification"}, {"__ptType": "detailDef", "menuText": "Opérations famille", "detailName": "operations-famille", "detailField": "info__type-operation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-famille"}], "protoEntityId": 773}	773	1	1	1	1	1
358	piafs-d-lignes-planification	\N	\N	2017-09-11 19:12:27.463+00	2017-09-11 19:12:27.468+00	d731e315-2c66-4544-8e9d-ef5130b40071	piafs-d-lignes-planification		\N	{"fields": [{"name": "id", "type": "autofield", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "hidden": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "hidden": true, "readOnly": true, "prpDefault": 774}, {"name": "info", "type": "jsonfield", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "readOnly": true}, {"name": "info__type-operation_id", "type": "foreignid", "hidden": true, "fkField": "info__type-operation_id", "readOnly": true}, {"fkId": "info__type-operation_id", "name": "info__type-operation", "type": "foreigntext", "vType": "", "header": "Type opération ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-operation", "prpDefault": ""}, {"name": "info__groupe_id", "type": "foreignid", "hidden": true, "fkField": "info__groupe_id", "readOnly": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "vType": "", "header": "Groupe ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes", "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "prpLength": 0, "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-lignes-planification", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-lignes-planification", "physicalName": "@myStr(\\"\\")"}], "__ptType": "pcl", "viewCode": "prototype.ProtoTable.piafs-d-lignes-planification", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__type-operation", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "__ptType": "fieldset", "fsLayout": "2col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=774"}], "sortFields": ["info__type-operation", "info__groupe", "info__memo", "__str__"], "listDisplay": ["info__type-operation", "info__groupe", "info__memo"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-d-lignes-planification", "updateTime": "2017-09-11T15:12:27.444", "viewEntity": "prototype.ProtoTable", "description": "", "metaVersion": "13.0301", "protoEntity": "piafs-lignes-planification", "detailsConfig": [], "protoEntityId": 774}	774	1	1	1	1	1
359	piafs-d-installations	\N	\N	2017-09-11 19:12:43.411+00	2017-09-12 23:49:16.163+00	fabe10e3-12f2-4353-a7c4-11ff2c3c5909	piafs-d-installations		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-installations", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-installations", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__active", "type": "bool", "header": "Active", "__ptType": "field", "sortable": true}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__date-creation", "type": "date", "header": "Date création", "__ptType": "field", "sortable": true}, {"name": "info__date-fin-usage", "type": "date", "header": "Date fin usage", "__ptType": "field", "sortable": true}, {"name": "info__date-mise-en-service", "type": "date", "header": "Date mise en service", "__ptType": "field", "sortable": true}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 775}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-installations", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__date-creation", "__ptType": "formField"}, {"name": "info__date-mise-en-service", "__ptType": "formField"}, {"name": "info__date-fin-usage", "__ptType": "formField"}, {"name": "info__active", "__ptType": "formField"}, {"items": [{"name": "info__memo", "__ptType": "formField"}], "title": "Mémo", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Composantes installées", "viewCode": "prototype.ProtoTable.piafs-d-composantes-installees"}], "title": "Composantes installées", "__ptType": "fieldset", "collapsible": true}], "title": "Fiche installation", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=775"}], "sortFields": ["info__code", "info__date-creation", "info__date-mise-en-service", "info__date-fin-usage", "info__memo", "info__active", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__date-creation", "info__date-mise-en-service", "info__date-fin-usage", "info__memo", "info__active"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-d-installations", "updateTime": "2017-09-12 19:49:16", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-installations", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Composantes installées", "detailName": "composantes-installees", "detailField": "info__installation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-d-composantes-installees"}, {"__ptType": "detailDef", "menuText": "Familles", "detailName": "familles", "detailField": "info__installation_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-familles"}], "protoEntityId": 775}	775	1	1	1	1	1
360	piafs-d-composantes	\N	\N	2017-09-11 19:12:57.049+00	2017-09-13 00:44:50.479+00	92fdf1ce-3653-4196-a401-a82c011192c2	piafs-d-composantes	Composante logiciel	\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-composantes", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-composantes", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"name": "info__nom", "type": "string", "header": "Nom ", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__script", "type": "text", "header": "Script", "__ptType": "field", "sortable": true}, {"fkId": "info__type-composante_id", "name": "info__type-composante", "type": "foreigntext", "header": "Type composante", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-composante"}, {"name": "info__version", "type": "string", "header": "Version ", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 779}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__type-composante_id", "type": "foreignid", "header": "type-composante_id", "hidden": true, "fkField": "info__type-composante_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-composantes", "viewIcon": "icon-proto", "contextTo": [], "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__type-composante", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__version", "__ptType": "formField"}, {"items": [{"items": [{"name": "info__memo", "__ptType": "formField"}, {"__ptType": "fieldset"}], "title": "Mémo", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "info__script", "__ptType": "formField"}, {"__ptType": "fieldset"}], "title": "script", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "__ptType": "fieldset", "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Composantes installées", "viewCode": "prototype.ProtoTable.piafs-d-composantes-installees"}], "title": "Installlations utilisatrices", "__ptType": "fieldset", "collapsible": true}], "title": "Fiche composante", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=779"}], "sortFields": ["info__code", "info__nom", "info__version", "info__memo", "info__script", "info__type-composante", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__nom", "info__version", "info__type-composante"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Composantes", "updateTime": "2017-09-12 20:44:50", "viewEntity": "prototype.ProtoTable", "description": "Composante logiciel", "metaVersion": "13.0301", "protoEntity": "piafs-composantes", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Composantes installées", "detailName": "composantes-installees", "detailField": "info__composante_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-d-composantes-installees"}], "protoEntityId": 779}	779	1	1	1	1	1
362	piafs-d-types-composantes	\N	\N	2017-09-11 19:14:05.554+00	2017-09-12 23:33:50.82+00	0e51f73c-0369-43a5-8268-24d01966ef70	piafs-d-types-composantes		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-types-composantes", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-types-composantes", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"name": "info__nom", "type": "string", "header": "Nom", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 781}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-types-composantes", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"items": [{"__ptType": "smGrid", "menuText": "Composantes", "viewCode": "prototype.ProtoTable.piafs-ligne-composante"}], "title": "Composantes", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=781"}], "sortFields": ["info__code", "info__nom", "info__memo", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__nom", "info__memo"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "T. composantes", "updateTime": "2017-09-12 19:33:50", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-types-composante", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Composantes", "detailName": "composantes", "detailField": "info__type-composante_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-ligne-composante"}], "protoEntityId": 781}	781	1	1	1	1	1
363	piafs-d-composantes-installees	\N	\N	2017-09-12 21:34:02.942+00	2017-09-12 23:31:11.812+00	b007d891-5dee-47a2-a30a-e5dc2d91db84	piafs-d-composantes-installees		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-composantes-installees", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-composantes-installees", "physicalName": "@myStr(\\"\\")"}, {"fkId": "info__composante_id", "name": "info__composante", "type": "foreigntext", "header": "Composante ", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-composantes"}, {"fkId": "info__installation_id", "name": "info__installation", "type": "foreigntext", "header": "Installation ", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-installations"}, {"name": "info__memo", "type": "text", "header": "Mémo", "__ptType": "field", "sortable": true}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 780}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__composante_id", "type": "foreignid", "header": "composante_id", "hidden": true, "fkField": "info__composante_id", "__ptType": "field", "readOnly": true}, {"name": "info__installation_id", "type": "foreignid", "header": "installation_id", "hidden": true, "fkField": "info__installation_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-composantes-installees", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__installation", "__ptType": "formField"}, {"name": "info__composante", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "title": "Composante installée", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=780"}], "sortFields": ["info__installation", "info__composante", "info__memo", "__str__"], "initialSort": [], "listDisplay": ["info__installation", "info__composante", "info__memo"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Composantes installées", "updateTime": "2017-09-12 19:31:11", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-composantes-installees", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [], "protoEntityId": 780}	780	1	1	1	1	1
364	piafs-ligne-composante	\N	\N	2017-09-12 21:48:18.506+00	2017-09-12 22:12:41.733+00	ad520f75-abec-4ed3-815e-f57d8e7ab950	piafs-ligne-composante	Composante logiciel	\N	{"fields": [{"name": "id", "type": "autofield", "header": "id", "hidden": true, "readOnly": true}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "readOnly": true, "prpDefault": 779}, {"name": "info", "type": "string", "header": "info", "hidden": true, "readOnly": true, "searchable": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "cellLink": true, "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "cellLink": true, "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "readOnly": true}, {"name": "info__code", "type": "string", "vType": "", "header": "Code", "choices": "", "primary": true, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": true, "sortable": true, "prpLength": 25, "prpDefault": ""}, {"name": "info__nom", "type": "string", "vType": "", "header": "Nom ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "sortable": true, "prpLength": 50, "prpDefault": ""}, {"name": "info__version", "type": "string", "vType": "", "header": "Version ", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "sortable": true, "prpLength": 50, "prpDefault": ""}, {"name": "info__memo", "type": "text", "vType": "", "header": "Mémo", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "sortable": true, "prpLength": 0, "prpDefault": ""}, {"name": "info__script", "type": "text", "vType": "", "header": "Script", "choices": "", "primary": false, "tooltip": "", "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "sortable": true, "prpLength": 0, "prpDefault": ""}, {"name": "info__type-composante_id", "type": "foreignid", "header": "type-composante_id", "hidden": true, "fkField": "info__type-composante_id", "readOnly": true}, {"fkId": "info__type-composante_id", "name": "info__type-composante", "type": "foreigntext", "vType": "", "header": "Type composante", "choices": "", "primary": false, "tooltip": "", "cellLink": true, "crudType": "", "prpScale": 0, "readOnly": false, "required": false, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-types-composante", "prpDefault": ""}, {"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-ligne-composante", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-ligne-composante", "physicalName": "@myStr(\\"info__code\\")"}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-ligne-composante", "viewIcon": "icon-proto", "contextTo": [], "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__type-composante", "__ptType": "formField"}, {"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__version", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}, {"name": "info__script", "__ptType": "formField"}], "title": "Vue composante", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"baseFilter": [{"property": "entity", "filterStmt": "=779"}], "sortFields": ["info__code", "info__nom", "info__version", "info__memo", "info__script", "info__type-composante", "__str__"], "initialSort": [], "listDisplay": ["info__nom", "info__version", "info__code", "info__type-composante"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "piafs-ligne-composante", "updateTime": "2017-09-12 18:12:41", "viewEntity": "prototype.ProtoTable", "description": "Composante logiciel", "metaVersion": "13.0301", "protoEntity": "piafs-composantes", "sheetConfig": [], "businessRules": {}, "detailsConfig": [{"menuText": "Composantes installées", "detailName": "composantes-installees", "detailField": "info__composante_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-composantes-installees"}], "protoEntityId": 779}	779	1	1	1	1	1
365	piafs-ligne-famille	\N	\N	2017-09-12 23:50:54.865+00	2017-09-12 23:59:11.657+00	ad5a3859-c094-4fb7-967c-6b680a8479ce	piafs-ligne-famille	compte de famille	\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-ligne-famille", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-ligne-famille", "physicalName": "@myStr(\\"info__code\\",\\"info__code-bd\\")"}, {"name": "info__active", "type": "bool", "header": "Active", "tooltip": "Vrai si en activité", "__ptType": "field", "sortable": true}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__code-bd", "type": "string", "header": "Code BD", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__courriel", "type": "string", "header": "Courriel", "tooltip": "Normalement celui de l'administrtaeur", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__date-arret-instance", "type": "date", "header": "Date arrêt instance", "__ptType": "field", "sortable": true}, {"name": "info__date-fermeture", "type": "date", "header": "Date fermeture", "__ptType": "field", "sortable": true}, {"name": "info__date-installation", "type": "date", "header": "Date installation", "__ptType": "field", "sortable": true}, {"name": "info__date-mise-en-service", "type": "date", "header": "Date mise en service", "__ptType": "field", "sortable": true}, {"name": "info__date-ouverture", "type": "date", "header": "Date ouverture", "__ptType": "field", "sortable": true}, {"name": "info__en-activite", "type": "bool", "header": "En activité", "__ptType": "field", "sortable": true}, {"name": "info__facturable", "type": "bool", "header": "Facturable", "__ptType": "field", "sortable": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "header": "Groupe", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes"}, {"fkId": "info__installation_id", "name": "info__installation", "type": "foreigntext", "header": "Installation ", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-installations"}, {"name": "info__memo", "type": "text", "header": "Mémo ", "__ptType": "field", "sortable": true}, {"name": "info__mot-passe", "type": "string", "header": "Mot passe ", "tooltip": "Celui de l'administrateur, en fait celui du compte", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__nom", "type": "string", "header": "Nom", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__nom-administrateur", "type": "string", "header": "Nom administrateur", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 760}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__groupe_id", "type": "foreignid", "header": "groupe_id", "hidden": true, "fkField": "info__groupe_id", "__ptType": "field", "readOnly": true}, {"name": "info__installation_id", "type": "foreignid", "header": "installation_id", "hidden": true, "fkField": "info__installation_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "custom", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-ligne-famille", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__en-activite", "__ptType": "formField"}, {"name": "info__date-ouverture", "__ptType": "formField"}, {"name": "info__date-fermeture", "__ptType": "formField"}, {"items": [{"name": "info__nom-administrateur", "__ptType": "formField"}, {"name": "info__courriel", "__ptType": "formField"}, {"name": "info__mot-passe", "__ptType": "formField"}], "title": "Administrateur", "__ptType": "fieldset"}, {"items": [{"name": "info__installation", "__ptType": "formField"}, {"name": "info__active", "__ptType": "formField"}, {"name": "info__date-installation", "__ptType": "formField"}, {"name": "info__date-arret-instance", "__ptType": "formField"}, {"name": "info__date-mise-en-service", "__ptType": "formField"}, {"name": "info__code-bd", "__ptType": "formField"}], "title": "Installation", "__ptType": "fieldset"}, {"name": "info__facturable", "__ptType": "formField"}, {"name": "info__memo", "__ptType": "formField"}], "title": "Vue famille", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=760"}], "sortFields": ["info__code", "info__groupe", "info__courriel", "info__date-installation", "info__nom-administrateur", "info__mot-passe", "info__code-bd", "info__facturable", "info__date-ouverture", "info__date-fermeture", "info__en-activite", "info__nom", "info__memo", "info__date-mise-en-service", "info__date-arret-instance", "info__active", "info__installation", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__nom", "info__groupe", "info__active", "info__date-installation", "info__code-bd"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Famille", "updateTime": "2017-09-12 19:59:11", "viewEntity": "prototype.ProtoTable", "description": "compte de famille", "metaVersion": "13.0301", "protoEntity": "piafs-familles", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Opérations famille", "detailName": "operations-famille", "detailField": "info__famille_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-famille"}, {"__ptType": "detailDef", "menuText": "Factures famille", "detailName": "factures-famille", "detailField": "info__famille_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-factures-famille"}], "protoEntityId": 760}	760	1	1	1	1	1
366	piafs-d-familles	\N	\N	2017-09-13 00:15:44.244+00	2017-09-13 00:56:56.924+00	93eb4216-d4f1-4ac5-8e43-cd05e89ae7e5	piafs-d-familles	compte de famille	\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-familles", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-familles", "physicalName": "@myStr(\\"info__code\\",\\"info__code-bd\\")"}, {"name": "info__active", "type": "bool", "header": "Active", "tooltip": "Vrai si en activité", "__ptType": "field", "sortable": true}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__code-bd", "type": "string", "header": "Code BD", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__courriel", "type": "string", "header": "Courriel", "tooltip": "Normalement celui de l'administrtaeur", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__date-arret-instance", "type": "date", "header": "Date arrêt instance", "__ptType": "field", "sortable": true}, {"name": "info__date-fermeture", "type": "date", "header": "Date fermeture", "__ptType": "field", "sortable": true}, {"name": "info__date-installation", "type": "date", "header": "Date installation", "__ptType": "field", "sortable": true}, {"name": "info__date-mise-en-service", "type": "date", "header": "Date mise en service", "__ptType": "field", "sortable": true}, {"name": "info__date-ouverture", "type": "date", "header": "Date ouverture", "__ptType": "field", "sortable": true}, {"name": "info__en-activite", "type": "bool", "header": "En activité", "__ptType": "field", "sortable": true}, {"name": "info__facturable", "type": "bool", "header": "Facturable", "__ptType": "field", "sortable": true}, {"fkId": "info__groupe_id", "name": "info__groupe", "type": "foreigntext", "header": "Groupe", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-groupes"}, {"fkId": "info__installation_id", "name": "info__installation", "type": "foreigntext", "header": "Installation ", "__ptType": "field", "cellLink": true, "sortable": true, "prpLength": 25, "zoomModel": "prototype.ProtoTable.piafs-installations"}, {"name": "info__memo", "type": "text", "header": "Mémo ", "__ptType": "field", "sortable": true}, {"name": "info__mot-passe", "type": "string", "header": "Mot passe ", "tooltip": "Celui de l'administrateur, en fait celui du compte", "__ptType": "field", "sortable": true, "prpLength": 25}, {"name": "info__nom", "type": "string", "header": "Nom", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__nom-administrateur", "type": "string", "header": "Nom administrateur", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 760}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "info__groupe_id", "type": "foreignid", "header": "groupe_id", "hidden": true, "fkField": "info__groupe_id", "__ptType": "field", "readOnly": true}, {"name": "info__installation_id", "type": "foreignid", "header": "installation_id", "hidden": true, "fkField": "info__installation_id", "__ptType": "field", "readOnly": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-familles", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__groupe", "__ptType": "formField"}, {"name": "info__date-ouverture", "__ptType": "formField"}, {"name": "info__en-activite", "__ptType": "formField"}, {"items": [{"name": "info__nom", "__ptType": "formField"}, {"name": "info__nom-administrateur", "__ptType": "formField"}, {"name": "info__mot-passe", "__ptType": "formField"}, {"name": "info__courriel", "__ptType": "formField"}, {"name": "info__date-fermeture", "__ptType": "formField"}], "title": "Administrateur", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "info__code-bd", "__ptType": "formField"}, {"name": "info__date-mise-en-service", "__ptType": "formField"}, {"name": "info__date-installation", "__ptType": "formField"}, {"name": "info__facturable", "__ptType": "formField"}, {"name": "info__installation", "__ptType": "formField"}, {"name": "info__active", "__ptType": "formField"}, {"name": "info__date-arret-instance", "__ptType": "formField"}], "title": "Installation", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"name": "info__memo", "__ptType": "formField"}], "title": "Mémo", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Opérations famille", "viewCode": "prototype.ProtoTable.piafs-operations-famille"}], "title": "Opérations", "__ptType": "fieldset", "collapsed": true, "collapsible": true}, {"items": [{"__ptType": "smGrid", "menuText": "Factures famille", "viewCode": "prototype.ProtoTable.piafs-factures-famille"}], "title": "Factures", "__ptType": "fieldset", "collapsed": true, "collapsible": true}], "title": "Module Famille", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=760"}], "sortFields": ["info__code", "info__groupe", "info__courriel", "info__date-installation", "info__nom-administrateur", "info__mot-passe", "info__code-bd", "info__facturable", "info__date-ouverture", "info__date-fermeture", "info__en-activite", "info__nom", "info__memo", "info__date-mise-en-service", "info__date-arret-instance", "info__active", "info__installation", "__str__"], "initialSort": [], "listDisplay": ["info__nom", "info__code", "info__groupe", "info__nom-administrateur", "info__facturable", "info__en-activite"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "M. familles", "updateTime": "2017-09-12 20:56:56", "viewEntity": "prototype.ProtoTable", "description": "compte de famille", "metaVersion": "13.0301", "protoEntity": "piafs-familles", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Opérations famille", "detailName": "operations-famille", "detailField": "info__famille_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-operations-famille"}, {"__ptType": "detailDef", "menuText": "Factures famille", "detailName": "factures-famille", "detailField": "info__famille_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-factures-famille"}], "protoEntityId": 760}	760	1	1	1	1	1
367	piafs-d-clauses	\N	\N	2017-09-13 00:19:24.551+00	2017-09-13 00:21:24.733+00	b0381d37-b5ab-453c-8ea3-fa1c9d7998bc	piafs-d-clauses		\N	{"fields": [{"fkId": "id", "flex": 1, "name": "__str__", "type": "string", "header": "piafs-d-clauses", "__ptType": "field", "cellLink": true, "readOnly": true, "sortable": true, "zoomModel": "prototype.ProtoTable.piafs-d-clauses", "physicalName": "@myStr(\\"info__code\\")"}, {"name": "info__code", "type": "string", "header": "Code", "primary": true, "__ptType": "field", "required": true, "sortable": true, "prpLength": 25}, {"name": "info__decription", "type": "text", "header": "Decription", "__ptType": "field", "sortable": true}, {"name": "info__nom", "type": "string", "header": "Nom ", "__ptType": "field", "sortable": true, "prpLength": 50}, {"name": "info__prix", "type": "string", "header": "Prix", "__ptType": "field", "sortable": true, "prpLength": 2}, {"name": "entity", "type": "foreigntext", "header": "entity", "hidden": true, "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "entity_id", "type": "foreignid", "header": "entity_id", "hidden": true, "__ptType": "field", "readOnly": true, "prpDefault": 771}, {"name": "id", "type": "autofield", "header": "id", "hidden": true, "__ptType": "field", "readOnly": true}, {"name": "info", "type": "string", "header": "info", "hidden": true, "__ptType": "field", "readOnly": true, "searchable": true}, {"name": "smCreatedOn", "type": "datetime", "header": "smCreatedOn", "__ptType": "field", "readOnly": true}, {"name": "smOwningTeam", "type": "foreigntext", "header": "smOwningTeam", "__ptType": "field", "cellLink": true, "readOnly": true}, {"name": "smOwningUser", "type": "foreigntext", "header": "smOwningUser", "__ptType": "field", "cellLink": true, "readOnly": true}], "actions": [], "__ptType": "pcl", "gridSets": {"__ptType": "gridSets", "filtersSet": [], "sortersSet": [], "listDisplaySet": []}, "viewCode": "prototype.ProtoTable.piafs-d-clauses", "viewIcon": "icon-proto", "jsonField": "info", "localSort": true, "formConfig": {"items": [{"items": [{"name": "info__code", "__ptType": "formField"}, {"name": "info__nom", "__ptType": "formField"}, {"name": "info__prix", "__ptType": "formField"}, {"name": "info__decription", "__ptType": "formField"}], "title": "Clauses contractuelles", "__ptType": "fieldset", "fsLayout": "1col"}], "__ptType": "formConfig"}, "gridConfig": {"__ptType": "gridConfig", "baseFilter": [{"__ptType": "filterDef", "property": "entity", "filterStmt": "=771"}], "sortFields": ["info__code", "info__nom", "info__prix", "info__decription", "__str__"], "initialSort": [], "listDisplay": ["info__code", "info__nom", "info__prix", "info__decription"], "hiddenFields": ["id", "info", "entity_id"], "searchFields": ["info"], "initialFilter": [], "readOnlyFields": []}, "idProperty": "id", "shortTitle": "Clauses", "updateTime": "2017-09-12 20:21:24", "viewEntity": "prototype.ProtoTable", "metaVersion": "13.0301", "protoEntity": "piafs-clauses", "sheetConfig": [], "usrDefProps": {"__ptType": "usrDefProps"}, "businessRules": {"__ptType": "businessRules"}, "detailsConfig": [{"__ptType": "detailDef", "menuText": "Lignes contrat", "detailName": "lignes-contrat", "detailField": "info__clause_id", "masterField": "pk", "conceptDetail": "prototype.ProtoTable.piafs-lignes-contrat"}], "protoEntityId": 771}	771	1	1	1	1	1
\.


--
-- Name: prototype_prototype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_prototype_id_seq', 367, true);


--
-- Data for Name: prototype_protoversiontitle; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_protoversiontitle (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", "versionCode", description, active, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "versionBase_id") FROM stdin;
1	0	\N	\N	2016-02-18 14:42:41.031+00	2016-02-18 14:42:41.031+00	08f37b35-1009-4d73-8003-44b24666086d	0		f	1	1	1	1	\N
\.


--
-- Name: prototype_protoversiontitle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('prototype_protoversiontitle_id_seq', 1, true);


--
-- Data for Name: prototype_relationship; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY prototype_relationship (property_ptr_id, "relatedName", "baseMin", "baseMax", "refMin", "refMax", "onRefDelete", "typeRelation", "refEntity_id") FROM stdin;
4635								762
4662								765
4670								762
4677								765
4693								773
4715								771
4716								762
4718								773
4719								762
4728								775
4729								779
4730								762
4743								773
4759								781
4761								760
4762								760
4763								775
\.


--
-- Data for Name: rai01ref_artefact; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_artefact (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", code, description, info, "copyFrom_id", "docType_id", "refArtefact_id", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", capacity_id, requirement_id) FROM stdin;
43	er0301-fournir	\N	\N	2016-11-01 21:29:43.396+00	2016-11-01 21:29:43.396+00	072e95f1-922e-4b7c-a29c-59cae09fb013	ER0301	Fournir ....	{}	\N	78	\N	1	1	1	1	\N	\N
44	cl0404-mettre-a-jour	\N	\N	2016-11-01 21:30:08.375+00	2016-11-01 21:30:08.375+00	1c2408e0-e7c9-459a-bf60-c6c5beca72fa	CL0404	Mettre à jour	{}	\N	78	\N	1	1	1	1	\N	\N
45	pl0101-traiter-une-plainte	\N	\N	2016-11-01 21:30:34.347+00	2016-11-01 21:30:34.347+00	6ffe3f82-b18e-4b9f-8fa9-fbdeee21a088	PL0101	Traiter une plainte	{}	\N	78	\N	1	1	1	1	\N	\N
46	pr103-estimer-une-rente	\N	\N	2016-11-01 21:30:54.46+00	2016-11-01 21:30:54.46+00	938adfa4-9160-46fd-88db-d5648a227ee5	PR103	Estimer une rente	{}	\N	78	\N	1	1	1	1	\N	\N
47	cl0206-fournir-une-ref	\N	\N	2016-11-01 21:31:25.048+00	2016-11-01 21:31:25.048+00	1c8fdb74-a868-4a24-9f84-606b43c0fafb	CL0206	Fournir une ref....	{}	\N	78	\N	1	1	1	1	\N	\N
48	cl0201-fournir-une-information-telephonique	\N	\N	2016-11-01 21:34:25.143+00	2016-11-03 03:01:47.912+00	a791d0db-2c63-4539-94ff-f05c5dbceb21	CL0201	Fournir une information téléphonique	{"etat": "final", "volume": "voir page 1", "intrant": "", "version": "4.o", "frequence": "", "redacteur": "xx", "responsable": "", "type-extrant": "Réponse verbale et  documentation transmise au client", "date-revision": "2010-03-12", "critere-dentree": "", "caracteristiques": "pages 2 et 3", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "copie de la page 1", "evenement-declencheur": "Toute demande d'information par téléphone"}	\N	73	\N	1	1	1	1	54	\N
49	cl020101-recevoir-une-demande	\N	\N	2016-11-03 02:39:31.564+00	2016-11-03 02:39:31.564+00	68c9629f-9cef-450f-912b-69e3c39c451c	CL020101	Recevoir une demande	{"intrant": "", "frequence": "Au besoin", "responsable": "", "nom-procedure": "", "code-procedure": "", "critere-dentree": "La réception d'une demande téléphonoqiue", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": ""}	\N	74	\N	1	1	1	1	\N	\N
50	cl020102-traiter-une-demande-simple	\N	\N	2016-11-03 03:10:19.725+00	2016-11-03 03:10:19.725+00	18e5b3ad-d1af-44ac-9f34-0c9861b7c9ec	CL020102	Traiter une demande simple	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	74	\N	1	1	1	1	\N	\N
51	cl020103-traiter-une-demande-complexe	\N	\N	2016-11-03 03:11:26.583+00	2016-11-03 03:11:26.583+00	3ee8f554-a550-40ff-a419-8977f8b8d4cd	CL020103	Traiter une demande complexe	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	74	\N	1	1	1	1	\N	\N
52	cl020104-effectuer-une-analyse-specialiste	\N	\N	2016-11-03 03:15:54.245+00	2016-11-03 03:15:54.245+00	de52c332-7275-419b-8d06-553702ae3ed8	CL020104	Effectuer une analyse spécialiste	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	74	\N	1	1	1	1	\N	\N
53	gouvernance-gouvernance	\N	\N	2016-11-03 13:12:05.977+00	2016-11-03 13:18:12.27+00	854b2eb0-ca63-47b7-ae91-f6394783a10c	Gouvernance	Gouvernance	{}	\N	79	56	1	1	1	1	\N	\N
54	direction-de-la-regie-direction-de-la-regie	\N	\N	2016-11-03 13:14:20.073+00	2016-11-10 14:33:07.297+00	ffde4e2f-67b2-4b51-8847-53d5beeaba2c	Direction de la régie	Direction de la régie	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	53	1	1	1	1	\N	\N
55	planification-de-lorganisation-planification-de-lorganisation	\N	\N	2016-11-03 13:16:58.716+00	2016-11-10 14:33:23.72+00	a84a6ef8-7ba8-4186-8804-67387609f98f	Planification de l'organisation	Planification de l'organisation	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	53	1	1	1	1	\N	\N
56	regie-des-rentes-regie-des-rentes	\N	\N	2016-11-03 13:17:34.292+00	2016-11-10 14:35:43.855+00	731a0ccc-27d2-447f-87dd-9afe1f2d3898	Régie des Rentes	Régie des Rentes	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	\N	1	1	1	1	\N	\N
57	gestion-des-activites-gestion-des-activites	\N	\N	2016-11-03 18:33:21.052+00	2016-11-10 14:37:02.904+00	5cb15803-fee5-40c6-b8a5-f2ef8eb5e7c3	Gestion des Activités	Gestion des Activités	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	56	1	1	1	1	\N	\N
58	planification-des-activites-planification-des-activites	\N	\N	2016-11-03 18:37:19.243+00	2016-11-10 14:43:45.617+00	88714910-69b8-419b-b3c4-0c28579d78e8	Planification des activités	Planification des activités	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	57	1	1	1	1	\N	\N
59	assignation-des-ressources-assignation-des-ressources	\N	\N	2016-11-03 18:38:10.617+00	2016-11-10 14:50:23.151+00	01ce2b86-5fbb-4fb0-b751-23ff11806604	Assignation des ressources	Assignation des ressources	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	57	1	1	1	1	\N	\N
60	suivi-des-activites-suivi-des-activites	\N	\N	2016-11-03 18:38:51.343+00	2016-11-10 14:50:38.024+00	38cae047-927b-4b7e-9b62-a2fe4d0bedcb	Suivi des activités	Suivi des activités	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	57	1	1	1	1	\N	\N
61	gestion-des-exceptions-gestion-des-exceptions	\N	\N	2016-11-03 18:39:47.435+00	2016-11-10 14:51:00.093+00	982e262b-f7cb-4310-9f5e-fdd38f2e223d	Gestion des exceptions	Gestion des exceptions	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	57	1	1	1	1	\N	\N
62	normes-normes	\N	\N	2016-11-03 19:12:29.829+00	2016-11-03 19:13:47.518+00	41a7fb75-36e2-40da-a643-64acce0474bf	Normes	Normes	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	63	1	1	1	1	\N	\N
63	qualitesservices-qualites-des-services	\N	\N	2016-11-03 19:13:28.905+00	2016-11-03 19:13:30.251+00	deddd3c9-a662-4e8d-92ac-444f9f5391dd	QualitésServices	Qualités des Services	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	57	1	1	1	1	\N	\N
64	assurancequalite-assurance-qualite	\N	\N	2016-11-03 19:14:29.711+00	2016-11-03 19:14:30.626+00	819f5d9e-5274-4324-8573-8b740f47f493	AssuranceQualité	Assurance Qualité	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	63	1	1	1	1	\N	\N
65	servicesorganisation-services-a-lorganisation	\N	\N	2016-11-03 19:21:19.508+00	2016-11-03 19:21:20.377+00	7133972f-1477-4ec4-bf1d-3ad1c84af594	ServicesOrganisation	Services à l'organisation	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	56	1	1	1	1	\N	\N
66	evolutionprogrammes-evolution-des-programmes	\N	\N	2016-11-03 19:22:14.608+00	2016-11-03 19:22:14.608+00	2dbd9a02-c40e-494a-aacc-2b95f0db3834	EvolutionProgrammes	Evolution des Programmes	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	56	1	1	1	1	\N	\N
67	offreservice-offre-de-service	\N	\N	2016-11-03 19:24:39.086+00	2016-11-03 19:40:43.988+00	f99b34c5-56ce-44d7-b533-99d015f091a2	OffreService	Offre de service	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	56	1	1	1	1	\N	\N
68	communicationgrandpublic-communication-grand-public	\N	\N	2016-11-03 19:40:22.703+00	2016-11-03 19:40:23.539+00	36c60e71-f16a-43c2-a89c-384a3b24aa27	CommunicationGrandPublic	Communication Grand Public	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	56	1	1	1	1	\N	\N
69	servicesclientele-services-a-la-clientele	\N	\N	2016-11-03 19:41:36.696+00	2016-11-03 19:41:38.252+00	66c123a8-8e18-43d8-ac39-7c2318d0d983	ServicesClientèle	Services à la clientèle	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	56	1	1	1	1	\N	\N
70	identificationclientele-identification-de-la-clientele	\N	\N	2016-11-03 19:42:40.917+00	2016-11-03 19:42:41.704+00	42727d08-9e1c-49f4-a15b-73f1358d1e46	IdentificationClientèle	Identification de la clientèle	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	69	1	1	1	1	\N	\N
71	communicationsclients-communications-clients	\N	\N	2016-11-03 19:43:15.252+00	2016-11-03 19:43:15.995+00	fd53a42d-8070-4a50-b196-4f5f11b05c23	CommunicationsClients	Communications clients	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	69	1	1	1	1	\N	\N
72	regimerentes-regime-de-rentes	\N	\N	2016-11-03 19:43:54.481+00	2016-11-03 19:43:55.301+00	5044e633-90c9-4ff5-86f0-1981dbf9fccd	RégimeRentes	Régime de rentes	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	69	1	1	1	1	\N	\N
73	recoursclient-recours-client	\N	\N	2016-11-03 19:44:23.826+00	2016-11-03 19:44:26.165+00	f8b58107-6771-49d9-a5a2-20d0b349924f	RecoursClient	Recours client	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	69	1	1	1	1	\N	\N
74	registrecotisants-registre-des-cotisants	\N	\N	2016-11-03 19:45:37.3+00	2016-11-03 19:45:38.32+00	eaa292d7-8eb5-4eec-86ac-4cbad9972a16	RegistreCotisants	Registre des cotisants	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	72	1	1	1	1	\N	\N
75	prestations-prestations	\N	\N	2016-11-03 19:46:01.57+00	2016-11-03 19:46:02.508+00	199ac9bd-edce-4d6e-9a8e-7e35adf4d1d5	Prestations	Prestations	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	72	1	1	1	1	\N	\N
76	ententesinternationales-ententes-internationales	\N	\N	2016-11-03 19:46:39.163+00	2016-11-03 19:46:40.17+00	abb5be96-c35e-4dad-a638-07ee882a82b9	EntentesInternationales	Ententes internationales	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	72	1	1	1	1	\N	\N
77	soutienenfants-soutien-aux-enfants	\N	\N	2016-11-03 19:47:16.292+00	2016-11-03 19:47:17.151+00	58453a81-a48b-4fad-bc6e-42aeddea12a9	SoutienEnfants	Soutien aux enfants	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	72	1	1	1	1	\N	\N
78	rcr_rver-rcr-et-rver	\N	\N	2016-11-03 19:47:48.303+00	2016-11-03 19:47:49.044+00	5e85963b-18b4-4cf0-8704-a7bb88ce8d3d	RCR_RVER	RCR et RVER	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	72	1	1	1	1	\N	\N
79	gestionpartenariats-gestion-des-partenariats	\N	\N	2016-11-03 19:59:46.988+00	2016-11-03 19:59:46.988+00	5d76c053-56c0-485d-8876-59f71c287e98	GestionPartenariats	Gestion des partenariats	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	56	1	1	1	1	\N	\N
80	evolutionechanges-evolution-des-echanges	\N	\N	2016-11-03 20:01:06.697+00	2016-11-03 20:01:07.668+00	28c72b4f-56a2-427c-aaa3-a6086e5b1550	ÉvolutionÉchanges	Évolution des échanges	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	79	1	1	1	1	\N	\N
81	suiviechanges-suivi-des-echanges	\N	\N	2016-11-03 20:01:40.569+00	2016-11-03 20:01:41.304+00	f004e353-fad4-451b-bb51-a7f3fc9ededd	SuiviÉchanges	Suivi des échanges	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	79	1	1	1	1	\N	\N
82	connaissanceclientele-connaissance-et-comprehension-de-la-clientele	\N	\N	2016-11-03 20:02:58.637+00	2016-11-03 20:02:59.505+00	5997f188-66b4-40c9-b4e2-7c8055d78102	ConnaissanceClientèle	Connaissance et compréhension de la clientèle	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	67	1	1	1	1	\N	\N
83	evolutionclientele-evolution-des-services-a-la-clientele	\N	\N	2016-11-03 20:03:48.942+00	2016-11-03 20:07:08.554+00	7eeb7fb6-c54b-4ca3-b1d5-eeed6ea9c655	ÉvolutionClientèle	Évolution des services à la clientèle	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	79	67	1	1	1	1	\N	\N
84	evolutiondeclaration-evolution-de-la-declaration-service-aux-citoyens	\N	\N	2016-11-03 20:04:36.358+00	2017-11-14 19:45:33.44+00	ab060340-20f7-4b63-b21c-94fd69b5b9a5	ÉvolutionDéclaration	Évolution de la déclaration service aux citoyens	{}	\N	79	67	1	1	1	1	\N	\N
85	test-test-l	\N	\N	2016-11-10 15:02:46.331+00	2016-11-10 15:02:46.331+00	808e592a-8d41-4240-8960-64f7fe2e1702	test	test l	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	73	\N	1	1	1	1	\N	\N
86	autr-test-autr-test	\N	\N	2016-11-10 15:36:31.199+00	2016-11-10 15:36:31.199+00	f6cfe666-f012-4bac-a2c6-5990074cfe50	autr test	autr test	{"etat": "", "volume": "", "intrant": "", "version": "", "frequence": "", "redacteur": "", "responsable": "", "type-extrant": "", "date-revision": null, "critere-dentree": "", "caracteristiques": "", "criteres-de-sortie": "", "mode-de-traitement": "", "description-sommaire": "", "evenement-declencheur": ""}	\N	73	\N	1	1	1	1	\N	\N
\.


--
-- Name: rai01ref_artefact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_artefact_id_seq', 86, true);


--
-- Data for Name: rai01ref_artefactcapacity; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_artefactcapacity (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", notes, description, artefact_id, capacity_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "isMain") FROM stdin;
1	directiondelaregie-direction-de-la-regie-ca-ca	\N	\N	2016-11-03 15:41:29.196+00	2016-11-03 15:41:29.196+00	8b31a795-9c8f-4726-ac20-def374b4e682			54	62	1	1	1	1	f
2	directiondelaregie-direction-de-la-regie-codir-codir	\N	\N	2016-11-03 15:42:25.837+00	2016-11-03 15:42:25.837+00	3932436b-b00c-47e6-aa08-8e21667f5fe2			54	63	1	1	1	1	f
\.


--
-- Name: rai01ref_artefactcapacity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_artefactcapacity_id_seq', 2, true);


--
-- Data for Name: rai01ref_artefactcomposition; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_artefactcomposition (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", condition, notes, description, "containerArt_id", "inputArt_id", "outputArt_id", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: rai01ref_artefactcomposition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_artefactcomposition_id_seq', 1, false);


--
-- Data for Name: rai01ref_artefactrequirement; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_artefactrequirement (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", notes, description, artefact_id, requirement_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", "isMain") FROM stdin;
\.


--
-- Name: rai01ref_artefactrequirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_artefactrequirement_id_seq', 1, false);


--
-- Data for Name: rai01ref_artefactsource; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_artefactsource (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", notes, description, artefact_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id", source_id) FROM stdin;
\.


--
-- Name: rai01ref_artefactsource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_artefactsource_id_seq', 1, false);


--
-- Data for Name: rai01ref_capacity; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_capacity (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", code, description, info, "copyFrom_id", "docType_id", "refCapacity_id", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
54	contacts_clients-contacts-client	\N	\N	2016-11-03 00:23:04.968+00	2016-11-03 21:37:42.488+00	3e305372-35d9-47d0-996a-dc7faffaa088	contacts_clients	contacts client	{}	\N	75	55	1	1	1	1
55	direction_des_operations-direction-des-operations	\N	\N	2016-11-03 00:23:28.035+00	2016-11-03 21:37:56.264+00	ba561529-86f5-4402-bddd-e69ddce7e579	Direction_des_opérations	Direction des opérations	{}	\N	75	\N	1	1	1	1
61	rrq-regime-des-rentes-quebec	\N	\N	2016-11-03 15:01:12.777+00	2016-11-03 15:01:12.777+00	44574b20-3a20-4d83-8c76-8ba05498facd	RRQ	Régime des Rentes Québec	{}	\N	80	\N	1	1	1	1
62	ca-conseil-administration	\N	\N	2016-11-03 15:01:36.651+00	2016-11-03 17:47:28.659+00	23b231d6-48fd-412d-9544-86bbb607b3b4	CA	Conseil Administration	{}	\N	80	61	1	1	1	1
63	codir-comite-de-direction	\N	\N	2016-11-03 15:02:06.237+00	2016-11-03 17:47:46.982+00	65b08e5e-883e-4aea-9b0d-514b56ba50ad	CODIR	Comité de direction	{}	\N	80	61	1	1	1	1
64	sg-secretariat-general	\N	\N	2016-11-03 15:06:44.075+00	2016-11-03 17:48:31.618+00	f1f28f24-c61f-48b9-9879-f0871d5bf393	SG	Secrétariat Général	{}	\N	80	61	1	1	1	1
65	daj-daj	\N	\N	2016-11-03 15:15:27.882+00	2016-11-03 15:15:27.882+00	00da9812-dbea-4821-ba1c-a3933e6116f7	DAJ	DAJ	{}	\N	80	61	1	1	1	1
66	dpl-direction-planification	\N	\N	2016-11-03 18:24:18.213+00	2016-11-03 18:24:18.213+00	34dd067d-e36d-4732-99c0-e8d1a797b2ba	DPL	Direction Planification	{}	\N	80	61	1	1	1	1
67	cgpp-comite-gestion-de-portefeuille	\N	\N	2016-11-03 18:24:58.175+00	2016-11-03 18:24:58.175+00	4e66d44a-d385-4cdf-90d2-0ab1cb8babf8	CGPP	Comité Gestion de portefeuille	{}	\N	80	61	1	1	1	1
68	dp-direction-de-la-planification	\N	\N	2016-11-03 18:25:21.761+00	2016-11-03 18:25:21.761+00	4fd5a5ef-090e-4857-beea-3e18271814f9	DP	Direction de la Planification	{}	\N	80	61	1	1	1	1
69	dsi-direction-des-systemes-dinformation	\N	\N	2016-11-03 18:25:51.43+00	2016-11-03 18:25:51.43+00	a0441ce6-079e-41bb-896a-f542135e74f9	DSI	Direction des systèmes d'information	{}	\N	80	61	1	1	1	1
70	dfccrm-direction-mesures-urgences	\N	\N	2016-11-03 18:26:44.265+00	2016-11-03 18:26:44.265+00	db1b8852-f5c3-42d2-93cb-609a3e467c1d	DFCCRM	Direction ... mesures urgences	{}	\N	80	61	1	1	1	1
71	drh-direction-des-ressurces-humaines	\N	\N	2016-11-03 18:27:12.246+00	2016-11-03 18:27:12.246+00	8ab888a1-14eb-4337-9985-2ed7bc749103	DRH	Direction des ressurces humaines	{}	\N	80	61	1	1	1	1
72	dsaq-direction-des-statistiques	\N	\N	2016-11-03 18:27:50.54+00	2016-11-03 18:27:50.54+00	711e5141-e370-434b-bad4-267ffe5750b9	DSAQ	Direction des statistiques	{}	\N	80	61	1	1	1	1
73	daj-direction-des-affaires-juridiques	\N	\N	2016-11-03 18:28:19.092+00	2016-11-03 18:28:19.092+00	07273755-df71-47ca-aafa-a6e3a009b3a3	DAJ	Direction des Affaires juridiques	{}	\N	80	61	1	1	1	1
74	dai-direction-de-laadit-interne	\N	\N	2016-11-03 18:28:48.895+00	2016-11-03 18:28:48.895+00	fcb0545c-a588-485f-830a-8d2cc6432aaa	DAI	Direction de l'Aadit interne	{}	\N	80	61	1	1	1	1
75	agent-agent	\N	\N	2016-11-03 22:22:47.955+00	2016-11-03 22:22:47.955+00	baf97587-d1a2-49f3-92f5-083fc4e356c6	Agent	Agent	{}	\N	81	\N	1	1	1	1
76	agent-1-agent-de-premiere-ligne	\N	\N	2016-11-03 22:23:16.036+00	2016-11-03 22:23:16.036+00	0345caed-aeb3-4a84-96b1-93ddb5c9b375	Agent-1	Agent de première ligne	{}	\N	81	75	1	1	1	1
77	agent-2-agent-de-deuxieme-ligne	\N	\N	2016-11-03 22:23:51.168+00	2016-11-03 22:23:51.168+00	20aaea5f-4337-4672-984e-760aaec09b2b	Agent-2	Agent de deuxième ligne	{}	\N	81	75	1	1	1	1
\.


--
-- Name: rai01ref_capacity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_capacity_id_seq', 77, true);


--
-- Data for Name: rai01ref_docattribute; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_docattribute (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", code, "baseType", "prpLength", "prpScale", "vType", "prpDefault", "prpChoices", "isRequired", "isSensitive", "crudType", description, "docType_id", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
33	artefact-processus-redacteur	\N	\N	2016-10-31 18:21:35.761+00	2016-10-31 18:21:35.761+00	2df81df2-9ae0-461c-9f8e-13bac4813f31	Rédacteur		0	0				f	f			73	1	1	1	1
34	artefact-processus-etat	\N	\N	2016-10-31 18:21:47.508+00	2016-10-31 18:22:00.23+00	efc481a4-4f68-45de-a30a-41f8b83fb09f	État		0	0				f	f			73	1	1	1	1
35	artefact-processus-version	\N	\N	2016-10-31 18:22:26.541+00	2016-10-31 18:22:26.541+00	932c8959-9aae-4390-ba30-57d85effc511	Version		0	0				f	f			73	1	1	1	1
36	artefact-processus-date-revision	\N	\N	2016-10-31 18:22:54.662+00	2016-10-31 18:22:54.662+00	027eb4ce-860e-4b7f-bd55-a2b4d89cb5df	Date révision	date	0	0				f	f			73	1	1	1	1
37	artefact-processus-description-sommaire	\N	\N	2016-10-31 18:23:31.79+00	2016-10-31 18:23:31.79+00	a611d6d4-fa40-44ec-bf23-7340990356cf	Description sommaire	text	0	0				f	f			73	1	1	1	1
38	artefact-processus-evenement-declencheur	\N	\N	2016-10-31 18:23:55.897+00	2016-10-31 18:23:55.897+00	b7efa093-f64b-4f77-a8fe-102eb4f95fcd	Événement déclencheur		0	0				f	f			73	1	1	1	1
39	artefact-processus-volume	\N	\N	2016-10-31 18:24:21.008+00	2016-10-31 18:24:21.008+00	e1fe3bee-a4f5-41d2-a8f6-ce6d01764114	Volume	text	0	0				f	f			73	1	1	1	1
40	artefact-processus-type-extrant	\N	\N	2016-10-31 18:24:47.833+00	2016-10-31 18:24:47.833+00	34a178f9-3afc-4ce1-a50e-7777399c7116	Type extrant		0	0				f	f			73	1	1	1	1
41	artefact-processus-caracteristiques	\N	\N	2016-10-31 18:25:18.793+00	2016-10-31 18:25:18.793+00	eb4407dc-d432-4d33-a907-edbdd7fe4748	Caractéristiques	text	0	0				f	f			73	1	1	1	1
44	artefact-procedure-responsable	\N	\N	2016-10-31 18:28:31.468+00	2016-10-31 18:28:31.468+00	0aaa420a-9b76-4282-9b79-b3afcf6b47ff	Responsable		0	0				f	f			74	1	1	1	1
45	artefact-procedure-mode-de-traitement	\N	\N	2016-10-31 18:28:53.895+00	2016-10-31 18:28:53.895+00	ddbaf1dd-1a1c-46f6-b880-8ee5e05b1b57	Mode de traitement		0	0				f	f			74	1	1	1	1
46	artefact-procedure-frequence	\N	\N	2016-10-31 18:29:06.839+00	2016-10-31 18:29:06.839+00	3be829d5-0bd4-4561-bdfd-e8c8c1f1cfd0	Fréquence		0	0				f	f			74	1	1	1	1
47	artefact-procedure-critere-dentree	\N	\N	2016-10-31 18:29:23.472+00	2016-10-31 18:29:23.472+00	320eb3a4-6cf9-40b6-b3ee-837cdbd67da9	Critère d'entrée		0	0				f	f			74	1	1	1	1
48	artefact-procedure-intrant	\N	\N	2016-10-31 18:29:34.614+00	2016-10-31 18:29:34.614+00	718e81b6-14b1-4382-b4b7-a9ab4e972816	Intrant		0	0				f	f			74	1	1	1	1
49	artefact-procedure-criteres-de-sortie	\N	\N	2016-10-31 18:30:28.701+00	2016-10-31 18:30:28.701+00	2e633dfe-47af-4af7-a361-f26fad528eba	Critères de sortie		0	0				f	f			74	1	1	1	1
50	artefact-procedure-caracteristiques	\N	\N	2016-10-31 18:31:38.765+00	2016-10-31 18:31:38.765+00	f84e8d1e-f6d4-4610-b716-3a3fd9dfcce1	Caractéristiques		0	0				f	f			74	1	1	1	1
\.


--
-- Name: rai01ref_docattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_docattribute_id_seq', 50, true);


--
-- Data for Name: rai01ref_doctype; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_doctype (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", document, dtype, category, notes, description, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
73	artefact-p-logique	\N	\N	2016-10-31 18:19:45.46+00	2016-11-03 21:08:28.765+00	4b97ef31-f4d9-4d21-98d5-8bb57919cab4	Artefact	P. logique	Analyse		Documentation analyse de processus	1	1	1	1
74	artefact-procedure-operationnelle	\N	\N	2016-10-31 18:27:15.616+00	2016-11-03 02:48:39.436+00	eff0f82f-5096-40b4-9c23-c238e712d1d5	Artefact	Procédure opérationnelle	Analyse		Description de procédure opérationnelle	1	1	1	1
75	capacity-service	\N	\N	2016-11-01 18:25:24.893+00	2016-11-01 18:25:24.893+00	e363af8c-913e-40b8-9999-d0ee18f9d7b1	Capacity	Service				1	1	1	1
77	artefact-procedure-administrative	\N	\N	2016-11-01 18:33:33.963+00	2016-11-03 02:53:20.645+00	40d73014-9823-4963-8d90-bfc285729d0f	Artefact	Procédure administrative	Analyse		Étape de procédure opérationnelle	1	1	1	1
78	artefact-unite-de-traitement	\N	\N	2016-11-01 18:35:11.281+00	2016-11-01 18:35:11.281+00	43fd8a16-2c3b-4724-8483-e42c4e57e900	Artefact	Unité de traitement	Analyse			1	1	1	1
79	artefact-p-organisationnel	\N	\N	2016-11-03 13:08:51.013+00	2016-11-03 21:08:49.379+00	ba4967ea-203c-41d7-8e8a-035a91896d6d	Artefact	P. organisationnel	Cartographie		Processus organisationnel	1	1	1	1
80	capacity-organigramme	\N	\N	2016-11-03 14:59:08.364+00	2016-11-03 14:59:08.364+00	951bc3d9-1912-440b-81eb-bb00cbcadfdf	Capacity	Organigramme	Structure organisationnelle		Composante Organigramme	1	1	1	1
81	capacity-poste	\N	\N	2016-11-03 22:16:16.512+00	2016-11-03 22:16:16.512+00	409ae1dd-a6d2-4e7c-9957-a612ca710691	Capacity	Poste	Structure organisationnelle		Poste de travail	1	1	1	1
\.


--
-- Name: rai01ref_doctype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_doctype_id_seq', 81, true);


--
-- Data for Name: rai01ref_projectartefact; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_projectartefact (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", notes, description, artefact_id, projet_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: rai01ref_projectartefact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_projectartefact_id_seq', 1, false);


--
-- Data for Name: rai01ref_projectcapacity; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_projectcapacity (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", notes, description, capacity_id, projet_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: rai01ref_projectcapacity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_projectcapacity_id_seq', 1, false);


--
-- Data for Name: rai01ref_projectrequirement; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_projectrequirement (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", notes, description, projet_id, requirement_id, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: rai01ref_projectrequirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_projectrequirement_id_seq', 1, false);


--
-- Data for Name: rai01ref_projet; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_projet (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", code, notes, description, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: rai01ref_projet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_projet_id_seq', 1, false);


--
-- Data for Name: rai01ref_requirement; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_requirement (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", code, description, info, "copyFrom_id", "docType_id", "refRequirement_id", "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
\.


--
-- Name: rai01ref_requirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_requirement_id_seq', 1, false);


--
-- Data for Name: rai01ref_source; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY rai01ref_source (id, "smNaturalCode", "smRegStatus", "smWflowStatus", "smCreatedOn", "smModifiedOn", "smUUID", code, reference, notes, description, "smCreatedBy_id", "smModifiedBy_id", "smOwningTeam_id", "smOwningUser_id") FROM stdin;
8	code-27	\N	\N	2016-11-01 19:47:52.902+00	2016-11-01 19:48:52.244+00	6c3b9e78-de9e-4893-98d6-3ae785c0d028	Code 27	p251u cl0201		Processus : fournir unformation téléphonique	1	1	1	1
\.


--
-- Name: rai01ref_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('rai01ref_source_id_seq', 8, true);


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 1, false);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: rea_user
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rea_user
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_726645502d711123_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_726645502d711123_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: protoExt_customdefinition protoExt_customdefinition_code_5dc614242b2fe89_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_customdefinition"
    ADD CONSTRAINT "protoExt_customdefinition_code_5dc614242b2fe89_uniq" UNIQUE (code, "smOwningUser_id");


--
-- Name: protoExt_customdefinition protoExt_customdefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_customdefinition"
    ADD CONSTRAINT "protoExt_customdefinition_pkey" PRIMARY KEY (id);


--
-- Name: protoExt_parameters protoExt_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_parameters"
    ADD CONSTRAINT "protoExt_parameters_pkey" PRIMARY KEY (id);


--
-- Name: protoExt_viewdefinition protoExt_viewdefinition_code_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_viewdefinition"
    ADD CONSTRAINT "protoExt_viewdefinition_code_key" UNIQUE (code);


--
-- Name: protoExt_viewdefinition protoExt_viewdefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_viewdefinition"
    ADD CONSTRAINT "protoExt_viewdefinition_pkey" PRIMARY KEY (id);


--
-- Name: protoLib_contextentity protoLib_contextentity_contextVar_id_477a0f34241c5009_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity"
    ADD CONSTRAINT "protoLib_contextentity_contextVar_id_477a0f34241c5009_uniq" UNIQUE ("contextVar_id", entity_id);


--
-- Name: protoLib_contextentity protoLib_contextentity_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity"
    ADD CONSTRAINT "protoLib_contextentity_pkey" PRIMARY KEY (id);


--
-- Name: protoLib_contextuser protoLib_contextuser_contextVar_id_713180d55a3c5e45_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextuser"
    ADD CONSTRAINT "protoLib_contextuser_contextVar_id_713180d55a3c5e45_uniq" UNIQUE ("contextVar_id", "smOwningUser_id");


--
-- Name: protoLib_contextuser protoLib_contextuser_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextuser"
    ADD CONSTRAINT "protoLib_contextuser_pkey" PRIMARY KEY (id);


--
-- Name: protoLib_contextvar protoLib_contextvar_modelCType_id_2d87a69004deba81_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextvar"
    ADD CONSTRAINT "protoLib_contextvar_modelCType_id_2d87a69004deba81_uniq" UNIQUE ("modelCType_id", "propName");


--
-- Name: protoLib_contextvar protoLib_contextvar_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextvar"
    ADD CONSTRAINT "protoLib_contextvar_pkey" PRIMARY KEY (id);


--
-- Name: protoLib_entitymap protoLib_entitymap_entityBase_id_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_entitymap"
    ADD CONSTRAINT "protoLib_entitymap_entityBase_id_key" UNIQUE ("entityBase_id");


--
-- Name: protoLib_entitymap protoLib_entitymap_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_entitymap"
    ADD CONSTRAINT "protoLib_entitymap_pkey" PRIMARY KEY (id);


--
-- Name: protoLib_logger protoLib_logger_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_logger"
    ADD CONSTRAINT "protoLib_logger_pkey" PRIMARY KEY (id);


--
-- Name: protoLib_teamhierarchy protoLib_teamhierarchy_code_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_teamhierarchy"
    ADD CONSTRAINT "protoLib_teamhierarchy_code_key" UNIQUE (code);


--
-- Name: protoLib_teamhierarchy protoLib_teamhierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_teamhierarchy"
    ADD CONSTRAINT "protoLib_teamhierarchy_pkey" PRIMARY KEY (id);


--
-- Name: protoLib_userprofile protoLib_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_userprofile"
    ADD CONSTRAINT "protoLib_userprofile_pkey" PRIMARY KEY (id);


--
-- Name: protoLib_userprofile protoLib_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_userprofile"
    ADD CONSTRAINT "protoLib_userprofile_user_id_key" UNIQUE (user_id);


--
-- Name: prototype_diagram prototype_diagram_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram
    ADD CONSTRAINT prototype_diagram_pkey PRIMARY KEY (id);


--
-- Name: prototype_diagram prototype_diagram_project_id_6eda9c9d2694ca91_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram
    ADD CONSTRAINT prototype_diagram_project_id_6eda9c9d2694ca91_uniq UNIQUE (project_id, code, "smOwningTeam_id", "smVersion_id");


--
-- Name: prototype_diagramentity prototype_diagramentity_diagram_id_5edb63536aee8002_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT prototype_diagramentity_diagram_id_5edb63536aee8002_uniq UNIQUE (diagram_id, entity_id, "smOwningTeam_id", "smVersion_id");


--
-- Name: prototype_diagramentity prototype_diagramentity_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT prototype_diagramentity_pkey PRIMARY KEY (id);


--
-- Name: prototype_entity prototype_entity_model_id_3d7ec2852d5ce941_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity
    ADD CONSTRAINT prototype_entity_model_id_3d7ec2852d5ce941_uniq UNIQUE (model_id, code, "smOwningTeam_id", "smVersion_id");


--
-- Name: prototype_entity prototype_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity
    ADD CONSTRAINT prototype_entity_pkey PRIMARY KEY (id);


--
-- Name: prototype_model prototype_model_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model
    ADD CONSTRAINT prototype_model_pkey PRIMARY KEY (id);


--
-- Name: prototype_model prototype_model_project_id_c386b02ccd2c0a_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model
    ADD CONSTRAINT prototype_model_project_id_c386b02ccd2c0a_uniq UNIQUE (project_id, code, "smOwningTeam_id", "smVersion_id");


--
-- Name: prototype_project prototype_project_code_72726ecc4bdda043_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_project
    ADD CONSTRAINT prototype_project_code_72726ecc4bdda043_uniq UNIQUE (code, "smOwningTeam_id", "smVersion_id");


--
-- Name: prototype_project prototype_project_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_project
    ADD CONSTRAINT prototype_project_pkey PRIMARY KEY (id);


--
-- Name: prototype_property prototype_property_entity_id_7d0494231253d0e1_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property
    ADD CONSTRAINT prototype_property_entity_id_7d0494231253d0e1_uniq UNIQUE (entity_id, code, "smOwningTeam_id", "smVersion_id");


--
-- Name: prototype_property prototype_property_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property
    ADD CONSTRAINT prototype_property_pkey PRIMARY KEY (id);


--
-- Name: prototype_propertyequivalence prototype_propertyequiv_sourceProperty_id_473a4881bbc408be_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT "prototype_propertyequiv_sourceProperty_id_473a4881bbc408be_uniq" UNIQUE ("sourceProperty_id", "targetProperty_id", "smOwningTeam_id", "smVersion_id");


--
-- Name: prototype_propertyequivalence prototype_propertyequivalence_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT prototype_propertyequivalence_pkey PRIMARY KEY (id);


--
-- Name: prototype_prototable prototype_prototable_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototable
    ADD CONSTRAINT prototype_prototable_pkey PRIMARY KEY (id);


--
-- Name: prototype_prototype prototype_prototype_entity_id_53d3b7edbcb95102_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype
    ADD CONSTRAINT prototype_prototype_entity_id_53d3b7edbcb95102_uniq UNIQUE (entity_id, code, "smOwningTeam_id", "smVersion_id");


--
-- Name: prototype_prototype prototype_prototype_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype
    ADD CONSTRAINT prototype_prototype_pkey PRIMARY KEY (id);


--
-- Name: prototype_protoversiontitle prototype_protoversiontitle_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_protoversiontitle
    ADD CONSTRAINT prototype_protoversiontitle_pkey PRIMARY KEY (id);


--
-- Name: prototype_relationship prototype_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_relationship
    ADD CONSTRAINT prototype_relationship_pkey PRIMARY KEY (property_ptr_id);


--
-- Name: rai01ref_artefact rai01ref_artefact_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT rai01ref_artefact_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_artefactcapacity rai01ref_artefactcapacity_artefact_id_6a535ca2f380d1b8_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity
    ADD CONSTRAINT rai01ref_artefactcapacity_artefact_id_6a535ca2f380d1b8_uniq UNIQUE (artefact_id, capacity_id);


--
-- Name: rai01ref_artefactcapacity rai01ref_artefactcapacity_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity
    ADD CONSTRAINT rai01ref_artefactcapacity_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_artefactcomposition rai01ref_artefactcomposition_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition
    ADD CONSTRAINT rai01ref_artefactcomposition_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_artefactrequirement rai01ref_artefactrequirement_artefact_id_62ffae1d4692fcde_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement
    ADD CONSTRAINT rai01ref_artefactrequirement_artefact_id_62ffae1d4692fcde_uniq UNIQUE (artefact_id, requirement_id);


--
-- Name: rai01ref_artefactrequirement rai01ref_artefactrequirement_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement
    ADD CONSTRAINT rai01ref_artefactrequirement_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_artefactsource rai01ref_artefactsource_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource
    ADD CONSTRAINT rai01ref_artefactsource_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_artefactsource rai01ref_artefactsource_source_id_2b7e7a3e13084e60_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource
    ADD CONSTRAINT rai01ref_artefactsource_source_id_2b7e7a3e13084e60_uniq UNIQUE (source_id, artefact_id);


--
-- Name: rai01ref_capacity rai01ref_capacity_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity
    ADD CONSTRAINT rai01ref_capacity_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_docattribute rai01ref_docattribute_docType_id_6ee1cf30957aaf62_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_docattribute
    ADD CONSTRAINT "rai01ref_docattribute_docType_id_6ee1cf30957aaf62_uniq" UNIQUE ("docType_id", code);


--
-- Name: rai01ref_docattribute rai01ref_docattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_docattribute
    ADD CONSTRAINT rai01ref_docattribute_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_doctype rai01ref_doctype_document_15ede8c0c11770ef_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_doctype
    ADD CONSTRAINT rai01ref_doctype_document_15ede8c0c11770ef_uniq UNIQUE (document, dtype);


--
-- Name: rai01ref_doctype rai01ref_doctype_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_doctype
    ADD CONSTRAINT rai01ref_doctype_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_projectartefact rai01ref_projectartefact_artefact_id_610441d210f80698_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact
    ADD CONSTRAINT rai01ref_projectartefact_artefact_id_610441d210f80698_uniq UNIQUE (artefact_id, projet_id);


--
-- Name: rai01ref_projectartefact rai01ref_projectartefact_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact
    ADD CONSTRAINT rai01ref_projectartefact_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_projectcapacity rai01ref_projectcapacity_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity
    ADD CONSTRAINT rai01ref_projectcapacity_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_projectcapacity rai01ref_projectcapacity_projet_id_3df7e5cee91ce3f5_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity
    ADD CONSTRAINT rai01ref_projectcapacity_projet_id_3df7e5cee91ce3f5_uniq UNIQUE (projet_id, capacity_id);


--
-- Name: rai01ref_projectrequirement rai01ref_projectrequirement_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement
    ADD CONSTRAINT rai01ref_projectrequirement_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_projectrequirement rai01ref_projectrequirement_projet_id_1b798de89a81907b_uniq; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement
    ADD CONSTRAINT rai01ref_projectrequirement_projet_id_1b798de89a81907b_uniq UNIQUE (projet_id, requirement_id);


--
-- Name: rai01ref_projet rai01ref_projet_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projet
    ADD CONSTRAINT rai01ref_projet_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_requirement rai01ref_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement
    ADD CONSTRAINT rai01ref_requirement_pkey PRIMARY KEY (id);


--
-- Name: rai01ref_source rai01ref_source_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_source
    ADD CONSTRAINT rai01ref_source_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_308f7fa063f82f03_like; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_group_name_308f7fa063f82f03_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_1282b1656e5947b9_like; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX auth_user_username_1282b1656e5947b9_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_3f9f9d9a68a5fb29_like; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX django_session_session_key_3f9f9d9a68a5fb29_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: protoExt_customdefinition_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_customdefinition_2236446a" ON "protoExt_customdefinition" USING btree ("smCreatedBy_id");


--
-- Name: protoExt_customdefinition_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_customdefinition_55b4cdd2" ON "protoExt_customdefinition" USING btree ("smModifiedBy_id");


--
-- Name: protoExt_customdefinition_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_customdefinition_5acf3455" ON "protoExt_customdefinition" USING btree ("smOwningTeam_id");


--
-- Name: protoExt_customdefinition_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_customdefinition_b0755eff" ON "protoExt_customdefinition" USING btree ("smOwningUser_id");


--
-- Name: protoExt_parameters_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_parameters_2236446a" ON "protoExt_parameters" USING btree ("smCreatedBy_id");


--
-- Name: protoExt_parameters_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_parameters_55b4cdd2" ON "protoExt_parameters" USING btree ("smModifiedBy_id");


--
-- Name: protoExt_parameters_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_parameters_5acf3455" ON "protoExt_parameters" USING btree ("smOwningTeam_id");


--
-- Name: protoExt_parameters_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_parameters_b0755eff" ON "protoExt_parameters" USING btree ("smOwningUser_id");


--
-- Name: protoExt_viewdefinition_code_6ca8a14915999fe2_like; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoExt_viewdefinition_code_6ca8a14915999fe2_like" ON "protoExt_viewdefinition" USING btree (code varchar_pattern_ops);


--
-- Name: protoLib_contextentity_2045611b; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextentity_2045611b" ON "protoLib_contextentity" USING btree ("contextVar_id");


--
-- Name: protoLib_contextentity_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextentity_2236446a" ON "protoLib_contextentity" USING btree ("smCreatedBy_id");


--
-- Name: protoLib_contextentity_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextentity_55b4cdd2" ON "protoLib_contextentity" USING btree ("smModifiedBy_id");


--
-- Name: protoLib_contextentity_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextentity_5acf3455" ON "protoLib_contextentity" USING btree ("smOwningTeam_id");


--
-- Name: protoLib_contextentity_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextentity_b0755eff" ON "protoLib_contextentity" USING btree ("smOwningUser_id");


--
-- Name: protoLib_contextentity_dffc4713; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextentity_dffc4713" ON "protoLib_contextentity" USING btree (entity_id);


--
-- Name: protoLib_contextuser_2045611b; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextuser_2045611b" ON "protoLib_contextuser" USING btree ("contextVar_id");


--
-- Name: protoLib_contextuser_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextuser_2236446a" ON "protoLib_contextuser" USING btree ("smCreatedBy_id");


--
-- Name: protoLib_contextuser_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextuser_55b4cdd2" ON "protoLib_contextuser" USING btree ("smModifiedBy_id");


--
-- Name: protoLib_contextuser_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextuser_5acf3455" ON "protoLib_contextuser" USING btree ("smOwningTeam_id");


--
-- Name: protoLib_contextuser_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextuser_b0755eff" ON "protoLib_contextuser" USING btree ("smOwningUser_id");


--
-- Name: protoLib_contextvar_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextvar_2236446a" ON "protoLib_contextvar" USING btree ("smCreatedBy_id");


--
-- Name: protoLib_contextvar_3a6984a1; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextvar_3a6984a1" ON "protoLib_contextvar" USING btree ("modelCType_id");


--
-- Name: protoLib_contextvar_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextvar_55b4cdd2" ON "protoLib_contextvar" USING btree ("smModifiedBy_id");


--
-- Name: protoLib_contextvar_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextvar_5acf3455" ON "protoLib_contextvar" USING btree ("smOwningTeam_id");


--
-- Name: protoLib_contextvar_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_contextvar_b0755eff" ON "protoLib_contextvar" USING btree ("smOwningUser_id");


--
-- Name: protoLib_logger_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_logger_2236446a" ON "protoLib_logger" USING btree ("smCreatedBy_id");


--
-- Name: protoLib_logger_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_logger_5acf3455" ON "protoLib_logger" USING btree ("smOwningTeam_id");


--
-- Name: protoLib_teamhierarchy_27b864a7; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_teamhierarchy_27b864a7" ON "protoLib_teamhierarchy" USING btree ("parentNode_id");


--
-- Name: protoLib_teamhierarchy_code_1fc1b73225caf608_like; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_teamhierarchy_code_1fc1b73225caf608_like" ON "protoLib_teamhierarchy" USING btree (code varchar_pattern_ops);


--
-- Name: protoLib_userprofile_44fd1ceb; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX "protoLib_userprofile_44fd1ceb" ON "protoLib_userprofile" USING btree ("userTeam_id");


--
-- Name: prototype_diagram_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagram_2236446a ON prototype_diagram USING btree ("smCreatedBy_id");


--
-- Name: prototype_diagram_3c023205; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagram_3c023205 ON prototype_diagram USING btree ("smVersion_id");


--
-- Name: prototype_diagram_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagram_55b4cdd2 ON prototype_diagram USING btree ("smModifiedBy_id");


--
-- Name: prototype_diagram_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagram_5acf3455 ON prototype_diagram USING btree ("smOwningTeam_id");


--
-- Name: prototype_diagram_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagram_b0755eff ON prototype_diagram USING btree ("smOwningUser_id");


--
-- Name: prototype_diagram_b098ad43; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagram_b098ad43 ON prototype_diagram USING btree (project_id);


--
-- Name: prototype_diagramentity_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagramentity_2236446a ON prototype_diagramentity USING btree ("smCreatedBy_id");


--
-- Name: prototype_diagramentity_3c023205; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagramentity_3c023205 ON prototype_diagramentity USING btree ("smVersion_id");


--
-- Name: prototype_diagramentity_465639d4; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagramentity_465639d4 ON prototype_diagramentity USING btree (diagram_id);


--
-- Name: prototype_diagramentity_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagramentity_55b4cdd2 ON prototype_diagramentity USING btree ("smModifiedBy_id");


--
-- Name: prototype_diagramentity_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagramentity_5acf3455 ON prototype_diagramentity USING btree ("smOwningTeam_id");


--
-- Name: prototype_diagramentity_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagramentity_b0755eff ON prototype_diagramentity USING btree ("smOwningUser_id");


--
-- Name: prototype_diagramentity_dffc4713; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_diagramentity_dffc4713 ON prototype_diagramentity USING btree (entity_id);


--
-- Name: prototype_entity_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_entity_2236446a ON prototype_entity USING btree ("smCreatedBy_id");


--
-- Name: prototype_entity_3c023205; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_entity_3c023205 ON prototype_entity USING btree ("smVersion_id");


--
-- Name: prototype_entity_477cbf8a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_entity_477cbf8a ON prototype_entity USING btree (model_id);


--
-- Name: prototype_entity_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_entity_55b4cdd2 ON prototype_entity USING btree ("smModifiedBy_id");


--
-- Name: prototype_entity_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_entity_5acf3455 ON prototype_entity USING btree ("smOwningTeam_id");


--
-- Name: prototype_entity_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_entity_b0755eff ON prototype_entity USING btree ("smOwningUser_id");


--
-- Name: prototype_model_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_model_2236446a ON prototype_model USING btree ("smCreatedBy_id");


--
-- Name: prototype_model_3c023205; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_model_3c023205 ON prototype_model USING btree ("smVersion_id");


--
-- Name: prototype_model_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_model_55b4cdd2 ON prototype_model USING btree ("smModifiedBy_id");


--
-- Name: prototype_model_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_model_5acf3455 ON prototype_model USING btree ("smOwningTeam_id");


--
-- Name: prototype_model_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_model_b0755eff ON prototype_model USING btree ("smOwningUser_id");


--
-- Name: prototype_model_b098ad43; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_model_b098ad43 ON prototype_model USING btree (project_id);


--
-- Name: prototype_project_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_project_2236446a ON prototype_project USING btree ("smCreatedBy_id");


--
-- Name: prototype_project_3c023205; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_project_3c023205 ON prototype_project USING btree ("smVersion_id");


--
-- Name: prototype_project_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_project_55b4cdd2 ON prototype_project USING btree ("smModifiedBy_id");


--
-- Name: prototype_project_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_project_5acf3455 ON prototype_project USING btree ("smOwningTeam_id");


--
-- Name: prototype_project_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_project_b0755eff ON prototype_project USING btree ("smOwningUser_id");


--
-- Name: prototype_property_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_property_2236446a ON prototype_property USING btree ("smCreatedBy_id");


--
-- Name: prototype_property_3c023205; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_property_3c023205 ON prototype_property USING btree ("smVersion_id");


--
-- Name: prototype_property_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_property_55b4cdd2 ON prototype_property USING btree ("smModifiedBy_id");


--
-- Name: prototype_property_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_property_5acf3455 ON prototype_property USING btree ("smOwningTeam_id");


--
-- Name: prototype_property_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_property_b0755eff ON prototype_property USING btree ("smOwningUser_id");


--
-- Name: prototype_property_dffc4713; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_property_dffc4713 ON prototype_property USING btree (entity_id);


--
-- Name: prototype_propertyequivalence_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_propertyequivalence_2236446a ON prototype_propertyequivalence USING btree ("smCreatedBy_id");


--
-- Name: prototype_propertyequivalence_3c023205; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_propertyequivalence_3c023205 ON prototype_propertyequivalence USING btree ("smVersion_id");


--
-- Name: prototype_propertyequivalence_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_propertyequivalence_55b4cdd2 ON prototype_propertyequivalence USING btree ("smModifiedBy_id");


--
-- Name: prototype_propertyequivalence_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_propertyequivalence_5acf3455 ON prototype_propertyequivalence USING btree ("smOwningTeam_id");


--
-- Name: prototype_propertyequivalence_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_propertyequivalence_b0755eff ON prototype_propertyequivalence USING btree ("smOwningUser_id");


--
-- Name: prototype_propertyequivalence_bad42a08; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_propertyequivalence_bad42a08 ON prototype_propertyequivalence USING btree ("targetProperty_id");


--
-- Name: prototype_propertyequivalence_f9305be0; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_propertyequivalence_f9305be0 ON prototype_propertyequivalence USING btree ("sourceProperty_id");


--
-- Name: prototype_prototable_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototable_2236446a ON prototype_prototable USING btree ("smCreatedBy_id");


--
-- Name: prototype_prototable_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototable_55b4cdd2 ON prototype_prototable USING btree ("smModifiedBy_id");


--
-- Name: prototype_prototable_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototable_5acf3455 ON prototype_prototable USING btree ("smOwningTeam_id");


--
-- Name: prototype_prototable_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototable_b0755eff ON prototype_prototable USING btree ("smOwningUser_id");


--
-- Name: prototype_prototable_dffc4713; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototable_dffc4713 ON prototype_prototable USING btree (entity_id);


--
-- Name: prototype_prototype_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototype_2236446a ON prototype_prototype USING btree ("smCreatedBy_id");


--
-- Name: prototype_prototype_3c023205; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototype_3c023205 ON prototype_prototype USING btree ("smVersion_id");


--
-- Name: prototype_prototype_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototype_55b4cdd2 ON prototype_prototype USING btree ("smModifiedBy_id");


--
-- Name: prototype_prototype_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototype_5acf3455 ON prototype_prototype USING btree ("smOwningTeam_id");


--
-- Name: prototype_prototype_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototype_b0755eff ON prototype_prototype USING btree ("smOwningUser_id");


--
-- Name: prototype_prototype_dffc4713; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_prototype_dffc4713 ON prototype_prototype USING btree (entity_id);


--
-- Name: prototype_protoversiontitle_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_protoversiontitle_2236446a ON prototype_protoversiontitle USING btree ("smCreatedBy_id");


--
-- Name: prototype_protoversiontitle_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_protoversiontitle_55b4cdd2 ON prototype_protoversiontitle USING btree ("smModifiedBy_id");


--
-- Name: prototype_protoversiontitle_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_protoversiontitle_5acf3455 ON prototype_protoversiontitle USING btree ("smOwningTeam_id");


--
-- Name: prototype_protoversiontitle_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_protoversiontitle_b0755eff ON prototype_protoversiontitle USING btree ("smOwningUser_id");


--
-- Name: prototype_protoversiontitle_bdffc6fd; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_protoversiontitle_bdffc6fd ON prototype_protoversiontitle USING btree ("versionBase_id");


--
-- Name: prototype_relationship_ecab8fa3; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX prototype_relationship_ecab8fa3 ON prototype_relationship USING btree ("refEntity_id");


--
-- Name: rai01ref_artefact_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_2236446a ON rai01ref_artefact USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_artefact_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_55b4cdd2 ON rai01ref_artefact USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_artefact_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_5acf3455 ON rai01ref_artefact USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_artefact_9a90dac7; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_9a90dac7 ON rai01ref_artefact USING btree (requirement_id);


--
-- Name: rai01ref_artefact_a5b77fca; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_a5b77fca ON rai01ref_artefact USING btree ("docType_id");


--
-- Name: rai01ref_artefact_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_b0755eff ON rai01ref_artefact USING btree ("smOwningUser_id");


--
-- Name: rai01ref_artefact_b553d7ad; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_b553d7ad ON rai01ref_artefact USING btree ("refArtefact_id");


--
-- Name: rai01ref_artefact_e89ce398; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_e89ce398 ON rai01ref_artefact USING btree (capacity_id);


--
-- Name: rai01ref_artefact_fd3fe4b3; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefact_fd3fe4b3 ON rai01ref_artefact USING btree ("copyFrom_id");


--
-- Name: rai01ref_artefactcapacity_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcapacity_2236446a ON rai01ref_artefactcapacity USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_artefactcapacity_2f4a3577; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcapacity_2f4a3577 ON rai01ref_artefactcapacity USING btree (artefact_id);


--
-- Name: rai01ref_artefactcapacity_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcapacity_55b4cdd2 ON rai01ref_artefactcapacity USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_artefactcapacity_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcapacity_5acf3455 ON rai01ref_artefactcapacity USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_artefactcapacity_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcapacity_b0755eff ON rai01ref_artefactcapacity USING btree ("smOwningUser_id");


--
-- Name: rai01ref_artefactcapacity_e89ce398; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcapacity_e89ce398 ON rai01ref_artefactcapacity USING btree (capacity_id);


--
-- Name: rai01ref_artefactcomposition_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcomposition_2236446a ON rai01ref_artefactcomposition USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_artefactcomposition_38f79e86; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcomposition_38f79e86 ON rai01ref_artefactcomposition USING btree ("outputArt_id");


--
-- Name: rai01ref_artefactcomposition_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcomposition_55b4cdd2 ON rai01ref_artefactcomposition USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_artefactcomposition_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcomposition_5acf3455 ON rai01ref_artefactcomposition USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_artefactcomposition_9f202f62; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcomposition_9f202f62 ON rai01ref_artefactcomposition USING btree ("inputArt_id");


--
-- Name: rai01ref_artefactcomposition_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcomposition_b0755eff ON rai01ref_artefactcomposition USING btree ("smOwningUser_id");


--
-- Name: rai01ref_artefactcomposition_ce63d437; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactcomposition_ce63d437 ON rai01ref_artefactcomposition USING btree ("containerArt_id");


--
-- Name: rai01ref_artefactrequirement_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactrequirement_2236446a ON rai01ref_artefactrequirement USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_artefactrequirement_2f4a3577; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactrequirement_2f4a3577 ON rai01ref_artefactrequirement USING btree (artefact_id);


--
-- Name: rai01ref_artefactrequirement_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactrequirement_55b4cdd2 ON rai01ref_artefactrequirement USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_artefactrequirement_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactrequirement_5acf3455 ON rai01ref_artefactrequirement USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_artefactrequirement_9a90dac7; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactrequirement_9a90dac7 ON rai01ref_artefactrequirement USING btree (requirement_id);


--
-- Name: rai01ref_artefactrequirement_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactrequirement_b0755eff ON rai01ref_artefactrequirement USING btree ("smOwningUser_id");


--
-- Name: rai01ref_artefactsource_0afd9202; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactsource_0afd9202 ON rai01ref_artefactsource USING btree (source_id);


--
-- Name: rai01ref_artefactsource_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactsource_2236446a ON rai01ref_artefactsource USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_artefactsource_2f4a3577; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactsource_2f4a3577 ON rai01ref_artefactsource USING btree (artefact_id);


--
-- Name: rai01ref_artefactsource_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactsource_55b4cdd2 ON rai01ref_artefactsource USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_artefactsource_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactsource_5acf3455 ON rai01ref_artefactsource USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_artefactsource_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_artefactsource_b0755eff ON rai01ref_artefactsource USING btree ("smOwningUser_id");


--
-- Name: rai01ref_capacity_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_capacity_2236446a ON rai01ref_capacity USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_capacity_4ef40947; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_capacity_4ef40947 ON rai01ref_capacity USING btree ("refCapacity_id");


--
-- Name: rai01ref_capacity_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_capacity_55b4cdd2 ON rai01ref_capacity USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_capacity_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_capacity_5acf3455 ON rai01ref_capacity USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_capacity_a5b77fca; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_capacity_a5b77fca ON rai01ref_capacity USING btree ("docType_id");


--
-- Name: rai01ref_capacity_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_capacity_b0755eff ON rai01ref_capacity USING btree ("smOwningUser_id");


--
-- Name: rai01ref_capacity_fd3fe4b3; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_capacity_fd3fe4b3 ON rai01ref_capacity USING btree ("copyFrom_id");


--
-- Name: rai01ref_docattribute_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_docattribute_2236446a ON rai01ref_docattribute USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_docattribute_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_docattribute_55b4cdd2 ON rai01ref_docattribute USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_docattribute_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_docattribute_5acf3455 ON rai01ref_docattribute USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_docattribute_a5b77fca; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_docattribute_a5b77fca ON rai01ref_docattribute USING btree ("docType_id");


--
-- Name: rai01ref_docattribute_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_docattribute_b0755eff ON rai01ref_docattribute USING btree ("smOwningUser_id");


--
-- Name: rai01ref_doctype_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_doctype_2236446a ON rai01ref_doctype USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_doctype_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_doctype_55b4cdd2 ON rai01ref_doctype USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_doctype_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_doctype_5acf3455 ON rai01ref_doctype USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_doctype_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_doctype_b0755eff ON rai01ref_doctype USING btree ("smOwningUser_id");


--
-- Name: rai01ref_projectartefact_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectartefact_2236446a ON rai01ref_projectartefact USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_projectartefact_2f4a3577; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectartefact_2f4a3577 ON rai01ref_projectartefact USING btree (artefact_id);


--
-- Name: rai01ref_projectartefact_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectartefact_55b4cdd2 ON rai01ref_projectartefact USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_projectartefact_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectartefact_5acf3455 ON rai01ref_projectartefact USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_projectartefact_673d4f71; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectartefact_673d4f71 ON rai01ref_projectartefact USING btree (projet_id);


--
-- Name: rai01ref_projectartefact_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectartefact_b0755eff ON rai01ref_projectartefact USING btree ("smOwningUser_id");


--
-- Name: rai01ref_projectcapacity_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectcapacity_2236446a ON rai01ref_projectcapacity USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_projectcapacity_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectcapacity_55b4cdd2 ON rai01ref_projectcapacity USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_projectcapacity_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectcapacity_5acf3455 ON rai01ref_projectcapacity USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_projectcapacity_673d4f71; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectcapacity_673d4f71 ON rai01ref_projectcapacity USING btree (projet_id);


--
-- Name: rai01ref_projectcapacity_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectcapacity_b0755eff ON rai01ref_projectcapacity USING btree ("smOwningUser_id");


--
-- Name: rai01ref_projectcapacity_e89ce398; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectcapacity_e89ce398 ON rai01ref_projectcapacity USING btree (capacity_id);


--
-- Name: rai01ref_projectrequirement_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectrequirement_2236446a ON rai01ref_projectrequirement USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_projectrequirement_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectrequirement_55b4cdd2 ON rai01ref_projectrequirement USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_projectrequirement_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectrequirement_5acf3455 ON rai01ref_projectrequirement USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_projectrequirement_673d4f71; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectrequirement_673d4f71 ON rai01ref_projectrequirement USING btree (projet_id);


--
-- Name: rai01ref_projectrequirement_9a90dac7; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectrequirement_9a90dac7 ON rai01ref_projectrequirement USING btree (requirement_id);


--
-- Name: rai01ref_projectrequirement_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projectrequirement_b0755eff ON rai01ref_projectrequirement USING btree ("smOwningUser_id");


--
-- Name: rai01ref_projet_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projet_2236446a ON rai01ref_projet USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_projet_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projet_55b4cdd2 ON rai01ref_projet USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_projet_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projet_5acf3455 ON rai01ref_projet USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_projet_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_projet_b0755eff ON rai01ref_projet USING btree ("smOwningUser_id");


--
-- Name: rai01ref_requirement_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_requirement_2236446a ON rai01ref_requirement USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_requirement_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_requirement_55b4cdd2 ON rai01ref_requirement USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_requirement_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_requirement_5acf3455 ON rai01ref_requirement USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_requirement_97661812; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_requirement_97661812 ON rai01ref_requirement USING btree ("refRequirement_id");


--
-- Name: rai01ref_requirement_a5b77fca; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_requirement_a5b77fca ON rai01ref_requirement USING btree ("docType_id");


--
-- Name: rai01ref_requirement_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_requirement_b0755eff ON rai01ref_requirement USING btree ("smOwningUser_id");


--
-- Name: rai01ref_requirement_fd3fe4b3; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_requirement_fd3fe4b3 ON rai01ref_requirement USING btree ("copyFrom_id");


--
-- Name: rai01ref_source_2236446a; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_source_2236446a ON rai01ref_source USING btree ("smCreatedBy_id");


--
-- Name: rai01ref_source_55b4cdd2; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_source_55b4cdd2 ON rai01ref_source USING btree ("smModifiedBy_id");


--
-- Name: rai01ref_source_5acf3455; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_source_5acf3455 ON rai01ref_source USING btree ("smOwningTeam_id");


--
-- Name: rai01ref_source_b0755eff; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX rai01ref_source_b0755eff ON rai01ref_source USING btree ("smOwningUser_id");


--
-- Name: taggit_tag_name_657069d6ec761fa4_like; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX taggit_tag_name_657069d6ec761fa4_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_40308cb516a129ce_like; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX taggit_tag_slug_40308cb516a129ce_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: rea_user
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: prototype_project D2780f2bee985f946c98b0473dccbad4; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_project
    ADD CONSTRAINT "D2780f2bee985f946c98b0473dccbad4" FOREIGN KEY ("smVersion_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_propertyequivalence D49207e778df48b5a074c4d11fe1cfcc; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT "D49207e778df48b5a074c4d11fe1cfcc" FOREIGN KEY ("smVersion_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_protoversiontitle D8bb268d3b786785a15da95ff36113cf; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_protoversiontitle
    ADD CONSTRAINT "D8bb268d3b786785a15da95ff36113cf" FOREIGN KEY ("versionBase_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_content_type_id_32dba6204d89b7c4_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_32dba6204d89b7c4_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_group_id_591c54b7e0a8c9d5_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_591c54b7e0a8c9d5_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permission_id_59ec826681d9af7f_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_59ec826681d9af7f_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_3a88ad252afa90a4_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_3a88ad252afa90a4_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_35650b8c10cfb1cb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_35650b8c10cfb1cb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_u_permission_id_9dfc544001f4f94_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_u_permission_id_9dfc544001f4f94_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permiss_user_id_19930e0904d30b49_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_19930e0904d30b49_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_property c5b0d1c2ef7f60364be347d588b0c68e; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property
    ADD CONSTRAINT c5b0d1c2ef7f60364be347d588b0c68e FOREIGN KEY ("smVersion_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_model ca94c4f33f231fba726e8dc7ba712bee; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model
    ADD CONSTRAINT ca94c4f33f231fba726e8dc7ba712bee FOREIGN KEY ("smVersion_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototype d036b26830fdeec6b6168501df9a0325; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype
    ADD CONSTRAINT d036b26830fdeec6b6168501df9a0325 FOREIGN KEY ("smVersion_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log djang_content_type_id_18a3fb16923ff4c_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djang_content_type_id_18a3fb16923ff4c_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_2a350a94b2a8898c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_2a350a94b2a8898c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagramentity e57563cc158921bba79ff37d1c974efd; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT e57563cc158921bba79ff37d1c974efd FOREIGN KEY ("smVersion_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_entity f46067f31c9aee23334032028fc58ab4; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity
    ADD CONSTRAINT f46067f31c9aee23334032028fc58ab4 FOREIGN KEY ("smVersion_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoExt_parameters p_smOwningTeam_id_1044e2004e03fbee_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_parameters"
    ADD CONSTRAINT "p_smOwningTeam_id_1044e2004e03fbee_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoExt_customdefinition p_smOwningTeam_id_1612633a47c75326_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_customdefinition"
    ADD CONSTRAINT "p_smOwningTeam_id_1612633a47c75326_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototype p_smOwningTeam_id_165fb3bd3a893659_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype
    ADD CONSTRAINT "p_smOwningTeam_id_165fb3bd3a893659_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextentity p_smOwningTeam_id_2258f35072bdf0d2_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity"
    ADD CONSTRAINT "p_smOwningTeam_id_2258f35072bdf0d2_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_propertyequivalence p_smOwningTeam_id_2af0234a765bf21e_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT "p_smOwningTeam_id_2af0234a765bf21e_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_project p_smOwningTeam_id_34c316175556a3a9_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_project
    ADD CONSTRAINT "p_smOwningTeam_id_34c316175556a3a9_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagramentity p_smOwningTeam_id_447ad09bfefe3e8a_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT "p_smOwningTeam_id_447ad09bfefe3e8a_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagram p_smOwningTeam_id_45c54335a0d23f15_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram
    ADD CONSTRAINT "p_smOwningTeam_id_45c54335a0d23f15_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextuser p_smOwningTeam_id_4c84e4479b509dfc_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextuser"
    ADD CONSTRAINT "p_smOwningTeam_id_4c84e4479b509dfc_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototable p_smOwningTeam_id_4cac201030512af3_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototable
    ADD CONSTRAINT "p_smOwningTeam_id_4cac201030512af3_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_model p_smOwningTeam_id_4ec705f147b4736e_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model
    ADD CONSTRAINT "p_smOwningTeam_id_4ec705f147b4736e_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_logger p_smOwningTeam_id_54f13ae14546ba7a_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_logger"
    ADD CONSTRAINT "p_smOwningTeam_id_54f13ae14546ba7a_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_property p_smOwningTeam_id_5ff1b10dc3fbea38_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property
    ADD CONSTRAINT "p_smOwningTeam_id_5ff1b10dc3fbea38_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextvar p_smOwningTeam_id_7713413d58f2dd5d_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextvar"
    ADD CONSTRAINT "p_smOwningTeam_id_7713413d58f2dd5d_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_entity pr_smOwningTeam_id_509cd106bc8bb99_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity
    ADD CONSTRAINT "pr_smOwningTeam_id_509cd106bc8bb99_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_protoversiontitle pr_smOwningTeam_id_8549002113bb7ec_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_protoversiontitle
    ADD CONSTRAINT "pr_smOwningTeam_id_8549002113bb7ec_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_teamhierarchy pro_parentNode_id_60ad9571abd2e59b_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_teamhierarchy"
    ADD CONSTRAINT "pro_parentNode_id_60ad9571abd2e59b_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("parentNode_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_propertyequivalence pro_targetProperty_id_19ed0cb52db2dbc5_fk_prototype_property_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT "pro_targetProperty_id_19ed0cb52db2dbc5_fk_prototype_property_id" FOREIGN KEY ("targetProperty_id") REFERENCES prototype_property(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_propertyequivalence prot_sourceProperty_id_3a70392b979b6fa_fk_prototype_property_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT "prot_sourceProperty_id_3a70392b979b6fa_fk_prototype_property_id" FOREIGN KEY ("sourceProperty_id") REFERENCES prototype_property(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoExt_customdefinition protoExt_custo_smModifiedBy_id_1e34aa8a20ed54d2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_customdefinition"
    ADD CONSTRAINT "protoExt_custo_smModifiedBy_id_1e34aa8a20ed54d2_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoExt_customdefinition protoExt_custo_smOwningUser_id_3dac0244a455f05d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_customdefinition"
    ADD CONSTRAINT "protoExt_custo_smOwningUser_id_3dac0244a455f05d_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoExt_customdefinition protoExt_custom_smCreatedBy_id_296a2395db358f1c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_customdefinition"
    ADD CONSTRAINT "protoExt_custom_smCreatedBy_id_296a2395db358f1c_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoExt_parameters protoExt_param_smModifiedBy_id_60b9b74d317c495a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_parameters"
    ADD CONSTRAINT "protoExt_param_smModifiedBy_id_60b9b74d317c495a_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoExt_parameters protoExt_param_smOwningUser_id_471ab811217db755_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_parameters"
    ADD CONSTRAINT "protoExt_param_smOwningUser_id_471ab811217db755_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoExt_parameters protoExt_parame_smCreatedBy_id_6b70b77844658de4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoExt_parameters"
    ADD CONSTRAINT "protoExt_parame_smCreatedBy_id_6b70b77844658de4_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextuser protoL_contextVar_id_4baf675e64c99ccd_fk_protoLib_contextvar_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextuser"
    ADD CONSTRAINT "protoL_contextVar_id_4baf675e64c99ccd_fk_protoLib_contextvar_id" FOREIGN KEY ("contextVar_id") REFERENCES "protoLib_contextvar"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextentity protoL_contextVar_id_6f60c1724ebfa0e9_fk_protoLib_contextvar_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity"
    ADD CONSTRAINT "protoL_contextVar_id_6f60c1724ebfa0e9_fk_protoLib_contextvar_id" FOREIGN KEY ("contextVar_id") REFERENCES "protoLib_contextvar"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_entitymap protoL_entityBase_id_41c4c0aafa054eac_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_entitymap"
    ADD CONSTRAINT "protoL_entityBase_id_41c4c0aafa054eac_fk_django_content_type_id" FOREIGN KEY ("entityBase_id") REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextvar protoL_modelCType_id_249d8dc3ffd8e0ab_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextvar"
    ADD CONSTRAINT "protoL_modelCType_id_249d8dc3ffd8e0ab_fk_django_content_type_id" FOREIGN KEY ("modelCType_id") REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_userprofile protoL_userTeam_id_9c27bdb58e1dd51_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_userprofile"
    ADD CONSTRAINT "protoL_userTeam_id_9c27bdb58e1dd51_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("userTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextentity protoLib_c_entity_id_792cd857da68139f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity"
    ADD CONSTRAINT "protoLib_c_entity_id_792cd857da68139f_fk_django_content_type_id" FOREIGN KEY (entity_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextuser protoLib_conte_smModifiedBy_id_141e50ff261fc898_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextuser"
    ADD CONSTRAINT "protoLib_conte_smModifiedBy_id_141e50ff261fc898_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextvar protoLib_conte_smModifiedBy_id_1f50f2ee25d84837_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextvar"
    ADD CONSTRAINT "protoLib_conte_smModifiedBy_id_1f50f2ee25d84837_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextentity protoLib_conte_smModifiedBy_id_433588e90de41c9a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity"
    ADD CONSTRAINT "protoLib_conte_smModifiedBy_id_433588e90de41c9a_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextvar protoLib_conte_smOwningUser_id_2188ce35072a4820_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextvar"
    ADD CONSTRAINT "protoLib_conte_smOwningUser_id_2188ce35072a4820_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextuser protoLib_conte_smOwningUser_id_5899147fd686db7f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextuser"
    ADD CONSTRAINT "protoLib_conte_smOwningUser_id_5899147fd686db7f_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextentity protoLib_conte_smOwningUser_id_741dee3d65123295_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity"
    ADD CONSTRAINT "protoLib_conte_smOwningUser_id_741dee3d65123295_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextentity protoLib_contex_smCreatedBy_id_2dd5292be850e124_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextentity"
    ADD CONSTRAINT "protoLib_contex_smCreatedBy_id_2dd5292be850e124_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextuser protoLib_contex_smCreatedBy_id_7ac51eaf4db635f2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextuser"
    ADD CONSTRAINT "protoLib_contex_smCreatedBy_id_7ac51eaf4db635f2_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_contextvar protoLib_contex_smCreatedBy_id_7f5aa125289d86df_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_contextvar"
    ADD CONSTRAINT "protoLib_contex_smCreatedBy_id_7f5aa125289d86df_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_logger protoLib_logger_smCreatedBy_id_25f8ab99627de758_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_logger"
    ADD CONSTRAINT "protoLib_logger_smCreatedBy_id_25f8ab99627de758_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: protoLib_userprofile protoLib_userprofile_user_id_6cb3904fc80212fd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY "protoLib_userprofile"
    ADD CONSTRAINT "protoLib_userprofile_user_id_6cb3904fc80212fd_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_relationship proto_property_ptr_id_2e3e00dbce8a8217_fk_prototype_property_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_relationship
    ADD CONSTRAINT proto_property_ptr_id_2e3e00dbce8a8217_fk_prototype_property_id FOREIGN KEY (property_ptr_id) REFERENCES prototype_property(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_relationship prototype__refEntity_id_3b24cea7103a11c1_fk_prototype_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_relationship
    ADD CONSTRAINT "prototype__refEntity_id_3b24cea7103a11c1_fk_prototype_entity_id" FOREIGN KEY ("refEntity_id") REFERENCES prototype_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagramentity prototype_d_diagram_id_6bda1be92d9067b2_fk_prototype_diagram_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT prototype_d_diagram_id_6bda1be92d9067b2_fk_prototype_diagram_id FOREIGN KEY (diagram_id) REFERENCES prototype_diagram(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagram prototype_d_project_id_4da6a186413bb18e_fk_prototype_project_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram
    ADD CONSTRAINT prototype_d_project_id_4da6a186413bb18e_fk_prototype_project_id FOREIGN KEY (project_id) REFERENCES prototype_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagramentity prototype_diag_entity_id_29006fccfd5c2fb_fk_prototype_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT prototype_diag_entity_id_29006fccfd5c2fb_fk_prototype_entity_id FOREIGN KEY (entity_id) REFERENCES prototype_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagram prototype_diag_smModifiedBy_id_4438d0a044e2dcc1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram
    ADD CONSTRAINT "prototype_diag_smModifiedBy_id_4438d0a044e2dcc1_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagramentity prototype_diag_smModifiedBy_id_6cce4b874cef0ee2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT "prototype_diag_smModifiedBy_id_6cce4b874cef0ee2_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagramentity prototype_diag_smOwningUser_id_5f74d1a312c1b679_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT "prototype_diag_smOwningUser_id_5f74d1a312c1b679_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagram prototype_diagr_smCreatedBy_id_11ec0701941321c9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram
    ADD CONSTRAINT "prototype_diagr_smCreatedBy_id_11ec0701941321c9_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagram prototype_diagr_smOwningUser_id_bec7f47ec8807a8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram
    ADD CONSTRAINT "prototype_diagr_smOwningUser_id_bec7f47ec8807a8_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagramentity prototype_diagra_smCreatedBy_id_68a0ae7a4403f08_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagramentity
    ADD CONSTRAINT "prototype_diagra_smCreatedBy_id_68a0ae7a4403f08_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_entity prototype_enti_smModifiedBy_id_2c200ec48a39d213_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity
    ADD CONSTRAINT "prototype_enti_smModifiedBy_id_2c200ec48a39d213_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_entity prototype_enti_smOwningUser_id_6ecc05a6a3c6391c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity
    ADD CONSTRAINT "prototype_enti_smOwningUser_id_6ecc05a6a3c6391c_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_entity prototype_entit_smCreatedBy_id_73e4d38b23d92da3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity
    ADD CONSTRAINT "prototype_entit_smCreatedBy_id_73e4d38b23d92da3_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_entity prototype_entity_model_id_313911f87f881e4_fk_prototype_model_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_entity
    ADD CONSTRAINT prototype_entity_model_id_313911f87f881e4_fk_prototype_model_id FOREIGN KEY (model_id) REFERENCES prototype_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_model prototype_m_project_id_366040bb56034159_fk_prototype_project_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model
    ADD CONSTRAINT prototype_m_project_id_366040bb56034159_fk_prototype_project_id FOREIGN KEY (project_id) REFERENCES prototype_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_model prototype_mode_smModifiedBy_id_628867262746e9da_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model
    ADD CONSTRAINT "prototype_mode_smModifiedBy_id_628867262746e9da_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_model prototype_mode_smOwningUser_id_32e4635772bf5d2b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model
    ADD CONSTRAINT "prototype_mode_smOwningUser_id_32e4635772bf5d2b_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_model prototype_model_smCreatedBy_id_502432ee6edc6e9c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_model
    ADD CONSTRAINT "prototype_model_smCreatedBy_id_502432ee6edc6e9c_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototype prototype_pro_entity_id_1bd08f266917ce18_fk_prototype_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype
    ADD CONSTRAINT prototype_pro_entity_id_1bd08f266917ce18_fk_prototype_entity_id FOREIGN KEY (entity_id) REFERENCES prototype_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_property prototype_pro_entity_id_2380c8acf1636ea9_fk_prototype_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property
    ADD CONSTRAINT prototype_pro_entity_id_2380c8acf1636ea9_fk_prototype_entity_id FOREIGN KEY (entity_id) REFERENCES prototype_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototable prototype_pro_entity_id_42195f690cac86cc_fk_prototype_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototable
    ADD CONSTRAINT prototype_pro_entity_id_42195f690cac86cc_fk_prototype_entity_id FOREIGN KEY (entity_id) REFERENCES prototype_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_project prototype_proj_smModifiedBy_id_11878dcf535a61fd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_project
    ADD CONSTRAINT "prototype_proj_smModifiedBy_id_11878dcf535a61fd_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_project prototype_proj_smOwningUser_id_48169319ce5b58ac_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_project
    ADD CONSTRAINT "prototype_proj_smOwningUser_id_48169319ce5b58ac_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_project prototype_proje_smCreatedBy_id_7868d8292a8d9413_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_project
    ADD CONSTRAINT "prototype_proje_smCreatedBy_id_7868d8292a8d9413_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_property prototype_prop_smModifiedBy_id_337037ab3a61b7e4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property
    ADD CONSTRAINT "prototype_prop_smModifiedBy_id_337037ab3a61b7e4_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_propertyequivalence prototype_prop_smOwningUser_id_1175c68843336fa1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT "prototype_prop_smOwningUser_id_1175c68843336fa1_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_property prototype_prop_smOwningUser_id_3a388957fd3ccacb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property
    ADD CONSTRAINT "prototype_prop_smOwningUser_id_3a388957fd3ccacb_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_property prototype_prope_smCreatedBy_id_3d4a79b4232ef35a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_property
    ADD CONSTRAINT "prototype_prope_smCreatedBy_id_3d4a79b4232ef35a_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_propertyequivalence prototype_prope_smCreatedBy_id_6c5d043c3c332ba0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT "prototype_prope_smCreatedBy_id_6c5d043c3c332ba0_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_propertyequivalence prototype_prope_smModifiedBy_id_30fce12b6e53f8a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_propertyequivalence
    ADD CONSTRAINT "prototype_prope_smModifiedBy_id_30fce12b6e53f8a_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototable prototype_prot_smModifiedBy_id_1b3c7e9577432c9f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototable
    ADD CONSTRAINT "prototype_prot_smModifiedBy_id_1b3c7e9577432c9f_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototype prototype_prot_smModifiedBy_id_31268273ce3210c5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype
    ADD CONSTRAINT "prototype_prot_smModifiedBy_id_31268273ce3210c5_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_protoversiontitle prototype_prot_smModifiedBy_id_4dacd19bc9079258_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_protoversiontitle
    ADD CONSTRAINT "prototype_prot_smModifiedBy_id_4dacd19bc9079258_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototype prototype_prot_smOwningUser_id_3347a2ac4b1a6e6a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype
    ADD CONSTRAINT "prototype_prot_smOwningUser_id_3347a2ac4b1a6e6a_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_protoversiontitle prototype_prot_smOwningUser_id_59e1e608e38bf611_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_protoversiontitle
    ADD CONSTRAINT "prototype_prot_smOwningUser_id_59e1e608e38bf611_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototype prototype_proto_smCreatedBy_id_4584b51621faa5db_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototype
    ADD CONSTRAINT "prototype_proto_smCreatedBy_id_4584b51621faa5db_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototable prototype_proto_smCreatedBy_id_7d21be32723f3f77_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototable
    ADD CONSTRAINT "prototype_proto_smCreatedBy_id_7d21be32723f3f77_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_protoversiontitle prototype_proto_smCreatedBy_id_7f588d36e403327e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_protoversiontitle
    ADD CONSTRAINT "prototype_proto_smCreatedBy_id_7f588d36e403327e_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_prototable prototype_proto_smOwningUser_id_c757007aa705bca_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_prototable
    ADD CONSTRAINT "prototype_proto_smOwningUser_id_c757007aa705bca_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_requirement r_refRequirement_id_5e18a8aec1e0750b_fk_rai01ref_requirement_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement
    ADD CONSTRAINT "r_refRequirement_id_5e18a8aec1e0750b_fk_rai01ref_requirement_id" FOREIGN KEY ("refRequirement_id") REFERENCES rai01ref_requirement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectartefact r_smOwningTeam_id_155efda441102062_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact
    ADD CONSTRAINT "r_smOwningTeam_id_155efda441102062_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact r_smOwningTeam_id_19306b6ee9018639_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT "r_smOwningTeam_id_19306b6ee9018639_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_source r_smOwningTeam_id_1fd420464edcdae1_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_source
    ADD CONSTRAINT "r_smOwningTeam_id_1fd420464edcdae1_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projet r_smOwningTeam_id_26803b03e141a5d6_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projet
    ADD CONSTRAINT "r_smOwningTeam_id_26803b03e141a5d6_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactsource r_smOwningTeam_id_299ba437ef26cbec_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource
    ADD CONSTRAINT "r_smOwningTeam_id_299ba437ef26cbec_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_requirement r_smOwningTeam_id_305325d76a3580c4_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement
    ADD CONSTRAINT "r_smOwningTeam_id_305325d76a3580c4_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactrequirement r_smOwningTeam_id_32f48233018ef6ad_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement
    ADD CONSTRAINT "r_smOwningTeam_id_32f48233018ef6ad_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_docattribute r_smOwningTeam_id_53c63900c2bd1eca_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_docattribute
    ADD CONSTRAINT "r_smOwningTeam_id_53c63900c2bd1eca_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcomposition r_smOwningTeam_id_5b2a31c5e01d229f_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition
    ADD CONSTRAINT "r_smOwningTeam_id_5b2a31c5e01d229f_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectcapacity r_smOwningTeam_id_617187fed61dc796_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity
    ADD CONSTRAINT "r_smOwningTeam_id_617187fed61dc796_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_doctype r_smOwningTeam_id_6c0b52228f15d651_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_doctype
    ADD CONSTRAINT "r_smOwningTeam_id_6c0b52228f15d651_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectrequirement ra_smOwningTeam_id_29f3fd3b0a58b5d_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement
    ADD CONSTRAINT "ra_smOwningTeam_id_29f3fd3b0a58b5d_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_capacity ra_smOwningTeam_id_ae30df4c9d9ec1e_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity
    ADD CONSTRAINT "ra_smOwningTeam_id_ae30df4c9d9ec1e_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcapacity ra_smOwningTeam_id_f4bc2700c802644_fk_protoLib_teamhierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity
    ADD CONSTRAINT "ra_smOwningTeam_id_f4bc2700c802644_fk_protoLib_teamhierarchy_id" FOREIGN KEY ("smOwningTeam_id") REFERENCES "protoLib_teamhierarchy"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactrequirement rai01_requirement_id_5f63e17cb033b1e_fk_rai01ref_requirement_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement
    ADD CONSTRAINT rai01_requirement_id_5f63e17cb033b1e_fk_rai01ref_requirement_id FOREIGN KEY (requirement_id) REFERENCES rai01ref_requirement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcomposition rai01r_containerArt_id_134f2b882920190e_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition
    ADD CONSTRAINT "rai01r_containerArt_id_134f2b882920190e_fk_rai01ref_artefact_id" FOREIGN KEY ("containerArt_id") REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_requirement rai01re_copyFrom_id_1bf153b1fc5581bf_fk_rai01ref_requirement_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement
    ADD CONSTRAINT "rai01re_copyFrom_id_1bf153b1fc5581bf_fk_rai01ref_requirement_id" FOREIGN KEY ("copyFrom_id") REFERENCES rai01ref_requirement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact rai01re_refArtefact_id_2fb50f708ef0ae16_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT "rai01re_refArtefact_id_2fb50f708ef0ae16_fk_rai01ref_artefact_id" FOREIGN KEY ("refArtefact_id") REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_capacity rai01re_refCapacity_id_12aa73f078d9ef54_fk_rai01ref_capacity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity
    ADD CONSTRAINT "rai01re_refCapacity_id_12aa73f078d9ef54_fk_rai01ref_capacity_id" FOREIGN KEY ("refCapacity_id") REFERENCES rai01ref_capacity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactsource rai01ref_a_artefact_id_33f7626c3050b502_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource
    ADD CONSTRAINT rai01ref_a_artefact_id_33f7626c3050b502_fk_rai01ref_artefact_id FOREIGN KEY (artefact_id) REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcapacity rai01ref_a_artefact_id_343405edcc8d6146_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity
    ADD CONSTRAINT rai01ref_a_artefact_id_343405edcc8d6146_fk_rai01ref_artefact_id FOREIGN KEY (artefact_id) REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactrequirement rai01ref_a_artefact_id_5715db5273723e69_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement
    ADD CONSTRAINT rai01ref_a_artefact_id_5715db5273723e69_fk_rai01ref_artefact_id FOREIGN KEY (artefact_id) REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact rai01ref_a_capacity_id_3986904ec0344cdc_fk_rai01ref_capacity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT rai01ref_a_capacity_id_3986904ec0344cdc_fk_rai01ref_capacity_id FOREIGN KEY (capacity_id) REFERENCES rai01ref_capacity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcapacity rai01ref_a_capacity_id_58451eab6598c2a1_fk_rai01ref_capacity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity
    ADD CONSTRAINT rai01ref_a_capacity_id_58451eab6598c2a1_fk_rai01ref_capacity_id FOREIGN KEY (capacity_id) REFERENCES rai01ref_capacity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact rai01ref_a_copyFrom_id_151016673e4f9d3e_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT "rai01ref_a_copyFrom_id_151016673e4f9d3e_fk_rai01ref_artefact_id" FOREIGN KEY ("copyFrom_id") REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcomposition rai01ref_a_inputArt_id_3bfc9bedeba30c47_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition
    ADD CONSTRAINT "rai01ref_a_inputArt_id_3bfc9bedeba30c47_fk_rai01ref_artefact_id" FOREIGN KEY ("inputArt_id") REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcomposition rai01ref_a_outputArt_id_c54f0ea2a671a9d_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition
    ADD CONSTRAINT "rai01ref_a_outputArt_id_c54f0ea2a671a9d_fk_rai01ref_artefact_id" FOREIGN KEY ("outputArt_id") REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact rai01ref_art_docType_id_4bf06eacbf168341_fk_rai01ref_doctype_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT "rai01ref_art_docType_id_4bf06eacbf168341_fk_rai01ref_doctype_id" FOREIGN KEY ("docType_id") REFERENCES rai01ref_doctype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactrequirement rai01ref_artef_smModifiedBy_id_20c5f29cdfd38041_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement
    ADD CONSTRAINT "rai01ref_artef_smModifiedBy_id_20c5f29cdfd38041_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactsource rai01ref_artef_smModifiedBy_id_38d41d71af1389a8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource
    ADD CONSTRAINT "rai01ref_artef_smModifiedBy_id_38d41d71af1389a8_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcapacity rai01ref_artef_smModifiedBy_id_5915e8d49beb3510_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity
    ADD CONSTRAINT "rai01ref_artef_smModifiedBy_id_5915e8d49beb3510_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcomposition rai01ref_artef_smModifiedBy_id_63e24f063a5654f3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition
    ADD CONSTRAINT "rai01ref_artef_smModifiedBy_id_63e24f063a5654f3_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactsource rai01ref_artef_smOwningUser_id_3dbe44b4ce251def_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource
    ADD CONSTRAINT "rai01ref_artef_smOwningUser_id_3dbe44b4ce251def_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcomposition rai01ref_artef_smOwningUser_id_5da8e956290ad7a2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition
    ADD CONSTRAINT "rai01ref_artef_smOwningUser_id_5da8e956290ad7a2_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcapacity rai01ref_artef_smOwningUser_id_641b0b024aa39107_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity
    ADD CONSTRAINT "rai01ref_artef_smOwningUser_id_641b0b024aa39107_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactrequirement rai01ref_artef_smOwningUser_id_7dcdaf21e8e9e9d6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement
    ADD CONSTRAINT "rai01ref_artef_smOwningUser_id_7dcdaf21e8e9e9d6_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactsource rai01ref_artef_source_id_69cf9377c4184302_fk_rai01ref_source_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource
    ADD CONSTRAINT rai01ref_artef_source_id_69cf9377c4184302_fk_rai01ref_source_id FOREIGN KEY (source_id) REFERENCES rai01ref_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactsource rai01ref_artefa_smCreatedBy_id_398e01f3fdd93182_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactsource
    ADD CONSTRAINT "rai01ref_artefa_smCreatedBy_id_398e01f3fdd93182_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactrequirement rai01ref_artefa_smCreatedBy_id_5ed408f4ebf3bae9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactrequirement
    ADD CONSTRAINT "rai01ref_artefa_smCreatedBy_id_5ed408f4ebf3bae9_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact rai01ref_artefa_smCreatedBy_id_6abc2460584d8a43_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT "rai01ref_artefa_smCreatedBy_id_6abc2460584d8a43_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcapacity rai01ref_artefa_smCreatedBy_id_701304e434ab17c6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcapacity
    ADD CONSTRAINT "rai01ref_artefa_smCreatedBy_id_701304e434ab17c6_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefactcomposition rai01ref_artefa_smCreatedBy_id_7202b8d8925dd2e3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefactcomposition
    ADD CONSTRAINT "rai01ref_artefa_smCreatedBy_id_7202b8d8925dd2e3_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact rai01ref_artefa_smOwningUser_id_3a71a779ee19d84_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT "rai01ref_artefa_smOwningUser_id_3a71a779ee19d84_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact rai01ref_artefac_smModifiedBy_id_39b9ab94729433_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT "rai01ref_artefac_smModifiedBy_id_39b9ab94729433_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_capacity rai01ref_c_copyFrom_id_67b2fd0354ec5019_fk_rai01ref_capacity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity
    ADD CONSTRAINT "rai01ref_c_copyFrom_id_67b2fd0354ec5019_fk_rai01ref_capacity_id" FOREIGN KEY ("copyFrom_id") REFERENCES rai01ref_capacity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_capacity rai01ref_cap_docType_id_753a338382232b24_fk_rai01ref_doctype_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity
    ADD CONSTRAINT "rai01ref_cap_docType_id_753a338382232b24_fk_rai01ref_doctype_id" FOREIGN KEY ("docType_id") REFERENCES rai01ref_doctype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_capacity rai01ref_capac_smModifiedBy_id_207a68b1b1873a76_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity
    ADD CONSTRAINT "rai01ref_capac_smModifiedBy_id_207a68b1b1873a76_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_capacity rai01ref_capac_smOwningUser_id_492e1e77f2f969a1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity
    ADD CONSTRAINT "rai01ref_capac_smOwningUser_id_492e1e77f2f969a1_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_capacity rai01ref_capaci_smCreatedBy_id_57ba9180534d31a0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_capacity
    ADD CONSTRAINT "rai01ref_capaci_smCreatedBy_id_57ba9180534d31a0_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_docattribute rai01ref_doca_docType_id_2234a13ba9087c4_fk_rai01ref_doctype_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_docattribute
    ADD CONSTRAINT "rai01ref_doca_docType_id_2234a13ba9087c4_fk_rai01ref_doctype_id" FOREIGN KEY ("docType_id") REFERENCES rai01ref_doctype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_docattribute rai01ref_docat_smOwningUser_id_19e16453cab91eb9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_docattribute
    ADD CONSTRAINT "rai01ref_docat_smOwningUser_id_19e16453cab91eb9_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_docattribute rai01ref_docatt_smModifiedBy_id_f4283ba890b1ea2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_docattribute
    ADD CONSTRAINT "rai01ref_docatt_smModifiedBy_id_f4283ba890b1ea2_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_docattribute rai01ref_docattr_smCreatedBy_id_c3cfd004660f548_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_docattribute
    ADD CONSTRAINT "rai01ref_docattr_smCreatedBy_id_c3cfd004660f548_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_doctype rai01ref_docty_smModifiedBy_id_4a08a26b6cd308a5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_doctype
    ADD CONSTRAINT "rai01ref_docty_smModifiedBy_id_4a08a26b6cd308a5_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_doctype rai01ref_docty_smOwningUser_id_65f1df21339d13d4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_doctype
    ADD CONSTRAINT "rai01ref_docty_smOwningUser_id_65f1df21339d13d4_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_doctype rai01ref_doctyp_smCreatedBy_id_7bdad2145b048b45_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_doctype
    ADD CONSTRAINT "rai01ref_doctyp_smCreatedBy_id_7bdad2145b048b45_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectartefact rai01ref_p_artefact_id_43acf1a2eefbb74c_fk_rai01ref_artefact_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact
    ADD CONSTRAINT rai01ref_p_artefact_id_43acf1a2eefbb74c_fk_rai01ref_artefact_id FOREIGN KEY (artefact_id) REFERENCES rai01ref_artefact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectcapacity rai01ref_p_capacity_id_70e960775af4517f_fk_rai01ref_capacity_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity
    ADD CONSTRAINT rai01ref_p_capacity_id_70e960775af4517f_fk_rai01ref_capacity_id FOREIGN KEY (capacity_id) REFERENCES rai01ref_capacity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectrequirement rai01ref_proje_projet_id_10987bfba93b645d_fk_rai01ref_projet_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement
    ADD CONSTRAINT rai01ref_proje_projet_id_10987bfba93b645d_fk_rai01ref_projet_id FOREIGN KEY (projet_id) REFERENCES rai01ref_projet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectcapacity rai01ref_proje_projet_id_19d450c0aff4776a_fk_rai01ref_projet_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity
    ADD CONSTRAINT rai01ref_proje_projet_id_19d450c0aff4776a_fk_rai01ref_projet_id FOREIGN KEY (projet_id) REFERENCES rai01ref_projet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projet rai01ref_proje_smModifiedBy_id_187be4a23b2e4a82_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projet
    ADD CONSTRAINT "rai01ref_proje_smModifiedBy_id_187be4a23b2e4a82_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectcapacity rai01ref_proje_smModifiedBy_id_5562113a64a7b842_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity
    ADD CONSTRAINT "rai01ref_proje_smModifiedBy_id_5562113a64a7b842_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectrequirement rai01ref_proje_smModifiedBy_id_630bd56c49a00e37_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement
    ADD CONSTRAINT "rai01ref_proje_smModifiedBy_id_630bd56c49a00e37_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projet rai01ref_proje_smOwningUser_id_258fb5416d40c219_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projet
    ADD CONSTRAINT "rai01ref_proje_smOwningUser_id_258fb5416d40c219_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectartefact rai01ref_proje_smOwningUser_id_764069d49dc4895b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact
    ADD CONSTRAINT "rai01ref_proje_smOwningUser_id_764069d49dc4895b_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectartefact rai01ref_projec_projet_id_b25698b89be9962_fk_rai01ref_projet_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact
    ADD CONSTRAINT rai01ref_projec_projet_id_b25698b89be9962_fk_rai01ref_projet_id FOREIGN KEY (projet_id) REFERENCES rai01ref_projet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectartefact rai01ref_projec_smCreatedBy_id_22d12833d807c534_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact
    ADD CONSTRAINT "rai01ref_projec_smCreatedBy_id_22d12833d807c534_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectcapacity rai01ref_projec_smCreatedBy_id_4878644e0edd02e8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity
    ADD CONSTRAINT "rai01ref_projec_smCreatedBy_id_4878644e0edd02e8_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectrequirement rai01ref_projec_smCreatedBy_id_538302d649883f21_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement
    ADD CONSTRAINT "rai01ref_projec_smCreatedBy_id_538302d649883f21_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectartefact rai01ref_projec_smModifiedBy_id_154f23e33ee8a0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectartefact
    ADD CONSTRAINT "rai01ref_projec_smModifiedBy_id_154f23e33ee8a0a_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectrequirement rai01ref_projec_smOwningUser_id_1cc1db0efda65e0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement
    ADD CONSTRAINT "rai01ref_projec_smOwningUser_id_1cc1db0efda65e0_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectcapacity rai01ref_projec_smOwningUser_id_a088e032c522c59_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectcapacity
    ADD CONSTRAINT "rai01ref_projec_smOwningUser_id_a088e032c522c59_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projet rai01ref_projet_smCreatedBy_id_7b53c427e6da5558_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projet
    ADD CONSTRAINT "rai01ref_projet_smCreatedBy_id_7b53c427e6da5558_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_requirement rai01ref_req_docType_id_3162a61ca03ed23e_fk_rai01ref_doctype_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement
    ADD CONSTRAINT "rai01ref_req_docType_id_3162a61ca03ed23e_fk_rai01ref_doctype_id" FOREIGN KEY ("docType_id") REFERENCES rai01ref_doctype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_requirement rai01ref_requi_smModifiedBy_id_471b397e32b51e70_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement
    ADD CONSTRAINT "rai01ref_requi_smModifiedBy_id_471b397e32b51e70_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_requirement rai01ref_requi_smOwningUser_id_34b22507a0dbc287_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement
    ADD CONSTRAINT "rai01ref_requi_smOwningUser_id_34b22507a0dbc287_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_requirement rai01ref_requir_smCreatedBy_id_5fdb1aee064c2746_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_requirement
    ADD CONSTRAINT "rai01ref_requir_smCreatedBy_id_5fdb1aee064c2746_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_source rai01ref_sourc_smModifiedBy_id_2c1a0e50d27c0f8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_source
    ADD CONSTRAINT "rai01ref_sourc_smModifiedBy_id_2c1a0e50d27c0f8b_fk_auth_user_id" FOREIGN KEY ("smModifiedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_source rai01ref_sourc_smOwningUser_id_68a7dac8843fc05c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_source
    ADD CONSTRAINT "rai01ref_sourc_smOwningUser_id_68a7dac8843fc05c_fk_auth_user_id" FOREIGN KEY ("smOwningUser_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_source rai01ref_source_smCreatedBy_id_68e3310f257b48eb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_source
    ADD CONSTRAINT "rai01ref_source_smCreatedBy_id_68e3310f257b48eb_fk_auth_user_id" FOREIGN KEY ("smCreatedBy_id") REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_artefact rai0_requirement_id_65727260b29aa890_fk_rai01ref_requirement_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_artefact
    ADD CONSTRAINT rai0_requirement_id_65727260b29aa890_fk_rai01ref_requirement_id FOREIGN KEY (requirement_id) REFERENCES rai01ref_requirement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rai01ref_projectrequirement rai0_requirement_id_760ba72b7795c8ec_fk_rai01ref_requirement_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY rai01ref_projectrequirement
    ADD CONSTRAINT rai0_requirement_id_760ba72b7795c8ec_fk_rai01ref_requirement_id FOREIGN KEY (requirement_id) REFERENCES rai01ref_requirement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prototype_diagram smVersion_id_1b4c7286c61439a_fk_prototype_protoversiontitle_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY prototype_diagram
    ADD CONSTRAINT "smVersion_id_1b4c7286c61439a_fk_prototype_protoversiontitle_id" FOREIGN KEY ("smVersion_id") REFERENCES prototype_protoversiontitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem tagg_content_type_id_2ce14ea135184c1b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT tagg_content_type_id_2ce14ea135184c1b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_298dfc57ddb4ecaf_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: rea_user
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_298dfc57ddb4ecaf_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

