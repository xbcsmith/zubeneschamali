#!/usr/bin/env python

import yaml
import docker
import tempfile
import pdb
import sys
import rethinkdb as r

with open(sys.argv[1], 'r') as stream:
    pkg = yaml.load(stream)

requires = " \\n".join(pkg['build_requires'])
pkg['requires'] = requires
container_tag = '/'.join([pkg['namespace'], pkg['name']])
skip_build = False

client = docker.from_env()
if pkg['container_id']:
    images = client.images()
    ids = [x['Id'] for x in images]
    if pkg['container_id'] in ids:
        skip_build = True

if not skip_build:
    dockerfile = u"""
# Shared Volume
FROM %(imagename)s
VOLUME %(volume)s
RUN groupadd -r builder && useradd -r -g builder -d /build builder
ENV LC_ALL C.UTF-8
RUN set -x;apt-get update -y && \
        apt-get install -y \
        %(requires)s \
        && rm -rf /var/lib/apt/lists/*

""" % pkg

    # from io import BytesIO
    # f = BytesIO(dockerfile.encode('utf8'))
    f = tempfile.NamedTemporaryFile()
    f.write(dockerfile.encode('utf8'))
    f.seek(0)

    response = [line for line in client.build(
                fileobj=f, rm=True, tag=container_tag)]

print('\n'.join(response))
connected = r.connect("localhost", 28015).repl()
# db = r.db("test").table_create("packages").run()
cursor = r.table('packages').filter(r.row['container_id']).run()
containers = []
for pk in cursor:
    containers.append(pk['container_id'])
if pkg['container_id'] not in containers:
    result = r.table("packages").insert([pkg]).run()
    print(result)

pdb.set_trace()
