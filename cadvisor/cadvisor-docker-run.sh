source $HOME/dev/windfire-monitoring/setenv.sh

echo ${cyn}Removing $CADVISOR_CONTAINER_NAME container ...${end}
docker rm -f $CADVISOR_CONTAINER_NAME
echo ${cyn}Container removed${end}
echo
echo ${cyn}Removing Docker networks ...${end}
docker network rm $MONITORING_NETWORK
echo ${cyn}Docker network removed${end}
echo
echo ${cyn}Creating Docker networks ...${end}
docker network create $MONITORING_NETWORK
echo ${cyn}Docker network created${end}
echo
echo ${cyn}Running $CADVISOR_CONTAINER_NAME container ...${end}
# Run CADVISOR mounting configuration file as a volume
#CMD_RUN="docker run --name $CADVISOR_CONTAINER_NAME --network $MONITORING_NETWORK -d -p 8081:8080 -v /:/rootfs:ro -v /var/run/docker.sock:/var/run/docker.sock:rw -v /sys:/sys:ro -v /var/lib/docker/:/var/lib/docker:ro $CADVISOR_CONTAINER_IMAGE_NAME:$CADVISOR_CONTAINER_IMAGE_VERSION -url_base_prefix=/cadvisor"
CMD_RUN="docker run --name $CADVISOR_CONTAINER_NAME --network $MONITORING_NETWORK -d -v /:/rootfs:ro -v /var/run/docker.sock:/var/run/docker.sock:rw -v /sys:/sys:ro -v /var/lib/docker/:/var/lib/docker:ro $CADVISOR_CONTAINER_IMAGE_NAME:$CADVISOR_CONTAINER_IMAGE_VERSION -url_base_prefix=/cadvisor"
echo ${cyn}Running Docker container with:${end} ${grn}$CMD_RUN${end}
$CMD_RUN
# Connect to Docker Network inspect
NETWORK_CONNECT_CMD_RUN="docker network connect $CONTAINER_NETWORK $CADVISOR_CONTAINER_NAME"
echo ${cyn}Attaching $CADVISOR_CONTAINER_NAME container to $CONTAINER_NETWORK network with :${end} ${grn}$NETWORK_CONNECT_CMD_RUN${end}
$NETWORK_CONNECT_CMD_RUN
# Docker Network inspect
DOCKER_NETWORK_INSPECT_CMD_RUN="docker inspect $MONITORING_NETWORK"
echo ${cyn}Running Docker network inspect with: ${end} ${grn}$DOCKER_NETWORK_INSPECT_CMD_RUN${end}
$DOCKER_NETWORK_INSPECT_CMD_RUN