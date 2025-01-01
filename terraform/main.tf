module "protonmail" {
  source              = "m4xmorris/protonmail/cloudflare"
  version             = "1.1.2"
  cloudflare_zone_id  = var.cloudflare_zone_id
  domain              = "maxmorris.io"
  verification_record = "protonmail-verification=87a1d2b07ad3698186abeb79feeceb9f19833a81"
  dkim_1              = "protonmail.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch"
  dkim_2              = "protonmail2.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch"
  dkim_3              = "protonmail3.domainkey.dbjm65arcatqxgwv5qlkmggadpqlpbr6lbnpz6y64qtpfm474d3fq.domains.proton.ch"
}