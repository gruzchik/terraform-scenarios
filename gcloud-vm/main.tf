provider "google" {
  credentials = file("../../account.json")
  project     = "my-project-id"
  region      = "us-central1"
}


resource "google_compute_instance" "default" {
  name         = "test-${count.index}"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  count        = 1

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  //scratch_disk {
  //interface = "SCSI"
  //}

  network_interface {
    network    = "default"
    subnetwork = "default"
    //access_config {
    // Ephemeral IP
    //}
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "cat .ssh/id_dsa.pub >> /root/.ssh/authorized_keys2"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
