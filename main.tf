#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#* - This is the Root Module 
#* 
#* - Contains:
#* - (1) Terraform block, call for "azurerm" provider; define the storage to save terraform state
#* - (2) Provider block - "AzureRM": define version and connection details
#* - (3) provider blcok - "AzureAD": define version and connection details
#* - (4) Modules - define the name and specify the path
#*
#* - Variables are used in the Root Module:
#*   -- client_id 
#*   -- client_secret
#*   -- subscription_id 
#*   -- tenant_id
#* 
#*  Note: 
#* - This variables are from the Azure AD Service Principal (SP) 
#*   -- the SP is used to connect with Azure subscription
#* - Variables are defined in the file "variables.tf", under the same root-folder
#* 
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Terraform Block
terraform {
    required_providers  {
        azurerm =   {
            source  =   "hashicorp/azurerm"
        }
    }
    backend "azurerm" {
        resource_group_name  = "fanterraformstatus"
        storage_account_name = "fanterraformstatus"
        container_name       = "terraform-status"
        key                  = "jenkins.terraform.tfstate"
     }
}


# Provider Block
provider "azurerm" {
    version         =   "~> 2.90.0"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    features {}
}
provider "azuread" {
    version         =   ">= 2.13"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    tenant_id       =   var.tenant_id
    alias           =   "ad"
}


module "resoure-group" {
     source  =   "./RG"
     
     resource_group_name = "Jenkins-terraform-RG"
     location = "East US"
 }
module "vnet-subnet" {
     source  =   "./VNET-subnet"

     resource_group_name = "Jenkins-terraform-RG"
     location = "East US"
     virtual_network_name = "terraform-vnet"
     vnet_address_range = "10.10.0.0/16"
     subnet_address_range =  "10.10.10.0/24"
     subnet_name = "gw-subnet"
 }

// module "winvm" {
//     source =    "./azure/Windows10-ExistingInfra"
// }

// module "aks" {
//     source    =     "./azure/aks"
//     env       =     "dev"
// }

// module "customrole" {
//     source  =   "./azure/custom-roles"
// }

// module "provisioners" {
//     source  =   "./azure/provisioners-example"
// }

// module "linuxvm" {
//     source  =   "./azure/linuxVM"
// }