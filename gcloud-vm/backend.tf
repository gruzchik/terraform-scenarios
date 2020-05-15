terraform {
  backend "gcs" {
    credentials = "../../account.json"
    bucket      = "gcloud-vm-tfstate-bucket" # GCS bucket name to store terraform tfstate
    prefix      = "terraform/state"
    path        = "state.tfstate" # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}
