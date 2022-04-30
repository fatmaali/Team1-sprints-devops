resource "aws_subnet" "pub_1" {
  vpc_id     = aws_vpc.sprints_tf_vpc.id
  cidr_block = var.pub_subnet_cidr_1
  map_public_ip_on_launch = "true"

  tags = {
    type = "public"
  }
}

resource "aws_subnet" "priv_1" {
  vpc_id     = aws_vpc.sprints_tf_vpc.id
  cidr_block = var.priv_subnet_cidr_1

  tags = {
    type = "private"
  }
}