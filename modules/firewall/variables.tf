variable "firewall_prefix" {
    description = "Prefix used to the name of the firewall rules"
    type = string 
}

variable "network_id" {
    description = "the ID of the VPC network to attach these firewall rules to"
    type = string 
}

variable "target_tags" {
    description = "Network tags identifying which instance these rules apply to"
    type = list(string) 
}

variable "ssh_source_range" {
    description = "CIDR range allowed to ssh in"
    type = list(string)
    default = ["0.0.0.0/0"] 
}