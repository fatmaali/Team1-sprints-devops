module "network" {
    source = "./network"
    cidr = var.vpc_cidr
    pub_subnet_cidr_1 = var.pub_subnet_cidr
    priv_subnet_cidr_1 = var.priv_subnet_cidr
}

module "compute" {
    source = "./compute"
    cidr = var.vpc_cidr
    pub_subnet_cidr_1 = var.pub_subnet_cidr
    priv_subnet_cidr_1 = var.priv_subnet_cidr
    vpc_id = module.network.vpc_id
}