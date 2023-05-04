locals {
  iso_paths                  = ["[${var.common_iso_datastore}] ${var.iso_path}/${var.iso_file}", "[] /vmimages/tools-isoimages/${var.vm_guest_os_family}.iso"]
  iso_checksum               = "${var.iso_checksum_type}:${var.iso_checksum_value}"
  manifest_date              = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path              = "${path.cwd}/manifests/"
  manifest_output            = "${local.manifest_path}${local.manifest_date}.json"
  ovf_export_path            = "${path.cwd}/artifacts/"
  vm_name_datacenter_core    = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_datacenter}-${var.vm_guest_os_experience_core}"
  vm_name_datacenter_desktop = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_datacenter}-${var.vm_guest_os_experience_desktop}"
  vm_name_standard_core      = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${var.vm_guest_os_experience_core}"
  vm_name_standard_desktop   = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${var.vm_guest_os_experience_desktop}"
  bucket_name                = replace("${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}", ".", "")
  bucket_description         = "${var.vm_guest_os_family} ${var.vm_guest_os_name} ${var.vm_guest_os_version}"
}