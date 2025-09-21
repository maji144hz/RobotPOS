*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/receive_product_variables.robot

*** Keywords ***
# ===== Browser & Login =====
Open Browser To Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=input[name="username"]    ${TIMEOUT}

Login Using Resource
    Input Username     ${VALID_USER}
    Input Password     ${VALID_PASSWORD}
    Submit Credentials
    Sleep    1s    # รอให้ระบบโหลดหลัง login

Go To Login Page
    Go To    ${BASE_URL}/
    Wait Until Element Is Visible    css=input[name='username']    ${TIMEOUT}
    Wait Until Element Is Visible    css=input[name='password']    ${TIMEOUT}
    Wait Until Element Is Visible    css=button[type='submit']     ${TIMEOUT}

Input Username
    [Arguments]    ${username}
    Input Text    css=input[name='username']    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    css=input[name='password']    ${password}

Submit Credentials
    Click Button    css=button[type='submit']

# ===== Navigation =====
Go To Receive Product Page
    Wait Until Element Is Visible    ${BTN_MANAGE}    ${TIMEOUT}
    Click Element                    ${BTN_MANAGE}
    Wait Until Element Is Visible    ${BTN_RECEIVE}   ${TIMEOUT}
    Click Element                    ${BTN_RECEIVE}

# ===== 4001: ดูรายละเอียดใบรับสินค้า =====
Search And View Receipt
    [Arguments]    ${receipt_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${receipt_number}
    Sleep    2s
    Wait Until Element Is Visible    ${VIEW_RECEIPT_BUTTON}    ${TIMEOUT}
    Click Element                    ${VIEW_RECEIPT_BUTTON}
    Sleep    2s    # รอหน้าแสดงรายละเอียดโหลด

# ===== 4002: อัพเดทและรับสินค้า =====
Search And Select Purchase Order
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${po_number}
    Sleep    3s    # เพิ่มเวลาให้ระบบแสดงรายการ PO
    Wait Until Element Is Visible    xpath=//*[text()='${po_number}']    ${TIMEOUT}
    Sleep    1s    # รอให้ element โผล่เต็มที่
    Click Element                    xpath=//*[text()='${po_number}']
    Sleep    1s
    Wait Until Element Is Visible    ${BTN_UPDATE_DELIVERY}    ${TIMEOUT}
    Click Button                     ${BTN_UPDATE_DELIVERY}
    Sleep    1s    # รอ form แสดง

Update Delivery Item
    [Arguments]    ${delivered_locator}    ${delivered_qty}    ${expiration_locator}    ${expiration_date}
    Wait Until Element Is Visible    ${delivered_locator}    ${TIMEOUT}
    Sleep    1s
    Clear Element Text    ${delivered_locator}
    Input Text            ${delivered_locator}    ${delivered_qty}
    Sleep    0.5s

    Wait Until Element Is Visible    ${expiration_locator}    ${TIMEOUT}
    Sleep    1s
    Clear Element Text    ${expiration_locator}
    Input Text            ${expiration_locator}    ${expiration_date}
    Sleep    0.5s

Confirm Update Delivery
    Wait Until Element Is Visible    ${BTN_CONFIRM_UPDATE}    ${TIMEOUT}
    Sleep    1s
    Click Button                     ${BTN_CONFIRM_UPDATE}
    Sleep    2s


