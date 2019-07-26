data "aws_route53_zone" "selected" {
  name         = "example.com."
  private_zone = false
}
