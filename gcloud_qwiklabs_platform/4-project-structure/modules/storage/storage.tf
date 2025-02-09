resource "google_storage_bucket" "module_bucket" {
#   name          = "auto-expiring-bucket"
#   location      = "US"
#   force_destroy = true
  name               = var.name
  project            = var.project_id
  location           = var.location
  storage_class      = var.storage_class
  labels             = var.labels
  force_destroy      = var.force_destroy

}