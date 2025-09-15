*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../variables/notification_variables.robot

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
    Welcome Page Should Be Open
    Sleep    1s

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

Welcome Page Should Be Open
    Wait Until Page Contains Element    xpath=//*[@id="root"]//aside    ${TIMEOUT}

# ===== Notification (สำหรับ TC5001) =====
Open Notification Panel
    Wait Until Element Is Visible    ${NOTIFICATION_BELL_ICON}    ${TIMEOUT}
    Scroll Element Into View          ${NOTIFICATION_BELL_ICON}
    Click Element                     ${NOTIFICATION_BELL_ICON}
    Sleep    0.4s
    Wait Until Keyword Succeeds    10x    0.5s    Verify Notification Panel Appeared
    Sleep    ${NOTIFICATION_HOLD}

Verify Notification Panel Appeared
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${NOTIFICATION_WINDOW_TITLE}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//*[contains(normalize-space(.),'ทั้งหมด')]
    IF    ${ok1} or ${ok2}
        No Operation
    ELSE
        Capture Page Screenshot
        Fail    คลิกกระดิ่งแล้วไม่พบหน้าต่างการแจ้งเตือนหรือแท็บ "ทั้งหมด"
    END

Click Notification Bell Icon
    Open Notification Panel

Verify Notification Window Is Displayed
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${NOTIFICATION_WINDOW_TITLE}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//*[contains(normalize-space(.),'ทั้งหมด')]
    Should Be True    ${ok1} or ${ok2}    ต้องเห็นหัวข้อการแจ้งเตือนหรือแท็บ "ทั้งหมด"

Verify Notification Items Are Present
    ${item_count}=    Get Element Count    ${NOTIFICATION_ITEM}
    Log    จำนวนรายการแจ้งเตือน: ${item_count}
    Should Be True    ${item_count} > 0    ไม่พบรายการแจ้งเตือน

Select Notification Tab
    [Arguments]    ${tab_name}
    ${locator}=    Set Variable    xpath=//*[self::button or self::a or self::div or self::span][normalize-space(.)='${tab_name}']
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Click Element    ${locator}

Notification Tab Should Be Visible
    [Arguments]    ${tab_name}
    ${active_tab}=    Set Variable    xpath=//*[contains(@class,'active') or contains(@aria-selected,'true')][normalize-space(.)='${tab_name}']
    ${ok}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${active_tab}    ${TIMEOUT}
    Run Keyword If    not ${ok}    Page Should Contain    ${tab_name}

# ===== Actions สำหรับ TC5002 =====
Filter Expired Notifications
    Wait Until Element Is Visible    ${FILTER_EXPIRED_BUTTON}    ${TIMEOUT}
    Click Element    ${FILTER_EXPIRED_BUTTON}

Select First Notification For Disposal
    Wait Until Element Is Visible    ${DISPOSE_ACTION_BUTTON}    ${TIMEOUT}
    Click Element    ${DISPOSE_ACTION_BUTTON}

Confirm Disposal
    # ปุ่มยืนยันของ SweetAlert2
    ${clicked}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${CONFIRM_DISPOSE_BUTTON}    ${TIMEOUT}
    IF    ${clicked}
        Scroll Element Into View    ${CONFIRM_DISPOSE_BUTTON}
        Click Element               ${CONFIRM_DISPOSE_BUTTON}
    ELSE
        Click Element    xpath=//button[contains(@class,'swal2-confirm') or normalize-space(text())='ตกลง']
    END

Verify Disposal Success
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${DISPOSE_SUCCESS_TEXT}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    Should Be True    ${ok1} or ${ok2}    ไม่พบข้อความยืนยันการตัดจำหน่าย

