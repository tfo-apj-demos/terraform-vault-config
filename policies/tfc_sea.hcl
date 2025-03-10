# --- Create role for TFC
path "auth/jwt/role/{{identity.entity.name}}" {
    capabilities = [
      "create",
      "read",
      "update",
      "delete",
      "list"
    ]
}

#Path to access kv secrets
path "secrets/*" {
    capabilities = [
      "list",
      "read"
    ]
}

path "secrets/data/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}