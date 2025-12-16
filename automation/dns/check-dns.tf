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