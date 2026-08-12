output "vpc_id"{
    description = " The ID of the vpc"
    value  = google_compute_network.vpc_id
}

output "subnet_id"{
    description = " THe ID of the subnet"
    value = google_compute_subnetwork.subnet_id
}