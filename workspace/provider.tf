terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "dev82s-kvn-ws"
    key    = "expense-workspace"
    region = "us-east-1"
    dynamodb_table = "dev82s-kvn-ws-table"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
