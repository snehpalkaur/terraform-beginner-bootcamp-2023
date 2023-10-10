terraform {
    required_providers {
    #random = {
    #  source = "hashicorp/random"
    #  version = "3.5.1"
    #}
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
  
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}

