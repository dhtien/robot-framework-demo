*** Settings ***
Documentation     Test product filter and add to card feature.
Library           SeleniumLibrary

*** Variables ***
${TITLE}          \#1 Powerbuy© - ช้อปแบรนด์ดัง! สินค้าของแท้ 100% รับประกันการจัดส่ง
${HOME_PAGE_URL}      https://www.powerbuy.co.th/en/
${BROWSER}        Chrome

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${HOME_PAGE_URL}     ${BROWSER}
    Maximize Browser Window
    Title Should Be    ${TITLE}


Enter Text For Searching
    [Arguments]    ${text}
    Input Text    xpath://*[@id='txt-searchBox-input']    ${text}
    Press Keys      txt-searchBox-input     ENTER
    Wait Until Page Does Not Contain Element       //img[contains(@class,'lazyloaded') and @data-testid='img-loading']        timeout=20s

Select Filter With
    [Arguments]     ${filter_group}     ${value}
    Wait Until Element Is Enabled   xpath://div[@title='${filter_group}']//div[.//div[text()='${value}'] and contains(@class,'Row')]//div[contains(@class,'Checkbox')]      timeout=20s
    Wait Until Element Is Visible   xpath://div[@title='${filter_group}']//div[.//div[text()='${value}'] and contains(@class,'Row')]//div[contains(@class,'Checkbox')]      timeout=20s
    Click Element    xpath://div[@title='${filter_group}']//div[.//div[text()='${value}'] and contains(@class,'Row')]//div[contains(@class,'Checkbox')]
    Wait Until Page Does Not Contain Element        //img[contains(@class,'lazyloaded') and @data-testid='img-loading']     timeout=20s


Unselect Filter With
    [Arguments]     ${filter_group}     ${value}
    Wait Until Element Is Enabled   xpath://div[@title='${filter_group}']//div[.//div[text()='${value}'] and contains(@class,'Row')]//div[contains(@class,'Checkbox')]      timeout=20s
    Wait Until Element Is Visible   xpath://div[@title='${filter_group}']//div[.//div[text()='${value}'] and contains(@class,'Row')]//div[contains(@class,'Checkbox')]      timeout=20s
    Click Element    xpath://div[@title='${filter_group}']//div[.//div[text()='${value}'] and contains(@class,'Row')]//div[contains(@class,'Checkbox')]
    Wait Until Page Does Not Contain Element        //img[contains(@class,'lazyloaded') and @data-testid='img-loading']     timeout=20s


Click on product name
    [Arguments]     ${product_name}
    Wait Until Element Is Enabled   xpath://div[contains(@id,'productGrid')]//span[contains(@id,'product') and contains(text(),'${product_name}')]        timeout=20s
    Wait Until Element Is Visible   xpath://div[contains(@id,'productGrid')]//span[contains(@id,'product') and contains(text(),'${product_name}')]        timeout=20s
    Wait Until Page Does Not Contain Element        //img[contains(@class,'lazyloaded') and @data-testid='img-loading']     timeout=20s
    Sleep    4s
    Click Element    xpath://div[contains(@id,'productGrid')]//span[contains(@id,'product') and contains(text(),'${product_name}')]
