resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
   tags = {
    name ="vpc" 
  }

}


resource "aws_subnet" "subnet" {
vpc_id     = aws_vpc.vpc.id
cidr_block = "10.0.0.0/24"
availability_zone = "ap-south-1a"
map_public_ip_on_launch = true    # allows to provide public ip 
 tags = {
    name ="subnet" 
  }
  
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name ="igw" 
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   tags = {
    name ="rt" 
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}


resource "aws_security_group" "sg" {
  name        = "sg_group"
  vpc_id      = aws_vpc.vpc.id

ingress {
  description = "webserver"
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol = "tcp"
}

ingress {
  description = "ssh"
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol = "tcp"
}

egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
}

 tags = {
    name ="sg" 
  }
}
