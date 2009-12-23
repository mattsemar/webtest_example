#!/bin/bash

export DYLD_LIBRARY_PATH=/usr/lib
export PATH=/Applications/Firefox.app/Contents/MacOS:$PATH

java -jar selenium-server.jar  

