# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "my_ec2" {
#   ami           = "ami-0hsjdglFGYB358b87c7116"   # Amazon Linux 2 (us-east-1)
#   instance_type = "t3.micro"

#   tags = {
#     Name = "Terraform-EC2"
#   }
# }

# variables 
provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

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

module "ec2_instance" {
  source        = "./ec2-module"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  name          = "my-module-ec2"
  
}