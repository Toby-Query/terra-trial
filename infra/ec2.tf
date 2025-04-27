resource "aws_instance" "fastapi_ec2" {
  ami           = "ami-0e188abe6701c3453" # Amazon Linux 2
  instance_type = "t3.micro"
  key_name      = "ec2-key"

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # user_data = <<-EOF
  #             #!/bin/bash
  #             yum update -y
  #             yum install git python3 -y
  #             pip3 install fastapi uvicorn
  #             cd /home/ec2-user
  #             git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
  #             cd YOUR_REPO
  #             nohup uvicorn main:app --host 0.0.0.0 --port 80 &
  #             EOF

  tags = {
    Name = "FastAPI Server"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow HTTP traffic"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this to your IP for better security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
