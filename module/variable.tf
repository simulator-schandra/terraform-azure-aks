######### Cluster Variable ##########

variable "cluster_name" {
  type = string
}

variable "cluster_location" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "kubernetes_version" {
  type = string
}

variable "automatic_upgrade_channel" {
  type = string
}

variable "cluster_sku_tier" {
  type = string
  default = "Free"
}

variable "private_cluster_enabled" {
  type = bool
  default = false
}

variable "workload_identity_enabled" {
  type = bool
  default = true
}

variable "role_based_access_control_enabled" {
  type = bool
  default = true
}

######### Node group variable ##########

variable "node_pool_name" {
  type = string
}

variable "node_pool_type" {
  type    = string
  default = "VirtualMachineScaleSets"
}

variable "node_os_sku" {
  type = string
  default = "Ubuntu"
}

variable "node_os_disk_type" {
  type = string
  default = "Managed"
}

variable "node_os_disk_size_gb" {
  type = number
  default = 10
}

variable "node_vm_size" {
  type = string
}

variable "host_encryption_enabled" {
  type = bool
  default = true
}

variable "auto_scaling_enabled" {
  type    = bool
  default = false
}

variable "node_count" {
  type = string
}

variable "max_node_count" {
  type = number
}

variable "min_node_count" {
  type = number
}

variable "node_labels" {
  type = map(string)
}

variable "max_pods" {
  type = number
  default = 100
}

variable "pod_subnet_id" {
  type = string
}

variable "temporary_name_for_rotation" {
  type = string
  default = "tmpnodepool"
}


