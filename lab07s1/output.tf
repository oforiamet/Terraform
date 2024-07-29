output "network_resource_group_name" {
  value = module.resource_groups.network_rg_name
}

output "linux_resource_group_name" {
  value = module.resource_groups.linux_rg_name
}

output "windows_resource_group_name" {
  value = module.resource_groups.windows_rg_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "vnet_address_space" {
  value = module.network.vnet_address_space[0]
}

output "subnet1_name" {
  value = module.network.subnet1_name
}

output "subnet1_address_space" {
  value = module.network.subnet1_address_space[0]
}

output "subnet2_name" {
  value = module.network.subnet2_name
}

output "subnet2_address_space" {
  value = module.network.subnet2_address_space[0]
}

output "nsg1_name" {
  value = module.network.nsg1_name
}

output "nsg2_name" {
  value = module.network.nsg2_name
}

output "centos_hostnames" {
  value = module.linux_vms.linux_vm_hostnames
}

output "centos_fqdns" {
  value = module.linux_vms.linux_vm_fqdns
}

output "centos_private_ip_addresses" {
  value = module.linux_vms.linux_private_ip_addresses
}

output "centos_public_ip_addresses" {
  value = module.linux_vms.linux_public_ip_addresses
}

output "windows_hostname" {
  value = module.windows_vms.windows_vm_hostnames[0]
}

output "windows_fqdn" {
  value = module.windows_vms.windows_vm_fqdns[0]
}

output "windows_private_ip_address" {
  value = module.windows_vms.windows_private_ip_addresses[0]
}

output "windows_public_ip_address" {
  value = module.windows_vms.windows_public_ip_addresses[0]
}