
terraform {
  required_version = ">=0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
     random = {
    source  = "hashicorp/random"
    version = "3.1.0"
  }
  }
 
  //this is Storage for state file
backend "azurerm" {
  resource_group_name  = "terraform-storage-rg" // rg-name of storage
  storage_account_name = "kushalkush867"        //r-name of storage
  container_name       = "tf-state-file"        //container-name
  key                  = "terraform.tfstate"    //local filename
}

}

provider "azurerm" {
  features {}
}

# resource "random_pet" "askrandom" {

#  }