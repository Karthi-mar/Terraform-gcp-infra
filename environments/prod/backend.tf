terraform {
  backend "gcs" {
    bucket = "gcp-webserver-505607-tfstate"
    prefix = "prod"
  }
}
