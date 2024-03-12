### Terraform Modules Example 


# Set Environment variable values

``` cmd
export AWS_ACCESS_KEY_ID="*****************I"
export AWS_SECRET_ACCESS_KEY="********************************"

```

#Intialize 

```hcl
terraform init
```

#Validate & plan


```hcl
terraform validate   # validates syntax

terraform plan  #provides layout of resource information before creation 
``` 

# Execute

```hcl
terraform apply
```