module "aks_cluster" {

  source                    = "./module"
  cluster_name              = "simulator-aks"
  cluster_location          = "South India"
  rg_name                   = "simulator-rg"
  dns_prefix                = "simulatoraks"
  kubernetes_version        = "1.29.9"
  automatic_upgrade_channel = "node-image"
  node_pool_name            = "simulator-aks-default-node-pool"
  node_os_sku = ""
  node_os_disk_size_gb = ""
  node_vm_size              = "Standard_D2s_v3"
  node_count                = 1
  tags = {
    "Environment" = "Staging"
  }
}