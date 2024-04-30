resource "aws_s3_bucket" "tests3" {
    bucket = "commonterraformbucket"
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock-file" {
  name = "terraform-state-lock-dynamodb-file"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}