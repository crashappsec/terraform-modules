output "id" {
  value       = aws_iam_role.this.id
  description = "Name of the role."
}

output "name" {
  value       = aws_iam_role.this.name
  description = "Name of the role."
}

output "arn" {
  value       = aws_iam_role.this.arn
  description = "Amazon Resource Name (ARN) specifying the role."
}

output "tags_all" {
  value       = aws_iam_role.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "unique_id" {
  value       = aws_iam_role.this.unique_id
  description = "Stable and unique string identifying the role."
}

output "create_date" {
  value       = aws_iam_role.this.create_date
  description = "Creation date of the IAM role."
}

output "external_id" {
  value       = local.external_id
  description = "External ID used in role trust relationship."
}
