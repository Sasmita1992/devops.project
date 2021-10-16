module "ec2_instance_Bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  # version = "~> 3.0"

  name = "Bastion"

  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "devops"
  monitoring             = true
  vpc_security_group_ids = [module.Bastion_service_sg.security_group_id, module.Public_Instance_sg.security_group_id]
  subnet_id               = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


module "ec2_instance_Jenkins" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"
  # version = "~> 3.0"

  name = "Jenkins1"

  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "devops" 
  monitoring             = true
  vpc_security_group_ids = [module.Private_Instance_sg.security_group_id]
  subnet_id               = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_instance_app" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"
  # version = "~> 3.0"

  name = "app"

  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "devops" 
  monitoring             = true
  vpc_security_group_ids = [module.Public_Instance_sg.security_group_id]
  subnet_id               = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
