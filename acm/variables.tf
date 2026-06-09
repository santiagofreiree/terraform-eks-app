variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Root domain name"
  type        = string
  default     = "sysmarketsa.com"
}

variable "subdomain" {
  description = "Subdomain for the demo"
  type        = string
  default     = "demoaws"
}
