resource "aws_route53_record" "expense_private_ip" {
  count = length(var.instances)
  #  count = 3
  zone_id = var.zone_id
  name    = var.instances[count.index] == "frontend" && var.instances[count.index] == "prod" ? var.domain_name : "${var.instances[count.index]}-${var.environment}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [var.instances[count.index] == "frontend" && var.instances[count.index] == "prod" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip] # list type
  allow_overwrite = true
}


