*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../variables/promotion_variables.robot

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

# ===== Promotion Management =====
# ===== การเพิ่มโปรโมชั่น =====
Go To Promotion Page
    Go To    ${BASE_URL}/management/promotions
    Wait Until Page Contains Element    id=create-promotion-button    ${TIMEOUT}

Click Add Promotion Button
    Wait Until Element Is Visible    id=create-promotion-button    ${TIMEOUT}
    Click Element                   id=create-promotion-button
    Wait Until Element Is Visible   id=create-promotion-name-input    ${TIMEOUT}

Input Promotion Name
    [Arguments]    ${name}
    Input Text    id=create-promotion-name-input    ${name}

# ===== Datepicker Handling (Start/End) =====
Select Promotion Date
    [Arguments]    ${date_type}    ${day}    ${month}    ${year}
    # เลือก field start หรือ end
    Run Keyword If    '${date_type}'=='start'    Click Element    id=create-promotion-start-date
    ...    ELSE    Click Element    id=create-promotion-end-date

    Wait Until Element Is Visible    css=.react-datepicker    ${TIMEOUT}

    # เลื่อนเดือน/ปีไปยัง target
    FOR    ${i}    IN RANGE    24
        ${current}=    Get Text    css=.react-datepicker__current-month
        ${parts}=      Evaluate    '${current}.split()'
        ${current_month}=    Set Variable    ${parts[0]}
        ${current_year}=     Set Variable    ${parts[1]}
        Run Keyword If    '${current_month}'=='${month}' and '${current_year}'=='${year}'    Exit For Loop
        Click Element      css=.react-datepicker__navigation--next
        Sleep    0.5s
    END

    # เลือกวันเฉพาะของเดือนปัจจุบัน
    ${day_locator}=    Set Variable    xpath=//div[contains(@class,"react-datepicker__day") and not(contains(@class,"outside-month")) and normalize-space(text())="${day}"]
    Click Element      ${day_locator}
    Sleep    0.5s

# ===== Product & Price =====
Select Promotion Product
    [Arguments]    ${product}
    Wait Until Element Is Visible    id=create-promotion-product-combobox    ${TIMEOUT}
    Input Text    id=create-promotion-product-combobox    ${product}
    Sleep    1s
    # กด Enter เพื่อเลือก item
    Press Keys    id=create-promotion-product-combobox    RETURN
    Sleep    1s

Input Original Price
    [Arguments]    ${price}
    Log    ราคาเดิมเป็น display text: ฿13 ไม่ต้องกรอก

Select Lot For Promotion
    [Arguments]    ${lot_locator}
    Wait Until Element Is Visible    ${lot_locator}    ${TIMEOUT}
    Click Element    ${lot_locator}
    Sleep    1s

Input Discounted Price
    [Arguments]    ${discounted_price}
    Wait Until Element Is Visible    id=create-promotion-discounted-price-input    ${TIMEOUT}
    Clear Element Text    id=create-promotion-discounted-price-input
    Input Text    id=create-promotion-discounted-price-input    ${discounted_price}
    Press Keys    id=create-promotion-discounted-price-input    RETURN
    Sleep    0.5s



Click Submit Promotion
    Wait Until Element Is Visible    id=create-promotion-submit-button    ${TIMEOUT}
    Click Button    id=create-promotion-submit-button
    ${btn_back}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=create-promotion-button    20s
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    สร้างโปรโมชั่นสำเร็จ
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    บันทึกสำเร็จ
    ${ok3}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    ${row_ok}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//td[contains(text(),'${PROMOTION_NAME}')]
    Run Keyword Unless    ${ok1} or ${ok2} or ${ok3} or ${row_ok}    Capture Page Screenshot
    Run Keyword Unless    ${ok1} or ${ok2} or ${ok3} or ${row_ok}    Fail    ไม่พบหลักฐานว่าสร้างโปรโมชั่นสำเร็จ


# ===== Delete Promotion (TC6003) =====
Open Delete Promotion Modal
    Wait Until Element Is Visible    xpath=//button[contains(@id,'delete-promotion-button')]    ${TIMEOUT}
    Click Element    xpath=//button[contains(@id,'delete-promotion-button')]
    Wait Until Element Is Visible    xpath=//div[contains(@class,'modal')]//button    ${TIMEOUT}

Confirm Delete Promotion
    # กดปุ่มลบ (สีแดง) ใน modal
    Click Element    xpath=(//div[contains(@class,'modal')]//button)[1]
    # ยืนยัน OK (ปุ่มกลาง)
    Click Element    xpath=(//div[contains(@class,'modal')]//button)[2]
    
    # ตรวจผลลัพธ์
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${DELETE_SUCCESS_TEXT}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    ลบสำเร็จ
    ${ok3}=    Run Keyword And Return Status    Page Should Not Contain    ${DELETE_PROMOTION_SEARCH}
    Run Keyword Unless    ${ok1} or ${ok2} or ${ok3}    Capture Page Screenshot
    Run Keyword Unless    ${ok1} or ${ok2} or ${ok3}    Fail    ไม่พบหลักฐานว่าลบโปรโมชั่นสำเร็จ


# ===== Print Promotions (TC6004) =====
Open Print Promotions Modal
    Wait Until Element Is Visible    id=${PRINT_BUTTON_ID}    ${TIMEOUT}
    Click Element    id=${PRINT_BUTTON_ID}
    # รอ modal ตั้งค่าปริ้น
    Wait Until Element Is Visible    xpath=//div[contains(@class,'modal')]    ${TIMEOUT}

Configure Print Options
    [Arguments]    ${pages}=${PRINT_PAGE_COUNT}    ${per_page}=${PRINT_PER_PAGE}    ${summary}=${PRINT_LAYOUT_SUMMARY}    ${include_active}=${PRINT_INCLUDE_ACTIVE}    ${include_expired}=${PRINT_INCLUDE_EXPIRED}
    # เลือกจำนวนบาร์โค้ดต่อหน้า
    Click Element    xpath=(//*[@id='root']//div/div/main/div/div/div[3]/div/div[1]/div/button[2])[1]
    # ตัวอย่างนี้ใช้คลิกตำแหน่งตามสเปก ถ้าหน้าเปลี่ยนจะปรับได้
    # สลับตัวเลือกแบบสรุป/รวมรายการ
    Run Keyword If    ${summary}    Click Element    xpath=//*[@id='root']//div[3]//div[2]//button[2]
    # ตัวเลือกสถานะที่ต้องการพิมพ์ (เชิงสัญลักษณ์)
    Run Keyword If    ${include_active}     No Operation
    Run Keyword If    ${include_expired}    No Operation

Submit Print Promotions
    # ปุ่ม "เริ่มพิมพ์" สีเขียวใน modal
    Click Element    xpath=//button[contains(text(),'เริ่มพิมพ์')]
    # รอระบบประมวลผล และตรวจข้อความยืนยัน
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    เริ่มยืนยันการพิมพ์
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    ยืนยันการพิมพ์สำเร็จ
    Run Keyword Unless    ${ok1} or ${ok2}    Capture Page Screenshot
    Run Keyword Unless    ${ok1} or ${ok2}    Fail    ไม่พบข้อความยืนยันการพิมพ์


# ===== Edit Promotion (TC6002) =====
Search Promotion By Name
    [Arguments]    ${query}
    Wait Until Element Is Visible    id=promotion-search-input    ${TIMEOUT}
    Clear Element Text    id=promotion-search-input
    Input Text    id=promotion-search-input    ${query}
    Sleep    0.5s

Open Edit Promotion Modal
    Wait Until Element Is Visible    xpath=//button[contains(@id,'edit-promotion-button')]    ${TIMEOUT}
    Click Element    xpath=//button[contains(@id,'edit-promotion-button')]
    Wait Until Element Is Visible    id=edit-promotion-name-input    ${TIMEOUT}

Input Edit Promotion Name
    [Arguments]    ${name}
    Clear Element Text    id=edit-promotion-name-input
    Input Text    id=edit-promotion-name-input    ${name}

Select Edit Promotion Date
    [Arguments]    ${date_type}    ${day}    ${month}    ${year}
    Run Keyword If    '${date_type}'=='start'    Click Element    id=edit-promotion-start-date
    ...    ELSE    Click Element    id=edit-promotion-end-date
    Wait Until Element Is Visible    css=.react-datepicker    ${TIMEOUT}
    FOR    ${i}    IN RANGE    24
        ${current}=    Get Text    css=.react-datepicker__current-month
        ${parts}=      Evaluate    '${current}.split()'
        ${current_month}=    Set Variable    ${parts[0]}
        ${current_year}=     Set Variable    ${parts[1]}
        Run Keyword If    '${current_month}'=='${month}' and '${current_year}'=='${year}'    Exit For Loop
        Click Element      css=.react-datepicker__navigation--next
        Sleep    0.5s
    END
    ${day_locator}=    Set Variable    xpath=//div[contains(@class,"react-datepicker__day") and not(contains(@class,"outside-month")) and normalize-space(text())="${day}"]
    Click Element      ${day_locator}
    Sleep    0.5s

Input Edit Promotion Discounted Price
    [Arguments]    ${price}
    Clear Element Text    id=edit-promotion-discounted-price-input
    Input Text    id=edit-promotion-discounted-price-input    ${price}

Select Edit Promotion Lot
    [Arguments]    ${lot_locator}
    Click Element    ${lot_locator}

Submit Edit Promotion
    Click Button    id=create-promotion-submit-button
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    แก้ไขโปรโมชั่นสำเร็จ
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    บันทึกสำเร็จ
    ${ok3}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    ${row_ok}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//td[contains(text(),'${EDIT_PROMOTION_NAME}')]
    Run Keyword Unless    ${ok1} or ${ok2} or ${ok3} or ${row_ok}    Capture Page Screenshot
    Run Keyword Unless    ${ok1} or ${ok2} or ${ok3} or ${row_ok}    Fail    ไม่พบหลักฐานว่าแก้ไขโปรโมชั่นสำเร็จ

# ===== Negative Test Cases (TC6005-TC6009) =====
# TC6005: ไม่กรอกชื่อโปรโมชั่น
Input Promotion Name Optional
    [Arguments]    ${name}
    Run Keyword If    '${name}' != '${EMPTY}'    Input Text    id=create-promotion-name-input    ${name}

Select Promotion Date Optional
    [Arguments]    ${date_type}    ${day}    ${month}    ${year}
    Run Keyword If    '${day}' != '${EMPTY}' and '${month}' != '${EMPTY}' and '${year}' != '${EMPTY}'
    ...    Select Promotion Date    ${date_type}    ${day}    ${month}    ${year}

Select Promotion Product Optional
    [Arguments]    ${product}
    Run Keyword If    '${product}' != '${EMPTY}'
    ...    Select Promotion Product    ${product}

Select Lot For Promotion Optional
    [Arguments]    ${lot_locator}
    Run Keyword If    '${lot_locator}' != '${EMPTY}'
    ...    Select Lot For Promotion    ${lot_locator}

Input Discounted Price Optional
    [Arguments]    ${discounted_price}
    Run Keyword If    '${discounted_price}' != '${EMPTY}'
    ...    Input Discounted Price    ${discounted_price}

Submit Promotion And Check Error
    [Arguments]    ${expected_error}
    Click Button    id=create-promotion-submit-button
    Sleep    2s
    ${error_found}=    Run Keyword And Return Status    Page Should Contain    ${expected_error}
    Run Keyword If    not ${error_found}    Capture Page Screenshot
    Run Keyword If    not ${error_found}    Fail    ไม่พบข้อความแจ้งเตือนที่คาดหวัง: ${expected_error}

