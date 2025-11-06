variable "ssh_user" {
  description = "SSH user for accessing nodes"
  type        = string
  default     = "k8s-admin"
}

variable "ssh_private_key_path" {
  description = "Path to SSH private key"
  type        = string
  default     = "~/.ssh/id_ed25519"
}

variable "truenas_nfs_server" {
  description = "TrueNAS NFS server IP or hostname"
  type        = string
}

variable "truenas_nfs_path" {
  description = "NFS export path on TrueNAS"
  type        = string
  default     = "/mnt/ssd-pool/k8s-storage"
}

variable "kubernetes_version" {
  description = "Kubernetes version to install"
  type        = string
  default     = " 1.31.4"
}

variable "pod_network_cidr" {
  description = "Pod network CIDR for Flannel"
  type        = string
  default     = "10.244.0.0/16"
}

variable "service_cidr" {
  description = "Service network CIDR"
  type        = string
  default     = "10.96.0.0/12"
}

variable "metallb_ip_range" {
  description = "IP range for MetalLB load balancer"
  type        = string
  default     = "192.168.86.200-192.168.86.250"
}
