terraform {
  backend "s3" {
    bucket = "morrislan-tfstate"
    key    = "/morrislan/terraform.tfstate"
    region = "us-east-1"
    endpoint = "https://lon1.digitaloceanspaces.com"
    skip_credentials_validation = true
    skip_metadata_api_check = true
  }
}

resource "digitalocean_spaces_bucket" "tfstate" {
  name   = "morrislan-tfstate"
  region = "lon1"
  versioning {enabled = "true"}
  acl = "private"
}