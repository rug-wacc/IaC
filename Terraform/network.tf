# Networking configuration:
## Allocate a Floating IP from the "vlan16" pool
## Define a security group with basic ingress rules for SSH/HTTP(S)
## Associate the floating IP with the instance

resource "openstack_networking_floatingip_v2" "float_ip" {
    pool = "vlan16"
}

resource "openstack_compute_floatingip_associate_v2" "flatcar" {
    floating_ip = openstack_networking_floatingip_v2.float_ip.address
    instance_id = openstack_compute_instance_v2.flatcar.id
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