source "docker" "ubuntu" {
  for_each = var.images
  image = "ubuntu"
  export_path = ""
}