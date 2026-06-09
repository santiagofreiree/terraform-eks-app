output "name_servers" {
  description = "Name servers for the subdomain zone. Add these as NS records in Namecheap for the subdomain."
  value       = aws_route53_zone.demo.name_servers
}

output "certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.demo.arn
}

output "zone_id" {
  description = "Route 53 hosted zone ID"
  value       = aws_route53_zone.demo.zone_id
}

output "full_domain" {
  description = "Full subdomain domain name"
  value       = local.full_domain
}
