#!/bin/sh
docker build . -t mn-first-rest:1.0.0
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -p 8080:8080 mn-first-rest:1.0.0"
echo "    $ docker run -d -p 8080:8080 -e EXTERNAL_PORT= -e EUREKA_HOST=eureka-server --network BALANCER --name mn-first-rest-1 mn-first-rest:1.0.0"

