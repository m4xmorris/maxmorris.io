module "do-apps-tf" {
	source = "../do-apps-tf"
	site_name = "maxmorrisio-staging"
	description = "Personal Website"
	environment = "Development"
	domain = "staging.maxmorris.io"
	source_repo = "maxmorrisio/personal-site"
	source_branch = "staging"
	source_dir = "hugo"
	output_dir = "public"
	build_command = "hugo -d public"
	cloudflare_zone_id = "${var.cloudflare_zone_id}"
	cloudflare_token = "${var.cloudflare_token}"
	do_token = "${var.do_token}"
}