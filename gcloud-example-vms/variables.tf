variable "tf_project_name" {
  description = "GCP Project Name"
  type        = string
}

variable "tf_project_region" {
  description = "Region fot project"
  type        = string
  default     = "us-central1"
}
