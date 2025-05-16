variable "api_id"        { type = string }
variable "execution_arn" { type = string }
variable "route_key"     { type = string }
variable "lambda_name"   { type = string }
variable "lambda_arn"    { type = string }
variable "authorization_type" {
  type        = string
  description = "Authorization type for the API Gateway route"
  default     = "NONE"
}
variable "authorizer_id" {
  type        = string
  description = "API Gateway authorizer ID"
  default     = null
}