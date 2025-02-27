# Architecture Overview

## Components

- **AWS S3 (Raw Data Bucket):** Stores incoming simulation data.
- **AWS S3 (Processed Data Bucket):** Stores cleaned and transformed data.
- **Compute Environment:** An EC2 instance (or similar) runs Bash scripts for ETL tasks.
- **SQL Data Warehouse:** Optionally, processed data can be loaded into a SQL database (e.g., Amazon Redshift) for analysis.
- **Logging & Monitoring:** Each ETL session is logged in its own timestamped directory, enabling easy debugging and monitoring.


## Scalability and Extensibility

- **Modular Scripts:** Each stage of the ETL pipeline is modular, allowing for easy updates and maintenance.
- **Cloud Integration:** Leveraging AWS services ensures that the pipeline scales with data volume.
- **Logging:** Detailed logs help in monitoring the performance and identifying any issues quickly.
