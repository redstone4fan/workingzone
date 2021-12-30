#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#* - This file contains the variables for creating RG
#* - The variables are used in the "main.tf" file in the same sub-folder
#* 
#* - List of the variables:
#*   -- "resource-group-name"
#*   -- "location"
#*   
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

variable "resource_group_name" {
    description =   "Name of the resource group"
    type        =   string
    default     =   "Jenkins-RG"
}
variable "location" {
    description =   "Location of the resource group"
    type        =   string
    default     =   "East US"
}