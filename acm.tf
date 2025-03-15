resource "aws_acm_certificate" "ncinnovativehub" {
  domain_name       = "ncinnovativehub.com.com"
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_acm_certificate" "cert" {
  domain_name       = "testing.ncinnovativehub.com"
  validation_method = "EMAIL"

  validation_option {
    domain_name       = "testing.example.com"
    validation_domain = "ncinnovativehub.com"
  }
}
resource "aws_route53_record" "example" {
  for_each = {
    for dvo in aws_acm_certificate.ncinnovative.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.ncinnovativehub.zone_id
}