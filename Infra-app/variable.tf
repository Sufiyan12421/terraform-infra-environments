variable "env" {
  description = "The environment for the resources"
  type        = string
  
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  
}

variable "instance_types" {
  description = "List of EC2 instance types to launch"
  type        = list(string)

}

variable"ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type        = string
}
variable "vpc_id" {
  description = "The VPC ID where resources will be created"
  type        = string
  default = "vpc-0efbd0c1f96be4e80"
  
}