#!/bin/bash
echo "Start running test"
current=${0%/*}
robot --variable BROWSER:Chrome $current/tests/FilterAndAddProduct.robot