#!/bin/bash

. ./variables.sh
. ./remove_images.sh
. ./remove_containers.sh
echo "Time: $(date)" >>$LOG_FILE
echo "**************** INITIATING CLEANUP ***********************"

remove_containers
# remove_images

# rm $LOG_FILE

echo "**************** CLEANUP COMPLETED ***********************"
