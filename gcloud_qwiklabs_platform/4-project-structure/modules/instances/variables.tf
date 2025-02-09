variable "service_account_id" {
  description = "The name of the service_account"
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type of the compute instance"
  type        = string
}

variable "zone" {
  description = "Zone of the compute instance"
  type        = string
}

variable "image" {
  description = "Image for the compute instance"
  type        = string
  default     = "debian-cloud/debian-11"
}