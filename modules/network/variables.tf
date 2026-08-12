variables "vpc_name"{
    description = "Name of the vpc network"
    type = string
}

variables "region"{
    description = "Regtion of the network"
    type = string
}

variables "subnet_name"{
    description = "Name of the vpc sub_network"
    type = string
}

variables "subnet_cidr"{
    description = "Name of the vpc sub_network CIDR block"
    type = string
    default = "10.0.0.0/24"
}

