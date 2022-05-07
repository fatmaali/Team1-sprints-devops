# resource "kubernetes_secret" "example" {
#   metadata {
#     name = "basic-auth"
#   }

#   data = {
#     MYSQL_ROOT_USER = "admin"
#     MYSQL_ROOT_PASSWORD = "P4ssw0rd"
#   }

#   type = "Opaque"
# }