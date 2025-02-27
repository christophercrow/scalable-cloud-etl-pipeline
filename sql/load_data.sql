-- load_data.sql: Loads processed data from S3 into the simulation_data table.
-- This example uses Amazon Redshift's COPY command. Adjust as needed for your SQL platform.

COPY simulation_data
FROM 's3://scalable-cloud-etl-pipeline-processed/cleaned_simulation_data.csv'
IAM_ROLE 'arn:aws:iam::<account-id>:role/YourRedshiftRole'
CSV
IGNOREHEADER 1;
