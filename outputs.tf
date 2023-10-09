output "bucket_name"{
    description = "Bucket name for our static website hosting"
    value = module.terrhouse_aws.bucket_name
}