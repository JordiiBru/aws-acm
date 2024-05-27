# More on: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attribute-reference
output "certificate_arn" {
  description = "The ARN of the validated ACM certificate."
  value       = aws_acm_certificate_validation.validations.certificate_arn
}

output "domain_validation_options" {
  description = "The domain validation options for the ACM certificate."
  value       = aws_acm_certificate.domain_certificate[*].domain_validation_options
}