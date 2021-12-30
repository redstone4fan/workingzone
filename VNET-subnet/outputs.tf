#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#* - Define Output parameters for VNET and subnet
#* - 6 output value, which are the same as variables
#* - The output parameters will be saved in the terraform state file
#* - The resources are created in the "main.tf" file
#* 
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

output "virtual-network-name" {
    description     =   "Print the name of the virtual network"
    value           =   azurerm_virtual_network.vnet.name
}

output "virtual-network-ip-range" {
    description     =   "Print the ip range of the virtual network"
    value           =   azurerm_virtual_network.vnet.address_space
}

output "subnet-name" {
    description     =   "Print the name of the subnet"
    value           =   azurerm_subnet.sn.name
}

output "subnet-ip-range" {
    description     =   "Print the ip range of the subnet"
    value           =   [azurerm_subnet.sn.address_prefixes]
}