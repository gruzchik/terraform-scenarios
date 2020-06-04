variable "ssh_public_key_filepath" {
  description = "Filepath for ssh public key"
  type        = string
  default     = "ubuntu.pub"
}

variable "ssh_connection_username" {
  description = "Username for connection"
  type        = string
  default     = "usernamegc"
}

variable "tf_project_name" {
  description = "GCP Project Name"
  type        = string
  default     = "my-project-id"
}

variable "debian_instance_quantity" {
  description = "Debian Instance Quantity"
  type        = number
  default     = "2"
}
