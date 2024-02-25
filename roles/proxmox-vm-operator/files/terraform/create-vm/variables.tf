variable "pm_host" {
  type = string
}

variable "vmid" {
  type = number
}

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "ips" {
  type = list(string)
}

variable "gateway" {
  type = string
}

variable "node" {
  type = string
}

variable "storage" {
  type = string
}

variable "clone" {
  type = string
}

variable "cpu" {
  type = number
}

variable "memory" {
  type = number
}

variable "disk_size" {
  type = string
}

variable "ssh_user" {
  type = string
}

variable "ssh_key" {
  type      = string
  sensitive = true
}
