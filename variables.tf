variable "vsphere_server" {
  description = "vsphere server for the environment - EXAMPLE: vcenter01.hosted.local"
  default     = ""
}
 
/*variable "vsphere_user" {
  description = "vsphere server for the environment - EXAMPLE: vsphereuser"
  default     = ""
}
 
variable "vsphere_password" {
  description = "vsphere server password for the environment"
  default     = "VMware1!"
}
 
variable "adminpassword" { 
    default = "terraform" 
    description = "Administrator password for windows builds"
}*/
 
variable "datacenter" { 
    default = "Datacenter"
    description = ""
}
 
variable "datastore" { 
    default = "vsanDatastore" 
    description = ""
}
 
variable "cluster" { 
    default = "Cluster" 
    description = ""
}
 
variable "portgroup" { 
    default = "VM Network" 
    description = ""
}
 
variable "domain_name" { 
    default = "contoso.lan"
    description = ""
}
variable "default_gw" { 
    default = "" 
    description = ""
}
 
variable "template_name" { 
    default = "Windows2019" 
    description = ""
}
 
variable "vm_name" { 
    default = "WS19-1" 
    description = ""
 
}
 
variable "vm_ip" { 
    default = "" 
    description = ""
}
 
variable "vm_cidr" { 
    default = 24 
    description = "CIDR Block for VM"
}
 
variable "vcpu_count" { 
    default = 1 
    description = "How many vCPUs do you want?"
}
 
variable "memory" { 
    default = 1024 
    description = "RAM in MB"
}
