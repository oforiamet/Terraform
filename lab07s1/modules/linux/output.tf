output "linux_availability_set_name" {
  value = azurerm_availability_set.linux_avs.name
}

output "linux_vm_hostnames" {
  value = azurerm_linux_virtual_machine.linux_vm[*].name
}

output "linux_vm_fqdns" {
  value = azurerm_public_ip.linux_public_ip[*].fqdn
}

output "linux_private_ip_addresses" {
  value = azurerm_network_interface.linux_nic[*].private_ip_address
}

output "linux_public_ip_addresses" {
  value = azurerm_public_ip.linux_public_ip[*].ip_address
}