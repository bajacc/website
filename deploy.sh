#!/bin/sh -e 

rm -rf dst/.files && ./ssg6 src dst 'bajac' 'http://www' && 
  rsync -uvrP --delete-after ./dst/ root@bajac.xyz:/var/www/bajac

