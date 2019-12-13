// Configure the Google Cloud provider
provider "google" {
 credentials = file("../../../hallowed-pipe.json")
 project     = "hallowed-pipe-260410"
 region      = "us-central1"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "hallowed-vm-${random_id.instance_id.hex}"
 machine_type = "e2-medium"
 zone         = "us-central1-b"

 boot_disk {
   initialize_params {
     image = "gce-uefi-images/ubuntu-1804-lts"
   }
 }

// Make sure flask is installed on all new instances for later steps
// metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync"
 metadata_startup_script = "sudo apt-get update; sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common; sudo apt-key fingerprint 7EA0A9C3F273FCD8; sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7EA0A9C3F273FCD8; sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"; sudo apt-get update; sudo apt-get -y install docker-ce; sudo usermod -G docker ec2-user; sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/server:preview"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
 tags = ["rancher-server"]
}

resource "google_compute_firewall" "rancher-server" {
  name    = "default-allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rancher-server"]
}
