variable "application_name" {
  type        = string
  description = "Application Name"
  default     = "beacon"
}

variable "tfc_org" {
  type        = string
  description = "TFC Workspace"
  default     = "LYSETTE_ORG2"
}

variable "tfc_workspace" {
  type        = string
  description = "TFC Workspace"
  default     = "learn-terraform-eks"
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog demo app key"
  default     = "a76c1fe09502e50d77b668625c223f956b457c29"
  sensitive   = true
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog demo api key"
  default     = "fc593c8b14565b9af00479084df18f14"
  sensitive   = true
}

variable "datadog_site" {
  type        = string
  description = "Datadog Location"
  default     = "datadoghq.com"
  sensitive   = true
}

variable "datadog_api_url" {
  type        = string
  description = "Datadog Location URL"
  default     = "https://app.datadoghq.com"
  sensitive   = true
}
