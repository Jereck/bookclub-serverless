variable "name" {
  description = "Name of the API project"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "client_id" {
  type        = string
  description = "Cognito App Client ID"
}

variable "user_pool_endpoint" {
  type        = string
  description = "Cognito User Pool endpoint (issuer)"
}