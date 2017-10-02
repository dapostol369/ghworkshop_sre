#!/bin/bash

. ./variables.sh


remove_containers()
{
echo ">> Removing the containers..." | tee -a $LOG_FILE

# WEB APP1
if docker ps -a | grep "$APP1" >>$LOG_FILE 2>&1
then
  if docker stop $APP1 >>$LOG_FILE 2>&1
  then echo ">> Container $APP1 removed successfully." | tee -a $LOG_FILE
  else
    echo ">> Error removing the container $APP1. One or more Containers might not exist. Check logs at '$LOG_FILE'" | tee -a $LOG_FILE;
    exit 1;
  fi
else echo ">> Container $APP1 not present." | tee -a $LOG_FILE
fi

# WEB APP2
if docker ps -a | grep "$APP2" >>$LOG_FILE 2>&1
then
  if docker stop $APP2 >>$LOG_FILE 2>&1
  then echo ">> Container $APP2 removed successfully." | tee -a $LOG_FILE
  else
    echo ">> Error removing the container $APP2. One or more Containers might not exist. Check logs at '$LOG_FILE'" | tee -a $LOG_FILE;
    exit 1;
  fi
else echo ">> Container $APP2 not present." | tee -a $LOG_FILE
fi

# mongodb
if docker ps -a | grep "$MONGO1" >>$LOG_FILE 2>&1
then
  if docker stop $MONGO1 >>$LOG_FILE 2>&1
  then echo ">> Container $MONGO1 removed successfully." | tee -a $LOG_FILE
  else
    echo ">> Error removing the container $MONGO1. One or more Containers might not exist. Check logs at '$LOG_FILE'" | tee -a $LOG_FILE;
    exit 1;
  fi
else echo ">> Container $MONGO1 not present." | tee -a $LOG_FILE
fi

# haproxy
if docker ps -a | grep "$HAPROXY1" >>$LOG_FILE 2>&1
then
  if docker stop $HAPROXY1 >>$LOG_FILE 2>&1
  then echo ">> Container $HAPROXY1 removed successfully." | tee -a $LOG_FILE
  else
    echo ">> Error removing the container $HAPROXY1. One or more Containers might not exist. Check logs at '$LOG_FILE'" | tee -a $LOG_FILE;
    exit 1;
  fi
else echo ">> Container $MONGO1 not present." | tee -a $LOG_FILE
fi

# cadvisor
if docker ps -a | grep "$CADVISOR" >>$LOG_FILE 2>&1
then
  if docker rm -f $CADVISOR >>$LOG_FILE 2>&1
  then echo ">> Container $CADVISOR removed successfully." | tee -a $LOG_FILE
  else
    echo ">> Error removing the container $CADVISOR. One or more Containers might not exist. Check logs at '$LOG_FILE'" | tee -a $LOG_FILE;
    exit 1;
  fi
else echo ">> Container $CADVISOR not present." | tee -a $LOG_FILE
fi

# <none>:<none> images are intermediate images that need to be cleaned up
if docker rmi $(docker images -f "dangling=true" -q) >> $LOG_FILE 2>&1
then
  echo "cleaning up dangling images"
else
  echo "no dangling images to cleanup"
fi

}
