provider "docker" {
   host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}

resource "docker_container" "nginx-server" {
  name = "nginx-server"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
    external = 81
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "${path.module}/templates/nginx"
    read_only = true
  }
}

data "local_file" "foo" {
    filename = "${path.module}/templates/nginx/index.html"
}
