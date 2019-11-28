#!/bin/sh
docker build --rm . -t mn-first-rest:1.0.0
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -p 8080:8080 mn-first-rest:1.0.0"

