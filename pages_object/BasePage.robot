*** Settings ***
Documentation     Test product filter and add to card feature.
Library           SeleniumLibrary

*** Keywords ***
Go back to previous page
    Go Back
    Wait Until Page Does Not Contain Element       //img[contains(@class,'lazyloaded') and @data-testid='img-loading']      timeout=20s
