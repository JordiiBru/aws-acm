# aws-acm

Terraform module to create an ACM (AWS Certificate Manager) certificate with Route 53 resources for DNS validation.

## Required Variables

| Name      | Description                                         | Type   | Validation                                     | Default |
|-----------|-----------------------------------------------------|--------|------------------------------------------------|---------|
| `stage`   | The stage of development (e.g., test, dev, staging, prod). | string | Must be one of `test`, `dev`, `staging`, `prod` | N/A     |
| `purpose` | A short description about the purpose of the created resource. | string | Must match the regex `^[a-zA-Z0-9-_]*$`        | N/A     |
| `owner`   | The owner of the deployed infrastructure.           | string | Must have more than three characters           | N/A     |

## Custom Variables

| Name            | Description                                      | Type   | Default              |
|-----------------|--------------------------------------------------|--------|----------------------|
| `domain_name`   | The name of the domain to attach the certificate.| string | `null`               |
| `validate_cert` | Indicate whether to validate the certificate.    | bool   | `true`               |
| `zone_name`     | The name of the Route 53 hosted zone.            | string | `jordibru.cloud`     |

## Outputs

| Name                       | Description                                      |
|----------------------------|--------------------------------------------------|
| `certificate_arn`          | The ARN of the validated ACM certificate.        |
| `domain_validation_options`| The domain validation options for the ACM certificate. |

## Usage

```hcl
module "acm" {
  source = "../"

  # Required variables
  stage   = "dev"
  owner   = "wanda"
  purpose = "tfg"

  # Custom variables
  domain_name = "dev-portfolio.jordibru.cloud"
}
```