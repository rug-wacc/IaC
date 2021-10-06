# Outputs to show when done provisioning
output "flatcar_ip" {
    value = openstack_networking_floatingip_v2.float_ip.address
    description = "IP Address to reach the VM on"
}