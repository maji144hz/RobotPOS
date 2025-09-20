*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/promo_from_noti_keywords.robot
Resource   ../variables/promo_from_noti_variables.robot

*** Test Cases ***
TC6002 Create Promotion Without Dates
    [Documentation]    กรณีไม่กรอกวันที่ → ต้องเจอ error
    Open Browser To Login Page
    Login Using Resource
    Open Notification Panel
    Filter Expiring Notifications
    Select Promotion Item
    Click Promotion Action Icon
    # กรอกชื่อกับราคาปกติ แต่ไม่กรอกวันที่
    Fill Promotion Form    ${PROMOTION_NAME}    ${EMPTY}    ${EMPTY}    ${PROMOTION_DISCOUNTED_PRICE}
    Click Button    id=create-promotion-submit-button
    Page Should Contain    กรุณากรอกข้อมูลให้ครบถ้วน