terraform {
  cloud {
    organization = "morrislan"
    workspaces { name = "maxmorrisio" }
  }
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}
provider "digitalocean" {
  token = var.digitalocean_token
}
