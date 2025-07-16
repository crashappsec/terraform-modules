terraform {
  required_providers {
    aws = {}
  }
}

variable "name" {
  type        = string
  default     = "CrashOverrideIntegrationRole"
  description = <<EOF
Name for the role to be created.
EOF
}

variable "description" {
  type        = string
  default     = "Role which can be assumed by CrashOverride AWS account for its AWS integration. See crashoverride.com"
  description = <<EOF
Description to add to the role.
EOF
}

variable "external_id" {
  type        = string
  default     = null
  nullable    = true
  description = <<EOF
External ID for CrashOverride to use to allow to assume created role.
If `null` random UUID is generated.
EOF
}

variable "crashoverride_aws_account_id" {
  type        = string
  default     = "224111541501"
  description = <<EOF
CrashOverride AWS account ID which will be allowed to assume role.
EOF
}

variable "extra_policy_documents" {
  type        = list(string)
  default     = []
  description = <<EOF
Additional JSON policy documents to add to inline policy to be attached to the role.
EOF
}

variable "extra_policy_arns" {
  type        = list(string)
  default     = []
  description = <<EOF
Additional policy ARNs to attach to the role.
ARN can be for either AWS-managed policy or custom policy.
For example `arn:aws:iam::aws:policy/ReadOnlyAccess` can be added.
EOF
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = <<EOF
Additional tags to add to the role.
EOF
}
