source "virtualbox-iso" "linux" {
  vm_name                   = local.vm_name
  guest_os_type             = var.vm_guest_os_type
  iso_url                   = local.iso_paths
  iso_checksum              = local.iso_checksum
  ssh_username              = var.vm_ssh_username
  ssh_password              = var.vm_ssh_password
  shutdown_command          = "echo '${local.vm_name}' | sudo -S -E shutdown -P now"
  chipset                   = var.vm_chipset
  firmware                  = var.vm_firmware
  nested_virt               = var.vm_nested_virt
  rtc_time_base             = var.vm_rtc_time_base
  disk_size                 = var.vm_disk_size
  audio_controller          = var.vm_audio_controller
  gfx_controller            = var.vm_gfx_controller
  gfx_vram_size             = var.vm_gfx_vram_size
  gfx_accelerate_3d         = var.vm_gfx_accelerate_3d
  gfx_efi_resolution        = var.vm_gfx_efi_resolution
  hard_drive_discard        = var.vm_hard_drive_discard
  hard_drive_interface      = var.vm_hard_drive_interface
  sata_port_count           = var.vm_sata_port_count
  nvme_port_count           = var.vm_nvme_port_count
  hard_drive_nonrotational  = var.vm_hard_drive_nonrotational
  iso_interface             = var.vm_iso_interface
  disk_additional_size      = var.vm_disk_additional_size
  keep_registered           = var.vm_keep_registered
  skip_export               = var.vm_skip_export
  virtualbox_version_file   = join("-", ["packer", local.vm_name])
  bundle_iso                = var.vm_bundle_iso
  guest_additions_mode      = var.vm_guest_additions_mode
  guest_additions_interface = var.vm_guest_additions_interface
  guest_additions_path      = var.vm_guest_additions_path
  guest_additions_sha256    = var.vm_guest_additions_sha256
  guest_additions_url       = var.vm_guest_additions_url
  http_directory            = var.vm_http_directory
  http_content              = var.vm_http_content
  http_port_min             = var.vm_http_port_min
  http_port_max             = var.vm_http_port_max
  http_bind_address         = var.vm_http_bind_address
  floppy_files              = var.vm_floppy_files
  floppy_dirs               = var.vm_floppy_dirs
  floppy_content            = var.vm_floppy_content
  floppy_label              = var.vm_floppy_label
  cd_files                  = var.vm_cd_files
  cd_label                  = var.vm_cd_label
  cd_content                = var.vm_cd_content
  format                    = var.vm_format
  export_opts               = var.vm_export_opts
  output_directory          = join("-", ["output", local.vm_name])
  output_filename           = local.vm_name
  headless                  = var.vm_headless
  vrdp_bind_address         = var.vm_vrdp_bind_address
  vrdp_port_min             = var.vm_vrdp_port_min
  vrdp_port_max             = var.vm_vrdp_port_max
  shutdown_timeout          = var.vm_shutdown_timeout
  post_shutdown_delay       = var.vm_post_shutdown_delay
  disable_shutdown          = var.vm_disable_shutdown
  acpi_shutdown             = var.vm_acpi_shutdown
  cpus                      = var.vm_cpus
  memory                    = var.vm_memory
  sound                     = var.vm_sound
  usb                       = var.vm_usb
  vboxmanage                = var.vm_vboxmanage
  vboxmanage_post           = var.vm_vboxmanage_post
  boot_command = [
    "<up>",
    "e",
    "<down><down><end><wait>",
    "text ${local.data_source_command}",
    "<enter><wait><leftCtrlOn>x<leftCtrlOff>"
  ]
}

# build {
#   sources = ["source.virtualbox-iso.linux"]

#   provisioner "shell" {
#     inline = []
#   }
# }