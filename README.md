Packer template to create machines for DOJ

KEY=/Users/andrey9kin/Dropbox/doj-keys/id_rsa.pub packer build -only digitalocean machine.json
bash prepare-machines.sh /Users/andrey9kin/Dropbox/doj-keys/id_rsa.pub 50 doj-gbg 25210727
cp -f machines.txt /Users/andrey9kin/Dropbox/doj-keys/
