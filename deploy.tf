###############################################################################
#
# Get variables from command line or environment
#
###############################################################################


variable "do_token" {}

variable "do_region" {
    default = "ams3"
}
variable "ssh_fingerprint" {}

variable "ssh_private_key" {
    default = "./secrets/id_rsa"
}

variable "number_of_workers" {}

variable "size_of_workers" {
    default = "4GB"
}

variable "droplet_image" {}

###############################################################################
#
# Specify provider
#
###############################################################################


provider "digitalocean" {
  token = "${var.do_token}"
}

###############################################################################
#
# Hosts
#
###############################################################################

resource "digitalocean_droplet" "demo-machine" {
    count = "${var.number_of_workers}"
    image = "${var.droplet_image}"
    size = "${var.size_of_workers}"
    name = "${format("%02d-doj2017", count.index + 1)}"
    region = "${var.do_region}"
    ssh_keys = ["${split(",", var.ssh_fingerprint)}"]

    provisioner "remote-exec" {
        inline = [
            "sudo systemctl start shellinabox.service"
        ]
        connection {
            type = "ssh",
            user = "root",
            private_key = "${file(var.ssh_private_key)}"
        }
    }
}

