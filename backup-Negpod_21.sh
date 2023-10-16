#!/usr/bin/env bash

function load {
    for i in {1..10}; do
        echo -n "."
        sleep 0.1
    done
    echo -e "100%\n"
}


# Configuration for variables
DONII="negpod_21-q1"
username="2f05c1f8800b"
host="2f05c1f8800b.3be8ebfc.alu-cod.online"
password="d4a1d225d0abda9549d8"
dest="summative/0923-2023S"

# Create the destination directory on the remote server if it doesn't exist
sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username@$host" "mkdir -p /$dest"

# Use rsync to backup the directory to the alu-cod.online server
rsync -avz --delete -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" "$DONII" "$username@$host:/$dest"

echo -n "Backup completed. Ending Program ."
load
echo -e "\n\n **************************** Thank You For Using Our Program !!*****************************"
