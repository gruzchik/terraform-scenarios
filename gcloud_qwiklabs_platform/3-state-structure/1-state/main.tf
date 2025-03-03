terraform {
  backend "gcs" {
    bucket  = "qwiklabs-gcp-03-2b69e70ee45c-cstorage"
    prefix  = "terraform/state"
  }
}

provider "google" {
#   project     = "# REPLACE WITH YOUR PROJECT ID"
  project     = "qwiklabs-gcp-03-2b69e70ee45c"
  region      = "REGION"
}

resource "google_storage_bucket" "test-bucket-for-state" {
#   name        = "# REPLACE WITH YOUR PROJECT ID"
  name        = "qwiklabs-gcp-03-2b69e70ee45c-cstorage"
  location    = "US"
  uniform_bucket_level_access = true
  force_destroy = true
}