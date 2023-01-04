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