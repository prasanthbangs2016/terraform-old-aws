dev:
	git pull
	terraform init 
	terraform apply -auto-approve
prod:
	git pull
	rm -rf .terraform
	terrafile
	terraform init -backend-config env/prod-backend.tfvars
	terraform apply -auto-approve -var-file env/prod.tfvars
dev-destroy:
	rm -rf .terraform
	terrafile
	terraform init -backend-config env/dev-backend.tfvars
	terraform destroy -auto-approve -var-file env/dev.tfvars
prod-destroy:
	rm -rf .terraform
	terrafile
	terraform init -backend-config env/prod-backend.tfvars
	terraform destroy -auto-approve -var-file env/prod.tfvars