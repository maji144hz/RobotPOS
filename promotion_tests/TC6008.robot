*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
เพิ่มโปรโมชั่น กรณีไม่เลือกล็อตสินค้า (TC6008)
    # Login
    Login Using Resource

    # เข้า Promotion Page
    Go To Promotion Page

    # เปิด Modal เพิ่มโปรโมชั่น
    Click Add Promotion Button

    # กรอกข้อมูล (ไม่เลือกล็อตสินค้า)
    Input Promotion Name Optional           ${TC6008_PROMOTION_NAME}
    Select Promotion Date Optional          start    ${TC6008_START_DAY}    ${TC6008_START_MONTH}    ${TC6008_START_YEAR}
    Select Promotion Date Optional          end      ${TC6008_END_DAY}      ${TC6008_END_MONTH}      ${TC6008_END_YEAR}
    Select Promotion Product Optional       ${TC6008_PRODUCT}
    Input Original Price                    ${TC6008_ORIGINAL_PRICE}
    Select Lot For Promotion Optional       ${TC6008_LOT_LOCATOR}
    Input Discounted Price Optional         ${TC6008_DISCOUNTED_PRICE}

    # ยืนยันและตรวจสอบข้อความแจ้งเตือน
    Submit Promotion And Check Error        ${TC6008_ERROR_MESSAGE}
