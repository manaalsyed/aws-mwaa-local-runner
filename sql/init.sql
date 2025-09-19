DROP SCHEMA IF EXISTS cep_core_todo;
CREATE SCHEMA cep_core_todo;
CREATE SCHEMA yt_raw_data;
CREATE SCHEMA yt_sandbox_raw_data;
CREATE SCHEMA aas_raw_data;
CREATE SCHEMA dbt_manaals;

DROP TABLE IF EXISTS cep_core_todo.surveys_list;
CREATE TABLE cep_core_todo.surveys_list (
	survey_id TEXT NULL,
	needs_to_be_pulled BOOL DEFAULT true NULL,
	first_seen TIMESTAMP DEFAULT now() NULL,
	last_pulled_ts TIMESTAMP NULL,
	"comment" TEXT NULL,
	s3_last_modified_ts TIMESTAMP NULL,
	is_working BOOL DEFAULT FALSE,
	definition_in_s3 BOOL DEFAULT FALSE NULL,
	definition_in_postgres BOOL DEFAULT FALSE NULL,
	responses_in_s3 BOOL DEFAULT FALSE NULL,
	responses_in_postgres BOOL DEFAULT FALSE NULL,
	deleted_upstream BOOL DEFAULT FALSE NOT NULL,
	response_rate_file_in_sharepoint BOOL DEFAULT FALSE NULL,
	s3_object_name VARCHAR NULL,
	survey_is_active BOOL DEFAULT true NOT NULL,
	CONSTRAINT surveys_list_survey_id_key UNIQUE (survey_id)
);

DROP TABLE IF EXISTS cep_core_todo.rebrandly_list;
CREATE TABLE cep_core_todo.rebrandly_list (
	rebrandly_id TEXT NOT NULL,
	needs_to_be_deleted BOOL DEFAULT true NULL,
	CONSTRAINT rebrandly_list_rebrandly_id_key UNIQUE (rebrandly_id)
);

DROP TABLE IF EXISTS cep_core_todo.dashboard_list;
CREATE TABLE cep_core_todo.dashboard_list (
	dashboard_id TEXT NOT NULL,
	needs_to_be_deleted BOOL DEFAULT true NULL,
	CONSTRAINT dashboard_list_dashboard_id_key UNIQUE (dashboard_id)
);

DROP TABLE IF EXISTS cep_core_todo.profiled_comment_files_list;
CREATE TABLE cep_core_todo.profiled_comment_files_list (
    profiled_id TEXT NOT NULL,
    "level" TEXT NOT NULL,
    product TEXT NOT NULL,
    is_working BOOL DEFAULT FALSE,
    parquet_uploaded BOOL DEFAULT FALSE NULL,
    excel_uploaded BOOL DEFAULT FALSE NULL,
	last_updated_timestamp TIMESTAMP NULL,
	s3_last_modified_ts TIMESTAMP NULL,
	needs_to_be_created BOOL DEFAULT true NULL,
    CONSTRAINT comment_files_list_profiled_id_product_level_key UNIQUE(profiled_id, product, level)
);

DROP TABLE IF EXISTS cep_core_todo.opportunity_product_level_comment_files_list;
CREATE TABLE cep_core_todo.opportunity_product_level_comment_files_list (
    opportunity_id TEXT NOT NULL,
    "level" TEXT NOT NULL,
    product TEXT NOT NULL,
    is_working BOOL DEFAULT FALSE,
    parquet_uploaded BOOL DEFAULT FALSE NULL,
    excel_uploaded BOOL DEFAULT FALSE NULL,
	last_updated_timestamp TIMESTAMP NULL,
	s3_last_modified_ts TIMESTAMP NULL,
	needs_to_be_created BOOL DEFAULT true NULL,
    CONSTRAINT comment_files_list_opportunity_id_product_level_key UNIQUE(opportunity_id, product, level)
);

DROP TABLE IF EXISTS cep_core_todo.opportunity_product_comment_files_list;
CREATE TABLE cep_core_todo.opportunity_product_comment_files_list (
    opportunity_id TEXT NOT NULL,
	product TEXT NOT NULL,
    is_working BOOL DEFAULT FALSE,
    concerning_parquet_uploaded BOOL DEFAULT FALSE,
    concerning_excel_uploaded BOOL DEFAULT FALSE,
	additional_info_parquet_uploaded BOOL DEFAULT FALSE,
	additional_info_excel_uploaded BOOL DEFAULT FALSE,
	last_updated_timestamp TIMESTAMP NULL,
	s3_last_modified_ts TIMESTAMP NULL,
	needs_to_be_created BOOL DEFAULT true NULL,
    CONSTRAINT comment_files_list_opportunity_id_product_key UNIQUE(opportunity_id, product)
);

DROP TABLE IF EXISTS cep_core_todo.survey_contacts_list;
CREATE TABLE cep_core_todo.survey_contacts_list (
	survey_id TEXT NULL,
	mailing_list_id TEXT NULL,
	needs_to_be_pulled BOOL DEFAULT true NULL,
	first_seen TIMESTAMP DEFAULT now() NULL,
	last_pulled_ts TIMESTAMP NULL,
	"comment" TEXT NULL,
	s3_last_modified_ts TIMESTAMP NULL,
	is_working BOOL DEFAULT FALSE,
	mailing_list_in_s3 BOOL DEFAULT FALSE NULL,
	mailing_list_in_postgres BOOL DEFAULT FALSE NULL,
	contacts_in_s3 BOOL DEFAULT FALSE NULL,
	contacts_in_postgres BOOL DEFAULT FALSE NULL,
	s3_object_name VARCHAR NULL,
	CONSTRAINT survey_contacts_list_survey_id_mailing_list_id_key UNIQUE(survey_id, mailing_list_id)
);