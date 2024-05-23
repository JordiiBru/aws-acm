resource "aws_acm_certificate" "domain_certificate" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  provider        = aws.us-east-1-acm

  tags = {
    terraform = true
    stage     = var.stage
    owner     = var.owner
  }
}

resource "aws_acm_certificate_validation" "validations" {
  count                   = var.validate_cert ? 1 : 0
  certificate_arn         = aws_acm_certificate.domain_certificate.arn
  #validation_record_fqdns = [for record in aws_route53_record.cert_validations : record.fqdn]
  validation_record_fqdns = [for record in var.cert_record : record.fqdn]

  provider        = aws.us-east-1-acm
}