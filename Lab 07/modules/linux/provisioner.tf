resource "null_resource" "linux_provisioner" {
  count = var.nb_count

  depends_on = [azurerm_linux_virtual_machine.linux_vm]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.private_key)
      host        = azurerm_public_ip.linux_public_ip[count.index].ip_address
    }

    inline = [
      "echo 'The hostname of this VM is:' $(hostname)"
    ]
  }
}