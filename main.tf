module "aks_cluster" {

  source                    = "./module"
  cluster_name              = "simulator-aks"
  cluster_location          = "South India"
  rg_name                   = "simulator-rg"
  dns_prefix                = "simulatoraks"
  kubernetes_version        = "1.29.9"
  automatic_upgrade_channel = "node-image"
  node_pool_name            = "simulator-aks-default-node-pool"
  node_os_disk_size_gb      = "10gb"
  node_vm_size              = "Standard_D2s_v3"
  auto_scaling_enabled      = true
  min_node_count            = "1"
  max_node_count            = "1"
  node_count                = "1"
  node_labels = {
    "Environment" = "demo"
  }
  pod_subnet_id = "/subscriptions/d13e065d-de62-4283-8742-8aa75745e71d/resourceGroups/simulator-rg/providers/Microsoft.Network/virtualNetworks/simulator-vnet/subnets/simulator-sub-pvt-1"
  tags = {
    "Environment" = "demo"
  }
}
