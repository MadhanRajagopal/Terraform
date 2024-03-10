# Providers 
A provider in Terraform is a plugin that enables interaction with an API. This includes cloud providers (AWS, Azure, GCP)

## Different ways to configure providers in terraform

There are three main ways to configure providers in Terraform:

### In the root module 

This is the most common way to configure providers. The provider configuration block is placed in the root module of the Terraform configuration. This makes the provider configuration available to all the resources in the configuration.

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-xxxx"
  instance_type = "t2.micro"
}
```

### In a child module

You can also configure providers in a child module. This is useful if you want to reuse the same provider configuration in multiple resources.

```hcl
module "aws_vpc" {
  source = "./aws_vpc"
  providers = {
    aws = aws.us-west-2
  }
}

resource "aws_instance" "example" {
  ami = "ami-xxxx"
  instance_type = "t2.micro"
  depends_on = [module.aws_vpc]
}
```

### In the required_providers block

The required_providers block in Terraform is used to declare and specify the required provider configurations for your Terraform module or configuration. It allows you to specify the provider name, source, and version constraints.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0, < 3.0"
    }
  }
}

resource "aws_instance" "example" {
  ami = "ami-xxxx"
  instance_type = "t2.micro"
}
```

The best way to configure providers depends on your specific needs.
 - If you are only using a single provider, then configuring it in the root module is the simplest option.
 - If you are using multiple providers, or if you want to reuse the same provider configuration in multiple resources, then configuring it in a child module is a good option.
 - If you want to make sure that a specific provider version is used, then configuring it in the required_providers block is the best option.


