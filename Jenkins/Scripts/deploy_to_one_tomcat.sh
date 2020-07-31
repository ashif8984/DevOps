#!/bin/bash

# The below scritps 1st backup the existing war and then deploys
# Change the 2 IP/Hostname of your Tomcat Instances

ssh ec2-user@tomcat-o StrictHostKeyChecking=no /bin/bash <<'ENDSSH'
    cd /opt/apache-tomcat-8.5.57/webapps/
   # ls -lrt
    echo "Taking Backup....."
    FILE=*.war
    FILE2=$FILE'_backup_'$(date -I)
    cp $FILE $FILE2
    rm $FILE

ENDSSH