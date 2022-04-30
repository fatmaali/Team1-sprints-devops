resource "aws_security_group" "inbound_ssh_anywhere" {
  name        = "inbound_ssh_anywhere"
  description = "Allow ssh"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH from Anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "inbound_ssh_vpc_3000" {
  name        = "inbound_ssh_vpc_3000"
  description = "Allow ssh and port 3000 tcp from vpc cidr only"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.cidr]
  }

  ingress {
    description      = "TCP from 3000"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = [var.cidr]
  }

}
