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
    max_count            = var.max_node_count ? var.auto_scaling_enabled == true : null
    min_count            = var.min_node_count ? var.auto_scaling_enabled == true : null
    node_count           = var.node_count
    max_pods             = var.max_pods

    pod_subnet_id = var.pod_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version        = var.kubernetes_version
  automatic_upgrade_channel = var.automatic_upgrade_channel

  tags = merge(
    {
      Name        = var.cluster_name
      Provisioner = "Terraform"
    },
    var.tags
  )
}
