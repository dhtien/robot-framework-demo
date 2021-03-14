*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://www.powerbuy.co.th/en/
${BROWSER}        Chrome
${TITLE}          \#1 Powerbuy© - ช้อปแบรนด์ดัง! สินค้าของแท้ 100% รับประกันการจัดส่ง

*** Test Cases ***
Valid Login
    Open Browser To Home Page
    Input Text For Searching    TV

    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    ${TITLE}

Input Text For Searching
    [Arguments]    ${text}
    Input Text    txt-searchBox-input    ${text}
    Press Keys      txt-searchBox-input     ENTER

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}
