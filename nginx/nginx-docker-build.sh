source $HOME/dev/windfire-proxy/setenv.sh

echo ${cyn}Removing $INGRESS_CONTROLLER_IMAGE_NAME image ...${end}
docker rmi -f $INGRESS_CONTROLLER_IMAGE_NAME
echo ${cyn}Container image removed${end}
echo
echo ${cyn}Building $INGRESS_CONTROLLER_IMAGE_NAME image ...${end}
docker build -t $INGRESS_CONTROLLER_IMAGE_NAME .
DOCKER_BUILD_CMD_RUN="docker build -t $INGRESS_CONTROLLER_IMAGE_NAME ."
echo ${cyn}Building Docker images with:${end} ${grn}$DOCKER_BUILD_CMD_RUN${end}
$DOCKER_BUILD_CMD_RUN
echo ${cyn}Container image built${end}