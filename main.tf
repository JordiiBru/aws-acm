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

# record validation
resource "aws_route53_record" "cert_validations" {
  for_each = var.validate_cert ? {
    for dvo in aws_acm_certificate.domain_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  } : {}

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "validations" {
  count                   = var.validate_cert ? 1 : 0
  certificate_arn         = aws_acm_certificate.domain_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validations : record.fqdn]

  provider        = aws.us-east-1-acm
}