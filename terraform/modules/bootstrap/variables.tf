locals {
  state_bucket_name   = "terraform-state-${var.account_id}-${var.region_name}"
  state_table_name    = "terraform-state"
  logging_bucket_name = "s3-logging-${var.account_id}-${var.region_name}"
}

variable "account_id" {
  type        = string
  description = "The ID of the account in which the bootstrap module is being deployed"
}

variable "region_name" {
  type        = string
  description = "The region in which the bootstrap module is being deployed"
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the resources in the module"
  default     = {}
}
