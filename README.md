# 05 S3

S3 bucket with a policy, enabled versioning and enabled logging to s3

Also, this playbook will create two IAM users who will be members in two groups that will be created too.

TODO: for user "s3-learning-common-user" need to create a custom IAM policy that would be attached to the group. It must contain policy s3:ListAllMyBuckets, it's required to show buckets in UI.

Before "terraform destroy" will be called, a couple of actions needs to be done.
Fist of all, s3 bucket cannot be destroyed if there have some data in the bucket, so this data must be deleted firstly.

Regarding this for "lamz4-test-s3-learning" bucket need to disable "Logging" property - it needs to avoid creating new logs in "lamz4-test-s3-learning-logs" bucket.

Then need to disable property "Bucket Versioning" in "lamz4-test-s3-learning" bucket.

When all data (with versions of files in buckets) will be deleted, "terraform destroy" may be called.


## Used resources

terraform modules from https://github.com/SebastianUA/terraform.git

Great thanks to Vitaliy Natarov!

## AWS CREDENTIALS

```
aws configure
```

## Terrfaorm

```
terraform init
terrafrom plan
terrafrom apply
terraform destroy
```