resource "dns_a_record_set" "admin" {
    zone      = "lurking.site."
    name      = "admin"
    addresses = ["172.20.0.254"]
    ttl       = 300
}