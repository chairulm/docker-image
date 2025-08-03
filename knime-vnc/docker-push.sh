#!/bin/bash

VERSION=$(cat VERSION)
MAJOR_MINOR=$(echo "$VERSION" | cut -d. -f1,2)

docker push chairulfm/knime-vnc:$VERSION
docker push chairulfm/knime-vnc:$MAJOR_MINOR
docker push chairulfm/knime-vnc:latest
