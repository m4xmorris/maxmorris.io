# Website records
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
  name       = "www"
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  ttl        = 3600
  depends_on = [digitalocean_app.site_app]
}

# Mail service records
resource "cloudflare_record" "mail_verify" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "protonmail-verification=87a1d2b07ad3698186abeb79feeceb9f19833a81"
  type       = "TXT"
  ttl        = 3600
}
resource "cloudflare_record" "mail_mx_1" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "mail.protonmail.ch"
  type       = "MX"
  priority   = "10"
  ttl        = 3600
}
resource "cloudflare_record" "mail_mx_2" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "mailsec.protonmail.ch"
  type       = "MX"
  priority   = "20"
  ttl        = 3600
}
resource "cloudflare_record" "mail_spf" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "v=spf1 include:_spf.protonmail.ch mx ~all"
  type       = "TXT"
  ttl        = 3600
}
resource "cloudflare_record" "mail_dkim_1" {
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail._domainkey"
  value      = "protonmail.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch."
  type       = "CNAME"
  ttl        = 3600
}
resource "cloudflare_record" "mail_dkim_2" {
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail2._domainkey"
  value      = "protonmail2.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch."
  type       = "CNAME"
  ttl        = 3600
}
resource "cloudflare_record" "mail_dkim_3" {
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail3._domainkey"
  value      = "protonmail3.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch."
  type       = "CNAME"
  ttl        = 3600
}
resource "cloudflare_record" "mail_dmarc" {
  zone_id    = var.cloudflare_zone_id
  name       = "_dmarc"
  value      = "v=DMARC1; p=quarantine"
  type       = "TXT"
  ttl        = 3600
}

# Website records (old domain)
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
  name       = "www"
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  ttl        = 3600
  depends_on = [digitalocean_app.site_app]
}