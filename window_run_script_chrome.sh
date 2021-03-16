#!/bin/bash
echo "Start running test on HeadlessChrome"
current=`dirname $0`
robot --variable BROWSER:HeadlessChrome --outputdir ${current}/report/  ${current}/tests/FilterAndAddProduct.robot
sleep 2m