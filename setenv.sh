##### Terminal Colors - START
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'
coffee=$'\xE2\x98\x95'
coffee3="${coffee} ${coffee} ${coffee}"
##### Terminal Colors - END

###### Variable section - START
CONTAINER_NETWORK=windfire-net
MONITORING_NETWORK=monitoring-net
DOCKER_HUB_ID=robipozzi
## Windfire Restaurants Backend environment variables
WINDFIRE_CONTAINER_IMAGE_NAME=windfire-restaurants-node
WINDFIRE_CONTAINER_IMAGE_VERSION=1.0
WINDFIRE_CONTAINER_NAME=windfire_restaurants_node
CONFIG_DIR=/Users/robertopozzi/dev/robipozzi-kubernetes/docker-kubernetes-tutorials/4-docker_network/rpozzi-restaurants-backend/app/config
CONFIG_DIR_MOUNT=/config
## Nodeexporter environment variables
NODEEXPORTER_CONTAINER_IMAGE_NAME=quay.io/prometheus/node-exporter
NODEEXPORTER_CONTAINER_IMAGE_VERSION=latest
NODEEXPORTER_CONTAINER_NAME=nodeexporter
## Cadvisor environment variables
CADVISOR_CONTAINER_IMAGE_NAME=gcr.io/google-containers/cadvisor
CADVISOR_CONTAINER_IMAGE_VERSION=latest
CADVISOR_CONTAINER_NAME=cadvisor
## Prometheus environment variables
PROMETHEUS_CONTAINER_IMAGE_NAME=prom/prometheus
PROMETHEUS_CONTAINER_IMAGE_VERSION=latest
PROMETHEUS_CONTAINER_NAME=prometheus
## Grafana environment variables
GRAFANA_CONTAINER_IMAGE_NAME=grafana/grafana
GRAFANA_CONTAINER_IMAGE_VERSION=latest
GRAFANA_CUSTOM_CONTAINER_IMAGE_NAME=grafana
GRAFANA_CONTAINER_NAME=grafana
## NGINX Ingress controller environment variables
INGRESS_CONTROLLER_IMAGE_NAME=ingresscontroller
INGRESS_CONTROLLER_CONTAINER_NAME=ingress
NGINX_CONTAINER_IMAGE_NAME=nginx
NGINX_CONTAINER_IMAGE_VERSION=1.15.5
## Portainer environment variables
PORTAINER_CONTAINER_NAME=portainer
PORTAINER_CONTAINER_IMAGE_NAME=portainer/portainer-ce
PORTAINER_CONTAINER_IMAGE_VERSION=latest
###### Variable section - END