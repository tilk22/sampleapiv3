# we need to add a provider that we goig to use
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "tf_rg_sampleapi" {
  name     = "royafarmrg"
  location = "West US"
}

variable "imagebuild" {
  type = string
  description = "the lastest build version"
}
#create container group
# create the container group
resource "azurerm_container_group" "tf_cg_sampleapi" {
  name                = "cg_sampleapi"
  location            = azurerm_resource_group.tf_rg_sampleapi.location
  resource_group_name = azurerm_resource_group.tf_rg_sampleapi.name

  ip_address_type     = "Public"
  dns_name_label      = "sampleapitf"
  os_type             = "Linux"

  container {
    name = "sampleapi"
    image = "tilkdev9/sampleapi:sampleapi:${var.imagebuild}"
    cpu = "1"
    memory = "1"

    ports {
      port = 80 
      protocol = "TCP"
    }
  }
}