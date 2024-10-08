# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Input variable definitions

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "luqman-vpc-tf-module"
}

variable "ec2_name" {
  description = "Name of EC2"
  type        = string
  default     = "luqman-ec2-for-docker"
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Instance type of EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of EC2 key pair pem file"
  type        = string
  default     = "luqman-us-east-1-keypair"
}

variable "subnet_name" {
  description = "Name of subnet to deploy EC2 in"
  type        = string
  default     = "luqman-vpc-tf-module-public-us-east-1a"
}

variable "sg_name" {
  description = "Name of security group to create"
  type        = string
  default     = "luqman-test-module-create-sg"
}