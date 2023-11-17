variable "datadog_helm_version" {
  type        = string
  description = "Helm chart version for Datadog"
  default     = "3.1.3"
}

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
