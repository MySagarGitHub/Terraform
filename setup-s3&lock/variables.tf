

variable "bucket_name" {
  description = "sagar-S3-bucket"
  type        = string
}                               

variable "environment" {
  description = "The environment for tagging resources"
  type        = string
  default     = "dev"
}

variable "lock_table" {
  description = "The name of the DynamoDB table for Terraform state locking"
  type        = string
  default     = "terraform-locks"
}