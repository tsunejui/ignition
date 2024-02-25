# Ignition

`Ignition` will help users to create a Kubernetes cluster on Proxmox using tools such as `Ansible`, `ArgoCD`, `Terraform`, etc., and deploy monitoring and alerting tools.

Feature list:
- [x] Highly available Kubernetes cluster.
- [x] Full of the binaries installation.
- [x] Kubernetes addons:
  - [ ] Promethues Monitoring.
- [x] Support container network:
  - [x] Calico.
  - [ ] Cilium.
- [x] Support container runtime:
  - [x] Containerd.
  - [ ] CRI-O.

## Roles

`Ignition` use various Ansible roles to help user establish a high-availability Kubernetes cluster on Proxmox. Take a look the roles `Ignition` are using:

- [proxmox-vm-operator](./roles/proxmox-vm-operator)

## Usage

Run the following playbook shell to generate a new Kubernetes cluster on Proxmox:

```sh
$ ansible-playbook -i inventory  proxmox-create-k8s.yml --connection=local --vault-password-file inventory/group_vars/.vault_password.txt
```