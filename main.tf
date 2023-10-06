

resource "aws_s3_bucket" "example" {
  #Bucket naming rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result

  tags = {
    UserUuid = var.user_uuid
  }

}

resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length  = 32
  special = false

}


