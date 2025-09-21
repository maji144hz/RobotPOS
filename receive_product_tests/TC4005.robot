*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/receive_product_keywords.robot
Resource   ../variables/receive_product_variables.robot

*** Test Cases ***
TC4005 กรณีไม่กรอกจำนวนที่ส่งมอบ
    [Documentation]    ทดสอบกรณีไม่กรอกจำนวนที่ส่งมอบ - ควรแสดง error message
    Open Browser To Login Page
    Login Using Resource
    Go To Receive Product Page
    Search And Select PO For TC4005    ${TC4005_PO_NUMBER}
    Go To Update Delivery For TC4005   ${TC4005_UPDATE_DELIVERY_BTN}
    Update Only Actual Price For TC4005    ${TC4003_ACTUAL_PRICE_0}    ${TC4003_PRICE_0_VALUE}
    Update Only Actual Price For TC4005    ${TC4003_ACTUAL_PRICE_1}    ${TC4003_PRICE_1_VALUE}
    Save Price Update And Verify Error TC4005    ${TC4005_ERROR_MESSAGE}
