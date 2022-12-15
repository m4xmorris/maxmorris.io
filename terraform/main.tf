resource "digitalocean_project" "site-project" {
  name        = "${var.site_name}-project"
  description = var.description
  purpose     = "Web Application"
  environment = var.environment
  resources = [digitalocean_app.site-app.urn]
  is_default = false
}

resource "digitalocean_app" "site-app" {
  spec {
    name   = "${var.site_name}-app"
    region = "lon"
    domain {
    name = var.domain
    }

    alert {rule = "DEPLOYMENT_FAILED"}
    alert {rule = "DEPLOYMENT_LIVE"}
    alert {rule = "DOMAIN_FAILED"}
    alert {rule = "DOMAIN_LIVE"}

    static_site {
      name          = var.site_name
      source_dir    = var.source_dir
      output_dir = var.output_dir
      build_command = var.build_command

      github {
        repo = var.source_repo
        branch         = var.source_branch
        deploy_on_push = true
      }
    }
  }
}

resource "cloudflare_record" "root-record" {
  zone_id = var.cloudflare_zone_id
  name    = var.domain
  value   = replace(digitalocean_app.site-app.default_ingress,"/(https://)|(/)/","")
  type    = "CNAME"
  ttl     = 3600
  depends_on = [digitalocean_app.site-app]
}
resource "cloudflare_record" "www-record" {
  zone_id = var.cloudflare_zone_id
  name    = "www.${var.domain}"
  value   = replace(digitalocean_app.site-app.default_ingress,"/(https://)|(/)/","")
  type    = "CNAME"
  ttl     = 3600
  depends_on = [digitalocean_app.site-app]
}

resource "cloudflare_page_rule" "delete_www" {
  zone_id = var.cloudflare_zone_id
  target = "www.${var.domain}/*"
  priority = 2

  actions {
    forwarding_url {
      url = "https://${var.domain}/$1"
      status_code = "301"
    }
  }
}
