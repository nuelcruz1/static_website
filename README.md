# my_static_web
Here’s my documentation for hosting a static café website using Terraform. Let me know if you need any modifications! 🚀

Cafe Website Deployment using Terraform

This repository contains Terraform code to automate the deployment of a static website for a café using GitHub Pages.

📁 static_website  
 ├── 📄 main.tf        # Defines AWS resources  
 ├── 📄 variables.tf   # Input variables  
 ├── 📄 outputs.tf     # Output values  
 ├── 📄 provider.tf    # AWS provider configuration  
 ├── 📄 index.html     # Café website homepage  
 ├── 📄 error.html     # Custom error page  
 ├── 📄 README.md      # Project documentation  


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



