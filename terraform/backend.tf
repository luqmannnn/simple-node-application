terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "luqman-tf-docker-create-ecr.tfstate" #Change the value of this to yourname-tf-workspace-act.tfstate for  example
    region = "us-east-1"
  }
}