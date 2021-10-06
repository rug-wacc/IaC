# Defining required providers
terraform {
    required_providers {
        openstack = {
            source = "terraform-provider-openstack/openstack"
            version = "1.44.0"
        }

        ct = {
            source = "poseidon/ct"
            version = "0.9.0"
        }
    }
}

# Configuration for OpenStack provider
provider "openstack" {
    auth_url = "https://merlin.hpc.rug.nl:5000/v3/"
    user_domain_name = "Default"

    
    user_name = var.openstack_username
    password = var.openstack_password
    
    tenant_id = var.openstack_projectid
    tenant_name = var.openstack_projectname
}