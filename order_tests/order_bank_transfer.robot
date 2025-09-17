*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers
Test Setup        Login Using Resource

Resource          ../variables/common_variables.robot
Resource          ../variables/variables.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/products_keywords.robot
Resource          ../keywords/order_sell_keywords.robot

*** Variables ***
${PRODUCT_NAME}        ขนมปังฟาร์มเฮ้าส์โฮลวีท 65 กรัม
${PRODUCT_NAME_2}      โค้กกระป๋อง 325 มล

*** Test Cases ***
ขายสินค้า - โอนเงินผ่านธนาคาร
    Create Directory    ${SCREEN_DIR}
    Ensure On Order Sell Page
    Ensure Cart Open
    Try Filter Product By Name    ${PRODUCT_NAME}
    Add Product To Cart By Name    ${PRODUCT_NAME}
    Try Filter Product By Name    ${PRODUCT_NAME_2}
    Add Product To Cart By Name    ${PRODUCT_NAME_2}
    Proceed To Checkout
    Click Element    ${BTN_PAYMENT_BANK}
    Sleep    5s
    Capture Page Screenshot    ${SCREEN_DIR}${/}order_bank.png
    Click If Exists    ${SWAL_CONFIRM}


