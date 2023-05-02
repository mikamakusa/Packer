variable "CPUs" {
  type = number
}

variable "RAM" {
  type = number
}

variable "TEMPLATE_NAME" {
  type = string
}

variable "TEMPLATE_VERSION" {
  type = string
}

variable "VM_ISO_DATASTORE" {
  type    = list(string)
  default = []
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
  type = string
}

variable "password" {
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
  type    = list(object{
    network_card = string
  })
  default = []
}

variable "storage" {
  type = list(object{
    disk_size = number
  })
  default = []
}