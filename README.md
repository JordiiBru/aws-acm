# aws-acm

Terraform module to create an ACM (AWS Certificate Manager) certificate with Route 53 resources for DNS validation.

## Common Variables

| Name      | Description                                                    | Type   | Validation                                      | Default | Required |
|-----------|----------------------------------------------------------------|--------|-------------------------------------------------|---------|----------|
| `stage`   | The stage of development (e.g., test, dev, staging, prod).     | string | Must be one of `test`, `dev`, `staging`, `prod` |         | yes      |
| `purpose` | A short description about the purpose of the created resource. | string | Must match the regex `^[a-zA-Z0-9-_]*$`         |         | yes      |
| `owner`   | The owner of the deployed infrastructure.                      | string | Must have more than three characters            |         | yes      |

## Custom Variables

| Name        | Description                 | Type   | Validation                                                       | Default | Required |
|-------------|-----------------------------|--------|------------------------------------------------------------------|---------|----------|
| `subdomain` | The name of the subdomain.  | string | You must define a subdomain name with at least three characters. |         | yes      |

## Outputs

| Name                       | Description                                      |
|----------------------------|--------------------------------------------------|
| `certificate_arn`          | The ARN of the validated ACM certificate.        |

## Usage

```hcl
module "acm" {
  source = "git@github.com:JordiiBru/aws-acm.git?ref=[TAG]"

  # Common variables
  stage   = "test"
  owner   = "wanda"
  purpose = "tfg"

  # Custom variables
  subdomain = "portfolio" # This will create record portfolio.jordibru.cloud
}
```