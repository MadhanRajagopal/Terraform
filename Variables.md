# Variables
   It allow you to make your configurations more dynamic, reusable, and flexible.

# Types

+ Input Variable
+ Output Varibale

# Input Variable

- `variable` is used to declare an input variable named `example_var`.
- `description` provides a human-readable description of the variable, which is optional.
- `type` specifies the data type of the variable (e.g., `string`, `number`, `list`, `map`, etc.).
- `default` provides a default value for the variable, which is optional.


```hcl

variable "example_var" {
  description = "An example input variable"
  type        = string
  default     = "default_value"
}
```

# Output Variable
It allow you to expose values from your module or configuration

-`output` is used to declare an output variable named `example_output`.
- `description` provides a description of the output variable.which is optional.
- `value` specifies the value that you want to expose as an output variable. This value can be a resource attribute, a computed value, or any other expression.


```hcl
output "example_output" {
  description = "An example output variable"
  value       = resource.example_resource.example.id
}
```
# Example 

```hcl
#Variable
variable "instance_type" {
  description = "provide a instance_type for vm creation"
  type        = string
  default     = "t2.micro"
}

variable "instance_ami_image" {
  description = "provide a AMI image for vm creation "
  type        = string
}
----------------------


#Resource 
resource "aws_instance" "vm" {
  ami = var.instance_ami_image
  instance_type =  var.instance_type    #assign value to attribute 
}
----------------------
#Output
output "example_output" {
  description = "expose instance public ip address"
  value       = aws_instance.vm.public_ip   # expose public ip value after instnace resourec creation
}
```

