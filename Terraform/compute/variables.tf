variable "vpc_id" {
    type = string
    description = "vpc id"
}

variable "cidr" {
    type = string
    description = "vpc subnet mask"
}

variable "pub_subnet_cidr_1" {
    type = string
    description = "public subnet cidr 1"
}

variable "priv_subnet_cidr_1" {
    type = string
    description = "private subnet cidr 1"
}