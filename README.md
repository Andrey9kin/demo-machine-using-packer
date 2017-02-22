Packer template to create machines for various demos

To create DigitalOcean image

```
TOKEN="api token" packer build -only digitalocean machine.json
```

To create VirtualBox image

```
packer build -only virtualbox  machine.json
```

To provision already existing machine

```
HOST=<ip> packer build -only null machine.json
```
