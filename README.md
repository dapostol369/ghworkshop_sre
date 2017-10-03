# Github for a FLASK PYTHON Web App Example
This is a simple webapp written with FLASK PYTHON and ANGULAR with a MONGO backend, with HAPROXY as a load balancer.
This was written as a web app example for the Grace Hopper Conference 2017.

The web application using docker-hub images
a) uwsgi-nginx-flask
- tiangolo/uwsgi-nginx-flask:python2.7

b) mongodb
- mongo:3.4.0

c) haproxy
- MAC: hypriot/rpi-haproxy
- UBUNTU image: haproxytech/haproxy-ubuntu 
    
# Requirements
1. docker
2. ansible (only needed if you want to run fault injection)

# Setup </br>
a. Install docker CE edition

b. Download ansible

c. Download files from git to $HOME.  (NOTE $HOME needs to be defined).</br>
NOTE: The data for mongo will persist in $HOME/ghc/mongodata

d) If using UBUNTU, HAPROXY additional changes needed
- You will need to setup the HAPROXY to setup you haproxy ubuntu environment.Please see this [doc](https://linoxide.com/ubuntu-how-to/setup-haproxy-ubuntu-16-04/)
- This [doc]( https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts ) explains the haproxy concepts.
- Also need to copy the "haproxy/haproxy_ubuntu.cfg" and copy it to the "haproxy.cfg" file

# TO RUN the web app
a. Change dir: cd $HOME/ghworkshop_sre/webapp/app </br>
b. execute:    ./setup.sh </br>

NOTE the setup script will</br>
- download the dockerhub images
- execute: "docker-compose build" , to build
- execute: "docker-compose up" , to run the docker containers

# TO STOP the web app
a. Change dir: cd $HOME/ghworkshop_sre/webapp/app </br>
b. execute:    ./cleanup.sh </br>

NOTE: the cleanup scrips will </br>
- stop the docker containers
