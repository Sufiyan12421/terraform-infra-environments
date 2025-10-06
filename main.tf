# Dev environment
module "Dev-Environment" {
  source = "./Infra-app"
  env    = "Dev"
  hash_key = "studentId"
  ec2_ami_id = "ami-0cfde0ea8edd312d4" # Ubuntu 20.04 in us-east-2
  instance_types = ["t2.micro"]
  instance_count = 1
  bucket_name = "my-unique-terraform-state-bucket-77389"
  vpc_id = "vpc-0efbd0c1f96be4e80" # Replace with your actual VPC ID
}



#  Production environment
module "Prod-Environment" {
  source           = "./Infra-app"
  env              = "Prd"
  hash_key         = "studentId"
  ec2_ami_id       = "ami-0cfde0ea8edd312d4"
  instance_count   = 2
  instance_types   = ["t2.medium", "t2.large"]
  bucket_name      = "my-unique-terraform-state-bucket-77389"
  vpc_id           = "vpc-0efbd0c1f96be4e80"
}

# Stagging  environment
module "Stg-Environment" {
  source = "./Infra-app"
  env    = "Stg"
  hash_key = "studentId"
  ec2_ami_id = "ami-0cfde0ea8edd312d4" # Ubuntu 20.04 in us-east-2
  instance_count = 1
  instance_types = ["t2.small"]
  bucket_name = "my-unique-terraform-state-bucket-77389"
  vpc_id = "vpc-0efbd0c1f96be4e80" # Replace with your actual VPC ID
}



