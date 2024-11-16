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
  type = string
  default = "10gb"
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
  type = number
}

variable "max_node_count" {
  type = string
}

variable "min_node_count" {
  type = string
}

variable "node_labels" {
  type = map(string)
}

variable "max_pods" {
  type = number
}

variable "pod_subnet_id" {
  type = string
}

