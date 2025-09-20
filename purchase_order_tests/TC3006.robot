*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/purchase_order_variables.robot
Resource   ../keywords/purchase_order_keywords.robot

*** Test Cases ***
TC3006 Verify Add Product To PO Without Supplier
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Open Create Purchase Order Form
    Search And Add Product To PO    ${TC3006_PRODUCT}
    Fill PO Quantity And Price TC3006    ${TC3006_QUANTITY}    ${TC3006_PRICE}
    Submit PO And Verify Error TC3006    ${TC3006_SUPPLIER}    ${TC3006_ERROR_MESSAGE}
