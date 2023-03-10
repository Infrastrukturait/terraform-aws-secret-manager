variable "region" {
  type        = string
  description = "AWS Region"
}

variable "name" {
  type        = string
  description = "Name of secret to store."
}

variable "values" {
  type        = map(string)
  default     = {}
  description = "Secrets maps to store."
}

variable "description" {
  type        = string
  default     = ""
  description = "Description  of secret."
}

variable "kms_key_id" {
  type        = string
  default     = ""
  description = "KMS Key ID to encrypt the secret. KMS key arn or alias can be used."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags."
}
