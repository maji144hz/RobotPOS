*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/purchase_order_keywords.robot
Resource   ../variables/purchase_order_variables.robot


*** Test Cases ***
TC3002 Verify Edit Purchase Order
    [Documentation]    แก้ไขใบสั่งซื้อ: จำนวน 7
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Search And Open Purchase Order    ${PO_NUMBER}
    Fill Edited PO Quantity           ${EDIT_QUANTITY}
    Submit Edited PO And Verify