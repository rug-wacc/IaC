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
    auth_url = var.openstack_url

    user_domain_name = var.openstack_domainname
    user_domain_id = var.openstack_domainid

    region = var.openstack_region
    user_name = var.openstack_username
    password = var.openstack_password
    
    tenant_id = var.openstack_projectid
}