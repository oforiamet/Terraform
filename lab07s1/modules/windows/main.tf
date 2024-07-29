resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_public_ip" "windows_public_ip" {
  count               = var.nb_count
  name                = "${var.windows_name}-pip-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.windows_name}-${count.index + 1}"
}

resource "azurerm_network_interface" "windows_nic" {
  count               = var.nb_count
  name                = "${var.windows_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.windows_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_public_ip[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count                 = var.nb_count
  name                  = "${var.windows_name}${format("%1d", count.index + 1)}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.windows_nic[count.index].id]
  size                  = var.size
  availability_set_id   = azurerm_availability_set.windows_avs.id
  admin_username        = var.admin_username
  admin_password        = var.admin_password

  os_disk {
    name                 = "${var.windows_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.os_disk_attributes["caching"]
    storage_account_type = var.os_disk_attributes["storage_account_type"]
    disk_size_gb         = var.os_disk_attributes["disk_size_gb"]
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }

  winrm_listener {
    protocol = "Http"
    certificate_url = var.certificate_url
  }
}
