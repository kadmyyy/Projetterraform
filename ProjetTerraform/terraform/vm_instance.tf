resource "aws_security_group" "nginx_sg" {
  name        = "nginx-sg"
  description = "Allow HTTP and SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ubuntu_instance" {
  ami             = "ami-0ac80df6eff0e70b5"  # Replace with the latest Ubuntu AMI ID for your region
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.main_subnet.id
  security_groups = [aws_security_group.nginx_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF
}
