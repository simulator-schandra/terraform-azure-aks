Azure AKS Terraform module
=====================================

This module is used to deploy Azure AKS cluster on Azure cloud using Terraform.

Prerequisites
--------------
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)


Version Constraints
-------------------

- Terraform version : ~> 1.9.8
- Azure provder version : ~> 4.0.1

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

```
Tags
----
* Tags are assigned to resources with name variable as prefix.
* Additial tags can be assigned by tags variables as defined above.

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The string for name of the instance | `string` | `"false"` | yes |
| tags | The tags for ec2 instance   | `string` | `"false"` | no |
| instance_type | You can define the type of instance | `string` | `"false"` | yes |
| key_name | Name of the key that you have to define while create an key | `string` | `"false"` | yes |
| volume_size | Define size of EBS volume  | `number` | `"false"` | yes |
| subnet |define subnet to launch ec2 instace to particular subnet | `string` | `"false"` | yes |
| security_groups |define security group to attach an instace to particular subnet | `list` | `"false"` | yes |
| ami_id |define ami_id for ec2 instance | `string` | `"false"` | yes |
| public_ip |define public_ip for ec2 instance | `bool` | `"true"` | no |


Output
------
| Name | Description |
|------|-------------|
| instance_ip | The IP of the instance |
| instance_id | The ID of the instance |

## Related Projects

Check out these related projects.

- [security_group](https://github.com/OT-CLOUD-KIT/terraform-aws-network-skeleton) - Terraform module for creating dynamic Security 

### Contributors

[![Devesh Sharma][devesh_avataar]][devesh_homepage]<br/>[Devesh Sharma][devesh_homepage] 

  [devesh_homepage]: https://github.com/deveshs23
  [devesh_avataar]: https://img.cloudposse.com/150x150/https://github.com/deveshs23.png