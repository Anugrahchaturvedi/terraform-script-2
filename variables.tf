
variable "ssh_public_key" {
# default = "~/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4pIDUjdwa7DUs6P52bGXJbqtkbUp0RZzLD+F9yrkSSA7IabCqnguHrMU+b3GRMfqtKguWD1X6KWSyjEFqb60sBiBeCSXg0ztSNrpywx7GWw/1BL2Jyqs97r5Ok/UWVUJjwLeoRXMb8O5fS+1QJ/2LrbNsXNcy27bATlJNogFhNC6u0LTmSGPBtY6HPBIZ/A2l16Zx5n9/9uFRFGyVtCw98ThSp7xJwdfTxl3qg/Uf7fjTLdWFc5336Xl2YGkTTQNP70OiVkdsORcC2K8hCfwqhazKOmDn4QYRUIBsRN2QCFFI0Qz3FPRnOaUmtUhuc9NpRKbJNbGlX1gC+BLjYII4lCa4GAxvgaZXD8DCKSMmEPHbp2DWtLoWyaTe7EdwciADJ1YYb8w310+ZWZbmhTCV1CNkad3iMVJoBMBM1uOxyhsrzBuS/xFtdEFn4LmbggZHAYyXBakQsPtVWwtcQ89mZguuHugLPCBEMT0zZSJzdrHZkS5y9FvXHJRvpCBjjT2FivRPLF6Zs5AkbH5T8ePYR+1WsaBxJ0AkJ/6fl+cMUaQIyFmPJx9rzxHlVobNKLl9kdUyXn4S3J2rfDJdOnV1Hi4fGUruTymXEzbp5Ds4OMx6uMAp9YB6cYNlvDbpWwcxIy10Xt+EdJncffh1B3vGbs+3bSQS7eb2lBU9dNYHgw== azureuser@myserver"
description = "this is path of Public key for Linux type VMs"
}

variable "windows_admin_name" {
  type=string
  default ="azureuser"
  description = "this is username for windows admin"
}

variable "windows_admin_password" {
  type = string
  default = "Password@12345"
  description = "this variable defines windows admin password"
}

variable "location" {

  default     = "Centralindia"
  description = "this is Location of where all resources group are created"
  type        = string
}
variable "resource_group_name" {
  default     = "aks-cluster-rg"
  type        = string
  description = "this is a default rg name"

}
variable "environment" {
  default     = "dev"
  description = "this is name of Evn Variables"
  type        = string

}
//vnet
variable "address_space" {
  default = "10.0.0.0/8"
  description= "this is a custom vnet address space"
  type = string
}

//subnet
variable "akspodssubnet"{
   default = "10.240.0.0/16"
  description = "this is a Subnet"
  type = string
}

//dns_service_ip_range
variable "aksdns" {
  default = "10.0.0.10"
  description="this is DNS for aks"
  type = string
}

//docker_bridge_address
variable "dockercidrip" {
  default = "172.17.0.1/16"
  description= "this is a Docker CIDR ip"
  type = string
}

//aks_service_ip
variable "aksservicecidr"{
  default = "10.0.0.0/16"
  type = string
}