# Variables block
variable "circleci_org_id" {
  type        = string
  description = "The UUID formatted Organization ID from CircleCI"
}

variable "thumbprints" {
  type        = list(string)
  description = "The OIDC thumbprints used for the OIDC provider (default)"
  default     = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
}

variable "role_name" {
  type        = string
  description = "The name of the IAM role CircleCI assumes via OIDC"
  default     = "circleci-oidc"
}

variable "inline_policy_name" {
  type        = string
  description = "The name of the inline policy attached to the CircleCI IAM role"
  default     = "circleci-s3-access"
}

variable "cross_account_role_arns" {
  type        = list(string)
  description = "ARNs of IAM roles in other AWS accounts that this role is allowed to assume"
  default     = []
}