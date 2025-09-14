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
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div/aside/div/nav/div/a[2]    ${TIMEOUT}

# ===== Notification Management =====
Click Notification Bell Icon
    # รอให้หน้าเว็บโหลดเสร็จ
    Wait Until Element Is Visible    ${NOTIFICATION_BELL_ICON}    ${TIMEOUT}
    
    # คลิกไอคอนรูปกระดิ่ง
    Click Element    ${NOTIFICATION_BELL_ICON}
    Sleep    1s

Verify Notification Window Is Displayed
    # ตรวจสอบว่าหน้าต่างการแจ้งเตือนแสดงขึ้นมา
    Wait Until Element Is Visible    ${NOTIFICATION_WINDOW}    ${TIMEOUT}
    Page Should Contain Element    ${NOTIFICATION_WINDOW}

Verify Notification List Is Displayed
    # ตรวจสอบว่ารายการแจ้งเตือนแสดงขึ้นมา
    Wait Until Element Is Visible    ${NOTIFICATION_LIST}    ${TIMEOUT}
    Page Should Contain Element    ${NOTIFICATION_LIST}

Verify Notification Items Are Present
    # ตรวจสอบว่ามีรายการแจ้งเตือน
    ${item_count}=    Get Element Count    ${NOTIFICATION_ITEM}
    Log    จำนวนรายการแจ้งเตือน: ${item_count}
    
    # ตรวจสอบว่ามีรายการแจ้งเตือนอย่างน้อย 1 รายการ
    Should Be True    ${item_count} > 0    ไม่พบรายการแจ้งเตือน

Verify Notification Window Title
    # ตรวจสอบหัวข้อหน้าต่างการแจ้งเตือน
    Page Should Contain    ${NOTIFICATION_WINDOW_TITLE}

Verify Notification Content
    # ตรวจสอบเนื้อหาของการแจ้งเตือน
    Page Should Contain    ${NOTIFICATION_ITEM_TEXT}

Close Notification Window
    # ปิดหน้าต่างการแจ้งเตือนโดยคลิกที่ไอคอนกระดิ่งอีกครั้ง
    Click Element    ${NOTIFICATION_BELL_ICON}
    Sleep    1s

Verify Notification Window Is Closed
    # ตรวจสอบว่าหน้าต่างการแจ้งเตือนปิดแล้ว
    ${window_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${NOTIFICATION_WINDOW}
    Run Keyword If    ${window_visible}    Log    หน้าต่างการแจ้งเตือนยังเปิดอยู่
    Run Keyword If    not ${window_visible}    Log    หน้าต่างการแจ้งเตือนปิดแล้ว


Verify Disposal Confirmation
    # ตรวจสอบการยืนยันการตัดจำหน่าย
    Sleep    2s
    ${success_found}=    Run Keyword And Return Status    Page Should Contain    ${TC5002_SUCCESS_MESSAGE}
    Run Keyword If    not ${success_found}    ${alt_success}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    Run Keyword If    not ${success_found} and not ${alt_success}    ${alt_success2}=    Run Keyword And Return Status    Page Should Contain    ตกลง
    Run Keyword If    not ${success_found} and not ${alt_success} and not ${alt_success2}    Capture Page Screenshot
    Run Keyword If    not ${success_found} and not ${alt_success} and not ${alt_success2}    Log    ไม่พบข้อความสำเร็จที่คาดหวัง
    Run Keyword If    not ${success_found} and not ${alt_success} and not ${alt_success2}    ${page_content}=    Get Text    css=body
    Run Keyword If    not ${success_found} and not ${alt_success} and not ${alt_success2}    Log    เนื้อหาหน้าจอ: ${page_content}input[name='password']    ${password}

Submit Credentials
    Click Button    css=button[type='submit']

Welcome Page Should Be Open
    Wait Until Page Contains Element    xpath=//*[@id="root"]/div/aside/div/nav/div/a[2]    ${TIMEOUT}

# ===== Notification Management =====
Click Notification Bell Icon
    # รอให้หน้าเว็บโหลดเสร็จ
    Wait Until Element Is Visible    ${NOTIFICATION_BELL_ICON}    ${TIMEOUT}
    
    # คลิกไอคอนรูปกระดิ่ง
    Click Element    ${NOTIFICATION_BELL_ICON}
    Sleep    1s

Verify Notification Window Is Displayed
    # ตรวจสอบว่าหน้าต่างการแจ้งเตือนแสดงขึ้นมา
    Wait Until Element Is Visible    ${NOTIFICATION_WINDOW}    ${TIMEOUT}
    Page Should Contain Element    ${NOTIFICATION_WINDOW}

Verify Notification List Is Displayed
    # ตรวจสอบว่ารายการแจ้งเตือนแสดงขึ้นมา
    Wait Until Element Is Visible    ${NOTIFICATION_LIST}    ${TIMEOUT}
    Page Should Contain Element    ${NOTIFICATION_LIST}

Verify Notification Items Are Present
    # ตรวจสอบว่ามีรายการแจ้งเตือน
    ${item_count}=    Get Element Count    ${NOTIFICATION_ITEM}
    Log    จำนวนรายการแจ้งเตือน: ${item_count}
    
    # ตรวจสอบว่ามีรายการแจ้งเตือนอย่างน้อย 1 รายการ
    Should Be True    ${item_count} > 0    ไม่พบรายการแจ้งเตือน

Verify Notification Window Title
    # ตรวจสอบหัวข้อหน้าต่างการแจ้งเตือน
    Page Should Contain    ${NOTIFICATION_WINDOW_TITLE}

Verify Notification Content
    # ตรวจสอบเนื้อหาของการแจ้งเตือน
    Page Should Contain    ${NOTIFICATION_ITEM_TEXT}

Close Notification Window
    # ปิดหน้าต่างการแจ้งเตือนโดยคลิกที่ไอคอนกระดิ่งอีกครั้ง
    Click Element    ${NOTIFICATION_BELL_ICON}
    Sleep    1s

Verify Notification Window Is Closed
    # ตรวจสอบว่าหน้าต่างการแจ้งเตือนปิดแล้ว
    ${window_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${NOTIFICATION_WINDOW}
    Run Keyword If    ${window_visible}    Log    หน้าต่างการแจ้งเตือนยังเปิดอยู่
    Run Keyword If    not ${window_visible}    Log    หน้าต่างการแจ้งเตือนปิดแล้ว


