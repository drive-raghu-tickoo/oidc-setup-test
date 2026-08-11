module "circleci-aws-oidc" {
  source          = "./modules/"
  circleci_org_id = "e4b509d4-c8fe-4807-a0d5-e940b101cae5"
  role_name       = "drive-circleci-oidc-role"
  inline_policy_name = "drive-circleci-oidc-policy"
}