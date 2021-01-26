source $HOME/dev/windfire-proxy/setenv.sh
# Run Windire Restaurants Backend
source $HOME/dev/windfire-proxy/windfire-restaurants/windfire-docker-run.sh
# Run Nodeexporter
source $HOME/dev/windfire-proxy/nodeexporter/nodeexporter-docker-run.sh
# Run Cadvisor
source $HOME/dev/windfire-proxy/cadvisor/cadvisor-docker-run.sh
# Run Prometheus
source $HOME/dev/windfire-proxy/prometheus/prometheus-docker-run.sh
# Run Grafana
source $HOME/dev/windfire-proxy/grafana/grafana-docker-run.sh
# Run Portainer
source $HOME/dev/windfire-proxy/portainer/portainer-docker-run.sh
# Run NGINX Ingress controller
source $HOME/dev/windfire-proxy/nginx/nginx-docker-run.sh