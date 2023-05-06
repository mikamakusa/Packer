variable "vm_guest_os_family" {
  type    = string
  default = "null"
}
variable "vm_guest_os_name" {
  type    = string
  default = "null"
}
variable "vm_guest_os_version" {
  type    = string
  default = "null"
}
variable "vm_guest_os_type" {
  type    = string
  default = null
}
variable "iso_url" {
  type    = string
  default = null
}
variable "iso_checksum" {
  type    = string
  default = null
}
variable "vm_ssh_username" {
  type      = string
  sensitive = true
  default   = "root"
}
variable "vm_ssh_password" {
  type      = string
  sensitive = true
  default   = "null"
}
variable "vm_chipset" {
  type    = string
  default = "ich9"
}
variable "vm_firmware" {
  type    = string
  default = "bios"
}
variable "vm_nested_virt" {
  type    = bool
  default = false
}
variable "vm_rtc_time_base" {
  type    = string
  default = "UTC"
}
variable "vm_disk_size" {
  type    = number
  default = 40
}
variable "vm_audio_controller" {
  type    = string
  default = "ac97"
}
variable "vm_gfx_controller" {
  type    = string
  default = "vboxvga"
}
variable "vm_gfx_vram_size" {
  type    = number
  default = 4
}
variable "vm_gfx_accelerate_3d" {
  type    = bool
  default = false
}
variable "vm_gfx_efi_resolution" {
  type    = string
  default = null
}
variable "vm_hard_drive_discard" {
  type    = bool
  default = true
}
variable "vm_hard_drive_interface" {
  type    = string
  default = "ide"
}
variable "vm_sata_port_count" {
  type    = number
  default = 1
}
variable "vm_nvme_port_count" {
  type    = number
  default = 1
}
variable "vm_hard_drive_nonrotational" {
  type    = bool
  default = true
}
variable "vm_iso_interface" {
  type    = string
  default = "ide"
}
variable "vm_disk_additional_size" {
  type    = list(number)
  default = null
}
variable "vm_keep_registered" {
  type    = bool
  default = false
}
variable "vm_skip_export" {
  type    = bool
  default = false
}
variable "vm_bundle_iso" {
  type    = bool
  default = false
}
variable "vm_guest_additions_mode" {
  type    = string
  default = "upload"
}
variable "vm_guest_additions_interface" {
  type    = string
  default = "ide"
}
variable "vm_guest_additions_path" {
  type    = string
  default = "VBoxGuestAdditions.iso"
}
variable "vm_guest_additions_sha256" {
  type    = string
  default = null
}
variable "vm_guest_additions_url" {
  type    = string
  default = null
}
variable "vm_http_directory" {
  type    = string
  default = null
}
variable "vm_http_content" {
  type    = map(string)
  default = {}
}
variable "vm_http_port_min" {
  type    = number
  default = 8000
}
variable "vm_http_port_max" {
  type    = number
  default = 9000
}
variable "vm_http_bind_address" {
  type    = string
  default = "0.0.0.0"
}
variable "vm_floppy_files" {
  type    = list(string)
  default = []
}
variable "vm_floppy_dirs" {
  type    = list(string)
  default = []
}
variable "vm_floppy_content" {
  type    = map(string)
  default = {}
}
variable "vm_floppy_label" {
  type    = string
  default = null
}
variable "vm_cd_files" {
  type    = list(string)
  default = []
}
variable "vm_cd_label" {
  type    = string
  default = null
}
variable "vm_cd_content" {
  type    = map(string)
  default = {}
}
variable "vm_format" {
  type    = string
  default = "ova"
}
variable "vm_export_opts" {
  type    = list(string)
  default = []
}
variable "vm_headless" {
  type    = bool
  default = true
}
variable "vm_vrdp_bind_address" {
  type    = string
  default = "127.0.0.1"
}
variable "vm_vrdp_port_min" {
  type    = number
  default = 5900
}
variable "vm_vrdp_port_max" {
  type    = number
  default = 6000
}
variable "vm_shutdown_timeout" {
  type    = string
  default = "5m"
}
variable "vm_post_shutdown_delay" {
  type    = string
  default = "0s"
}
variable "vm_disable_shutdown" {
  type    = bool
  default = false
}
variable "vm_acpi_shutdown" {
  type    = bool
  default = false
}
variable "vm_cpus" {
  type    = number
  default = 1
}
variable "vm_memory" {
  type    = number
  default = 512
}
variable "vm_sound" {
  type    = string
  default = "none"
}
variable "vm_usb" {
  type    = bool
  default = false
}
variable "vm_vboxmanage" {
  type    = list(list(string))
  default = []
}
variable "vm_vboxmanage_post" {
  type    = list(list(string))
  default = []
}
variable "iso_path" {
  type    = string
  default = null
}
variable "iso_file" {
  type    = string
  default = null
}
variable "iso_checksum_type" {
  type    = string
  default = "sha256"
}
variable "common_data_source" {
  type    = string
  default = "disk"
}
variable "build_username" {
  type    = string
  default = null
}
variable "build_password" {
  type    = string
  default = null
}
variable "build_password_encrypted" {
  type    = string
  default = null
}
variable "vm_guest_os_language" {
  type    = string
  default = "fr_FR"
}
variable "vm_guest_os_keyboard" {
  type    = string
  default = "fr"
}
variable "vm_guest_os_timezone" {
  type    = string
  default = "UTC"
}
variable "iso_checksum_value" {
  type        = string
  description = "The checksum value provided by the vendor."
  default     = null
}
variable "commands_provision" {
  type    = list(string)
  default = []
}

