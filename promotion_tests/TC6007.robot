*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
เพิ่มโปรโมชั่น กรณีไม่เลือกสินค้า (TC6007)
    # Login
    Login Using Resource

    # เข้า Promotion Page
    Go To Promotion Page

    # เปิด Modal เพิ่มโปรโมชั่น
    Click Add Promotion Button

    # กรอกข้อมูล (ไม่เลือกสินค้า)
    Input Promotion Name Optional           ${TC6007_PROMOTION_NAME}
    Select Promotion Date Optional          start    ${TC6007_START_DAY}    ${TC6007_START_MONTH}    ${TC6007_START_YEAR}
    Select Promotion Date Optional          end      ${TC6007_END_DAY}      ${TC6007_END_MONTH}      ${TC6007_END_YEAR}
    Select Promotion Product Optional       ${TC6007_PRODUCT}
    Input Original Price                    ${TC6007_ORIGINAL_PRICE}
    Select Lot For Promotion Optional       ${TC6007_LOT_LOCATOR}
    Input Discounted Price Optional         ${TC6007_DISCOUNTED_PRICE}

    # ยืนยันและตรวจสอบข้อความแจ้งเตือน
    Submit Promotion And Check Error        ${TC6007_ERROR_MESSAGE}
