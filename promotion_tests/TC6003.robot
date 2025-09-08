*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
ลบโปรโมชั่น (TC6003)
    # Login
    Login Using Resource

    # ไปหน้าโปรโมชัน ค้นหา และเปิด modal ลบ
    Go To Promotion Page
    Search Promotion By Name      ${DELETE_PROMOTION_SEARCH}
    Open Delete Promotion Modal

    # กดยืนยันลบ
    Confirm Delete Promotion

