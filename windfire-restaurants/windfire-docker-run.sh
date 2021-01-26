source $HOME/dev/windfire-proxy/setenv.sh

echo ${cyn}Removing $WINDFIRE_CONTAINER_NAME container ...${end}
docker rm -f $WINDFIRE_CONTAINER_NAME
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
echo ${cyn}Running $WINDFIRE_CONTAINER_NAME container ...${end}
# Run Windire Restaurants Backend controller
#CMD_RUN="docker run --name $WINDFIRE_CONTAINER_NAME --network $CONTAINER_NETWORK -d -p 8083:8082 $DOCKER_HUB_ID/$WINDFIRE_CONTAINER_IMAGE_NAME:$WINDFIRE_CONTAINER_IMAGE_VERSION"
CMD_RUN="docker run --name $WINDFIRE_CONTAINER_NAME --network $CONTAINER_NETWORK -d $DOCKER_HUB_ID/$WINDFIRE_CONTAINER_IMAGE_NAME:$WINDFIRE_CONTAINER_IMAGE_VERSION"
echo ${cyn}Running Docker container with:${end} ${grn}$CMD_RUN${end}
$CMD_RUN
# Docker Network inspect
DOCKER_NETWORK_INSPECT_CMD_RUN="docker inspect $CONTAINER_NETWORK"
echo ${cyn}Running Docker network inspect with: ${end} ${grn}$DOCKER_NETWORK_INSPECT_CMD_RUN${end}
$DOCKER_NETWORK_INSPECT_CMD_RUN