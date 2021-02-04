echo $PWD
source $HOME/dev/windfire-monitoring/setenv.sh
# Remove running containers
docker rm -f prometheus
docker rm -f ingress
docker rm -f grafana
docker rm -f cadvisor
docker rm -f nodeexporter
docker rm -f portainer
docker rm -f windfire_restaurants_node
# Run Docker compose
docker-compose up