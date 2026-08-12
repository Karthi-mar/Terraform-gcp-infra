variable "instance_name" {
    description = "the name of the vm "
    type = string
}


variable "machine_type" {
    description = "The Type of machine "
    type = string
    default = "e2-micro"
}

variable "zone" {
    description = "THe zone in which the vm will be deployed "
    type = string
    default = "us-central1-a"
}

variable "image"{
    description = "Boot disk image"
    type = string
    default = "debian-cloud/debian-12"
}

variable "subnet_id" {
    description = "Subnet to attach to the vm (from the network module)"
    type = string
}

variable "network_tags" {
    description " Network tags - must match the firewall module's target_tags"
    type = list(string)
}



