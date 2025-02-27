#!/bin/bash
# upload.sh: Uploads processed data to S3.

# Load AWS configuration from config/aws_config.json
CONFIG_FILE="config/aws_config.json"
PROCESSED_BUCKET=$(jq -r '.processed_bucket' "$CONFIG_FILE")

# Debug: show what was read from config
echo "Original processed_bucket from config: $PROCESSED_BUCKET" >&2

# Ensure the bucket name is in S3 URI format
if [[ "$PROCESSED_BUCKET" != s3://* ]]; then
    PROCESSED_BUCKET="s3://$PROCESSED_BUCKET"
fi

# Debug: show the processed bucket after formatting
echo "Formatted processed_bucket: $PROCESSED_BUCKET" >&2

# Define local processed data directory
LOCAL_PROCESSED_DIR="processed_data"

echo "Starting upload of processed data from $LOCAL_PROCESSED_DIR to S3 bucket: $PROCESSED_BUCKET ..."
aws s3 sync "$LOCAL_PROCESSED_DIR" "$PROCESSED_BUCKET"

echo "Upload completed. Processed data is now in $PROCESSED_BUCKET."
