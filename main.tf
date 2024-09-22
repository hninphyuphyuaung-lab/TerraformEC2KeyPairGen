locals {
  deployment_id = lower("${var.deployment_name}-${random_string.suffix.result}")
  total_count   = var.create_ec2_ssh_keypair ? var.total_count : 0 # total count to be created
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

resource "tls_private_key" "ssh" {
  count     = local.total_count # total numbers of generated key
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "aws_key_pair" "this" {
  count = local.total_count 

  key_name   = "${local.deployment_id}-key-${count.index + 1}" # Unique key name for each instance
  public_key = tls_private_key.ssh[count.index].public_key_openssh

  tags = merge(
    { Name = "${local.deployment_id}-key-${count.index + 1}" }, # Tag each key uniquely
    var.common_tags
  )
}

# store the private key in local
resource "local_file" "private_key" {
  count    = local.total_count
  content  = tls_private_key.ssh[count.index].private_key_openssh
  filename = "${path.root}/generated/${local.deployment_id}-${count.index + 1}-key.pem" 

  provisioner "local-exec" {
    command = "chmod 400 ${path.root}/generated/${local.deployment_id}-${count.index + 1}-key.pem" #give read permission for each file
  }
}


