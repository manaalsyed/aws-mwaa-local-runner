DROP SCHEMA IF EXISTS cep_core_todo;
CREATE SCHEMA cep_core_todo;
CREATE SCHEMA yt_raw_data;
CREATE SCHEMA aas_raw_data;
CREATE SCHEMA dbt_manaals;

DROP TABLE IF EXISTS cep_core_todo.surveys_list;
CREATE TABLE cep_core_todo.surveys_list (
	survey_id text NULL,
	needs_to_be_pulled bool DEFAULT true NULL,
	first_seen timestamp DEFAULT now() NULL,
	last_pulled_ts timestamp NULL,
	"comment" text NULL,
	s3_last_modified_ts timestamp NULL,
	is_working bool DEFAULT false NULL,
	definition_in_s3 bool DEFAULT false NULL,
	definition_in_postgres bool DEFAULT false NULL,
	responses_in_s3 bool DEFAULT false NULL,
	responses_in_postgres bool DEFAULT false NULL,
	s3_object_name varchar NULL,
	survey_is_active bool DEFAULT true NOT NULL,
	CONSTRAINT surveys_list_survey_id_key UNIQUE (survey_id)
);

DROP TABLE IF EXISTS cep_core_todo.rebrandly_list;
CREATE TABLE cep_core_todo.rebrandly_list (
	survey_id text NOT NULL,
	rebrandly_id text NULL,
	rebrandly_url text NULL,
	is_active bool DEFAULT true NULL
);

-- cep_core_todo.dashboard_list definition

-- Drop table

DROP TABLE IF EXISTS cep_core_todo.dashboard_list;
CREATE TABLE cep_core_todo.dashboard_list (
	opportunity_id text NOT NULL,
	dashboard_id text NULL,
	dashboard_url text NULL,
	is_active bool DEFAULT true NULL
);