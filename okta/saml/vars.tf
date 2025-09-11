terraform {
  required_providers {
    okta = {
      source = "okta/okta"
    }
  }
}

variable "label" {
  type        = string
  default     = "Crash Override"
  description = "Primary label for the Okta SAML application."
}

variable "connection" {
  type        = string
  description = "CrashOverride SAML connection name."
}

variable "tenant" {
  type        = string
  description = "CrashOverride auth0 tenant name."
  default     = "dev-5o7i-a15"
}

variable "callback_url" {
  type        = string
  description = "CrashOverride auth0 callback URL."
  default     = "https://kn0ck-kn0ck.crashoverride.run/login/callback"
}
