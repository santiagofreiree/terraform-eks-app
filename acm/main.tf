locals {
  full_domain = "${var.subdomain}.${var.domain_name}"
}

resource "aws_route53_zone" "demo" {
  name = local.full_domain

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_acm_certificate" "demo" {
  domain_name       = local.full_domain
  validation_method = "DNS"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.demo.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = aws_route53_zone.demo.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "demo" {
  certificate_arn         = aws_acm_certificate.demo.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
