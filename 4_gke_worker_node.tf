# Create Service Account
resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

# Create GKE Cluster
resource "google_container_cluster" "primary" {
  name               = "primary-cluster"
  location           = var.region
  initial_node_count = 1

  node_config {
    machine_type = "e2-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# Create Worker Node Pool (General)
resource "google_container_node_pool" "general" {
  name       = "general"
  cluster    = google_container_cluster.primary.id
  node_count = 2

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }

  node_config {
    preemptible  = false
    machine_type = "e2-small"
    disk_size_gb = 50
    labels = {
      role = "general"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}