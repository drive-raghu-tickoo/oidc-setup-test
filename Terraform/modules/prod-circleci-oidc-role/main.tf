locals {
  circleci_oidc_url = "oidc.circleci.com/org/${var.circleci_org_id}"
}

# Identity Provider
resource "aws_iam_openid_connect_provider" "circleci" {
  url = "https://${local.circleci_oidc_url}"

  client_id_list = [
    var.circleci_org_id,
  ]

  thumbprint_list = [for thumbprint in var.thumbprints : thumbprint]
}

# Role's trust policy
data "aws_iam_policy_document" "circleci_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.circleci.arn]
    }

    condition {
      test     = "StringLike"
      variable = "${local.circleci_oidc_url}:sub"
      values   = ["org/${var.circleci_org_id}/project/*/user/*"]
    }
  }
}

resource "aws_iam_role" "circleci" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.circleci_trust.json
}

resource "aws_iam_role_policy" "circleci_s3" {
  name   = var.inline_policy_name
  role   = aws_iam_role.circleci.id
  policy = file("${path.root}/inline-policy.json")
}

# sts:AssumeRole inline policy on the source role.

data "aws_iam_policy_document" "assume_cross_account" {
  count = length(var.cross_account_role_arns) > 0 ? 1 : 0

  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = var.cross_account_role_arns
  }
}

resource "aws_iam_role_policy" "circleci_assume_cross_account" {
  count  = length(var.cross_account_role_arns) > 0 ? 1 : 0
  name   = "${var.inline_policy_name}-assume-cross-account"
  role   = aws_iam_role.circleci.id
  policy = data.aws_iam_policy_document.assume_cross_account[0].json
}
