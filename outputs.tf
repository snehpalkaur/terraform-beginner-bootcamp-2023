output "bucket_name"{
    description = "Bucket name for our static website hosting"
    value = module.terrhouse_aws.bucket_name
}

output "s3_website_endpoint"{
    description = "S3 static website hosting endpoint"
    value = module.terrhouse_aws.website_endpoint
}