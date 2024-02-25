resource "proxmox_vm_qemu" "cloudinit-vm" {
  count       = length(var.ips)
  vmid        = var.vmid + count.index
  name        = "${var.name}-${count.index}"
  desc        = var.description
  target_node = var.node
  clone       = var.clone
  agent       = 1
  os_type     = "cloud-init"
  cores       = var.cpu
  sockets     = 1
  vcpus       = 0
  cpu         = "host"
  memory      = var.memory
  scsihw      = "virtio-scsi-single"
  disk {
    size    = var.disk_size
    type    = "scsi"
    storage = var.storage
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  ipconfig0 = "ip=${var.ips[count.index]}/24,gw=${var.gateway}"

  ssh_user        = var.ssh_user
  ssh_private_key = var.ssh_key

  connection {
    type        = "ssh"
    user        = self.ssh_user
    private_key = self.ssh_private_key
    host        = self.ssh_host
    port        = self.ssh_port
  }

  provisioner "remote-exec" {
    inline = [
      "ip a"
    ]
  }
}
