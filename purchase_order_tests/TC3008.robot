*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/purchase_order_variables.robot
Resource   ../keywords/purchase_order_keywords.robot

*** Test Cases ***
TC3008 View Purchase Order Details
    [Documentation]    Negative Test: ดูรายละเอียดใบสั่งซื้อ PO #${TC3008_PO_NUMBER}
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Search And View PO For TC3008    ${TC3008_PO_NUMBER}    ${TC3008_PO_ID}
    # สามารถเพิ่ม Assert ตรวจสอบหน้าใบสั่งได้ เช่น
    # Page Should Contain Element    xpath=//h1[contains(text(),'รายละเอียดใบสั่งซื้อ')]