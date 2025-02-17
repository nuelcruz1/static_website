output "website_url"{
    description = "my website_url"
    value = aws_s3_bucket_website_configuration.web-configuration
}