*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/promo_from_noti_keywords.robot
Resource   ../variables/promo_from_noti_variables.robot

*** Test Cases ***
TC2001 Create Promotion From Notification
    [Documentation]    สร้างโปรโมชั่นจากการแจ้งเตือน และตรวจสอบความถูกต้อง
    Open Browser To Login Page
    Login Using Resource
    Open Notification Panel
    Filter Expiring Notifications
    Select Promotion Item
    Click Promotion Action Icon
    Fill Promotion Form
    Click Submit Promotion
