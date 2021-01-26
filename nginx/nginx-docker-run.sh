source $HOME/dev/windfire-monitoring/setenv.sh

echo ${cyn}Removing $INGRESS_CONTROLLER_CONTAINER_NAME container ...${end}
docker rm -f $INGRESS_CONTROLLER_CONTAINER_NAME
echo ${cyn}Docker container removed${end}
echo
echo ${cyn}Removing Docker networks ...${end}
docker network rm $CONTAINER_NETWORK
echo ${cyn}Docker network removed${end}
echo
echo ${cyn}Creating Docker networks ...${end}
docker network create $CONTAINER_NETWORK
echo ${cyn}Docker network created${end}
echo
echo ${cyn}Running $INGRESS_CONTROLLER_CONTAINER_NAME container ...${end}
# Run NGINX Ingress controller with a custom created NGINX image
#INGRESS_CONTROLLER_CMD_RUN="docker run --name $INGRESS_CONTROLLER_CONTAINER_NAME --network $CONTAINER_NETWORK -d -p 80:80 $INGRESS_CONTROLLER_IMAGE_NAME"
# Run NGINX Ingress controller mounting configuration file as a volume
INGRESS_CONTROLLER_CMD_RUN="docker run --name $INGRESS_CONTROLLER_CONTAINER_NAME --network $CONTAINER_NETWORK -d -p 80:80 -v $HOME/dev/windfire-monitoring/nginx/default.conf:/etc/nginx/conf.d/default.conf $NGINX_CONTAINER_IMAGE_NAME:$NGINX_CONTAINER_IMAGE_VERSION"
echo ${cyn}Running Nginx Ingress controller with:${end} ${grn}$INGRESS_CONTROLLER_CMD_RUN${end}
$INGRESS_CONTROLLER_CMD_RUN
# Docker Network inspect
DOCKER_NETWORK_INSPECT_CMD_RUN="docker inspect $CONTAINER_NETWORK"
echo ${cyn}Running Docker network inspect with: ${end} ${grn}$DOCKER_NETWORK_INSPECT_CMD_RUN${end}
$DOCKER_NETWORK_INSPECT_CMD_RUN