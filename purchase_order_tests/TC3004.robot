*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/purchase_order_keywords.robot
Resource   ../variables/purchase_order_variables.robot

*** Test Cases ***
TC3004 Verify Edit Purchase Order Supplier
    [Documentation]    Negative Test Case: แก้ไขซัพพลายเออร์
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Search And Open PO For TC3004    ${TC3004_PO_NUMBER}
    Select Edited PO Supplier For TC3004    ${TC3004EDIT_SUPPLIER}
    Submit Edited PO And Verify For TC3004