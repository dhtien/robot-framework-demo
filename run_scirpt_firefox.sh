#!/bin/bash
echo "Start running test on FireFox"
current=${0%/*}
robot --variable BROWSER:FireFox --outputdir report/  ${current}/tests/FilterAndAddProduct.robot