#variable declerations
variable"my_bucket_region"{
    description = "my default bucket region"
    default ="us-east-1"
    type = string
}

variable"my_bucket_name"{
    description = "my bucket name"
    default ="nuel-static-website-bucket"
    type = string
}