
# Key Pair
resource "aws_key_pair" "deployer_key_new" {
  key_name   = "${var.env}-Infra-app-key-ec2"
  public_key = file("terra-key-ec2.pub")
  tags = {
    Environment = var.env
  }
}

# Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}

# Security Group
resource "aws_security_group" "my_security_group" {
  name        = "automate-sg-${var.env}"
  description = "${var.env}-Infra-app-security-group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.env}-Infra-app-security-group"
    Environment = var.env
  }

  # Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH OPEN TO THE WORLD"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP OPEN TO THE WORLD"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS OPEN TO THE WORLD"
  }

  

  # Outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ALLOW ALL OUTBOUND TRAFFIC"
  }
}


# EC2 Instance
resource "aws_instance" "my_instance" {
  count         = length(var.instance_types)# Number of instances to create


  depends_on = [ aws_security_group.my_security_group, aws_key_pair.deployer_key_new ]

  ami             = var.ec2_ami_id # Ubuntu 20.04 in us-east-2
instance_type   = var.instance_types[count.index]
  key_name        = aws_key_pair.deployer_key_new.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  root_block_device {
    volume_size           = var.env == "prd" ? 20 : 10
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "${title(var.env)}-Environment"
    Environment = var.env
  }
   

}

