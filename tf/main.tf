variable "do_token" {}
variable "do_cluster_name" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "kube_cluster" {
  name    = "${var.do_cluster_name}"
  region  = "sfo2"
  version = "1.14.5-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}

output "cluster-id" {
  value = "${digitalocean_kubernetes_cluster.kube_cluster.id}"
}
