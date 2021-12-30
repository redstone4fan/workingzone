#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*     What is in this module?
#*  1) Reference a RG
#*  2) Create a VNET in the defined RG, with 2*tags - name, address range are variables
#*  3) Create a subnet within the defined VNET, with 2*tags - name, address range are variables
#*  
#*  Note: 
#* - There are 6 variables used in this main.tf file; 2 of them are data segment, which are from RG module
#* - Variables are defined in the file "variables.tf", under the same sub-folder
#*
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#
# - Create a Resource Group
#
data "azurerm_resource_group" "rg" {
    name        =   var.resource_group_name
    location    =   var.location
}

#
# - Create a Virtual Network
#
resource "azurerm_virtual_network" "vnet" {
  resource_group_name   =   azurerm_resource_group.rg.name
  name                  =   var.virtual_network_name
  location              =   azurerm_resource_group.rg.location
  address_space         =   [var.vnet_address_range]
   tags                 =   {
        "author"        =   "Redstone"
        "deployed_with" =   "Terraform"
    }
}

#
# - Create a Subnet inside the virtual network
#
resource "azurerm_subnet" "sn" {
   name                 =   var.subnet_name
   resource_group_name  =   azurerm_resource_group.rg.name
   virtual_network_name =   azurerm_virtual_network.vnet.name
   address_prefixes     =   [var.subnet_address_range]
}
