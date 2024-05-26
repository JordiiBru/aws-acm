module "acm" {
  source = "../"

  # Required variables
  stage       = "test"
  owner       = "wanda"
  purpose     = "tfg"
  
  # Custom variables
  domain_name = "test.jordibru.cloud"
}