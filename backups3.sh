#!/bin/sh
echo 'Started Sync to Digitalocean Spaces'
date +'%a %b %e %H:%M:$S %Z %Y'
s3cmd sync --recursive --preserve /srv  s3://your-bucket
s3cmd sync --recursive --preserve /etc  s3://your-bucket
s3cmd sync --recursive --preserve /home s3://your-bucket
s3cmd sync --recursive --preserve /var  s3://your-bucket
dpkg --get-selections > dpkg.list
s3cmd sync --recursive --preserve dpkg.list s3://your-bucket
date +'%a %b %e %H:%M:$S %Z %Y'
echo 'Finished Sync to Digitalocean Spaces'
