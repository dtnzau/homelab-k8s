---
all:
  hosts:
%{ for name, node in nodes ~}
    ${name}:
      ansible_host: ${node.ip_address}
      ansible_user: ${ssh_user}
      ansible_ssh_private_key_file: ${ssh_private_key}
      ansible_python_interpreter: /usr/bin/python3
      hostname: ${node.hostname}
      node_role: ${node.role}
%{ endfor ~}
  
  children:
    control_plane:
      hosts:
%{ for name, node in nodes ~}
%{ if node.role == "control_plane" ~}
        ${name}:
%{ endif ~}
%{ endfor ~}
    
    workers:
      hosts:
%{ for name, node in nodes ~}
%{ if node.role == "worker" ~}
        ${name}:
%{ endif ~}
%{ endfor ~}
    
    k8s_cluster:
      children:
        control_plane:
        workers:
