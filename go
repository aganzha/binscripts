#!/bin/bash

docker run --rm -it -v "$PWD":/usr/src/ aganzha/golang go "$@"