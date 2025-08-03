#!/bin/bash

VERSION=$(cat VERSION)
MAJOR_MINOR=$(echo "$VERSION" | cut -d. -f1,2)

docker build -t chairulfm/knime-vnc:$VERSION \
             -t chairulfm/knime-vnc:$MAJOR_MINOR \
             -t chairulfm/knime-vnc:latest .
