resource "cloudflare_record" "root_record" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  ttl        = 3600
  depends_on = [digitalocean_app.site_app]
}
resource "cloudflare_record" "www_record" {
  zone_id    = var.cloudflare_zone_id
  name       = "www.${var.domain}"
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  ttl        = 3600
  depends_on = [digitalocean_app.site_app]
}

resource "cloudflare_record" "mail_verify_record" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "protonmail-verification=87a1d2b07ad3698186abeb79feeceb9f19833a81"
  type       = "TXT"
  ttl        = 3600
}
resource "cloudflare_record" "mail_record_1" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "mail.protonmail.ch"
  type       = "MX"
  priority   = "10"
  ttl        = 3600
}
resource "cloudflare_record" "mail_record_2" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "mailsec.protonmail.ch"
  type       = "MX"
  priority   = "20"
  ttl        = 3600
}

resource "cloudflare_record" "root_record_old" {
  zone_id    = var.cloudflare_zone_id_old
  name       = var.domain_old
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  ttl        = 3600
  depends_on = [digitalocean_app.site_app]
}
resource "cloudflare_record" "www_record_old" {
  zone_id    = var.cloudflare_zone_id_old
  name       = "www.${var.domain_old}"
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  ttl        = 3600
  depends_on = [digitalocean_app.site_app]
}