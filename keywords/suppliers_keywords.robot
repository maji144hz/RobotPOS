*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
# ===== Suppliers Management =====
Login And Go To Suppliers Page
    Login With Credentials    ${VALID_USER}    ${VALID_PASSWORD}
    Navigate To Management Menu
    Click Element    xpath=//a[contains(text(),'จัดการซัพพลายเออร์')]
    Wait Until Element Is Visible    ${BTN_ADD_SUPPLIER}

Create Supplier Full Form
    [Arguments]    ${name}    ${contact}    ${phone}    ${address}
    Wait Until Element Is Visible    ${INPUT_SUPPLIER_NAME}    ${TIMEOUT}
    Clear Element Text               ${INPUT_SUPPLIER_NAME}
    Input Text                       ${INPUT_SUPPLIER_NAME}    ${name}

    Wait Until Element Is Visible    ${INPUT_SUPPLIER_CONTACT}    ${TIMEOUT}
    Clear Element Text               ${INPUT_SUPPLIER_CONTACT}
    Input Text                       ${INPUT_SUPPLIER_CONTACT}    ${contact}

    Wait Until Element Is Visible    ${INPUT_SUPPLIER_PHONE}    ${TIMEOUT}
    Clear Element Text               ${INPUT_SUPPLIER_PHONE}
    Input Text                       ${INPUT_SUPPLIER_PHONE}    ${phone}

    Wait Until Element Is Visible    ${INPUT_SUPPLIER_ADDRESS}    ${TIMEOUT}
    Clear Element Text               ${INPUT_SUPPLIER_ADDRESS}
    Input Text                       ${INPUT_SUPPLIER_ADDRESS}    ${address}

    Click Element                    ${BTN_SAVE_SUPPLIER}
    Click If Exists                  ${SWAL_CONFIRM}
    Wait Until Element Is Not Visible    ${INPUT_SUPPLIER_NAME}    ${TIMEOUT}

Search Supplier By Name
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${SEARCH_SUPPLIER}    ${TIMEOUT}
    Clear Element Text               ${SEARCH_SUPPLIER}
    Input Text                       ${SEARCH_SUPPLIER}    ${name}
    Press Keys                       ${SEARCH_SUPPLIER}    ENTER
    Wait Table Idle
    Wait Until Page Contains         ${name}    ${TIMEOUT}

Screenshot Latest Supplier Row
    [Arguments]    ${name}
    ${ROW}=    Set Variable    xpath=(//tr[.//*[self::td or self::span or self::div][contains(normalize-space(.),"${name}")]])[1]
    Wait Until Element Is Visible    ${ROW}    ${TIMEOUT}
    Scroll Element Into View         ${ROW}
    Create Directory If Not Exists    ${SCREEN_DIR}
    Capture Element Screenshot    ${ROW}    ${SCREEN_DIR}${/}latest_supplier.png
