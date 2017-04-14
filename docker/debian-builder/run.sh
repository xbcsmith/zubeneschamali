#!/bin/bash
set -e
docker run -i -t -v $PWD:/build:z builder/debian-builder:latest /bin/bash
