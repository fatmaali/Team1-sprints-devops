Terraform Task

versions of tools used in this project
Terraform v1.0.7
AWS
Jenkins

To Create terraform Project

cd terraform_files

terraform init

terraform plan -var-file="values.tfvars"

for dev workspace:

terraform workspace select dev; terraform apply --var-file dev.tfvars


for prod workspace:

terraform workspace select prod; terraform apply --var-file prod.tfvars