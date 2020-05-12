provider "google" {
  credentials = file("../../account.json")
  project     = "my-project-id"
  region      = "us-central1"
}


resource "google_compute_instance" "vm_instance" {
  name         = "test-${count.index}"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  count        = 2

  tags = ["http-server"]

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
    //network = "${google_compute_network.vpc_network.self_link}"
    network    = "default"
    subnetwork = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo     = "bar"
    sshKeys = "${var.ssh_connection_username}:${file(var.ssh_public_key_filepath)}"
  }

  metadata_startup_script = "cat .ssh/id_dsa.pub >> /root/.ssh/authorized_keys2"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_instance" "centos_instance" {
  name         = "centos"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  // Local SSD disk
  //scratch_disk {
  //interface = "SCSI"
  //}

  network_interface {
    //network = "${google_compute_network.vpc_network.self_link}"
    network    = "default"
    subnetwork = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo     = "bar"
    sshKeys = "${var.ssh_connection_username}:${file(var.ssh_public_key_filepath)}"
  }

}


//resource "google_compute_network" "vpc_network" {
//  name                    = "terraform-network"
//  auto_create_subnetworks = "true"
//}

output "ip" {
  value = google_compute_instance.vm_instance[0].network_interface.0.access_config.0.nat_ip
}

output "ip1" {
  value = google_compute_instance.vm_instance[1].network_interface.0.access_config.0.nat_ip
}

output "centos_ip" {
  value = google_compute_instance.centos_instance.network_interface.0.access_config.0.nat_ip
}

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
