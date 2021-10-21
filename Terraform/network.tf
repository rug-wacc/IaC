# Networking configuration:
## Create a new internal network to associate machines with
### Create an associated subnet
## Create a router between the internal and external networks
## Allocate a Floating IP from the pool
## Define a security group with basic ingress rules for SSH/HTTP(S)
## Associate the floating IP with the instance

# Create internal network for machines
resource "openstack_networking_network_v2" "internal" {
    name = "internal"
    external = false
    shared = false
}

# Create subnet in this internal network
resource "openstack_networking_subnet_v2" "internal" {
    name = "internal"
    network_id = openstack_networking_network_v2.internal.id
    cidr = "10.10.0.0/16"
    ip_version = 4
    dns_nameservers = [ "1.1.1.1", "9.9.9.9" ]
}

# Find the public network (as data source; we assume it already exists)
data "openstack_networking_network_v2" "public" {
    name = var.public_network
}

# Create a "router" to bridge between private and public networks
resource "openstack_networking_router_v2" "router" {
    name = "internal_bridge"

    # "Outgoing" network
    external_network_id = data.openstack_networking_network_v2.public.id
}

# Associate internal network with the router
resource "openstack_networking_router_interface_v2" "internal" {
    router_id = openstack_networking_router_v2.router.id
    subnet_id = openstack_networking_subnet_v2.internal.id
}

# Allocate the floating IP from the public pool
resource "openstack_networking_floatingip_v2" "float_ip" {
    pool = var.public_network
}

resource "openstack_compute_floatingip_associate_v2" "flatcar" {
    floating_ip = openstack_networking_floatingip_v2.float_ip.address
    instance_id = openstack_compute_instance_v2.flatcar.id

    # We explicitly let the floating IP association depend on the existence
    # of the router between internal and external networks; otherwise we can't
    # make the association. A floating IP association can only be made between
    # connected networks.
    depends_on = [
      openstack_networking_router_interface_v2.internal
    ]
}

### Security group
resource "openstack_networking_secgroup_v2" "basic" {
    name = "Basic"
    description = "Basic security rules for SSH/HTTP(S)"
}

resource "openstack_networking_secgroup_rule_v2" "basic_ssh" {
    direction = "ingress"
    ethertype = "IPv4"
    protocol = "tcp"
    port_range_min = 22
    port_range_max = 22
    remote_ip_prefix = "0.0.0.0/0"
    security_group_id = openstack_networking_secgroup_v2.basic.id
}

resource "openstack_networking_secgroup_rule_v2" "basic_http" {
    direction = "ingress"
    ethertype = "IPv4"
    protocol = "tcp"
    port_range_min = 80
    port_range_max = 80
    remote_ip_prefix = "0.0.0.0/0"
    security_group_id = openstack_networking_secgroup_v2.basic.id
}

resource "openstack_networking_secgroup_rule_v2" "basic_https" {
    direction = "ingress"
    ethertype = "IPv4"
    protocol = "tcp"
    port_range_min = 443
    port_range_max = 443
    remote_ip_prefix = "0.0.0.0/0"
    security_group_id = openstack_networking_secgroup_v2.basic.id
}