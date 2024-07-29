output "windows_availability_set_name" {
  value = azurerm_availability_set.windows_avs.name
}

output "windows_vm_hostnames" {
  value = azurerm_windows_virtual_machine.windows_vm[*].name
}

output "windows_vm_fqdns" {
  value = azurerm_public_ip.windows_public_ip[*].fqdn
}

output "windows_private_ip_addresses" {
  value = azurerm_network_interface.windows_nic[*].private_ip_address
}

output "windows_public_ip_addresses" {
  value = azurerm_public_ip.windows_public_ip[*].ip_address
}