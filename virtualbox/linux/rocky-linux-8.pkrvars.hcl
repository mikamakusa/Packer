vm_guest_os_language = "fr_FR"
vm_guest_os_keyboard = "fr"
vm_guest_os_timezone = "UTC"
vm_guest_os_family   = "linux"
vm_guest_os_name     = "rocky"
vm_guest_os_version  = "8.7"
vm_suffix            = "deployment-01"
vm_guest_os_type     = "other5xLinux64Guest"
vm_cpus              = 2
vm_memory            = 2048
vm_disk_size         = 6000
iso_path             = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64"
iso_file             = "Rocky-8.7-x86_64-minimal.iso"
iso_checksum_type    = "sha256"
iso_checksum_value   = "13c3e7fca1fd32df61695584baafc14fa28d62816d0813116d23744f5394624b"
commands_provision   = [
    "sudo yum install -y yum-utils",
    "sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
    "sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin",
    "sudo systemctl --now enable docker",
    "sudo dnf install -y dnf-plugins-core",
    "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo",
    "sudo yum -y install terraform"
    ]
vm_ssh_username = "vagrant"
vm_ssh_password = "vagrant"