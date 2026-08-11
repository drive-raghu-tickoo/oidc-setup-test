locals {
  source_account_id       = "639568032168"
  target_account_id       = "982081079834"
  cross_account_role_name = "drive-circleci-cross-account-role"
}

module "circleci-aws-oidc" {
  source          = "./modules/"
  circleci_org_id = "e4b509d4-c8fe-4807-a0d5-e940b101cae5"
  role_name       = "drive-circleci-oidc-role"
  inline_policy_name = "drive-circleci-oidc-policy"

  cross_account_role_arns = ["arn:aws:iam::${local.target_account_id}:role/${local.cross_account_role_name}"]
}

module "cross-account-deploy" {
  source = "./modules/cross-account-role"
  providers = {
    aws = aws.target_account
  }

  role_name          = local.cross_account_role_name
  inline_policy_name = "drive-circleci-cross-account-policy"
  trusted_role_arn   = "arn:aws:iam::${local.source_account_id}:role/drive-circleci-oidc-role"
  policy_json        = file("${path.root}/inline-policy.json")
}