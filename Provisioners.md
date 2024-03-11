#Provisioners
Terraform provisioners are built-in components that allow you to execute scripts on a local or remote machine as part of the resource creation or destruction process

1. **file Provisioner:**
   The `file provisioner` is used to copy files or directories from the local machine to a remote machine.this is useful for deploying configuration files, scripts to a provisioned instance.

   
   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-xxx"
     instance_type = "t2.micro"
   }

   provisioner "file" {
     source      = "local/path/to/localfile.txt"
     destination = "/path/on/remote/instance/file.txt"
     connection {
       type     = "ssh"
       user     = "ec2-user"
       private_key = file("~/.ssh/id_rsa")
     }
   }
   ```

2. **remote-exec Provisioner:**

   The `remote-exec` provisioner is used to run scripts or commands on a remote machine over SSH. It's often used to configure or install software on provisioned instances.

   Example:

   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-xxx"
     instance_type = "t2.micro"
   }

   provisioner "remote-exec" {
     inline = [
       "sudo yum update -y",
       "sudo yum install -y httpd",
       "sudo  
       "sudo systemctl start httpd",
     ]

     connection {
       type        = "ssh"
       user        = "ec2-user"
       private_key = file("~/.ssh/id_rsa")
       host        = aws_instance.example.public_ip  # provisioner are declared  outside of  resource creation so use `aws_instance.example` naming standard 
     }
   }
   ```

    ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-xxx"
     instance_type = "t2.micro"
   

   provisioner "remote-exec" {
     inline = [
       "sudo yum update -y",
       "sudo yum install -y httpd",
       "sudo  
       "sudo systemctl start httpd",
     ]

     connection {
       type        = "ssh"
       user        = "ec2-user"
       private_key = file("~/.ssh/id_rsa")
       host        = self.public_ip    # self used when provisioner are present inside resource creation  
     }
   }
    }  # resource block end
   ```

3. **local-exec Provisioner:**

   The `local-exec` provisioner is used to run scripts or commands locally on the machine where Terraform is executed

    ```hcl
     resource "aws_instance" "example" {
      ami= "ami-xxx"
      instance_type = "t2.micro"
      provisioner "local-exec" {
        command = "echo Created instance ${self.id}"
      }
      provisioner "local-exec" {
        when    = "destroy"   # execute during resource destroy phase 
        command = "echo Instance ${self.id} is being destroyed"
     }
   }
    ```
  
