resource "azurerm_linux_virtual_machine" "linuxvm1" {
  name                = "linuxvm1"
  resource_group_name = "${data.azurerm_resource_group.default.name}"
  location            = "eastus"
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.linux1nic.id
  ]

  os_disk {
    name                 = "Linux1OsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
  }
}