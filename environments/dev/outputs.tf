output "web_server_ip" {
  description = "External IP of the deployed web server"
  value       = module.compute.external_ip
}