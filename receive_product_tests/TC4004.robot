*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/receive_product_keywords.robot
Resource   ../variables/receive_product_variables.robot

*** Test Cases ***
TC4004 การลบใบรับสินค้า
    [Documentation]    ทดสอบการลบใบรับสินค้าตามเลขใบสั่งของ
    Open Browser To Login Page
    Login Using Resource
    Go To Receive Product Page
    Search And Select PO For Deletion    ${TC4004_PO_NUMBER}
    Click Delete Receipt Button          ${TC4004_DELETE_BUTTON}
    Confirm Delete Receipt               ${TC4004_CONFIRM_DELETE_BTN}
    Verify Delete Success                ${TC4004_DELETE_SUCCESS_MSG}
