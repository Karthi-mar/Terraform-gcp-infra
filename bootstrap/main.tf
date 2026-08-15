terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~>5.0"
        }
    }
}

provider "google" {

    project = var.project_id 
    region = var.region
}

resource "google_storage_bucket" "tf_state" {
    name = var.bucket_name
    location = var.region
    storage_class = "STANDARD"
    uniform_bucket_level_access = true
    public_access_prevention = "enforced"

    versioning {
    enabled = true
    }
}

