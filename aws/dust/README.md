# CrashOverride Dust Extension

This module can be used to query CrashOverride dust extension ARN
to be as a lambda layer.

## Example

```terraform
module "dust" {
  source = "github.com/crashappsec/terraform-modules//aws/dust?ref=main"
}
resource "aws_lambda_function" "example" {
  # dont forget to `chalk insert function.zip`
  # before using it here
  filename      = "function.zip"
  function_name = "example"
  layers        = [module.dust.arn]
  ...
}
```

See below for all outputs.

## Providers

| Name                                                | Version |
| --------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)    | n/a     |
| <a name="provider_http"></a> [http](#provider_http) | n/a     |

## Resources

| Name                                                                                                        | Type        |
| ----------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [http_http.arn](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)       | data source |

## Inputs

| Name                                                                                 | Description                                             | Type     | Default                               | Required |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------- | -------- | ------------------------------------- | :------: |
| <a name="input_extension_version"></a> [extension_version](#input_extension_version) | Version override. Otherwise defaults to latest version. | `string` | `null`                                |    no    |
| <a name="input_url_prefix"></a> [url_prefix](#input_url_prefix)                      | URL prefix where to query to dust extension ARN         | `string` | `"https://dl.crashoverride.run/dust"` |    no    |

## Outputs

| Name                                         | Description                                                         |
| -------------------------------------------- | ------------------------------------------------------------------- |
| <a name="output_arn"></a> [arn](#output_arn) | Latest ARN of the dust extension layer for the AWS provider region. |
