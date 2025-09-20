*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/purchase_order_variables.robot
Resource   ../keywords/purchase_order_keywords.robot

*** Test Cases ***
TC3007 Verify Add Product To PO Without Price
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Open Create Purchase Order Form
    Search And Add Product To PO    ${TC3007_PRODUCT}
    Fill PO Quantity TC3007          ${TC3007_QUANTITY}
    Submit PO And Verify Error TC3007    ${TC3007_PRICE}    ${TC3007_SUPPLIER}    ${TC3007_ERROR_MESSAGE}
