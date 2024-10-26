#!/bin/sh
echo 'Started Restore to your Spaces VPS'
date +'%a %b %e %H:%M:$S %Z %Y'
s3cmd get -r s3://bkvps/srv /srv
date +'%a %b %e %H:%M:$S %Z %Y'
echo 'Finished Restore to your Spaces VPS'
