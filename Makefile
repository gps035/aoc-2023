run:
	@${MAKE} debug > /dev/null
	@terraform output

debug:
	terraform init && terraform apply -lock=false -auto-approve