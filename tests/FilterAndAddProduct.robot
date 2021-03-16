*** Settings ***
Documentation     Test product filter and add to card feature.
Library           SeleniumLibrary
Resource          ../pages_object/BasePage.robot
Resource          ../pages_object/HomePage.robot
Resource          ../pages_object/ProductDetailsPage.robot
Resource          ../pages_object/ViewCardPage.robot

*** Variables ***
${PRODUCT_NAME_1}     TV UHD LED 2020 (55\",4K,Smart) 55UN7200PTF\.ATM
${PRODUCT_NAME_2}     TV FHD LED 2020 (43",Smart) 43LN5600PTA

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
