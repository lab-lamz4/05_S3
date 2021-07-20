module "iam_group_s3_admin" {
  source      = "../../modules/iam_group"
  name        = "epam-leodorov-s3"
  environment = "learning"

  # Using IAM group
  enable_iam_group = true
  iam_group_name   = "s3-admin-users"
  iam_group_path   = "/"

  # Using IAM group policy
  # enable_iam_group_policy = true
  # iam_group_policy_name   = "s3-admin-policy"
  # iam_group_policy        = file("additional_files/admin-policy.json")

  # Using IAM group policy attachment
  enable_iam_group_policy_attachment      = true
  iam_group_policy_attachment_policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"

  # Using IAM group membership
  enable_iam_group_membership = true
  iam_group_membership_name   = ""
  iam_group_membership_users  = [module.iam_user_admin.iam_user_name]

  depends_on = [
    module.iam_user_admin
  ]
}

module "iam_group_s3_user" {
  source      = "../../modules/iam_group"
  name        = "epam-leodorov-s3"
  environment = "learning"

  # Using IAM group
  enable_iam_group = true
  iam_group_name   = "s3-common-users"
  iam_group_path   = "/"


  # Using IAM group policy attachment
  # enable_iam_group_policy_attachment      = true
  # iam_group_policy_attachment_policy_arn  = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"

  # Using IAM group membership
  enable_iam_group_membership = true
  iam_group_membership_name   = ""
  iam_group_membership_users  = [module.iam_user_common.iam_user_name]

  depends_on = [
    module.iam_user_common
  ]
}