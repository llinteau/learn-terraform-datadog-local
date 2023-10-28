terraform {
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = "~> 3.31.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.23.1"
    }

    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0.49.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "aws" {
  region = "us-east-2"
}