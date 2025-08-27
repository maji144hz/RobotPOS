*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***

Type
    [Arguments]    ${locator}    ${text}
    Should Not Be Empty    ${locator}    
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Clear Element Text               ${locator}
    Input Text    locator=${locator}    text=${text}

Wait Table Idle
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    ${SPINNERS}    6s
    Sleep    0.3s

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
    Run Keyword If    ${clicked}    Return From Keyword
    ${has2}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${BTN_SAVE_OPT2}    2s
    Run Keyword If    ${has2}    Click Element    ${BTN_SAVE_OPT2}
    Run Keyword If    ${has2}    Return From Keyword
    ${has3}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${BTN_SAVE_OPT3}    2s
    Run Keyword If    ${has3}    Click Element    ${BTN_SAVE_OPT3}
    Run Keyword If    ${has3}    Return From Keyword
    Fail    ไม่พบปุ่มบันทึกสินค้า 

Click If Exists
    [Arguments]    ${locator}
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    3s
    Run Keyword If    ${ok}    Click Element    ${locator}
