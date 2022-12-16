terraform {
required_version = ">= 0.13.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}


variable "username" {
  description = "The Openstack username"
  type = string
}


variable "password" {
  description = "The Openstack password"
  type = string
}


provider "openstack" {
  user_name   = var.username
  auth_url = "http://cloud.univ-lille.fr:5000/v3/"
  password = var.password
  tenant_id = "3b40dec9e32948378cb7e314c9d500e4"
}


resource "openstack_compute_keypair_v2" "keypair" {
	provider = openstack
	name = "key-key"
  public_key = file("/home/joel-muaka/.ssh/id_rsa.pub")
}


resource "openstack_compute_instance_v2" "terraform_instances" {
	 name = "terraform_instance-${count.index}"
	 count = 4
	 provider = openstack
	 image_name = "ubuntu-20.04"
	 flavor_name = "normale"
	 key_pair = openstack_compute_keypair_v2.keypair.name
}
