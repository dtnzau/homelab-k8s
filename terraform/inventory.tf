# Generate Ansible inventory from Terraform configuration
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    nodes           = local.nodes
    ssh_user        = var.ssh_user
    ssh_private_key = var.ssh_private_key_path
  })

  filename        = "${path.module}/../ansible/inventory/hosts.yml"
  file_permission = "0644"
}

resource "local_file" "ansible_group_vars" {
  content = templatefile("${path.module}/templates/group_vars.tpl", {
    kubernetes_version = var.kubernetes_version
    pod_network_cidr   = var.pod_network_cidr
    service_cidr       = var.service_cidr
    nfs_server         = var.truenas_nfs_server
    nfs_path           = var.truenas_nfs_path
    metallb_ip_range   = var.metallb_ip_range
  })

  filename        = "${path.module}/../ansible/inventory/group_vars/all.yml"
  file_permission = "0644"
}
