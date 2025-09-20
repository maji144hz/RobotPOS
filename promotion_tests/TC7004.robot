*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
ปริ้นบาร์โค้ดโปรโมชั่นทั้งหมด (TC7004)
    # Login
    Login Using Resource

    # ไปหน้าโปรโมชัน แล้วเปิดหน้าตั้งค่าปริ้น
    Go To Promotion Page
    Open Print Promotions Modal

    # ตั้งค่าตามสเปก และเริ่มพิมพ์
    Configure Print Options    ${PRINT_PAGE_COUNT}    ${PRINT_PER_PAGE}    ${PRINT_LAYOUT_SUMMARY}    ${PRINT_INCLUDE_ACTIVE}    ${PRINT_INCLUDE_EXPIRED}
    Submit Print Promotions

