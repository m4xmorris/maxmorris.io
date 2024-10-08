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

module "static_site" {
  source           = "m4xmorris/static-site/digitalocean"
  version          = "1.3.2"
  site_name        = "maxmorrisio"
  external_project = "59dfbb4b-504a-4004-bdb4-c4452e35aa8d"
  description      = "Personal Website"
  environment      = "Production"
  region           = "lon"
  domain           = "maxmorris.io"
  source_repo      = "m4xmorris/maxmorris.io"
  source_branches = {
    "main" = "/"
  }
  env_variables = {
    "HUGO_VERSION" = "0.110.0"
  }
  source_dir         = "hugo"
  output_dir         = "public"
  build_command      = "hugo -d public"
  manage_dns         = true
  cloudflare_zone_id = var.cloudflare_zone_id
  alert_policy = [
    "DOMAIN_LIVE",
    "DEPLOYMENT_LIVE",
    "DOMAIN_FAILED",
    "DEPLOYMENT_FAILED"
  ]
}
