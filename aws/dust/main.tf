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

variable "url_prefix" {
  type        = string
  description = "URL prefix where to query to dust extension ARN"
  default     = "https://dl.crashoverride.run/dust"
}

output "arn" {
  value       = trimspace(data.http.arn.response_body)
  description = "Latest ARN of the dust extension layer for the AWS provider region."
}
