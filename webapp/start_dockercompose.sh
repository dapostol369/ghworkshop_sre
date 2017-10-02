#!/bin/bash

cd $HOME/ghcgit/ghworkshop_sre/webapp

echo ">> Start docker-compose up..." | tee -a $LOG_FILE
if docker-compose up -d >>LOG_FILE 2>&1;
then
  echo ">> docker-compose up successful" | tee -a $LOG_FILE;
else
  echo ">> Error docker-compose up. Check logs at '$LOG_FILE'." | tee -a $LOG_FILE;
  exit 1;
fi

exit 0
