
data "azurerm_subnet" "snet" {
  for_each=var.network_interface
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "frontend_pip" {
    for_each=var.network_interface
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}