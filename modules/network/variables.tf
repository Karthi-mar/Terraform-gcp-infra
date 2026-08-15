variable "vpc_name"{
    description = "Name of the vpc network"
    type = string
}

variable "region"{
    description = "Regtion of the network"
    type = string
}

variable "subnet_name"{
    description = "Name of the vpc sub_network"
    type = string
}

variable "subnet_cidr"{
    description = "Name of the vpc sub_network CIDR block"
    type = string
    default = "10.0.0.0/24"
}

