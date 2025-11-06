terraform {
  required_version = ">= 1.6"

  backend "local" {
    path = "terraform.tfstate"
  }
}

# Define our bare-metal nodes
locals {
  nodes = {
    "cp-node-01" = {
      hostname   = "cp-node-01.lab.local"
      ip_address = "192.168.86.101"
      role       = "control_plane"
      cpu_cores  = 6
      memory_gb  = 16
      disk_size  = 256
    }
    "worker-node-02" = {
      hostname   = "worker-node-02.lab.local"
      ip_address = "192.168.86.102"
      role       = "worker"
      cpu_cores  = 6
      memory_gb  = 16
      disk_size  = 256
    }
    "worker-node-03" = {
      hostname   = "worker-node-03.lab.local"
      ip_address = "192.168.86.103"
      role       = "worker"
      cpu_cores  = 6
      memory_gb  = 16
      disk_size  = 256
    }
  }

  nfs_server = var.truenas_nfs_server
  nfs_path   = var.truenas_nfs_path
}

# Output for documentation
output "cluster_info" {
  value = {
    control_plane_node = [for k, v in local.nodes : v if v.role == "control_plane"]
    worker_nodes       = [for k, v in local.nodes : v if v.role == "worker"]
    nfs_server         = local.nfs_server
    nfs_path           = local.nfs_path
    pod_network        = var.pod_network_cidr
    service_network    = var.service_cidr
    metallb_range      = var.metallb_ip_range
  }
}

output "next_steps" {
  value = <<-EOT
  
  Terraform configuration completed!
  
  Next steps:
  1. Review generated Ansible inventory: ../ansible/inventory/hosts.yml
  2. Run Ansible playbook: cd ../ansible && ansible-playbook playbooks/site.yml
  3. Access cluster: export KUBECONFIG=~/.kube/config
  
  EOT
}
