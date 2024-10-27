#!/bin/sh

# Update package repositories
apt-get update && apt-get upgrade -y

# Install S3CMD Tools
apt install s3cmd -y

# Configurasi s3cmd
s3cmd --configure

