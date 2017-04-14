#!/bin/bash
set -e
docker run -i -t -v $PWD:/build:z builder/foo-builder:latest /bin/bash
