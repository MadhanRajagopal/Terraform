# Multiple Region Implementation in Terraform

You can make use of `alias` keyword to implement multi region infrastructure setup in
terraform.

```hcl
provider "aws" {
  alias = "us_east"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-west"
  region = "us-west-1"
}

resource "aws_instance" "vm1" {
  ami = "ami-xxx"
  instance_type = "t2.micro"
  provider = "aws.us-east"   # mention provider with alias name 
}

resource "aws_instance" "vm2" {
  ami = "ami-xxx"
  instance_type = "t2.micro"
  provider = "aws.us-west"
}
```
