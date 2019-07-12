SHELL := /bin/bash
VAR_DIR = "variables"
TERRAFORM_APPLY = "terraform apply -auto-approve -var-file="
TERRAFORM_DESTROY = "terraform destroy -auto-approve -var-file="

terraform-init:
	@terraform init

app-setup:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/app_setup.tfvars

mongodb:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/mongodb.tfvars

.PHONY = terraform-init app_setup mongodb




