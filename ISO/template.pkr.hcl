packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "image" {
  vm_name                   = join("-", [var.guest_os_type, var.vm_name])
  guest_os_type             = var.guest_os_type
  iso_url                   = var.iso_url
  iso_checksum              = var.iso_checksum
  ssh_username              = var.ssh_username
  ssh_password              = var.ssh_password
  winrm_username            = var.winrm_username
  winrm_password            = var.winrm_password
  shutdown_command          = "sudo -S shutdown -P now"
  chipset                   = var.chipset
  firmware                  = var.firmware
  nested_virt               = var.nested_virt
  rtc_time_base             = var.rtc_time_base
  disk_size                 = var.disk_size
  audio_controller          = var.audio_controller
  gfx_controller            = var.gfx_controller
  gfx_vram_size             = var.gfx_vram_size
  gfx_accelerate_3d         = var.gfx_accelerate_3d
  gfx_efi_resolution        = var.gfx_efi_resolution
  hard_drive_discard        = var.hard_drive_discard
  hard_drive_interface      = var.hard_drive_interface
  sata_port_count           = var.sata_port_count
  nvme_port_count           = var.nvme_port_count
  hard_drive_nonrotational  = var.hard_drive_nonrotational
  iso_interface             = var.iso_interface
  disk_additional_size      = var.disk_additional_size
  keep_registered           = var.keep_registered
  skip_export               = var.skip_export
  virtualbox_version_file   = var.virtualbox_version_file
  bundle_iso                = var.bundle_iso
  guest_additions_mode      = var.guest_additions_mode
  guest_additions_interface = var.guest_additions_interface
  guest_additions_path      = var.guest_additions_path
  guest_additions_sha256    = var.guest_additions_sha256
  guest_additions_url       = var.guest_additions_url
  http_directory            = var.http_directory
  http_content              = var.http_content
  http_port_min             = var.http_port_min
  http_port_max             = var.http_port_max
  http_bind_address         = var.http_bind_address
  floppy_files              = var.floppy_files
  floppy_dirs               = var.floppy_dirs
  floppy_content            = var.floppy_content
  floppy_label              = var.floppy_label
  cd_files                  = var.cd_files
  cd_label                  = var.cd_label
  cd_content                = var.cd_content
  format                    = var.format
  export_opts               = var.export_opts
  output_directory          = var.output_directory
  output_filename           = var.output_filename
  headless                  = var.headless
  vrdp_bind_address         = var.vrdp_bind_address
  vrdp_port_min             = var.vrdp_port_min
  vrdp_port_max             = var.vrdp_port_max
  shutdown_timeout          = var.shutdown_timeout
  post_shutdown_delay       = var.post_shutdown_delay
  disable_shutdown          = var.disable_shutdown
  acpi_shutdown             = var.acpi_shutdown
  cpus                      = var.cpus
  memory                    = var.memory
  sound                     = var.sound
  usb                       = var.usb
  vboxmanage                = var.vboxmanage
  vboxmanage_post           = var.vboxmanage_post
  boot_command              = var.boot_command
}

build {
  sources = ["source.virtualbox-iso.image"]
}