
resource "aws_instance" "expense"{
  count = length(var.instances)
  ami     = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids  = [aws_security_group.allow_tls.id]
  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}-${var.instances[count.index]}" # expense-dev-mysql
    }
  )
}

resource "aws_security_group" "allow_tls" {
  name              = "${var.project}-${var.environment}" # expense-dev/expense-prod
  description       = "allow tls inbound trafic and all outbound traffic"

 ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
 }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}" 
  }
}