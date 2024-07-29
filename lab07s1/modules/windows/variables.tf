variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "windows_name" {
  type    = string
  default = "n01672273-w-vm"
}

variable "windows_avs" {
  type    = string
  default = "windows_availability_set"
}

variable "nb_count" {
  type    = number
  default = 1
}

variable "size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "n01672273"
}

variable "admin_password" {
  type      = string
  default   = "T1n@1980"
  sensitive = true
}

variable "os_disk_attributes" {
  type = map(string)
  default = {
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = "128"
    caching              = "ReadWrite"
  }
}

variable "windows_publisher" {
  type    = string
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  type    = string
  default = "WindowsServer"
}

variable "windows_sku" {
  type    = string
  default = "2019-Datacenter"
}

variable "windows_version" {
  type    = string
  default = "latest"
}