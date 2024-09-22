aws_profile            = "hppa-tf-admin"
aws_region             = "ap-southeast-1"
deployment_name        = "key_pair_gen"
create_ec2_ssh_keypair = true
total_count            = 3
common_tags = {
  App         = "production-prereqs"
  Environment = "production"
  Owner       = "snow"
}