provider "azurerm" {
  features {}
}
locals {
  common_tags = {
    Environment = "Development"
    Project     = "CCGC 5502 Automation Assignment"
  }
}

module "resource_group" {
  source    = "./rgroup-2273"
  humber_id = var.humber_id
  location  = var.location
  tags      = var.tags
}

module "network" {
  source              = "./network-2273"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.rg_name
  tags                = var.tags
}

module "common" {
  source              = "./common-2273"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.rg_name
  tags                = var.tags
}

module "linux_vms" {
  source                     = "./vmlinux-2273"
  humber_id                  = var.humber_id
  location                   = var.location
  resource_group_name        = module.resource_group.rg_name
  subnet_id                  = module.network.subnet_id
  storage_account_uri        = module.common.storage_account_uri
  admin_username             = var.admin_username
  public_key_path            = var.public_key_path
  private_key_path           = var.private_key_path
  tags                       = var.tags
  linux_vm_names             = var.linux_vm_names
  linux_vm_size              = var.linux_vm_size
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

locals {
  linux_vm_public_ips = module.linux_vms.linux_vm_public_ips
}


module "windows_vms" {
  source                     = "./vmwindows-2273"
  humber_id                  = var.humber_id
  location                   = var.location
  resource_group_name        = module.resource_group.rg_name
  subnet_id                  = module.network.subnet_id
  storage_account_uri        = module.common.storage_account_uri
  admin_username             = var.admin_username
  admin_password             = var.admin_password
  windows_vm_count           = var.windows_vm_count
  windows_vm_size            = var.windows_vm_size
  tags                       = var.tags
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

module "data_disks" {
  source              = "./datadisk-2273"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.rg_name
  linux_vm_ids        = module.linux_vms.linux_vm_ids
  windows_vm_ids      = module.windows_vms.windows_vm_ids
}


module "load_balancer" {
  source              = "./loadbalancer-2273"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.rg_name
  tags                = var.tags
}

module "database" {
  source                  = "./database-2273"
  humber_id               = var.humber_id
  location                = var.location
  resource_group_name     = module.resource_group.rg_name
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  tags                    = var.tags
  postgresql_version      = var.postgresql_version
  ssl_enforcement_enabled = var.ssl_enforcement_enabled
}

# Declare these variables in the root module's variables.tf
variable "postgresql_version" {
  description = "The version of PostgreSQL to use"
  default     = "11"
}

variable "ssl_enforcement_enabled" {
  description = "Whether SSL enforcement is enabled"
  default     = true
}
