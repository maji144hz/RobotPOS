*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/promo_from_noti_keywords.robot
Resource   ../variables/promo_from_noti_variables.robot

*** Test Cases ***
TC2003 Create Promotion Without Lot
    [Documentation]    กรณีไม่เลือกล็อตสินค้า → ต้องเจอ error แจ้งเตือน
    Open Browser To Login Page
    Login Using Resource
    Open Notification Panel
    Filter Expiring Notifications
    Select Promotion Item
    Click Promotion Action Icon

    # --- ไม่เลือกล็อต ---
    Fill Promotion Form    ${PROMOTION_NAME}    ${PROMOTION_START_DATE}    ${PROMOTION_END_DATE}    ${PROMOTION_DISCOUNTED_PRICE}
    Click Button    id=create-promotion-submit-button

    # --- ตรวจสอบข้อความ error ---
    Wait Until Page Contains Match    กรุณาเลือกล็อต*
