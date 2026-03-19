provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "k8-project" {

  metadata {
    name = "k8-project"
    labels = {
      app = "k8-project"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "k8-project"
      }
    }

    template {

      metadata {
        labels = {
          app = "k8-project"
        }
      }

      spec {

        container {
          name  = "k8-project"
          image = "jcmp77/k8-project:latest"

          port {
            container_port = 3000
          }
        }

      }

    }

  }

}
