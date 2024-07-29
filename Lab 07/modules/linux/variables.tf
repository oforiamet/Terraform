variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "linux_name" {
  type    = string
  default = "n01672273-c-vm"
}

variable "linux_avs" {
  type    = string
  default = "linux_availability_set"
}

variable "nb_count" {
  type    = number
  default = 2
}

variable "size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "n01672273"
}

variable "public_key" {
  type    = string
  default = "/home/n01672273/.ssh/id_rsa.pub"
}

variable "private_key" {
  type    = string
  default = "/home/n01672273/.ssh/id_rsa"
}

variable "os_disk_attributes" {
  type = map(string)
  default = {
    storage_account_type = "Premium_LRS"
    disk_size_gb         = "32"
    caching              = "ReadWrite"
  }
}

variable "linux_publisher" {
  type    = string
  default = "OpenLogic"
}

variable "linux_offer" {
  type    = string
  default = "CentOS"
}

variable "linux_sku" {
  type    = string
  default = "8_2"
}

variable "linux_version" {
  type    = string
  default = "latest"
}