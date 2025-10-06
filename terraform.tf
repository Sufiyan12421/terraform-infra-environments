terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.15.0"
    }
  }
  backend "s3" {
    bucket = "my-unique-terraform-state-bucket-77389"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"
  }
}