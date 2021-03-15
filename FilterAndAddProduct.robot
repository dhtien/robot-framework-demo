*** Settings ***
Documentation     Test product filter and add to card feature.
Library           SeleniumLibrary

*** Variables ***
${HOME_PAGE_URL}      https://www.powerbuy.co.th/en/
${BROWSER}        Chrome
${TITLE}          \#1 Powerbuy© - ช้อปแบรนด์ดัง! สินค้าของแท้ 100% รับประกันการจัดส่ง
${PRODUCT_NAME_1}     TV UHD LED 2020 (55\",4K,Smart) 55UN7200PTF\.ATM
${PRODUCT_NAME_2}     TV HD LED (32\") 32LM550BPTA\.ATM

*** Test Cases ***
User can filter product with multiple filter and add to card
    Open Browser To Home Page
    Enter Text For Searching    TV
    Select Filter With       Screen Size Group (inches)     44 - 55 inches
    Click on product name       ${PRODUCT_NAME_1}
    Click on button Add To Card
    Verify message added product successfully shows     ${PRODUCT_NAME_1}
    Go back to previous page
    Unselect Filter With        Screen Size Group (inches)     44 - 55 inches
    Select filter with       Screen Size Group (inches)     32 - 43 inches
    Click on product name       ${PRODUCT_NAME_2}
    Click on button Add To Card
    Verify message added product successfully shows     ${PRODUCT_NAME_2}
    Press on button View Card
    Verify all products are added to card       ${PRODUCT_NAME_1}       ${PRODUCT_NAME_2}
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Home Page
    Open Browser    None     ${BROWSER}
    Maximize Browser Window
    Go To    ${HOME_PAGE_URL}
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

Click on button Add To Card
    Wait Until Element Is Enabled   xpath://button[./span[text()='Add to Cart']]        timeout=20s
    Wait Until Element Is Visible   xpath://button[./span[text()='Add to Cart']]        timeout=20s
    Click Element    xpath://button[./span[text()='Add to Cart']]

Verify message added product successfully shows
    [Arguments]     ${product_name}
    Wait Until Element Is Visible   xpath://div[@type='success' and .//span[text()='You added ${product_name} to your shopping cart.']]     timeout=20s

Go back to previous page
    Go Back
    Wait Until Page Does Not Contain Element       //img[contains(@class,'lazyloaded') and @data-testid='img-loading']      timeout=20s

Press on button View Card
    Wait Until Element Is Enabled   xpath://button[text()='VIEW CART']      timeout=20s
    Wait Until Element Is Visible   xpath://button[text()='VIEW CART']      timeout=20s
    Click Element    xpath://button[text()='VIEW CART']
    Wait Until Page Does Not Contain Element       //img[contains(@class,'lazyloaded') and @data-testid='img-loading']      timeout=20s

Verify all products are added to card
    [Arguments]     ${product_name}     ${product_name_2}
    Wait Until Element Is Visible   xpath://div[contains(@class,'CartItems') and @data-product-name='${product_name}']      timeout=20s
    Element Should Be Visible   xpath://div[contains(@class,'CartItems') and @data-product-name='${product_name}']      timeout=20s
    Wait Until Element Is Visible   xpath://div[contains(@class,'CartItems') and @data-product-name='${product_name_2}']      timeout=20s
    Element Should Be Visible   xpath://div[contains(@class,'CartItems') and @data-product-name='${product_name_2}']      timeout=20s
