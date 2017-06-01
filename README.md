Packer template to create machines for DOJ

Prepare
```
export TOKEN=sdfidsfji
docker run --rm \
           -it \
           -v ${HOME}:/home/$(whoami) \
           -e USER_ID=$(id -u) \
           -e GROUP_ID=$(id -g) \
           -e USER_NAME=$(whoami) \
           -e DIGITALOCEAN_ACCESS_TOKEN=${TOKEN} \
           andrey9kin/digitalocean-toolbox:latest bash
```

Inside docker container
```
git clone https://github.com/Andrey9kin/demo-machine-using-packer.git
cd demo-machine-using-packer
git checkout doj
packer build machine.json
echo ${DIGITALOCEAN_ACCESS_TOKEN} > secrets/DO_TOKEN
ssh-keygen -f ./secrets/id_rsa -t rsa -N ''
. setup_terraform.sh
# get image id from packer output
TF_VAR_droplet_image=<image id> terraform apply
digitalocean-cli droplet list 2>&1 | grep doj2017 | sort | awk '{print $3}'
```
