*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/purchase_order_variables.robot
Resource   ../keywords/purchase_order_keywords.robot

*** Test Cases ***
TC4004 Verify Add Product To PO Without Supplier
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Open Create Purchase Order Form
    Search And Add Product To PO    ${TC4004_PRODUCT}
    Fill PO Quantity And Price TC4004    ${TC4004_QUANTITY}    ${TC4004_PRICE}
    Submit PO And Verify Error TC4004    ${TC4004_SUPPLIER}    ${TC4004_ERROR_MESSAGE}
