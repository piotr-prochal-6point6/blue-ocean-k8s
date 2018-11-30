#DNS configuration
resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.base_domain.zone_id}"
  name    = "${var.env_name != "prod" ? "ci.${var.env_name}.${data.aws_route53_zone.base_domain.name}" : "ci.${data.aws_route53_zone.base_domain.name}"}"
  type    = "A"

  alias {
    name                   = "${aws_elb.external.dns_name}"
    zone_id                = "${aws_elb.external.zone_id}"
    evaluate_target_health = true
  }
}
