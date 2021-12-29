#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*
#* - Define variables that are used for the Root Module:
#*   -- client_id 
#*   -- client_secret
#*   -- subscription_id 
#*   -- tenant_id
#  - They are values from Service Principal
#* 
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

variable "client_id" {
    description =   "Client ID (APP ID) of the application"
    type        =   string
}
variable "client_secret" {
    description =   "Client Secret (Password) of the application"
    type        =   string
}
variable "subscription_id" {
    description =   "Subscription ID"
    type        =   string
}
variable "tenant_id" {
    description =   "Tenant ID"
    type        =   string
}