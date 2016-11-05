#!/bin/sh

# This will be run when the container starts, and makes sure incron is running
service incron start

# Now we need to prevent docker from stopping our container
echo "Pres CTRL+C to stop..."
while true
do   
   sleep 1
done