variable "role_name" {
  type        = string
  description = "The name of the cross-account IAM role"
}

variable "inline_policy_name" {
  type        = string
  description = "The name of the inline policy attached to the cross-account role"
}

variable "trusted_role_arn" {
  type        = string
  description = "ARN of the IAM role (in the source account) allowed to assume this role"
}

variable "policy_json" {
  type        = string
  description = "JSON policy document granting this role its permissions"
}
