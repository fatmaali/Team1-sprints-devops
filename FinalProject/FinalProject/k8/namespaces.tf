provider "kubernetes" {
  config_path    = "~/.kube/config"
}
resource "kubernetes_namespace" "dev" {
  metadata {

    name = "terraform-dev-namespace"
  }
}
resource "kubernetes_namespace" "build" {
  metadata {

    name = "terraform-build-namespace"
  }
}
resource "kubernetes_namespace" "test" {
  metadata {

    name = "terraform-test-namespace"
  }
}