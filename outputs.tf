output "bucket_name"{
    description = "Bucket name for our static website hosting"
    value = module.terrhouse_aws.bucket_name
}

output "s3_website_endpoint"{
    description = "S3 static website hosting endpoint"
    value = module.terrhouse_aws.website_endpoint
}

output "cloudfornt_url" {
    description = "The Cloudfront Distribution domain name"
    value = module.terrhouse_aws.cloudfornt_url
}