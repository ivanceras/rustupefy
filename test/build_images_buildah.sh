#!/bin/bash

# Build arch docker image
buildah build-using-dockerfile -f ../.devcontainer/arch -t arch_container ..

# Build ubuntu docker image
buildah build-using-dockerfile -f ../.devcontainer/ubuntu -t arch_container ..

# Build arch docker image
buildah build-using-dockerfile -f ../.devcontainer/void -t arch_container ..