terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  auth                = "SecurityToken"
  config_file_profile = "terraform"
  region              = var.region
}

# resource "oci_core_vcn" "terraform-vcn" {
#     cidr_block     = "10.0.0.0/16"
#     compartment_id = var.compartment_id
#     display_name   = "Terraform VCN"
# }

# resource "oci_core_subnet" "terraform-subnet" {
#     vcn_id                      = oci_core_vcn.terraform-vcn.id
#     cidr_block                  = "10.0.0.0/16"
#     compartment_id              = var.compartment_id
#     display_name                = "Terraform Subnet"
#     prohibit_public_ip_on_vnic  = true
# }

resource "oci_core_instance" "terraform-instance" {
  availability_domain = var.availability_domain
  fault_domain        = var.fault_domain
  compartment_id      = var.compartment_id
  shape               = var.image_shape
  display_name        = "Terraform Instance"


  create_vnic_details {
    subnet_id        = var.subnet_id
    display_name     = "Terraform VNIC"
    assign_public_ip = true
  }

  source_details {
    source_id   = var.image_id
    source_type = "image"
  }

  metadata = {
    ssh_authorized_keys = local.ssh_key
  }
}