#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#* - Define Output parameters for RG
#* - 2 output value, which are the same as variables
#* - The output parameters will be saved in the terraform state file
#* - The resources are created in the "main.tf" file
#* 
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

output "resource-group-name" {
    description     =   "Print the name of the resource group"
    value           =   azurerm_resource_group.rg.name
}

output "resource-group-location" {
    description     =   "Print the location of the resource group"
    value           =   azurerm_resource_group.rg.location
}