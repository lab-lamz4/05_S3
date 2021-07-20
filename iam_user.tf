# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# iam users
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module "iam_user_admin" {
  source      = "../../modules/iam_user"
  name        = "epam-leodorov-s3"
  environment = "learning"

  # Using IAM user
  enable_iam_user        = true
  iam_user_name          = "s3-learning-admin"
  iam_user_path          = "/"
  iam_user_force_destroy = true

  # Using user SSH key
  enable_iam_user_ssh_key     = false

  # Using IAM user policy
  enable_iam_user_policy = false

  # Using IAM user policy attachment
  enable_iam_user_policy_attachment     = false

  # Using IAM user membership
  enable_iam_user_group_membership = false

  # Using IAM user login profile
  enable_iam_user_login_profile                  = false
  
  tags = tomap({
    "Environment"   = "learning",
    "stack" =  "s3"
    "Owner"     = "Andrei Leodorov",
    "Orchestration" = "Terraform"
  })
}

module "iam_user_common" {
  source      = "../../modules/iam_user"
  name        = "epam-leodorov-s3"
  environment = "learning"

  # Using IAM user
  enable_iam_user        = true
  iam_user_name          = "s3-learning-common-user"
  iam_user_path          = "/"
  iam_user_force_destroy = true

  # Using user SSH key
  enable_iam_user_ssh_key     = false

  # Using IAM user policy
  enable_iam_user_policy = false

  # Using IAM user policy attachment
  enable_iam_user_policy_attachment     = false

  # Using IAM user membership
  enable_iam_user_group_membership = false

  # Using IAM user login profile
  enable_iam_user_login_profile                  = false
  
  tags = tomap({
    "Environment"   = "learning",
    "stack" =  "s3"
    "Owner"     = "Andrei Leodorov",
    "Orchestration" = "Terraform"
  })
}