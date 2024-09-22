
##Configure variables
variable "aws_profile" {
  description = "AWS profile"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "deployment_name" {
  description = "Deployment name, used to prefix resources"
  type        = string
}

variable "common_tags" {
  type        = map(string)
  description = "Map of common tags for all taggable AWS resources."
  default     = {}
}

variable "create_ec2_ssh_keypair" {
  type        = bool
  description = "Boolean to create EC2 SSH key pair. This is separate from the `bastion_keypair` input variable."
  default     = false
}

variable "total_count" {
  description = "Total number of key pair"
  type        = number
}
