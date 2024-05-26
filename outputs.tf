# More on: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attribute-reference
output "certificate_arn" {
  value = aws_acm_certificate_validation.validations.certificate_arn
}

output "domain_validation_options" {
  value = aws_acm_certificate.domain_certificate[*].domain_validation_options
}