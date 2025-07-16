# CrashOverride AWS Role

This module can be used to create CrashOverride role
for its AWS integration.

## Example

```terraform
module "crashoverride_role" {
  source = "github.com/crashappsec/terraform-modules//aws/role?ref=main"
  tags = {
    environment = "prod"
  }
}
```

See below for all variable options.

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)          | n/a     |
| <a name="provider_http"></a> [http](#provider_http)       | n/a     |
| <a name="provider_random"></a> [random](#provider_random) | n/a     |

## Resources

| Name                                                                                                                                             | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                        | resource    |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy)                          | resource    |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)    | resource    |
| [random_uuid.external_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid)                                   | resource    |
| [aws_iam_policy_document.inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)      | data source |
| [aws_iam_policy_document.trust_relationship](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [http_http.crashoverride_policy](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)                           | data source |

## Inputs

| Name                                                                                                                  | Description                                                                                                                                                                         | Type           | Default                                                                                                   | Required |
| --------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_crashoverride_aws_account_id"></a> [crashoverride_aws_account_id](#input_crashoverride_aws_account_id) | CrashOverride AWS account ID which will be allowed to assume role.                                                                                                                  | `string`       | `"224111541501"`                                                                                          |    no    |
| <a name="input_description"></a> [description](#input_description)                                                    | Description to add to the role.                                                                                                                                                     | `string`       | `"Role which can be assumed by CrashOverride AWS account for its AWS integration. See crashoverride.com"` |    no    |
| <a name="input_external_id"></a> [external_id](#input_external_id)                                                    | External ID for CrashOverride to use to allow to assume created role.<br/>If `null` random UUID is generated.                                                                       | `string`       | `null`                                                                                                    |    no    |
| <a name="input_extra_policy_arns"></a> [extra_policy_arns](#input_extra_policy_arns)                                  | Additional policy ARNs to attach to the role.<br/>ARN can be for either AWS-managed policy or custom policy.<br/>For example `arn:aws:iam::aws:policy/ReadOnlyAccess` can be added. | `list(string)` | `[]`                                                                                                      |    no    |
| <a name="input_extra_policy_documents"></a> [extra_policy_documents](#input_extra_policy_documents)                   | Additional JSON policy documents to add to inline policy to be attached to the role.                                                                                                | `list(string)` | `[]`                                                                                                      |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                         | Name for the role to be created.                                                                                                                                                    | `string`       | `"CrashOverrideIntegrationRole"`                                                                          |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                         | Additional tags to add to the role.                                                                                                                                                 | `map(string)`  | `{}`                                                                                                      |    no    |

## Outputs

| Name                                                                 | Description                                                                                                           |
| -------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| <a name="output_arn"></a> [arn](#output_arn)                         | Amazon Resource Name (ARN) specifying the role.                                                                       |
| <a name="output_create_date"></a> [create_date](#output_create_date) | Creation date of the IAM role.                                                                                        |
| <a name="output_external_id"></a> [external_id](#output_external_id) | External ID used in role trust relationship.                                                                          |
| <a name="output_id"></a> [id](#output_id)                            | Name of the role.                                                                                                     |
| <a name="output_name"></a> [name](#output_name)                      | Name of the role.                                                                                                     |
| <a name="output_tags_all"></a> [tags_all](#output_tags_all)          | A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block. |
| <a name="output_unique_id"></a> [unique_id](#output_unique_id)       | Stable and unique string identifying the role.                                                                        |
