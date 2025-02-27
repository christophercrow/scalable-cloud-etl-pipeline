# Scalable Cloud ETL Pipeline for Astrophysical Simulation Data

## Overview

This project implements an end-to-end ETL (Extract, Transform, Load) pipeline for astrophysical simulation data using AWS cloud services, SQL data warehousing, and Bash scripting. The pipeline ingests raw simulation data from an AWS S3 bucket, processes and cleans the data locally, and then uploads the transformed data back to a separate S3 bucket. Detailed logging is provided for every ETL session, making it easy to track, debug, and review each run.

## Features

- **Data Ingestion:** Downloads raw simulation data from an S3 bucket.
- **Data Transformation:** Cleans and transforms data using Bash scripts.
- **Data Upload:** Syncs processed data back to S3.
- **Detailed Logging:** Each ETL session is logged in its own timestamped directory.
- **Modular Design:** Each stage of the pipeline is clearly separated into its own script.

## Prerequisites

- **AWS Account:** With access to S3 (and optionally SQL data warehousing services).
- **AWS CLI:** Installed and configured on your system.
- **jq:** Installed for JSON parsing.
- **Git:** For cloning and managing the repository.
- **Bash:** The scripts are written in Bash and tested on Unix-like systems (e.g., Parrot OS).

## Repository Structure

Scalable-Cloud-ETL-Pipeline/ ├── config/ │ └── aws_config.json # AWS configuration (credentials, bucket names) ├── data/ │ └── simulation_data.csv # Sample pseudo simulation data ├── docs/ │ ├── architecture.md # Detailed architecture overview and diagrams │ └── design.md # Design decisions and project details ├── logs/ # Log directory (each ETL session creates a subdirectory) ├── scripts/ # Bash scripts for the ETL pipeline │ ├── ingest.sh # Ingest raw data from S3 │ ├── transform.sh # Transform and clean data │ ├── upload.sh # Upload processed data to S3 │ └── run_etl.sh # Orchestrates the complete ETL pipeline ├── sql/ │ ├── create_tables.sql # SQL script to create database tables │ └── load_data.sql # SQL script to load processed data into the database ├── README.md # This documentation file └── CONTRIBUTING.md # Guidelines for contributing to this project


## Setup and Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/christophercrow/scalable-cloud-etl-pipeline.git
   cd scalable-cloud-etl-pipeline

    Install Dependencies:

        AWS CLI: Follow the AWS CLI Installation Guide

        jq:

    sudo apt-get update && sudo apt-get install jq -y

    Git: Refer to the Git Installation Guide

Configure AWS CLI:

aws configure

Enter your AWS access key, secret key, region, and default output format when prompted.

Configure Project Settings:

Update config/aws_config.json with your credentials and bucket names (do not include the s3:// prefix; the scripts will handle that):

    {
        "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID",
        "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY",
        "region": "us-east-1",
        "raw_bucket": "scalable-cloud-etl-pipeline",
        "processed_bucket": "scalable-cloud-etl-pipeline-processed"
    }

Running the ETL Pipeline

    Make Scripts Executable:

chmod +x scripts/*.sh
chmod +x run_etl.sh

Execute the Pipeline:

Run the orchestration script:

bash run_etl.sh

This will:

    Create a unique log directory under logs/ with a timestamp.
    Ingest data from the raw S3 bucket.
    Transform the data.
    Upload the processed data to the processed S3 bucket.
    Log every step with detailed timestamps and separators.

Check the Logs:

Logs for each session are stored in a directory under logs/ (e.g., logs/session_20250227_141518/etl.log):

    ls logs/
    cat logs/session_<timestamp>/etl.log

Database Integration

If integrating with a SQL data warehouse:

    Create Database Tables:

    Run the SQL script to create the necessary table(s):

psql -h your-db-host -U your-db-user -d your-db-name -f sql/create_tables.sql

Load Processed Data:

Execute the SQL script to load data from S3 into the table:

    psql -h your-db-host -U your-db-user -d your-db-name -f sql/load_data.sql

    Ensure the SQL script references the correct S3 path and your IAM role.

Troubleshooting

    Config File Errors: Verify that config/aws_config.json is valid JSON and contains correct values.
    Missing Dependencies: Ensure AWS CLI, jq, and Git are properly installed.
    Log Analysis: Examine the log file in the session directory under logs/ for error messages.
    S3 Bucket Issues: Confirm that the S3 buckets exist in your AWS account and have the correct permissions.

Contributing

We welcome contributions to improve this project! See CONTRIBUTING.md for guidelines.
License

This project is licensed under the MIT License – see the LICENSE file for details.
Contact

For any questions or support, please contact christophercrow@github.com.


---

## CONTRIBUTING.md

```markdown
# Contributing to Scalable Cloud ETL Pipeline

Thank you for considering contributing to this project! We welcome improvements, bug fixes, and suggestions.

## How to Contribute

1. **Fork the Repository:**  
   Click the "Fork" button at the top right of the GitHub repository page to create your own fork.

2. **Create a Branch:**  
   Make your changes in a new branch:
   ```bash
   git checkout -b feature/your-feature-name

    Commit Your Changes:
    Ensure your commit messages are clear and descriptive:

git commit -m "Add detailed logging for ETL session"

Push Your Changes:
Push your branch to your fork:

    git push origin feature/your-feature-name

    Submit a Pull Request:
    Open a pull request from your branch to the main branch of the original repository. Please provide a detailed description of your changes and why they are beneficial.

Code Style

    Follow standard Bash scripting best practices.
    Write clear, concise, and well-commented code.
    Ensure that log messages and error handling are consistent across scripts.

Issues

If you encounter any issues or have ideas for improvement, please open an issue in the GitHub repository.

Thank you for your contributions!


---

## LICENSE

For example, if you choose the MIT License, create a file named `LICENSE` with the following content:

```text
MIT License

Copyright (c) [Year] [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

[...]

(Replace [Year] and [Your Name] with your details and include the full MIT License text.)
