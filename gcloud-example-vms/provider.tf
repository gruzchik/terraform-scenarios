provider google {
  credentials = file("../../account.json")
  project     = var.tf_project_name
  region      = var.tf_project_region
}
