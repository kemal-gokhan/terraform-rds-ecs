module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-devops"
  cidr = "10.1.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnets  = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false
  enable_dns_hostnames = true
  enable_dns_support   = true  

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}