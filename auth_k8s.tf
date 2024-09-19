resource "vault_auth_backend" "this" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "this" {
  backend            = vault_auth_backend.this.path
  kubernetes_host    = var.kubernetes_api
  kubernetes_ca_cert = var.kubernetes_ca_cert
  token_reviewer_jwt = var.token_reviewer_jwt
}

resource "vault_kubernetes_auth_backend_role" "this" {
  backend                          = vault_auth_backend.this.path
  role_name                        = "tfe"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["tfe"]
  token_ttl                        = 259200
  token_policies                   = ["default"]
}