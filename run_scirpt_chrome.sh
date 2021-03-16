#!/bin/bash
echo "Start running test on Chrome"
current=${0%/*}
robot --variable BROWSER:Chrome --outputdir report/  ${current}/tests/FilterAndAddProduct.robot