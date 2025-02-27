# scalable-cloud-etl-pipeline
Engineered an end-to-end ETL pipeline to ingest, process, and store astrophysical simulation data using AWS, SQL, and Bash scripting.


# Scalable Cloud ETL Pipeline for Astrophysical Simulation Data

This project is an end-to-end ETL pipeline designed to ingest, process, and store large volumes of astrophysical simulation data for effective bookkeeping and archival. It leverages:

- **AWS Cloud Services:** For scalable storage and computing.
- **SQL Data Warehousing:** To enable efficient querying.
- **Bash Scripting:** For automating data cleaning and transformation tasks.

## Features

- Scalable data ingestion and processing using AWS
- Automated ETL tasks with Bash scripts
- Robust SQL database integration for efficient data retrieval
- Enhanced data integrity and streamlined record-keeping

## Repository Structure

scalable-cloud-etl-pipeline/ ├── README.md ├── LICENSE ├── .gitignore ├── docs/ ├── scripts/ │ ├── etl_pipeline.sh │ └── setup_aws_resources.sh ├── sql/ │ └── create_tables.sql └── config/ └── aws_config.json


## Requirements

- AWS CLI installed and configured
- SQL database (e.g., PostgreSQL, MySQL, etc.)
- Bash (for executing shell scripts)

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/<your-username>/scalable-cloud-etl-pipeline.git
