output "aws_key_pair_id" {
  value       = aws_key_pair.this[*].id
  description = "The key pair name."
}

output "aws_key_pair_arn" {
  value       = aws_key_pair.this[*].arn
  description = "The key pair ARN."
}

output "aws_key_pair_key_name" {
  value       = aws_key_pair.this[*].key_name
  description = "The key pair name."
}

output "aws_key_pair_key_pair_id" {
  value       = aws_key_pair.this[*].key_pair_id
  description = "The key pair ID."
}

output "aws_key_pair_key_type" {
  value       = aws_key_pair.this[*].key_type
  description = "The type of key pair."
}
