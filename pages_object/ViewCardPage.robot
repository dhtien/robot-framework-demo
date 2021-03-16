*** Settings ***
Documentation     Test product filter and add to card feature.
Library           SeleniumLibrary

*** Keywords ***
Verify all products are added to card
    [Arguments]     ${product_name}     ${product_name_2}
    Wait Until Element Is Visible   xpath://div[contains(@class,'CartItems') and @data-product-name='${product_name}']      timeout=20s
    Element Should Be Visible   xpath://div[contains(@class,'CartItems') and @data-product-name='${product_name}']      timeout=20s
    Wait Until Element Is Visible   xpath://div[contains(@class,'CartItems') and @data-product-name='${product_name_2}']      timeout=20s
    Element Should Be Visible   xpath://div[contains(@class,'CartItems') and @data-product-name='${product_name_2}']      timeout=20s
