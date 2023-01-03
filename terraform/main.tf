module "static_site" {
	source = "github.com/m4xmorris/terraform-digitalocean-static-site.git?ref=v2.0.1"
	site_name = "maxmorrisio"
	description = "Personal Website"
	environment = "Production"
	region = "lon"
	domain = "maxmorris.io"
	source_repo = "m4xmorris/maxmorris.io"
	source_branch = "main"
	preview_source_branch = "dev"
	source_dir = "hugo"
	output_dir = "public"
	build_command = "hugo -d public"
	do_token = "${var.do_token}"
	manage_dns = true
	cloudflare_zone_id = "${var.cloudflare_zone_id}"
	cloudflare_token = "${var.cloudflare_token}"
}
