#!/bin/bash

. ./variables.sh
. ./remove_containers.sh

echo "Time: $(date)\n\n\n" >>$LOG_FILE
echo "*********** INITIATING SETUP **************";

echo ">> Pulling the required docker images... " | tee -a $LOG_FILE

if rm -rf $HOME/ghc/mongodata >> $LOG_FILE 2>&1
then
  echo "cleanup database file success"
else
  echo "cleanup database file failed"
fi  

if docker pull $CADVISOR_IMAGE >>$LOG_FILE 2>&1
then
  echo ">> Docker images pulled." | tee -a $LOG_FILE
else
  echo ">> Error pulling the docker images. Check logs at '$LOG_FILE'." | tee -a $LOG_FILE;
  exit 1;
fi


# Start the app containers
echo ">> Building docker-compose..." | tee -a $LOG_FILE
if docker-compose build >>$LOG_FILE 2>&1
then  echo "docker-compose build" | tee -a $LOG_FILE
else
  echo ">> Killing the existing containers and trying again..." | tee -a $LOG_FILE
  remove_containers
  echo ">> Starting the docker-compose again..." | tee -a $LOG_FILE
  docker-compose build >>$LOG_FILE 2>&1;
  echo ">> docker-compose build successfully." | tee -a $LOG_FILE
fi

echo ">> Start docker-compose up..." | tee -a $LOG_FILE
if docker-compose up -d >>LOG_FILE 2>&1;
then
  echo ">> docker-compose up successful" | tee -a $LOG_FILE;
else
  echo ">> Error docker-compose up. Check logs at '$LOG_FILE'." | tee -a $LOG_FILE;
  exit 1;
fi



echo ">> Setting up CAdvisor to monitor the containers..." | tee -a $LOG_FILE

if docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8081:8080 \
  --detach=true \
  --name=$CADVISOR \
  $CADVISOR_IMAGE >>$LOG_FILE 2>&1
then
  echo ">> CAdvisor set up successfully." | tee -a $LOG_FILE
else
  echo ">> Error setting up CAdvisor. Check logs at '$LOG_FILE'." | tee -a $LOG_FILE;
  exit 1;
fi

# <none>:<none> images are intermediate images that need to be cleaned up
echo ">> Cleanup intermediary images from docker-compose step..."
if docker rmi $(docker images -f "dangling=true" -q) >> $LOG_FILE 2>&1
then
  echo "cleaning up dangling images"
else
  echo "no dangling images to cleanup"
fi



echo "*********** SETUP COMPLETED **************"

echo "App:  http://localhost"
echo "CAdvisor: http://localhost:8081"

exit 0
