resource "dns_a_record_set" "lurking.site" {
    zone      = "home.lurking.site"
    name      = "admin"
    addresses = ["172.20.0.254"]
    ttl       = 300
}