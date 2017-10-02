#!/bin/bash

#sh /Users/maychu/ghcgit/ghworkshop_sre/webapp/app/start_setup.sh
echo "---Listing of running docker containers---"
echo "   webapp_weba_1 and webapp_webb_1 are running"
docker ps

echo "---run ansible playbook : stops webapp_weba_1 container"
echo "   app has redundancy, so webapp will continue to work"
ansible-playbook exercise_1/failover.yml


echo "---Listing of running docker containers---"
echo "   Only webapp_webb_1 is running"
docker ps

