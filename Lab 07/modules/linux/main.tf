resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_public_ip" "linux_public_ip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux_name}-${count.index + 1}"
}

resource "azurerm_network_interface" "linux_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_public_ip[count.index].id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  count                 = var.nb_count
  name                  = "${var.linux_name}${format("%1d", count.index + 1)}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.linux_nic[count.index].id]
  size                  = var.size
  availability_set_id   = azurerm_availability_set.linux_avs.id

  os_disk {
    name                 = "${var.linux_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.os_disk_attributes["caching"]
    storage_account_type = var.os_disk_attributes["storage_account_type"]
    disk_size_gb         = var.os_disk_attributes["disk_size_gb"]
  }

  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }

  computer_name  = "${var.linux_name}${format("%1d", count.index + 1)}"
  admin_username = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }
  depends_on = [azurerm_network_interface.linux_nic]
}