source $HOME/dev/windfire-monitoring/setenv.sh
# Run Windire Restaurants Backend
source $HOME/dev/windfire-monitoring/windfire-restaurants/windfire-docker-run.sh
# Run Nodeexporter
source $HOME/dev/windfire-monitoring/nodeexporter/nodeexporter-docker-run.sh
# Run Cadvisor
source $HOME/dev/windfire-monitoring/cadvisor/cadvisor-docker-run.sh
# Run Prometheus
source $HOME/dev/windfire-monitoring/prometheus/prometheus-docker-run.sh
# Run Grafana
source $HOME/dev/windfire-monitoring/grafana/grafana-docker-run.sh
# Run Portainer
source $HOME/dev/windfire-monitoring/portainer/portainer-docker-run.sh
# Run NGINX Ingress controller
source $HOME/dev/windfire-monitoring/nginx/nginx-docker-run.sh