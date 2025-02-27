#!/bin/bash
# run_etl.sh: Orchestrates the complete ETL pipeline with detailed logging and per-session directories.

# Define base log directory and create a new session directory with a timestamp
BASE_LOG_DIR="../logs"
SESSION_TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
SESSION_DIR="$BASE_LOG_DIR/session_$SESSION_TIMESTAMP"
mkdir -p "$SESSION_DIR"
LOG_FILE="$SESSION_DIR/etl.log"

# Function to write a log message with a timestamp to both console and log file
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Start the ETL session
log_message "=========================================="
log_message "ETL Pipeline Session Started"
log_message "Session Directory: $SESSION_DIR"
log_message "=========================================="

# --------------------- Data Ingestion ---------------------
log_message "Step 1: Data Ingestion Initiated"
log_message "------------------------------------------"
bash scripts/ingest.sh >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "Data Ingestion Completed Successfully."
else
    log_message "ERROR: Data Ingestion Encountered Issues."
fi
log_message "------------------------------------------"

# ------------------ Data Transformation -------------------
log_message "Step 2: Data Transformation Initiated"
log_message "------------------------------------------"
bash scripts/transform.sh >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "Data Transformation Completed Successfully."
else
    log_message "ERROR: Data Transformation Encountered Issues."
fi
log_message "------------------------------------------"

# --------------------- Data Upload ------------------------
log_message "Step 3: Data Upload Initiated"
log_message "------------------------------------------"
bash scripts/upload.sh >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "Data Upload Completed Successfully."
else
    log_message "ERROR: Data Upload Encountered Issues."
fi
log_message "------------------------------------------"

# End the ETL session
log_message "=========================================="
log_message "ETL Pipeline Session Ended"
log_message "=========================================="
