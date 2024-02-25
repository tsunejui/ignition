proxmox-vm-operator
=========

A ansible role to configure VMs on Proxmox.

Requirements
------------

This role requires the following collections:

name | version
-----|--------
community.general | greater than version `8.3.0`
ansible.netcommon | greater than version `5.3.0`

use the following command to verify collection version:

```
ansible-galaxy collection list | grep community.general
```

To install or upgrade the latest version of collection `community.general`:
```
ansible-galaxy collection install community.general --force --upgrade
```

Role Variables
--------------

The following variables need to be established. Please ensure that all fields are filled:

name | type | description | example
-----|------|-------------|--------
hosts_group | string | ansible hosts group of inventory | master
action | string | supported multiple operation of Proxmox VM: create | create
force | boolean | If set to true, it will overwrite current settings when VM existed | false
ssh_private_key | string | the contents of private ssh key for executing command on remove machine | {{ lookup('file', playbook_dir + '/example/id_rsa') }}
pm_user | string | the api user on Proxmox server | ignition
pm_host | string | the host IP address on Proxmox server | 192.168.1.100
pm_token_id | string | proxmox user token id | terraform@pve!xxx
pm_secret | string | proxmox user secret | xxx
ssh_user | string | ssh login user | root
vm.name | string | Proxmox VM name | k8s-master
vm.temp | string | Proxmox VM template | temp-rocky-8
vm.cpu | number | the number of Proxmox VM cpu cores | 2
vm.memory | number | the size of Proxmox VM memory (unit: MB) | 4096
vm.disk | string | the size fo Proxmox VM disk | 32G
vm.gateway_ip | string | the IP address of network gateway | 192.168.1.1
node.start_id | number | which number does the VM ID start | 100
node.name | string | which node does the VM created | xxx
node.storage | string | which storage does the VM used | xxx

for example:

```
action: create
hosts_group: worker
vm:
  name: "k8s-worker"
  temp: "<tmp-name>"
  cpu: 4
  memory: 8192
  disk: "100G"
  gateway_ip: "192.168.1.1"
ssh_private_key: "{{ lookup('file', playbook_dir + '/example/id_rsa') }}"
force: false
pm_user: "<proxmox-api-user>"
pm_host: "<proxmox-api-host>"
pm_token_id: "<proxmox-api-token-id>"
pm_secret: "<proxmox-api-token-secret>"
ssh_user: "<proxmox-vm-ssh-user>"
node:
  start_id: 500
  name: "<proxmox-node-name>"
  storage: "<proxmox-node-storage>"
```

Example Playbook
----------------

An example of how to use the role:

```
    - hosts: kubernetes_servers
      roles:
        - role: proxmox-create-vm
          vars:
            hosts_group: master
            vm:
              name: "k8s-master"
              temp: "temp-rocky-8"
              cpu: "2"
              memory: "4096"
              disk: "32G"
              gateway_ip: "192.168.1.1"
            ssh_private_key: "{{ lookup('file', playbook_dir + '/example/id_rsa') }}"
            pm_api_url: "https://192.168.1.100:8006/api2/json"
            pm_token_id: "terraform@pve!xxx"
            pm_secret: "xxx"
            ssh_user: "root"
            node:
              start_id: "100"
              name: "xxx"
              storage: "xxx"

```

License
-------

BSD
