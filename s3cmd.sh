#!/bin/sh

# Update package repositories
apt-get update

# Install S3CMD Tools
apt install s3cmd -y

# Configurasi s3cmd
echo 'Isikan sesuai s3Object storage kamu'
s3cmd --configure

read -p "Masukan Nama S3 Bucket kamu: " bucket

# Proses buat Script backup
echo "echo 'Started Sync to Your Spaces'
date +'%a %b %e %H:%M:$S %Z %Y'
s3cmd sync --recursive --preserve /srv  s3://$bucket
s3cmd sync --recursive --preserve /etc  s3://$bucket
s3cmd sync --recursive --preserve /root  s3://$bucket
s3cmd sync --recursive --preserve /home s3://$bucket
s3cmd sync --recursive --preserve /var  s3://$bucket
dpkg --get-selections > dpkg.list
s3cmd sync --recursive --preserve dpkg.list s3://$bucket
date +'%a %b %e %H:%M:$S %Z %Y'
echo 'Finished Sync to Your Spaces' " > ~/s3cmdbcp.sh

read -p "Daftar direktori yang akan di backup:
•srv
•etc
•root
•home
•var
Pilih Y untuk melanjutkan proses backup (Y) " confirm


# Menjalan kan Script backup
bash s3cmdbcp.sh

