#!/bin/sh
echo 'Started Sync to Your Spaces'
date +'%a %b %e %H:%M:$S %Z %Y'
s3cmd sync --recursive --preserve /srv  s3://bucket-kamu
s3cmd sync --recursive --preserve /etc  s3://bucket-kamu
s3cmd sync --recursive --preserve /home s3://bucket-kamu
s3cmd sync --recursive --preserve /var  s3://bucket-kamu
dpkg --get-selections > dpkg.list
s3cmd sync --recursive --preserve dpkg.list s3://bucket-kamu
date +'%a %b %e %H:%M:$S %Z %Y'
echo 'Finished Sync to Your Spaces'
