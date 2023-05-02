source "vsphere-iso" "linux" {
  CPUs                 = var.CPUs
  RAM                  = var.RAM
  RAM_reserve_all      = true
  boot_command         = ["<enter><wait><f6><wait><esc><wait>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs>", "/install/vmlinuz",
    " initrd=/install/initrd.gz", " priority=critical",
    " locale=en_US", " file=/media/${var.KICKSTART_CFG}.cfg",
    "<enter>"]
  disk_controller_type = ["pvscsi"]
  floppy_files         = [join("/", [path.root, "init", var.KICKSTART_CFG])]
  guest_os_type        = var.GUEST_OS_TYPE
  host                 = var.VCENTER_HOST
  insecure_connection  = true
  iso_paths            = [join(" ", [var.VM_ISO_DATASTORE, join("/", ["ISO", var.ISO_FILE])])]

  dynamic "network_adapters" {
    for_each = var.NETWORK_ADAPTERS
    content {
      network_card = network_adapters.value.network_card
    }
  }

  dynamic "storage" {
    for_each = var.STORAGE
    content {
      disk_size             = storage.value.disk_size
      disk_thin_provisioned = true
    }
  }

  password       = var.PASSWORD
  ssh_password   = var.PASSWORD
  ssh_username   = var.USERNAME
  username       = "root"
  vcenter_server = var.VCENTER_SERVER
  vm_name        = join(" ", ["Linux", var.TEMPLATE_NAME, var.TEMPLATE_VERSION])

  build {
    sources = ["source.vsphere-iso.linux"]
  }
}

source "vshpere-iso" "Windows" {
  CPUs                 = var.CPUs
  RAM                  = var.RAM
  RAM_reserve_all      = true
  communicator         = "winrm"
  disk_controller_type = ["pvscsi"]
  floppy_files         = [
    join("/", [path.root, "init", "unattend.xml"]),
    join("/", [path.root, "init", "sysprep.bat"])]
  floppy_img_path      = join(" ", [var.VM_ISO_DATASTORE, join("/", ["ISO", "VMware Tools", var.VMTOOLS_VERSION, var.VMTOOLS_DISK])])
  guest_os_type        = var.GUEST_OS_TYPE
  host                 = var.VCENTER_HOST
  insecure_connection  = "true"
  iso_paths            = [join(" ", [var.VM_ISO_DATASTORE, join("/", ["ISO", var.ISO_FILE])])]

  dynamic "network_adapters" {
    for_each = var.NETWORK_ADAPTERS
    content {
      network_card = network_adapters.value.network_card
    }
  }

  dynamic "storage" {
    for_each = var.STORAGE
    content {
      disk_size             = storage.value.disk_size
      disk_thin_provisioned = true
    }
  }

  username       = var.USERNAME
  password       = var.PASSWORD
  vcenter_server = var.VCENTER_SERVER
  vm_name        = join(" ", ["Windows", var.TEMPLATE_NAME, var.TEMPLATE_VERSION])
  winrm_password = var.PASSWORD
  winrm_username = var.USERNAME

  build {
    source = ["source.vsphere-iso.windows"]

    provisioner "windows-shell" {
      inline = ["netsh advfirewall firewall add rule name="Port 5985" dir=in action=allow protocol=TCP localport=5985",
      "sc.exe config winrm start= auto"]
    }
  }
}