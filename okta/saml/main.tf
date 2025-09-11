/**
 * # CrashOverride Okta SAML Configuration
 *
 * This module allows to create okta SAML application to
 * allow to login to CrashOverride via Okta SAML SSO.
 *
 * ## Prerequisites
 *
 * Before configuring this module, get this information
 * from CrashOverride:
 *
 * - SSO connection name
 *
 * ## Example
 *
 * ```terraform
 * module "dust" {
 *   source     = "github.com/crashappsec/terraform-modules//okta/saml?ref=main"
 *   connection = "test" # get this from CrashOverride
 * }
 * ```
 *
 * See below for all outputs.
 */

# https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_saml
resource "okta_app_saml" "this" {
  label = var.label

  # https://auth0.com/docs/authenticate/identity-providers/enterprise-identity-providers/saml
  sso_url     = "${var.callback_url}?connection=${var.connection}"
  recipient   = "${var.callback_url}?connection=${var.connection}"
  destination = "${var.callback_url}?connection=${var.connection}"
  audience    = "urn:auth0:${var.tenant}:${var.connection}"

  user_name_template       = "$${source.email}"
  subject_name_id_template = "$${user.email}"
  subject_name_id_format   = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  authn_context_class_ref  = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"

  response_signed     = true
  assertion_signed    = true
  signature_algorithm = "RSA_SHA256"
  digest_algorithm    = "SHA256"

  attribute_statements {
    name   = "given_name"
    type   = "EXPRESSION"
    values = ["user.firstName"]
  }
  attribute_statements {
    name   = "family_name"
    type   = "EXPRESSION"
    values = ["user.lastName"]
  }
  attribute_statements {
    name   = "name"
    type   = "EXPRESSION"
    values = ["user.displayName"]
  }
  attribute_statements {
    name   = "email"
    type   = "EXPRESSION"
    values = ["user.email"]
  }
}
