packer {
  required_version = ">= 1.8.6"
  required_plugins {
    git = {
      version = ">= 0.3.3"
      source  = "github.com/ethanmdavidson/git"
    }
  }
}

