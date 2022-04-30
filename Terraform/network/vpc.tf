resource "aws_vpc" "sprints_tf_vpc" {
    cidr_block = var.cidr
    enable_dns_support = "false"
}