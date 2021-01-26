# Windfire Monitoring
- [Introduction](#introduction)
- [Before you start](#before-you-start)
- [Nginx](#nginx)
- [Windfire Restaurants](#windfire-restaurants)
- [Grafana](#grafana)
- [Prometheus](#prometheus)
- [Cadvisor](#cadvisor)
- [Nodeexport](#nodeexport)

## Introduction
This repository holds code and examples to configure and run monitoring tools for containerized applications.

All the tools are configured to run behind a Reverse Proxy, implemented with Nginx (https://www.nginx.com/), which shields and concentrates the access to several applications, as seen in the architecture diagram below.

![](images/architecture.png)

Nginx runs as a container and is configured as a Reverse Proxy, with several *proxy_pass* directives that redirect to the following components running behind the proxy (see [Nginx](#nginx) paragraph for more details):
- [Windfire Restaurants](#windfire-restaurants) - 
- [Grafana](#grafana) - 
- [Prometheus](#prometheus) - 
- [Cadvisor](#cadvisor) - 

Nodeexporter does not have a relevant UI and for this reason runs in the backend and is not exposed through Nginx (see [Nodeexport](#nodeexport) paragraph for more details).

## Before you start
Before starting to experiment with the samples provided in this repository, you just need to have Docker and Docker Compose properly installed on your environment.

Refer to the following:
 - https://docs.docker.com/engine/install/ for Docker engine installation
 - https://docs.docker.com/compose/install/ for Docker Compose installation

## Nginx
[TODO]

## Windfire Restaurants 
[TODO]

## Grafana
[TODO]

## Prometheus
[TODO]

## Cadvisor
[TODO]

## Nodeexport
[TODO]