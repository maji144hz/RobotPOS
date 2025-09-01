*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
# ===== Products Login & Navigation =====
Login Using Resource
    Go To Login Page
    Input Username     ${VALID_USER}
    Input Password     ${VALID_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Sleep    0.2s

Go To Login Page
    Go To    ${BASE_URL}/
    Wait Until Page Contains Element    css=input[name='username']
    Wait Until Page Contains Element    css=input[name='password']
    Wait Until Page Contains Element    css=button[type='submit']

Input Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    css=input[name='username']
    Input Text    css=input[name='username']    ${username}

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    css=input[name='password']
    Input Text    css=input[name='password']    ${password}

Submit Credentials
    Wait Until Element Is Visible    css=button[type='submit']
    Click Button    css=button[type='submit']

Welcome Page Should Be Open
    Sleep    2s
    Wait Until Page Contains Element    xpath=//span[contains(text(),'จัดการ')]    ${TIMEOUT}
    Wait Until Page Contains Element    xpath=//span[contains(text(),'ตั้งค่า')]    ${TIMEOUT}

# ===== Products Management =====
Type
    [Arguments]    ${locator}    ${text}
    Should Not Be Empty    ${locator}    Locator ว่าง: ตรวจสอบตัวแปร locator/ไฟล์ variables.robot
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Clear Element Text               ${locator}
    Input Text    locator=${locator}    text=${text}

Get First Present Locator
    [Arguments]    @{locators}
    FOR    ${loc}    IN    @{locators}
        ${ok}=    Run Keyword And Return Status    Page Should Contain Element    ${loc}
        IF    ${ok}    RETURN    ${loc}
    END
    Fail    ไม่พบ input[type=file] สำหรับอัปโหลดรูปสินค้า

Ensure On Create Product Page
    ${loc}=         Get Location
    ${on_create}=   Run Keyword And Return Status    Should Contain    ${loc}    /products/create-product
    IF    not ${on_create}
        Go To    ${CREATE_URL}
        Wait Table Idle
    END

Upload Product Image
    [Arguments]    ${filepath}
    Wait Until Element Is Visible       ${UPLOAD_CLICK_AREA}    ${TIMEOUT}
    Scroll Element Into View            ${UPLOAD_CLICK_AREA}
    Click Element                       ${UPLOAD_CLICK_AREA}
    Sleep    0.3s
    ${file_input}=    Get First Present Locator    ${INPUT_FILE_OPT1}    ${INPUT_FILE_OPT2}
    Run Keyword And Ignore Error    Execute Javascript    arguments[0].style.display='block';    ${file_input}
    Run Keyword And Ignore Error    Execute Javascript    arguments[0].removeAttribute('hidden');    ${file_input}
    Choose File    ${file_input}    ${filepath}
    Wait Table Idle
    Sleep    0.5s

Click Save Product
    ${clicked}=    Run Keyword And Return Status    Click Element    ${BTN_SAVE_OPT1}
    Run Keyword If    ${clicked}    RETURN From Keyword
    ${has2}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${BTN_SAVE_OPT2}    2s
    Run Keyword If    ${has2}    Click Element    ${BTN_SAVE_OPT2}
    Run Keyword If    ${has2}    RETURN From Keyword
    ${has3}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${BTN_SAVE_OPT3}    2s
    Run Keyword If    ${has3}    Click Element    ${BTN_SAVE_OPT3}
    Run Keyword If    ${has3}    RETURN From Keyword
    Fail    ไม่พบปุ่มบันทึกสินค้า
