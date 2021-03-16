#!/bin/bash
echo "Start running test on Chrome"
current=${0%/*}
robot --variable BROWSER:Chrome --outputdir ${current}/report/  ${current}/tests/FilterAndAddProduct.robot