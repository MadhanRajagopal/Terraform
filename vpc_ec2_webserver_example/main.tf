module "ec2_instance" {
  source = "./modules/ec2-instance"
  login_user = "ec2-user"
  public_key="~/.ssh/id_rsa.pub"
  private_key = "~/.ssh/id_rsa"
  ami = "ami-0ba259e664698cbfc"
  instance_type = "t2.micro"
  content_source = "content/index.html"
  content_destination = "/home/ec2-user/index.html"
}










