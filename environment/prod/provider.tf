terraform {
    required_providers{
        azurerm={
            source="hashicorp/azurerm"
            version="4.80.0"

        }
    }
    backend "azurerm"{
        storage_account_name="abcd8989"
        container_name = "vmcontainer"
        resource_group_name="rg_zenz"
        key="tf.virtaul_machine1"
    }
}

provider "azurerm" {
    features{}
}