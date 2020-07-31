#!/bin/bash

# --------------------------------------
#           Deploy Script
# --------------------------------------
# The below scritps 1st backup the existing war and then deploys

server_array=(tomcat tomcat2) # Change the 2 IP/Hostname of your Tomcat Instances
for i in "${server_array[@]}"
do
        echo "----Working on $i---"
    ssh ec2-user@$i -o StrictHostKeyChecking=no /bin/bash <<'ENDSSH'
    cd /opt/apache-tomcat-8.5.57/

    cd webapps
    # ls -lrt
    FILE=webapp.war
    if [[ -f "$FILE" ]]; then
        echo "$FILE exists."
        FILE_backup=$FILE'_backup_'$(date -I)
        cp $FILE $FILE_backup
        rm $FILE
        rm -rf webapp
    fi

ENDSSH

done