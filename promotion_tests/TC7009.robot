*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
เพิ่มโปรโมชั่น กรณีไม่กรอกราคาโปรโมชั่น (TC7009)
    # Login
    Login Using Resource

    # เข้า Promotion Page
    Go To Promotion Page

    # เปิด Modal เพิ่มโปรโมชั่น
    Click Add Promotion Button

    # กรอกข้อมูล (ไม่กรอกราคาโปรโมชั่น)
    Input Promotion Name Optional           ${TC7009_PROMOTION_NAME}
    Select Promotion Date Optional          start    ${TC7009_START_DAY}    ${TC7009_START_MONTH}    ${TC7009_START_YEAR}
    Select Promotion Date Optional          end      ${TC7009_END_DAY}      ${TC7009_END_MONTH}      ${TC7009_END_YEAR}
    Select Promotion Product Optional       ${TC7009_PRODUCT}
    Input Original Price                    ${TC7009_ORIGINAL_PRICE}
    Select Lot For Promotion Optional       ${TC7009_LOT_LOCATOR}
    Input Discounted Price Optional         ${TC7009_DISCOUNTED_PRICE}

    # ยืนยันและตรวจสอบข้อความแจ้งเตือน
    Submit Promotion And Check Error        ${TC7009_ERROR_MESSAGE}
