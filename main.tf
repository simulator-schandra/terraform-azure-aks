module "aks_cluster" {

  source                            = "./module"
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
