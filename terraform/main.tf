module "vpc" {
  source             = "./vpc"
  name               = "flask-vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "sg"{
  source = "./sg"
  name   = "flask-sg"
  vpc_id = module.vpc.vpc_id
  my_ip  = var.my_ip
}

module "ec2_instance" {
  source            = "./ec2"
  name              = "flask-app"
  ami               = var.ami
  region            = var.region
  instance_type     = var.instance_type
  key_name          = var.key_name
  monitoring        = true
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.sg.sg_id
}
