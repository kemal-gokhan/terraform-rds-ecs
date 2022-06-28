resource "aws_db_instance" "terraformdb" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "terraform"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = ["${aws_security_group.tf-devops.id}"]
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible = true

}

resource "aws_db_subnet_group" "default" {
  name       = "terra-db-subnet"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]

  tags = {
    Name = "My DB subnet group"
  }
}