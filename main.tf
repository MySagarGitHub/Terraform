# provider "aws" {
#   region = "us-east-1"
# }


# variables 
provider "aws" {
  region = "us-east-1"
}

# data "aws_ami" "amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }
# resource "aws_instance" "my_ec2" {
#   ami           = data.aws_ami.amazon_linux.id   # Amazon Linux 2 (us-east-1)
#   instance_type = var.instance_type

#   tags = {
#     Name = "EC2-${terraform.workspace}"
#     environment = terraform.workspace
#   }
# }

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = var.bucket_name

#   tags = {
#     Name = "Mys3Bucket"
#   }
# }

# resource "aws_instance" "my_ec2" {
#   ami           = data.aws_ami.amazon_linux.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = "Terraform"
#   }
#   depends_on = [
#     aws_s3_bucket.my_bucket 
#   ]
# }

# module "ec2_instance" {
#   source        = "./ec2-module"
#   ami           = data.aws_ami.amazon_linux.id
#   instance_type = "t3.micro"
#   name          = "my-module-ec2"
  
# }
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}