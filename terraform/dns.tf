resource "cloudflare_record" "verification" {
  zone_id = var.cloudflare_zone_id
  name    = "maxmorris.io"
  content = "protonmail-verification=5993e65ff674db7b6745100cd97e06698dcc283a"
  type    = "TXT"
}

resource "cloudflare_record" "mx" {
  for_each = {
    "10" = "mail.protonmail.ch"
    "20" = "mailsec.protonmail.ch"
  }
  zone_id  = var.cloudflare_zone_id
  name     = "maxmorris.io"
  content  = each.value
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
  content = each.value
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
  content = "v=DMARC1; p=quarantine"
  type    = "TXT"
}
