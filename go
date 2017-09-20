#!/bin/bash

docker run --rm -i -v "$PWD":/usr/src/ aganzha/golang go "$@"
