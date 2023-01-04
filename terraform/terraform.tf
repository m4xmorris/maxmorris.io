terraform {
    cloud {
        organization = "kyan-consulting"
        workspaces { name = "maxmorrisio" }
    }
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
        }
        cloudflare = {
            source  = "cloudflare/cloudflare"
        }
    }
}

provider "cloudflare" {
    api_token = var.cloudflare_token
}
provider "digitalocean" {
    token = var.do_token
}
