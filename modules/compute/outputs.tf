output "instance_name" {
  description = " Name of the created vm"
  value       = google_compute_instance.vm.name
}

output "external_ip" {
  description = " Public IP address of the created vm"
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip # terraform list the network_interface and access_config as list(many will be there) so [0] and nat_ip is the public ip                                                                                   
}