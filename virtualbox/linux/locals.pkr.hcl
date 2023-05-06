locals {
  iso_paths       = join("/", [var.iso_path, var.iso_file])
  iso_checksum    = "${var.iso_checksum_type}:${var.iso_checksum_value}"
  manifest_date   = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path   = join("/", [path.cwd, "manifests"])
  manifest_output = join(".", [local.manifest_path, local.manifest_date])
  ovf_export_path = "${path.cwd}/artifacts/${local.vm_name}"
  data_source_content = {
    "./kickstart.cfg" = templatefile("${abspath(path.root)}/http/kickstart.cfg", {})
  }
  data_source_command        = var.common_data_source == "http" ? "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart.cfg" : "inst.ks=cdrom:/kickstart.cfg"
  vm_name                    = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}"
  vm_virtualbox_version_file = join("-", ["packer", local.vm_name])
}