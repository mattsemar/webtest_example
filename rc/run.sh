#!/bin/bash

export DYLD_LIBRARY_PATH=/usr/lib

java -jar selenium-server.jar  -firefoxProfileTemplate ./selenium-ff-profile

