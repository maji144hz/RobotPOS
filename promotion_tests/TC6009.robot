*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
เพิ่มโปรโมชั่น กรณีไม่กรอกราคาโปรโมชั่น (TC6009)
    # Login
    Login Using Resource

    # เข้า Promotion Page
    Go To Promotion Page

    # เปิด Modal เพิ่มโปรโมชั่น
    Click Add Promotion Button

    # กรอกข้อมูล (ไม่กรอกราคาโปรโมชั่น)
    Input Promotion Name Optional           ${TC6009_PROMOTION_NAME}
    Select Promotion Date Optional          start    ${TC6009_START_DAY}    ${TC6009_START_MONTH}    ${TC6009_START_YEAR}
    Select Promotion Date Optional          end      ${TC6009_END_DAY}      ${TC6009_END_MONTH}      ${TC6009_END_YEAR}
    Select Promotion Product Optional       ${TC6009_PRODUCT}
    Input Original Price                    ${TC6009_ORIGINAL_PRICE}
    Select Lot For Promotion Optional       ${TC6009_LOT_LOCATOR}
    Input Discounted Price Optional         ${TC6009_DISCOUNTED_PRICE}

    # ยืนยันและตรวจสอบข้อความแจ้งเตือน
    Submit Promotion And Check Error        ${TC6009_ERROR_MESSAGE}
