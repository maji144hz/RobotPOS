*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
# ===== Status Management =====
Login And Go To Status Page
    Login With Credentials    ${VALID_USER}    ${VALID_PASSWORD}
    Navigate To Management Menu
    Click Element    xpath=//a[contains(text(),'สถานะสินค้า')]
    Wait Until Element Is Visible    ${BTN_ADD_STATUS}

Create Status
    [Arguments]    ${name}
    Click Element    ${BTN_ADD_STATUS}
    Wait Until Element Is Visible    ${INPUT_STATUS}
    Clear Element Text    ${INPUT_STATUS}
    Input Text            ${INPUT_STATUS}    ${name}
    Click Element         ${BTN_SAVE_STATUS}
    Click If Exists       css=button.swal2-confirm
    Wait Until Element Is Not Visible    ${INPUT_STATUS}    ${TIMEOUT}

Search Status By Name
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${SEARCH_STATUS}    ${TIMEOUT}
    Clear Element Text    ${SEARCH_STATUS}
    Input Text            ${SEARCH_STATUS}    ${name}
    Press Keys            ${SEARCH_STATUS}    ENTER
    Wait Until Page Contains    ${name}    ${TIMEOUT}
