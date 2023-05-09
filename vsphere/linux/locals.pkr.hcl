locals {
  iso_paths         = ["[${var.common_iso_datastore}] ${var.iso_path}/${var.iso_file}"]
  iso_checksum      = "${var.iso_checksum_type}:${var.iso_checksum_value}"
  manifest_date     = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path     = "${path.cwd}/manifests/"
  manifest_output   = "${local.manifest_path}${local.manifest_date}.json"
  ovf_export_path   = "${path.cwd}/artifacts/${local.vm_name}"
  data_source_content = {
    "./ks.cfg" = templatefile("${abspath(path.root)}/datas/kickstart.cfg", {})
  }
  data_source_command = var.common_data_source == "http" ? "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg" : "inst.ks=cdrom:/ks.cfg"
  vm_name             = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}"
}