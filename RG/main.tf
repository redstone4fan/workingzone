#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*     What is in this module?
#*  1) Create a RG, with 2*tags - name, location are variables
#*  2) This RG will be used by other modules
#*  
#*  Note: 
#* - There are 2 variables used in this main.tf file
#* - Variables are defined in the file "variables.tf", under the same sub-folder
#*
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#
# - Create a Resource Group
#
resource "azurerm_resource_group" "rg" {
    name        =   var.resource_group_name
    location    =   var.location
    tags        =   {
        "author"        =   "Redstone"
        "deployed_with" =   "Terraform"
    }
}