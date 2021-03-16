#!/bin/bash
echo "Start running test on FireFox"
current=`dirname $0`
robot --variable BROWSER:FireFox --outputdir ${current}/report/  ${current}/tests/FilterAndAddProduct.robot
sleep 2m