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
  type = string
}

variable "PASSWORD" {
  type = string
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
  type    = string
  default = ""
}

variable "STORAGE" {
  type    = string
  default = ""
}