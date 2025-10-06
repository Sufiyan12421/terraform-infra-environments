resource "aws_s3_bucket" "remote_s3" {
  bucket = "${lower(var.env)}-${var.bucket_name}"
    #acl    = "private"

  tags = {
    Name        = "${lower(var.env)}-${var.bucket_name}"
    Environment = var.env

  }

}