output "vcn_state" {
    description = "The state of the VCN."
    value = oci_core_vcn.terraform-vcn.state
}

output "subnet_cidr" {
    description = "CIDR block of the core VCN"
    value =  oci_core_subnet.terraform-subnet.cidr_block
}
