resource "aws_db_instance" "postgres" {
  identifier         = "fastapi-postgres-db"
  engine             = "postgres"
  engine_version     = "15.3"
  instance_class     = "db.t3.micro"
  username           = "postgres"
  password           = var.db_password
  allocated_storage  = 20
  skip_final_snapshot = true
  publicly_accessible = true

  vpc_security_group_ids = [aws_security_group.db_sg.id]
}

resource "aws_security_group" "db_sg" {
  name        = "rds_sg"
  description = "Allow Postgres access"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # lock this down later!
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
