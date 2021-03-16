#!/bin/bash
echo "Start install required libraries"
pip install robotframework
pip install --upgrade robotframework-seleniumlibrary
pip install webdrivermanager
webdrivermanager firefox chrome --linkpath /usr/local/bin