/**
 * # CrashOverride AWS Role
 *
 * This module can be used to create CrashOverride role
 * for its AWS integration.
 *
 * ## Example
 *
 * ```terraform
 * module "crashoverride_role" {
 *   source = "github.com/crashappsec/terraform-modules//aws/role?ref=main"
 *   tags = {
 *     environment = "prod"
 *   }
 * }
 * ```
 *
 * See below for all variable options.
 */

locals {
  external_id = try(random_uuid.external_id[0].result, var.external_id)
}

resource "random_uuid" "external_id" {
  count = var.external_id == null ? 1 : 0
}

data "aws_iam_policy_document" "trust_relationship" {
  statement {
    sid     = "AllowCrashOverrideToAssumeRole"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [var.crashoverride_aws_account_id]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [local.external_id]
    }
  }
}

# AWS doesnt have a notion of vendored managed roles
# so the best approximation we can do is dynamically pull the policy json
data "http" "crashoverride_policy" {
  url = "https://dl.crashoverride.run/aws/role/policy.json"
  lifecycle {
    postcondition {
      condition     = self.status_code == 200
      error_message = "Invalid status code"
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  source_policy_documents = concat(
    [data.http.crashoverride_policy.response_body],
    var.extra_policy_documents
  )
}

resource "aws_iam_role" "this" {
  name               = var.name
  description        = var.description
  assume_role_policy = data.aws_iam_policy_document.trust_relationship.json
  tags               = var.tags
}

resource "aws_iam_role_policy" "this" {
  role   = aws_iam_role.this.id
  name   = "${title(var.name)}Policy"
  policy = data.aws_iam_policy_document.inline_policy.json
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each   = toset(var.extra_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}
