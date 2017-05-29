#!/usr/bin/env bash

KEY=$1
NUM=$2
PREFIX=$3
IMAGE=$4

# Example
# bash prepare-machines.sh /Users/andrey9kin/Dropbox/doj-keys/id_rsa.pub 2 doj-gbg 25208909

COUNTER=0
while [  ${COUNTER} -lt $NUM ]; do
    digitalocean-cli droplet create --size 4gb --image $IMAGE --ssh $KEY --name ${PREFIX}-${COUNTER}
    let COUNTER=COUNTER+1 
done

digitalocean-cli droplet list 2>&1 | grep doj-gbg |awk '{printf "%-50s %s\n", $1,  $3}' > machines.txt

echo Created machines
cat machines.txt
