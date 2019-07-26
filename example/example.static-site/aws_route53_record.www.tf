resource "aws_route53_record" "emulator" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "static.example.com"
  type    = "A"

  # this zone id is a hard set, it the zone of s3 website zone OBVIOUSLY
  # https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region
  alias {
    name                   = module.static.s3_website_domain
    zone_id                = module.static.s3_hosted_zone_id
    evaluate_target_health = true
  }

}
