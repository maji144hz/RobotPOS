*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/purchase_order_keywords.robot
Resource   ../variables/purchase_order_variables.robot

*** Test Cases ***
TC3005 Verify Delete Purchase Order
    [Documentation]    Negative Test Case: ลบใบสั่งซื้อ
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Search And Delete PO For TC3005    ${TC3005_PO_NUMBER}
    Confirm Delete PO For TC3005