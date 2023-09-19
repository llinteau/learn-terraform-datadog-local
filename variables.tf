variable "application_name" {
  type        = string
  description = "Application Name"
  default     = "beacon"
}

variable "tfc_org" {
  type        = string
  description = "TFC Organization"
}

variable "tfc_workspace" {
  type        = string
  description = "TFC Workspace"
  default     = "learn-terraform-eks"
}

