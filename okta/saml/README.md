# CrashOverride Okta SAML Configuration

This module allows to create okta SAML application to
allow to login to CrashOverride via Okta SAML SSO.

## Prerequisites

Before configuring this module, get this information
from CrashOverride:

- SSO connection name

## Example

```terraform
module "crashoverride_saml" {
  source     = "github.com/crashappsec/terraform-modules//okta/saml?ref=main"
  connection = "test" # get this from CrashOverride
}
```

See below for all outputs.

## Requirements

No requirements.

## Providers

| Name                                                | Version |
| --------------------------------------------------- | ------- |
| <a name="provider_okta"></a> [okta](#provider_okta) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                   | Type     |
| ------------------------------------------------------------------------------------------------------ | -------- |
| [okta_app_saml.this](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_saml) | resource |

## Inputs

| Name                                                                  | Description                                  | Type     | Default                                                  | Required |
| --------------------------------------------------------------------- | -------------------------------------------- | -------- | -------------------------------------------------------- | :------: |
| <a name="input_callback_url"></a> [callback_url](#input_callback_url) | CrashOverride auth0 callback URL.            | `string` | `"https://kn0ck-kn0ck.crashoverride.run/login/callback"` |    no    |
| <a name="input_connection"></a> [connection](#input_connection)       | CrashOverride SAML connection name.          | `string` | n/a                                                      |   yes    |
| <a name="input_label"></a> [label](#input_label)                      | Primary label for the Okta SAML application. | `string` | `"Crash Override"`                                       |    no    |
| <a name="input_tenant"></a> [tenant](#input_tenant)                   | CrashOverride auth0 tenant name.             | `string` | `"dev-5o7i-a15"`                                         |    no    |

## Outputs

No outputs.
