terraform {
  backend "s3" {
    bucket = "s3-terraform-bucket-demo"
    key    = "state/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
  }
}
