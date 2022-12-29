variable "name" {
  type        = string
  description = "Name of secret to store."
}

variable "values" {
  type        = map(string)
  default     = {}
  description = "Secrets maps to store."
}

variable "value" {
  type        = string
  default     = ""
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

variable "policy" {
  type        = string
  default     = ""
  description = "Resource IAM policy which controls access to the secret."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags."
}
