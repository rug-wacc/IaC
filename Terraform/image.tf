# Imports the Flatcar image from your machine into the OpenStack environment
resource "openstack_images_image_v2" "flatcar" {
    name = "Flatcar"
    container_format = "bare"
    disk_format = "qcow2"

    local_file_path = "flatcar_production_openstack_image.img"
}