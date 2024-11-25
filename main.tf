provider "aws"{
  region = "eu-central-1"
  profile = "default"
  }

terraform {
  backend "s3" {
   bucket = "christina-git-codebuild-terraform" 
    key = "terraform.tfstate"
    region = "eu-central-1"
    profile = "default"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"

    name = "christina-vpc"
    cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a"]
  private_subnets = ["10.0.1.0/24",]
  public_subnets  = ["10.0.101.0/24"]

  public_subnet_tags = {
    Name = "Christina-Public-subnet"
  }
  private_subnet_tags = {
    Name = "Christina-Private-subnet"
  }
  tags = {
    Owner = "Christina"
  }


}


