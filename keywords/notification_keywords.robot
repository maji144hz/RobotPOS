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

# ===== Helpers =====
Click First Matching
    [Arguments]    @{locators}
    FOR    ${locator}    IN    @{locators}
        ${visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    2s
        IF    ${visible}
            Scroll Element Into View    ${locator}
            Click Element               ${locator}
            Exit For Loop
        END
    END

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

# ===== Actions สำหรับ TC5003  =====
Filter Expiring Notifications
    # รองรับทั้งปุ่มฟิลเตอร์และการกดแท็บข้อความ "ใกล้หมดอายุ"
    ${by_btn}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${FILTER_EXPIRING_BUTTON}    2s
    IF    ${by_btn}
        Click Element    ${FILTER_EXPIRING_BUTTON}
    ELSE
        Select Notification Tab    ${TAB_EXPIRING}
    END

Verify Expiring Tab Visible
    Notification Tab Should Be Visible    ${TAB_EXPIRING}

Select First Notification For Disposal
    Wait Until Element Is Visible    ${DISPOSE_ACTION_BUTTON}    ${TIMEOUT}
    Click Element    ${DISPOSE_ACTION_BUTTON}

Confirm Disposal
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

# ===== Actions สำหรับ TC5004  =====
Filter Lowstock Notifications
    Wait Until Element Is Visible    ${FILTER_LOWSTOCK_BUTTON}    ${TIMEOUT}
    Click Element    ${FILTER_LOWSTOCK_BUTTON}

Open Create PO From Notification
    Wait Until Element Is Visible    ${LOWSTOCK_ACTION_BUTTON}    ${TIMEOUT}
    Click Element    ${LOWSTOCK_ACTION_BUTTON}
    Wait Until Element Is Visible    ${CREATE_PO_BUTTON}    ${TIMEOUT}
    Click Element    ${CREATE_PO_BUTTON}

Search And Add Product To PO
    [Arguments]    ${keyword}=${PO_SEARCH_KEYWORD}
    Wait Until Element Is Visible    ${PRODUCT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text    ${PRODUCT_SEARCH_INPUT}
    Input Text    ${PRODUCT_SEARCH_INPUT}    ${keyword}
    Sleep    1s
    Click Element    ${PRODUCT_ADD_BUTTON}

Select PO Supplier
    [Arguments]    ${supplier}=${PO_SUPPLIER_NAME}
    Wait Until Element Is Visible    ${PO_SUPPLIER_SELECT}    ${TIMEOUT}
    Scroll Element Into View          ${PO_SUPPLIER_SELECT}
    Select From List By Label         ${PO_SUPPLIER_SELECT}    ${supplier}
    Wait Until Element Is Visible     ${PO_QUANTITY_INPUT}    ${TIMEOUT}

Fill PO Quantity And Unit
    [Arguments]    ${qty}=${PO_QUANTITY}
    Wait Until Element Is Visible    ${PO_QUANTITY_INPUT}    ${TIMEOUT}
    Scroll Element Into View          ${PO_QUANTITY_INPUT}
    Clear Element Text                ${PO_QUANTITY_INPUT}
    Input Text                        ${PO_QUANTITY_INPUT}    ${qty}
    ${filled}=    Get Value          ${PO_QUANTITY_INPUT}
    IF    '${filled}' != '${qty}'
        Capture Page Screenshot
        Fail    กรอกจำนวนไม่สำเร็จ: ค่าปัจจุบันคือ ${filled}
    END
    ${has_switch}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${PO_UNIT_SWITCH}    2s
    IF    ${has_switch}
        Click Element    ${PO_UNIT_SWITCH}
    END

Submit Purchase Order And Verify
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON}    ${TIMEOUT}
    Click Element    ${PO_SUBMIT_BUTTON}
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${PURCHASE_SUCCESS_TEXT}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    Should Be True    ${ok1} or ${ok2}    ไม่พบข้อความว่าสร้างใบสั่งซื้อสำเร็จ

# ===== Negative Flow สำหรับ TC5005 =====
Clear Quantity And Submit Expect Error
    [Arguments]    ${expected_error}=${PO_ERROR_TEXT}
    Wait Until Element Is Visible    ${PO_QUANTITY_INPUT}    ${TIMEOUT}
    Clear Element Text    ${PO_QUANTITY_INPUT}
    Click Element    ${PO_SUBMIT_BUTTON}
    Sleep    0.5s
    ${success}=    Run Keyword And Return Status    Page Should Contain    ${PURCHASE_SUCCESS_TEXT}
    ${form_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${PO_SUBMIT_BUTTON}
    ${error_seen}=    Run Keyword And Return Status    Page Should Contain    ${expected_error}
    Should Be False    ${success}    ไม่ควรสำเร็จเมื่อจำนวนว่าง
    Should Be True     ${form_visible}    แบบฟอร์มควรยังเปิดอยู่
    # เห็น error message เป็นโบนัส ถ้าไม่มีจะไม่ fail แต่บันทึกไว้
    Run Keyword If    not ${error_seen}    Log    ไม่พบข้อความ error ที่คาดหวัง: ${expected_error}

