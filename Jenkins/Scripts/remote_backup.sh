#!/bin/bash

USERNAME=ec2-user

# Replace the below with IP if required
HOSTS="
tomcat
tomcat2
"


for HOSTNAME in ${HOSTS} ;
do
    echo "----Working on $HOSTNAME---"
    ssh $USERNAME@$HOSTNAME -o StrictHostKeyChecking=no /bin/bash <<'ENDSSH'
    cd /opt/apache-tomcat-8.5.57/webapps

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
