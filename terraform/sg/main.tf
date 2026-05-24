resource "aws_security_group" "allow_ssh_http" {
  name   = var.name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port=80
    to_port=80
    protocol="tcp"

    cidr_blocks=[var.my_ip]
  }

  ingress {
    description="Flask App"

    from_port=5000
    to_port=5000
    protocol="tcp"

    cidr_blocks=["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks=[var.my_ip]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks=[var.my_ip]
  }
}
