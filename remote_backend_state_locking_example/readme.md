# Remote Backend configuration and state locking

It allows to maintain the `terraform.tfstate` file in a centralized storage like S3 in order to avoid conflicts.

Using a locking mechanism in order to avoid concurrent modification

## Resource used to achieve

### s3

- create bucket with name `s3-terraform-bucket-demo`. You can also changes properties values in `backend.tf` file

### Dynamo DB

- Create a table with name `terraform-state-lock`.You can also changes properties values in `backend.tf` file
- Provide Partition key values as `LockID`

## Images
![output](https://github.com/MadhanRajagopal/Terraform/assets/138750648/0bac4ccf-585e-492d-9b74-1e36a40b21d5)
