*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/notification_keywords.robot
Resource   ../variables/notification_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC5003_การดูการแจ้งเตือนใกล้หมดอายุ
    [Documentation]    ตรวจสอบว่าสามารถดูรายการแจ้งเตือนแท็บ "ใกล้หมดอายุ" ได้
    [Tags]    TC5003    Notification    Expiring

    # Login
    Input Username    ${NOTIFICATION_USERNAME}
    Input Password    ${NOTIFICATION_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

    # เปิดหน้าต่างการแจ้งเตือน
    Click Notification Bell Icon
    Verify Notification Window Is Displayed

    # เลือกแท็บ/ฟิลเตอร์ "ใกล้หมดอายุ" และตรวจว่าถูกเลือก
    Filter Expiring Notifications
    Verify Expiring Tab Visible

    # มีรายการแจ้งเตือนปรากฏ
    Verify Notification Items Are Present
