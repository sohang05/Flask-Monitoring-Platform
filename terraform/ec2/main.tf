resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key=file("${path.module}/flask-kp.pub")
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type

  root_block_device {
    volume_size = 15        # size in GB
    volume_type = "gp3"     # gp3 volume type
    delete_on_termination = true
  }

  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.key_pair.key_name
  monitoring    = var.monitoring
  associate_public_ip_address = true
  vpc_security_group_ids = [var.security_group_id]

  user_data=file("${path.module}/scripts/setup.sh")

  tags = {
    Name = var.name
    Project="Flask-monitoring"
  }
}