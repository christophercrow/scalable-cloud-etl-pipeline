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
