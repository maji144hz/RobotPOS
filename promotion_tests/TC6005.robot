*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
เพิ่มโปรโมชั่น กรณีไม่กรอกชื่อโปรโมชั่น (TC6005)
    # Login
    Login Using Resource

    # เข้า Promotion Page
    Go To Promotion Page

    # เปิด Modal เพิ่มโปรโมชั่น
    Click Add Promotion Button

    # กรอกข้อมูล (ไม่กรอกชื่อโปรโมชั่น)
    Input Promotion Name Optional           ${TC6005_PROMOTION_NAME}
    Select Promotion Date Optional          start    ${TC6005_START_DAY}    ${TC6005_START_MONTH}    ${TC6005_START_YEAR}
    Select Promotion Date Optional          end      ${TC6005_END_DAY}      ${TC6005_END_MONTH}      ${TC6005_END_YEAR}
    Select Promotion Product Optional       ${TC6005_PRODUCT}
    Input Original Price                    ${TC6005_ORIGINAL_PRICE}
    Select Lot For Promotion Optional       ${TC6005_LOT_LOCATOR}
    Input Discounted Price Optional         ${TC6005_DISCOUNTED_PRICE}

    # ยืนยันและตรวจสอบข้อความแจ้งเตือน
    Submit Promotion And Check Error        ${TC6005_ERROR_MESSAGE}
