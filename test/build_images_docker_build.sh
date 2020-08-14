#!/bin/bash

# Build arch docker image
docker build -f ../.devcontainer/arch/Dockerfile -t arch_container ..

# Build ubuntu docker image
docker build -f ../.devcontainer/ubuntu/Dockerfile -t ubuntu_container ..

# Build arch docker image
docker build -f ../.devcontainer/void/Dockerfile -t void_container ..