#!/bin/bash
USERNAME=ec2-user

# Replace the below with IP if required
HOSTS="
tomcat
tomcat2
"

TOMCAT_START="/opt/apache-tomcat-8.5.57/bin/startup.sh"
TOMCAT_STOP="/opt/apache-tomcat-8.5.57/bin/shutdown.sh"

SCRIPT="hostname ; uptime;"


timeout=10

for HOSTNAME in ${HOSTS} ; do

  echo "------------------------------------------------------------------"
  echo "                Deploying on $HOSTNAME"
  echo "------------------------------------------------------------------"

  echo "Stopping the Tomcat......"
  ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} "${TOMCAT_STOP}"

  echo "Deploying......"
  ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"


  scp -rp /var/lib/jenkins/workspace/CICD_Pipeline_for_2server/webapp/target/webapp.war $USERNAME@$HOSTNAME:/opt/apache-tomcat-8.5.57/webapps/

  sleep $timeout

  echo "Starting the Tomcat......"
  ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} "${TOMCAT_START}"


done
