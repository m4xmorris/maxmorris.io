resource "cloudflare_page_rule" "delete_www" {
  zone_id  = var.cloudflare_zone_id
  target   = "www.${var.domain}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://${var.domain}/$1"
      status_code = "301"
    }
  }
}

resource "cloudflare_page_rule" "delete_www_old" {
  zone_id  = var.cloudflare_zone_id
  target   = "www.${var.domain_old}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://${var.domain_old}/$1"
      status_code = "301"
    }
  }
}