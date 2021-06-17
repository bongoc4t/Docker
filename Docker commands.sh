# https://jfrog.com/knowledge-base/a-beginners-guide-to-understanding-and-building-docker-images/ -> basic Docker understanding


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
                inspect CONTAINER_NAME #inspect the container file
                inspect -f '{{.HostConfig.LogConfig.Type}}' CONTAINER_NAME #to find the current logging driver for a running container


#-MANAGE IMAGES-#
docker image  pull IMAGE #download an image
              push IMAGE #upload an image
              rmi IMAGE #delete an image
              image list #list all images
              images #list all images
              image prune #delete dangling images
              image prune -a #delete all unused images
              inspect IMAGE #show all detains in a JSON format, exporsed ports, Size,...
              build DIRECTORY #build an image from dockerfile
              tag IMAGE NEW_IMAGE #tag an image
              save IMAGE -o FILE.tar #save an image to a .tar file
              load -i FILE.tar #load an image from a .tar file

#-INFO & STATS-#
# Change the Logging driver -> /etc/docker/daemon.json and add "log-driver": "LOG"
docker login
       logout
       logs CONTAINER #show logs of a container
       system info #check the system info
       system df #display image size
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

#-DOCKERFILE-#
FROM #start from a base OS/Image
RUN #will execute any commands in a new layer on top of the current image and commit the results.
CMD #its main purpose is to provide defaults for an executing container, for example ["param1", "param2"]
ADD #copies new files, directories or remote file URLs from <src> and adds them to the filesystem image at the path <dest>, for example ADD hom?.txt /mydir/
COPY #same as ADD as described in the Docker Docs
ENV #allows for multiple key-value variables to be set at one time, for example MY_NAME="John Doe"
EXPOSE # informs Docker that the container listens on the specified network ports at runtime, for example 80/tcp
LABEL #adds metadata to an image. Is a key-value pair, for example version="1.0"
USER #sets the user name (or UID) and optionally the user group (or GID) to use when running the image and for any RUN, CMD and ENTRYPOINT instructions that follow it in the Dockerfile
VOLUME #creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers, for example VOLUME /var/log /var/db
WORKDIR # sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction.
ONBUILD #adds to the image a trigger instruction to be executed at a later time, when the image is used as the base for another build. The trigger will be executed in the context of the downstream build, as if it had been inserted immediately after the FROM instruction in the downstream Dockerfile.
