variable "name" {
  description = "Base name for Cognito resources"
  type        = string
}

variable "callback_urls" {
  description = "Allowed callback URLs for OAuth"
  type        = list(string)
}

variable "logout_urls" {
  description = "Allowed logout URLs for OAuth"
  type        = list(string)
}
