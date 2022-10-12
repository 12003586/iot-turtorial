terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "hello" {
  name         = "ghcr.io/12003586/iot-turtorial:main"
  keep_locally = false
}

resource "docker_container" "hello" {
  image = docker_image.hello.latest
  name  = "test"
  must_run = false
  ports {
    internal = 80
    external = 8000
  }
}


