resource "digitalocean_app" "site_app" {
  spec {
    name   = "${var.site_name}-app"
    region = "lon"
    domain {
      name = var.domain
      type = "PRIMARY"
    }
    domain {
      name = var.domain_old
      type = "ALIAS"
    }

    alert { rule = "DEPLOYMENT_FAILED" }
    alert { rule = "DEPLOYMENT_LIVE" }
    alert { rule = "DOMAIN_FAILED" }
    alert { rule = "DOMAIN_LIVE" }

    static_site {
      name          = var.site_name
      source_dir    = var.source_dir
      output_dir    = var.output_dir
      build_command = var.build_command

      github {
        repo           = var.source_repo
        branch         = var.source_branch
        deploy_on_push = true
      }
    }
  }
}
