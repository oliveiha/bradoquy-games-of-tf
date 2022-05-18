#lockando a versão do TF
terraform {
  required_version = "0.15.4"
  #Lockando a versão do aws provider
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = "us-east-1" # Brasil -> us-east-1
  profile = "terraform"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#private-bucket-w-tags
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "bradoquy01-${random_integer.rand.result}"
  acl    = "private"

  tags = {
    Name        = "Teste bradoquy"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Tiago Oliveira"
    CreatedAt   = "2021-06-15"
  }
}

#Random ID
# como os nomes de buckets devem ser unicos por isso usaremos o recurso "random_integer" 
resource "random_integer" "rand" {
  min = 10000
  max = 99999
}