terraform {
  required_version = ">= 1.8"

  cloud {
    organization = "weigand-hcp"
    hostname     = "app.terraform.io"

    workspaces {
      name    = "aws_default_tagging"
      project = "203982-478625-DEV"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      id          = local.id
      workspace   = var.TFC_WORKSPACE_NAME
      last_run_id = var.TFC_RUN_ID
    }
  }
}

# values for these variables are automatically populated by the HCP Terraform/Terraform Enterprise run environment 
# https://developer.hashicorp.com/terraform/cloud-docs/run/run-environment#environment-variables

variable "TFC_WORKSPACE_NAME" {
  type = string
}

variable "TFC_WORKSPACE_SLUG" {
  type = string
}

variable "TFC_RUN_ID" {
  type = string
}

variable "TFC_PROJECT_NAME" {
  type = string
}

locals {
  id  = split("-", var.TFC_PROJECT_NAME)[0]
  dep = split("-", var.TFC_PROJECT_NAME)[1]
  env = split("-", var.TFC_PROJECT_NAME)[2]
}

resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}


/*

this example shows how to use the Project name, but this could easily be done using the Organization name as well:

locals {
  org = split("/", var.TFC_WORKSPACE_SLUG)[0]
  id  = split("-", local.org)[0]
  dep = split("-", local.org)[1]
  env = split("-", local.org)[2]
}

*/