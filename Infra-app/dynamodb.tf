resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "${var.env}-infra-app-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key # ✅ Correct casing

  attribute {
    name = var.hash_key     # ✅ Correct casing
    type = "S"
  }

  tags = {
    Name        = "${var.env}-infra-app-dynamodb-table"
    Environment = var.env
  }
}