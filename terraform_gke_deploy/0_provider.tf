terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.13.0"
    }
  }
}

provider "google" {
  credentials = file("gcp-key.json") # This should match the service account key file in the pipeline
  project     = var.project_id      # Use a variable for flexibility
  region      = var.region          # Use a variable for region
}







# 1) Create A service account
# 2) permission needed
# 1) Compute Admin
# 2) Kubernetes Engine Admin
# 3) Kubernetes Engine Default Node Service Account
# 4) Service Account Admin
# 5) Service Account User


#  Enable some api
# ===================

# compute engine api
# Kubernetes Engine api 
# Resource manager api
