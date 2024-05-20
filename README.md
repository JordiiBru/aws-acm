# aws-acm
Terraform module to create an ACM (AWS Certificate Manager) certificate with Route 53 resources for DNS validation.

## Required Variables

| Name          | Description                                     | Type   | Validation                                     | Default |
|---------------|-------------------------------------------------|--------|------------------------------------------------|---------|
| `stage`       | Stage of development                            | string | `test`, `dev`, `staging`, `prod`               | N/A     |
| `purpose`     | Short description about the created resource    | string | Must match the regex `^[a-zA-Z0-9-_]*$`        | N/A     |
| `owner`       | Owner of the deployed infrastructure            | string | Must have more than three characters           | N/A     |
| `domain_name` | Name of the domain                              | string | Must have more than three characters           | N/A     |

## Optional Variables

| Name            | Description             | Type   | Default |
|-----------------|-------------------------|--------|---------|
| `validate_cert` | Validate the certificate| bool   | `false` |

## Usage

```hcl
module "acm" {
  source = "../"

  # Required variables
  stage       = "test"
  owner       = "wanda"
  purpose     = "tfg"
  domain_name = "domain.com"

  # Optional variables
  validate_cert = true
}
```