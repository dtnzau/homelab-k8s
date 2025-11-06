---
# Kubernetes Configuration
kubernetes_version: "${kubernetes_version}"
kubernetes_version_rhel_package: "{{ kubernetes_version }}-1.1"

# Network Configuration
pod_network_cidr: "${pod_network_cidr}"
service_cidr: "${service_cidr}"
cluster_dns: "10.96.0.10"

# NFS Storage Configuration
nfs_server: "${nfs_server}"
nfs_path: "${nfs_path}"

# MetalLB Configuration
metallb_ip_range: "${metallb_ip_range}"

# Container Runtime
container_runtime: containerd
