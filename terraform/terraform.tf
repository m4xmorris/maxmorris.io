terraform {
  cloud {
    organization = "kyan-consulting"
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
