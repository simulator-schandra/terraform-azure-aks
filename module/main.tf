resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.cluster_location
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                    = var.node_pool_name
    type                    = var.node_pool_type
    os_sku                  = var.node_os_sku
    os_disk_type            = var.node_os_disk_type
    os_disk_size_gb         = var.node_os_disk_size_gb
    vm_size                 = var.node_vm_size
    host_encryption_enabled = var.host_encryption_enabled

    node_labels = merge(
      {
        "Node Pool" = var.node_pool_name
      },
      var.node_labels
    )

    tags = merge(
      {
        Name        = var.node_pool_name
        Provisioner = "Terraform"
      },
      var.tags
    )

    auto_scaling_enabled = var.auto_scaling_enabled
    max_count            = var.auto_scaling_enabled == true ? var.max_node_count : null
    min_count            = var.auto_scaling_enabled == true ? var.min_node_count : null
    node_count           = var.node_count
    max_pods             = var.max_pods

    pod_subnet_id               = var.pod_subnet_id
    temporary_name_for_rotation = var.temporary_name_for_rotation
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version                = var.kubernetes_version
  automatic_upgrade_channel         = var.automatic_upgrade_channel
  private_cluster_enabled           = var.private_cluster_enabled
  workload_identity_enabled         = var.workload_identity_enabled
  role_based_access_control_enabled = var.role_based_access_control_enabled
  sku_tier                          = var.cluster_sku_tier

  tags = merge(
    {
      Name        = var.cluster_name
      Provisioner = "Terraform"
    },
    var.tags
  )
}
