*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/notification_keywords.robot
Resource   ../variables/notification_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC5002_การแจ้งเตือนสินค้าหมดอายุและตัดจำหน่าย
    [Documentation]    ตรวจสอบการดูการแจ้งเตือนสินค้าหมดอายุและดำเนินการตัดจำหน่ายตามสเปก
    [Tags]    TC5002    Notification    Expired    Disposal

    # Login
    Input Username    ${NOTIFICATION_USERNAME}
    Input Password    ${NOTIFICATION_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

    # เปิดหน้าต่างการแจ้งเตือน
    Click Notification Bell Icon
    Verify Notification Window Is Displayed

    # เลือกแท็บ/กรอง "หมดอายุ"
    Filter Expired Notifications

    # เลือกรายการแรก และกดปุ่มตัดจำหน่าย
    Select First Notification For Disposal

    # ยืนยันตัดจำหน่าย และตรวจข้อความสำเร็จ
    Confirm Disposal
    Verify Disposal Success
