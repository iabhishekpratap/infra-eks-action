terraform {
  required_version = "~> 1.11.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }

  backend "s3" {
    bucket         = "dev-aman-tf-bucket-mumbai"   # 🔁 Must be a real bucket in ap-south-1
    region         = "ap-south-1"                  # ✅ Correct region
    key            = "eks/terraform.tfstate"
    dynamodb_table = "Lock-Files-Mumbai"           # 🔁 Must exist in ap-south-1
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}
