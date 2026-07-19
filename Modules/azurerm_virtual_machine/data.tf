data "azurerm_network_interface" "vm_nic" {
    for_each=var.vm_machine
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}