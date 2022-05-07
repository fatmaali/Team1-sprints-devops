resource "kubernetes_secret" "sasecret" {
  metadata {
    name = "sasecret"
    annotations = {
      "kubernetes.io/service-account.name" = "myserviceaccount"
    }
  }

  type = "kubernetes.io/service-account-token"
}
resource "kubernetes_cluster_role_binding" "sabinding" {
  metadata {
    name = "sabinding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "my-pods-clusterrole"
  }
  subject {
    kind      = "User"
    name      = "admin"
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "myserviceaccount"
    namespace = "terraform-build-namespace"
  }

}
resource "kubernetes_cluster_role" "my-pods-clusterrole" {
  metadata {
    name = "my-pods-clusterrole"
  }

  rule {
    api_groups = ["apps",""]
    resources  = ["namespaces", "deployments", "pods"]
    verbs      = ["get", "list", "watch", "create", "update","delete"]
  }
}

resource "kubernetes_service" "nexus" {
  metadata {
    name      = "nexusservice"
    namespace = kubernetes_namespace.build.metadata[0].name
  }
  spec {
    selector = {
      app = kubernetes_deployment.nexus.spec.0.template.0.metadata[0].labels.app
    }
    port {
      name        = "mainport"
      node_port   = 30202
      port        = 8081
      target_port = 8081
    }
    port {
      name        = "privrepoport"
      node_port   = 30301
      port        = 8089
      target_port = 8089
    }

    type = "NodePort"
  }
}
resource "kubernetes_deployment" "nexus" {
  metadata {
    name      = "nexus"
    namespace = kubernetes_namespace.build.metadata[0].name
    labels = {
      app = "nexuspod"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "nexuspod"

      }
    }

    template {
      metadata {
        labels = {
          app = "nexuspod"
        }

      }
      spec {
        container {
          image = "sonatype/nexus3"
          name  = "nexuspod"
          port {
            container_port = 8081
          }
          port {
            container_port = 8089
          }
          volume_mount {
            mount_path = "/nexus-data"
            name       = "nexusvol"
          }

        }
        volume {
          name = "nexusvol"
          persistent_volume_claim {
            claim_name = "nexusvolclaim"
          }

        }


      }

    }
  }
}

resource "kubernetes_persistent_volume" "nexusvol" {
  metadata {
    name = "nexus-vol"

  }

  spec {
    storage_class_name = "local-storage"
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["fatma-virtualbox"]

          }
        }
      }
    }
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/nexus-data"
      }
    }
  }
}
resource "kubernetes_persistent_volume_claim" "nexusvolclaim" {
  metadata {
    name      = "nexusvolclaim"
    namespace = kubernetes_namespace.build.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = "local-storage"
    volume_name        = kubernetes_persistent_volume.nexusvol.metadata.0.name
  }
}

resource "kubernetes_persistent_volume" "vol" {
  metadata {
    name = "vol"

  }

  spec {
    storage_class_name = "local-storage"
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["fatma-virtualbox"]

          }
        }
      }
    }
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/var/jenkins_home"
      }
    }
  }
}
resource "kubernetes_persistent_volume" "voldocker" {
  metadata {
    name = "voldocker"

  }

  spec {
    storage_class_name = "local-storage"
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["fatma-virtualbox"]

          }
        }
      }
    }
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/var/run/docker.sock"
      }
    }
  }
}
resource "kubernetes_persistent_volume_claim" "volclaim" {
  metadata {
    name      = "volclaim"
    namespace = kubernetes_namespace.build.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = "local-storage"
    volume_name        = kubernetes_persistent_volume.vol.metadata.0.name
  }
}
resource "kubernetes_persistent_volume_claim" "volclaimdocker" {
  metadata {
    name      = "volclaimdocker"
    namespace = kubernetes_namespace.build.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = "local-storage"
    volume_name        = kubernetes_persistent_volume.voldocker.metadata.0.name
  }
}



resource "kubernetes_deployment" "jenkinspods" {
  metadata {
    name      = "jenkins2"
    namespace = kubernetes_namespace.build.metadata[0].name
    labels = {
      app = "jenkinspod"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "jenkinspod"

      }
    }

    template {
      metadata {
        labels = {
          app = "jenkinspod"
        }

      }
      spec {
        service_account_name = "myserviceaccount"
        container {
          image = "01029266962/jenkins-docker-kubectl:latest"
          name  = "jenkinspod"
          port {
            container_port = 8080
          }
          volume_mount {
            mount_path = "/var/jenkins_home"
            name       = "vol2"
          }

          volume_mount {
            mount_path = "/var/run/secrets/tokens"
            name       = "vault-token"
          }
          volume_mount {
            mount_path = "/var/run/docker.sock"
            name       = "voldocker"
          }
        }
        volume {
          name = "vol2"
          persistent_volume_claim {
            claim_name = "volclaim"
          }

        }
        volume {
          name = "voldocker"
          persistent_volume_claim {
            claim_name = "volclaimdocker"
          }

        }
        volume {
          name = "vault-token"
          projected {
            sources {
              service_account_token {
                path              = "vault-token"
                expiration_seconds = 7200
                audience          = "vault"
              }
            }

          }

        }
      }

    }
  }
}

# resource "kubernetes_service" "jenkins" {
#   metadata {
#     name = "jenkins-example"
#   }
#   spec {
#     selector = {

#       app = kubernetes_deployment.jenkinspods.spec.0.template.0.metadata[0].labels.app
#     }
#     port {
#       protocol = "TCP"
#       node_port   = 30203
#       port        = 8080
#     }

#     type = "NodePort"
#   }
# }
resource "kubernetes_persistent_volume" "mysqlvoltest" {
  metadata {
    name = "mysqlvoltest"

  }

  spec {
    storage_class_name = "local-storage"
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["fatma-virtualbox"]

          }
        }
      }
    }
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/mysqltest"
      }
    }
  }
}
resource "kubernetes_persistent_volume" "mysqlvoldev" {
  metadata {
    name = "mysqlvoldev"

  }

  spec {
    storage_class_name = "local-storage"
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["fatma-virtualbox"]

          }
        }
      }
    }
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/mysqlvoldev"
      }
    }
  }
}


resource "kubernetes_service" "mysql_test_service" {
  metadata {
    name      = "terraform-mysqltest-service"
    namespace = kubernetes_namespace.test.metadata[0].name
  }
  spec {
    selector = {
      app = kubernetes_deployment.mysqltest.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 3306
      target_port = 3306
    }

    type = "ClusterIP"
  }
}
resource "kubernetes_service" "mysql_dev_service" {
  metadata {
    name      = "terraform-mysqldev-service"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }
  spec {
    selector = {
      app = kubernetes_deployment.mysqldev.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 8082
      target_port = 82
    }

    type = "ClusterIP"
  }
}
resource "kubernetes_persistent_volume_claim" "mysqlvolclaimdev" {
  metadata {
    name      = "mysqlvolclaimdev"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = "local-storage"
    volume_name        = kubernetes_persistent_volume.mysqlvoldev.metadata.0.name
  }
}

resource "kubernetes_persistent_volume_claim" "mysqlvolclaimtest" {
  metadata {
    name      = "mysqlvolclaimtest"
    namespace = kubernetes_namespace.test.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = "local-storage"
    volume_name        = kubernetes_persistent_volume.mysqlvoltest.metadata.0.name
  }
}
resource "kubernetes_secret" "mysqlauthtest" {
  metadata {
    name      = "mysqlauthtest"
    namespace = kubernetes_namespace.test.metadata[0].name
  }

  data = {
    password = "123456"
  }

  type = "kubernetes.io/basic-auth"
}

resource "kubernetes_secret" "mysqlauthdev" {
  metadata {
    name      = "mysqlauthdev"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  data = {
    password = "123456"
  }

  type = "kubernetes.io/basic-auth"
}
# resource "kubernetes_pod" "mysqltest" {
#   metadata {
#     name = "mysqltest"
#     namespace =kubernetes_namespace.test.metadata[0].name
#     labels = {
#        app = "mysqlpod"
#     }

#   }

#   spec {
#     container {
#       image = "mysql:latest"
#       name  = "mysqldb"

#       port {
#         container_port = 83
#       }
#     }
#     }
# }






resource "kubernetes_deployment" "mysqldev" {
  metadata {
    name      = "mysqldev"
    namespace = kubernetes_namespace.dev.metadata[0].name
    labels = {
      app = "mysqldev"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "mysqldev"

      }
    }

    template {
      metadata {
        labels = {
          app = "mysqldev"
        }

      }
      spec {
        container {
          image = "mysql:latest"
          name  = "mysqldb"
          port {
            container_port = 3306
          }
          volume_mount {
            mount_path = "/var/lib/mysql"
            name       = "mysqlvoldev"
          }
          env {
            name = "MYSQL_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = "mysqlauthdev"
                key  = "password"
              }
            }
          }


        }
        volume {
          name = "mysqlvoldev"
          persistent_volume_claim {
            claim_name = "mysqlvolclaimdev"
          }

        }


      }

    }
  }
}

resource "kubernetes_deployment" "mysqltest" {
  metadata {
    name      = "mysqltest"
    namespace = kubernetes_namespace.test.metadata[0].name
    labels = {
      app = "mysqltest"
    }
  }

  spec {

    replicas = 1
    selector {
      match_labels = {
        app = "mysqltest"

      }
    }

    template {
      metadata {
        labels = {
          app = "mysqltest"
        }

      }
      spec {
        container {
          image = "mysql:latest"
          name  = "mysqldb"
          port {
            container_port = 3306
          }
          volume_mount {
            mount_path = "/var/lib/mysql"
            name       = "mysqlvoltest"
          }
          env {
            name = "MYSQL_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = "mysqlauthtest"
                key  = "password"
              }
            }
          }

        }
        volume {
          name = "mysqlvoltest"
          persistent_volume_claim {
            claim_name = "mysqlvolclaimtest"
          }

        }


      }

    }
  }
}

#resource "kubernetes_deployment" "nexus" {
#   metadata {
#     name = "nexus"
#     namespace = kubernetes_namespace.build.metadata[0].name
#     labels = {
#        app = "nexuspod"
#     }
#   }

#   spec {
#     replicas = 1
#       selector {
#       match_labels = {
#        app = "nexuspod"

#       }
#     }

#     template {
#       metadata {
#         labels = {
#          app = "nexuspod"
#         }
#       }

#       spec {
#         container {
#           image = "sonatype/nexus3"
#            name = "nexuspod"
#         }
#       }
#     }
#   }
# }
