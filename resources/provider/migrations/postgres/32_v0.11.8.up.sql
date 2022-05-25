-- Autogenerated by migration tool on 2022-05-19 06:55:01
-- CHANGEME: Verify or edit this file before proceeding

-- Resource: iam.groups_access_advisor
CREATE TABLE IF NOT EXISTS "aws_iam_access_advisor" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"parent_type" text,
	"account_id" text,
	"service_name" text,
	"service_namespace" text,
	"last_authenticated" timestamp without time zone,
	"last_authenticated_entity" text,
	"last_authenticated_region" text,
	"total_authenticated_entities" integer,
	CONSTRAINT aws_iam_access_advisor_pk PRIMARY KEY(account_id,service_namespace),
	UNIQUE(cq_id)
);
CREATE TABLE IF NOT EXISTS "aws_iam_access_advisor_tracked_actions_last_accessed" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"access_advisor_detail_cq_id" uuid,
	"action_name" text,
	"last_accessed_entity" text,
	"last_accessed_region" text,
	"last_accessed_time" timestamp without time zone,
	CONSTRAINT aws_iam_access_advisor_tracked_actions_last_accessed_pk PRIMARY KEY(cq_id),
	UNIQUE(cq_id),
	FOREIGN KEY (access_advisor_detail_cq_id) REFERENCES aws_iam_access_advisor(cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "aws_iam_access_advisor_entities" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"access_advisor_detail_cq_id" uuid,
	"arn" text,
	"id" text,
	"name" text,
	"type" text,
	"path" text,
	"last_authenticated" timestamp without time zone,
	CONSTRAINT aws_iam_access_advisor_entities_pk PRIMARY KEY(cq_id),
	UNIQUE(cq_id),
	FOREIGN KEY (access_advisor_detail_cq_id) REFERENCES aws_iam_access_advisor(cq_id) ON DELETE CASCADE
);