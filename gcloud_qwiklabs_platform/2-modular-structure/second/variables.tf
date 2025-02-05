variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "qwiklabs-gcp-02-f2e77cefxxx"

}

variable "name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "qwiklabs-gcp-02-f2e77cefexxx-cloudstorage-name"
}