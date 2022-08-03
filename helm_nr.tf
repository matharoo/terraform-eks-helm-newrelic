provider "helm" {
  version = "2.5.1"
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
      command     = "aws"
    }
  }
}

resource "helm_release" "kubewatch" {
  name       = "nri-kubernetes"
  repository = "https://newrelic.github.io/nri-kubernetes"
  chart      = "newrelic-infrastructure"
  namespace  = "monitoring"

  values = [
    file("${path.module}/values.yaml")
  ]
  set {
    name  = "cluster"
    value = "${local.cluster_name}"
  }
  set {
    name = "licenseKey"
    value = "${local.cluster_name}"
  }
}