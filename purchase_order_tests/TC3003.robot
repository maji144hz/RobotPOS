*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/purchase_order_keywords.robot
Resource   ../variables/purchase_order_variables.robot

*** Test Cases ***
TC3003 Verify Edit Purchase Order Price
    [Documentation]    Negative Test Case: แก้ไขราคาซื้อ
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Search And Open PO For TC3003    ${TC3003_PO_NUMBER}
    Fill Edited PO Price For TC3003  ${TC3003EDIT_PRICE}
    Submit Edited PO And Verify For TC3003