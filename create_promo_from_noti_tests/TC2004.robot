*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/promo_from_noti_keywords.robot
Resource   ../variables/promo_from_noti_variables.robot

*** Test Cases ***
TC2004 Create Promotion Without Price
    [Documentation]    กรณีไม่กรอกราคา → ต้องเจอ error
    Open Browser To Login Page
    Login Using Resource
    Open Notification Panel
    Filter Expiring Notifications
    Select Promotion Item
    Click Promotion Action Icon
    # กรอกชื่อและวันที่ แต่ไม่กรอกราคา
    Fill Promotion Form    ${PROMOTION_NAME}    ${PROMOTION_START_DATE}    ${PROMOTION_END_DATE}    ${EMPTY}
    Click Button    id=create-promotion-submit-button
    Page Should Contain    กรุณากรอกข้อมูลให้ครบถ้วน