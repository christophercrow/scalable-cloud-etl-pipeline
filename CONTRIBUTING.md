# Guidelines for contributing to this project


## Setup and Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/christophercrow/scalable-cloud-etl-pipeline.git
   cd scalable-cloud-etl-pipeline

2. **Install Dependencies:**
	
 	AWS CLI: 

 		Follow the AWS CLI Installation Guide

	jq:

		sudo apt-get update && sudo apt-get install jq -y

 	Git: 

 		Refer to the Git Installation Guide

3. **Configure AWS CLI:**

			aws configure

Enter your AWS access key, secret key, region, and default output format when prompted.

4. **Configure Project Settings:**

Update config/aws_config.json with your credentials and bucket names (do not include the s3:// prefix; the scripts will handle that):

	    {
    	    "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID",
        	"aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY",
        	"region": "us-east-1",
	        "raw_bucket": "scalable-cloud-etl-pipeline",
    	    "processed_bucket": "scalable-cloud-etl-pipeline-processed"
	    }

5. **Running the ETL Pipeline** 

Make Scripts Executable:

	chmod +x scripts/*.sh
	chmod +x run_etl.sh

Execute the Pipeline:

	bash run_etl.sh

This will:

    (i) Create a unique log directory under logs/ with a timestamp.
    (ii) Ingest data from the raw S3 bucket.
    (iii) Transform the data.
    (iv) Upload the processed data to the processed S3 bucket.
    (v) Log every step with detailed timestamps and separators.

6. **Check the Logs:**

Logs for each session are stored in a directory under logs/ as: 

		session_YYYYMMDD_HHMMSS/etl.log

7. **Database Integration**

If integrating with a SQL data warehouse run the SQL script to create the necessary table(s):

	psql -h your-db-host -U your-db-user -d your-db-name -f sql/create_tables.sql

Execute the SQL script to load data from S3 into the table:

    psql -h your-db-host -U your-db-user -d your-db-name -f sql/load_data.sql

Ensure the SQL script references the correct S3 path and your IAM role.

8. **Troubleshooting**

    Config File Errors: Verify that config/aws_config.json is valid JSON and contains correct values.
    Missing Dependencies: Ensure AWS CLI, jq, and Git are properly installed.
    Log Analysis: Examine the log file in the session directory under logs/ for error messages.
    S3 Bucket Issues: Confirm that the S3 buckets exist in your AWS account and have the correct permissions.

## Contributing to Scalable Cloud ETL Pipeline

Thank you for considering contributing to this project! We welcome improvements, bug fixes, and suggestions.

## How to Contribute

1. **Fork the Repository:**  
   Click the "Fork" button at the top right of the GitHub repository page to create your own fork.

2. **Create a Branch:**  
   Make your changes in a new branch:
   ```bash
   git checkout -b feature/your-feature-name

3. **Commit Your Changes:**
	```bash
	git commit -m "Add detailed logging for ETL session"

4. **Push Your Changes:**
	```bash
	git push origin feature/your-feature-name

5. **Submit a Pull Request:**

Open a pull request from your branch to the main branch of the original repository. Please provide a detailed description of your changes and why they are beneficial.

6. **Code Style**

Follow standard Bash scripting best practices.
Write clear, concise, and well-commented code.
Ensure that log messages and error handling are consistent across scripts.

7. **Issues**

If you encounter any issues or have ideas for improvement, please open an issue in the GitHub repository.

Thank you for your contributions!


---

### LICENSE

```text
MIT License

Copyright (c) 2025 Christopher Crow

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
