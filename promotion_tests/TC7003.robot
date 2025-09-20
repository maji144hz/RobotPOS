*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
ลบโปรโมชั่น (TC7003)
    # Login
    Login Using Resource

    # ไปหน้าโปรโมชั่น และค้นหาชื่อโปรโมชั่นที่จะลบ
    Go To Promotion Page
    Search Promotion By Name    ${DELETE_PROMOTION_SEARCH}

    # เปิด modal ลบ
    Open Delete Promotion Modal

    # ยืนยันการลบ และตรวจผล
    Confirm Delete Promotion
