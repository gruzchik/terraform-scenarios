resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow SSH inbound traffic"

  vpc_id      = aws_vpc.default-engx-env.id

  ingress {
    description = "ssh connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "EC2-sg"
  }
}

resource "aws_security_group" "efs_sg" {
  name        = "efs_sg"
  description = "Allow EFS inbound traffic"

  vpc_id      = aws_vpc.default-engx-env.id

  ingress {
    description     = "efs connection"
    from_port       = 2409
    to_port         = 2409
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ec2_sg.id}"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "EFS-sg"
  }
}

output "instance_ip_addr" {
  value       = aws_security_group.ec2_sg.id
  description = "ssh SG"
}
