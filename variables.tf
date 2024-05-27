# REQUIRED VARIABLES

variable "stage" {
  description = "The stage of development (e.g., test, dev, staging, prod)."
  type        = string

  validation {
    condition     = can(regex("^(test|dev|staging|prod)$", var.stage))
    error_message = "Stage must be one of the following: test, dev, staging, prod."
  }
}

variable "purpose" {
  description = "A short description about the purpose of the created resource."
  type        = string
  default     = null

  validation {
    condition     = can(regex("^([a-zA-Z0-9-_]*)$", var.purpose))
    error_message = "Only the characters [a-zA-Z0-9-_] are allowed."
  }
}

variable "owner" {
  description = "The owner of the deployed infrastructure."
  type        = string
  default     = null

  validation {
    condition     = length(var.owner) >= 3
    error_message = "The owner name must be at least three characters long."
  }
}

# CUSTOM VARIABLES

variable "domain_name" {
  description = "The name of the domain to attach the certificate."
  type        = string
  default     = null

  validation {
    condition     = length(var.domain_name) >= 3
    error_message = "You must define a domain name with at least three characters that exists on the account."
  }
}

variable "validate_cert" {
  description = "Indicate whether to validate the certificate."
  type        = bool
  default     = true
}

variable "zone_name" {
  description = "The name of the Route 53 hosted zone."
  type        = string
  default     = "jordibru.cloud"
}
