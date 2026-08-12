# Variables block

#  variable "circleci_project_id" {                                                                                        
#     type        = string                                                                                                  
#     description = "The UUID formatted Project ID from CircleCI"                                                           
#   }                                                                                                                       

variable "circleci_org_id" {
  type        = string
  description = "The UUID formatted Organization ID from CircleCI"
  default     = "e4b509d4-c8fe-4807-a0d5-e940b101cae5"
}

variable "thumbprints" {
  type        = list(string)
  description = "The OIDC thumbprints used for the OIDC provider (default)"
  default     = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
}

variable "production_account_id" {
  type        = string
  description = "AWS account ID where the CircleCI OIDC role lives"
  default     = "945921432116"
}

variable "staging_account_id" {
  type        = string
  description = "AWS account ID the CircleCI OIDC role is allowed to assume into"
  default     = "118522174118"
}


variable "circleci_role_name" {
  type        = string
  description = "Name of the IAM role CircleCI assumes via OIDC in the production account"
  default     = "drive-circleci-oidc-role"
}

variable "cross_account_role_name" {
  type        = string
  description = "Name of the IAM role created in the staging account for cross-account deploys"
  default     = "drive-circleci-cross-account-role"
}


variable "circleci_inline_policy_name" {
  type        = string
  description = "Name of the inline policy attached to the CircleCI OIDC role"
  default     = "drive-circleci-oidc-policy"
}

variable "cross_account_inline_policy_name" {
  type        = string
  description = "Name of the inline policy attached to the cross-account deploy role"
  default     = "drive-circleci-cross-account-policy"
}