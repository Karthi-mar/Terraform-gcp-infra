variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = " GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = " GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "env" {
  description = " Environment name "
  type        = string
  default     = "dev"
}

variable "subnet_cidr" {
  description = "Range of subnet "
  type        = string
  default     = "10.0.1.0/24"
}

variable "ssh_source_range" {
  description = "CIDR range allowed to SSH into the web server"
  type        = list(string)
}

