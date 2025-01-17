terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"

    }
  }


}

provider "docker" {
  # serveur sur lequel on va provionner docker
  # adresse du clone ansible@10.0.2.13 
  host = "ssh://ansible@10.0.2.13"

}


resource "docker_image" "helloflask" {
  name = "swatimodi/helloflask"
}
resource "docker_container" "hello_flask" {
  # docker_image ci_dessus 
  image = docker_image.helloflask.name
  name  = "helloflask"
  ports {
    internal = 8000
    external  = 80
  }

}

