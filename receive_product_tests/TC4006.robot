*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/receive_product_keywords.robot
Resource   ../variables/receive_product_variables.robot

*** Test Cases ***
TC4006 กรณีไม่กรอกราคาจริงต่อหน่วย
    [Documentation]    ทดสอบกรณีไม่กรอกราคาจริงต่อหน่วย - ควรแสดง error message
    Open Browser To Login Page
    Login Using Resource
    Go To Receive Product Page
    Search And Select PO For TC4006    ${TC4006_PO_NUMBER}
    Go To Update Delivery For TC4006   ${TC4006_UPDATE_DELIVERY_BTN}
    Update Delivered Quantity And Price For TC4006    ${DELIVERED_0}    5    ${TC4006_ACTUAL_PRICE_0}    ${TC4006_PRICE_0_VALUE}
    Save Update And Verify Error TC4006    ${TC4006_UPDATE_AND_RECEIVE_BTN}    ${TC4006_ERROR_MESSAGE}
