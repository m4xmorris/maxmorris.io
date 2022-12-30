# Website records
resource "cloudflare_record" "root_record" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  depends_on = [digitalocean_app.site_app]
}
resource "cloudflare_record" "www_record" {
  zone_id    = var.cloudflare_zone_id
  name       = "www.${var.domain}"
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  depends_on = [digitalocean_app.site_app]
}

# Mail service records (Only applied if var.environment is set to "Production")
resource "cloudflare_record" "mail_verify" {
  count = var.environment == "Production" ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "protonmail-verification=87a1d2b07ad3698186abeb79feeceb9f19833a81"
  type       = "TXT"
}
resource "cloudflare_record" "mail_mx_1" {
  count = var.environment == "Production" ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "mail.protonmail.ch"
  type       = "MX"
  priority   = "10"
}
resource "cloudflare_record" "mail_mx_2" {
  count = var.environment == "Production" ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "mailsec.protonmail.ch"
  type       = "MX"
  priority   = "20"
}
resource "cloudflare_record" "mail_spf" {
  count = var.environment == "Production" ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "v=spf1 include:_spf.protonmail.ch mx ~all"
  type       = "TXT"
}
resource "cloudflare_record" "mail_dkim_1" {
  count = var.environment == "Production" ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail._domainkey.${var.domain}"
  value      = "protonmail.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch."
  type       = "CNAME"
}
resource "cloudflare_record" "mail_dkim_2" {
  count = var.environment == "Production" ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail2._domainkey.${var.domain}"
  value      = "protonmail2.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch."
  type       = "CNAME"
}
resource "cloudflare_record" "mail_dkim_3" {
  count = var.environment == "Production" ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail3._domainkey.${var.domain}"
  value      = "protonmail3.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch."
  type       = "CNAME"
}
resource "cloudflare_record" "mail_dmarc" {
  count = var.environment == "Production" ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = "_dmarc.${var.domain}"
  value      = "v=DMARC1; p=quarantine"
  type       = "TXT"
}