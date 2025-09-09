/**
 * # CrashOverride Dust Extension
 *
 * This module can be used to query CrashOverride dust extension ARN
 * to be as a lambda layer.
 *
 * ## Example
 *
 * ```terraform
 * module "dust" {
 *   source = "github.com/crashappsec/terraform-modules//aws/dust?ref=main"
 * }
 * resource "aws_lambda_function" "example" {
 *   # dont forget to `chalk insert function.zip`
 *   # before using it here
 *   filename      = "function.zip"
 *   function_name = "example"
 *   layers        = [module.dust.arn]
 *   ...
 * }
 * ```
 *
 * See below for all outputs.
 */

terraform {
  required_providers {
    aws  = {}
    http = {}
  }
}

data "aws_region" "current" {}

data "http" "arn" {
  url = "${var.url_prefix}/${data.aws_region.current.name}/extension.arn"
  lifecycle {
    postcondition {
      condition     = self.status_code == 200
      error_message = "Invalid status code"
    }
  }
}

locals {
  latest_arn     = trimspace(data.http.arn.response_body)
  latest_parts   = split(":", local.latest_arn)
  i              = length(local.latest_parts) - 1
  layer_parts    = slice(local.latest_parts, 0, local.i)
  latest_version = local.latest_parts[local.i]
  version        = coalesce(var.extension_version, local.latest_version)
  version_parts  = concat(local.layer_parts, [local.version])
  version_arn    = join(":", local.version_parts)
}

variable "url_prefix" {
  type        = string
  description = "URL prefix where to query to dust extension ARN"
  default     = "https://dl.crashoverride.run/dust"
}

variable "extension_version" {
  type        = string
  nullable    = true
  default     = null
  description = "Version override. Otherwise defaults to latest version."
}

output "arn" {
  value       = local.version_arn
  description = "Latest ARN of the dust extension layer for the AWS provider region."
}
