provider "aws" {
 version = "~>3"
 region = "us-east-1"
 access_key= "AKIAQDYALW3VUADMZLVP"
 secret_key= "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"
}

resource "aws_s3_bucket" "b" {
  bucket = "assignment-bucket-sasmita"
  acl    = "private"


  tags = {
    Name        = "My bucket"
    Environment = "Test"
  }
}
