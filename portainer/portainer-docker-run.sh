source $HOME/dev/windfire-proxy/setenv.sh

echo ${cyn}Removing $PORTAINER_CONTAINER_NAME container ...${end}
docker rm -f $PORTAINER_CONTAINER_NAME
echo ${cyn}Container removed${end}
echo
echo ${cyn}Removing Docker networks ...${end}
docker network rm $CONTAINER_NETWORK
echo ${cyn}Docker network removed${end}
echo
echo ${cyn}Creating Docker networks ...${end}
docker network create $CONTAINER_NETWORK
echo ${cyn}Docker network created${end}
echo
echo ${cyn}Running $PORTAINER_CONTAINER_NAME container ...${end}
#CMD_RUN="docker run --name $PORTAINER_CONTAINER_NAME --network $CONTAINER_NETWORK -d --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/temp/portainer:/data $PORTAINER_CONTAINER_IMAGE_NAME:$PORTAINER_CONTAINER_IMAGE_VERSION"
CMD_RUN="docker run --name $PORTAINER_CONTAINER_NAME --network $CONTAINER_NETWORK -d -p 8001:8000 -p 9001:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/temp/portainer:/data $PORTAINER_CONTAINER_IMAGE_NAME:$PORTAINER_CONTAINER_IMAGE_VERSION"
echo ${cyn}Running Docker container with:${end} ${grn}$CMD_RUN${end}
$CMD_RUN
# Docker Network inspect
DOCKER_NETWORK_INSPECT_CMD_RUN="docker inspect $CONTAINER_NETWORK"
echo ${cyn}Running Docker network inspect with: ${end} ${grn}$DOCKER_NETWORK_INSPECT_CMD_RUN${end}
$DOCKER_NETWORK_INSPECT_CMD_RUN