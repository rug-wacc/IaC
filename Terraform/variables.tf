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

variable "openstack_projectname" {
    type = string
    description = "OpenStack Project Name"
    sensitive = true
}

variable "imagename" {
    type = string
    description = "Image name of the Docker Image"
}