#!/bin/bash
# transform.sh: Cleans and transforms raw simulation data.

# Define input and output paths
INPUT_FILE="raw_data/simulation_data.csv"
OUTPUT_DIR="processed_data"
OUTPUT_FILE="$OUTPUT_DIR/cleaned_simulation_data.csv"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Starting data transformation..."

# Example transformation: remove rows with missing fields (expects 6 columns)
awk -F, 'NF==6 {print $0}' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Data transformation completed. Processed file: $OUTPUT_FILE"
