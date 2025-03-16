# Hosting a smart static website for N.C Innovative Hub on aws using terraform.
Here’s my documentation for hosting a static café website using Terraform. Let me know if you need any modifications! 🚀

N.C Innovative Hub Website Deployment using Terraform
This documentation has been categorized into 3 parts
1. The problem it addresses
2. The Building process
3. The business Impact

 The Problem It Addresses
As part of my project, I aimed to host a smart static website for the above company to leverage;
Globally Accessibility: Ensuring fast load times for users worldwide.
Security: Protecting the website from common web exploits and ensuring data is transmitted securely.
Cost-Effectiveness: Keeping hosting costs low while maintaining high availability and scalability.
Security: Aid at avoiding security vulnerabilies.
This project addresses these challenges by leveraging AWS services like S3, CloudFront, ACM, WAF, and CloudWatch to create a robust, secure, and scalable hosting solution tailored to your needs.

2. How to Actually Build it
Here’s a step-by-step breakdown of how you built the solution:
Below is the architectural diagram
![Static web host](https://github.com/user-attachments/assets/2ee4101a-aaa1-4866-ab16-e51b5f6ea57d)

Prerequisites
GitHub account
Terraform installed (Download Terraform)
A GitHub repository to host the website
A website (HTML, CSS, JavaScript files aswell as images )
Aws account connection

This repository contains Terraform code to automate the deployment of a static website for a café using GitHub Pages.
📁 N.C Innovative Hub smart website
 ├── 📄 s3.tf        # Defines AWS resources  
 ├── 📄 variables.tf   # Input variables  
 ├── 📄 outputs.tf     # Output values  
 ├── 📄 provider.tf    # AWS provider configuration  
 ├── 📄 index.html     # N.C Innovative Hub website homepage  
 ├── 📄 error.html     # Custom error page  
 ├── 📄 cloudfront.tf   #  Accelerate content delivery
 ├── 📄 WAF             # Protect site for treat like Sql.
 ├── 📄 cloudwatch.tf   # create cloudwatch metric to monitor key performance
 
Step 1: Host the Website on S3
I Created an S3 bucket named ncinnovativehub and enabled Static Website Hosting.
I Uploaded the website files, including index.html, styles.css, and error.html.
Made the bucket publicly accessible using a bucket policy to allow read access.

Step 2: Accelerate Delivery with CloudFront
Created a CloudFront distribution with the S3 bucket as the origin.
Configured HTTPS using an SSL/TLS certificate from AWS Certificate Manager (ACM) for the domain www.ncinnovativehub.com
Set the Default Root Object to index.html to ensure the homepage loads correctly.

Step 3: Secure the Website with WAF
Created a Web Application Firewall (WAF) web ACL to protect the website from common threats like SQL injection and cross-site scripting (XSS).
Added rules to block malicious traffic and associated the web ACL with the CloudFront distribution.

Step 4: Monitor with CloudWatch
Set up CloudWatch alarms to notify me if error rates or latency exceed predefined thresholds.
Enabled CloudFront logging to an S3 bucket to store access logs.
Created CloudWatch metrics to monitor key performance indicators like request counts, error rates, and latency.


3. The Business Impact
The solution delivers significant business value for N.C Innovative Hub by:

1. Improving User Experience:
2. Reliable uptime and scalability to handle traffic spikes, ensuring users can always access the website.
Faster load times and global availability through CloudFront’s edge locations.

3. Enhancing Security:
4. Secure data transmission with HTTPS via ACM, ensuring user data is protected.
Protection against common web exploits using WAF.
5. Reducing Costs:
Pay-as-you-go pricing with AWS services ensures cost efficiency.
Free Tier usage for S3, CloudFront, and WAF reduces initial costs, making it an affordable solution for small to medium-sized businesses.
6. Enabling Better Decision-Making:
Logs and metrics provide insights into website performance and user behavior, enabling data-driven decisions.
7. Real-time monitoring and alerts via CloudWatch help you identify and resolve issues quickly.

Conclusion:
This project demonstrates how I successfully built a smart static website hosting solution on AWS for N.C Innovative Hub. By addressing performance, security, scalability, and cost challenges, which has indeed created a reliable and secure online presence that delivers value to the business. The use of various AWS services has ensured that the website is fast, secure, and cost-effective, while also providing the tools to monitor and optimize its performance over time.





