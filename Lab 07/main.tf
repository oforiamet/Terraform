provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.104"
    }
  }
}

module "resource_groups" {
  source = "./modules/resource_group"

  network_rg_name = "network-rg"
  linux_rg_name   = "linux-rg"
  windows_rg_name = "windows-rg"
  location        = "canadacentral"
}

module "network" {
  source                = "./modules/network"
  resource_group_name   = module.resource_groups.network_rg_name
  location              = "canadacentral"
  vnet_name             = "network-vnet"
  vnet_address_space    = ["10.0.0.0/16"]
  subnet1_name          = "network-subnet1"
  subnet2_name          = "network-subnet2"
  subnet1_address_space = ["10.0.0.0/24"]
  subnet2_address_space = ["10.0.1.0/24"]
  nsg1_name             = "network-nsg1"
  nsg2_name             = "network-nsg2"
}

module "linux_vms" {
  source              = "./modules/linux"
  resource_group_name = module.resource_groups.linux_rg_name
  location            = "canadacentral"
  subnet_id           = module.network.subnet1_id
  linux_name          = "n01672273-c-vm"
  linux_avs           = "centos_availability_set"
  nb_count            = 2
  size                = "Standard_B1s"
  admin_username      = "n01672273"
  public_key          = "/home/n01672273/.ssh/id_rsa.pub"
  private_key         = "/home/n01672273/.ssh/id_rsa"
}

module "windows_vms" {
  source              = "./modules/windows"
  resource_group_name = module.resource_groups.windows_rg_name
  location            = "canadacentral"
  subnet_id           = module.network.subnet2_id
  windows_name        = "n01672273-w-vm"
  windows_avs         = "windows_availability_set"
  nb_count            = 1
  size                = "Standard_B1s"
  admin_username      = "n01672273"
  admin_password      = "T1n@1980"
}
