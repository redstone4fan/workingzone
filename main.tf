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
        key                  = "tfstate.module.test"
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


resource "azurerm_resource_group" "rg" {
    name     = "fan-cicd-RG"
    location = "East US"
 }

module "vnet-new" {
  source  =   "./vnet-new"

  # source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  subnet_names        = ["subnet1","subnet2","subnet3"]

  depends_on = [azurerm_resource_group.rg]
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