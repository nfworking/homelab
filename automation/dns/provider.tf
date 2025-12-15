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
        key_name      = "tsig-key."
        key_algorithm = "hmac-sha256"
        key_secret    = var.tsig_key
    }
}

variable "tsig_key" {
    description = "DNS TSIG key secret"
    type        = string
    sensitive   = true
}

# Example: Query DNS records
