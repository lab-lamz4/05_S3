module "s3_log_bucket" {
  source      = "../../modules/s3"
  name        = "TEST"
  environment = "dev"

  # AWS S3 bucket
  enable_s3_bucket = true
  s3_bucket_name   = "lamz4-test-s3-learning-logs"
  s3_bucket_acl    = "log-delivery-write"

  s3_bucket_lifecycle_rule = [
    {
      enabled = true

      id     = "log"
      prefix = "log/"
      tags   = tomap({ "rule" = "log", "autoclean" = "true" })

      expiration = {
        days = 90
      }

      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
        },
        {
          days          = 60
          storage_class = "GLACIER"
        }
      ]

      noncurrent_version_expiration = {
        days = 30
      }
    }
  ]

  tags = tomap({
    "Environment"   = "learning",
    "stack" =  "s3"
    "Owner"     = "Andrei Leodorov",
    "Orchestration" = "Terraform"
  })
}

module "s3_private_bucket" {
  source      = "../../modules/s3"
  name        = "epam-leodorov-s3"
  environment = "learning"

  # AWS S3 bucket
  enable_s3_bucket = true
  s3_bucket_name   = "lamz4-test-s3-learning"
  s3_bucket_acl    = "private"

  enable_s3_bucket_policy = true
  s3_bucket_policy_policy = templatefile("additional_files/common-policy.json", {
      common_user_arn = "${module.iam_user_common.iam_user_arn}",
      admin_user_arn  = "${module.iam_user_admin.iam_user_arn}"
      })

  s3_bucket_versioning = {
    enabled = true
  }

  s3_bucket_logging = {
    target_bucket = module.s3_log_bucket.s3_bucket_id
    target_prefix = "log/"
  }

  tags = tomap({
    "Environment"   = "learning",
    "stack" =  "s3"
    "Owner"     = "Andrei Leodorov",
    "Orchestration" = "Terraform"
  })

  depends_on = [
    module.iam_user_admin,
    module.iam_user_common,
    module.s3_log_bucket
  ]
}