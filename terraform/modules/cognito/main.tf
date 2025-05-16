resource "aws_cognito_user_pool" "this" {
  name = "${var.name}-user-pool"

  username_attributes = ["email"]

  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_uppercase = false
    require_numbers   = true
    require_symbols   = false
  }
}

resource "aws_cognito_user_pool_client" "this" {
  name         = "${var.name}-app-client"
  user_pool_id = aws_cognito_user_pool.this.id
  generate_secret = false

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows        = ["code"]
  allowed_oauth_scopes       = ["email", "openid", "profile"]
  callback_urls              = var.callback_urls
  logout_urls                = var.logout_urls
  supported_identity_providers = ["COGNITO"]
}
