*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/receive_product_keywords.robot
Resource   ../variables/receive_product_variables.robot

*** Test Cases ***
TC4003 การยืนยันการรับสินค้า
    [Documentation]    ทดสอบการยืนยันการรับสินค้าหลังจากอัพเดทราคาจริง
    Open Browser To Login Page
    Login Using Resource
    Go To Receive Product Page
    Go To Finished Tab
    Search And Select PO For Confirmation    ${TC4003_PO_NUMBER}
    Go To Update Delivery                    ${TC4003_UPDATE_DELIVERY_BTN}
    Update Actual Price                      ${TC4003_ACTUAL_PRICE_0}    ${TC4003_PRICE_0_VALUE}
    Update Actual Price                      ${TC4003_ACTUAL_PRICE_1}    ${TC4003_PRICE_1_VALUE}
    Save Price Update
    Verify Receipt Confirmation Success      ${TC4003_SUCCESS_MESSAGE}
