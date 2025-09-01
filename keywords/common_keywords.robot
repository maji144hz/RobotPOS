*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
# ===== Browser & Login =====
Open Browser To Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    css=input[name='username']
    Input Text    css=input[name='username']    ${username}
    Input Text    css=input[name='password']    ${password}
    Click Button  css=button[type='submit']

Navigate To Management Menu
    Wait Until Element Is Visible    xpath=//span[contains(text(),'จัดการ')]
    Click Element    xpath=//span[contains(text(),'จัดการ')]

Navigate To Settings Menu
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ตั้งค่า')]
    Click Element    xpath=//span[contains(text(),'ตั้งค่า')]

Navigate To Profile Menu
    Wait Until Element Is Visible    xpath=//span[contains(text(),'โปรไฟล์')]
    Click Element    xpath=//span[contains(text(),'โปรไฟล์')]

# ===== Common Utils =====
Wait Table Idle
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    ${SPINNERS}    5s
    Sleep    0.3s

Click If Exists
    [Arguments]    ${locator}
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    2s
    Run Keyword If    ${ok}    Click Element    ${locator}

Generate Random Number
    [Arguments]    ${min}=1000    ${max}=9999
    ${random}=    Evaluate    random.randint(${min}, ${max})    random
    RETURN    ${random}

Create Directory If Not Exists
    [Arguments]    ${directory}
    Run Keyword And Ignore Error    Create Directory    ${directory}
