provider "docker" {
   host = "unix:///var/run/docker.sock"
}

resource "docker_image" "jenkins" {
  name = "jenkins:latest"
}

resource "docker_container" "jenkins-server" {
  name = "jenkins-server"
  image = "${docker_image.jenkins.latest}"
  ports {
    internal = 8080
    external = 8080
  }
#  volumes {
#    container_path  = "/var/jenkins_home"
#    host_path = "${path.module}/jenkins"
#    read_only = false
#  }
}
