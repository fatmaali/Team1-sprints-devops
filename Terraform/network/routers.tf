resource "aws_route_table" "public_1" {
    vpc_id = aws_vpc.sprints_tf_vpc.id
}

resource "aws_route" "public" {
    route_table_id = aws_route_table.public_1.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.pub_1.id
    route_table_id = aws_route_table.public_1.id
}



resource "aws_route_table" "private_1" {
    vpc_id = aws_vpc.sprints_tf_vpc.id
}

resource "aws_route_table_association" "private_1" {
    subnet_id = aws_subnet.priv_1.id
    route_table_id = aws_route_table.private_1.id
}