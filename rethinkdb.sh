#!/bin/bash

mkdir -p data
docker run -p 8080:8080 -p 28015:28015 -p 29015:29015 --name some-rethink -v "$(pwd)/data:/data" -d rethinkdb
