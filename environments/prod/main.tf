terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source      = "../../modules/network"
  vpc_name    = "${var.env}-vpc"
  subnet_name = "${var.env}-subnet"
  subnet_cidr = var.subnet_cidr
  region      = var.region
}

module "firewall" {
  source           = "../../modules/firewall"
  network_id       = module.network.vpc_id
  firewall_prefix  = var.env
  ssh_source_range = var.ssh_source_range
  target_tags      = ["web-server"]
}

module "compute" {
  source        = "../../modules/compute"
  instance_name = "${var.env}-web-server"
  zone          = var.zone
  subnet_id     = module.network.subnet_id
  network_tags  = ["web-server"]
}

variable "ssh_source_range" {
  description = "CIDR range allowed to SSH into the web server"
  type        = list(string)
}
