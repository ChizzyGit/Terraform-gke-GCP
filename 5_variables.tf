variable "project_id" {
  description = "The GCP project ID"
  type        = string
  #default     = "sapient-spark-436013-t0" #To be used when test-running tf in vscode
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1" # Set a default if needed
}