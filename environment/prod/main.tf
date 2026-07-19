module "resource_group" {
    source = "../../Modules/Resource_group"
    rg_new=var.rg_new
}

module "vnet" {
    depends_on= [module.resource_group]
    source="../../Modules/Azurerm_vnet"
    vnet_new= var.vnet_new
}
module "subnet"{
    depends_on = [ module.vnet ]
    source="../../Modules/Azurerm_subnet"
    subnet_new=var.subnet_new
}
module "public_ip" {
    depends_on= [module.subnet]
    source ="../../Modules/azurerm_public_ip"
    pip_new=var.pip_new
}
module "nic" {
    depends_on = [ module.subnet, module.public_ip ]
    source="../../Modules/azurerm_nic"
    network_interface=var.network_interface
}
module "Virtual_machine"{
    depends_on = [ module.nic ]
    source="../../Modules/azurerm_virtual_machine"
    vm_machine=var.vm_machine

}