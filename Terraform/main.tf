module "circleci-aws-oidc" {
  source             = "./modules/prod-circleci-oidc-role"
  circleci_org_id    = var.circleci_org_id
  role_name          = var.circleci_role_name
  inline_policy_name = var.circleci_inline_policy_name

  cross_account_role_arns = ["arn:aws:iam::${var.staging_account_id}:role/${var.cross_account_role_name}"]
}

module "cross-account-deploy" {
  source = "./modules/staging-cross-account-role"
  providers = {
    aws = aws.target_account
  }

  role_name          = var.cross_account_role_name
  inline_policy_name = var.cross_account_inline_policy_name
  trusted_role_arn   = "arn:aws:iam::${var.production_account_id}:role/drive-circleci-oidc-role"
  policy_json        = file("${path.root}/inline-policy.json")
}