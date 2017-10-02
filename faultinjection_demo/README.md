# WEBAPP: Fault injection: Cause the webapp container to go down

### Technologies involved:

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/2295612/23793540/a3d03abe-0540-11e7-9b21-6e82119c94ce.jpg" width="600" height="400">
</p>

### Lab Architecture:

For the sake of simplicity, lets consider a simple Cloud Service architecture consisting of:

* Two Web App Docker containers running a cloud App (Container B as Backup Server).
* One HAProxy Docker container.
* One MONGODB Docker container.
* A cAdvisor Docker container monitoring the host machine as well as the Docker containers in the Cloud Service.

### DIAGRAM

<img src="https://github.com/maychu/ghworkshop_sre/blob/master/images/architecture.jpg">

### Target for the Lab:

* Get familiar with Ansible and how it can make a Cloud Engineer 
* **Exercise 1**
    > Run an Ansible Playbook to test the Failover scenario for our Cloud App.

### Instructions:

Open up the terminal and:


```shell
cd $HOME/ghworkshop_sre/faultinjection_demo/
```


#### Understanding the directories:

| File/Folder        | Explanation   |
| ------------- |:-------------:|
| inventory      | Holds the Ansible inventory files    |
| playbooks | Contains the Ansible playbooks that we are going to code as a part of this workshop      |
| sreFramework | Underlying Ansible-based SRE Framework leveraged by the Cloud Services to inject faults in their Environments |



Now you have a running Demo Cloud Service environment in your VM.

Open up a browser to check the running app at:

<http://localhost>


<p align="center">
<img src="https://github.com/maychu/ghworkshop_sre/blob/master/images/webapp-image.jpg" >
</p>


And check cAdvisor at:

<http://localhost:8081>

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/2295612/24097794/af58f4f2-0d24-11e7-865b-159251f8908b.png" >
</p>



#### Check the running docker containers 

```shell
docker ps
```

#### Expected output:

```shell
~/$HOMEghworkshop_sre/faultinjection_demo/$ docker ps
CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS                                             NAMES
c2be1183c910        google/cadvisor:latest   "/usr/bin/cadvisor..."   7 minutes ago       Up 7 minutes        0.0.0.0:8081->8080/tcp                            cadvisor
f069414dfceb        hypriot/rpi-haproxy      "bash /haproxy-start"    7 minutes ago       Up 7 minutes        0.0.0.0:70->70/tcp, 0.0.0.0:80->80/tcp, 443/tcp   webapp_haproxy_1
e8fbd1158812        webapp_weba              "/entrypoint.sh /u..."   7 minutes ago       Up 7 minutes        80/tcp, 443/tcp, 27017/tcp                        webapp_weba_1
9dbaf10e99fc        webapp_webb              "/entrypoint.sh /u..."   7 minutes ago       Up 7 minutes        80/tcp, 443/tcp, 27017/tcp                        webapp_webb_1
884479071ba3        mongo:3.4.0              "/entrypoint.sh mo..."   2 hours ago         Up 7 minutes        0.0.0.0:27017->27017/tcp                          webapp_mongo_1


```

## Finally, lets head on to our [Exercise 1](https://github.com/maychu/ghworkshop_sre/tree/master/faultinjection_demo/playbooks/exercise_1).
