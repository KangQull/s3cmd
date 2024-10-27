#!/bin/sh

# Update package repositories
apt-get update

# Install S3CMD Tools
apt install s3cmd -y

# Configurasi s3cmd
echo 'Isikan sesuai s3Object storage kamu'
s3cmd --configure

read -p "Masukan Nama S3 Bucket backup kamu: " bucket

# Proses buat Script backup
echo "echo 'Started Restore to your Spaces VPS'
date +'%a %b %e %H:%M:$S %Z %Y'
s3cmd get -r s3://$bucket/srv/ /srv
s3cmd get -r s3://$bucket/etc/ /etc
s3cmd get -r s3://$bucket/root/ /root
s3cmd get -r s3://$bucket/home/ /home
s3cmd get -r s3://$bucket/var/ /var
date +'%a %b %e %H:%M:$S %Z %Y'
echo 'Finished Restore to your Spaces VPS' " > ~/s3cmdrst.sh

# Menjalan kan Script backup
bash s3cmdrst.sh
