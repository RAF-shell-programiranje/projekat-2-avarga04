output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg.name
}

/*output "vm_name" {
  description = "Virtual machine name"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "public_ip" {
  description = "Public IP address allocated to the VM (may be empty until provisioned)"
  value       = azurerm_public_ip.pubip.ip_address
}*/
