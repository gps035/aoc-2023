run:
	@${MAKE} debug > /dev/null
	@terraform output

debug:
	terraform init && terraform apply -auto-approve