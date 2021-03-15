====================
Robot Framework Demo
====================

Install required for running on Mac
====================================

- Install python 2.7
- Install   robotframework by using command: 'pip install robotframework'
- Install robotframework-seleniumlibrary by using command: 'pip install --upgrade robotframework-seleniumlibrary'
- Install browser driver by using command:
        pip install webdrivermanager
        webdrivermanager firefox chrome --linkpath /usr/local/bin

Running test on Mac
====================================

- New terminal at this project folder
- Run test on chrome by using command: 'robot --variable BROWSER:Chrome FilterAndAddProduct.robot'
- Run test on firefox by using command: 'robot --variable BROWSER:FireFox FilterAndAddProduct.robot'

Generated results
====================================
Open file report.html in browser for opening report


