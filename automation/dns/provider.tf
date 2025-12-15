terraform {
    required_providers {
        dns = {
            source  = "hashicorp/dns"
            version = "3.1.0"
        }
    }
}

provider "dns" {
    update {
        server        = "172.20.0.254"
        key_name      = "dns_key_secret"
        key_algorithm = "hmac-sha256"
        key_secret    = var.dns_key_secret
    }
}

variable "dns_key_secret" {
    description = "DNS TSIG key secret"
    type        = string
    sensitive   = true
}

# Example: Query DNS records
