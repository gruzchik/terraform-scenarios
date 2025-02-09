variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "qwiklabs-gcp-02-f2e77cefxxx"

}

variable "bucket_name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "qwiklabs-gcp-02-f2e77cefexxx-state"
}

variable "service_account_id" {
  description = "The name of the service_account"
  type        = string
  default     = null
}

variable "machine_type" {
  description = "The machine type of the compute instance"
  type        = string
  default     = "f1-micro"
}

variable "zone" {
  description = "Zone of the compute instance"
  type        = string
  default      = "us-central1-c"
}

variable "image" {
  description = "Image for the compute instance"
  type        = string
  default     = "debian-cloud/debian-11"
}