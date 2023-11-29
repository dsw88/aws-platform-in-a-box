variable "name" {
  type        = string
  description = "The name to use for the EKS cluster being created"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the cluster is being deployed"
}

variable "control_plane_subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs where the control plane should be deployed"
}

variable "tags" {
  type        = map(string)
  description = "The tags to set on resources created in this module"
  default     = {}
}
