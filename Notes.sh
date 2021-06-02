# https://jfrog.com/knowledge-base/a-beginners-guide-to-understanding-and-building-docker-images/ -> basic Docker understanding
The new way to launch commands is using:
docker container COMMAND

#-RUN A NEW CONTAINER-#
docker container run IMAGE #start a new container from an image
                --name CONTAINER_NAME IMAGE #assing a name to the image
                -p HOSTPORT:CONTAINER_PORT IMAGE #map the container to a port
                -p IMAGE #map the container to all ports
                -d IMAGE #start the container in the background
                --hostname HOSTNAME IMAGE #assing a hostname
                --add--host HOSTNAME:IP IMAGE #add a dns entry
                -v HOST_DIR:TARGET_DIR IMAGE #map a local directory into the container

#-MANAGE CONTAINERS-#
docker container ps #list all the running the containers
                ps -a #list of all containers
                stop CONTAINER #stop a running container
                start CONTAINER #start a container
                rm CONTAINER #delete a container
                rm -f CONTAINER #delete a running container
                cp CONTAINER:SOURCE TARGET #copy a file from a container to the host example: web:/index.html index.html
                cp TARGET CONTAINER:SOURCE #copy a file from the host to a container
                exec -it CONTAINER bash #start a shell inside a running container
                rename OLD_NAME NEW_NAME #rename a container

#-MANAGE IMAGES-#
docker container pull IMAGE #download an image
                push IMAGE #upload an image
                rmi IMAGE #delete an image
                images #list all images
                image prune #delete dangling images
                image prune -a #delete all unused images
                login
                logout
                build DIRECTORY #build an image from dockerfile
                tag IMAGE NEW_IMAGE #tag an image
                save IMAGE > FILE #save an image to a .tar file
                load -i TAR_FILE #load an image from a .tar file

#-INFO & STATS-#
docker logs CONTAINER #show logs of a container
        stats #show stats of running container
        top CONTAINER #show processes of container
        version #show installed version of docker installed
        inspect NAME #get detailed info about an object
        diff CONTAINER #show all modified files in container
        port CONTAINER #show mapped ports of a container

#-DOCKER SWARM-# 
#SWARM
docker swarm init #to init Swarm Orchestration
       swarm init --advertise-addr X.X.X.X #advertise the IP address and can be done with ports X.X.X.X:YY
       swarm join --token TOKEN X.X.X.X #to add a worker
       swarm join-token manager #create a token to setup a node as a manager
       node update --role ROLE NODE_NAME #update a role from a worker to 
#MANAGE SWARM
docker service create <image>
       service create --name NAME --replicas XX IMAGE #create image with NAME and requested replicas
       service update CONTAINER_NAME --replicas XX #update container with XX replicas
       service rm <service id|name> #remove service
       service ls #list all services
       service ps <service id|name> #list all tasks for given service (includes shutdown/failed)
       service ps --filter desired-state=running <service id|name> #list running (acitve) tasks for given service
       service logs --follow SERVICE_ID/NAME #print console log of a service
       create network --overlay NAME #create an overlay network
#STACKS > basically docker-compose files for production swarm