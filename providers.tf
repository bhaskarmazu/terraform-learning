# terraform {
#   required_version = ">= 1.9"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-west-2"
# }
#
#provider with S3 backend for state management
terraform {
  required_version = ">= 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-learning-state-048280526216"
    key            = "terraform-learning/terraform.tfstate"
    region         = "us-west-2"
    use_lockfile   = true
    encrypt        = true
  }
}

provider "aws" {
  region = "us-west-2"
}# trigger workflow test
