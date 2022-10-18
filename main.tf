terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}




module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "test-server"

  ami                    = "ami-026b57f3c383c2eec"
  instance_type          = "t2.micro"
  key_name               = "nvmkey"
  monitoring             = true
#   vpc_security_group_ids = ["sg-12345678"]
#   subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}



resource "aws_key_pair" "nvm-key" {
  key_name = "nvmkey"
  public_key = file("~/.ssh/nvmkey.pub")
}