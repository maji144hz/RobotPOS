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

# ===== Action: View Receipt =====
Search And View Receipt
    [Arguments]    ${receipt_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${receipt_number}
    Sleep    2s
    Wait Until Element Is Visible    ${VIEW_RECEIPT_BUTTON}    ${TIMEOUT}
    Click Element                    ${VIEW_RECEIPT_BUTTON}
    Sleep    3s    # รอหน้าแสดงรายละเอียดโหลดให้ครบ
