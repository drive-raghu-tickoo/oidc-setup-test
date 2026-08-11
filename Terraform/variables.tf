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