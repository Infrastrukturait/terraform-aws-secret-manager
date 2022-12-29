variable "region" {
  type        = string
  description = "AWS Region"
}

variable "name" {
  type        = string
  description = "Name of secret to store."
}

variable "value" {
  type        = string
  description = "Secret value to store."
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
