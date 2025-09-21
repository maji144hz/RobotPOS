*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/receive_product_keywords.robot
Resource   ../variables/receive_product_variables.robot

*** Test Cases ***
TC4002 การอัพเดทข้อมูลและรับสินค้า
    [Documentation]    ทดสอบการค้นหา PO และอัพเดทการรับสินค้า
    Open Browser To Login Page
    Login Using Resource
    Go To Receive Product Page
    Search And Select Purchase Order    ${TEST_PO}
    Update Delivery Item    ${DELIVERED_0}    5    ${EXPIRATION_0}    30/01/2026
    Update Delivery Item    ${DELIVERED_1}    4    ${EXPIRATION_1}    30/01/2026
    Confirm Update Delivery