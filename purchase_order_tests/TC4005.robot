*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/purchase_order_variables.robot
Resource   ../keywords/purchase_order_keywords.robot

*** Test Cases ***
TC4005 Verify Add Product To PO Without Price
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Open Create Purchase Order Form
    Search And Add Product To PO    ${TC4005_PRODUCT}
    Fill PO Quantity TC4005          ${TC4005_QUANTITY}
    Submit PO And Verify Error TC4005    ${TC4005_PRICE}    ${TC4005_SUPPLIER}    ${TC4005_ERROR_MESSAGE}
