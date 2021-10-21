# OpenStack auth settings
variable "openstack_url" {
    type = string
    description = "OpenStack Auth URL"
}

variable "openstack_domainid" {
    type = string
    description = "OpenStack Domain ID"
    default = null
}

variable "openstack_domainname" {
    type = string
    description = "OpenStack Domain Name"
    default = null
}

variable "openstack_username" {
    type = string
    description = "OpenStack username"
    sensitive = true
}

variable "openstack_password" {
    type = string
    description = "OpenStack password"
    sensitive = true
}

variable "openstack_projectid" {
    type = string
    description = "OpenStack Project ID"
    sensitive = true
}

variable "openstack_region" {
    type = string
    description = "OpenStack Region"
    default = ""
}

# Other environment settings
variable "imagename" {
    type = string
    description = "Image name of the Docker Image"
}

variable "flavor_name" {
    type = string
    description = "Flavor to use for the instance"
}

variable "public_network" {
    type = string
    description = "Name of the public network to connect to"
}