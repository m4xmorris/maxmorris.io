terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "cloudflare" {
  api_token = "nullnullnullnullnullnullnullnullnullnull"
}

provider "digitalocean" {
  token = "null"
}

module "maxmorrisio" {
  source             = "../../terraform"
  cloudflare_zone_id = "null"
  cloudflare_token   = "nullnullnullnullnullnullnullnullnullnull"
  do_token           = "null"

}
