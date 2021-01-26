source $HOME/dev/windfire-monitoring/setenv.sh

echo ${cyn}Removing $GRAFANA_CONTAINER_NAME container ...${end}
docker rm -f $GRAFANA_CONTAINER_NAME
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
echo ${cyn}Running $GRAFANA_CONTAINER_NAME container ...${end}
# Run Grafana with a custom created Grafana image
#CMD_RUN="docker run --name $GRAFANA_CONTAINER_NAME --network $CONTAINER_NETWORK -d -p 8085:3000 -v $HOME/temp/grafana:/var/lib/grafana $GRAFANA_CUSTOM_CONTAINER_IMAGE_NAME"
#CMD_RUN="docker run --name $GRAFANA_CONTAINER_NAME --network $CONTAINER_NETWORK -d -v $HOME/temp/grafana:/var/lib/grafana $GRAFANA_CUSTOM_CONTAINER_IMAGE_NAME"
# Run Grafana mounting configuration file as a volume
#CMD_RUN="docker run --name $GRAFANA_CONTAINER_NAME --network $CONTAINER_NETWORK -d -p 8085:3000 -v $HOME/dev/windfire-monitoring/grafana/conf:/usr/share/grafana/conf -v $HOME/temp/grafana:/var/lib/grafana $GRAFANA_CONTAINER_IMAGE_NAME:$GRAFANA_CONTAINER_IMAGE_VERSION"
CMD_RUN="docker run --name $GRAFANA_CONTAINER_NAME --network $CONTAINER_NETWORK -d -v $HOME/dev/windfire-monitoring/grafana/conf:/usr/share/grafana/conf -v $HOME/temp/grafana:/var/lib/grafana $GRAFANA_CONTAINER_IMAGE_NAME:$GRAFANA_CONTAINER_IMAGE_VERSION"
echo ${cyn}Running Docker container with:${end} ${grn}$CMD_RUN${end}
$CMD_RUN
# Docker Network inspect
DOCKER_NETWORK_INSPECT_CMD_RUN="docker inspect $CONTAINER_NETWORK"
echo ${cyn}Running Docker network inspect with: ${end} ${grn}$DOCKER_NETWORK_INSPECT_CMD_RUN${end}
$DOCKER_NETWORK_INSPECT_CMD_RUN