#!/bin/bash
# ingest.sh: Downloads raw data from S3 to the local 'raw_data' directory.

# Load AWS configuration from config/aws_config.json
CONFIG_FILE="config/aws_config.json"
RAW_BUCKET=$(jq -r '.raw_bucket' "$CONFIG_FILE")

# Ensure the bucket name is in S3 URI format
if [[ "$RAW_BUCKET" != s3://* ]]; then
    RAW_BUCKET="s3://$RAW_BUCKET"
fi

# Define local directory for raw data
LOCAL_RAW_DIR="raw_data"
mkdir -p "$LOCAL_RAW_DIR"

echo "Starting data ingestion from S3 bucket: $RAW_BUCKET ..."
aws s3 sync "$RAW_BUCKET" "$LOCAL_RAW_DIR"

echo "Data ingestion completed. Files stored in $LOCAL_RAW_DIR."
