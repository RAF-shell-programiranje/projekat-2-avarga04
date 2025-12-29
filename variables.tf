variable "prefix" {
  description = "Name prefix for all resources"
  type        = string
  default     = "demo"
}

variable "location" {
  description = "Azure region to deploy into"
  type        = string
  default     = "francecentral"
}

variable "resource_group_name" {
  description = "Name of the resource group. If empty, will be created using prefix"
  type        = string
  default     = ""
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "anjav8824si"
}

variable "admin_ssh_public_key_path" {
  description = "Path to the SSH public key file (public key content will be read). Use absolute path or relative to the working directory."
  type        = string
  default     = "/home/vboxuser/projekat2/projekat-2-avarga04/projekat2.pub"
}

variable "os_disk_size_gb" {
  description = "Size of the OS disk in GB"
  type        = number
  default     = 30
}
