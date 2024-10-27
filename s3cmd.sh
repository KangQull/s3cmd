#!/bin/sh

# Update package repositories
apt-get update && apt-get upgrade -y

# Install S3CMD Tools
apt install s3cmd -y

# Configurasi s3cmd
s3cmd --configure

# Download Script backup
wget https://raw.githubusercontent.com/KangQull/s3cmd/main/s3cmdbk.sh

# Menjalan kan Script backup
sh s3cmdbk.sh

