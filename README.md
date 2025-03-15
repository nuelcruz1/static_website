# Hosting a smart static website for N.C Innovative Hub on aws using terraform.
Here’s my documentation for hosting a static café website using Terraform. Let me know if you need any modifications! 🚀

N.C Innovative Hub Website Deployment using Terraform

 The Problem It Addresses
As part of my project, I aimed to host a smart static website for the above company to leverage;

Globally Accessibility: Ensuring fast load times for users worldwide.
Secure: Protecting the website from common web exploits and ensuring data is transmitted securely.

Cost-Effectiveness: Keeping hosting costs low while maintaining high availability and scalability.

Security: Aid at avoiding security vulnerabilies.

This project addresses these challenges by leveraging AWS services like S3, CloudFront, ACM, WAF, and CloudWatch to create a robust, secure, and scalable hosting solution tailored to your needs.

This repository contains Terraform code to automate the deployment of a static website for a café using GitHub Pages.

📁 N.C Innovative Hub smart website
 ├── 📄 s3.tf        # Defines AWS resources  
 ├── 📄 variables.tf   # Input variables  
 ├── 📄 outputs.tf     # Output values  
 ├── 📄 provider.tf    # AWS provider configuration  
 ├── 📄 index.html     # N.C Innovative Hub website homepage  
 ├── 📄 error.html     # Custom error page  
 ├── 📄 cloudfront.tf   #  Accelerate content delivery
 ├── 📄 WAF     # Protect site for treat like Sql.
 ├── 📄 cloudwatch.tf   # create cloudwatch metric to monitor key performance
 

Prerequisites
GitHub account
Terraform installed (Download Terraform)
A GitHub repository to host the website
A static website (HTML, CSS, JavaScript files aswell as images )
Aws account connection

Setup Instructions

1. Clone the Repository
git clone https://github.com/your-username/your-repo.git
cd your-repo

2. Initialize Terraform
terraform init

3. Plan the Deployment
terraform plan

4. Apply the Configuration
terraform apply -auto-approve

5. Verify Deployment
Once the Terraform script executes successfully, your static website will be available on GitHub Pages.

Terraform Configuration Overview

This Terraform configuration:
Creates a GitHub repository (if not already created)
Uploads the static website files
Configures GitHub Pages for hosting



