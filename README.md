Packer template to create machines for DOJ

packer build machine.json
. setup_terraform.sh

# get image id from packer output
TF_VAR_droplet_image=<image id> terraform apply

digitalocean-cli droplet list 2>&1 | grep doj2017 | sort | awk '{print $3}'
