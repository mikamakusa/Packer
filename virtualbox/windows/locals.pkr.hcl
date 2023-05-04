locals {
  iso_paths       = ["[${var.iso_path}/${var.iso_file}"]
  iso_checksum    = "${var.iso_checksum_type}:${var.iso_checksum_value}"
  manifest_date   = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path   = "${path.cwd}/manifests/"
  manifest_output = "${local.manifest_path}${local.manifest_date}.json"
  ovf_export_path = "${path.cwd}/artifacts/${local.vm_name}"
  data_source_content = {
    "autounattend.xml" = templatefile("${abspath(path.root)}/datas/autounattend.pkrtpl.hcl", {
      build_username       = var.build_username
      build_password       = var.build_password
      vm_inst_os_language  = var.vm_inst_os_language
      vm_inst_os_keyboard  = var.vm_inst_os_keyboard
      vm_inst_os_image     = var.vm_inst_os_image_standard_core
      vm_inst_os_kms_key   = var.vm_inst_os_kms_key_standard
      vm_guest_os_language = var.vm_guest_os_language
      vm_guest_os_keyboard = var.vm_guest_os_keyboard
      vm_guest_os_timezone = var.vm_guest_os_timezone
    })
  }
  data_source_command        = var.common_data_source == "http" ? "inst.kickstart=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart.cfg" : "inst.ks=cdrom:/kickstart.cfg"
  vm_name                    = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}"
  vm_virtualbox_version_file = join("-", ["packer", local.vm_name])
  vm_cd_files                = [join("/", [path.cwd, "scripts", local.vm_name])]
}