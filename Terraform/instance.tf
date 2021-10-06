# The actual Virtual Machine instance running Flatcar
resource "openstack_compute_instance_v2" "flatcar" {
    name = "Flatcar VM"
    image_id = openstack_images_image_v2.flatcar.id
    flavor_name = "m1.small"
    security_groups = ["default", openstack_networking_secgroup_v2.basic.name]
    
    user_data = data.ct_config.flatcar.rendered

    network {
        name = "internal_vlan16"
    }
}