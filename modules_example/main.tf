module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-0ba259e664698cbfc"
  subnet_id_value = "subnet-0f7190c04eeff2271"
  instance_type_value = "t2.micro"
}