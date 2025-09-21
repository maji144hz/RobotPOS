*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/receive_product_variables.robot

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
    Sleep    1s    # รอให้ระบบโหลดหลัง login

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

# ===== Navigation =====
Go To Receive Product Page
    Wait Until Element Is Visible    ${BTN_MANAGE}    ${TIMEOUT}
    Click Element                    ${BTN_MANAGE}
    Wait Until Element Is Visible    ${BTN_RECEIVE}   ${TIMEOUT}
    Click Element                    ${BTN_RECEIVE}

# ===== 4001: ดูรายละเอียดใบรับสินค้า =====
Search And View Receipt
    [Arguments]    ${receipt_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${receipt_number}
    Sleep    2s
    Wait Until Element Is Visible    ${VIEW_RECEIPT_BUTTON}    ${TIMEOUT}
    Click Element                    ${VIEW_RECEIPT_BUTTON}
    Sleep    2s    # รอหน้าแสดงรายละเอียดโหลด

# ===== 4002: อัพเดทและรับสินค้า =====
Search And Select Purchase Order
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${po_number}
    Sleep    3s    # เพิ่มเวลาให้ระบบแสดงรายการ PO
    Wait Until Element Is Visible    xpath=//*[text()='${po_number}']    ${TIMEOUT}
    Sleep    1s    # รอให้ element โผล่เต็มที่
    Click Element                    xpath=//*[text()='${po_number}']
    Sleep    1s
    Wait Until Element Is Visible    ${BTN_UPDATE_DELIVERY}    ${TIMEOUT}
    Click Button                     ${BTN_UPDATE_DELIVERY}
    Sleep    1s    # รอ form แสดง

Update Delivery Item
    [Arguments]    ${delivered_locator}    ${delivered_qty}    ${expiration_locator}    ${expiration_date}
    Wait Until Element Is Visible    ${delivered_locator}    ${TIMEOUT}
    Sleep    1s
    Clear Element Text    ${delivered_locator}
    Input Text            ${delivered_locator}    ${delivered_qty}
    Sleep    0.5s

    Wait Until Element Is Visible    ${expiration_locator}    ${TIMEOUT}
    Sleep    1s
    Clear Element Text    ${expiration_locator}
    Input Text            ${expiration_locator}    ${expiration_date}
    Sleep    0.5s

Confirm Update Delivery
    Wait Until Element Is Visible    ${BTN_CONFIRM_UPDATE}    ${TIMEOUT}
    Sleep    1s
    Click Button                     ${BTN_CONFIRM_UPDATE}
    Sleep    2s

# ===== 4003: ยืนยันการรับสินค้า =====
Go To Finished Tab
    Wait Until Element Is Visible    ${TC4003_FINISHED_TAB}    ${TIMEOUT}
    Click Element                    ${TC4003_FINISHED_TAB}
    Sleep    2s    # รอให้แท็บเปลี่ยน

Search And Select PO For Confirmation
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${po_number}
    Sleep    3s    # เพิ่มเวลาให้ระบบแสดงรายการ PO
    Wait Until Element Is Visible    xpath=//*[text()='${po_number}']    ${TIMEOUT}
    Sleep    1s    # รอให้ element โผล่เต็มที่
    Click Element                    xpath=//*[text()='${po_number}']
    Sleep    1s

Go To Update Delivery
    [Arguments]    ${update_delivery_btn}
    Wait Until Element Is Visible    ${update_delivery_btn}    ${TIMEOUT}
    Click Button                     ${update_delivery_btn}
    Sleep    2s    # รอ modal แสดง

Update Actual Price
    [Arguments]    ${price_locator}    ${price_value}
    Wait Until Element Is Visible    ${price_locator}    ${TIMEOUT}
    Sleep    1s
    Clear Element Text    ${price_locator}
    Input Text            ${price_locator}    ${price_value}
    Sleep    0.5s

Save Price Update
    Wait Until Element Is Visible    ${TC4003_SAVE_BUTTON}    ${TIMEOUT}
    Sleep    1s
    Click Button                     ${TC4003_SAVE_BUTTON}
    Sleep    3s    # รอให้ modal ปิดและหน้าเว็บโหลดเสร็จ
    # รอให้หน้าเว็บโหลดเสร็จ
    Wait Until Page Does Not Contain    css=div.swal2-popup    ${TIMEOUT}
    Sleep    2s

Confirm Product Receipt
    [Arguments]    ${receipt_id}
    Sleep    5s    # รอให้หน้าเว็บโหลดเสร็จหลังจากบันทึก
    ${confirm_btn}=    Set Variable    id=po-confirm-receipt-button-${receipt_id}
    
    # ลองหาปุ่ม confirm receipt ด้วยวิธีต่างๆ
    ${btn_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${confirm_btn}    10s
    IF    not ${btn_found}
        # ลองหาด้วย xpath
        ${confirm_btn_xpath}=    Set Variable    xpath=//button[contains(@id,'po-confirm-receipt-button')]
        ${btn_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${confirm_btn_xpath}    10s
        IF    ${btn_found}
            ${confirm_btn}=    Set Variable    ${confirm_btn_xpath}
        END
    END
    
    IF    not ${btn_found}
        # ลองหาด้วย text
        ${confirm_btn_text}=    Set Variable    xpath=//button[contains(.,'ยืนยันการรับสินค้า')]
        ${btn_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${confirm_btn_text}    10s
        IF    ${btn_found}
            ${confirm_btn}=    Set Variable    ${confirm_btn_text}
        END
    END
    
    Should Be True    ${btn_found}    ไม่พบปุ่มยืนยันการรับสินค้า
    Sleep    1s
    Click Button                     ${confirm_btn}
    Sleep    2s

Verify Receipt Confirmation Success
    [Arguments]    ${success_message}
    Wait Until Page Contains         ${success_message}    ${TIMEOUT}
    Page Should Contain              ${success_message}
    # ตรวจสอบข้อความเพิ่มเติม
    Page Should Contain              แก้ไขข้อมูลการรับสินค้าเรียบร้อยแล้ว

Verify Receipt Status Updated
    [Arguments]    ${status_locator}
    Wait Until Element Is Visible    ${status_locator}    ${TIMEOUT}
    Element Should Be Visible        ${status_locator}

# ===== 4004: ลบใบรับสินค้า =====
Search And Select PO For Deletion
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${po_number}
    Sleep    3s    # เพิ่มเวลาให้ระบบแสดงรายการ PO
    Wait Until Element Is Visible    xpath=//*[text()='${po_number}']    ${TIMEOUT}
    Sleep    1s    # รอให้ element โผล่เต็มที่
    Click Element                    xpath=//*[text()='${po_number}']
    Sleep    1s

Click Delete Receipt Button
    [Arguments]    ${delete_button}
    Wait Until Element Is Visible    ${delete_button}    ${TIMEOUT}
    Sleep    1s
    Click Button                     ${delete_button}
    Sleep    2s    # รอ modal แสดง

Confirm Delete Receipt
    [Arguments]    ${confirm_button}
    Wait Until Element Is Visible    ${confirm_button}    ${TIMEOUT}
    Sleep    1s
    Click Button                     ${confirm_button}
    Sleep    2s

Verify Delete Success
    [Arguments]    ${success_message}
    Wait Until Page Contains         ${success_message}    ${TIMEOUT}
    Page Should Contain              ${success_message}

# ===== 4005: กรณีไม่กรอกจำนวนที่ส่งมอบ =====
Search And Select PO For TC4005
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${po_number}
    Sleep    3s    # เพิ่มเวลาให้ระบบแสดงรายการ PO
    Wait Until Element Is Visible    xpath=//*[text()='${po_number}']    ${TIMEOUT}
    Sleep    1s    # รอให้ element โผล่เต็มที่
    Click Element                    xpath=//*[text()='${po_number}']
    Sleep    1s

Go To Update Delivery For TC4005
    [Arguments]    ${update_delivery_btn}
    Wait Until Element Is Visible    ${update_delivery_btn}    ${TIMEOUT}
    Click Button                     ${update_delivery_btn}
    Sleep    2s    # รอ modal แสดง

Update Only Actual Price For TC4005
    [Arguments]    ${price_locator}    ${price_value}
    Wait Until Element Is Visible    ${price_locator}    ${TIMEOUT}
    Sleep    1s
    Clear Element Text    ${price_locator}
    Input Text            ${price_locator}    ${price_value}
    Sleep    0.5s

Save Price Update And Verify Error TC4005
    [Arguments]    ${error_message}
    Wait Until Element Is Visible    ${TC4003_SAVE_BUTTON}    ${TIMEOUT}
    Sleep    1s
    Click Button                     ${TC4003_SAVE_BUTTON}
    Sleep    2s
    Wait Until Page Contains         ${error_message}    ${TIMEOUT}
    Page Should Contain              ${error_message}

# ===== 4006: กรณีไม่กรอกราคาจริงต่อหน่วย =====
Search And Select PO For TC4006
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${RECEIPT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text               ${RECEIPT_SEARCH_INPUT}
    Input Text                       ${RECEIPT_SEARCH_INPUT}    ${po_number}
    Sleep    3s    # เพิ่มเวลาให้ระบบแสดงรายการ PO
    Wait Until Element Is Visible    xpath=//*[text()='${po_number}']    ${TIMEOUT}
    Sleep    1s    # รอให้ element โผล่เต็มที่
    Click Element                    xpath=//*[text()='${po_number}']
    Sleep    1s

Go To Update Delivery For TC4006
    [Arguments]    ${update_delivery_btn}
    Wait Until Element Is Visible    ${update_delivery_btn}    ${TIMEOUT}
    Click Button                     ${update_delivery_btn}
    Sleep    2s    # รอ modal แสดง

Update Delivered Quantity And Price For TC4006
    [Arguments]    ${delivered_locator}    ${delivered_qty}    ${price_locator}    ${price_value}
    Wait Until Element Is Visible    ${delivered_locator}    ${TIMEOUT}
    Sleep    1s
    Clear Element Text    ${delivered_locator}
    Input Text            ${delivered_locator}    ${delivered_qty}
    Sleep    0.5s
    
    Wait Until Element Is Visible    ${price_locator}    ${TIMEOUT}
    Sleep    1s
    Clear Element Text    ${price_locator}
    Input Text            ${price_locator}    ${price_value}
    Sleep    0.5s

Save Update And Verify Error TC4006
    [Arguments]    ${update_button}    ${error_message}
    Wait Until Element Is Visible    ${update_button}    ${TIMEOUT}
    Sleep    1s
    Click Button                     ${update_button}
    Sleep    2s
    Wait Until Page Contains         ${error_message}    ${TIMEOUT}
    Page Should Contain              ${error_message}




