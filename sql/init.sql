DROP SCHEMA IF EXISTS cep_core_todo;
CREATE SCHEMA cep_core_todo;
CREATE SCHEMA yt_raw_data;
CREATE SCHEMA yt_sandbox_raw_data;
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
	is_working bool DEFAULT false,
	definition_in_s3 bool DEFAULT false NULL,
	definition_in_postgres bool DEFAULT false NULL,
	responses_in_s3 bool DEFAULT false NULL,
	responses_in_postgres bool DEFAULT false NULL,
	deleted_upstream bool DEFAULT false NOT NULL,
	s3_object_name varchar NULL,
	survey_is_active bool DEFAULT true NOT NULL,
	CONSTRAINT surveys_list_survey_id_key UNIQUE (survey_id)
);

DROP TABLE IF EXISTS cep_core_todo.rebrandly_list;
CREATE TABLE cep_core_todo.rebrandly_list (
	rebrandly_id text NOT NULL,
	needs_to_be_deleted bool DEFAULT true NULL,
	CONSTRAINT rebrandly_list_rebrandly_id_key UNIQUE (rebrandly_id)
);

DROP TABLE IF EXISTS cep_core_todo.dashboard_list;
CREATE TABLE cep_core_todo.dashboard_list (
	dashboard_id text NOT NULL,
	needs_to_be_deleted bool DEFAULT true NULL,
	CONSTRAINT dashboard_list_dashboard_id_key UNIQUE (dashboard_id)
);

DROP TABLE IF EXISTS cep_core_todo.profiled_comment_files_list;
CREATE TABLE cep_core_todo.profiled_comment_files_list (
    profiled_id text NOT NULL,
    "level" text NOT NULL,
    product text NOT NULL,
    is_working bool DEFAULT false,
    parquet_uploaded bool DEFAULT false NULL,
    excel_uploaded bool DEFAULT false NULL,
	last_updated_timestamp timestamp NULL,
	s3_last_modified_ts timestamp NULL,
	needs_to_be_created bool DEFAULT true NULL,
    CONSTRAINT comment_files_list_profiled_id_product_level_key UNIQUE(profiled_id, product, level)
);

DROP TABLE IF EXISTS cep_core_todo.opportunity_product_level_comment_files_list;
CREATE TABLE cep_core_todo.opportunity_product_level_comment_files_list (
    opportunity_id text NOT NULL,
    "level" text NOT NULL,
    product text NOT NULL,
    is_working bool DEFAULT false,
    parquet_uploaded bool DEFAULT false NULL,
    excel_uploaded bool DEFAULT false NULL,
	last_updated_timestamp timestamp NULL,
	s3_last_modified_ts timestamp NULL,
	needs_to_be_created bool DEFAULT true NULL,
    CONSTRAINT comment_files_list_opportunity_id_product_level_key UNIQUE(opportunity_id, product, level)
);

DROP TABLE IF EXISTS cep_core_todo.opportunity_product_comment_files_list;
CREATE TABLE cep_core_todo.opportunity_product_comment_files_list (
    opportunity_id text NOT NULL,
	product text NOT NULL,
    is_working bool DEFAULT false,
    concerning_parquet_uploaded bool DEFAULT false,
    concerning_excel_uploaded bool DEFAULT false,
	additional_info_parquet_uploaded bool DEFAULT false,
	additional_info_excel_uploaded bool DEFAULT false,
	last_updated_timestamp timestamp NULL,
	s3_last_modified_ts timestamp NULL,
	needs_to_be_created bool DEFAULT true NULL,
    CONSTRAINT comment_files_list_opportunity_id_product_key UNIQUE(opportunity_id, product)
);