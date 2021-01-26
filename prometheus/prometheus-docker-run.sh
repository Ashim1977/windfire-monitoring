source $HOME/dev/windfire-proxy/setenv.sh

echo ${cyn}Removing $PROMETHEUS_CONTAINER_NAME container ...${end}
docker rm -f $PROMETHEUS_CONTAINER_NAME
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
echo ${cyn}Running $PROMETHEUS_CONTAINER_NAME container ...${end}
# Run PROMETHEUS mounting configuration file as a volume
#CMD_RUN="docker run --name $PROMETHEUS_CONTAINER_NAME --network $MONITORING_NETWORK -d -p 9091:9090 -v $HOME/dev/windfire-proxy/prometheus/prometheus-proxied.yml:/etc/prometheus/prometheus.yml -v $HOME/temp/prometheus:/prometheus $PROMETHEUS_CONTAINER_IMAGE_NAME:$PROMETHEUS_CONTAINER_IMAGE_VERSION --config.file=/etc/prometheus/prometheus.yml --web.external-url=/prometheus"
CMD_RUN="docker run --name $PROMETHEUS_CONTAINER_NAME --network $MONITORING_NETWORK -d -v $HOME/dev/windfire-proxy/prometheus/prometheus-proxied.yml:/etc/prometheus/prometheus.yml -v $HOME/temp/prometheus:/prometheus $PROMETHEUS_CONTAINER_IMAGE_NAME:$PROMETHEUS_CONTAINER_IMAGE_VERSION --config.file=/etc/prometheus/prometheus.yml --web.external-url=/prometheus"
echo ${cyn}Running Docker container with:${end} ${grn}$CMD_RUN${end}
$CMD_RUN
# Connect to Docker Network inspect
NETWORK_CONNECT_CMD_RUN="docker network connect $CONTAINER_NETWORK $PROMETHEUS_CONTAINER_NAME"
echo ${cyn}Attaching $PROMETHEUS_CONTAINER_NAME container to $CONTAINER_NETWORK network with :${end} ${grn}$NETWORK_CONNECT_CMD_RUN${end}
$NETWORK_CONNECT_CMD_RUN
# Docker Network inspect
DOCKER_NETWORK_INSPECT_CMD_RUN="docker inspect $MONITORING_NETWORK"
echo ${cyn}Running Docker network inspect with: ${end} ${grn}$DOCKER_NETWORK_INSPECT_CMD_RUN${end}
$DOCKER_NETWORK_INSPECT_CMD_RUN