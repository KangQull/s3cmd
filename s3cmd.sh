#!/bin/sh

# Update package repositories
apt-get update && apt-get upgrade -y

# Install S3CMD Tools
apt install s3cmd -y

# Configurasi s3cmd
s3cmd --configure

# Proses buat Script backup
echo "echo 'Started Sync to Digitalocean Spaces'
date +'%a %b %e %H:%M:$S %Z %Y'
s3cmd sync --recursive --preserve /srv  s3://bucket-kamu
s3cmd sync --recursive --preserve /etc  s3://bucket-kamu
s3cmd sync --recursive --preserve /home s3://bucket-kamu
s3cmd sync --recursive --preserve /var  s3://bucket-kamu
dpkg --get-selections > dpkg.list
s3cmd sync --recursive --preserve dpkg.list s3://bucket-kamu
date +'%a %b %e %H:%M:$S %Z %Y'
echo 'Finished Sync to Digitalocean Spaces' " > ~/s3cmdbcp.sh

# Menjalan kan Script backup
bash s3cmdbcp.sh

