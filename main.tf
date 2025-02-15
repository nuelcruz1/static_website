#creating s3 bucket
resource "aws_s3_bucket" "mystaticbucket" {
  bucket = var.bucket_name
 }
# s3 bucket ownership control
 resource "aws_s3_bucket_ownership_controls" "example" {
   bucket = aws_s3_bucket.mystaticbucket.id

   rule {
     object_ownership = "BucketOwnerPreferred"
   }
 }
 # s3 bucket public access config
 resource "aws_s3_bucket_public_access_block" "example" {
   bucket = aws_s3_bucket.mystaticbucket.id

   block_public_acls       = false
   block_public_policy     = false
   ignore_public_acls      = false
   restrict_public_buckets = false
 }
 
  resource "aws_s3_bucket_acl" "example" {
   depends_on = [
     aws_s3_bucket_ownership_controls.example,
     aws_s3_bucket_public_access_block.example,
   ]

    bucket = aws_s3_bucket.mystaticbucket
    acl    = "public-read"
 }
 # s3 bucket file upload
 
 resource "aws_s3_object" "index" {
   bucket = aws_s3_bucket.mystaticbucket.id
   key    = "index.html"
   source = "C:/Users/NUEL/Documents/Cloud_Projects/my_static_web/index.html"
   acl = "public-read"
   content_type="html/text"
   
 }
 
 resource "aws_s3_object" "error" {
   bucket = aws_s3_bucket.mystaticbucket.id
   key    = "error.html"
   source = "C:/Users/NUEL/Documents/Cloud_Projects/my_static_web/error.html"
   acl = "public-read"
   content_type="html/text"
 }
 
 resource "aws_s3_object" "pictures" {
   bucket = aws_s3_bucket.mystaticbucket.id
   key    = "pictures"
   source = "C:/Users/NUEL/Documents/Cloud_Projects/my_static_web/pictures"
   acl = "public-read"
 }
 # s3 website config
 resource "aws_s3_bucket_website_configuration" "website" {
   bucket = aws_s3_bucket.mystaticbucket.id

   index_document {
     suffix = "index.html"
   }

    error_document {
     key = "error.html"
  }
 depends_on = [ aws_s3_bucket_acl.example ]
 }