locals {
  vpc_cidr_block = "10.0.0.0/16"
  public_config = {
    a = {
      cidr_block = "10.0.160.0/22"
    },
    b = {
      cidr_block = "10.0.164.0/22"
    }
  }
  private_config = {
    a = {
      cidr_block = "10.0.0.0/18"
    },
    b = {
      cidr_block = "10.0.64.0/18"
    }
  }
  data_config = {
    a = {
      cidr_block = "10.0.128.0/19"
    },
    b = {
      cidr_block = "10.0.160.0/19"
    }
  }
}

variable "name" {
  type        = string
  description = "The name that should be used for the resources that form the VPC"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all resources in this module"
}
