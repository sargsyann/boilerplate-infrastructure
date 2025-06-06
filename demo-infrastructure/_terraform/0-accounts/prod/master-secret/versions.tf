## This file and its content are generated based on config, pleas check README.md for more details

terraform {
  cloud {
    organization = "Demo-Infrastructure"

    workspaces {
      name = "0-accounts_prod_master-secret"
    }
  }
  
  required_providers {
  
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
      configuration_aliases = []
    }
  
  }

  required_version = ">= 1.3.0"
}
