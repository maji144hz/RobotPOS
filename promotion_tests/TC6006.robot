*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
เพิ่มโปรโมชั่น กรณีไม่เลือกวันเริ่ม-สิ้นสุด (TC6006)
    # Login
    Login Using Resource

    # เข้า Promotion Page
    Go To Promotion Page

    # เปิด Modal เพิ่มโปรโมชั่น
    Click Add Promotion Button

    # กรอกข้อมูล (ไม่เลือกวันเริ่ม-สิ้นสุด)
    Input Promotion Name Optional           ${TC6006_PROMOTION_NAME}
    Select Promotion Date Optional          start    ${TC6006_START_DAY}    ${TC6006_START_MONTH}    ${TC6006_START_YEAR}
    Select Promotion Date Optional          end      ${TC6006_END_DAY}      ${TC6006_END_MONTH}      ${TC6006_END_YEAR}
    Select Promotion Product Optional       ${TC6006_PRODUCT}
    Input Original Price                    ${TC6006_ORIGINAL_PRICE}
    Select Lot For Promotion Optional       ${TC6006_LOT_LOCATOR}
    Input Discounted Price Optional         ${TC6006_DISCOUNTED_PRICE}

    # ยืนยันและตรวจสอบข้อความแจ้งเตือน
    Submit Promotion And Check Error        ${TC6006_ERROR_MESSAGE}
