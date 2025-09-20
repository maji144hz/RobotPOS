*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/receive_product_keywords.robot
Resource   ../variables/receive_product_variables.robot


*** Test Cases ***
TC4001 Verify View Receipt
    [Documentation]    ดูรายละเอียดใบรับสินค้า (ค้นหาแล้วกดปุ่มดู)
    Open Browser To Login Page
    Login Using Resource
    Go To Receive Product Page
    Search And View Receipt    ${TEST_RECEIPT_NUMBER}
    Wait Until Element Is Visible    ${DETAIL_RECEIPT_HEADER}    ${TIMEOUT}