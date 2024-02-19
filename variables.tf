variable "application_name" {
  type        = string
  description = "Application Name"
  default     = "beacon"
}

variable "tfc_org" {
  type        = string
  description = "TFC Workspace"
  default     = "Lysette_Lab2"
}

variable "tfc_workspace" {
  type        = string
  description = "TFC Workspace"
  default     = "lysettes-workspace"
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog Application Key"
}

variable "datadog_site" {
  type        = string
  description = "Datadog Site Parameter"
  default     = "datadoghq.com"
}

variable "datadog_api_url" {
  type        = string
  description = "Datadog API URL"
  default     = "https://api.datadoghq.com"
}
