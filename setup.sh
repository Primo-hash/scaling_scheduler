#!/bin/bash -v
# CREATE STACK
openstack stack create -t scaling_scheduler.yaml -e scale_env.yaml scaling_scheduler

# Wait 3 minutes while stack is being created
secs=$((3 * 60))
while [ $secs -gt 0 ]; do
   echo -ne "Leeway countdown for stack CREATE to finish: $secs\033[0K\r"
   sleep 1
   : $((secs--))
done

# Get both downscale and upscale webhooks from stack output and feed to service project directory
openstack stack output show --all scaling_scheduler | grep -Eo "(https)://[a-zA-Z0-9./?&=_%:-]*" > infcode-golang/scheduleroutputdata.txt

# Install golang if not installed
sudo apt-get update
sudo apt-get -y install golang-golang

# Create symlink for systemctl to run go service
sudo systemctl link /home/ubuntu/scaling_scheduler/infcode-golang/scheduler.service

# Activate service with systemd
sudo systemctl daemon-reload
sudo systemctl enable scheduler
sudo systemctl start scheduler


