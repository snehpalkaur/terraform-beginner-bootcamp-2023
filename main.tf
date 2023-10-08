

resource "aws_s3_bucket" "website_bucket" {
  #Bucket naming rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }

}

#resource "random_string" "bucket_name" {
#  lower = true
#  upper = false
#  length  = 32
#  special = false
#
#}


