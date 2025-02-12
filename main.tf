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

resource "oci_core_vcn" "terraform-vcn" {
    cidr_block     = "10.0.0.0/16"
    compartment_id = var.compartment_id
    display_name   = "Terraform VCN"
}

resource "oci_core_subnet" "terraform-subnet" {
    vcn_id                      = oci_core_vcn.terraform-vcn.id
    cidr_block                  = "10.0.0.0/16"
    compartment_id              = var.compartment_id
    display_name                = "Terraform Subnet"
    prohibit_public_ip_on_vnic  = true
}

