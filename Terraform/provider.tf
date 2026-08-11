provider "aws" {
  profile = "aws-raghu-personal"
  region  = "ap-southeast-2"
}

provider "aws" {
  alias   = "source_account"
  profile = "aws-raghu-personal"
  region  = "ap-southeast-2"
}

provider "aws" {
  alias   = "target_account"
  profile = "aws-deepa-credentials"
  region  = "ap-southeast-2"
}