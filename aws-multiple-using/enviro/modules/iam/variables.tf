variable "iam_name" {
  description = "Name for account"
  type        = string
}

variable "s3_buckets" {
  description = "S3 allow list"
  type        = list(string)
  default     = []
}

variable "dynamodb_read" {
  description = "Dynamodb read table list"
  type        = list(string)
  default     = []
}