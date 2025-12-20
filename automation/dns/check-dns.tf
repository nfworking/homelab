resource "dns_a_record_set" "admin" {
    zone      = "lurking.site."
    name      = "admin"
    addresses = ["172.20.0.254"]
    ttl       = 300
}

resource "dns_a_record_set" "adminhome" {
    zone      = "lurking.site."
    name      = "admin.home"
    addresses = ["172.20.0.254"]
    ttl       = 300
}

resource "dns_a_record_set" "proxy" {
    zone      = "lurking.site."
    name      = "proxy.home"
    addresses = ["172.20.0.254"]
    ttl       = 300
}

resource "dns_a_record_set" "automation" {
    zone      = "lurking.site."
    name      = "automate.home"
    addresses = ["172.20.0.254"]
    ttl       = 300
}

resource "dns_a_record_set" "mail" {
    zone      = "lurking.site."
    name      = "mail.home"
    addresses = ["172.20.0.254"]
    ttl       = 300
}

resource "dns_a_record_set" "pro" {
    zone      = "lurking.site."
    name      = "pro.home"
    addresses = ["172.20.0.254"]
    ttl       = 300
}

resource "dns_a_record_set" "pro_api" {
    zone      = "lurking.site."
    name      = "api.pro.home"
    addresses = ["172.20.0.254"]
    ttl       = 300
}