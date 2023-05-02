variable "CPUs" {
  type = string
}

variable "RAM" {
  type = string
}

variable "TEMPLATE_NAME" {
  type = string
}

variable "TEMPLATE_VERSION" {
  type = string
}

variable "VM_ISO_DATASTORE" {
  type = string
}

variable "ISO_FILE" {
  type = string
}

variable "GUEST_OS_TYPE" {
  type = string
}

variable "VMTOOLS_VERSION" {
  type = string
}

variable "VMTOOLS_DISK" {
  type = string
}

variable "USERNAME" {
  type      = string
  sensitive = true
}

variable "PASSWORD" {
  type      = string
  sensitive = true
}

variable "VCENTER_SERVER" {
  type = string
}

variable "VCENTER_HOST" {
  type = string
}

variable "KICKSTART_CFG" {
  type    = string
  default = ""
}

variable "NETWORK_ADAPTERS" {
  type = list
}

variable "STORAGE" {
  type = list(object({
    disk_size             = string
    disk_thin_provisioned = string
  }))
}