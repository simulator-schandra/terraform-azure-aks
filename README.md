Azure AKS Terraform module
=====================================

This module is used to deploy Azure AKS cluster on Azure cloud using Terraform.

Prerequisites
--------------
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

Requirements
------------

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.8 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0.1 |


Usage
------

```hcl
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {}
}

module "aks_cluster" {

  source                            = "simulator-schandra/aks/azure"
  version                           = "0.0.1"
  cluster_name                      = "simulator-aks"
  cluster_location                  = "South India"
  rg_name                           = "simulator-rg"
  dns_prefix                        = "simulatoraks"
  kubernetes_version                = "1.29.9"
  automatic_upgrade_channel         = "node-image"
  cluster_sku_tier                  = "Free"
  private_cluster_enabled           = false
  workload_identity_enabled         = true
  role_based_access_control_enabled = true
  oidc_issuer_enabled               = true

  network_plugin = "azure"
  network_policy = "azure"
  dns_service_ip = "192.168.0.5"
  service_cidr   = "192.168.0.0/16"
  ip_versions    = ["IPv4"]

  node_pool_name       = "simnodepool"
  node_os_disk_size_gb = 30
  node_vm_size         = "Standard_D2s_v3"
  auto_scaling_enabled = true
  min_node_count       = 1
  max_node_count       = 1
  node_count           = 1
  node_labels = {
    "Environment" = "demo"
  }
  pod_subnet_id       = "simulator-sub-pvt-1"
  node_pool_subnet_id = "simulator-sub-pvt-2"
  tags = {
    "Environment" = "demo"
  }
}

```

## Inputs


| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_source"></a> [source](#input_source) | Source of the AKS module | `string` | `"simulator-schandra/aks/azure"` | yes |
| <a name="input_version"></a> [version](#input_version) | Version of the module | `string` | `"0.0.1"` | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name) | Name of the AKS cluster | `string` | `"simulator-aks"` | yes |
| <a name="input_cluster_location"></a> [cluster\_location](#input_cluster_location) | Location/Region of the AKS cluster | `string` | `"South India"` | yes |
| <a name="input_rg_name"></a> [rg\_name](#input_rg_name) | Name of the resource group | `string` | `"simulator-rg"` | yes |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input_dns_prefix) | DNS prefix for the cluster | `string` | `"simulatoraks"` | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input_kubernetes_version) | Kubernetes version for the AKS cluster | `string` | `"1.29.9"` | yes |
| <a name="input_automatic_upgrade_channel"></a> [automatic\_upgrade\_channel](#input_automatic_upgrade_channel) | Automatic upgrade channel for AKS | `string` | `"node-image"` | no |
| <a name="input_cluster_sku_tier"></a> [cluster\_sku\_tier](#input_cluster_sku_tier) | SKU tier for the AKS cluster | `string` | `"Free"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input_private_cluster_enabled) | Enable private cluster | `bool` | `false` | no |
| <a name="input_workload_identity_enabled"></a> [workload\_identity\_enabled](#input_workload_identity_enabled) | Enable workload identity | `bool` | `true` | no |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input_role_based_access_control_enabled) | Enable RBAC for AKS | `bool` | `true` | no |
| <a name="input_oidc_issuer_enabled"></a> [oidc\_issuer\_enabled](#input_oidc_issuer_enabled) | Enable OIDC issuer | `bool` | `true` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input_network_plugin) | Network plugin used for the cluster | `string` | `"azure"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input_network_policy) | Network policy for the cluster | `string` | `"azure"` | no |
| <a name="input_dns_service_ip"></a> [dns\_service\_ip](#input_dns_service_ip) | DNS service IP for the cluster | `string` | `"192.168.0.5"` | no |
| <a name="input_service_cidr"></a> [service\_cidr](#input_service_cidr) | Service CIDR for the cluster | `string` | `"192.168.0.0/16"` | no |
| <a name="input_ip_versions"></a> [ip\_versions](#input_ip_versions) | IP versions supported by the cluster | `list(string)` | <pre>[<br>  "IPv4"<br>]</pre> | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input_node_pool_name) | Name of the default node pool | `string` | `"simnodepool"` | yes |
| <a name="input_node_os_disk_size_gb"></a> [node\_os\_disk\_size\_gb](#input_node_os_disk_size_gb) | Size of the OS disk for each node (GB) | `number` | `30` | no |
| <a name="input_node_vm_size"></a> [node\_vm\_size](#input_node_vm_size) | VM size for the node pool | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_auto_scaling_enabled"></a> [auto\_scaling\_enabled](#input_auto_scaling_enabled) | Enable auto-scaling for the node pool | `bool` | `true` | no |
| <a name="input_min_node_count"></a> [min\_node\_count](#input_min_node_count) | Minimum number of nodes for auto-scaling | `number` | `1` | no |
| <a name="input_max_node_count"></a> [max\_node\_count](#input_max_node_count) | Maximum number of nodes for auto-scaling | `number` | `1` | no |
| <a name="input_node_count"></a> [node\_count](#input_node_count) | Initial number of nodes in the node pool | `number` | `1` | no |
| <a name="input_node_labels"></a> [node\_labels](#input_node_labels) | Labels for the nodes in the node pool | `map(string)` | <pre>{<br>  "Environment": "demo"<br>}</pre> | no |
| <a name="input_pod_subnet_id"></a> [pod\_subnet\_id](#input_pod_subnet_id) | Subnet ID for pod network | `string` | `"simulator-sub-pvt-1"` | yes |
| <a name="input_node_pool_subnet_id"></a> [node\_pool\_subnet\_id](#input_node_pool_subnet_id) | Subnet ID for the node pool | `string` | `"simulator-sub-pvt-2"` | yes |
| <a name="input_tags"></a> [tags](#input_tags) | Tags to be applied to the AKS cluster resources | `map(string)` | <pre>{<br>  "Environment": "demo"<br>}</pre> | no |


## Outputs


Revision History 
----------------

### Contributors

- Originally created by [Suyash Chandra](https://github.com/suyash1610)