#!/bin/bash

##Generate EN
/start.sh
cp -R /usr/share/nginx/html/* /var/www/html/

##Generate FR
curl -o /usr/share/nginx/html/resume.json $RESUME_JSON_URL
/start.sh
cp /usr/share/nginx/html/index.html /var/www/html/fr.html
