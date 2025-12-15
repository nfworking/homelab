resource "dns_a_record_set" "admin" {
    zone      = "home.lurking.site"
    name      = "admin"
    addresses = ["172.20.0.254"]
    ttl       = 300
}