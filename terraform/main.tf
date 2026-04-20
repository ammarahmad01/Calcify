provider "aws" {
  region = "ap-south-1"
}

# Generate SSH key pair
resource "aws_key_pair" "calcify_key" {
  key_name   = "calcify-key"
  public_key = file("C:/Users/Ammar/.ssh/calcify-key.pub")
}

# EC2 Instance
resource "aws_instance" "calcify_server" {
  ami                         = "ami-0f58b397bc5c1f2e8"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.calcify_key.key_name
  subnet_id                   = aws_subnet.calcify_subnet.id
  vpc_security_group_ids      = [aws_security_group.calcify_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "calcify-server"
  }
}