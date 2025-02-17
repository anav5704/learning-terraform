variable "compartment_id" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "region" {
  description = "OCI tenancy region"
  type        = string
}

variable "image_shape" {
  description = "VM instance shape"
  type        = string
}

variable "availability_domain" {
  description = "VM instance AD"
  type        = string

}

variable "fault_domain" {
  description = "VM instance FD"
  type        = string
}

variable "subnet_id" {
  description = "VM instance subnet ID"
  type        = string
}

variable "image_id" {
  description = "VM instance image ID"
  type        = string
}

locals {
  ssh_key = file("~/.ssh/learning-terraform/key.pub")
}
