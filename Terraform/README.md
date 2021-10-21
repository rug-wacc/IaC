# Terraform provisioning

This folder contains the files necessary to deploy a virtual machine running Flatcar on OpenStack with a basic network configuration.

- Run `init.sh` to initialise your local copy of the repository.
- Update the secrets file to include your credentials
- Run `terraform init`
- Run `terraform plan -var-file=<cloud>.tfvars.json`; or rename the desired cloud configuration to `<cloud>.auto.tfvars.json` to
    automatically include it in any terraform command
- Run `terraform apply`