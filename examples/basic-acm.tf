module "acm" {
  source = "../"

  # Required variables
  stage   = "test"
  owner   = "wanda"
  purpose = "tfg"

  # Custom variables
  subdomain = "portfolio" # This will create record portfolio.jordibru.cloud
}