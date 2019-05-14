#!/bin/bash
docker build -t tox -f tox.Dockerfile .
docker run tox
