#creating s3 bucket
resource "aws_s3_bucket" "ncinnovative" {
  bucket = var.my_bucket_name
 }
# s3 bucket ownership control
 resource "aws_s3_bucket_ownership_controls" "example" {
   bucket = aws_s3_bucket.ncinnovativehub.id

   rule {
     object_ownership = "BucketOwnerPreferred"
     #object_ownership = "ObjectWriter
   }
 }
 # s3 bucket public access config
 resource "aws_s3_bucket_public_access_block" "Nuel" {
   bucket = aws_s3_bucket.ncinnovativehub.id

   block_public_acls       = false
   block_public_policy     = false
   ignore_public_acls      = false
   restrict_public_buckets = false
 }
 # s3 bucket acl resource
  resource "aws_s3_bucket_acl" "ncinnovative" {
   depends_on = [
     aws_s3_bucket.ncinnovativehub.id,
     aws_s3_bucket_public_access_block.Nuel,
     aws_s3_bucket_ownership_controls.example
   ]
   

    bucket = aws_s3_bucket.ncinnovativehub.id
    acl    = "public-read"
 }
  #s3 bucket policy resource
 resource "aws_s3_bucket_policy" "host_bucket_policy" {
  # ID of the S3 bucket
  bucket =  aws_s3_bucket.ncinnovativehub.id

  # Policy JSON for allowing public read access
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource": "arn:aws:s3:::${var.my_bucket_name}/*"
      }
    ]
  })
}

# code to source for files from paths
module "template_files" {
    source = "hashicorp/dir/template"

    base_dir = "${path.module}/web_doc"
}

# https://registry.terraform.io/modules/hashicorp/dir/template/latest

#website hosting settings
resource "aws_s3_bucket_website_configuration" "web-configuration" {
  # ID of the S3 bucket
  bucket = aws_s3_bucket.ncinnovativehub.id

  index_document {
    suffix = "index.html"
  }
}


# Uploading files to s3 
resource "aws_s3_object" "Bucket_files" {
  bucket =  aws_s3_bucket.ncinnovativehub.id  # ID of the S3 bucket

  for_each     = module.template_files.files
  key          = each.key
  content_type = each.value.content_type

  source  = each.value.source_path
  content = each.value.content

  # ETag of the S3 object
  etag = each.value.digests.md5
}

 