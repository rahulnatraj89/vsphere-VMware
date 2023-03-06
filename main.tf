provider "vsphere" {
  #user                 = var.vsphere_user
  #password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = ""
}

data "vsphere_datastore" "datastore" {
  name          = "" 
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "" 
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "" 
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name = ""
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 3
  memory   = 1024
  guest_id = "rhel7_64Guest"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
  scsi_controller_count = 3
  #scsi_type = data.vsphere_virtual_machine.source_template.scsi_type 

  disk {
    label = "disk0"
    size  = "${data.vsphere_virtual_machine.template.disks.0.size}"
  }

  disk {
    label = "Hard disk 1"
    size  =  1024
    unit_number = 1
  }
  disk {
    label = "Hard disk 2"
    size  = 1024
    unit_number = 2
  }
  disk {
    label = "Hard disk 3"
    size  = 1024
    unit_number = 3
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options{
        host_name = ""
        domain = ""
      }
      network_interface {
        ipv4_address = ""
        ipv4_netmask = "24"
      }

      ipv4_gateway = ""
      dns_suffix_list = [""]
      dns_server_list = [""]
    }
  }

}
