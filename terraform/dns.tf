resource "cloudflare_record" "verification" {
  zone_id = var.cloudflare_zone_id
  name    = "maxmorris.io"
  content = "protonmail-verification=87a1d2b07ad3698186abeb79feeceb9f19833a81"
  type    = "TXT"
}

resource "cloudflare_record" "mx" {
  for_each = {
    "10" = "mail.protonmail.ch"
    "20" = "mailsec.protonmail.ch"
  }
  zone_id  = var.cloudflare_zone_id
  name     = "maxmorris.io"
  value    = each.value
  type     = "MX"
  priority = each.key
}

resource "cloudflare_record" "dkim" {
  for_each = {
    "protonmail._domainkey"  = "protonmail.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch"
    "protonmail2._domainkey" = "protonmail2.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch"
    "protonmail3._domainkey" = "protonmail3.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch"
  }
  zone_id = var.cloudflare_zone_id
  name    = "${each.key}.maxmorris.io"
  value   = each.value
  type    = "CNAME"
}

resource "cloudflare_record" "spf" {
  zone_id = var.cloudflare_zone_id
  name    = "maxmorris.io"
  content = "v=spf1 include:_spf.protonmail.ch mx ~all"
  type    = "TXT"
}

resource "cloudflare_record" "dmarc" {
  zone_id = var.cloudflare_zone_id
  name    = "_dmarc.maxmorris.io"
  value   = "v=DMARC1; p=quarantine"
  type    = "TXT"
}