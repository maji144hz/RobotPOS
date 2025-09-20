*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
แก้ไขโปรโมชั่น (TC7002)
    # Login
    Login Using Resource

    # ไปหน้าโปรโมชัน และค้นหาชื่อโปรโมชันเดิม
    Go To Promotion Page
    Search Promotion By Name      ${EDIT_PROMOTION_SEARCH}

    # เปิด modal แก้ไข
    Open Edit Promotion Modal

    # เลือกวันเริ่มและวันสิ้นสุด
    Select Edit Promotion Date        start    ${EDIT_PROMOTION_START_DAY}    ${EDIT_PROMOTION_START_MONTH}    ${EDIT_PROMOTION_START_YEAR}
    Select Edit Promotion Date        end      ${EDIT_PROMOTION_END_DAY}      ${EDIT_PROMOTION_END_MONTH}      ${EDIT_PROMOTION_END_YEAR}

    # ยืนยันและตรวจผล
    Submit Edit Promotion
