*** Settings ***
Documentation     Test product filter and add to card feature.
Library           SeleniumLibrary

*** Keywords ***
Click on button Add To Card
    Wait Until Element Is Enabled   xpath://button[./span[text()='Add to Cart']]        timeout=20s
    Wait Until Element Is Visible   xpath://button[./span[text()='Add to Cart']]        timeout=20s
    Click Element    xpath://button[./span[text()='Add to Cart']]

Verify message added product successfully shows
    [Arguments]     ${product_name}
    Wait Until Element Is Visible   xpath://div[@type='success' and .//span[text()='You added ${product_name} to your shopping cart.']]     timeout=20s


Press on button View Card
    Wait Until Element Is Enabled   xpath://button[text()='VIEW CART']      timeout=20s
    Wait Until Element Is Visible   xpath://button[text()='VIEW CART']      timeout=20s
    Click Element    xpath://button[text()='VIEW CART']
    Wait Until Page Does Not Contain Element       //img[contains(@class,'lazyloaded') and @data-testid='img-loading']      timeout=20s
