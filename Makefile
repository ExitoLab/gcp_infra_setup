# Makefile for Terraform

# Variables
TF_VARS = -var-file=$(TF_DIR)/terraform.tfvars

# Targets

init:
	@cd $(TF_DIR) && terraform init && terraform fmt

plan:
	@cd $(TF_DIR) && terraform plan $(TF_VARS)

apply:
	@cd $(TF_DIR) && terraform apply $(TF_VARS)

destroy:
	@cd $(TF_DIR) && terraform destroy $(TF_VARS)

init-folder:
	@cd $(FOLDER) && terraform init

plan-folder:
	@cd $(FOLDER) && terraform plan

apply-folder:
	@cd $(FOLDER) && terraform apply

destroy-folder:
	@cd $(FOLDER) && terraform destroy

# Help target
help:
	@echo "Usage: make <target> [FOLDER=<folder_name>]"
	@echo ""
	@echo "Targets:"
	@echo "  init            - Initialize Terraform configuration"
	@echo "  plan            - Generate and show an execution plan"
	@echo "  apply           - Apply changes to infrastructure"
	@echo "  destroy         - Destroy Terraform-managed infrastructure"
	@echo "  init-folder     - Initialize Terraform configuration in the specified folder"
	@echo "  plan-folder     - Generate and show an execution plan for the specified folder"
	@echo "  apply-folder    - Apply changes to infrastructure in the specified folder"
	@echo "  destroy-folder  - Destroy Terraform-managed infrastructure in the specified folder"
	@echo "  help            - Show this help message"

.PHONY: init plan apply destroy init-folder plan-folder apply-folder destroy-folder help
