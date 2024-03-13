# Terraform Modules Example 


## Set Environment variable values

``` cmd
export AWS_ACCESS_KEY_ID="<access_key>"
export AWS_SECRET_ACCESS_KEY="<secret_key>"

```

## Intialize 

```hcl
terraform init
```

## Validate & plan


```hcl
terraform validate   # validates syntax

terraform plan  #provides layout of resource information before creation 
``` 

## Execute

```hcl
terraform apply
```


## Destroy 

```hcl
terraform destroy
```
