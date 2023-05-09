source "vsphere-iso" "linux" {
  vcenter_server       = var.vm_vsphere_endpoint
  username             = var.vm_vsphere_username
  password             = var.vm_vsphere_password
  insecure_connection  = var.vm_vsphere_insecure_connection
  datacenter           = var.vm_vsphere_datacenter
  cluster              = var.vm_vsphere_cluster
  datastore            = var.vm_vsphere_datastore
  folder               = var.vm_vsphere_folder
  vm_name              = local.vm_name
  guest_os_type        = var.vm_guest_os_type
  firmware             = var.vm_firmware
  CPUs                 = var.vm_cpu_count
  cpu_cores            = var.vm_cpu_cores
  CPU_hot_plug         = var.vm_cpu_hot_add
  RAM                  = var.vm_mem_size
  RAM_hot_plug         = var.vm_mem_hot_add
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = var.vm_disk_controller_type
  vm_version           = var.common_vm_version
  remove_cdrom         = var.common_remove_cdrom
  tools_upgrade_policy = var.common_tools_upgrade_policy
  notes                = local.build_description
  iso_paths            = local.iso_paths
  iso_checksum         = local.iso_checksum
  http_content         = var.common_data_source == "http" ? local.data_source_content : null
  cd_content           = var.common_data_source == "disk" ? local.data_source_content : null
  http_ip              = var.common_data_source == "http" ? var.common_http_ip : null
  http_port_min        = var.common_data_source == "http" ? var.common_http_port_min : null
  http_port_max        = var.common_data_source == "http" ? var.common_http_port_max : null
  boot_order           = var.vm_boot_order
  boot_wait            = var.vm_boot_wait
  ip_wait_timeout      = var.common_ip_wait_timeout
  shutdown_command     = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout     = var.common_shutdown_timeout
  communicator         = "ssh"
  ssh_proxy_host       = var.communicator_proxy_host
  ssh_proxy_port       = var.communicator_proxy_port
  ssh_proxy_username   = var.communicator_proxy_username
  ssh_proxy_password   = var.communicator_proxy_password
  ssh_username         = var.build_username
  ssh_password         = var.build_password
  ssh_port             = var.communicator_port
  ssh_timeout          = var.communicator_timeout
  convert_to_template  = var.common_template_conversion

  storage {
    disk_size             = var.vm_disk_size
    disk_thin_provisioned = var.vm_disk_thin_provisioned
  }

  network_adapters {
    network      = var.vsphere_network
    network_card = var.vm_network_card
  }

  boot_command = [
    "<up>",
    "e",
    "<down><down><end><wait>",
    "text ${local.data_source_command}",
    "<enter><wait><leftCtrlOn>x<leftCtrlOff>"
  ]

  dynamic "content_library_destination" {
    for_each = var.common_content_library_name != null ? [1] : []
    content {
      library     = var.common_content_library_name
      ovf         = var.common_content_library_ovf
      destroy     = var.common_content_library_destroy
      skip_import = var.common_content_library_skip_export
    }
  }

  dynamic "export" {
    for_each = var.common_ovf_export_enabled == true ? [1] : []
    content {
      name  = local.vm_name
      force = var.common_ovf_export_overwrite
      options = [
        "extraconfig"
      ]
      output_directory = local.ovf_export_path
    }
  }
}

build {
  sources = ["source.vsphere-iso.linux"]
}