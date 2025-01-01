terraform {
  cloud {
    organization = "morrislan"
    workspaces { name = "maxmorrisio" }
  }
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}