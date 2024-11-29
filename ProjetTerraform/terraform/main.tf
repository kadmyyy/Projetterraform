provider "aws" {
  region = "eu-north-1"  # Choisissez votre région AWS
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-north-1"
  map_public_ip_on_launch = true
}
