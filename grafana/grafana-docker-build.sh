source $HOME/dev/windfire-proxy/setenv.sh

echo ${cyn}Removing $GRAFANA_CUSTOM_CONTAINER_IMAGE_NAME image ...${end}
docker rmi -f $GRAFANA_CUSTOM_CONTAINER_IMAGE_NAME
echo ${cyn}Container image removed${end}
echo
echo ${cyn}Building $GRAFANA_CUSTOM_CONTAINER_IMAGE_NAME image ...${end}
docker build -t $GRAFANA_CUSTOM_CONTAINER_IMAGE_NAME .
DOCKER_BUILD_CMD_RUN="docker build -t $GRAFANA_CUSTOM_CONTAINER_IMAGE_NAME ."
echo ${cyn}Building Docker images with:${end} ${grn}$DOCKER_BUILD_CMD_RUN${end}
$DOCKER_BUILD_CMD_RUN
echo ${cyn}Container image built${end}
echo
echo ${cyn}Removing $GRAFANA_CONTAINER_IMAGE_NAME image ...${end}
docker rmi -f $GRAFANA_CONTAINER_IMAGE_NAME
echo ${cyn}Container image removed${end}