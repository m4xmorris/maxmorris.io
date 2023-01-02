terraform {
  cloud {
    organization = "kyan-consulting"
    workspaces { name = "maxmorris_io" }
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
