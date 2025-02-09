provider "google" {
#   project     = "# REPLACE WITH YOUR PROJECT ID"
  project     = "qwiklabs-gcp-00-8cdb1de17046"
  region      = "us-central1"
}

# terraform {
#   backend "gcs" {
#     bucket  = "qwiklabs-gcp-03-2b69e70ee45c-state"
#     prefix  = "terraform/state"
#   }
# }

module "compute-instance1" {
  source = "./modules/instances"

#   service_account_id = "module-sa1"
  name         = "tf-test-instance-1"
  machine_type = var.machine_type
  zone         = var.zone
  image        = var.image
}

module "compute-instance2" {
  source = "./modules/instances"

#   service_account_id = "module-sa1"
  name         = "tf-test-instance-2"
  machine_type = var.machine_type
  zone         = var.zone
  image        = var.image
}

# resource "google_storage_bucket" "test-bucket-for-state" {
# #   name        = "# REPLACE WITH YOUR PROJECT ID"
#   name        = "qwiklabs-gcp-03-2b69e70ee45c-state"
#   location    = "US"
#   uniform_bucket_level_access = true
#   force_destroy = true
# }

module "gcs-static-tfstate-bucket" {
  source = "./modules/storage"

  name       = var.bucket_name
#   project_id = var.project_id
  project_id = "qwiklabs-gcp-00-3b5b1c636b6b"
  location   = "US"
  force_destroy = true

}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "default"

#   allow {
#     protocol = "icmp"
#   }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

# resource "google_compute_network" "default" {
#   name = "test-network"
# }

# data "google_compute_network" "default" {
#   name = "default"
# }