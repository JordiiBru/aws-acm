module "acm" {
  source = "../"

  # Required variables
  stage       = "test"
  owner       = "wanda"
  purpose     = "tfg"
  domain_name = "jordibru.cloud"

  # Required variables
  validate_cert = true
}