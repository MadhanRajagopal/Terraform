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

![GitHub Image](/images/output.png)
