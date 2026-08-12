terraform {
    required_providers {
        google = {
            source = "hashcorp/google"
            version = "~>5.0"
        }
    }
}

provider "google" {

    project = var.project_id 
    region = var.region
}

resource "google_storage_busckt" "tf_state" {
    name = var.bucket_anme
    location = var.region
    storage_class = "STANDARD"
    uniform_bucket_access = true
    public_access_prevention = "enforced"

    versioning {
    enabled = true
}
}

