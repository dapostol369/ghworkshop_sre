#!/bin/bash

. ./variables.sh
. ./remove_containers.sh
echo "Time: $(date)" >>$LOG_FILE
echo "**************** INITIATING CLEANUP ***********************"

remove_containers

echo "**************** CLEANUP COMPLETED ***********************"
