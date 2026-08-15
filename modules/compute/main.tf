resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.network_tags

  boot_disk {
    initialize_params {
      image = var.image
      type  = "pd-standard"
      size  = 10
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    access_config {} # gives the vm an ephimeral public ip , leaving it out will make it only internal
  }

  metadata_startup_script = file("${path.module}/startup_script.sh") # reads a shell script and runs on the first boot
}
