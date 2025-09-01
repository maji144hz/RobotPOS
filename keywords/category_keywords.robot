*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
# ===== Category Management =====
Login And Go To Category Page
    Login With Credentials    ${VALID_USER}    ${VALID_PASSWORD}
    Navigate To Management Menu
    Click Element    xpath=//a[contains(text(),'ประเภทสินค้า')]
    Wait Until Element Is Visible    ${BTN_ADD_CATEGORY}

Create Category
    [Arguments]    ${name}
    Click Element    ${BTN_ADD_CATEGORY}
    Wait Until Element Is Visible    ${INPUT_CATEGORY}
    Clear Element Text    ${INPUT_CATEGORY}
    Input Text            ${INPUT_CATEGORY}    ${name}
    Click Element         ${BTN_SAVE}
    Click If Exists       css=button.swal2-confirm
    Wait Until Element Is Not Visible    ${INPUT_CATEGORY}    ${TIMEOUT}

Search Category By Name
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${SEARCH_CATEGORY}    ${TIMEOUT}
    Clear Element Text    ${SEARCH_CATEGORY}
    Input Text            ${SEARCH_CATEGORY}    ${name}
    Press Keys            ${SEARCH_CATEGORY}    ENTER
    Wait Until Page Contains    ${name}    ${TIMEOUT}

Screenshot Latest Category Row
    [Arguments]    ${name}
    ${ROW}=    Set Variable    xpath=(//tr[.//*[self::td or self::span or self::div][contains(normalize-space(.),"${name}")]])[1]
    Wait Until Element Is Visible    ${ROW}    ${TIMEOUT}
    Scroll Element Into View         ${ROW}
    Create Directory If Not Exists    ${SCREEN_DIR}
    Capture Element Screenshot    ${ROW}    ${SCREEN_DIR}${/}latest_category.png
