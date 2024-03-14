
resource "aws_key_pair" "ssh_key" {
key_name = "ssh_keypair"
public_key = file(var.public_key)
}

resource "aws_instance" "ec2" {
  ami = var.ami
  subnet_id = aws_subnet.subnet.id
  instance_type = var.instance_type
  key_name = aws_key_pair.ssh_key.key_name
 vpc_security_group_ids =[aws_security_group.sg.id] 
  tags = {
    Name = "vm"
    key= "dev"
  }

connection {
  type = "ssh"
  user = var.login_user
  private_key = file(var.private_key)
  host = self.public_ip
}

provisioner "file" {
    source = var.content_source
    destination = var.content_destination
  
}


provisioner "remote-exec" {
  inline = [ 
  "sudo yum update -y",
  "sudo yum install httpd -y",
  "sudo mv /home/ec2-user/index.html /var/www/html/index.html",
  "sudo systemctl enable httpd.service",
  "sudo systemctl start httpd.service"
   ]
}
}