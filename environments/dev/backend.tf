terraform {
    backend "gcs" {
        bucket = "gcp-webserver-505607-tfstate"
        prefix = "dev"
    }
}


# the tfstate file lives in the bucket created by the bootstrap terraform (cd into it and apply it seperately)


