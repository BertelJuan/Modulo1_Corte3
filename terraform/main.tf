terraform {
    required_version = ">= 1.0"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }

    backend "s3" {
      bucket = "tfstate-url-shortener"
      key = "module1/terraform.tfstate"
      region = "us-west-1"
      dynamodb_table = "tfstate-lock"
    }
}

provider "aws" {
    region = var.region
}