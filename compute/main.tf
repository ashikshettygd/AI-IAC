provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2_20251022_191845" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg_20251022_191845.id]
}

resource "aws_security_group" "ec2_sg_20251022_191845" {
  name        = "ec2_sg_20251022_191845"
  description = "Security group for EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_id" {
  value = aws_instance.ec2_20251022_191845.id
}

output "instance_public_ip" {
  value = aws_instance.ec2_20251022_191845.public_ip
}