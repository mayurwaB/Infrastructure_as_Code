#!/bin/bash

sudo useradd --no-create-home prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

#download and extract prometheus
wget "https://github.com/prometheus/prometheus/releases/download/v2.36.2/prometheus-2.36.2.linux-amd64.tar.gz"
tar xvfz prometheus-2.36.2.linux-amd64.tar.gz

#copy binaries to local binaries folder
sudo cp prometheus-2.36.2.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-2.36.2.linux-amd64/promtool /usr/local/bin/

#copy config to config directory
sudo cp -r prometheus-2.36.2.linux-amd64/consoles /etc/prometheus/
sudo cp -r prometheus-2.36.2.linux-amd64/console_libraries /etc/prometheus/
sudo cp prometheus-2.36.2.linux-amd64/prometheus.yml /etc/prometheus/

#remove residual files
rm -rf prometheus-2.36.2.linux-amd64.tar.gz prometheus-2.36.2.linux-amd64

#configure ownership
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries


