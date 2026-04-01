--
-- PostgreSQL database dump
--

\restrict RLwY4C7UoW6cL51fPgKjz2H1rZB6tFxPJcOfSqPbhbpMs7H77Z0ctHRKcs2pHK9

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: user_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role AS ENUM (
    'user',
    'admin',
    'vendor',
    'consultant'
);


ALTER TYPE public.user_role OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    parent_id uuid,
    level integer NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    image_url text,
    description text,
    sort_order integer
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    type text,
    parent_id uuid,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT locations_type_check CHECK ((type = ANY (ARRAY['country'::text, 'state'::text, 'district'::text, 'taluka'::text, 'village'::text])))
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    description text,
    category_id uuid,
    location_id uuid,
    price numeric(12,2),
    is_price_on_request boolean DEFAULT false,
    status text DEFAULT 'active'::text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url text,
    rating numeric(2,1),
    quantity integer,
    CONSTRAINT products_status_check CHECK ((status = ANY (ARRAY['active'::text, 'inactive'::text, 'blocked'::text])))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    contact text NOT NULL,
    alternate_email text DEFAULT ''::text,
    alternate_contact text DEFAULT ''::text,
    address text DEFAULT ''::text,
    role public.user_role DEFAULT 'user'::public.user_role,
    gst_number text,
    password text NOT NULL,
    about text DEFAULT ''::text,
    dob date,
    profile_pic text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, slug, parent_id, level, is_active, created_at, image_url, description, sort_order) FROM stdin;
67213d0c-14fc-4362-a144-9ebfad605e1e	Fresh, Dried & Preserved Fruits	fresh-dried-preserved-fruits	9777dbdf-7d5f-4b0c-9ace-a00ee06ad57c	2	t	2026-01-23 10:20:06.44265	\N	\N	\N
c253297f-1c47-4378-bf7f-178437852a25	Electronics	electronics	\N	0	t	2026-01-23 10:04:34.837442	\N	\N	\N
8fc1d804-c150-4477-9ebe-f0ad3ee653cc	Plant Growth Promoters	plant-growth-promoters	025bb2d8-6896-4f15-9610-cac91799a071	2	t	2026-01-29 09:57:17.085403	plant-growth.jpg	\N	\N
f870451c-1c1f-47ed-a399-fa729d089999	Micronutrients	micronutrients	025bb2d8-6896-4f15-9610-cac91799a071	2	t	2026-01-29 09:57:17.085403	micronutrients.jpg	\N	\N
5d136073-8977-4f72-9e32-6e5026d78903	Soil Conditioners	soil-conditioners	025bb2d8-6896-4f15-9610-cac91799a071	2	t	2026-01-29 09:57:17.085403	soil-conditioners.jpg	\N	\N
d17b5d35-18e5-4bf0-accf-9741b35fd4e0	Fertilizer Kits	fertilizer-kits	025bb2d8-6896-4f15-9610-cac91799a071	2	t	2026-01-29 09:57:17.085403	fertilizer-kit.jpg	\N	\N
1e4d4ea5-9a60-4db1-b1dc-1453ecc89df5	Insecticides	insecticides	28c20908-d95a-458b-a69d-9fea3c5fdc07	2	t	2026-01-29 09:58:58.064022	insecticides.jpg	\N	\N
c20e5bb0-b85e-423a-921d-780e14a0d45f	Broccoli	broccoli	20242443-962d-431b-af63-78e285f0d185	3	t	2026-01-23 10:21:07.675273	\N	\N	\N
0be784d7-5a61-4401-bd23-4ff94938275c	Zucchini	zucchini	20242443-962d-431b-af63-78e285f0d185	3	t	2026-01-23 10:21:07.675273	\N	\N	\N
2cd2f91c-7f9d-479a-9122-96ddbfc8703d	Bell Peppers	bell-peppers	20242443-962d-431b-af63-78e285f0d185	3	t	2026-01-23 10:21:07.675273	\N	\N	\N
cfff414a-0305-4d98-9e61-bddc210c209b	Tomato	tomato	3c4e1810-e328-4a62-a4f5-974f4c6fbc84	3	t	2026-01-23 10:21:28.571819	\N	\N	\N
0428273c-2449-40ab-be05-99e37cb126e0	Carrot	carrot	3c4e1810-e328-4a62-a4f5-974f4c6fbc84	3	t	2026-01-23 10:21:28.571819	\N	\N	\N
0b9f8e3d-b7e6-420b-8882-feabc26094fb	Cucumber	cucumber	3c4e1810-e328-4a62-a4f5-974f4c6fbc84	3	t	2026-01-23 10:21:28.571819	\N	\N	\N
21f88023-47f2-40eb-a0c1-17dabbf8f0ca	Apple	apple	67213d0c-14fc-4362-a144-9ebfad605e1e	3	t	2026-01-23 10:21:47.59872	\N	\N	\N
8a7d2617-0301-4ded-9f09-58945531b6be	Banana	banana	67213d0c-14fc-4362-a144-9ebfad605e1e	3	t	2026-01-23 10:21:47.59872	\N	\N	\N
6d81e8d6-60f5-4130-8990-61d58a6fe4d7	Mango	mango	67213d0c-14fc-4362-a144-9ebfad605e1e	3	t	2026-01-23 10:21:47.59872	\N	\N	\N
27a929ab-7e1f-4419-baf6-73f5cd8da3fb	Almonds	almonds	49273d26-e3a5-4bf7-9a0a-810ce0d104c6	3	t	2026-01-23 10:21:56.66242	\N	\N	\N
0ff51581-2be8-457a-b20b-8310612053c3	Cashew Nuts	cashew-nuts	49273d26-e3a5-4bf7-9a0a-810ce0d104c6	3	t	2026-01-23 10:21:56.66242	\N	\N	\N
37d44475-cbe7-4467-bfbd-707e1ccf7473	Walnuts	walnuts	49273d26-e3a5-4bf7-9a0a-810ce0d104c6	3	t	2026-01-23 10:21:56.66242	\N	\N	\N
9115c8dd-6bc1-43d2-af34-424258b05539	Spinach	spinach	9226ab50-5b70-4f11-b47e-11e70e41b332	3	t	2026-01-23 10:22:05.990601	\N	\N	\N
343df8ae-3e45-42df-9eec-01d767dd76b3	Lettuce	lettuce	9226ab50-5b70-4f11-b47e-11e70e41b332	3	t	2026-01-23 10:22:05.990601	\N	\N	\N
94db5df1-c4e9-4020-9126-5b2034ee69fb	Kale	kale	9226ab50-5b70-4f11-b47e-11e70e41b332	3	t	2026-01-23 10:22:05.990601	\N	\N	\N
782b34ea-6883-4fa9-b0f3-31ec98ad95d6	Dragon Fruit	dragon-fruit	2dcff806-25aa-4c98-8df8-84129d8a8fc8	3	t	2026-01-23 10:22:15.180165	\N	\N	\N
efa572a4-358a-4d28-99c8-d8cbd6561f58	Kiwi	kiwi	2dcff806-25aa-4c98-8df8-84129d8a8fc8	3	t	2026-01-23 10:22:15.180165	\N	\N	\N
07c741f1-1792-4c8e-be93-ce64f574416b	Avocado	avocado	2dcff806-25aa-4c98-8df8-84129d8a8fc8	3	t	2026-01-23 10:22:15.180165	\N	\N	\N
9777dbdf-7d5f-4b0c-9ace-a00ee06ad57c	Fruits & Vegetables	fruits-vegetables	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-23 10:15:45.634962	https://your-cdn.com/images/fruits-vegetables.jpg	Fresh and high-quality fruits and vegetables	\N
424cfd80-0d22-4812-900e-c9202632a474	Seeds & Planting	seeds-planting	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:44:34.538478	seed-planting.jpg	High-quality seeds for different crops and planting needs.	\N
025bb2d8-6896-4f15-9610-cac91799a071	Fertilizers & Soil Enhancers	fertilizers-soil-enhancers	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:44:48.208774	soil-fertilizers.jpg	Boost crop yield with the right fertilizers and soil enhancers.	\N
28c20908-d95a-458b-a69d-9fea3c5fdc07	Crop Protection	crop-protection	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:45:00.352341	crop-protection.jpg	Protect crops from pests, diseases, and weeds.	\N
b008f016-2c22-411c-a25a-bd1507147b9d	Farming Equipment	farming-equipment	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:45:12.009572	farming-equipment.jpg	Modern equipment to make farming easier and more efficient.	\N
e674d7a7-9dfd-44fd-baf7-5313123c4cad	Irrigation & Water Management	irrigation-water-management	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:45:26.284164	irrigation.jpg	Save water and ensure efficient irrigation solutions.	\N
bc3ef80f-312f-4cdc-925a-22b570147160	Animal Husbandry	animal-husbandry	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:45:37.736229	animal-husbandry.jpg	Quality products for livestock care and management.	\N
5cc7bba4-5105-46bd-a649-37c45f3fe4fe	Horticulture	horticulture	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:45:47.971761	horticulture.jpg	Everything you need for gardening and horticulture.	\N
6d3c5b94-fa9e-4453-a1cc-570ca25863ef	Agri Services	agri-services	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:45:58.995939	agri-services.jpg	Professional services for modern farming.	\N
6103c5a9-ea9c-46e5-a99a-48daf9502d65	Agri Marketplace	agri-marketplace	c2258a40-8f69-4283-9ee0-be364a651778	1	t	2026-01-29 09:46:12.037348	agri-products.jpg	Buy and sell agricultural products online.	\N
be0b5595-dfb5-48a5-8e96-7aa8c21a546b	Fungicides	fungicides	28c20908-d95a-458b-a69d-9fea3c5fdc07	2	t	2026-01-29 09:58:58.064022	fungicides.jpg	\N	\N
06c163e9-2782-404a-9a9c-011bbdf61165	Tomato	tomato-seed	543e7ca1-a421-4438-8dda-487284626ad5	3	t	2026-01-29 09:46:37.473248	\N	\N	\N
d8790905-1f50-4858-921e-1ab2f298a8ea	Onion	onion-seed	543e7ca1-a421-4438-8dda-487284626ad5	3	t	2026-01-29 09:46:37.473248	\N	\N	\N
a9ae32b9-a72e-4850-84c8-fe45a94ee0ae	Chilli	chilli-seed	543e7ca1-a421-4438-8dda-487284626ad5	3	t	2026-01-29 09:46:37.473248	\N	\N	\N
a687943b-1502-411c-8a17-02726dfc3fbf	Herbicides	herbicides	28c20908-d95a-458b-a69d-9fea3c5fdc07	2	t	2026-01-29 09:58:58.064022	herbicides.jpg	\N	\N
bbe4818e-2919-4104-b371-fdfb88979064	Biopesticides	biopesticides	28c20908-d95a-458b-a69d-9fea3c5fdc07	2	t	2026-01-29 09:58:58.064022	biopesticides.jpg	\N	\N
e0037243-d762-4a1a-9a03-8ca13d790bda	Rodenticides	rodenticides	28c20908-d95a-458b-a69d-9fea3c5fdc07	2	t	2026-01-29 09:58:58.064022	rodenticides.jpg	\N	\N
4ada184a-2ab8-41af-8223-772b0c639f91	Weed Control Kits	weed-control-kits	28c20908-d95a-458b-a69d-9fea3c5fdc07	2	t	2026-01-29 09:58:58.064022	weed-control.jpg	\N	\N
feea7a0f-effb-4e9a-86c0-f8fea7ff0a70	Tractors	tractors	b008f016-2c22-411c-a25a-bd1507147b9d	2	t	2026-01-29 10:00:21.227514	tractors.jpg	\N	\N
964f2d40-7e3a-486c-8dfa-1b55e2b07980	Mango	mango-seed	57da0d63-f356-41ac-a68d-1a25bf4595a8	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
3079be3d-9191-4b06-b12d-c3c349ed7976	Papaya	papaya-seed	57da0d63-f356-41ac-a68d-1a25bf4595a8	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
45af7cd6-54ff-4241-b903-ddb7d14b737a	Banana	banana-seed	57da0d63-f356-41ac-a68d-1a25bf4595a8	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
8a47346b-4be9-4afa-8584-e49ee25f94d1	Hybrid Paddy	hybrid-paddy	3f44226d-b9bf-4bca-92ca-943cc1847fde	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
7f97bd56-dff1-4de9-92ab-f0adae4a1d02	Hybrid Maize	hybrid-maize	3f44226d-b9bf-4bca-92ca-943cc1847fde	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
a136eae0-5cec-4742-a775-09d0c2c5e542	Hybrid Cotton	hybrid-cotton	3f44226d-b9bf-4bca-92ca-943cc1847fde	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
01642167-307a-4f5e-b41d-a16bb8607a21	Basil	basil-seed	6816d16b-2de7-4197-a384-ae67d509f347	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
b84e305b-5fb5-426c-a528-dd57a31b5787	Coriander	coriander-seed	6816d16b-2de7-4197-a384-ae67d509f347	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
21bc7476-3646-4894-a430-f120bfdc67fb	Mint	mint-seed	6816d16b-2de7-4197-a384-ae67d509f347	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
edfd77a4-e68f-4450-b547-94f2363f85c0	Marigold	marigold-seed	6c1bfc55-2531-469c-9221-b3fb719db78b	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
63519859-4041-4f14-a283-340bb8abd2d7	Sunflower	sunflower-seed	6c1bfc55-2531-469c-9221-b3fb719db78b	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
e286f1b1-495f-4733-b350-1603a3905f20	Rose	rose-seed	6c1bfc55-2531-469c-9221-b3fb719db78b	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
573bd098-cf6c-4954-9668-1cc65868325f	Bermuda	bermuda-grass	1fbc2204-3ec5-4637-b19d-a7084b5da771	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
1f35c03e-ac4e-4b7a-8d29-373a92985a75	Fescue	fescue-grass	1fbc2204-3ec5-4637-b19d-a7084b5da771	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
c8de8c8e-1bef-4423-b69d-3f4c9bbfc9cd	Ryegrass	ryegrass	1fbc2204-3ec5-4637-b19d-a7084b5da771	3	t	2026-01-29 09:55:31.107779	\N	\N	\N
d67d415d-22ac-46a3-9236-8a94b014ceec	Power Tillers	power-tillers	b008f016-2c22-411c-a25a-bd1507147b9d	2	t	2026-01-29 10:00:21.227514	power-tillers.jpg	\N	\N
e73b9d19-beb8-4390-9d2b-0b2feaf08462	Irrigation Tools	irrigation-tools	b008f016-2c22-411c-a25a-bd1507147b9d	2	t	2026-01-29 10:00:21.227514	irrigation-tools.jpg	\N	\N
83bb0de6-aa2b-4d8a-9474-92cf599b47e2	Harvesters	harvesters	b008f016-2c22-411c-a25a-bd1507147b9d	2	t	2026-01-29 10:00:21.227514	harvesters.jpg	\N	\N
7f60c41c-c522-4815-9cc1-870b15c9d651	Sprayers	sprayers	b008f016-2c22-411c-a25a-bd1507147b9d	2	t	2026-01-29 10:00:21.227514	sprayers.jpg	\N	\N
1cb3f877-a9f7-4067-9ab3-c8574e789161	Farm Accessories	farm-accessories	b008f016-2c22-411c-a25a-bd1507147b9d	2	t	2026-01-29 10:00:21.227514	farm-accessories.jpg	\N	\N
4566f371-79a2-48b9-9fbc-e036b4361509	Drip Irrigation	drip-irrigation-systems	e674d7a7-9dfd-44fd-baf7-5313123c4cad	2	t	2026-01-29 10:01:19.921667	drip-irrigation.jpg	\N	\N
e6347387-b8a2-460a-8a4a-82ea3c0f1781	Urea	urea	30a9909c-4a60-4d89-8c20-9d071d1a39fb	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
5182c2de-7dd3-44f7-a3c7-d576b1d417f8	DAP	dap	30a9909c-4a60-4d89-8c20-9d071d1a39fb	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
a380707b-d8e5-48ef-a6f2-cf8b1ab3e0d7	Potash	potash	30a9909c-4a60-4d89-8c20-9d071d1a39fb	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
417c8dde-bb9a-41db-b0a5-26ffc78386d0	Compost	compost	e60e7a75-ef8c-4c59-a0f8-23a8ac69d8c6	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
e1bf7e79-9768-4c99-88b1-c17a095ecc04	Vermicompost	vermicompost	e60e7a75-ef8c-4c59-a0f8-23a8ac69d8c6	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
5609ffc8-0a6f-46d2-871d-e05a5257b047	Manure	manure	e60e7a75-ef8c-4c59-a0f8-23a8ac69d8c6	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
ca6d4fbe-acff-432c-a245-0b5502577fe2	Hormones	plant-hormones	8fc1d804-c150-4477-9ebe-f0ad3ee653cc	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
d25afed6-2ec2-453c-a173-328f4eef64d1	Bio-stimulants	bio-stimulants	8fc1d804-c150-4477-9ebe-f0ad3ee653cc	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
02fabe05-3053-4520-940f-b18ec87c6bc3	Foliar Sprays	foliar-sprays	8fc1d804-c150-4477-9ebe-f0ad3ee653cc	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
fd792205-0ef1-44ba-b73e-624e52d20d53	Iron	iron-nutrient	f870451c-1c1f-47ed-a399-fa729d089999	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
015e03ee-9aa5-446d-ae73-c04a2a21a4a2	Zinc	zinc-nutrient	f870451c-1c1f-47ed-a399-fa729d089999	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
4aab6be2-ba77-4e81-97a9-f6c35c12512c	Manganese	manganese-nutrient	f870451c-1c1f-47ed-a399-fa729d089999	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
1a361b38-a0bf-4e17-b023-f2ccab2e029a	Gypsum	gypsum	5d136073-8977-4f72-9e32-6e5026d78903	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
63de55af-bfcf-4da0-beab-fb9d806a9816	Lime	lime	5d136073-8977-4f72-9e32-6e5026d78903	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
466b11d1-57f2-496a-b82b-e6b7a86df45c	Humic Acid	humic-acid	5d136073-8977-4f72-9e32-6e5026d78903	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
9b7e3b28-c8da-4feb-87ff-120855ce3aa9	Starter Kit	starter-kit	d17b5d35-18e5-4bf0-accf-9741b35fd4e0	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
1d01a769-97b7-488e-8fa8-05f77376cd98	Grow Kit	grow-kit	d17b5d35-18e5-4bf0-accf-9741b35fd4e0	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
b4d4f50f-d538-4e41-b97f-2d3175d25753	Flowering Kit	flowering-kit	d17b5d35-18e5-4bf0-accf-9741b35fd4e0	3	t	2026-01-29 09:57:44.556796	\N	\N	\N
cf6f5a44-8475-4829-889d-f9d395570723	Sprinkler Systems	sprinkler-systems	e674d7a7-9dfd-44fd-baf7-5313123c4cad	2	t	2026-01-29 10:01:19.921667	sprinkler.jpg	\N	\N
b6892c2d-2866-41b7-9481-646fdaabe1a2	Water Storage	water-storage	e674d7a7-9dfd-44fd-baf7-5313123c4cad	2	t	2026-01-29 10:01:19.921667	water-storage.jpg	\N	\N
be800aac-d8cd-43b4-9e95-6aac5b87b19c	Pipes & Fittings	pipes-fittings	e674d7a7-9dfd-44fd-baf7-5313123c4cad	2	t	2026-01-29 10:01:19.921667	pipes-fittings.jpg	\N	\N
3cf089a4-b9d9-4cdc-8bb7-66997899f170	Water Filters	water-filters	e674d7a7-9dfd-44fd-baf7-5313123c4cad	2	t	2026-01-29 10:01:19.921667	water-filters.jpg	\N	\N
1ee9517b-b5be-440a-b66a-6c22ac3ba46a	Cattle Feed	cattle-feed	bc3ef80f-312f-4cdc-925a-22b570147160	2	t	2026-01-29 10:04:22.434007	cattlefeed.jpg	\N	\N
d9a2fd5b-f0a7-44b4-9913-8547c45cb747	Poultry Feed	poultry-feed	bc3ef80f-312f-4cdc-925a-22b570147160	2	t	2026-01-29 10:04:22.434007	poultryfood.jpg	\N	\N
621bfbbb-ce6d-4ec2-99bc-9ae6a87c47bb	Neem Oil	neem-oil	1e4d4ea5-9a60-4db1-b1dc-1453ecc89df5	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
85a6b3b3-bad3-4b82-ac1f-4f520908dc69	Chlorpyrifos	chlorpyrifos	1e4d4ea5-9a60-4db1-b1dc-1453ecc89df5	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
76a50419-cf10-436d-bb49-faa051f39295	Imidacloprid	imidacloprid	1e4d4ea5-9a60-4db1-b1dc-1453ecc89df5	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
92bcb9c2-6314-424b-9677-26c211ab51a7	Sulphur	sulphur	be0b5595-dfb5-48a5-8e96-7aa8c21a546b	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
879f32d3-7f3b-42e6-bf90-bad9bfe2009d	Mancozeb	mancozeb	be0b5595-dfb5-48a5-8e96-7aa8c21a546b	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
2a754e32-0b83-410c-bde4-c82172cea3a6	Tricyclazole	tricyclazole	be0b5595-dfb5-48a5-8e96-7aa8c21a546b	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
aa935513-d81a-4c70-b979-82e68ed18cce	Glyphosate	glyphosate	a687943b-1502-411c-8a17-02726dfc3fbf	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
5c46f628-aa8f-4b2f-97a0-804032923bac	Paraquat	paraquat	a687943b-1502-411c-8a17-02726dfc3fbf	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
fceb51b6-e988-43df-9a1f-8fe32a7dcf56	Atrazine	atrazine	a687943b-1502-411c-8a17-02726dfc3fbf	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
0242cb16-11d9-46a1-9ef5-75116871bb19	Bt	bt	bbe4818e-2919-4104-b371-fdfb88979064	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
f72431df-a80f-4e40-914b-e7210dba4292	Trichoderma	trichoderma	bbe4818e-2919-4104-b371-fdfb88979064	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
69d51da8-71a4-4972-8832-02a29b3b3dad	Pseudomonas	pseudomonas	bbe4818e-2919-4104-b371-fdfb88979064	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
82089fdb-99dc-4f97-8401-44e9ccfe7f3b	Zinc Phosphide	zinc-phosphide	e0037243-d762-4a1a-9a03-8ca13d790bda	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
06303538-5baa-46a4-a40a-a50a7a2371c1	Bromadiolone	bromadiolone	e0037243-d762-4a1a-9a03-8ca13d790bda	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
64ed3fb8-969e-4c52-840e-6f545dfe6708	Coumatetralyl	coumatetralyl	e0037243-d762-4a1a-9a03-8ca13d790bda	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
66b7a434-90ba-44d5-ba9a-dff3e80e21c9	Weeder Spray Kit	weeder-spray-kit	4ada184a-2ab8-41af-8223-772b0c639f91	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
d544f718-1bcd-451a-aae2-e48caed9a4dd	Herbicide Pack	herbicide-pack	4ada184a-2ab8-41af-8223-772b0c639f91	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
8b53fab6-32f1-4623-a76f-1185be37c284	Knapsack Kit	knapsack-kit	4ada184a-2ab8-41af-8223-772b0c639f91	3	t	2026-01-29 09:59:13.69059	\N	\N	\N
25827e2e-8f22-4133-9240-4bb5b8ab5d15	Veterinary Medicines	veterinary-medicines	bc3ef80f-312f-4cdc-925a-22b570147160	2	t	2026-01-29 10:04:22.434007	vetenarymedichine.jpg	\N	\N
ffa78942-dec4-469e-8516-35799e310aae	Dairy Equipment	dairy-equipment	bc3ef80f-312f-4cdc-925a-22b570147160	2	t	2026-01-29 10:04:22.434007	dairyequipment.jpg	\N	\N
e96f0524-606d-4bf1-9258-a24c4c3a44ba	Housing & Fencing	housing-fencing	bc3ef80f-312f-4cdc-925a-22b570147160	2	t	2026-01-29 10:04:22.434007	fencing.jpg	\N	\N
f45cb187-5b57-4406-9e7d-325e82d5fdad	Health Care Kits	health-care-kits	bc3ef80f-312f-4cdc-925a-22b570147160	2	t	2026-01-29 10:04:22.434007	healthkit.jpg	\N	\N
f0b49773-9d10-4fa1-b74a-1be136fde14b	Nursery Plants	nursery-plants	5cc7bba4-5105-46bd-a649-37c45f3fe4fe	2	t	2026-01-29 10:07:02.050119	nursery.jpg	\N	\N
6c79ea8d-5388-4ccd-84fa-5468690a97c2	Mini Tractor	mini-tractor	feea7a0f-effb-4e9a-86c0-f8fea7ff0a70	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
6bea4536-9918-42df-8ede-180df903e855	Utility Tractor	utility-tractor	feea7a0f-effb-4e9a-86c0-f8fea7ff0a70	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
7fe60879-1773-4a85-a6fd-bfc5b7b0ea64	Heavy Tractor	heavy-tractor	feea7a0f-effb-4e9a-86c0-f8fea7ff0a70	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
93fb2483-9281-4d6b-9f67-2f53a5569236	2-Wheel Tiller	2-wheel-tiller	d67d415d-22ac-46a3-9236-8a94b014ceec	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
050e5047-6336-49f5-8583-56e79aaff67b	Rotary Tiller	rotary-tiller	d67d415d-22ac-46a3-9236-8a94b014ceec	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
f893c214-f009-4946-95b6-44ad2072177f	Cultivator	cultivator	d67d415d-22ac-46a3-9236-8a94b014ceec	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
6928641b-96e9-488b-a60c-61b5aaecc807	Sprinklers	sprinklers	e73b9d19-beb8-4390-9d2b-0b2feaf08462	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
2d6f3e9b-e80d-4ce2-902f-7f8517f8e56b	Drip Irrigation	drip-irrigation	e73b9d19-beb8-4390-9d2b-0b2feaf08462	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
e7f84c9c-2a32-4dce-8f50-6a9a30ce6562	Pipes	pipes	e73b9d19-beb8-4390-9d2b-0b2feaf08462	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
97dd2496-f094-4e64-b728-a35dc524833b	Combine Harvester	combine-harvester	83bb0de6-aa2b-4d8a-9474-92cf599b47e2	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
a00a1cea-62b7-4b61-b6d5-38bd6b746338	Reaper	reaper	83bb0de6-aa2b-4d8a-9474-92cf599b47e2	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
74e7f522-4f7c-40e8-943f-f2f9465d5ad6	Thresher	thresher	83bb0de6-aa2b-4d8a-9474-92cf599b47e2	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
d22c880f-31cc-499f-abc7-8da9f76cf0ea	Hand Sprayer	hand-sprayer	7f60c41c-c522-4815-9cc1-870b15c9d651	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
32a7c7d6-c7bb-40c5-aa98-5b23a25726d3	Knapsack Sprayer	knapsack-sprayer	7f60c41c-c522-4815-9cc1-870b15c9d651	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
90a1e56f-675b-4a41-bc56-0ec0f636e729	Power Sprayer	power-sprayer	7f60c41c-c522-4815-9cc1-870b15c9d651	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
df8bec9f-46ae-4eee-a9ca-2080b965d790	Plough	plough	1cb3f877-a9f7-4067-9ab3-c8574e789161	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
42ab1957-e64c-444f-86b3-040dabd4c73a	Seed Drill	seed-drill	1cb3f877-a9f7-4067-9ab3-c8574e789161	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
ad2d4f35-963c-4abd-a4b2-bde50be123f2	Weeders	weeders	1cb3f877-a9f7-4067-9ab3-c8574e789161	3	t	2026-01-29 10:00:35.375834	\N	\N	\N
81441dcb-d54e-4bdc-aa2c-d553ad90a6a3	Garden Tools	garden-tools	5cc7bba4-5105-46bd-a649-37c45f3fe4fe	2	t	2026-01-29 10:07:02.050119	garden-tool.jpg	\N	\N
35646dcb-94b6-4c59-9609-60acbb5c4576	Pottery & Grow Bags	pottery-grow-bags	5cc7bba4-5105-46bd-a649-37c45f3fe4fe	2	t	2026-01-29 10:07:02.050119	pottery.jpg	\N	\N
17702648-d183-4b61-bfa2-d18ef830ac5d	Landscaping	landscaping	5cc7bba4-5105-46bd-a649-37c45f3fe4fe	2	t	2026-01-29 10:07:02.050119	landscape.jpg	\N	\N
767a0233-fc25-4f24-b385-324f143358ba	Plant Care Products	plant-care-products	5cc7bba4-5105-46bd-a649-37c45f3fe4fe	2	t	2026-01-29 10:07:02.050119	plantcare.jpg	\N	\N
891ea87d-a0fa-47b6-8f7a-3d3981a34669	Decor Items	decor-items	5cc7bba4-5105-46bd-a649-37c45f3fe4fe	2	t	2026-01-29 10:07:02.050119	decor.jpg	\N	\N
b88c7ca6-7842-456a-b8ec-af87caae83f3	Drip Kits	drip-kits	4566f371-79a2-48b9-9fbc-e036b4361509	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
6ecd10ef-43d0-4fb9-9c36-fc278485ee5b	Emitters	emitters	4566f371-79a2-48b9-9fbc-e036b4361509	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
c3f2740c-ee16-434c-aea5-deeb7abda242	Pipes	drip-pipes	4566f371-79a2-48b9-9fbc-e036b4361509	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
4ce91e4e-38bd-42c0-bd2c-051bfaf61d0a	Mini Sprinklers	mini-sprinklers	cf6f5a44-8475-4829-889d-f9d395570723	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
7e4661ef-d489-4742-ba7f-aaf382d39b39	Impact Sprinklers	impact-sprinklers	cf6f5a44-8475-4829-889d-f9d395570723	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
48141de0-a47d-441e-ae02-fc1e18f55906	Rain Guns	rain-guns	cf6f5a44-8475-4829-889d-f9d395570723	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
dcdc0437-8188-408f-9bf2-06a131c34e4f	Centrifugal Pump	centrifugal-pump	7fa00414-8b4e-46a5-9c75-7130b448f9c8	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
3593938a-babf-488e-8273-791d5dccbfb3	Submersible Pump	submersible-pump	7fa00414-8b4e-46a5-9c75-7130b448f9c8	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
9eb98ac4-b85b-4da8-a9cd-7c337a6e3570	Solar Pump	solar-pump	7fa00414-8b4e-46a5-9c75-7130b448f9c8	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
ae714e7a-4cba-4a71-805a-f384e5664e4a	Tanks	water-tanks	b6892c2d-2866-41b7-9481-646fdaabe1a2	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
fdb48cd4-7d7e-49ff-a37e-d118fc4164e9	Ponds	ponds	b6892c2d-2866-41b7-9481-646fdaabe1a2	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
cfbc2d95-b595-4069-9381-6aab62fab5d5	Reservoirs	reservoirs	b6892c2d-2866-41b7-9481-646fdaabe1a2	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
34a4bbba-4537-4a3f-95a3-b4f19f05b61c	PVC Pipes	pvc-pipes	be800aac-d8cd-43b4-9e95-6aac5b87b19c	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
0b1cff67-f020-4a7d-8100-26c38f3b22cd	HDPE Pipes	hdpe-pipes	be800aac-d8cd-43b4-9e95-6aac5b87b19c	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
8248e86d-e5ae-4167-af00-e51bb1fe605c	Couplers	couplers	be800aac-d8cd-43b4-9e95-6aac5b87b19c	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
e39c90f2-716c-44cc-81d4-4cf0e3f12c94	Sand Filter	sand-filter	3cf089a4-b9d9-4cdc-8bb7-66997899f170	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
ada88f9a-d5c6-4d9e-b341-6c30a210ec05	Screen Filter	screen-filter	3cf089a4-b9d9-4cdc-8bb7-66997899f170	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
1e3d5996-8964-4a82-b7e1-494d75209d44	Disc Filter	disc-filter	3cf089a4-b9d9-4cdc-8bb7-66997899f170	3	t	2026-01-29 10:01:37.062207	\N	\N	\N
03564302-1234-4d93-b12d-5ae9e96b04f5	Soil Testing	soil-testing	6d3c5b94-fa9e-4453-a1cc-570ca25863ef	2	t	2026-01-29 10:09:04.995144	soil-testing.jpg	\N	\N
a12f9be0-8ecf-4c02-87f2-70ceed88eb1d	Drone Spraying	drone-spraying	6d3c5b94-fa9e-4453-a1cc-570ca25863ef	2	t	2026-01-29 10:09:04.995144	drone.jpg	\N	\N
cfce0c96-e7dd-41f2-bcef-bfa1f61d405e	Farm Consultancy	farm-consultancy	6d3c5b94-fa9e-4453-a1cc-570ca25863ef	2	t	2026-01-29 10:09:04.995144	consultancy.jpg	\N	\N
f4599c9e-318b-4668-916b-be7403b53b44	Machinery Rental	machinery-rental	6d3c5b94-fa9e-4453-a1cc-570ca25863ef	2	t	2026-01-29 10:09:04.995144	rental.jpg	\N	\N
e38aeff9-55fd-40eb-a236-d61aadf1ae23	Training Programs	training-programs	6d3c5b94-fa9e-4453-a1cc-570ca25863ef	2	t	2026-01-29 10:09:04.995144	training.jpg	\N	\N
9f69cfba-d8a4-4bd6-ab6a-4e6ade30615c	Insurance Services	insurance-services	6d3c5b94-fa9e-4453-a1cc-570ca25863ef	2	t	2026-01-29 10:09:04.995144	insurance.jpg	\N	\N
b9e5b466-94fc-4f97-a242-33cb83b5e2b4	Dairy Feed	dairy-feed	1ee9517b-b5be-440a-b66a-6c22ac3ba46a	3	t	2026-01-29 10:04:37.549136	\N	\N	\N
0a2dc2eb-89df-4a74-9e40-5d9fdc0e079b	Calf Starter	calf-starter	1ee9517b-b5be-440a-b66a-6c22ac3ba46a	3	t	2026-01-29 10:04:37.549136	\N	\N	\N
8f112c0f-50cc-4671-a91c-230f5c4f8285	Mineral Mixture	mineral-mixture	1ee9517b-b5be-440a-b66a-6c22ac3ba46a	3	t	2026-01-29 10:04:37.549136	\N	\N	\N
09cd7809-3780-457e-bd9b-45aaf986be76	Broiler Feed	broiler-feed	d9a2fd5b-f0a7-44b4-9913-8547c45cb747	3	t	2026-01-29 10:04:50.992407	\N	\N	\N
c5103913-80be-4d7b-8ec2-8b4aba17db25	Layer Feed	layer-feed	d9a2fd5b-f0a7-44b4-9913-8547c45cb747	3	t	2026-01-29 10:04:50.992407	\N	\N	\N
7b713b64-65d9-455d-b25e-afdf0a53499a	Chick Starter	chick-starter	d9a2fd5b-f0a7-44b4-9913-8547c45cb747	3	t	2026-01-29 10:04:50.992407	\N	\N	\N
ebff20c9-56c2-422c-8f78-566ff8346103	Dewormers	dewormers	25827e2e-8f22-4133-9240-4bb5b8ab5d15	3	t	2026-01-29 10:05:02.669565	\N	\N	\N
123a2775-4ed4-4ec7-b73f-14ff927fa45f	Antibiotics	antibiotics	25827e2e-8f22-4133-9240-4bb5b8ab5d15	3	t	2026-01-29 10:05:02.669565	\N	\N	\N
063a35f4-4e45-41d6-8568-4bdb4215a978	Supplements	supplements	25827e2e-8f22-4133-9240-4bb5b8ab5d15	3	t	2026-01-29 10:05:02.669565	\N	\N	\N
db17129d-20b4-4794-a1a2-17520d8e1a9e	Milking Machine	milking-machine	ffa78942-dec4-469e-8516-35799e310aae	3	t	2026-01-29 10:05:14.673159	\N	\N	\N
62fb76dc-4c55-48aa-afcb-6b4eb6c9e2f6	Chilling Unit	chilling-unit	ffa78942-dec4-469e-8516-35799e310aae	3	t	2026-01-29 10:05:14.673159	\N	\N	\N
05732d88-9c98-4144-997e-cb05f251cc03	Milk Can	milk-can	ffa78942-dec4-469e-8516-35799e310aae	3	t	2026-01-29 10:05:14.673159	\N	\N	\N
6c6d9f60-43ad-4e91-a275-334d82f620ec	Barbed Wire	barbed-wire	e96f0524-606d-4bf1-9258-a24c4c3a44ba	3	t	2026-01-29 10:05:37.586609	\N	\N	\N
09f0d076-09a1-48c3-8f87-39da0686da05	Electric Fencing	electric-fencing	e96f0524-606d-4bf1-9258-a24c4c3a44ba	3	t	2026-01-29 10:05:37.586609	\N	\N	\N
2c81ee42-9995-4a01-8eda-3d498fda67a8	Netting	netting	e96f0524-606d-4bf1-9258-a24c4c3a44ba	3	t	2026-01-29 10:05:37.586609	\N	\N	\N
07c77ee9-62f7-4cf1-a29d-04eb26d69d82	First Aid Kit	first-aid-kit	f45cb187-5b57-4406-9e7d-325e82d5fdad	3	t	2026-01-29 10:05:52.411154	\N	\N	\N
4cc97837-cf3b-4d6e-a096-d33a9009e4bf	Vaccination Kit	vaccination-kit	f45cb187-5b57-4406-9e7d-325e82d5fdad	3	t	2026-01-29 10:05:52.411154	\N	\N	\N
30c83000-91bf-4319-8eaf-ee0c2d41253a	Cleaning Kit	cleaning-kit	f45cb187-5b57-4406-9e7d-325e82d5fdad	3	t	2026-01-29 10:05:52.411154	\N	\N	\N
7c161121-bf18-4460-bfbc-a285219f11c4	Grains	grains	6103c5a9-ea9c-46e5-a99a-48daf9502d65	2	t	2026-01-29 10:12:19.221048	grains.jpg	\N	\N
7c065213-db91-435f-8f75-0b7022d922d3	Fruits	market-fruits	6103c5a9-ea9c-46e5-a99a-48daf9502d65	2	t	2026-01-29 10:12:19.221048	fruits.jpg	\N	\N
5d98a16c-8715-4f62-9e51-1555dd312759	Vegetables	market-vegetables	6103c5a9-ea9c-46e5-a99a-48daf9502d65	2	t	2026-01-29 10:12:19.221048	vegetables.jpg	\N	\N
9e66f800-8232-40dd-af6d-cc5e2259f3ee	Spices	spices	6103c5a9-ea9c-46e5-a99a-48daf9502d65	2	t	2026-01-29 10:12:19.221048	spices.jpg	\N	\N
31a978c7-00ee-4fb3-81cc-54b31af94e7c	Flowers	flowers	6103c5a9-ea9c-46e5-a99a-48daf9502d65	2	t	2026-01-29 10:12:19.221048	flowers.jpg	\N	\N
3bb9c1ae-5a95-41d5-9b72-0d9ea9c8d108	Processed Foods	processed-foods	6103c5a9-ea9c-46e5-a99a-48daf9502d65	2	t	2026-01-29 10:12:19.221048	processed-food.jpg	\N	\N
11a04b48-a758-4c71-9b00-8ee2b5722c56	Fruit Saplings	fruit-saplings	f0b49773-9d10-4fa1-b74a-1be136fde14b	3	t	2026-01-29 10:07:13.300137	\N	\N	\N
87b583bd-0b8a-4709-9866-06d0bff540a1	Ornamental Plants	ornamental-plants	f0b49773-9d10-4fa1-b74a-1be136fde14b	3	t	2026-01-29 10:07:13.300137	\N	\N	\N
d4255b22-1d2a-4a85-a681-0336c92d86c9	Medicinal Plants	medicinal-plants	f0b49773-9d10-4fa1-b74a-1be136fde14b	3	t	2026-01-29 10:07:13.300137	\N	\N	\N
eec3edb3-1a31-47b0-bbca-e9f5fc3ac342	Pruners	pruners	81441dcb-d54e-4bdc-aa2c-d553ad90a6a3	3	t	2026-01-29 10:07:24.472975	\N	\N	\N
86401af7-8501-495b-a0fa-54bb0a6c9b32	Shovels	shovels	81441dcb-d54e-4bdc-aa2c-d553ad90a6a3	3	t	2026-01-29 10:07:24.472975	\N	\N	\N
6390e153-8b08-41e9-954a-1ba3f1beb887	Rakes	rakes	81441dcb-d54e-4bdc-aa2c-d553ad90a6a3	3	t	2026-01-29 10:07:24.472975	\N	\N	\N
9f793b96-74e5-4365-8653-385789a680e3	Clay Pots	clay-pots	35646dcb-94b6-4c59-9609-60acbb5c4576	3	t	2026-01-29 10:07:35.902434	\N	\N	\N
ef731d60-a612-48e7-9eba-b33624397c49	Plastic Pots	plastic-pots	35646dcb-94b6-4c59-9609-60acbb5c4576	3	t	2026-01-29 10:07:35.902434	\N	\N	\N
99faa542-c9bc-4841-8750-4570b3962ff9	Grow Bags	grow-bags	35646dcb-94b6-4c59-9609-60acbb5c4576	3	t	2026-01-29 10:07:35.902434	\N	\N	\N
ee2d4de3-ff79-41d7-8abf-bb8cc2a71a42	Grass Rolls	grass-rolls	17702648-d183-4b61-bfa2-d18ef830ac5d	3	t	2026-01-29 10:07:46.904614	\N	\N	\N
58757f2d-599c-408a-ab26-f93d0b22d3c4	Pebbles	pebbles	17702648-d183-4b61-bfa2-d18ef830ac5d	3	t	2026-01-29 10:07:46.904614	\N	\N	\N
9b52d8d0-1b8c-4e94-a002-ad30efb1ce12	Artificial Turf	artificial-turf	17702648-d183-4b61-bfa2-d18ef830ac5d	3	t	2026-01-29 10:07:46.904614	\N	\N	\N
f9d64740-6c2f-4f37-9d88-b7c9fb87f13d	Fertilizer Sticks	fertilizer-sticks	767a0233-fc25-4f24-b385-324f143358ba	3	t	2026-01-29 10:07:59.535053	\N	\N	\N
959b71f1-df09-4d43-ab24-d2d8204b7ecc	Neem Oil Spray	neem-oil-spray	767a0233-fc25-4f24-b385-324f143358ba	3	t	2026-01-29 10:07:59.535053	\N	\N	\N
030f9100-d6f1-403f-88e1-db06eb14aad2	Growth Boosters	growth-boosters	767a0233-fc25-4f24-b385-324f143358ba	3	t	2026-01-29 10:07:59.535053	\N	\N	\N
60d2809f-bee5-4541-b253-9b6c1e1fa88a	Garden Lights	garden-lights	891ea87d-a0fa-47b6-8f7a-3d3981a34669	3	t	2026-01-29 10:08:11.008162	\N	\N	\N
12d9050c-4804-4f35-9a41-27f2b261df3c	Statues	statues	891ea87d-a0fa-47b6-8f7a-3d3981a34669	3	t	2026-01-29 10:08:11.008162	\N	\N	\N
7a8ac774-9edd-425f-869f-1340572aaf8e	Fountains	fountains	891ea87d-a0fa-47b6-8f7a-3d3981a34669	3	t	2026-01-29 10:08:11.008162	\N	\N	\N
5117b0d6-7b7f-4ca1-ad04-bf8080454b29	Bobbin	bobbin	8616a155-5077-4fbb-82cd-de1f7aa76aad	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
bb3acf2a-9ca7-4c89-81dc-3fd432aa11ed	Fly Ash Bricks	fly-ash-bricks	40403d8e-7257-483f-90f7-333ad188a59b	2	t	2026-01-29 10:39:28.768677	\N	\N	\N
86199e6a-b29d-41ca-84df-906455db4613	Cement Bricks	cement-bricks	40403d8e-7257-483f-90f7-333ad188a59b	2	t	2026-01-29 10:39:28.768677	\N	\N	\N
8d56f270-217c-47f3-8e6f-85cdcfeb7582	AAC Blocks	aac-blocks	40403d8e-7257-483f-90f7-333ad188a59b	2	t	2026-01-29 10:39:28.768677	\N	\N	\N
067cf365-e015-4c85-8eab-0ca91bcce8df	Concrete Blocks	concrete-blocks	40403d8e-7257-483f-90f7-333ad188a59b	2	t	2026-01-29 10:39:28.768677	\N	\N	\N
699dd163-3200-4377-9347-f182de717492	TMT Bars	tmt-bars	40403d8e-7257-483f-90f7-333ad188a59b	2	t	2026-01-29 10:39:28.768677	\N	\N	\N
1cb05872-5c2f-4d00-b84c-d2258cf94b3f	Excavator Spare Parts	excavator-spare-parts	2b51413e-b3f0-42f3-bdc3-cf1e349d2679	2	t	2026-01-29 10:51:46.620785	\N	\N	\N
b6295014-2716-4686-b6eb-b165288e6af7	pH Testing	ph-testing	03564302-1234-4d93-b12d-5ae9e96b04f5	3	t	2026-01-29 10:09:34.882477	\N	\N	\N
78621074-44d0-46a6-94a8-fb2fb1e29f44	NPK Testing	npk-testing	03564302-1234-4d93-b12d-5ae9e96b04f5	3	t	2026-01-29 10:09:34.882477	\N	\N	\N
b60f3512-5246-4d6d-954a-4a72e8908093	Micro Nutrient Testing	micro-nutrient-testing	03564302-1234-4d93-b12d-5ae9e96b04f5	3	t	2026-01-29 10:09:34.882477	\N	\N	\N
bf945b36-4172-4b59-8d26-c51d3d22c487	Crop Monitoring	crop-monitoring	a12f9be0-8ecf-4c02-87f2-70ceed88eb1d	3	t	2026-01-29 10:09:46.274761	\N	\N	\N
b600cb9f-f6bc-49fa-887a-3e54172f4493	Pesticide Spraying	pesticide-spraying	a12f9be0-8ecf-4c02-87f2-70ceed88eb1d	3	t	2026-01-29 10:09:46.274761	\N	\N	\N
aca4ebff-61a5-4b8b-a8e7-78babf7f12cd	Fertilizer Spraying	fertilizer-spraying	a12f9be0-8ecf-4c02-87f2-70ceed88eb1d	3	t	2026-01-29 10:09:46.274761	\N	\N	\N
177d7e5f-95e5-4aea-95eb-c99061ba5cd5	Organic Farming	organic-farming	cfce0c96-e7dd-41f2-bcef-bfa1f61d405e	3	t	2026-01-29 10:09:56.660068	\N	\N	\N
1b4ebf25-bc77-4d1e-a23b-a2292499e722	Precision Farming	precision-farming	cfce0c96-e7dd-41f2-bcef-bfa1f61d405e	3	t	2026-01-29 10:09:56.660068	\N	\N	\N
48ac13d2-d58c-40a3-9899-f13efd8db38c	Irrigation Planning	irrigation-planning	cfce0c96-e7dd-41f2-bcef-bfa1f61d405e	3	t	2026-01-29 10:09:56.660068	\N	\N	\N
792eb5c9-6479-49a4-b502-0c5a23858e13	Tractor Rental	tractor-rental	f4599c9e-318b-4668-916b-be7403b53b44	3	t	2026-01-29 10:10:06.534595	\N	\N	\N
e632a98b-2e0d-4198-8f26-565540ef6863	Harvester Rental	harvester-rental	f4599c9e-318b-4668-916b-be7403b53b44	3	t	2026-01-29 10:10:06.534595	\N	\N	\N
584813b8-39e7-48e8-ad4d-9b0ab8580c4b	Sprayer Rental	sprayer-rental	f4599c9e-318b-4668-916b-be7403b53b44	3	t	2026-01-29 10:10:06.534595	\N	\N	\N
e6160aba-34b4-43d4-9021-a481ac932ee3	Soil Health	soil-health	e38aeff9-55fd-40eb-a236-d61aadf1ae23	3	t	2026-01-29 10:10:18.103024	\N	\N	\N
0ccd62b5-84ae-4843-9659-2e4a58332377	Crop Protection	crop-protection-training	e38aeff9-55fd-40eb-a236-d61aadf1ae23	3	t	2026-01-29 10:10:18.103024	\N	\N	\N
8bbcb145-741b-4a4c-abaf-dc558a024828	Organic Farming	organic-farming-training	e38aeff9-55fd-40eb-a236-d61aadf1ae23	3	t	2026-01-29 10:10:18.103024	\N	\N	\N
48f776c8-af6b-4aec-b686-e50c73ce9863	Crop Insurance	crop-insurance	9f69cfba-d8a4-4bd6-ab6a-4e6ade30615c	3	t	2026-01-29 10:10:29.932037	\N	\N	\N
388791e6-01a7-4275-a23b-3f411e3de346	Livestock Insurance	livestock-insurance	9f69cfba-d8a4-4bd6-ab6a-4e6ade30615c	3	t	2026-01-29 10:10:29.932037	\N	\N	\N
7992160c-771d-48ef-ae0b-fc91fbd19927	Equipment Insurance	equipment-insurance	9f69cfba-d8a4-4bd6-ab6a-4e6ade30615c	3	t	2026-01-29 10:10:29.932037	\N	\N	\N
dc217cf9-3723-4a1e-94fe-ac87ffbda189	Loader Spare Parts	loader-spare-parts	2b51413e-b3f0-42f3-bdc3-cf1e349d2679	2	t	2026-01-29 10:51:46.620785	\N	\N	\N
c9547b26-93af-4463-98d0-1505184bd629	Crane Spare Parts	crane-spare-parts	2b51413e-b3f0-42f3-bdc3-cf1e349d2679	2	t	2026-01-29 10:51:46.620785	\N	\N	\N
f0d41ad1-379e-4e84-913f-16d480608d83	Concrete Mixer Parts	concrete-mixer-parts	2b51413e-b3f0-42f3-bdc3-cf1e349d2679	2	t	2026-01-29 10:51:46.620785	\N	\N	\N
91e66633-e79d-4411-ae30-c925449f8cdb	Batching Plant Parts	batching-plant-parts	2b51413e-b3f0-42f3-bdc3-cf1e349d2679	2	t	2026-01-29 10:51:46.620785	\N	\N	\N
62521cbb-0c9e-454d-9822-2aa82a9b3c57	Road Construction Machinery Parts	road-construction-machinery-parts	2b51413e-b3f0-42f3-bdc3-cf1e349d2679	2	t	2026-01-29 10:51:46.620785	\N	\N	\N
e31534e0-e3f6-456e-b8f4-ecb8fa12c223	Mining & Earthmoving Parts	mining-earthmoving-parts	2b51413e-b3f0-42f3-bdc3-cf1e349d2679	2	t	2026-01-29 10:51:46.620785	\N	\N	\N
f9f20024-4166-4305-9be3-5edae669a964	Rice	rice	7c161121-bf18-4460-bfbc-a285219f11c4	3	t	2026-01-29 10:12:44.617155	\N	\N	\N
56c965cc-fc72-4961-a3b5-7bf5b6f1d59b	Wheat	wheat	7c161121-bf18-4460-bfbc-a285219f11c4	3	t	2026-01-29 10:12:44.617155	\N	\N	\N
ff67089e-91de-4cef-8aaf-d3b3362bc67e	Maize	maize	7c161121-bf18-4460-bfbc-a285219f11c4	3	t	2026-01-29 10:12:44.617155	\N	\N	\N
9da17113-a5f2-4ac7-8efb-2eb81942c4be	Banana	market-banana	7c065213-db91-435f-8f75-0b7022d922d3	3	t	2026-01-29 10:12:57.322759	\N	\N	\N
60b9be37-cbb2-4ca9-abaa-44ba88345d06	Mango	market-mango	7c065213-db91-435f-8f75-0b7022d922d3	3	t	2026-01-29 10:12:57.322759	\N	\N	\N
abe61aeb-b517-42d4-9d78-e8e19b7d7b74	Papaya	market-papaya	7c065213-db91-435f-8f75-0b7022d922d3	3	t	2026-01-29 10:12:57.322759	\N	\N	\N
3ec32263-afac-4eae-a8f3-00ef45b0a172	Tomato	market-tomato	5d98a16c-8715-4f62-9e51-1555dd312759	3	t	2026-01-29 10:13:06.920658	\N	\N	\N
e6fe5511-acb4-4249-b27f-e5cb721fb87a	Onion	market-onion	5d98a16c-8715-4f62-9e51-1555dd312759	3	t	2026-01-29 10:13:06.920658	\N	\N	\N
ea2b2e9a-4cfe-41ba-8ada-f8fe3efee83d	Potato	market-potato	5d98a16c-8715-4f62-9e51-1555dd312759	3	t	2026-01-29 10:13:06.920658	\N	\N	\N
10de1c8b-5e23-48dc-87de-c084d1ecd547	Turmeric	turmeric	9e66f800-8232-40dd-af6d-cc5e2259f3ee	3	t	2026-01-29 10:13:18.052738	\N	\N	\N
1dc82d9c-5738-4985-bf17-db0a9996e954	Chilli	chilli	9e66f800-8232-40dd-af6d-cc5e2259f3ee	3	t	2026-01-29 10:13:18.052738	\N	\N	\N
d894d673-6b5e-441c-844c-e35f8e127868	Coriander	coriander	9e66f800-8232-40dd-af6d-cc5e2259f3ee	3	t	2026-01-29 10:13:18.052738	\N	\N	\N
0b0cbc0f-17a9-4248-a687-bb6029d7c4cd	Rose	rose	31a978c7-00ee-4fb3-81cc-54b31af94e7c	3	t	2026-01-29 10:13:30.05516	\N	\N	\N
d48a0b52-4915-4899-aaac-f59362ca27c2	Jasmine	jasmine	31a978c7-00ee-4fb3-81cc-54b31af94e7c	3	t	2026-01-29 10:13:30.05516	\N	\N	\N
eaa7776e-06a2-471b-9d19-2a263ba92b28	Marigold	marigold	31a978c7-00ee-4fb3-81cc-54b31af94e7c	3	t	2026-01-29 10:13:30.05516	\N	\N	\N
c10e82c3-0929-4802-a9b8-51e2db518bae	Pickles	pickles	3bb9c1ae-5a95-41d5-9b72-0d9ea9c8d108	3	t	2026-01-29 10:13:41.719708	\N	\N	\N
368d76c9-7699-4a69-aa73-695f93416d9b	Jams	jams	3bb9c1ae-5a95-41d5-9b72-0d9ea9c8d108	3	t	2026-01-29 10:13:41.719708	\N	\N	\N
6ab03d0d-0b9d-4fb1-9881-a092135e4605	Flours	flours	3bb9c1ae-5a95-41d5-9b72-0d9ea9c8d108	3	t	2026-01-29 10:13:41.719708	\N	\N	\N
c2258a40-8f69-4283-9ee0-be364a651778	Farm	farm	\N	0	t	2026-01-23 10:04:34.837442	https://your-cdn.com/images/farm.jpg	Agriculture, farming products, seeds, fertilizers and equipment	1
e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	Building Construction Material & Equipment	building-construction-material-equipment	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
215c8f28-f3e0-4c90-ae6e-1b9da88cded2	Pharmaceutical Drug, Medicine, Medical Care & Consultation	pharmaceutical-drug-medicine-medical-care-consultation	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
bb8aa523-8c5d-480e-b270-816592cc5207	Hospital and Medical Equipment	hospital-and-medical-equipment	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
61c6cf98-9504-4845-8178-0d139164e538	Industrial Plants, Machinery & Equipment	industrial-plants-machinery-equipment	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
45df472c-83e4-4ed0-8713-7c17bafc4783	Industrial & Engineering Products, Spares & Supplies	industrial-engineering-products-spares-supplies	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
b6330998-c5d2-489a-a471-5b9c49faec28	Apparel, Clothing & Garments	apparel-clothing-garments	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
bb6462ee-cb30-4572-8a69-e45beec8ffbc	Packaging Material, Supplies & Machines	packaging-material-supplies-machines	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
361f4057-73cb-45ce-bc0f-1429e7bf3fc4	Chemicals, Dyes, Solvents & Allied Products	chemicals-dyes-solvents-allied-products	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
dae9bb18-9175-4ba3-8b5f-bccf2569b483	Transportation & Logistics	transportation-logistics	\N	0	t	2026-01-29 10:32:44.982366	\N	\N	\N
40403d8e-7257-483f-90f7-333ad188a59b	Bricks, Concrete & Building Material	bricks-concrete-building-material	e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	1	t	2026-01-29 10:37:56.314634	\N	\N	\N
d9667625-d6b9-465e-a960-296d9d598ad6	Construction Machines & Equipment	construction-machines-equipment	e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	1	t	2026-01-29 10:37:56.314634	\N	\N	\N
d7824db9-ad2a-49d4-80c3-f2b5f64a60e3	Prefabricated Houses & Structures	prefabricated-houses-structures	e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	1	t	2026-01-29 10:37:56.314634	\N	\N	\N
0a9a3195-dd8b-4507-aa3b-3b772c5cfd11	Scaffolding Pipes & Fittings	scaffolding-pipes-fittings	e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	1	t	2026-01-29 10:37:56.314634	\N	\N	\N
2b51413e-b3f0-42f3-bdc3-cf1e349d2679	Construction Machinery Parts	construction-machinery-parts	e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	1	t	2026-01-29 10:37:56.314634	\N	\N	\N
8d259638-9c27-4d26-8ce2-89b54d2c2b00	PVC Pipes & Fittings	pvc-pipes-fittings	e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	1	t	2026-01-29 10:37:56.314634	\N	\N	\N
4169d93b-ad21-4db7-a494-8bcb63763e13	Paints & Coatings	paints-coatings	e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	1	t	2026-01-29 10:37:56.314634	\N	\N	\N
d580f5ee-f87f-4ee6-8785-94268fc38d72	Doors & Windows	doors-windows	e2608c88-d5c2-4d5d-8afc-17ece5eaa37e	1	t	2026-01-29 10:37:56.314634	\N	\N	\N
dab1b47b-d2fc-4b54-8821-bb9fad2ccf57	Interior Paints	interior-paints	4169d93b-ad21-4db7-a494-8bcb63763e13	2	t	2026-01-29 11:43:23.583498	\N	\N	\N
3c6533d7-4786-4d11-9ead-c7ccac1f30f5	Exterior Paints	exterior-paints	4169d93b-ad21-4db7-a494-8bcb63763e13	2	t	2026-01-29 11:43:23.583498	\N	\N	\N
57b296a2-9f57-4dd0-afb6-4a7162db92e2	Industrial Paints	industrial-paints	4169d93b-ad21-4db7-a494-8bcb63763e13	2	t	2026-01-29 11:43:23.583498	\N	\N	\N
ac4f3131-7e12-416b-827d-141b06fbe03a	Wood Coatings	wood-coatings	4169d93b-ad21-4db7-a494-8bcb63763e13	2	t	2026-01-29 11:43:23.583498	\N	\N	\N
6434d3ba-b546-4edb-b8f3-9efa1bce0290	Metal Coatings	metal-coatings	4169d93b-ad21-4db7-a494-8bcb63763e13	2	t	2026-01-29 11:43:23.583498	\N	\N	\N
e6ee7153-a080-4580-a75a-4ebbbc71473a	Waterproofing Coatings	waterproofing-coatings	4169d93b-ad21-4db7-a494-8bcb63763e13	2	t	2026-01-29 11:43:23.583498	\N	\N	\N
b902912f-0b48-4067-a21c-5c408127c83a	Class I Fly Ash Bricks	class-i-fly-ash-bricks	bb3acf2a-9ca7-4c89-81dc-3fd432aa11ed	3	t	2026-01-29 10:40:28.959008	\N	\N	\N
c6b2957d-d90d-4716-8a32-8a996843e375	Class II Fly Ash Bricks	class-ii-fly-ash-bricks	bb3acf2a-9ca7-4c89-81dc-3fd432aa11ed	3	t	2026-01-29 10:40:28.959008	\N	\N	\N
9e377946-6ae0-482f-82ee-8ffb3a1c1dc3	Solid Fly Ash Bricks	solid-fly-ash-bricks	bb3acf2a-9ca7-4c89-81dc-3fd432aa11ed	3	t	2026-01-29 10:40:28.959008	\N	\N	\N
ba9522c0-6710-4b5b-9eda-a2b481f4d68f	Hollow Fly Ash Bricks	hollow-fly-ash-bricks	bb3acf2a-9ca7-4c89-81dc-3fd432aa11ed	3	t	2026-01-29 10:40:28.959008	\N	\N	\N
9b87016a-10ae-4471-8ca4-3044c0284b7e	Burnt Clay Bricks	burnt-clay-bricks	3d6e3e4e-ffa3-44f3-99a6-afb27a9f9747	3	t	2026-01-29 10:41:58.098717	\N	\N	\N
f67a8d99-cad3-4df8-8f4d-0f18ca9f5640	Wire Cut Bricks	wire-cut-bricks	3d6e3e4e-ffa3-44f3-99a6-afb27a9f9747	3	t	2026-01-29 10:41:58.098717	\N	\N	\N
5adf2b2a-fe78-4b08-83d5-53662382a68b	Facing Bricks	facing-bricks	3d6e3e4e-ffa3-44f3-99a6-afb27a9f9747	3	t	2026-01-29 10:41:58.098717	\N	\N	\N
ea89eb71-e3d5-4d64-af16-f50fd9f164f5	Solid Cement Bricks	solid-cement-bricks	86199e6a-b29d-41ca-84df-906455db4613	3	t	2026-01-29 10:42:09.948966	\N	\N	\N
1bb7bf18-17ac-4c5e-b14f-3c5b7b2d1ebf	Hollow Cement Bricks	hollow-cement-bricks	86199e6a-b29d-41ca-84df-906455db4613	3	t	2026-01-29 10:42:09.948966	\N	\N	\N
c2dca773-0ac8-4250-8772-6f3d49cd8428	Solid Concrete Blocks	solid-concrete-blocks	067cf365-e015-4c85-8eab-0ca91bcce8df	3	t	2026-01-29 10:45:29.479248	\N	\N	\N
55866629-2f8e-405e-a817-ec4250c72fd3	Hollow Concrete Blocks	hollow-concrete-blocks	067cf365-e015-4c85-8eab-0ca91bcce8df	3	t	2026-01-29 10:45:29.479248	\N	\N	\N
7b325af4-1b71-4a0b-914d-2b3f9ff41fb1	Autoclaved Aerated Concrete Blocks	aac-blocks-standard	8d56f270-217c-47f3-8e6f-85cdcfeb7582	3	t	2026-01-29 10:45:53.108782	\N	\N	\N
517ef927-fdf3-4abe-b617-5e9c09c560ba	Lightweight AAC Blocks	lightweight-aac-blocks	8d56f270-217c-47f3-8e6f-85cdcfeb7582	3	t	2026-01-29 10:45:53.108782	\N	\N	\N
1ca750bf-9dde-4ca0-b729-f50979827d60	Kurtis	kurtis	f0c40a3a-7ab1-4c6b-8246-f0fddbb5c7f7	2	t	2026-01-30 04:56:05.15627	\N	\N	\N
24210f8d-70da-4994-848a-2419d23a6cbe	Dresses	dresses	f0c40a3a-7ab1-4c6b-8246-f0fddbb5c7f7	2	t	2026-01-30 05:02:13.285512	\N	\N	\N
399d72ac-933f-4faa-a3d2-48f7a2c53843	Trousers	trousers	1ff93ec3-4f2d-4a25-ab92-c3cc99f0b68f	2	t	2026-01-30 05:02:13.285512	\N	\N	\N
f3d22cbb-c327-48d6-8cbd-8b2eab9098e2	Shirts	shirts	1ff93ec3-4f2d-4a25-ab92-c3cc99f0b68f	2	t	2026-01-30 05:02:13.285512	\N	\N	\N
060b1e2c-1cb8-47e6-952e-cb8618b3f7fb	T-Shirts	t-shirts	1ff93ec3-4f2d-4a25-ab92-c3cc99f0b68f	2	t	2026-01-30 05:02:13.285512	\N	\N	\N
c67a25c2-ee56-4d16-ab56-5f9a23dad443	Safety Shoes	safety-shoes	cb8922e7-3eee-478b-ba4c-918beebe4425	2	t	2026-01-30 05:02:13.285512	\N	\N	\N
b6707f91-1465-40a5-a4b1-22a1202c6845	Synthetic Fabric	synthetic-fabric	3367a6ac-881a-45f0-8c2a-13ef5f9a66d4	2	t	2026-01-30 05:02:13.285512	\N	\N	\N
b0593754-5491-43bc-b541-3e647a072367	Excavator Bucket	excavator-bucket	1cb05872-5c2f-4d00-b84c-d2258cf94b3f	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
c9476a00-d842-434e-bfc0-f26cdcc6893b	Hydraulic Pump	excavator-hydraulic-pump	1cb05872-5c2f-4d00-b84c-d2258cf94b3f	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
ff9924e9-e925-4627-911e-57c16b68f41b	Track Chain	excavator-track-chain	1cb05872-5c2f-4d00-b84c-d2258cf94b3f	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
a12ee595-78c1-4989-a6e3-766cf35ee46d	Boom Arm	excavator-boom-arm	1cb05872-5c2f-4d00-b84c-d2258cf94b3f	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
aa2340b0-ac48-499b-bad2-3ca1d20b6a7b	Engine Parts	excavator-engine-parts	1cb05872-5c2f-4d00-b84c-d2258cf94b3f	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
46ab7f3c-677c-4965-a254-cb3dbfa22f28	Loader Bucket	loader-bucket	dc217cf9-3723-4a1e-94fe-ac87ffbda189	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
221e94e3-339a-4205-a087-4a7c870596ff	Hydraulic Cylinder	loader-hydraulic-cylinder	dc217cf9-3723-4a1e-94fe-ac87ffbda189	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
53e3f6bd-aa34-4164-9d77-b49dd29947b0	Transmission Parts	loader-transmission-parts	dc217cf9-3723-4a1e-94fe-ac87ffbda189	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
74b50564-fde3-4428-9a68-6cc0c99fb969	Axle Parts	loader-axle-parts	dc217cf9-3723-4a1e-94fe-ac87ffbda189	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
fdf9d5e1-ab08-4803-b864-0cc4dc7a0215	Wire Rope	crane-wire-rope	c9547b26-93af-4463-98d0-1505184bd629	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
e3864312-ad5b-448d-9109-f98b2c23fd9a	Hook Block	crane-hook-block	c9547b26-93af-4463-98d0-1505184bd629	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
a6594f79-fa04-4047-bd14-a50d843f8701	Slewing Ring	crane-slewing-ring	c9547b26-93af-4463-98d0-1505184bd629	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
5927944d-ad39-4d5b-abf9-14f5e9c7ec84	Hydraulic Winch	crane-hydraulic-winch	c9547b26-93af-4463-98d0-1505184bd629	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
b768079f-540c-42c3-ba6f-af6a78059237	Mixing Drum	concrete-mixer-drum	f0d41ad1-379e-4e84-913f-16d480608d83	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
9300d89a-2ec4-4874-b61c-6e28e2b2aa2c	Mixing Blades	concrete-mixer-blades	f0d41ad1-379e-4e84-913f-16d480608d83	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
2bacd9b1-46b7-46da-8ca1-0c0268efd71c	Gear Ring	concrete-mixer-gear-ring	f0d41ad1-379e-4e84-913f-16d480608d83	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
8fed92b3-fc8a-4582-8c51-f8c5621b40d2	Control Panel	concrete-mixer-control-panel	f0d41ad1-379e-4e84-913f-16d480608d83	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
d6b3825f-47de-41a2-a0b8-402ac36ad367	Cement Hopper	batching-plant-cement-hopper	91e66633-e79d-4411-ae30-c925449f8cdb	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
39679f1d-22d2-416e-9b01-4be5a370dbb0	Weighing Sensor	batching-plant-weighing-sensor	91e66633-e79d-4411-ae30-c925449f8cdb	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
badf6af8-05dd-4e93-a891-c4dd30acc4eb	Conveyor Belt	batching-plant-conveyor-belt	91e66633-e79d-4411-ae30-c925449f8cdb	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
58c597b4-9ae0-43b9-b046-e82d3fbc2d33	Control Cabin	batching-plant-control-cabin	91e66633-e79d-4411-ae30-c925449f8cdb	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
fc75c080-2919-40e7-9bc9-c1a07edc3f21	Paver Screed	paver-screed	62521cbb-0c9e-454d-9822-2aa82a9b3c57	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
e4fca79a-a88f-40e4-9416-33bef2eca1cc	Road Roller Drum	road-roller-drum	62521cbb-0c9e-454d-9822-2aa82a9b3c57	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
ab7970fe-d301-4123-a98c-ed1f0d8cef32	Asphalt Sensor	asphalt-sensor	62521cbb-0c9e-454d-9822-2aa82a9b3c57	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
0f57a49d-771a-4c98-8ebf-03fe81832e70	Bitumen Pump	bitumen-pump	62521cbb-0c9e-454d-9822-2aa82a9b3c57	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
87eb1f2c-5be4-4e8b-9e51-7226ac7c7b7a	Rock Breaker	rock-breaker	e31534e0-e3f6-456e-b8f4-ecb8fa12c223	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
140caae6-a5ac-489b-9028-15bb905c5498	Dozer Blade	dozer-blade	e31534e0-e3f6-456e-b8f4-ecb8fa12c223	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
079c81c9-14a3-42b6-ba3a-a88acb998f72	Undercarriage Parts	undercarriage-parts	e31534e0-e3f6-456e-b8f4-ecb8fa12c223	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
04437ffe-2497-46b4-a2f3-1faf28f11ff0	Hydraulic Hammer	hydraulic-hammer	e31534e0-e3f6-456e-b8f4-ecb8fa12c223	3	t	2026-01-29 10:54:19.978532	\N	\N	\N
5cb0ad46-7ba6-4253-a5be-728656ea3e68	Mannequins	mannequins	5b11e707-b125-4b22-9834-38c77f1ec669	2	t	2026-01-30 05:02:13.285512	\N	\N	\N
0cc5e86a-3a9a-4e98-a128-5bffa866e403	Winter Wear & Accessories	winter-wear-accessories	f0c40a3a-7ab1-4c6b-8246-f0fddbb5c7f7	2	t	2026-01-30 05:13:03.164846	\N	\N	\N
0f42b9e9-fbf3-4343-be03-29bbdbb841ff	Undergarments & Inner Wear	undergarments-inner-wear	f0c40a3a-7ab1-4c6b-8246-f0fddbb5c7f7	2	t	2026-01-30 05:13:03.164846	\N	\N	\N
fd297788-d7ac-42d2-b44d-7fc903ca15cc	Leggings & Jeggings	leggings-jeggings	f0c40a3a-7ab1-4c6b-8246-f0fddbb5c7f7	2	t	2026-01-30 05:13:03.164846	\N	\N	\N
78337080-7005-49e7-9f3c-d66edc7d4a49	Leather Garments	leather-garments	1ff93ec3-4f2d-4a25-ab92-c3cc99f0b68f	2	t	2026-01-30 05:13:03.164846	\N	\N	\N
391fa82d-cdb5-4dc6-adf0-1998bc37488b	Unisex Clothing	unisex-clothing	1ff93ec3-4f2d-4a25-ab92-c3cc99f0b68f	2	t	2026-01-30 05:13:03.164846	\N	\N	\N
5b13dba3-661e-48e2-9d0a-a647a620dc44	Emulsion Paints	emulsion-paints	dab1b47b-d2fc-4b54-8821-bb9fad2ccf57	3	t	2026-01-29 11:52:32.539927	\N	\N	\N
a9dfae61-cc96-4957-b62a-318a7e2bc320	Plastic Paints	plastic-paints	dab1b47b-d2fc-4b54-8821-bb9fad2ccf57	3	t	2026-01-29 11:52:32.539927	\N	\N	\N
dec4fac2-c388-46f0-93ab-d742c6b4afb4	Distemper Paints	distemper-paints	dab1b47b-d2fc-4b54-8821-bb9fad2ccf57	3	t	2026-01-29 11:52:32.539927	\N	\N	\N
36753c78-5132-4e68-9d65-cd68d3c14536	Weatherproof Paints	weatherproof-paints	3c6533d7-4786-4d11-9ead-c7ccac1f30f5	3	t	2026-01-29 12:00:38.510081	\N	\N	\N
2de7f0e7-5ba4-4ee3-a56b-ea7bde8e4bcf	Texture Paints	texture-paints	3c6533d7-4786-4d11-9ead-c7ccac1f30f5	3	t	2026-01-29 12:00:38.510081	\N	\N	\N
a5ed83f6-40fa-4dcb-b099-c52a0d3307e9	Exterior Emulsions	exterior-emulsions	3c6533d7-4786-4d11-9ead-c7ccac1f30f5	3	t	2026-01-29 12:00:38.510081	\N	\N	\N
2aea0e4f-f3ff-4ae6-8e40-99e13eb8fde6	Epoxy Paints	epoxy-paints	57b296a2-9f57-4dd0-afb6-4a7162db92e2	3	t	2026-01-29 12:01:39.820812	\N	\N	\N
6d95a1e2-9bc7-4f73-bd08-b5504ca2ca1c	Polyurethane Paints	polyurethane-paints	57b296a2-9f57-4dd0-afb6-4a7162db92e2	3	t	2026-01-29 12:01:39.820812	\N	\N	\N
524a0605-696f-4cbf-a6dc-b5af70052784	Heat Resistant Paints	heat-resistant-paints	57b296a2-9f57-4dd0-afb6-4a7162db92e2	3	t	2026-01-29 12:01:39.820812	\N	\N	\N
86ba2df9-3604-47fa-a336-c8956ac6e5b0	Anti Corrosion Coatings	anti-corrosion-coatings	6434d3ba-b546-4edb-b8f3-9efa1bce0290	3	t	2026-01-29 12:02:24.183649	\N	\N	\N
6932a2c8-9a9d-443f-9815-1982618e3ee9	Zinc Coatings	zinc-coatings	6434d3ba-b546-4edb-b8f3-9efa1bce0290	3	t	2026-01-29 12:02:24.183649	\N	\N	\N
1b78b915-8038-40d0-a6c9-7f213c584083	Chrome Coatings	chrome-coatings	6434d3ba-b546-4edb-b8f3-9efa1bce0290	3	t	2026-01-29 12:02:24.183649	\N	\N	\N
41808bdb-a528-4012-994e-775040ffd94f	Bitumen Coatings	bitumen-coatings	e6ee7153-a080-4580-a75a-4ebbbc71473a	3	t	2026-01-29 12:02:56.381675	\N	\N	\N
6f1be63c-a9d7-4740-9ffb-185f5e85fc9a	Cementitious Waterproofing	cementitious-waterproofing	e6ee7153-a080-4580-a75a-4ebbbc71473a	3	t	2026-01-29 12:02:56.381675	\N	\N	\N
ad0e5acc-ff34-4b9f-95a7-38926ef7a958	Liquid Waterproofing Membrane	liquid-waterproofing-membrane	e6ee7153-a080-4580-a75a-4ebbbc71473a	3	t	2026-01-29 12:02:56.381675	\N	\N	\N
d000f731-8099-4cfc-a37f-03d915ec2760	Wood Polish	wood-polish	ac4f3131-7e12-416b-827d-141b06fbe03a	3	t	2026-01-29 12:03:46.318283	\N	\N	\N
7b6027c1-de18-4c53-a9d6-a497e2cab54c	Varnish	varnish	ac4f3131-7e12-416b-827d-141b06fbe03a	3	t	2026-01-29 12:03:46.318283	\N	\N	\N
b9ed68dc-1fe4-475b-acc4-82f9534b21e3	PU Coatings	pu-coatings	ac4f3131-7e12-416b-827d-141b06fbe03a	3	t	2026-01-29 12:03:46.318283	\N	\N	\N
433b87ff-c707-4a3a-8872-e3b0becd18ed	Melamine Coatings	melamine-coatings	ac4f3131-7e12-416b-827d-141b06fbe03a	3	t	2026-01-29 12:03:46.318283	\N	\N	\N
b1242bab-43bd-49ef-a699-5c511ea3127c	Wooden Doors	wooden-doors	cffa3ea6-0306-4e3b-a324-b4f609cccb4d	3	t	2026-01-29 12:10:00.32207	\N	\N	\N
e2dbbdf4-3a69-4c55-94b0-b42a4b5bfc8d	Steel Doors	steel-doors	cffa3ea6-0306-4e3b-a324-b4f609cccb4d	3	t	2026-01-29 12:10:00.32207	\N	\N	\N
e6908853-a2c4-40cb-9b26-4e63543a2ade	Aluminium Doors	aluminium-doors	cffa3ea6-0306-4e3b-a324-b4f609cccb4d	3	t	2026-01-29 12:10:00.32207	\N	\N	\N
fc4ebf1c-433c-4e57-b9b9-af8ec95eb0b2	UPVC Windows	upvc-windows	3cfb5393-6069-4abf-8bf1-20437c73927b	3	t	2026-01-29 12:10:00.32207	\N	\N	\N
2019ccaf-b62c-4eaa-9ec8-c4296f42c0df	Sliding Windows	sliding-windows	3cfb5393-6069-4abf-8bf1-20437c73927b	3	t	2026-01-29 12:10:00.32207	\N	\N	\N
719ed1c4-d7b7-4bcd-bc9c-148ea68b60f8	Aluminium Windows	aluminium-windows	3cfb5393-6069-4abf-8bf1-20437c73927b	3	t	2026-01-29 12:10:00.32207	\N	\N	\N
dfc1e890-8dce-47ee-938d-fa540801308b	Excavators	excavators	69fc7c08-f4c5-4030-91e1-b725852a5578	3	t	2026-01-29 12:13:16.653118	\N	\N	\N
30589bd5-9808-4419-be1d-5620d5ef4f6f	Backhoe Loaders	backhoe-loaders	69fc7c08-f4c5-4030-91e1-b725852a5578	3	t	2026-01-29 12:13:16.653118	\N	\N	\N
934f3e68-6cda-400e-a8b3-9f75a43db104	Bulldozers	bulldozers	69fc7c08-f4c5-4030-91e1-b725852a5578	3	t	2026-01-29 12:13:16.653118	\N	\N	\N
c60b0e7f-6403-4339-8e49-1c0d45dd1555	Concrete Mixers	concrete-mixers	1d67bb91-cadb-41ae-87f8-9d4df884e4ac	3	t	2026-01-29 12:13:16.653118	\N	\N	\N
ea01457c-1ba9-44cc-9c18-fac64068961e	Concrete Pumps	concrete-pumps	1d67bb91-cadb-41ae-87f8-9d4df884e4ac	3	t	2026-01-29 12:13:16.653118	\N	\N	\N
52995f70-5bce-413c-9fca-4d82b324974b	Batching Plants	batching-plants	1d67bb91-cadb-41ae-87f8-9d4df884e4ac	3	t	2026-01-29 12:13:16.653118	\N	\N	\N
cffa3ea6-0306-4e3b-a324-b4f609cccb4d	Doors	doors	d580f5ee-f87f-4ee6-8785-94268fc38d72	2	t	2026-01-29 12:10:00.32207	\N	\N	\N
33c56c7d-acc3-4f9a-a2d8-b8099b545610	Modular Homes	modular-homes	309bc549-ea04-4f38-840f-ac3f8fdcbe09	3	t	2026-01-29 12:13:49.498601	\N	\N	\N
e9235c9b-47e7-4634-8370-8da9597e74d3	Portable Cabins	portable-cabins	309bc549-ea04-4f38-840f-ac3f8fdcbe09	3	t	2026-01-29 12:13:49.498601	\N	\N	\N
f59a1d74-874b-4488-897f-b686ed8fdb4b	Steel Structures	steel-structures	f16cd119-037c-491b-8c12-3c180349799e	3	t	2026-01-29 12:13:49.498601	\N	\N	\N
57174e57-d12e-431c-887d-ddadb4b69000	Precast Panels	precast-panels	f16cd119-037c-491b-8c12-3c180349799e	3	t	2026-01-29 12:13:49.498601	\N	\N	\N
3cfb5393-6069-4abf-8bf1-20437c73927b	Windows	windows	d580f5ee-f87f-4ee6-8785-94268fc38d72	2	t	2026-01-29 12:10:00.32207	\N	\N	\N
69fc7c08-f4c5-4030-91e1-b725852a5578	Earthmoving Equipment	earthmoving-equipment	d9667625-d6b9-465e-a960-296d9d598ad6	2	t	2026-01-29 12:13:16.653118	\N	\N	\N
1d67bb91-cadb-41ae-87f8-9d4df884e4ac	Concrete Equipment	concrete-equipment	d9667625-d6b9-465e-a960-296d9d598ad6	2	t	2026-01-29 12:13:16.653118	\N	\N	\N
309bc549-ea04-4f38-840f-ac3f8fdcbe09	Prefabricated Buildings	prefabricated-buildings	d7824db9-ad2a-49d4-80c3-f2b5f64a60e3	2	t	2026-01-29 12:13:49.498601	\N	\N	\N
f16cd119-037c-491b-8c12-3c180349799e	Structural Components	structural-components	d7824db9-ad2a-49d4-80c3-f2b5f64a60e3	2	t	2026-01-29 12:13:49.498601	\N	\N	\N
2db92cbd-ffa0-4c75-89b4-6a34a93d43f3	Scaffolding Pipes	scaffolding-pipes	0a9a3195-dd8b-4507-aa3b-3b772c5cfd11	2	t	2026-01-29 12:15:43.824488	\N	\N	\N
569670ce-25d7-4fd2-aae7-e3045e5ebcd9	MS Scaffolding Pipes	ms-scaffolding-pipes	2db92cbd-ffa0-4c75-89b4-6a34a93d43f3	3	t	2026-01-29 12:15:43.824488	\N	\N	\N
21eae4b3-6b27-4e76-bf37-80892d390651	GI Scaffolding Pipes	gi-scaffolding-pipes	2db92cbd-ffa0-4c75-89b4-6a34a93d43f3	3	t	2026-01-29 12:15:43.824488	\N	\N	\N
f7234b2f-9eae-4f95-bc38-64edbb2e6565	Scaffolding Couplers	scaffolding-couplers	efadcae4-7da2-40f5-a98b-79489cbd49da	3	t	2026-01-29 12:15:43.824488	\N	\N	\N
dd67ac44-b4ec-49e7-92d6-e60ab8b1e565	Scaffolding Base Plates	scaffolding-base-plates	efadcae4-7da2-40f5-a98b-79489cbd49da	3	t	2026-01-29 12:15:43.824488	\N	\N	\N
5be3ee4e-e0b8-43e3-ae07-e8734bb4b5d1	Scaffolding U Jacks	scaffolding-u-jacks	efadcae4-7da2-40f5-a98b-79489cbd49da	3	t	2026-01-29 12:15:43.824488	\N	\N	\N
9a21fdf3-ffa5-4b27-96d5-6393a295e471	PVC Couplers	pvc-couplers	ad2730ea-9192-4742-9dec-8ffee88608dd	3	t	2026-01-29 12:15:51.887733	\N	\N	\N
2da63902-b4a1-48b8-ac62-916f05d31459	PVC Elbows	pvc-elbows	ad2730ea-9192-4742-9dec-8ffee88608dd	3	t	2026-01-29 12:15:51.887733	\N	\N	\N
9c051091-db16-4d37-a701-76d0d78d7510	PVC Tees	pvc-tees	ad2730ea-9192-4742-9dec-8ffee88608dd	3	t	2026-01-29 12:15:51.887733	\N	\N	\N
efadcae4-7da2-40f5-a98b-79489cbd49da	Scaffolding Fittings	scaffolding-fittings	0a9a3195-dd8b-4507-aa3b-3b772c5cfd11	2	t	2026-01-29 12:15:43.824488	\N	\N	\N
ad2730ea-9192-4742-9dec-8ffee88608dd	PVC Fittings	pvc-fittings	8d259638-9c27-4d26-8ce2-89b54d2c2b00	2	t	2026-01-29 12:15:51.887733	\N	\N	\N
8616a155-5077-4fbb-82cd-de1f7aa76aad	Embroidery Accessories	embroidery-accessories	3367a6ac-881a-45f0-8c2a-13ef5f9a66d4	2	t	2026-01-30 05:13:03.164846	\N	\N	\N
1eebce3d-3ce2-4132-9ac1-b9c2fe511f19	Infant & Toddlers Clothing	infant-toddlers-clothing	cb4fd98d-7ecd-4291-ad1e-4f90aa8287de	2	t	2026-01-30 05:17:35.211227	\N	\N	\N
4cf182cc-17c4-4c74-b979-7d1e611464ce	Umbrellas & Raincoats	umbrellas-raincoats	1350f1b1-ae30-4702-abe5-0d317374b3f7	2	t	2026-01-30 05:17:35.211227	\N	\N	\N
0432ff55-6e8d-41d6-aa33-c3ea359f31c3	Gloves & Mittens	gloves-mittens	1350f1b1-ae30-4702-abe5-0d317374b3f7	2	t	2026-01-30 05:17:35.211227	\N	\N	\N
c46c2872-ae9f-40d5-abc2-ee4b96192d21	Process Controllers	process-controllers	63626805-001a-4d43-9794-6ce74ea9ba31	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
821519b3-e76f-4141-aa86-8e98bc7bc2d3	Solar & Renewable Energy	solar-renewable-energy	a6b1051d-6e62-46a5-a4f6-597e6664dbcb	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
a55d5d55-9ec1-4923-9f70-8608fa2e6dcf	Biometrics & Access Control Devices	biometrics-access-control-devices	3cae8c9a-b174-47b3-81f9-6e4ff89cfffa	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
309583a2-6c24-4b0b-b31d-12f502aa1f71	Diodes & Active Devices	diodes-active-devices	63626805-001a-4d43-9794-6ce74ea9ba31	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
ec3ab96b-0bfb-4682-8b6c-20fed6037285	Wires & Cables	wires-cables	562304dc-3f62-4274-bbb5-999567bd33bf	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
42471e1f-13aa-4d70-a88d-432d6e08fbba	CCTV, Surveillance Systems & Parts	cctv-surveillance-systems-parts	3cae8c9a-b174-47b3-81f9-6e4ff89cfffa	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
5afcaff7-3b0d-4e46-b5d0-8f9f505f6ea8	GPS & Navigation Devices	gps-navigation-devices	3cae8c9a-b174-47b3-81f9-6e4ff89cfffa	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
0a69c99f-7ab9-4b1d-9a0d-90349852fb68	Control & Automation	control-automation	63626805-001a-4d43-9794-6ce74ea9ba31	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
584edb18-9ce2-4e53-bef6-8cac193ffd16	Sensors & Transducers	sensors-transducers	63626805-001a-4d43-9794-6ce74ea9ba31	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
2a544106-a9a2-4d52-b79e-44b96d3bda9e	Commercial Lights	commercial-lights	562304dc-3f62-4274-bbb5-999567bd33bf	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
834abc49-07d4-44d4-8a75-c8e621f7cee2	Voltage & Power Stabilizers	voltage-power-stabilizers	a6b1051d-6e62-46a5-a4f6-597e6664dbcb	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
116d2dad-62fa-4e78-a195-f1715b965e2e	Office Automation Products	office-automation-products	51b2ab67-f1b3-4db4-bc2a-320f0a44d3ad	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
7cd393ac-49db-4f91-9f95-819393ffdf66	Ventilators	ventilators	8d2c585e-bbc7-465c-bad8-194b753c07cf	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
f60bfdea-5662-4d3e-b277-b4b51c2050db	Infusion Pumps	infusion-pumps	8d2c585e-bbc7-465c-bad8-194b753c07cf	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
3022616f-e56c-4498-ab75-99cb536c9327	Patient Monitors	patient-monitors	8d2c585e-bbc7-465c-bad8-194b753c07cf	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
58c7e237-8511-49c5-bce2-94e928c019d8	Surgical Lights	surgical-lights	757604f4-4e68-4c59-bf1c-57804e0b3a2c	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
9e7a6f6c-a1b5-4a64-a244-4361e2087dba	OT Tables	ot-tables	757604f4-4e68-4c59-bf1c-57804e0b3a2c	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
5bbe18b9-f0e5-4e9e-9876-8cc6f8adce0a	Surgical Instruments	surgical-instruments	757604f4-4e68-4c59-bf1c-57804e0b3a2c	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
4850b01e-6e8b-4d43-9921-cf9afe6971e9	Medical Gloves	medical-gloves	ccd24bd5-9497-4301-937e-39fe03184d59	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
149b2854-2220-4fab-b839-ab5f8eb1768a	Face Masks	face-masks	ccd24bd5-9497-4301-937e-39fe03184d59	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
38dedd8f-c891-4144-8ce1-f28ab4964570	Syringes	syringes	ccd24bd5-9497-4301-937e-39fe03184d59	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
77cf51d6-ab8e-48f5-8104-8696cee85295	Industrial & Engineering Goods	industrial-engineering-goods	ffdc9b19-1a1e-4b06-ad0c-0784a072da02	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
429e9905-9dc7-48fb-8709-c2861bc48724	Casual Dresses	casual-dresses	24210f8d-70da-4994-848a-2419d23a6cbe	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
d5e33037-6d8d-4f6f-8f07-365b004847b5	Party Wear Dresses	party-wear-dresses	24210f8d-70da-4994-848a-2419d23a6cbe	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
7d08db2d-a0af-4b2a-a53d-dbba0a72ee86	Chinos	chinos	399d72ac-933f-4faa-a3d2-48f7a2c53843	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
f6be909f-5ea0-44cd-84e8-de4aa3c1b85a	Cargo Pants	cargo-pants	399d72ac-933f-4faa-a3d2-48f7a2c53843	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
f0c40a3a-7ab1-4c6b-8246-f0fddbb5c7f7	Ladies Wear	ladies-wear	b6330998-c5d2-489a-a471-5b9c49faec28	1	t	2026-01-30 04:54:58.816013	\N	\N	\N
6e0b32c8-a635-4a25-99d9-6f6be6e41280	Designer Kurtis	designer-kurtis	1ca750bf-9dde-4ca0-b729-f50979827d60	3	t	2026-01-30 04:59:04.981527	\N	\N	\N
156cef46-6346-448e-8509-0a74ec23660e	Cotton Kurti	cotton-kurti	1ca750bf-9dde-4ca0-b729-f50979827d60	3	t	2026-01-30 04:59:04.981527	\N	\N	\N
7a6b0eed-3c2f-4e4a-897d-78a4ee2f5ad1	Ladies Woolen Kurti	ladies-woolen-kurti	1ca750bf-9dde-4ca0-b729-f50979827d60	3	t	2026-01-30 04:59:04.981527	\N	\N	\N
1ff93ec3-4f2d-4a25-ab92-c3cc99f0b68f	Mens Wear	mens-wear	b6330998-c5d2-489a-a471-5b9c49faec28	1	t	2026-01-30 05:01:27.441373	\N	\N	\N
cb8922e7-3eee-478b-ba4c-918beebe4425	Footwear	footwear	b6330998-c5d2-489a-a471-5b9c49faec28	1	t	2026-01-30 05:01:27.441373	\N	\N	\N
3367a6ac-881a-45f0-8c2a-13ef5f9a66d4	Fabrics	fabrics	b6330998-c5d2-489a-a471-5b9c49faec28	1	t	2026-01-30 05:01:27.441373	\N	\N	\N
5b11e707-b125-4b22-9834-38c77f1ec669	Display & Accessories	display-accessories	b6330998-c5d2-489a-a471-5b9c49faec28	1	t	2026-01-30 05:01:27.441373	\N	\N	\N
80d15f29-a379-48cb-8ac8-e35c0c3ca728	Casual Shirt	casual-shirt	f3d22cbb-c327-48d6-8cbd-8b2eab9098e2	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
b79020d9-dea3-4069-8557-ec43c5a1731b	Formal Shirt	formal-shirt	f3d22cbb-c327-48d6-8cbd-8b2eab9098e2	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
6e4f4abd-60cc-4f2e-aff8-ad13402e0d68	Polo T-Shirt	polo-tshirt	060b1e2c-1cb8-47e6-952e-cb8618b3f7fb	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
d2f8a48a-3e2d-4d79-a971-bab80d3d8413	Round Neck T-Shirt	round-neck-tshirt	060b1e2c-1cb8-47e6-952e-cb8618b3f7fb	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
433a2bce-88b5-4c07-ab76-11b1c22ad538	Leather Safety Shoes	leather-safety-shoes	c67a25c2-ee56-4d16-ab56-5f9a23dad443	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
eb9c8627-25fa-49f1-ad33-7b6713d60f6d	Steel Toe Shoes	steel-toe-shoes	c67a25c2-ee56-4d16-ab56-5f9a23dad443	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
91d9d015-eb9c-4fbc-a0c1-994de96c70eb	Viscose Fabric	viscose-fabric	b6707f91-1465-40a5-a4b1-22a1202c6845	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
dd2e01b4-458c-4fc8-b529-206ccd8863b7	Rayon Fabric	rayon-fabric	b6707f91-1465-40a5-a4b1-22a1202c6845	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
c4642215-f5d2-4c3a-a9e7-7dd7f4175adb	Female Mannequin	female-mannequin	5cb0ad46-7ba6-4253-a5be-728656ea3e68	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
2c246fe9-f1a4-4231-8767-bc93663771ba	Male Mannequin	male-mannequin	5cb0ad46-7ba6-4253-a5be-728656ea3e68	3	t	2026-01-30 05:02:23.413017	\N	\N	\N
b309e040-8fb2-464a-862e-0434f0070103	Printed Shirt	printed-shirt	f3d22cbb-c327-48d6-8cbd-8b2eab9098e2	3	t	2026-01-30 05:09:24.85962	\N	\N	\N
67c59162-b9be-497e-ab03-5d53c7936f76	Designer Shirt	designer-shirt	f3d22cbb-c327-48d6-8cbd-8b2eab9098e2	3	t	2026-01-30 05:09:24.85962	\N	\N	\N
7b43ca1d-e6d2-4e09-bdd5-0dbf3ce88780	Graphic Printed T-Shirt	graphic-printed-tshirt	060b1e2c-1cb8-47e6-952e-cb8618b3f7fb	3	t	2026-01-30 05:09:24.85962	\N	\N	\N
adb84b40-311f-4e76-9e64-8e7ca474f26c	Jogger Pants	jogger-pants	399d72ac-933f-4faa-a3d2-48f7a2c53843	3	t	2026-01-30 05:09:24.85962	\N	\N	\N
59a3835a-01a6-41ac-ad16-4d21b6ce7804	Evening Dresses	evening-dresses	24210f8d-70da-4994-848a-2419d23a6cbe	3	t	2026-01-30 05:09:24.85962	\N	\N	\N
e0204c66-ae19-4824-a73a-7f7e593fdfe3	Leather Jackets	leather-jackets	78337080-7005-49e7-9f3c-d66edc7d4a49	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
25e75b78-2790-42b4-a5d0-bde00831da46	Men Blazer	men-blazer	0cc5e86a-3a9a-4e98-a128-5bffa866e403	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
f5a16d54-0b2d-4a68-84bc-ca3269cc44b6	Printed Leggings	printed-leggings	fd297788-d7ac-42d2-b44d-7fc903ca15cc	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
8dff6caf-4576-4cf3-a36d-84ad89111541	Men Vest	men-vest	0f42b9e9-fbf3-4343-be03-29bbdbb841ff	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
9b79475b-7e61-4aec-a5cf-84bf56dc06f0	Leather Gloves	leather-gloves	78337080-7005-49e7-9f3c-d66edc7d4a49	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
d04e8a15-9230-4fc6-ba65-d3edc2f2dc3b	Men Brief	men-brief	0f42b9e9-fbf3-4343-be03-29bbdbb841ff	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
af8f0eae-22bc-4bd5-a379-6ce1c5aaf861	Knitwear	knitwear	0cc5e86a-3a9a-4e98-a128-5bffa866e403	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
151e3a78-8fad-4e36-afdf-38c55ba15b39	Pantyhose	pantyhose	fd297788-d7ac-42d2-b44d-7fc903ca15cc	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
c594a1b4-6dea-40a4-aeac-7b956d22a9c2	Men Underwear	men-underwear	0f42b9e9-fbf3-4343-be03-29bbdbb841ff	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
c1f825cc-a580-4a3a-8e7e-f2ec7e504b0b	Women Blazer	women-blazer	0cc5e86a-3a9a-4e98-a128-5bffa866e403	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
1369754a-f698-4ef9-ac27-26a408831b94	Readymade Garments	readymade-garments	391fa82d-cdb5-4dc6-adf0-1998bc37488b	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
0e2ab575-882b-41d4-8090-b1f95331dcbd	Ladies T-Shirts	ladies-tshirts	391fa82d-cdb5-4dc6-adf0-1998bc37488b	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
72678fc4-1f96-4800-af80-517c3225aa54	Leggings	leggings	fd297788-d7ac-42d2-b44d-7fc903ca15cc	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
a5740228-aa1d-42b7-9e47-6eecb1e22df6	Ladies Tights	ladies-tights	fd297788-d7ac-42d2-b44d-7fc903ca15cc	3	t	2026-01-30 05:13:18.43372	\N	\N	\N
cb4fd98d-7ecd-4291-ad1e-4f90aa8287de	Kids Wear	kids-wear	b6330998-c5d2-489a-a471-5b9c49faec28	1	t	2026-01-30 05:17:24.906475	\N	\N	\N
1350f1b1-ae30-4702-abe5-0d317374b3f7	Accessories	accessories	b6330998-c5d2-489a-a471-5b9c49faec28	1	t	2026-01-30 05:17:24.906475	\N	\N	\N
008b581b-ebdc-4c7e-9c2c-29ba980f39bb	Hand Knitting Needles	hand-knitting-needles	8616a155-5077-4fbb-82cd-de1f7aa76aad	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
ddd26cc4-e5dd-4f4a-a8bb-66893b20ac5a	Sewing Machine Needle	sewing-machine-needle	8616a155-5077-4fbb-82cd-de1f7aa76aad	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
7d265fee-96b7-495e-9c74-cec7a280a4b0	Warm Gloves	warm-gloves	0432ff55-6e8d-41d6-aa33-c3ea359f31c3	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
5f8fd199-d14b-425f-83f3-72ded7321409	Hand Gloves	hand-gloves	0432ff55-6e8d-41d6-aa33-c3ea359f31c3	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
4c24c9a0-b75d-45e4-903f-5de51cd81a00	Stick Umbrella	stick-umbrella	4cf182cc-17c4-4c74-b979-7d1e611464ce	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
1f751aa0-6d0d-4ac2-92b8-4018c6ac0cfb	Promotional Umbrella	promotional-umbrella	4cf182cc-17c4-4c74-b979-7d1e611464ce	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
25e41ee4-e03e-4547-82be-dfe6e114b7a7	Garden Umbrella	garden-umbrella	4cf182cc-17c4-4c74-b979-7d1e611464ce	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
9dca58f5-0db0-40e2-822f-527f7c81fbb8	Sewing Needles	sewing-needles	8616a155-5077-4fbb-82cd-de1f7aa76aad	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
10ac7e6f-596e-451c-88a8-c271106205c0	Bath Mitts	bath-mitts	0432ff55-6e8d-41d6-aa33-c3ea359f31c3	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
a43fbeba-a6ed-40bc-a765-ccfce8d29ede	Knitting Needles	knitting-needles	8616a155-5077-4fbb-82cd-de1f7aa76aad	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
2bd40a8c-74e8-443d-8381-041d57e178b6	Household Gloves	household-gloves	0432ff55-6e8d-41d6-aa33-c3ea359f31c3	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
41466061-5518-44d7-bf06-e16c5c4afc8d	Raincoats & Rainsuits	raincoats-rainsuits	4cf182cc-17c4-4c74-b979-7d1e611464ce	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
ffc95d8a-2f44-4bfa-8643-7bee3b44cec8	Designer Kurti	designer-kurti	1ca750bf-9dde-4ca0-b729-f50979827d60	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
4f084571-9d7a-4acf-a74d-6a7016fa99ce	Cotton Gloves	cotton-gloves	0432ff55-6e8d-41d6-aa33-c3ea359f31c3	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
801c7662-586f-4531-b4ad-9d59f2b590b3	Umbrella	umbrella	4cf182cc-17c4-4c74-b979-7d1e611464ce	3	t	2026-01-30 05:31:04.024079	\N	\N	\N
e66291f1-4877-479c-a627-ff42aee417e1	Industrial Chemicals	industrial-chemicals	361f4057-73cb-45ce-bc0f-1429e7bf3fc4	1	t	2026-01-30 05:40:11.194794	\N	\N	\N
06764d35-d299-4923-b369-1cddfcdf59ba	Oils, Grease & Lubricants	oils-grease-lubricants	f86f2847-42b3-4af8-8909-ff251582eee5	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
88068012-7b8d-4d49-9de3-04e6291a9d62	Storage Tanks, Drums & Containers	storage-tanks-drums-containers	37ff4c60-3a32-4edc-a9c8-52436b1768ef	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
003939f4-990d-4c41-ad95-9497968a379f	Insulators & Insulation Materials	insulators-insulation-materials	3f6aca8b-0dd6-4e53-a63a-35731d142cb1	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
a20ed8b4-50e3-4791-ba68-dc5faf5a9ffb	Filters & Filtration Systems	filters-filtration-systems	3f6aca8b-0dd6-4e53-a63a-35731d142cb1	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
00dbf2fe-4395-4526-be93-969cf4f0d31d	Hoses & Hose Fittings	hoses-hose-fittings	681915d2-8269-4a16-8b7f-b740326f3531	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
a5432fdb-7330-4771-85fc-be5c6a8c3701	Rubber & Rubber Products	rubber-rubber-products	681915d2-8269-4a16-8b7f-b740326f3531	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
de263583-76a7-4fac-b9d3-7c2d5aea5eb7	Pumps, Pumping Machines & Spares	pumps-pumping-machines-spares	81357905-d08d-40cc-a245-9cf31114809d	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
78049344-2982-48a2-9a42-e8a07a1ceed2	Carts, Dollies & Trolleys	carts-dollies-trolleys	37ff4c60-3a32-4edc-a9c8-52436b1768ef	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
e23a87ae-7137-41ff-9fb5-838991b7e837	Drilling Bits, Collets & Chucks	drilling-bits-collets-chucks	681915d2-8269-4a16-8b7f-b740326f3531	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
4ef94b8f-f118-44b9-a488-26e21e087734	Industrial Coolers, Blowers & Fans	industrial-coolers-blowers-fans	681915d2-8269-4a16-8b7f-b740326f3531	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
a363a3c9-2e71-44fe-8b57-8d87956fbb74	Separators, Strainers & Purifiers	separators-strainers-purifiers	681915d2-8269-4a16-8b7f-b740326f3531	2	t	2026-01-30 07:10:02.101146	\N	\N	\N
60c6e56e-fac1-4698-a52b-7dc73590e886	Silica Sand	silica-sand	c07a8352-643e-4677-a3a1-3fa45af95b39	3	t	2026-01-30 05:40:11.194794	\N	\N	\N
96043b5b-2235-4a84-8eff-bbae16c63483	SPM Machine	spm-machine	442ed3c8-1084-4746-a11d-0d2cfe9815b3	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
68bd93df-3f64-434d-8f16-246e723af1ce	Laundry Washing Machine	laundry-washing-machine	442ed3c8-1084-4746-a11d-0d2cfe9815b3	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
ec016164-3985-4672-acc4-ccb071d5e820	Oil Filters	oil-filters	442ed3c8-1084-4746-a11d-0d2cfe9815b3	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
5d2dc10e-bcfc-40ab-8641-702b6a493af8	Industrial Machinery	industrial-machinery	442ed3c8-1084-4746-a11d-0d2cfe9815b3	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
d36b85ed-972e-4edb-b529-3c1f3cca62e3	Ironing Machines	ironing-machines	7603ba47-f749-44f6-99ee-a0c019e700ba	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
bde361bb-1241-4705-8490-f61a13ff1244	White Silica Sand	white-silica-sand	c07a8352-643e-4677-a3a1-3fa45af95b39	3	t	2026-01-30 05:40:11.194794	\N	\N	\N
7a124996-2a5c-441f-9f7b-d6cf53a26e81	Textile Processing Machines	textile-processing-machines	7603ba47-f749-44f6-99ee-a0c019e700ba	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
d61297e5-56e7-4b9e-9564-cd4f23f0e842	Textile Machinery Spares	textile-machinery-spares	7603ba47-f749-44f6-99ee-a0c019e700ba	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
fd1397a1-0036-420d-ac67-665e773bc3f2	Textile Machines	textile-machines	7603ba47-f749-44f6-99ee-a0c019e700ba	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
fb5c7e00-aaf7-4dcb-a9f3-6950f1acd39f	Water Treatment Plants	water-treatment-plants	49d2e00c-170c-4fea-8c62-932d2ffb2668	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
14e843b1-5007-4270-912c-f66ec0c32c8c	Industrial RO Plant	industrial-ro-plant	49d2e00c-170c-4fea-8c62-932d2ffb2668	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
b39beece-0a24-44d9-aefe-610d3e9c6f34	Filter Media	filter-media	49d2e00c-170c-4fea-8c62-932d2ffb2668	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
38a3d977-cd15-41ae-aad9-b0f6c0fa451d	RO Machines	ro-machines	49d2e00c-170c-4fea-8c62-932d2ffb2668	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
a5bc89b5-1c4d-4c83-9f89-41b922e236fc	Reverse Osmosis Plants	reverse-osmosis-plants	49d2e00c-170c-4fea-8c62-932d2ffb2668	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
98502f70-a6db-46d1-9d8b-3e7982c5b7b1	Pneumatic Machines	pneumatic-machines	5b5c1ee6-c75a-48c7-a0b1-b20d931c7e46	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
db993c5c-e035-4f22-8ff5-142aec96a624	Air Regulators	air-regulators	5b5c1ee6-c75a-48c7-a0b1-b20d931c7e46	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
49c87f58-5517-4480-8f00-711550c3ebcd	Hydraulic Components	hydraulic-components	5b5c1ee6-c75a-48c7-a0b1-b20d931c7e46	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
e799061f-f171-4828-82ae-abb3da402f8a	Hydraulic Press	hydraulic-press	5b5c1ee6-c75a-48c7-a0b1-b20d931c7e46	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
7bf3843f-a061-4767-bd36-a01b09324695	Hydraulic Machines	hydraulic-machines	5b5c1ee6-c75a-48c7-a0b1-b20d931c7e46	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
4ae11d19-4ad3-4593-9965-1460e0e7a8ee	Pizza Oven	pizza-oven	d04c2763-bcfc-4fd7-bbbc-22b28a283c71	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
d5adf9fc-b0ba-43d5-af87-a5fae984c865	Milk Processing Plant & Machines	milk-processing-plant-machines	d04c2763-bcfc-4fd7-bbbc-22b28a283c71	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
c20292be-363e-484d-b873-ca7d87f5f2c3	Dough Mixers	dough-mixers	d04c2763-bcfc-4fd7-bbbc-22b28a283c71	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
31156c27-5abc-4fec-8ac3-e7c97152f223	Bakery Oven	bakery-oven	d04c2763-bcfc-4fd7-bbbc-22b28a283c71	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
c41dfc53-1cf8-4942-ae0c-a558dc7d960f	Bakery Machinery	bakery-machinery	d04c2763-bcfc-4fd7-bbbc-22b28a283c71	2	t	2026-01-30 07:41:32.744686	\N	\N	\N
10cee6d1-b79c-44d3-bb8b-0bfb65497ba5	Construction Chemical	construction-chemical	c07a8352-643e-4677-a3a1-3fa45af95b39	3	t	2026-01-30 05:40:11.194794	\N	\N	\N
59c11065-2b21-4235-b0e9-9f8b6dd9d597	Conveyor Pizza Oven	conveyor-pizza-oven	52dfcd5c-d5a7-40f9-a881-1c6232c52b09	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
dca90b33-0697-4919-a8fb-29d0133ef499	Chimney	chimney	52dfcd5c-d5a7-40f9-a881-1c6232c52b09	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
f10bde3e-a7b9-4d12-a05c-0696d7c5cd5a	Furnace Parts	furnace-parts	52dfcd5c-d5a7-40f9-a881-1c6232c52b09	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
5fbb4886-834e-4c06-a179-f4ccf007fc3e	Industrial Ovens	industrial-ovens	52dfcd5c-d5a7-40f9-a881-1c6232c52b09	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
7bcefede-c22a-4482-8376-c2620429ddee	Industrial Furnaces	industrial-furnaces	52dfcd5c-d5a7-40f9-a881-1c6232c52b09	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
d837278d-00dc-4702-b1ce-06b6cde3635b	Inorganic Salts	inorganic-salts	c07a8352-643e-4677-a3a1-3fa45af95b39	3	t	2026-01-30 05:40:11.194794	\N	\N	\N
b5210ac6-ef6f-4f7a-9461-f087904fc365	Rice Mill Machinery	rice-mill-machinery	dce35e68-263b-4da3-9dcc-39c4f8f4e1e9	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
9a3d4d7f-01a7-4661-9e1b-ce140b569902	Flour Mill Stone	flour-mill-stone	dce35e68-263b-4da3-9dcc-39c4f8f4e1e9	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
e7e5423b-ca33-4ae8-a153-2f2c3d866160	Rice Mill	rice-mill	dce35e68-263b-4da3-9dcc-39c4f8f4e1e9	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
47ccd199-eac4-4267-91ea-72220c869a3c	Flour Mill	flour-mill	dce35e68-263b-4da3-9dcc-39c4f8f4e1e9	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
0f561e2e-7cc0-491b-8b33-95e80bc863df	Shaping Machine	shaping-machine	e5569b1e-d427-4508-bc74-70a55a4da9ab	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
ce8821ec-85c1-47a7-ae0b-e700b030c0e9	Threading Machine	threading-machine	e5569b1e-d427-4508-bc74-70a55a4da9ab	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
d4e977ba-d83a-4899-8cf1-ecf762ae83f2	Sheet Metal Machinery	sheet-metal-machinery	e5569b1e-d427-4508-bc74-70a55a4da9ab	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
76571867-a77c-416e-ac65-51277db51ed9	Bending Machine	bending-machine	e5569b1e-d427-4508-bc74-70a55a4da9ab	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
288335d3-f276-43cd-a4b7-1df504c4f43b	Shearing Machines	shearing-machines	e5569b1e-d427-4508-bc74-70a55a4da9ab	2	t	2026-01-30 07:41:59.18885	\N	\N	\N
3cae8c9a-b174-47b3-81f9-6e4ff89cfffa	Security & Surveillance	security-surveillance	c253297f-1c47-4378-bf7f-178437852a25	1	t	2026-01-30 05:44:38.292214	\N	\N	\N
51b2ab67-f1b3-4db4-bc2a-320f0a44d3ad	Office & Automation	office-automation	c253297f-1c47-4378-bf7f-178437852a25	1	t	2026-01-30 05:44:38.292214	\N	\N	\N
63626805-001a-4d43-9794-6ce74ea9ba31	Industrial Electronics	industrial-electronics	c253297f-1c47-4378-bf7f-178437852a25	1	t	2026-01-30 05:44:38.292214	\N	\N	\N
a6b1051d-6e62-46a5-a4f6-597e6664dbcb	Power & Energy	power-energy	c253297f-1c47-4378-bf7f-178437852a25	1	t	2026-01-30 05:44:38.292214	\N	\N	\N
562304dc-3f62-4274-bbb5-999567bd33bf	Lighting & Electricals	lighting-electricals	c253297f-1c47-4378-bf7f-178437852a25	1	t	2026-01-30 05:44:38.292214	\N	\N	\N
99dfbb5c-44ac-4b90-aaae-5b19e21f0320	Batteries	batteries	a6b1051d-6e62-46a5-a4f6-597e6664dbcb	2	t	2026-01-30 05:46:07.955882	\N	\N	\N
421610cc-150c-4cf2-af6b-00146fd39d31	Plastic Packaging	plastic-packaging	fbffb7f6-e550-41ab-b4d6-82db8dc63360	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
cac824dc-cf01-42db-a0dc-eeb67f15e735	Paper Packaging	paper-packaging	fbffb7f6-e550-41ab-b4d6-82db8dc63360	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
a82921ab-cdc4-4938-8c4e-eff8028fa6e3	Metal Packaging	metal-packaging	fbffb7f6-e550-41ab-b4d6-82db8dc63360	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
7dbf3313-c062-45dc-8cf3-54640d90376e	Glass Packaging	glass-packaging	fbffb7f6-e550-41ab-b4d6-82db8dc63360	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
f3677996-8397-4a3d-875a-5ed8bab23929	Adhesive Tapes	adhesive-tapes	32eaa9e0-2296-4140-9eb7-6805d2cdb2cc	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
703aafbe-3071-4c10-ac44-0c0806c9566c	Respiratory Equipment	respiratory-equipment	ac4931fe-abca-44e7-8963-2a056a0ab515	2	t	2026-01-30 09:08:28.355668	\N	\N	\N
39689a44-b5fa-4100-a2b4-6d44efe570b6	Third Party Logistics (3PL)	third-party-logistics	1f7b833b-6d0f-443c-a96e-651dfce7f26c	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
effbb5a4-2833-4918-a629-1d5a4e85ed48	Cold Chain Logistics	cold-chain-logistics	1f7b833b-6d0f-443c-a96e-651dfce7f26c	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
36ab8014-f317-40e3-b7c8-4e28e0b075fb	Freight Forwarding	freight-forwarding	1f7b833b-6d0f-443c-a96e-651dfce7f26c	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
f9d99a9e-b6d7-4ddc-8522-1d4d785cb65a	Road Transportation	road-transportation	eb6d3e36-29dd-4699-87fe-3434e6745567	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
2ecf7ca1-025b-4138-8ffe-2b38749b1f7d	Rail Transportation	rail-transportation	eb6d3e36-29dd-4699-87fe-3434e6745567	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
8901c66c-911a-4d7e-8a44-26bc375d34d8	Lithium Battery	lithium-battery	99dfbb5c-44ac-4b90-aaae-5b19e21f0320	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
a12c6b17-9122-4204-862f-5ebf8c98f3cb	Fingerprint Scanners	fingerprint-scanners	116d2dad-62fa-4e78-a195-f1715b965e2e	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
5f479a77-46be-43c0-aeac-18e28794c3c3	Temperature Controller	temperature-controller	c46c2872-ae9f-40d5-abc2-ee4b96192d21	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
afa5235e-4392-4f70-83de-ad60466fcf03	Xerox Machines	xerox-machines	116d2dad-62fa-4e78-a195-f1715b965e2e	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
76914705-3105-40c9-a774-53e5666042d0	VFD	vfd	0a69c99f-7ab9-4b1d-9a0d-90349852fb68	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
9ab8fb54-65a6-4f32-82f7-d43913e91bb7	Level Controllers	level-controllers	c46c2872-ae9f-40d5-abc2-ee4b96192d21	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
59cf6856-bac5-4475-8586-e2a4513b9699	Armoured Cable	armoured-cable	ec3ab96b-0bfb-4682-8b6c-20fed6037285	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
7d2c178c-565f-4ccd-bf95-79802e26088a	House Wire	house-wire	ec3ab96b-0bfb-4682-8b6c-20fed6037285	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
41967ae5-1a8a-4bcd-b169-6e03184451ff	Electric Vehicle Battery	electric-vehicle-battery	99dfbb5c-44ac-4b90-aaae-5b19e21f0320	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
d700a45e-3654-48a2-8b26-3023081c9235	Street Lights	street-lights	2a544106-a9a2-4d52-b79e-44b96d3bda9e	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
f722257d-d99e-4a8e-aaf2-01ed1ca9407a	Thyristors	thyristors	309583a2-6c24-4b0b-b31d-12f502aa1f71	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
479ef3fd-8ca0-4035-8666-743fad7a1a58	HMI	hmi	0a69c99f-7ab9-4b1d-9a0d-90349852fb68	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
e313d33d-6554-4ec9-a09d-b8d5efd4ab10	Panel Light	panel-light	2a544106-a9a2-4d52-b79e-44b96d3bda9e	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
5f373122-8ea5-4fbd-a8ec-c129613186e3	Light Emitting Diode	light-emitting-diode	309583a2-6c24-4b0b-b31d-12f502aa1f71	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
b0a6bc83-4279-43c8-801e-af90f53720ee	Inverter Batteries	inverter-batteries	99dfbb5c-44ac-4b90-aaae-5b19e21f0320	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
e37e10d4-417d-4187-8f90-c9480d2f1987	PLC	plc	0a69c99f-7ab9-4b1d-9a0d-90349852fb68	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
67b8f665-ce08-42e1-a0b6-17f3cc1777d8	Proximity Sensor	proximity-sensor	584edb18-9ce2-4e53-bef6-8cac193ffd16	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
f194e461-7562-498d-a1dc-008939cc0349	Motor Controllers	motor-controllers	c46c2872-ae9f-40d5-abc2-ee4b96192d21	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
8dd7079b-c3c1-43a3-8f66-7a743ebf75ec	Servo Stabilizer	servo-stabilizer	834abc49-07d4-44d4-8a75-c8e621f7cee2	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
a3b8475d-7b57-423e-a731-558401c9b6e3	Voltage Stabilizer	voltage-stabilizer	834abc49-07d4-44d4-8a75-c8e621f7cee2	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
a3c9ad43-f1e3-4586-a996-02677b9a7fb5	Load Cell	load-cell	584edb18-9ce2-4e53-bef6-8cac193ffd16	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
1fe84071-b074-4d2d-a3e8-2576ecc5abdc	Solar Panels	solar-panels	821519b3-e76f-4141-aa86-8e98bc7bc2d3	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
30d55d69-bfcc-4005-b25f-e0a0fca7aef8	Multifunction Printer	multifunction-printer	116d2dad-62fa-4e78-a195-f1715b965e2e	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
f92f52fd-83a5-4ae8-ab00-6c9ef883f0c4	Sensor for Home & Office	sensor-home-office	584edb18-9ce2-4e53-bef6-8cac193ffd16	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
90ba60a6-f395-4d64-81b3-ef42036bcc55	Level Sensors	level-sensors	584edb18-9ce2-4e53-bef6-8cac193ffd16	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
4f94f313-977b-42a5-8ed3-55809ebfb844	Solar Inverter	solar-inverter	821519b3-e76f-4141-aa86-8e98bc7bc2d3	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
ec059760-5ef6-430a-8f4a-66b9470b4610	Power Cable	power-cable	ec3ab96b-0bfb-4682-8b6c-20fed6037285	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
2bc53bc5-3e30-40ca-bc86-8c72654f9ca0	Solar Pumps	solar-pumps	821519b3-e76f-4141-aa86-8e98bc7bc2d3	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
74e9b5e4-732c-4812-b684-a17f3846f38e	Automatic Voltage Stabilizer	automatic-voltage-stabilizer	834abc49-07d4-44d4-8a75-c8e621f7cee2	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
681457e1-01c3-480e-9596-49170beeba3e	Flood Lights	flood-lights	2a544106-a9a2-4d52-b79e-44b96d3bda9e	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
8de7f06e-1a62-48ce-b360-e7fac93f0109	Integrated Circuits	integrated-circuits	309583a2-6c24-4b0b-b31d-12f502aa1f71	3	t	2026-01-30 05:47:39.602673	\N	\N	\N
c7d6cf80-124f-4a98-a981-0400ddd19f80	Navigation Device	navigation-device	5afcaff7-3b0d-4e46-b5d0-8f9f505f6ea8	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
4d92e478-fa43-4931-9c02-6700136dd820	Vehicle Tracking System	vehicle-tracking-system	5afcaff7-3b0d-4e46-b5d0-8f9f505f6ea8	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
1941c4d5-f70a-4a44-8fb6-d4d07124e96e	Fingerprint Access Control	fingerprint-access-control	a55d5d55-9ec1-4923-9f70-8608fa2e6dcf	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
1fa906bb-83c7-4a31-ae41-16503eb55a0b	GPS Tracker	gps-tracker	5afcaff7-3b0d-4e46-b5d0-8f9f505f6ea8	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
c60afdbc-806c-493b-8a1e-49db77a386b6	NVR	nvr	42471e1f-13aa-4d70-a88d-432d6e08fbba	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
6a7bb2b5-cce8-4890-b1be-b61be9cdcd70	CCTV Accessories	cctv-accessories	42471e1f-13aa-4d70-a88d-432d6e08fbba	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
fd6ae113-34e8-4ed4-869d-4f52d6b526a9	RFID Access Control	rfid-access-control	a55d5d55-9ec1-4923-9f70-8608fa2e6dcf	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
4e39fe16-cd7c-4f16-9dc5-9991acf5a69f	CCTV Camera	cctv-camera	42471e1f-13aa-4d70-a88d-432d6e08fbba	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
38358622-b91b-466e-a17f-96de185bcc03	Face Recognition System	face-recognition-system	a55d5d55-9ec1-4923-9f70-8608fa2e6dcf	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
40872473-17ab-4f87-9b3c-f5617bd5a1c2	DVR	dvr	42471e1f-13aa-4d70-a88d-432d6e08fbba	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
a4749c5b-0571-4534-8359-f7fd63eb15cf	Biometric Attendance Machine	biometric-attendance-machine	a55d5d55-9ec1-4923-9f70-8608fa2e6dcf	3	t	2026-01-30 05:49:11.284153	\N	\N	\N
8d2c585e-bbc7-465c-bad8-194b753c07cf	Medical Devices	medical-devices	bb8aa523-8c5d-480e-b270-816592cc5207	1	t	2026-01-30 06:38:03.434208	\N	\N	\N
e67d1fe4-1dc0-4d88-b435-927f444934ad	Hospital Furniture	hospital-furniture	bb8aa523-8c5d-480e-b270-816592cc5207	1	t	2026-01-30 06:38:03.434208	\N	\N	\N
1d449bb3-6def-4f91-abf7-0f407fb6c252	Diagnostic Equipment	diagnostic-equipment	bb8aa523-8c5d-480e-b270-816592cc5207	1	t	2026-01-30 06:38:03.434208	\N	\N	\N
757604f4-4e68-4c59-bf1c-57804e0b3a2c	Surgical Equipment	surgical-equipment	bb8aa523-8c5d-480e-b270-816592cc5207	1	t	2026-01-30 06:38:03.434208	\N	\N	\N
ccd24bd5-9497-4301-937e-39fe03184d59	Medical Consumables	medical-consumables	bb8aa523-8c5d-480e-b270-816592cc5207	1	t	2026-01-30 06:38:03.434208	\N	\N	\N
0e2243cb-46c8-409d-8ca7-2c191e2dd04e	Air Transportation	air-transportation	eb6d3e36-29dd-4699-87fe-3434e6745567	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
2d93ae7d-20c9-41c4-bb1d-271042d86828	Warehouse Services	warehouse-services	bac57472-2572-4374-9125-53a0cd7dde08	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
edb13281-53ab-40cd-bdbe-4beab70b5b24	Cold Storage	cold-storage	bac57472-2572-4374-9125-53a0cd7dde08	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
852fc852-e969-4a9b-af21-93617fe2aa6d	Inventory Management	inventory-management	bac57472-2572-4374-9125-53a0cd7dde08	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
e2f06426-eea2-4b64-9c3b-6443ed9eb1f5	Patient Stretchers	patient-stretchers	e67d1fe4-1dc0-4d88-b435-927f444934ad	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
06d9935f-2e61-4738-866d-2dec17b9b314	Wheel Chairs	wheel-chairs	e67d1fe4-1dc0-4d88-b435-927f444934ad	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
798f8e56-d190-436b-be9f-f77f467cb087	Hospital Beds	hospital-beds	e67d1fe4-1dc0-4d88-b435-927f444934ad	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
7f57d811-da2d-4c36-88a4-5368f624cdaf	Ultrasound Machines	ultrasound-machines	1d449bb3-6def-4f91-abf7-0f407fb6c252	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
dc6f43e4-fece-43d6-90ce-c00819c683c8	X Ray Machines	x-ray-machines	1d449bb3-6def-4f91-abf7-0f407fb6c252	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
d6f12ba4-41bb-4910-a910-6f6a0cec1306	ECG Machines	ecg-machines	1d449bb3-6def-4f91-abf7-0f407fb6c252	2	t	2026-01-30 06:40:52.466051	\N	\N	\N
4c0650e1-23d9-4874-b4c5-7b5b3d16e9d5	Multiparameter Monitor	multiparameter-monitor	3022616f-e56c-4498-ab75-99cb536c9327	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
d4fdc101-b397-4d05-9e5b-2d2a100fae8d	ICU Monitor	icu-monitor	3022616f-e56c-4498-ab75-99cb536c9327	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
45a662d5-7256-4c2b-9734-f4dc7f0998e7	Portable ECG Machine	portable-ecg-machine	d6f12ba4-41bb-4910-a910-6f6a0cec1306	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
3637f3a1-3feb-47d8-8371-ec5444f52ee8	12 Channel ECG	12-channel-ecg	d6f12ba4-41bb-4910-a910-6f6a0cec1306	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
0becfd53-2893-43f0-84ec-a2d8d04d7ac3	ICU Bed	icu-bed	798f8e56-d190-436b-be9f-f77f467cb087	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
97640b78-c5f0-4137-bcf2-9df540374b80	Electric Hospital Bed	electric-hospital-bed	798f8e56-d190-436b-be9f-f77f467cb087	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
d00b13de-8dfc-4e7d-abca-76a48ced7728	Disposable Syringe	disposable-syringe	38dedd8f-c891-4144-8ce1-f28ab4964570	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
bb9ffaac-85a3-4086-9581-2ea691902f1a	Insulin Syringe	insulin-syringe	38dedd8f-c891-4144-8ce1-f28ab4964570	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
2c30ca9c-08cf-4b97-89a4-1961e90cfd8e	Latex Gloves	latex-gloves	4850b01e-6e8b-4d43-9921-cf9afe6971e9	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
33c3dce2-b035-47f0-a654-e10a52465ddf	Nitrile Gloves	nitrile-gloves	4850b01e-6e8b-4d43-9921-cf9afe6971e9	3	t	2026-01-30 06:41:02.564021	\N	\N	\N
1a7805b2-3389-4327-adc2-80cd5d331d24	Portable Ventilator	portable-ventilator	7cd393ac-49db-4f91-9f95-819393ffdf66	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
f51e3fa0-0d53-4dc8-a530-46a67cc1a94e	ICU Ventilator	icu-ventilator	7cd393ac-49db-4f91-9f95-819393ffdf66	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
941b576d-26cf-4a3d-a075-45c061f4e486	Syringe Infusion Pump	syringe-infusion-pump	f60bfdea-5662-4d3e-b277-b4b51c2050db	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
c38a38b4-64e5-4d14-a6d8-2c091eb3724f	Volumetric Infusion Pump	volumetric-infusion-pump	f60bfdea-5662-4d3e-b277-b4b51c2050db	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
3ff01528-40d0-4dc8-a3ca-54fde16f9d81	Ambulance Stretcher	ambulance-stretcher	e2f06426-eea2-4b64-9c3b-6443ed9eb1f5	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
afe8922b-8438-4cc5-8691-4ff27fde26c1	Foldable Stretcher	foldable-stretcher	e2f06426-eea2-4b64-9c3b-6443ed9eb1f5	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
6b9a8f13-da55-41f4-9880-00f21a0317c5	Electric Wheel Chair	electric-wheel-chair	06d9935f-2e61-4738-866d-2dec17b9b314	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
3dc2c6ed-c516-4334-a464-6ecb37cad2db	Manual Wheel Chair	manual-wheel-chair	06d9935f-2e61-4738-866d-2dec17b9b314	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
6946c970-621b-4fd8-9f31-e4ccd3e2b485	Color Doppler Ultrasound	color-doppler-ultrasound	7f57d811-da2d-4c36-88a4-5368f624cdaf	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
8007b21f-2284-4ec7-833e-564bcb5b99d6	Portable Ultrasound Machine	portable-ultrasound-machine	7f57d811-da2d-4c36-88a4-5368f624cdaf	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
44a1e61c-6053-4d11-9838-788ab2189900	Portable X Ray Machine	portable-x-ray-machine	dc6f43e4-fece-43d6-90ce-c00819c683c8	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
5f8e0b36-18ba-4ade-b39a-f3b2d43f577b	Digital X Ray Machine	digital-x-ray-machine	dc6f43e4-fece-43d6-90ce-c00819c683c8	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
7d9f1241-7f7d-450d-815a-5f4ad72696c5	N95 Mask	n95-mask	149b2854-2220-4fab-b839-ab5f8eb1768a	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
f7e078c6-044a-4291-9876-318d78e1f94e	Surgical Face Mask	surgical-face-mask	149b2854-2220-4fab-b839-ab5f8eb1768a	3	t	2026-01-30 06:45:26.218104	\N	\N	\N
49fd685e-e8ee-4b0a-ab86-81e99cf48a90	Hydraulic OT Table	hydraulic-ot-table	9e7a6f6c-a1b5-4a64-a244-4361e2087dba	3	t	2026-01-30 06:46:49.298507	\N	\N	\N
d679f28c-75bc-461d-ba97-50450c2e4a22	Electric OT Table	electric-ot-table	9e7a6f6c-a1b5-4a64-a244-4361e2087dba	3	t	2026-01-30 06:46:49.298507	\N	\N	\N
be855ba5-0500-4e0c-8c8f-14bb1884ff00	Forceps	surgical-forceps	5bbe18b9-f0e5-4e9e-9876-8cc6f8adce0a	3	t	2026-01-30 06:46:49.298507	\N	\N	\N
20a22e01-1b35-4d5f-ac59-7824867d2c7e	Scissors	surgical-scissors	5bbe18b9-f0e5-4e9e-9876-8cc6f8adce0a	3	t	2026-01-30 06:46:49.298507	\N	\N	\N
0f07da09-ec2a-456b-8af1-12b8bbc57d49	Needle Holder	needle-holder	5bbe18b9-f0e5-4e9e-9876-8cc6f8adce0a	3	t	2026-01-30 06:46:49.298507	\N	\N	\N
7ec171ca-5922-47f8-9432-34d1cecf86d7	LED Surgical Light	led-surgical-light	58c7e237-8511-49c5-bce2-94e928c019d8	3	t	2026-01-30 06:46:49.298507	\N	\N	\N
19be353c-1968-420f-8fc8-5a128c568ec5	Ceiling Mounted OT Light	ceiling-mounted-ot-light	58c7e237-8511-49c5-bce2-94e928c019d8	3	t	2026-01-30 06:46:49.298507	\N	\N	\N
681915d2-8269-4a16-8b7f-b740326f3531	Industrial Supplies	industrial-supplies	45df472c-83e4-4ed0-8713-7c17bafc4783	1	t	2026-01-30 06:53:51.226509	\N	\N	\N
81357905-d08d-40cc-a245-9cf31114809d	Pumping & Fluid Systems	pumping-fluid-systems	45df472c-83e4-4ed0-8713-7c17bafc4783	1	t	2026-01-30 06:57:33.813939	\N	\N	\N
37ff4c60-3a32-4edc-a9c8-52436b1768ef	Material Handling & Storage	material-handling-storage	45df472c-83e4-4ed0-8713-7c17bafc4783	1	t	2026-01-30 06:57:33.813939	\N	\N	\N
f86f2847-42b3-4af8-8909-ff251582eee5	Lubrication & Oils	lubrication-oils	45df472c-83e4-4ed0-8713-7c17bafc4783	1	t	2026-01-30 06:57:33.813939	\N	\N	\N
ffdc9b19-1a1e-4b06-ad0c-0784a072da02	Industrial Components	industrial-components	45df472c-83e4-4ed0-8713-7c17bafc4783	1	t	2026-01-30 06:57:33.813939	\N	\N	\N
3f6aca8b-0dd6-4e53-a63a-35731d142cb1	Filtration & Insulation	filtration-insulation	45df472c-83e4-4ed0-8713-7c17bafc4783	1	t	2026-01-30 06:57:33.813939	\N	\N	\N
a3a124a9-89a0-4210-945e-2a147702dff8	Sea Cargo	sea-cargo	db304d5e-b03c-4cd4-bce4-5c3f78a283c6	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
c93689d7-2470-4440-869b-3970d476a09b	Air Cargo	air-cargo	db304d5e-b03c-4cd4-bce4-5c3f78a283c6	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
24de8db1-8ea4-44e1-9a0c-e1271e771c5d	Container Shipping	container-shipping	db304d5e-b03c-4cd4-bce4-5c3f78a283c6	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
18deeac1-9aad-4157-a70c-c5cb8eb0ed6a	Domestic Courier	domestic-courier	dae8ebbc-08ac-452e-bf54-cf7ed9ade9d5	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
91c6eb3e-1bf5-4b3f-9143-46749bd2f6fb	International Courier	international-courier	dae8ebbc-08ac-452e-bf54-cf7ed9ade9d5	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
b6d51dc0-6cef-4e45-be71-cd3484cbd3cf	Last Mile Delivery	last-mile-delivery	dae8ebbc-08ac-452e-bf54-cf7ed9ade9d5	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
c77259f1-fccf-4109-98bd-b6a282e1abd1	Supply Chain Consulting	supply-chain-consulting	32803943-e2db-4971-8360-55824200f263	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
fd707983-7823-421c-85b7-5a5f9c1b0f02	Demand Planning	demand-planning	32803943-e2db-4971-8360-55824200f263	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
768d1991-d229-4704-b630-9bf47f139f76	Vendor Management	vendor-management	32803943-e2db-4971-8360-55824200f263	2	t	2026-01-30 09:10:38.83123	\N	\N	\N
7e33a745-e04f-4f11-96ef-64d4f37ef6ca	Electric Pump	electric-pump	de263583-76a7-4fac-b9d3-7c2d5aea5eb7	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
b02b5db2-c02c-4419-940d-295d11bed2d9	Industrial Pumps	industrial-pumps	de263583-76a7-4fac-b9d3-7c2d5aea5eb7	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
1b00bada-1f6b-49db-a24f-92ea16fdbb2f	Air Pumps	air-pumps	de263583-76a7-4fac-b9d3-7c2d5aea5eb7	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
4ab23d13-5dc9-460a-958d-a969bbdd68ad	Water Pumps	water-pumps	de263583-76a7-4fac-b9d3-7c2d5aea5eb7	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
acc8024d-b734-460c-8f55-3e66ecc489a0	Waste Oils	waste-oils	06764d35-d299-4923-b369-1cddfcdf59ba	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
ab83c37c-753d-4ee3-bf6f-e124807b3862	Engine Oil	engine-oil	06764d35-d299-4923-b369-1cddfcdf59ba	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
2d12d725-52f8-4425-ae28-32838454f31e	Industrial Oils	industrial-oils	06764d35-d299-4923-b369-1cddfcdf59ba	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
37da7ea4-948f-4a54-82a8-6b870dc769bb	Automotive Oils	automotive-oils	06764d35-d299-4923-b369-1cddfcdf59ba	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
6d88ef60-d452-47ce-aced-c8116818d054	Mineral Oils	mineral-oils	06764d35-d299-4923-b369-1cddfcdf59ba	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
9baac88e-ae05-47e3-ab1c-11472a6fd332	Rubber Hose Pipe	rubber-hose-pipe	00dbf2fe-4395-4526-be93-969cf4f0d31d	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
f97faaba-427d-45a1-80a2-c34a205b567c	Plastic Hose Pipe	plastic-hose-pipe	00dbf2fe-4395-4526-be93-969cf4f0d31d	3	t	2026-01-30 07:10:12.035106	\N	\N	\N
c07a8352-643e-4677-a3a1-3fa45af95b39	Industrial Chemicals & Supplies	industrial-chemicals-supplies	e66291f1-4877-479c-a627-ff42aee417e1	2	t	2026-01-30 05:40:00.96722	\N	\N	\N
904eda38-53e5-4c86-a85c-c0612a72e1f7	Filters	filters	a20ed8b4-50e3-4791-ba68-dc5faf5a9ffb	3	t	2026-01-30 07:20:02.829982	\N	\N	\N
99e8886d-1ae4-4cea-8065-df5e5e5d4d8e	Oil Filter Machine	oil-filter-machine	a20ed8b4-50e3-4791-ba68-dc5faf5a9ffb	3	t	2026-01-30 07:20:02.829982	\N	\N	\N
3bf906ec-c4a3-44a9-9882-21c58138eb83	Air Filters	air-filters	a20ed8b4-50e3-4791-ba68-dc5faf5a9ffb	3	t	2026-01-30 07:20:02.829982	\N	\N	\N
9c54c537-dafd-491c-b3fe-669ef4469134	Sand Filters	sand-filters	a20ed8b4-50e3-4791-ba68-dc5faf5a9ffb	3	t	2026-01-30 07:20:02.829982	\N	\N	\N
8b3c3e0d-b572-4be1-8fed-d186cd051d41	Air Compressor Filter	air-compressor-filter	a20ed8b4-50e3-4791-ba68-dc5faf5a9ffb	3	t	2026-01-30 07:20:02.829982	\N	\N	\N
9e42fef5-c081-42d3-b341-4eabb977af7b	Insulation Material	insulation-material	003939f4-990d-4c41-ad95-9497968a379f	3	t	2026-01-30 07:20:15.30762	\N	\N	\N
4232e001-c922-4b5c-97fc-45a7709e3cb2	Refractory Well Block	refractory-well-block	003939f4-990d-4c41-ad95-9497968a379f	3	t	2026-01-30 07:20:15.30762	\N	\N	\N
81a787a8-eff2-4a8b-9d76-dfe9f497ed4a	Electrical Insulators	electrical-insulators	003939f4-990d-4c41-ad95-9497968a379f	3	t	2026-01-30 07:20:15.30762	\N	\N	\N
9cee5dc2-c3c2-419c-95ac-830262616777	Fibre Paper	fibre-paper	003939f4-990d-4c41-ad95-9497968a379f	3	t	2026-01-30 07:20:15.30762	\N	\N	\N
5bc605fe-15ab-42c9-bfa8-6e898ddbeffb	Electrical Insulation Materials	electrical-insulation-materials	003939f4-990d-4c41-ad95-9497968a379f	3	t	2026-01-30 07:20:15.30762	\N	\N	\N
27ab9248-e3cd-4e38-ad15-a3f3f71a04c1	Couplings	couplings	77cf51d6-ab8e-48f5-8104-8696cee85295	3	t	2026-01-30 07:20:24.662992	\N	\N	\N
4b880b20-875c-4eac-bc60-96b1b0b54187	Plastic Joint	plastic-joint	77cf51d6-ab8e-48f5-8104-8696cee85295	3	t	2026-01-30 07:20:24.662992	\N	\N	\N
22d31b6a-09f3-4327-b7a4-76ce4c7a7c67	Plastic Coupling	plastic-coupling	77cf51d6-ab8e-48f5-8104-8696cee85295	3	t	2026-01-30 07:20:24.662992	\N	\N	\N
d6badb7d-1045-4873-9b11-fb80abca63ed	Pipe Couplings	pipe-couplings	77cf51d6-ab8e-48f5-8104-8696cee85295	3	t	2026-01-30 07:20:24.662992	\N	\N	\N
bb4636ce-3f25-404d-ae28-e09881ec2f94	Metal Ladder	metal-ladder	77cf51d6-ab8e-48f5-8104-8696cee85295	3	t	2026-01-30 07:20:24.662992	\N	\N	\N
d4bf627b-72ba-4848-b2ea-40de249d2abc	Rubber Products	rubber-products	a5432fdb-7330-4771-85fc-be5c6a8c3701	3	t	2026-01-30 07:20:35.150694	\N	\N	\N
950b555d-1609-4080-a122-014e12199b47	Molded Rubber Products	molded-rubber-products	a5432fdb-7330-4771-85fc-be5c6a8c3701	3	t	2026-01-30 07:20:35.150694	\N	\N	\N
2fe741ff-861b-4d64-ba6f-eacac3841390	Rubber Tubes, Cords & Profiles	rubber-tubes-cords-profiles	a5432fdb-7330-4771-85fc-be5c6a8c3701	3	t	2026-01-30 07:20:35.150694	\N	\N	\N
edcda0b6-08ce-42ee-af24-5240afba8778	Rubber Parts	rubber-parts	a5432fdb-7330-4771-85fc-be5c6a8c3701	3	t	2026-01-30 07:20:35.150694	\N	\N	\N
63ac451f-c6d3-4159-b72f-2eeb176ad962	Rubber Sheets	rubber-sheets	a5432fdb-7330-4771-85fc-be5c6a8c3701	3	t	2026-01-30 07:20:35.150694	\N	\N	\N
fc22ebbc-c65d-45a7-8ab4-6431416ace75	Blowers	blowers	4ef94b8f-f118-44b9-a488-26e21e087734	3	t	2026-01-30 07:20:43.540045	\N	\N	\N
e754e065-e788-4115-9cde-bc4cf4b6739b	Air Ventilation System	air-ventilation-system	4ef94b8f-f118-44b9-a488-26e21e087734	3	t	2026-01-30 07:20:43.540045	\N	\N	\N
c14e024b-359a-4bfc-9fb6-a423404d830c	Industrial Fans	industrial-fans	4ef94b8f-f118-44b9-a488-26e21e087734	3	t	2026-01-30 07:20:43.540045	\N	\N	\N
4965d406-39d0-4f86-8aa5-4e3ad4bebd74	Cooling Fans	cooling-fans	4ef94b8f-f118-44b9-a488-26e21e087734	3	t	2026-01-30 07:20:43.540045	\N	\N	\N
7f312a8e-4597-4339-b423-ed90fb380bfc	Industrial Air Cooler	industrial-air-cooler	4ef94b8f-f118-44b9-a488-26e21e087734	3	t	2026-01-30 07:20:43.540045	\N	\N	\N
bd0a642e-51a6-4227-afd9-2eb0434ecbcd	Separator Equipment	separator-equipment	a363a3c9-2e71-44fe-8b57-8d87956fbb74	3	t	2026-01-30 07:20:52.240889	\N	\N	\N
84ea68ce-5805-45bc-b807-8753a2620a6b	Sorting Machinery	sorting-machinery	a363a3c9-2e71-44fe-8b57-8d87956fbb74	3	t	2026-01-30 07:20:52.240889	\N	\N	\N
a0a98ba3-deb5-43fc-af80-28384aec4526	Demister Pad	demister-pad	a363a3c9-2e71-44fe-8b57-8d87956fbb74	3	t	2026-01-30 07:20:52.240889	\N	\N	\N
b84d4699-1129-4776-a1ff-20451cbd44fb	Oil Purifier	oil-purifier	a363a3c9-2e71-44fe-8b57-8d87956fbb74	3	t	2026-01-30 07:20:52.240889	\N	\N	\N
94200196-6390-440f-963c-9b3f962be057	Separating Machine	separating-machine	a363a3c9-2e71-44fe-8b57-8d87956fbb74	3	t	2026-01-30 07:20:52.240889	\N	\N	\N
1b94141d-8311-481e-ae5b-89341d3252a0	Tapping Tools	tapping-tools	e23a87ae-7137-41ff-9fb5-838991b7e837	3	t	2026-01-30 07:22:47.442867	\N	\N	\N
ba99c18c-5242-4984-8e3e-28851e0edca5	Drill Bits	drill-bits	e23a87ae-7137-41ff-9fb5-838991b7e837	3	t	2026-01-30 07:22:47.442867	\N	\N	\N
71519456-a986-4592-9865-c0ba9c39393a	Drill Chucks	drill-chucks	e23a87ae-7137-41ff-9fb5-838991b7e837	3	t	2026-01-30 07:22:47.442867	\N	\N	\N
792fea10-775c-49af-a2d3-ce60c047c000	Rock Drill Bits	rock-drill-bits	e23a87ae-7137-41ff-9fb5-838991b7e837	3	t	2026-01-30 07:22:47.442867	\N	\N	\N
39ae138d-7ccc-4b3c-9e32-b58cb02fe124	Lathe Chucks	lathe-chucks	e23a87ae-7137-41ff-9fb5-838991b7e837	3	t	2026-01-30 07:22:47.442867	\N	\N	\N
03fc94dc-37e3-4911-87ff-3b08d5743492	Hose Fittings & Parts	hose-fittings-parts	00dbf2fe-4395-4526-be93-969cf4f0d31d	3	t	2026-01-30 07:22:55.682361	\N	\N	\N
fa7b015e-6e8e-44fc-8cba-74e5c9c6b29b	Plastic Hose & Fittings	plastic-hose-fittings	00dbf2fe-4395-4526-be93-969cf4f0d31d	3	t	2026-01-30 07:22:55.682361	\N	\N	\N
0c0f12c3-ba6a-43df-99b0-c3027b063cd7	Hose Pipes	hose-pipes	00dbf2fe-4395-4526-be93-969cf4f0d31d	3	t	2026-01-30 07:22:55.682361	\N	\N	\N
6457f34e-f18b-4f68-9e88-385aa1110f81	Trolley	trolley	78049344-2982-48a2-9a42-e8a07a1ceed2	3	t	2026-01-30 07:23:05.76401	\N	\N	\N
3735fcb6-9549-4fbb-9fd1-a4e8fd151207	Metal Trolley	metal-trolley	78049344-2982-48a2-9a42-e8a07a1ceed2	3	t	2026-01-30 07:23:05.76401	\N	\N	\N
447caffc-efce-4716-bae4-a9f7cf95a649	Stainless Steel Trolley	stainless-steel-trolley	78049344-2982-48a2-9a42-e8a07a1ceed2	3	t	2026-01-30 07:23:05.76401	\N	\N	\N
99c87729-a43c-40cc-ac13-b6e59a700812	Utility Trolley	utility-trolley	78049344-2982-48a2-9a42-e8a07a1ceed2	3	t	2026-01-30 07:23:05.76401	\N	\N	\N
7d982c14-e0fd-44f2-aab4-c4906285cfc0	Material Handling Trolleys	material-handling-trolleys	78049344-2982-48a2-9a42-e8a07a1ceed2	3	t	2026-01-30 07:23:05.76401	\N	\N	\N
5b6fee48-8e5b-47e1-ab26-e54198d15389	Water Storage Tanks	water-storage-tanks	88068012-7b8d-4d49-9de3-04e6291a9d62	3	t	2026-01-30 07:23:13.802884	\N	\N	\N
fb79810a-e55e-44fe-b3ed-ddb3c535be69	Plastic Water Tank	plastic-water-tank	88068012-7b8d-4d49-9de3-04e6291a9d62	3	t	2026-01-30 07:23:13.802884	\N	\N	\N
b7c5062a-bbbc-4f10-9fa8-1d7b624273cd	Drums	drums	88068012-7b8d-4d49-9de3-04e6291a9d62	3	t	2026-01-30 07:23:13.802884	\N	\N	\N
d8bad07a-42cd-4c0e-9b98-0752c024dcb9	Metal Tank	metal-tank	88068012-7b8d-4d49-9de3-04e6291a9d62	3	t	2026-01-30 07:23:13.802884	\N	\N	\N
442ed3c8-1084-4746-a11d-0d2cfe9815b3	Machines & Equipments	machines-equipments	61c6cf98-9504-4845-8178-0d139164e538	1	t	2026-01-30 07:33:07.622886	\N	\N	\N
7603ba47-f749-44f6-99ee-a0c019e700ba	Apparel & Textile Machinery	apparel-textile-machinery	61c6cf98-9504-4845-8178-0d139164e538	1	t	2026-01-30 07:33:07.622886	\N	\N	\N
49d2e00c-170c-4fea-8c62-932d2ffb2668	Water Treatment & Purification Plant	water-treatment-purification-plant	61c6cf98-9504-4845-8178-0d139164e538	1	t	2026-01-30 07:33:07.622886	\N	\N	\N
52dfcd5c-d5a7-40f9-a881-1c6232c52b09	Industrial Furnaces & Ovens	industrial-furnaces-ovens	61c6cf98-9504-4845-8178-0d139164e538	1	t	2026-01-30 07:33:07.622886	\N	\N	\N
5b5c1ee6-c75a-48c7-a0b1-b20d931c7e46	Hydraulic & Pneumatic Machines	hydraulic-pneumatic-machines	61c6cf98-9504-4845-8178-0d139164e538	1	t	2026-01-30 07:33:07.622886	\N	\N	\N
a86062c1-0039-46e0-97ac-393e16805cc4	Pneumatic Regulator	pneumatic-regulator	db993c5c-e035-4f22-8ff5-142aec96a624	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
dce35e68-263b-4da3-9dcc-39c4f8f4e1e9	Food Grains & Nut Processing Machine	food-grains-nut-processing-machine	61c6cf98-9504-4845-8178-0d139164e538	1	t	2026-01-30 07:33:07.622886	\N	\N	\N
d04c2763-bcfc-4fd7-bbbc-22b28a283c71	Bakery & Dairy Machinery	bakery-dairy-machinery	61c6cf98-9504-4845-8178-0d139164e538	1	t	2026-01-30 07:33:07.622886	\N	\N	\N
e5569b1e-d427-4508-bc74-70a55a4da9ab	Bending & Metalwork Machines	bending-metalwork-machines	61c6cf98-9504-4845-8178-0d139164e538	1	t	2026-01-30 07:33:07.622886	\N	\N	\N
5ec7eb43-e883-4ad6-a1f7-ce9b5ee98853	Chemical Reagents & Catalysts	chemical-reagents-catalysts	508e5373-ceee-4a5b-896c-1e44012386d4	2	t	2026-01-30 09:50:15.122981	\N	\N	\N
5953cbe4-7999-4ba6-8ac5-89cb5f4c1382	Dyes & Color Additives	dyes-color-additives	508e5373-ceee-4a5b-896c-1e44012386d4	2	t	2026-01-30 09:50:15.122981	\N	\N	\N
5893151a-c029-47ca-835a-3da238b2c58e	Textile, Dyeing & Finishing Chemical	textile-dyeing-finishing-chemical	508e5373-ceee-4a5b-896c-1e44012386d4	2	t	2026-01-30 09:50:15.122981	\N	\N	\N
eab72714-c994-4589-99dd-523323d78524	Petroleum & Petrochemical Products	petroleum-petrochemical-products	4d82aa51-b8b2-48c2-abba-c9261defd2f6	2	t	2026-01-30 09:50:15.122981	\N	\N	\N
71cb343a-eba9-4c9a-85f5-e5abb7c9fcbb	Natural, Industrial & Medical Gases	natural-industrial-medical-gases	4d82aa51-b8b2-48c2-abba-c9261defd2f6	2	t	2026-01-30 09:50:15.122981	\N	\N	\N
78dce81e-9372-4a86-8db8-2a09965818f4	Natural and Synthetic Resins	natural-synthetic-resins	63f1823a-783a-4b61-9895-37b5ec264032	2	t	2026-01-30 09:50:15.122981	\N	\N	\N
1536cef8-98ba-4409-833d-a25dccb38f23	PET Granules & Plastic Raw Material	pet-granules-plastic-raw-material	63f1823a-783a-4b61-9895-37b5ec264032	2	t	2026-01-30 09:50:15.122981	\N	\N	\N
ab3e2183-3a30-414b-95a3-995e9189bba4	Organic and Inorganic Solvents	organic-inorganic-solvents	c31216fd-95bb-4ac8-a3d2-0de359335889	2	t	2026-01-30 09:50:15.122981	\N	\N	\N
21c28acb-9600-4d7c-8242-7b6ac807ece5	CNC Machine	cnc-machine	5d2dc10e-bcfc-40ab-8641-702b6a493af8	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
effa6b81-9a29-46fc-9e51-6a2d78a95fd6	Lathe Machine	lathe-machine	5d2dc10e-bcfc-40ab-8641-702b6a493af8	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
10b04f33-fc05-48a0-9d26-f477bf8e17c8	Milling Machine	milling-machine	5d2dc10e-bcfc-40ab-8641-702b6a493af8	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
2665a6d5-5b08-4b79-ba7c-30fc7192fce1	Hydraulic Oil Filter	hydraulic-oil-filter	ec016164-3985-4672-acc4-ccb071d5e820	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
a0a20f3b-52e0-4de6-9714-4c434c1ce60c	Fuel Oil Filter	fuel-oil-filter	ec016164-3985-4672-acc4-ccb071d5e820	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
358706bb-44a5-4d00-bb61-73a7f2897568	Spinning Machine	spinning-machine	fd1397a1-0036-420d-ac67-665e773bc3f2	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
11c9735c-7036-4c87-84c3-8744c415f12d	Weaving Machine	weaving-machine	fd1397a1-0036-420d-ac67-665e773bc3f2	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
7516fd9c-fbd0-497b-b4e6-aa20bd485024	Bread Making Machine	bread-making-machine	c41dfc53-1cf8-4942-ae0c-a558dc7d960f	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
e973ac0c-178d-4ffc-a362-3447fba182fc	Cake Mixer	cake-mixer	c41dfc53-1cf8-4942-ae0c-a558dc7d960f	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
ed4f0a59-78e6-420d-ae67-10773fdbdb01	Hydraulic Jack	hydraulic-jack	7bf3843f-a061-4767-bd36-a01b09324695	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
6bc6fbad-7cab-4d06-9e9b-f32f1371d7f0	Hydraulic Power Pack	hydraulic-power-pack	7bf3843f-a061-4767-bd36-a01b09324695	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
e6d210ce-c32e-4083-9ece-9a6398b97b09	Commercial RO System	commercial-ro-system	38a3d977-cd15-41ae-aad9-b0f6c0fa451d	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
3639e958-f01c-4bf2-9d3d-e9bdfcad1a0e	Industrial RO System	industrial-ro-system	38a3d977-cd15-41ae-aad9-b0f6c0fa451d	3	t	2026-01-30 07:41:45.25111	\N	\N	\N
5fa4be0f-b1bb-4017-82df-89485e758ad5	Automatic Oil Filter	automatic-oil-filter	99e8886d-1ae4-4cea-8065-df5e5e5d4d8e	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
c0e59347-1e95-4bc3-8c42-c771bce284e0	Special Purpose Machine	special-purpose-machine	96043b5b-2235-4a84-8eff-bbae16c63483	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
19353c89-50ba-4199-99bd-4f68f7919183	Commercial Washer	commercial-washer	68bd93df-3f64-434d-8f16-246e723af1ce	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
6693a3d7-74cf-4e45-8727-d638110727dd	Heavy Duty Machine	heavy-duty-machine	5d2dc10e-bcfc-40ab-8641-702b6a493af8	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
fbcf77d6-15b9-402d-9e05-f452a28bf8c3	Finishing Machine	finishing-machine	7a124996-2a5c-441f-9f7b-d6cf53a26e81	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
a262a435-c247-41e2-a53a-cd1a57fef2d5	Dyeing Machine	dyeing-machine	7a124996-2a5c-441f-9f7b-d6cf53a26e81	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
e3c12a46-ec4e-4bde-a6fa-ab5edaab3a75	Machine Accessories	machine-accessories	d61297e5-56e7-4b9e-9564-cd4f23f0e842	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
3f1c3bcb-d71a-41a2-9a9c-04983ec8cea0	Spare Parts	spare-parts	d61297e5-56e7-4b9e-9564-cd4f23f0e842	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
a4c83eeb-6d60-476c-ba2e-2b767c516ae4	Effluent Treatment Plant	effluent-treatment-plant	fb5c7e00-aaf7-4dcb-a9f3-6950f1acd39f	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
51a4ac16-b85f-48a5-9a0a-f256259f1174	Activated Carbon	activated-carbon	b39beece-0a24-44d9-aefe-610d3e9c6f34	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
401d3212-90f8-4bcd-858b-56bca148e1c2	Industrial RO Machine	industrial-ro-machine	38a3d977-cd15-41ae-aad9-b0f6c0fa451d	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
093364a4-2d12-4a94-9bcb-d519d484c8e2	Commercial RO Plant	commercial-ro-plant	a5bc89b5-1c4d-4c83-9f89-41b922e236fc	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
54bb6cba-4e45-42c1-a2a5-ec888af7bf26	Pneumatic Press	pneumatic-press	98502f70-a6db-46d1-9d8b-3e7982c5b7b1	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
e6a8e85f-dca7-4526-bf06-3444f8a10141	Hydraulic Valves	hydraulic-valves	49c87f58-5517-4480-8f00-711550c3ebcd	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
0946f30b-a695-4110-bb49-30b6a3413362	Rotary Oven	rotary-oven	4ae11d19-4ad3-4593-9965-1460e0e7a8ee	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
bbd7f559-efa7-4eaf-ae92-e82a576c305d	Deck Oven	deck-oven	4ae11d19-4ad3-4593-9965-1460e0e7a8ee	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
13d52f03-bd89-4648-8ab4-ad6142cec283	Milk Homogenizer	milk-homogenizer	d5adf9fc-b0ba-43d5-af87-a5fae984c865	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
559c825c-7a4e-4977-abb1-a323504fcb3b	Milk Pasteurizer	milk-pasteurizer	d5adf9fc-b0ba-43d5-af87-a5fae984c865	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
50e95c3f-e513-448a-8371-2eccca68de31	Planetary Mixer	planetary-mixer	c20292be-363e-484d-b873-ca7d87f5f2c3	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
e35aba7b-9e22-46cd-a920-2d6708ce0fa4	Spiral Mixer	spiral-mixer	c20292be-363e-484d-b873-ca7d87f5f2c3	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
898490bd-9b20-4c1c-b728-8de641ae18d2	Continuous Pizza Oven	continuous-pizza-oven	59c11065-2b21-4235-b0e9-9f8b6dd9d597	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
1ecc74dc-5726-4124-9844-5de3bc2af3b9	Industrial Chimney	industrial-chimney	dca90b33-0697-4919-a8fb-29d0133ef499	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
c5e9400e-4ee4-4478-9b74-8d5209c425d1	Heating Elements	heating-elements	f10bde3e-a7b9-4d12-a05c-0696d7c5cd5a	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
dc85b969-d9f4-4669-b060-79a04e2c5eee	Drying Oven	drying-oven	5fbb4886-834e-4c06-a179-f4ccf007fc3e	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
6d4bd54c-d2cc-434f-a74f-1a83ce67b95d	Melting Furnace	melting-furnace	7bcefede-c22a-4482-8376-c2620429ddee	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
7569e01e-b7c7-47d2-8cc9-65b8e85a6297	Rice Polisher	rice-polisher	b5210ac6-ef6f-4f7a-9461-f087904fc365	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
02fb29d4-e800-4334-b6f9-aee48fb87b28	Emery Stone	emery-stone	9a3d4d7f-01a7-4661-9e1b-ce140b569902	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
21fb6eba-6ac6-49e7-bb01-78457dabbccb	Rice Huller	rice-huller	e7e5423b-ca33-4ae8-a153-2f2c3d866160	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
a815cae8-9e34-48e2-8166-f3317480df7d	Domestic Flour Mill	domestic-flour-mill	47ccd199-eac4-4267-91ea-72220c869a3c	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
95bc35fa-0e0e-416a-8488-fe667d787ed2	Hydraulic Shaper	hydraulic-shaper	0f561e2e-7cc0-491b-8b33-95e80bc863df	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
e9307ca6-281a-4925-9e31-55125a26d863	Pipe Threading Machine	pipe-threading-machine	ce8821ec-85c1-47a7-ae0b-e700b030c0e9	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
649d8499-0755-4220-8c97-1cbbaa53dc13	Press Brake	press-brake	d4e977ba-d83a-4899-8cf1-ecf762ae83f2	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
d6737994-9cc5-424c-a476-d699a5137bee	Hydraulic Shearing Machine	hydraulic-shearing-machine	288335d3-f276-43cd-a4b7-1df504c4f43b	3	t	2026-01-30 07:44:16.967568	\N	\N	\N
cc7c525d-6502-4eac-8452-f8ebd28624a3	Steam Ironing Machine	steam-ironing-machine	d36b85ed-972e-4edb-b529-3c1f3cca62e3	3	t	2026-01-30 07:47:57.133521	\N	\N	\N
1632dca3-f00b-44d9-af42-7df9d834ad7f	Industrial Ironing Table	industrial-ironing-table	d36b85ed-972e-4edb-b529-3c1f3cca62e3	3	t	2026-01-30 07:47:57.133521	\N	\N	\N
dd188422-8208-4ac3-877a-e0c944009c1a	Rotary Rack Oven	rotary-rack-oven	31156c27-5abc-4fec-8ac3-e7c97152f223	3	t	2026-01-30 07:47:57.133521	\N	\N	\N
442541b6-a46a-4005-9cb5-d33c54904acc	Hydraulic Bending Machine	hydraulic-bending-machine	76571867-a77c-416e-ac65-51277db51ed9	3	t	2026-01-30 07:47:57.133521	\N	\N	\N
14b20801-c3d8-4911-9d68-9f070dfde62b	CNC Bending Machine	cnc-bending-machine	76571867-a77c-416e-ac65-51277db51ed9	3	t	2026-01-30 07:47:57.133521	\N	\N	\N
d5c50b9f-60af-479c-94a7-6226ef0a61cf	C Frame Hydraulic Press	c-frame-hydraulic-press	e799061f-f171-4828-82ae-abb3da402f8a	3	t	2026-01-30 07:49:46.923959	\N	\N	\N
b16ef5a1-f987-4564-9db9-6412a66bd1ae	H Frame Hydraulic Press	h-frame-hydraulic-press	e799061f-f171-4828-82ae-abb3da402f8a	3	t	2026-01-30 07:49:46.923959	\N	\N	\N
d3fe265a-717a-4d92-b8c0-512c42ddfeac	Four Column Hydraulic Press	four-column-hydraulic-press	e799061f-f171-4828-82ae-abb3da402f8a	3	t	2026-01-30 07:49:46.923959	\N	\N	\N
24a527e1-4c02-47ae-a5e9-4fd7905c2834	Brackish Water RO Plant	brackish-water-ro-plant	14e843b1-5007-4270-912c-f66ec0c32c8c	3	t	2026-01-30 07:49:46.923959	\N	\N	\N
cfb9012b-0264-4498-b4c9-ca57a4785c54	RO Water Treatment System	ro-water-treatment-system	14e843b1-5007-4270-912c-f66ec0c32c8c	3	t	2026-01-30 07:49:46.923959	\N	\N	\N
fbffb7f6-e550-41ab-b4d6-82db8dc63360	Packaging Materials	packaging-materials	bb6462ee-cb30-4572-8a69-e45beec8ffbc	1	t	2026-01-30 09:01:16.552424	\N	\N	\N
32eaa9e0-2296-4140-9eb7-6805d2cdb2cc	Packaging Supplies	packaging-supplies	bb6462ee-cb30-4572-8a69-e45beec8ffbc	1	t	2026-01-30 09:01:16.552424	\N	\N	\N
a05a2ad6-6a57-47aa-b2c1-56666d81a879	Packaging Machines	packaging-machines	bb6462ee-cb30-4572-8a69-e45beec8ffbc	1	t	2026-01-30 09:01:16.552424	\N	\N	\N
8fbfa7ae-de12-4dd7-8036-a08fd373c829	Printing & Labelling	printing-labelling	bb6462ee-cb30-4572-8a69-e45beec8ffbc	1	t	2026-01-30 09:01:16.552424	\N	\N	\N
c4743c29-8994-48f0-9099-a59f57d54218	Protective Packaging	protective-packaging	bb6462ee-cb30-4572-8a69-e45beec8ffbc	1	t	2026-01-30 09:01:16.552424	\N	\N	\N
9fad0545-2763-4e06-af68-eb0b37fb2d26	Food Packaging	food-packaging	bb6462ee-cb30-4572-8a69-e45beec8ffbc	1	t	2026-01-30 09:01:16.552424	\N	\N	\N
185fde01-a931-4368-bcff-b34228012aa8	Disinfectant Chemicals	disinfectant-chemicals	5ec7eb43-e883-4ad6-a1f7-ce9b5ee98853	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
c1302076-1982-46ff-9423-b6324528ee52	Laboratory Chemicals	laboratory-chemicals	5ec7eb43-e883-4ad6-a1f7-ce9b5ee98853	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
7ceb1fcf-6cce-4d1a-a1de-4113a113f47f	Organic Acid	organic-acid	5ec7eb43-e883-4ad6-a1f7-ce9b5ee98853	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
5fbb29d3-d944-403e-b0a1-7a10a51cfeab	Sodium Chloride NaCl	sodium-chloride-nacl	5ec7eb43-e883-4ad6-a1f7-ce9b5ee98853	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
84aa5c26-d698-4672-847c-50578da16f8a	Color Pigment	color-pigment	5953cbe4-7999-4ba6-8ac5-89cb5f4c1382	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
1b67e0c4-d518-4e30-957e-c6b7d77bf6f9	Dye Additives	dye-additives	5953cbe4-7999-4ba6-8ac5-89cb5f4c1382	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
fa2252c1-bf60-46ea-8120-4e3b0f500716	Dye Chemicals	dye-chemicals	5953cbe4-7999-4ba6-8ac5-89cb5f4c1382	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
c654fb6b-9282-4b2b-af5c-404345ec5119	Inorganic Pigment	inorganic-pigment	5953cbe4-7999-4ba6-8ac5-89cb5f4c1382	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
610b3dd6-64f8-49aa-9018-c745918c10d8	Pigments	pigments	5953cbe4-7999-4ba6-8ac5-89cb5f4c1382	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
f3d23592-19ce-4913-b497-dc687f257b04	Industrial Chemicals	industrial-chemicals-item	c07a8352-643e-4677-a3a1-3fa45af95b39	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
46e41c40-e122-48e7-b89a-652cf17822de	Acrylic Polymers	acrylic-polymers	78dce81e-9372-4a86-8db8-2a09965818f4	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
45e47334-3292-47c4-8788-8677e83e699d	Epoxy Resins	epoxy-resins	78dce81e-9372-4a86-8db8-2a09965818f4	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
a10d8797-9ceb-46dd-80b7-05b12b1cf336	Liquid Resins	liquid-resins	78dce81e-9372-4a86-8db8-2a09965818f4	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
c029cb5c-47a1-4b2c-bac5-da71163e6bde	Synthetic Resins	synthetic-resins	78dce81e-9372-4a86-8db8-2a09965818f4	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
c1a72392-849a-4e65-ac20-767de04d4ab8	Alcohol Solvents	alcohol-solvents	ab3e2183-3a30-414b-95a3-995e9189bba4	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
57863d5b-3af8-4935-8cf5-e4761fab9f23	Inorganic Acids	inorganic-acids	ab3e2183-3a30-414b-95a3-995e9189bba4	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
dc8806c3-fd80-4b10-a842-f881430d4f34	Mineral Spirits	mineral-spirits	ab3e2183-3a30-414b-95a3-995e9189bba4	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
68d515c6-b5ab-4b34-a995-03e90716370c	Shrink Films	shrink-films	421610cc-150c-4cf2-af6b-00146fd39d31	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
4031af01-0d1e-43fe-99a4-5ad7c1b51a5c	Plastic Pouches	plastic-pouches	421610cc-150c-4cf2-af6b-00146fd39d31	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
4918a959-948c-4ab6-ae4c-ba6b2b2266ab	Poly Bags	poly-bags	421610cc-150c-4cf2-af6b-00146fd39d31	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
2fd4df52-21ef-4ab2-81aa-697aabf8567c	Carton Boxes	carton-boxes	cac824dc-cf01-42db-a0dc-eeb67f15e735	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
38508c1c-2d63-42c0-b108-c32fd5dd55bb	Paper Bags	paper-bags	cac824dc-cf01-42db-a0dc-eeb67f15e735	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
dd92d18b-9df1-4802-a2e5-a110e811c12d	Corrugated Boxes	corrugated-boxes	cac824dc-cf01-42db-a0dc-eeb67f15e735	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
73cec2e7-583f-4268-819d-2a154c390d46	Aluminium Cans	aluminium-cans	a82921ab-cdc4-4938-8c4e-eff8028fa6e3	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
339098e6-e7e1-4d63-8572-61504b091102	Tin Containers	tin-containers	a82921ab-cdc4-4938-8c4e-eff8028fa6e3	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
fed7b59e-c171-44cb-8782-6317c0a80c63	Glass Jars	glass-jars	7dbf3313-c062-45dc-8cf3-54640d90376e	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
cf1664be-06bd-4eb1-8511-70682f17eb7a	Glass Bottles	glass-bottles	7dbf3313-c062-45dc-8cf3-54640d90376e	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
153e1c1d-1631-4f0a-9222-f1942e2d372a	Masking Tape	masking-tape	f3677996-8397-4a3d-875a-5ed8bab23929	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
b14f16cc-03c0-4692-b994-24694bc22977	BOPP Tape	bopp-tape	f3677996-8397-4a3d-875a-5ed8bab23929	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
f557ab26-6e82-4423-a031-4f85f57da582	Steel Straps	steel-straps	1c71b814-702a-4f86-8f62-3b0cc6e54108	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
f8344a34-60e2-4d58-92e9-da9882df0654	PET Straps	pet-straps	1c71b814-702a-4f86-8f62-3b0cc6e54108	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
ae2a2327-53d4-47b1-8dfe-fbe6616600d0	Continuous Sealer	continuous-sealer	ea1da811-1e1f-4d9d-9241-cba781a1b8e1	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
11778984-cbe1-45c7-9ae7-dc95452d6a8e	Heat Sealing Machine	heat-sealing-machine	ea1da811-1e1f-4d9d-9241-cba781a1b8e1	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
fdd7718c-eb9b-4880-bac3-0fd53c332879	Powder Filling Machine	powder-filling-machine	4c0a26ea-d33f-4c88-b6a6-dc6a97fd249c	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
e7f73f93-006f-4367-a4f9-0e5e22307810	Liquid Filling Machine	liquid-filling-machine	4c0a26ea-d33f-4c88-b6a6-dc6a97fd249c	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
df14badd-ce63-466f-bbae-254606a12cff	Stretch Wrapping Machine	stretch-wrapping-machine	26747816-7f73-4e2d-95c4-33ee65c17f02	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
d23f7f91-661b-4194-883a-ece54e39afa9	Shrink Wrapping Machine	shrink-wrapping-machine	26747816-7f73-4e2d-95c4-33ee65c17f02	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
d05f8d68-bceb-4224-8d0a-c8c9f178c903	Label Barcode Printer	label-barcode-printer	47e5d9d3-ee4c-4efd-89b1-29b4cd3ef956	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
d03fb717-419b-424f-a1e4-1d6fe981f138	Thermal Barcode Printer	thermal-barcode-printer	47e5d9d3-ee4c-4efd-89b1-29b4cd3ef956	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
89a67629-fe72-4cb3-aacc-a00e792cd46f	Air Bubble Sheet	air-bubble-sheet	614a72e8-0e0c-4208-ba1e-8efd178d2c4f	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
b6f92faf-2319-47eb-87b5-a05e1f060cf0	Machine Stretch Film	machine-stretch-film	8ca67ed6-3e57-44af-9642-80d98c3d611e	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
96cc26a4-9e1e-430d-a220-56d39856d84c	Manual Stretch Film	manual-stretch-film	8ca67ed6-3e57-44af-9642-80d98c3d611e	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
96e76848-262f-482c-b1be-d54527fe5de4	Plastic Food Boxes	plastic-food-boxes	b99a1564-872d-41d0-87de-8985aba514f2	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
7487e341-e6bc-4d33-8f14-047b8574170e	Disposable Food Containers	disposable-food-containers	b99a1564-872d-41d0-87de-8985aba514f2	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
88bebf2f-70ca-4a7e-bc86-8e94bb9021b2	Vacuum Sealing Machine	vacuum-sealing-machine	8ee881c4-cc52-46b2-b6c4-7145cc8df9be	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
354911b5-284d-4565-b625-e7524d283896	Vacuum Pouches	vacuum-pouches	8ee881c4-cc52-46b2-b6c4-7145cc8df9be	3	t	2026-01-30 09:01:52.47147	\N	\N	\N
a9819d76-a37c-46ef-b9b9-3e0b284fb86c	Barcode Labels	barcode-labels	8adf090b-fd92-4932-9edc-ff2097271464	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
c81016e3-cd52-4d1b-9203-7210a95cda7c	Printed Labels	printed-labels	8adf090b-fd92-4932-9edc-ff2097271464	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
3d0aa901-f879-45f0-803e-2ae8b62b5e61	Self Adhesive Labels	self-adhesive-labels	8adf090b-fd92-4932-9edc-ff2097271464	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
ae53cfe3-4fd9-47b4-bf44-a6c2e4fe3564	Thermal Label Printer	thermal-label-printer	a572c773-8e92-4bae-a42f-9c9558c93dce	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
b9b048df-d63b-4d3c-b433-bfb6da139812	Barcode Label Printer	barcode-label-printer	a572c773-8e92-4bae-a42f-9c9558c93dce	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
006f6b35-4887-4bee-9cb3-6a9511b57a32	Sticker Printing Machine	sticker-printing-machine	a572c773-8e92-4bae-a42f-9c9558c93dce	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
97b813a1-e29c-4195-af3a-188d145caca0	EPE Foam Sheet	epe-foam-sheet	69c98b88-49b0-428e-8d38-d77cbc27f289	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
7d440f12-5a47-4ed7-8399-275559ab030a	PU Foam	pu-foam	69c98b88-49b0-428e-8d38-d77cbc27f289	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
15d749e3-4bfa-4145-a410-6e80b52201fa	Foam Rolls	foam-rolls	69c98b88-49b0-428e-8d38-d77cbc27f289	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
46f91e73-9cf2-497e-aebe-830ccb2330ba	Stretch Sheet	stretch-sheet	8ca67ed6-3e57-44af-9642-80d98c3d611e	3	t	2026-01-30 09:04:00.428696	\N	\N	\N
cf4a6465-3d5c-4942-ae17-23483f1b0b6e	Pharmaceutical Medicines	pharmaceutical-medicines	215c8f28-f3e0-4c90-ae6e-1b9da88cded2	1	t	2026-01-30 09:05:36.213772	\N	\N	\N
ac4931fe-abca-44e7-8963-2a056a0ab515	Medical Equipment	medical-equipment	215c8f28-f3e0-4c90-ae6e-1b9da88cded2	1	t	2026-01-30 09:05:36.213772	\N	\N	\N
ae09d47a-b323-4289-a52e-8cb153731f3c	Medical Supplies	medical-supplies	215c8f28-f3e0-4c90-ae6e-1b9da88cded2	1	t	2026-01-30 09:05:36.213772	\N	\N	\N
7eb82d99-4f1b-424c-aa9a-cb7ac24efea0	Healthcare Services	healthcare-services	215c8f28-f3e0-4c90-ae6e-1b9da88cded2	1	t	2026-01-30 09:05:36.213772	\N	\N	\N
8a2dea46-6c77-4017-b5be-f0cac92fca93	Ayurvedic & Herbal Products	ayurvedic-herbal-products	215c8f28-f3e0-4c90-ae6e-1b9da88cded2	1	t	2026-01-30 09:05:36.213772	\N	\N	\N
51bf6867-f83e-4a9d-9b6b-942d2df4e55a	Surgical Products	surgical-products	215c8f28-f3e0-4c90-ae6e-1b9da88cded2	1	t	2026-01-30 09:05:36.213772	\N	\N	\N
bac622f5-6ffc-48ab-b9f6-292e5ace6383	Thinners	thinners	ab3e2183-3a30-414b-95a3-995e9189bba4	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
8614528c-7fc1-4701-8c2d-74bf06b82bc7	Bitumen	bitumen	eab72714-c994-4589-99dd-523323d78524	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
edd1ef9b-7cd4-4937-8c39-8136ad2c7f09	Crude Oil	crude-oil	eab72714-c994-4589-99dd-523323d78524	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
42b69642-b6c2-4753-b403-8e92b8ce6fcb	Fuel Oils	fuel-oils	eab72714-c994-4589-99dd-523323d78524	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
a0a1781b-9eaa-4488-a913-91c367b7ab8c	Industrial Gas Cylinder	industrial-gas-cylinder	71cb343a-eba9-4c9a-85f5-e5abb7c9fcbb	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
abd26856-6837-473e-9360-41260f1628f6	Medical Oxygen Cylinder	medical-oxygen-cylinder	71cb343a-eba9-4c9a-85f5-e5abb7c9fcbb	3	t	2026-01-30 09:51:23.638123	\N	\N	\N
63f50593-50a7-42cb-829b-8fe90b02f9e1	Scalpels	scalpels	5bbe18b9-f0e5-4e9e-9876-8cc6f8adce0a	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
1519cbab-0543-4025-a1f0-714a7b729dcf	Forceps	forceps	5bbe18b9-f0e5-4e9e-9876-8cc6f8adce0a	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
b45a6dad-dedb-4fad-95aa-0e47d4aaa208	Antibiotic Capsules	antibiotic-capsules	fd81f223-0106-4e84-9992-a4cdc05061e6	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
ed9cce8f-c391-4273-b3b0-3c5ce5c65156	Paracetamol Tablets	paracetamol-tablets	fd81f223-0106-4e84-9992-a4cdc05061e6	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
daa4011b-9a89-45ae-a31c-d546ee4ed75a	Vitamin Syrup	vitamin-syrup	7a4a5402-0cc4-4daa-b5c8-c3b729fced91	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
96bc6b86-362e-47d8-8010-479ad4116591	Cough Syrup	cough-syrup	7a4a5402-0cc4-4daa-b5c8-c3b729fced91	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
c3eb068a-7411-43b0-b96f-4b2904b3351e	Insulin Injection	insulin-injection	97bffd8b-7e32-453f-92a5-07bc1cf640a3	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
8bf1c7ab-2dc1-44ce-a3af-5bea161330d9	IV Injections	iv-injections	97bffd8b-7e32-453f-92a5-07bc1cf640a3	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
b7bde204-b1d1-4789-b9bf-e3c6f579a69d	Disposable Needles	disposable-needles	16e495fa-5de2-493c-9175-a42145cf9344	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
c8756ed4-661a-4818-be55-58449cff49da	Disposable Syringes	disposable-syringes	16e495fa-5de2-493c-9175-a42145cf9344	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
c73b8321-79e4-4f9e-ab4b-036c2f3db5eb	Specialist Consultation	specialist-consultation	ace62dce-026c-4436-bbe5-bc70b370e568	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
f1e728d3-cebd-4d4a-b65c-5dc7d2492f75	Online Doctor Consultation	online-doctor-consultation	ace62dce-026c-4436-bbe5-bc70b370e568	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
5a360ecf-496d-4123-a2bf-066ac8af1561	Elder Care Services	elder-care-services	afce6ff1-cf49-4fae-8b09-9115e38e8858	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
32e35cb6-a7b3-4de0-b1b8-43101a5a37ed	Home Nursing Services	home-nursing-services	afce6ff1-cf49-4fae-8b09-9115e38e8858	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
857ca19b-30ee-4ce1-af24-81a0cb06f870	Triphala Churna	triphala-churna	154c99ac-e6a8-4192-ad48-32d5a4641a6c	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
5108b345-e051-4b6e-bd23-366ed34e3745	Ashwagandha Tablets	ashwagandha-tablets	154c99ac-e6a8-4192-ad48-32d5a4641a6c	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
9690f89b-1f52-4422-8bdb-8e4defe3c213	Protein Herbal Supplement	protein-herbal-supplement	f046455c-3a7f-4b0f-91b1-324bd5e49512	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
de0e86eb-482a-4361-b9fd-081630f15ad9	Herbal Immunity Booster	herbal-immunity-booster	f046455c-3a7f-4b0f-91b1-324bd5e49512	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
e04cb6a7-6489-4374-9311-22623056557c	Surgical Masks	surgical-masks	cf08f616-abca-4eb2-850e-cfcb7630622e	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
6ee4e26b-93f9-4c30-806d-5e199de6d7a6	Surgical Gloves	surgical-gloves	cf08f616-abca-4eb2-850e-cfcb7630622e	3	t	2026-01-30 09:06:27.667967	\N	\N	\N
0a3f43da-b0e7-4af1-8315-e188caeccbcf	X Ray Machine	x-ray-machine	0d6af3ec-1ac0-4191-b414-be2b5781763a	3	t	2026-01-30 09:08:36.644936	\N	\N	\N
1a929818-75fb-4fc6-96ee-be06ff70d50c	Ultrasound Machine	ultrasound-machine	0d6af3ec-1ac0-4191-b414-be2b5781763a	3	t	2026-01-30 09:08:36.644936	\N	\N	\N
c9587f6b-f19c-40fe-a466-8a786eb1e5a7	CT Scan Machine	ct-scan-machine	0d6af3ec-1ac0-4191-b414-be2b5781763a	3	t	2026-01-30 09:08:36.644936	\N	\N	\N
be18b327-b3b8-4b96-99a6-6e7fdf0f427b	Patient Monitor	patient-monitor	017625ea-4652-4586-b6de-e4fa4506f298	3	t	2026-01-30 09:08:36.644936	\N	\N	\N
f485c01c-3faa-4c8f-9fc5-908e91bde245	Pulse Oximeter	pulse-oximeter	017625ea-4652-4586-b6de-e4fa4506f298	3	t	2026-01-30 09:08:36.644936	\N	\N	\N
34f91aac-79a8-4b39-9fd1-badda6f6622b	Ventilator	ventilator	703aafbe-3071-4c10-ac44-0c0806c9566c	3	t	2026-01-30 09:08:36.644936	\N	\N	\N
61eedd3b-bdcf-44b5-a084-f25ed674920b	Oxygen Concentrator	oxygen-concentrator	703aafbe-3071-4c10-ac44-0c0806c9566c	3	t	2026-01-30 09:08:36.644936	\N	\N	\N
8ccf71af-b694-4e4a-9a47-42520b1bcc5c	Nebulizer	nebulizer	703aafbe-3071-4c10-ac44-0c0806c9566c	3	t	2026-01-30 09:08:36.644936	\N	\N	\N
1f7b833b-6d0f-443c-a96e-651dfce7f26c	Logistics Services	logistics-services	dae9bb18-9175-4ba3-8b5f-bccf2569b483	1	t	2026-01-30 09:10:25.571986	\N	\N	\N
eb6d3e36-29dd-4699-87fe-3434e6745567	Transportation Services	transportation-services	dae9bb18-9175-4ba3-8b5f-bccf2569b483	1	t	2026-01-30 09:10:25.571986	\N	\N	\N
bac57472-2572-4374-9125-53a0cd7dde08	Warehousing & Storage	warehousing-storage	dae9bb18-9175-4ba3-8b5f-bccf2569b483	1	t	2026-01-30 09:10:25.571986	\N	\N	\N
db304d5e-b03c-4cd4-bce4-5c3f78a283c6	Cargo & Shipping	cargo-shipping	dae9bb18-9175-4ba3-8b5f-bccf2569b483	1	t	2026-01-30 09:10:25.571986	\N	\N	\N
dae8ebbc-08ac-452e-bf54-cf7ed9ade9d5	Courier & Delivery Services	courier-delivery-services	dae9bb18-9175-4ba3-8b5f-bccf2569b483	1	t	2026-01-30 09:10:25.571986	\N	\N	\N
32803943-e2db-4971-8360-55824200f263	Supply Chain Management	supply-chain-management	dae9bb18-9175-4ba3-8b5f-bccf2569b483	1	t	2026-01-30 09:10:25.571986	\N	\N	\N
a64eb26d-afb0-4d90-8d41-fbe7083fceee	Bleaching Powder	bleaching-powder	5893151a-c029-47ca-835a-3da238b2c58e	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
5f87a367-a4d2-4290-8d77-d05aeb9bf62b	Sizing Agent	sizing-agent	5893151a-c029-47ca-835a-3da238b2c58e	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
865461db-52fd-4779-a483-8dac3713e02e	Sizing Chemicals	sizing-chemicals	5893151a-c029-47ca-835a-3da238b2c58e	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
5781384e-0e4c-4090-8593-6dce6a640aa3	Textile Chemical	textile-chemical	5893151a-c029-47ca-835a-3da238b2c58e	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
61ff7cd9-99da-49f7-997f-f3a7d0acddcb	Textile Finishing Agent	textile-finishing-agent	5893151a-c029-47ca-835a-3da238b2c58e	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
479e4493-5d5d-413c-ac3f-22522d522532	Plastic Granules	plastic-granules	1536cef8-98ba-4409-833d-a25dccb38f23	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
1041dfcf-bb76-4ea9-afe2-b208ad8a86c8	Polyethylene	polyethylene	1536cef8-98ba-4409-833d-a25dccb38f23	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
afd604bb-df11-4e2f-ba64-fc2ebb7ab797	Polymethylmethacrylate	polymethylmethacrylate	1536cef8-98ba-4409-833d-a25dccb38f23	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
d15b0ee5-f573-4e8c-b56b-b5840b532515	PP Granules	pp-granules	1536cef8-98ba-4409-833d-a25dccb38f23	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
a0061b1e-91a0-4054-aa30-2f8e80deeef3	Thermoplastic Compound	thermoplastic-compound	1536cef8-98ba-4409-833d-a25dccb38f23	3	t	2026-01-30 09:53:16.352517	\N	\N	\N
cec89aee-6f11-4d2d-b453-47130389bec0	Warehouse + Transport	warehouse-transport	39689a44-b5fa-4100-a2b4-6d44efe570b6	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
52986af1-d711-4c7b-adaa-b1635c093677	End to End Logistics	end-to-end-logistics	39689a44-b5fa-4100-a2b4-6d44efe570b6	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
3fcbc145-6052-4edb-901c-cc6b1e9c48d2	Food Cold Chain	food-cold-chain	effbb5a4-2833-4918-a629-1d5a4e85ed48	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
675db87e-7c36-40a9-930f-fd9fc8c5bb18	Pharma Cold Chain	pharma-cold-chain	effbb5a4-2833-4918-a629-1d5a4e85ed48	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
502a8c04-dc14-4d87-8830-d74a0e971c63	Export Freight	export-freight	36ab8014-f317-40e3-b7c8-4e28e0b075fb	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
476a59e5-7dbb-4f1b-bf42-aec24dac119c	Import Freight	import-freight	36ab8014-f317-40e3-b7c8-4e28e0b075fb	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
7f9814fe-32f9-48ce-a3dd-87b18ca5ef96	Part Truck Load	part-truck-load	f9d99a9e-b6d7-4ddc-8522-1d4d785cb65a	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
1cfaaa38-fb1a-47c3-ad56-5ccfbb947306	Full Truck Load	full-truck-load	f9d99a9e-b6d7-4ddc-8522-1d4d785cb65a	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
ac092249-d2ff-469b-8f4b-1e8fc8dcfe42	Container Rail Cargo	container-rail-cargo	2ecf7ca1-025b-4138-8ffe-2b38749b1f7d	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
217deb4c-2dfe-461c-ab12-1412a0dcd06b	Bulk Rail Cargo	bulk-rail-cargo	2ecf7ca1-025b-4138-8ffe-2b38749b1f7d	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
f7347a06-22a8-466c-8939-89443558030b	International Air Freight	international-air-freight	0e2243cb-46c8-409d-8ca7-2c191e2dd04e	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
6e1de14a-67f4-4ea0-a904-489ed17d4ff9	Domestic Air Freight	domestic-air-freight	0e2243cb-46c8-409d-8ca7-2c191e2dd04e	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
d92c5c71-24b1-4b58-882f-adb201cdb224	Fulfillment Center	fulfillment-center	2d93ae7d-20c9-41c4-bb1d-271042d86828	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
0620f63a-2c4d-40cd-8c8a-db1176c322f0	Bonded Warehouse	bonded-warehouse	2d93ae7d-20c9-41c4-bb1d-271042d86828	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
91b00665-e043-4710-9531-8b354c23541c	Temperature Controlled Storage	temperature-controlled-storage	edb13281-53ab-40cd-bdbe-4beab70b5b24	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
6066d121-9798-4747-b571-51f17a4fa0f4	Frozen Storage	frozen-storage	edb13281-53ab-40cd-bdbe-4beab70b5b24	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
229cc090-c815-48f8-b867-452d816c84de	Inventory Tracking	inventory-tracking	852fc852-e969-4a9b-af21-93617fe2aa6d	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
b6ac5a50-b731-4138-9af5-edbd0e37a52c	Stock Auditing	stock-auditing	852fc852-e969-4a9b-af21-93617fe2aa6d	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
bfe82c9e-1ce2-45cd-b9c6-234b465b3983	LCL Shipping	lcl-shipping	a3a124a9-89a0-4210-945e-2a147702dff8	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
9f075e66-d122-4a67-9911-5876ebc35bd4	FCL Shipping	fcl-shipping	a3a124a9-89a0-4210-945e-2a147702dff8	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
cf37a0ab-52f6-4791-8269-e7c27e23b62e	Charter Cargo	charter-cargo	c93689d7-2470-4440-869b-3970d476a09b	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
4aa4b7fb-296f-4594-851d-8f2515498431	Express Air Cargo	express-air-cargo	c93689d7-2470-4440-869b-3970d476a09b	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
d9030a85-a494-44b3-b243-7d7bda589a3e	40ft Container	40ft-container	24de8db1-8ea4-44e1-9a0c-e1271e771c5d	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
63edee33-5c5d-476d-a001-5eb7db283524	20ft Container	20ft-container	24de8db1-8ea4-44e1-9a0c-e1271e771c5d	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
72cead0d-123a-4415-9b5d-305d17008f50	Next Day Delivery	next-day-delivery	18deeac1-9aad-4157-a70c-c5cb8eb0ed6a	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
534d27f3-ba72-464b-ab99-5d102bf31eb5	Same Day Delivery	same-day-delivery	18deeac1-9aad-4157-a70c-c5cb8eb0ed6a	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
80c71926-dde5-4b61-bf09-c9c3868dd9da	Parcel Courier	parcel-courier	91c6eb3e-1bf5-4b3f-9143-46749bd2f6fb	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
ec9a9638-0339-461f-9433-9807e32f8af4	Document Courier	document-courier	91c6eb3e-1bf5-4b3f-9143-46749bd2f6fb	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
7dae96b6-657a-438d-af25-13a3ea8e2f23	Hyperlocal Delivery	hyperlocal-delivery	b6d51dc0-6cef-4e45-be71-cd3484cbd3cf	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
2259cd31-3a72-4e21-8d4e-e7aab43afcc7	Ecommerce Delivery	ecommerce-delivery	b6d51dc0-6cef-4e45-be71-cd3484cbd3cf	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
ef22ca22-fd20-41d9-bb2c-7c76603ab0ef	Cost Reduction	cost-reduction	c77259f1-fccf-4109-98bd-b6a282e1abd1	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
adf5db7a-1e03-44de-a759-d38aeea8051e	Process Optimization	process-optimization	c77259f1-fccf-4109-98bd-b6a282e1abd1	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
257df32f-3126-4e64-bc49-a3b30a100539	Sales Planning	sales-planning	fd707983-7823-421c-85b7-5a5f9c1b0f02	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
02a10fc8-93c2-44db-9633-61338acf3ed6	Forecasting	forecasting	fd707983-7823-421c-85b7-5a5f9c1b0f02	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
7e64100f-d70e-4fda-a9b2-d6b1ac05fcbb	Vendor Performance Tracking	vendor-performance-tracking	768d1991-d229-4704-b630-9bf47f139f76	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
dd4dbfd7-efd5-4b96-bcd3-4a3b333022bd	Supplier Onboarding	supplier-onboarding	768d1991-d229-4704-b630-9bf47f139f76	3	t	2026-01-30 09:11:24.418377	\N	\N	\N
49273d26-e3a5-4bf7-9a0a-810ce0d104c6	Dry Fruits & Nuts	dry-fruits-nuts	9777dbdf-7d5f-4b0c-9ace-a00ee06ad57c	2	t	2026-01-23 10:20:06.44265	\N	\N	\N
9226ab50-5b70-4f11-b47e-11e70e41b332	Leafy Greens	leafy-greens	9777dbdf-7d5f-4b0c-9ace-a00ee06ad57c	2	t	2026-01-23 10:20:06.44265	\N	\N	\N
2dcff806-25aa-4c98-8df8-84129d8a8fc8	Exotic Fruits	exotic-fruits	9777dbdf-7d5f-4b0c-9ace-a00ee06ad57c	2	t	2026-01-23 10:20:06.44265	\N	\N	\N
20242443-962d-431b-af63-78e285f0d185	Exotic Vegetables	exotic-vegetables	9777dbdf-7d5f-4b0c-9ace-a00ee06ad57c	2	t	2026-01-23 10:20:43.698777	\N	\N	\N
3c4e1810-e328-4a62-a4f5-974f4c6fbc84	Fresh Vegetables	fresh-vegetables	9777dbdf-7d5f-4b0c-9ace-a00ee06ad57c	2	t	2026-01-23 10:20:43.698777	\N	\N	\N
543e7ca1-a421-4438-8dda-487284626ad5	Vegetable Seeds	vegetable-seeds	424cfd80-0d22-4812-900e-c9202632a474	2	t	2026-01-29 09:46:33.326732	vegetable-seed.jpg	\N	\N
57da0d63-f356-41ac-a68d-1a25bf4595a8	Fruit Seeds	fruit-seeds	424cfd80-0d22-4812-900e-c9202632a474	2	t	2026-01-29 09:54:46.311983	fruit-seed.jpg	\N	\N
3f44226d-b9bf-4bca-92ca-943cc1847fde	Hybrid Seeds	hybrid-seeds	424cfd80-0d22-4812-900e-c9202632a474	2	t	2026-01-29 09:54:46.311983	hybrid-seeds.jpg	\N	\N
6816d16b-2de7-4197-a384-ae67d509f347	Herb Seeds	herb-seeds	424cfd80-0d22-4812-900e-c9202632a474	2	t	2026-01-29 09:54:46.311983	herb-seeds.jpg	\N	\N
6c1bfc55-2531-469c-9221-b3fb719db78b	Flower Seeds	flower-seeds	424cfd80-0d22-4812-900e-c9202632a474	2	t	2026-01-29 09:54:46.311983	flower-seeds.jpg	\N	\N
1fbc2204-3ec5-4637-b19d-a7084b5da771	Grass & Turf Seeds	grass-turf-seeds	424cfd80-0d22-4812-900e-c9202632a474	2	t	2026-01-29 09:54:46.311983	grass-seeds.jpg	\N	\N
30a9909c-4a60-4d89-8c20-9d071d1a39fb	Chemical Fertilizers	chemical-fertilizers	025bb2d8-6896-4f15-9610-cac91799a071	2	t	2026-01-29 09:57:17.085403	chemical-fertilizer.jpg	\N	\N
508e5373-ceee-4a5b-896c-1e44012386d4	Dyes, Pigments & Textile Chemicals	dyes-pigments-textile-chemicals	361f4057-73cb-45ce-bc0f-1429e7bf3fc4	1	t	2026-01-30 09:32:14.3385	\N	\N	\N
4d82aa51-b8b2-48c2-abba-c9261defd2f6	Petroleum Products & Industrial Gases	petroleum-products-industrial-gases	361f4057-73cb-45ce-bc0f-1429e7bf3fc4	1	t	2026-01-30 09:32:14.3385	\N	\N	\N
63f1823a-783a-4b61-9895-37b5ec264032	Polymers, Plastics & Resins	polymers-plastics-resins	361f4057-73cb-45ce-bc0f-1429e7bf3fc4	1	t	2026-01-30 09:32:14.3385	\N	\N	\N
c31216fd-95bb-4ac8-a3d2-0de359335889	Solvents & Reagents	solvents-reagents	361f4057-73cb-45ce-bc0f-1429e7bf3fc4	1	t	2026-01-30 09:32:14.3385	\N	\N	\N
e60e7a75-ef8c-4c59-a0f8-23a8ac69d8c6	Organic Fertilizers	organic-fertilizers	025bb2d8-6896-4f15-9610-cac91799a071	2	t	2026-01-29 09:57:17.085403	organic-fertilizer.jpg	\N	\N
7fa00414-8b4e-46a5-9c75-7130b448f9c8	Pumps	pumps	e674d7a7-9dfd-44fd-baf7-5313123c4cad	2	t	2026-01-29 10:01:19.921667	pumps.jpg	\N	\N
3d6e3e4e-ffa3-44f3-99a6-afb27a9f9747	Red Bricks	red-bricks	40403d8e-7257-483f-90f7-333ad188a59b	2	t	2026-01-29 10:39:28.768677	\N	\N	\N
1c71b814-702a-4f86-8f62-3b0cc6e54108	Strapping Materials	strapping-materials	32eaa9e0-2296-4140-9eb7-6805d2cdb2cc	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
8adf090b-fd92-4932-9edc-ff2097271464	Packaging Labels	packaging-labels	32eaa9e0-2296-4140-9eb7-6805d2cdb2cc	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
ea1da811-1e1f-4d9d-9241-cba781a1b8e1	Sealing Machines	sealing-machines	a05a2ad6-6a57-47aa-b2c1-56666d81a879	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
4c0a26ea-d33f-4c88-b6a6-dc6a97fd249c	Filling Machines	filling-machines	a05a2ad6-6a57-47aa-b2c1-56666d81a879	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
26747816-7f73-4e2d-95c4-33ee65c17f02	Wrapping Machines	wrapping-machines	a05a2ad6-6a57-47aa-b2c1-56666d81a879	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
47e5d9d3-ee4c-4efd-89b1-29b4cd3ef956	Barcode Printers	barcode-printers	8fbfa7ae-de12-4dd7-8036-a08fd373c829	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
a572c773-8e92-4bae-a42f-9c9558c93dce	Label Printing Machines	label-printing-machines	8fbfa7ae-de12-4dd7-8036-a08fd373c829	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
614a72e8-0e0c-4208-ba1e-8efd178d2c4f	Bubble Wrap	bubble-wrap	c4743c29-8994-48f0-9099-a59f57d54218	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
8ca67ed6-3e57-44af-9642-80d98c3d611e	Stretch Films	stretch-films	c4743c29-8994-48f0-9099-a59f57d54218	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
69c98b88-49b0-428e-8d38-d77cbc27f289	Foam Packaging	foam-packaging	c4743c29-8994-48f0-9099-a59f57d54218	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
b99a1564-872d-41d0-87de-8985aba514f2	Food Containers	food-containers	9fad0545-2763-4e06-af68-eb0b37fb2d26	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
8ee881c4-cc52-46b2-b6c4-7145cc8df9be	Vacuum Packaging	vacuum-packaging	9fad0545-2763-4e06-af68-eb0b37fb2d26	2	t	2026-01-30 09:01:38.319489	\N	\N	\N
fd81f223-0106-4e84-9992-a4cdc05061e6	Tablets & Capsules	tablets-capsules	cf4a6465-3d5c-4942-ae17-23483f1b0b6e	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
7a4a5402-0cc4-4daa-b5c8-c3b729fced91	Syrups & Suspensions	syrups-suspensions	cf4a6465-3d5c-4942-ae17-23483f1b0b6e	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
97bffd8b-7e32-453f-92a5-07bc1cf640a3	Injectables	injectables	cf4a6465-3d5c-4942-ae17-23483f1b0b6e	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
16e495fa-5de2-493c-9175-a42145cf9344	Disposable Products	disposable-products	ae09d47a-b323-4289-a52e-8cb153731f3c	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
ace62dce-026c-4436-bbe5-bc70b370e568	Medical Consultation	medical-consultation	7eb82d99-4f1b-424c-aa9a-cb7ac24efea0	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
afce6ff1-cf49-4fae-8b09-9115e38e8858	Home Healthcare Services	home-healthcare-services	7eb82d99-4f1b-424c-aa9a-cb7ac24efea0	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
154c99ac-e6a8-4192-ad48-32d5a4641a6c	Ayurvedic Medicines	ayurvedic-medicines	8a2dea46-6c77-4017-b5be-f0cac92fca93	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
f046455c-3a7f-4b0f-91b1-324bd5e49512	Herbal Supplements	herbal-supplements	8a2dea46-6c77-4017-b5be-f0cac92fca93	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
cf08f616-abca-4eb2-850e-cfcb7630622e	Surgical Disposables	surgical-disposables	51bf6867-f83e-4a9d-9b6b-942d2df4e55a	2	t	2026-01-30 09:06:06.267515	\N	\N	\N
0d6af3ec-1ac0-4191-b414-be2b5781763a	Medical Imaging Equipment	medical-imaging-equipment	ac4931fe-abca-44e7-8963-2a056a0ab515	2	t	2026-01-30 09:08:28.355668	\N	\N	\N
017625ea-4652-4586-b6de-e4fa4506f298	Patient Monitoring Equipment	patient-monitoring-equipment	ac4931fe-abca-44e7-8963-2a056a0ab515	2	t	2026-01-30 09:08:28.355668	\N	\N	\N
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, name, slug, type, parent_id, created_at) FROM stdin;
63b925c3-f2a0-4210-851d-ed649cdc0a77	India	india	country	\N	2026-01-31 09:50:36.447969
2d3d8455-80f0-49d5-b3e0-569f44964e10	Telangana	telangana	state	63b925c3-f2a0-4210-851d-ed649cdc0a77	2026-01-31 09:50:36.447969
3b5b9351-461d-4e7f-8b01-be041b5e87b8	Hyderabad	hyderabad	district	2d3d8455-80f0-49d5-b3e0-569f44964e10	2026-01-31 09:50:36.447969
4190eb00-ceda-4db9-be4f-1953d85e5e2f	Gachibowli	gachibowli	village	3b5b9351-461d-4e7f-8b01-be041b5e87b8	2026-01-31 09:50:36.447969
6eb9999c-0d44-4ab9-997b-0e687359be4e	Sangli	sangli	district	871f6ef9-5cb3-4c6e-bf62-9f1dadb30186	2026-01-31 09:55:19.771537
4573abda-e1f9-4e9d-8df1-beab5c2104d7	Jath	jath	taluka	6eb9999c-0d44-4ab9-997b-0e687359be4e	2026-01-31 09:55:19.771537
fa5b4aee-d475-4e93-b80b-f7acfdec02c7	Bilur	bilur	village	4573abda-e1f9-4e9d-8df1-beab5c2104d7	2026-01-31 09:55:19.771537
871f6ef9-5cb3-4c6e-bf62-9f1dadb30186	Maharashtra	maharashtra	state	63b925c3-f2a0-4210-851d-ed649cdc0a77	2026-01-31 09:55:19.771537
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, slug, description, category_id, location_id, price, is_price_on_request, status, created_at, updated_at, image_url, rating, quantity) FROM stdin;
b7ad1f5c-0ede-4aae-afad-e75967820e2e	Tomato	tomato	Fresh farm tomatoes directly from farmers	cfff414a-0305-4d98-9e61-bddc210c209b	fa5b4aee-d475-4e93-b80b-f7acfdec02c7	40.00	f	active	2026-01-31 10:05:08.904373	2026-01-31 10:05:08.904373	https://images.unsplash.com/photo-1567306226416-28f0efdc88ce	4.5	20
fa57cb17-f369-4f35-a611-c3bb1423c688	Apple	apple	Premium quality apples from orchard	21f88023-47f2-40eb-a0c1-17dabbf8f0ca	fa5b4aee-d475-4e93-b80b-f7acfdec02c7	120.00	f	active	2026-01-31 10:05:08.904373	2026-01-31 10:05:08.904373	https://images.unsplash.com/photo-1567306226416-28f0efdc88ce	4.7	15
906832b6-e73c-4f52-916f-fcba47251c97	Banana	banana	Naturally ripened bananas	8a7d2617-0301-4ded-9f09-58945531b6be	fa5b4aee-d475-4e93-b80b-f7acfdec02c7	60.00	f	active	2026-01-31 10:05:08.904373	2026-01-31 10:05:08.904373	https://images.unsplash.com/photo-1574226516831-e1dff420e43e	4.3	30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, contact, alternate_email, alternate_contact, address, role, gst_number, password, about, dob, profile_pic, created_at, updated_at) FROM stdin;
30ecfdae-3325-49d0-a7a6-be2d0c74aba4	Umashankar	umashankarjabagond@gmail.com	9823191415				user	\N	$2b$10$fAm5cEhlsnHdgZ3BQKhhtOP9k2s/sHpSOGPO.Njjy6bJ5qyQ/O43C	First user	\N	\N	2026-01-23 07:21:47.472732	2026-01-23 07:21:47.472732
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-01-23 06:14:09
20211116045059	2026-01-23 06:14:09
20211116050929	2026-01-23 06:14:10
20211116051442	2026-01-23 06:14:11
20211116212300	2026-01-23 06:14:11
20211116213355	2026-01-23 06:14:12
20211116213934	2026-01-23 06:14:13
20211116214523	2026-01-23 06:14:13
20211122062447	2026-01-23 06:14:14
20211124070109	2026-01-23 06:14:15
20211202204204	2026-01-23 06:14:15
20211202204605	2026-01-23 06:14:16
20211210212804	2026-01-23 06:14:18
20211228014915	2026-01-23 06:14:19
20220107221237	2026-01-23 06:14:19
20220228202821	2026-01-23 06:14:20
20220312004840	2026-01-23 06:14:21
20220603231003	2026-01-23 06:14:22
20220603232444	2026-01-23 06:14:22
20220615214548	2026-01-23 06:14:23
20220712093339	2026-01-23 06:14:23
20220908172859	2026-01-23 06:14:24
20220916233421	2026-01-23 06:14:25
20230119133233	2026-01-23 06:14:25
20230128025114	2026-01-23 06:14:26
20230128025212	2026-01-23 06:14:27
20230227211149	2026-01-23 06:14:27
20230228184745	2026-01-23 06:14:28
20230308225145	2026-01-23 06:14:29
20230328144023	2026-01-23 06:14:29
20231018144023	2026-01-23 06:14:30
20231204144023	2026-01-23 06:14:31
20231204144024	2026-01-23 06:14:32
20231204144025	2026-01-23 06:14:32
20240108234812	2026-01-23 06:14:33
20240109165339	2026-01-23 06:14:34
20240227174441	2026-01-23 06:14:35
20240311171622	2026-01-23 06:14:35
20240321100241	2026-01-23 06:14:37
20240401105812	2026-01-23 06:14:39
20240418121054	2026-01-23 06:14:39
20240523004032	2026-01-23 06:14:42
20240618124746	2026-01-23 06:14:42
20240801235015	2026-01-23 06:14:43
20240805133720	2026-01-23 06:14:44
20240827160934	2026-01-23 06:14:44
20240919163303	2026-01-23 06:14:45
20240919163305	2026-01-23 06:14:46
20241019105805	2026-01-23 06:14:46
20241030150047	2026-01-23 06:14:49
20241108114728	2026-01-23 06:14:50
20241121104152	2026-01-23 06:14:50
20241130184212	2026-01-23 06:14:51
20241220035512	2026-01-23 06:14:52
20241220123912	2026-01-23 06:14:52
20241224161212	2026-01-23 06:14:53
20250107150512	2026-01-23 06:14:54
20250110162412	2026-01-23 06:14:54
20250123174212	2026-01-23 06:14:55
20250128220012	2026-01-23 06:14:56
20250506224012	2026-01-23 06:14:56
20250523164012	2026-01-23 06:14:57
20250714121412	2026-01-23 06:14:57
20250905041441	2026-01-23 06:14:58
20251103001201	2026-01-23 06:14:58
20251120212548	2026-03-18 11:47:40
20251120215549	2026-03-18 11:47:41
20260218120000	2026-03-18 11:47:42
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-01-23 04:58:38.203584
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-01-23 04:58:38.238174
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-01-23 04:58:38.268775
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-01-23 04:58:38.279735
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-01-23 04:58:38.282435
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-01-23 04:58:38.289228
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-01-23 04:58:38.292095
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-01-23 04:58:38.302212
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-01-23 04:58:38.306496
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-01-23 04:58:38.309395
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-01-23 04:58:38.31252
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-01-23 04:58:38.336239
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-01-23 04:58:38.340401
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-01-23 04:58:38.343398
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-01-23 04:58:38.346881
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-01-23 04:58:38.352015
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-01-23 04:58:38.355026
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-01-23 04:58:38.359614
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-01-23 04:58:38.370602
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-01-23 04:58:38.381488
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-01-23 04:58:38.384704
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-01-23 04:58:38.387821
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-01-23 04:58:39.205952
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-01-23 04:58:39.237965
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-01-23 04:58:39.241238
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-01-23 04:58:39.248971
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-01-23 04:58:39.251837
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-01-23 04:58:39.269047
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-01-23 04:58:38.243609
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-01-23 04:58:38.285914
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-01-23 04:58:38.295139
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-01-23 04:58:38.298543
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-01-23 04:58:38.391236
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-01-23 04:58:38.400857
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-01-23 04:58:39.162424
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-01-23 04:58:39.168241
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-01-23 04:58:39.173553
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-01-23 04:58:39.179513
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-01-23 04:58:39.185496
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-01-23 04:58:39.191336
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-01-23 04:58:39.192826
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-01-23 04:58:39.196868
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-01-23 04:58:39.199674
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-01-23 04:58:39.209299
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-01-23 04:58:39.218005
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-01-23 04:58:39.221278
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-01-23 04:58:39.226996
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-01-23 04:58:39.230655
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-01-23 04:58:39.234938
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-01-23 04:58:39.254395
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-02-10 12:04:13.159517
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-02-10 12:04:13.221818
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-02-10 12:04:13.222764
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-02-10 12:04:13.308244
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-02-10 12:04:13.310026
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-02-10 12:04:13.310895
56	fix-optimized-search-function	cb58526ebc23048049fd5bf2fd148d18b04a2073	2026-02-10 12:04:13.316855
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_key UNIQUE (slug);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_category_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_category_parent ON public.categories USING btree (parent_id);


--
-- Name: idx_location_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_location_parent ON public.locations USING btree (parent_id);


--
-- Name: idx_product_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_category ON public.products USING btree (category_id);


--
-- Name: idx_product_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_location ON public.products USING btree (location_id);


--
-- Name: uniq_country_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_country_slug ON public.locations USING btree (slug) WHERE (type = 'country'::text);


--
-- Name: uniq_location_parent_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_location_parent_name ON public.locations USING btree (parent_id, name);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: categories categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: locations locations_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: products products_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categories TO anon;
GRANT ALL ON TABLE public.categories TO authenticated;
GRANT ALL ON TABLE public.categories TO service_role;


--
-- Name: TABLE locations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.locations TO anon;
GRANT ALL ON TABLE public.locations TO authenticated;
GRANT ALL ON TABLE public.locations TO service_role;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.products TO anon;
GRANT ALL ON TABLE public.products TO authenticated;
GRANT ALL ON TABLE public.products TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict RLwY4C7UoW6cL51fPgKjz2H1rZB6tFxPJcOfSqPbhbpMs7H77Z0ctHRKcs2pHK9

