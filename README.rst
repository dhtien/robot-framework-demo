====================
Demo Web https://www.powerbuy.co.th/en/
====================

Project structure
====================================
- 'pages_object' folder: store steps for each pages
- 'report' folder: store report files after running
- 'tests' folder: store test cases

Install required
====================================

- Install Python 2.7 or higher and setup Python environment
- Install Chrome or FireFox
- On Window: Download chromedriver and geckodriver and set to path
- Run file setup.sh stored in project for setting required libraries

Running test
====================================

- You can run test on Headless Chrome by running file 'run_script_chrome.sh' that stored in project
- You can run test on FireFox by running file 'run_script_firefox.sh' that stored in project
- You can run test from terminal by using below example command on terminal
    + cd {directory of project}
    + robot --variable BROWSER:Chrome --outputdir report tests/FilterAndAddProduct.robot
    + Note: You can change 'Chrome' parameter to 'FireFox' for running test on FireFox

Generated results
====================================
- Report will be generate to 'report' folder by default or to other folder if you enter --outputdir param when running test by terminal
- You can open file 'report.html' in folder 'report' for more details

