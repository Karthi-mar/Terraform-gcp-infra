terraform {
    backend "gcs" {
        bucket = "Your-actual-project-id-tfstate"
        prefix = "dev"
    }
}


# the tfstate file lives in the bucket created by the bootstrap terraform (cd into it and apply it seperately)


