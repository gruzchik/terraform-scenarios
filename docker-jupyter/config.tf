provider "docker" {
   host = "unix:///var/run/docker.sock"
}

resource "docker_image" "ml" {
  name = "jupyter/scipy-notebook:latest"
}

resource "docker_container" "jupyter-server" {
  name = "jupyter-server"
  image = "${docker_image.ml.latest}"
  ports {
    internal = 8888
    external = 8888
  }
}
