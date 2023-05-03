variable "vm_name" {
  type    = string
  default = ""
}

variable "ssh_username" {
  type      = string
  default   = "root"
  sensitive = true
}

variable "ssh_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "winrm_username" {
  type      = string
  default   = ""
  sensitive = true
}

variable "winrm_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "guest_os_type" {
  type    = string
  default = ""
}

variable "iso_url" {
  type    = string
  default = ""
}

variable "iso_checksum" {
  type    = string
  default = ""
}

variable "chipset" {
  type    = string
  default = ""
}

variable "firmware" {
  type    = string
  default = ""
}

variable "nested_virt" {
  type    = bool
  default = false
}

variable "rtc_time_base" {
  type    = string
  default = ""
}

variable "disk_size" {
  type    = number
  default = 0
}

variable "audio_controller" {
  type    = string
  default = ""
}

variable "gfx_controller" {
  type    = string
  default = ""
}

variable "gfx_vram_size" {
  type    = number
  default = 0
}

variable "gfx_accelerate_3d" {
  type    = bool
  default = false
}

variable "gfx_efi_resolution" {
  type    = string
  default = ""
}

variable "hard_drive_discard" {
  type    = bool
  default = false
}

variable "hard_drive_interface" {
  type    = string
  default = ""
}

variable "sata_port_count" {
  type    = number
  default = 0
}

variable "nvme_port_count" {
  type    = number
  default = 1
}

variable "hard_drive_nonrotational" {
  type    = bool
  default = false
}

variable "iso_interface" {
  type    = string
  default = ""
}

variable "disk_additional_size" {
  type    = list(number)
  default = []
}

variable "keep_registered" {
  type    = bool
  default = false
}

variable "skip_export" {
  type    = bool
  default = false
}

variable "virtualbox_version_file" {
  type    = string
  default = ""
}

variable "bundle_iso" {
  type    = bool
  default = false
}

variable "guest_additions_mode" {
  type    = string
  default = ""
}

variable "guest_additions_interface" {
  type    = number
  default = 0
}

variable "guest_additions_path" {
  type    = string
  default = ""
}

variable "guest_additions_sha256" {
  type    = string
  default = ""
}

variable "guest_additions_url" {
  type    = string
  default = ""
}

variable "http_directory" {
  type    = string
  default = ""
}

variable "http_content" {
  type    = map(string)
  default = {}
}

variable "http_port_min" {
  type    = number
  default = 0
}

variable "http_port_max" {
  type    = number
  default = 0
}

variable "http_bind_address" {
  type    = string
  default = ""
}

variable "floppy_files" {
  type    = list(string)
  default = []
}

variable "floppy_dirs" {
  type    = list(string)
  default = []
}

variable "floppy_content" {
  type    = map(string)
  default = {}
}

variable "floppy_label" {
  type    = string
  default = ""
}

variable "cd_files" {
  type    = list(string)
  default = []
}

variable "cd_label" {
  type    = string
  default = ""
}

variable "cd_content" {
  type    = map(string)
  default = {}
}

variable "format" {
  type    = string
  default = ""
}

variable "export_opts" {
  type    = list(string)
  default = []
}

variable "output_directory" {
  type    = string
  default = ""
}

variable "output_filename" {
  type    = string
  default = ""
}

variable "headless" {
  type    = bool
  default = false
}

variable "vrdp_bind_address" {
  type    = string
  default = ""
}

variable "vrdp_port_min" {
  type    = number
  default = 0
}

variable "vrdp_port_max" {
  type    = number
  default = 0
}

variable "shutdown_command" {
  type    = string
  default = ""
}

variable "shutdown_timeout" {
  type    = string
  default = "5m"
}

variable "post_shutdown_delay" {
  type    = string
  default = "0s"
}

variable "disable_shutdown" {
  type    = bool
  default = false
}

variable "acpi_shutdown" {
  type    = bool
  default = false
}

variable "cpus" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 256
}

variable "sound" {
  type    = string
  default = ""
}

variable "usb" {
  type    = bool
  default = false
}

variable "vboxmanage" {
  type    = list(list(string))
  default = []
}

variable "vboxmanage_post" {
  type    = list(list(string))
  default = []
}

variable "boot_command" {
  type    = list(string)
  default = []
}