*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/purchase_order_variables.robot

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
    # Welcome Page Should Be Open
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

Go To Purchase Order Page
    Wait Until Element Is Visible    ${BTN_MANAGE}       15s
    Click Element                    ${BTN_MANAGE}
    Wait Until Element Is Visible    ${BTN_CREATE_PO}    15s
    Click Element                    ${BTN_CREATE_PO}

Open Create Purchase Order Form
    Wait Until Element Is Visible    id=create-purchase-order-button    10s
    Click Element                    id=create-purchase-order-button
    Wait Until Element Is Visible    ${PRODUCT_SEARCH_INPUT}    10s

Search And Add Product To PO
    [Arguments]    ${keyword}=${PO_SEARCH_KEYWORD}
    Wait Until Element Is Visible    ${PRODUCT_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text    ${PRODUCT_SEARCH_INPUT}
    Input Text            ${PRODUCT_SEARCH_INPUT}    ${keyword}
    Sleep                 1s
    Click Element         ${PRODUCT_ADD_BUTTON}

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


Fill Purchase Price
    [Arguments]    ${price}=${PO_PRICE}
    Wait Until Element Is Visible    ${PO_PRICE_INPUT}    ${TIMEOUT}
    Scroll Element Into View         ${PO_PRICE_INPUT}
    Clear Element Text               ${PO_PRICE_INPUT}
    Input Text                       ${PO_PRICE_INPUT}    ${price}
    Press Keys                       ${PO_PRICE_INPUT}    TAB
    ${p_val}=    Get Value          ${PO_PRICE_INPUT}
    IF    '${p_val}' != '${price}'
        Capture Page Screenshot
        Fail    กรอกราคาซื้อไม่สำเร็จ: ค่าปัจจุบันคือ ${p_val}
    END

Select PO Supplier
    [Arguments]    ${supplier}=${PO_SUPPLIER_NAME}
    Wait Until Element Is Visible    ${PO_SUPPLIER_SELECT}    ${TIMEOUT}
    Scroll Element Into View         ${PO_SUPPLIER_SELECT}
    Select From List By Label        ${PO_SUPPLIER_SELECT}    ${supplier}

Submit Purchase Order And Verify
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON}    ${TIMEOUT}
    Click Element                    ${PO_SUBMIT_BUTTON}
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${PURCHASE_SUCCESS_TEXT}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    Should Be True    ${ok1} or ${ok2}    ไม่พบข้อความว่าสร้างใบสั่งซื้อสำเร็จ

# ===== Edit Purchase Order 3002 =====
Search And Open Purchase Order
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${PO_SEARCH_INPUT}    ${TIMEOUT}
    Clear Element Text    ${PO_SEARCH_INPUT}
    Input Text            ${PO_SEARCH_INPUT}    ${po_number}
    Sleep    1s
    Click Element         ${PO_EDIT_BUTTON}

Fill Edited PO Quantity
    [Arguments]    ${qty}
    Wait Until Element Is Visible    ${PO_QUANTITY_INPUT_EDIT}    ${TIMEOUT}
    Scroll Element Into View         ${PO_QUANTITY_INPUT_EDIT}
    Click Element                    ${PO_QUANTITY_INPUT_EDIT}
    Clear Element Text               ${PO_QUANTITY_INPUT_EDIT}
    Input Text                       ${PO_QUANTITY_INPUT_EDIT}    ${qty}
    Press Keys                       ${PO_QUANTITY_INPUT_EDIT}    TAB
    ${filled}=    Get Value          ${PO_QUANTITY_INPUT_EDIT}
    Should Be Equal    ${filled}    ${qty}   จำนวนสินค้าที่กรอกไม่ตรงกับค่าที่ต้องการ

Submit Edited PO And Verify
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON_EDIT}    ${TIMEOUT}
    Click Element                    ${PO_SUBMIT_BUTTON_EDIT}
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${EDIT_SUCCESS_TEXT}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    Should Be True    ${ok1} or ${ok2}    ไม่พบข้อความว่าแก้ไขใบสั่งซื้อสำเร็จ

# ===== Edit Purchase Order 3003 =====
Search And Open PO For TC3003
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${PO_SEARCH_INPUT}    30s
    Clear Element Text               ${PO_SEARCH_INPUT}
    Input Text                       ${PO_SEARCH_INPUT}    ${po_number}
    Sleep                             1s
    Click Element                    ${PO_EDIT_BUTTON}


Fill Edited PO Price For TC3003
    [Arguments]    ${price}
    Wait Until Element Is Visible    ${PO_PRICE_INPUT_EDIT}    30s
    Scroll Element Into View         ${PO_PRICE_INPUT_EDIT}
    Click Element                    ${PO_PRICE_INPUT_EDIT}
    Clear Element Text               ${PO_PRICE_INPUT_EDIT}
    Input Text                       ${PO_PRICE_INPUT_EDIT}    ${price}
    Press Keys                       ${PO_PRICE_INPUT_EDIT}    TAB
    Sleep                             0.5s


Submit Edited PO And Verify For TC3003
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON_EDIT}    20s
    Click Element                    ${PO_SUBMIT_BUTTON_EDIT}
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${TC3003EDIT_SUCCESS_TEXT}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    Should Be True    ${ok1} or ${ok2}    ไม่พบข้อความว่าแก้ไขใบสั่งซื้อสำเร็จ

# ===== Edit Purchase Order 3004 =====
Search And Open PO For TC3004
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${PO_SEARCH_INPUT}    30s
    Clear Element Text               ${PO_SEARCH_INPUT}
    Input Text                       ${PO_SEARCH_INPUT}    ${po_number}
    Sleep                             1s
    Click Element                    ${PO_EDIT_BUTTON}

Select Edited PO Supplier For TC3004
    [Arguments]    ${supplier}
    Wait Until Element Is Visible    ${PO_SUPPLIER_SELECT_EDIT}    30s
    Scroll Element Into View         ${PO_SUPPLIER_SELECT_EDIT}
    Click Element                    ${PO_SUPPLIER_SELECT_EDIT}
    Select From List By Label        ${PO_SUPPLIER_SELECT_EDIT}    ${supplier}
    Sleep                             0.5s

Submit Edited PO And Verify For TC3004
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON_EDIT}    20s
    Click Element                    ${PO_SUBMIT_BUTTON_EDIT}
    ${ok1}=    Run Keyword And Return Status    Page Should Contain    ${TC3004EDIT_SUCCESS_TEXT}
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    Should Be True    ${ok1} or ${ok2}    ไม่พบข้อความว่าแก้ไขใบสั่งซื้อสำเร็จ

# ===== Delete Purchase Order 3005 =====
Search And Delete PO For TC3005
    [Arguments]    ${po_number}
    Wait Until Element Is Visible    ${PO_SEARCH_INPUT}    30s
    Clear Element Text               ${PO_SEARCH_INPUT}
    Input Text                       ${PO_SEARCH_INPUT}    ${po_number}
    Sleep                             1s
    # กดปุ่มดูรายละเอียดใบสั่ง (view order) ในรายการ PO
    ${view_btn}=    Set Variable    xpath=//button[contains(@id,'po-view-order-button')]
    Wait Until Element Is Visible    ${view_btn}    10s
    Click Element                    ${view_btn}

Confirm Delete PO For TC3005
    # รอให้ SweetAlert2 modal โผล่
    Wait Until Element Is Visible    css=div.swal2-popup    10s
    # กดปุ่ม "ลบ" ใน SweetAlert2
    Click Element                    css=button.swal2-confirm.swal2-styled
    Sleep                             1s
    
# ===== Negative Keywords: TC3006 =====
Fill PO Quantity And Price TC3006
    [Arguments]    ${qty}    ${price}
    Wait Until Element Is Visible    ${PO_QUANTITY_INPUT}    ${TIMEOUT}
    Scroll Element Into View         ${PO_QUANTITY_INPUT}
    Clear Element Text               ${PO_QUANTITY_INPUT}
    Input Text                       ${PO_QUANTITY_INPUT}    ${qty}
    Wait Until Element Is Visible    ${PO_PRICE_INPUT}       ${TIMEOUT}
    Scroll Element Into View         ${PO_PRICE_INPUT}
    Clear Element Text               ${PO_PRICE_INPUT}
    Input Text                       ${PO_PRICE_INPUT}       ${price}

Submit PO And Verify Error TC3006
    [Arguments]    ${supplier}    ${error_message}
    # ไม่เลือก supplier
    Run Keyword If    '${supplier}' != ''    Select From List By Label    ${PO_SUPPLIER_SELECT}    ${supplier}
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON}    ${TIMEOUT}
    Click Element                    ${PO_SUBMIT_BUTTON}
    Wait Until Page Contains         ${error_message}         ${TIMEOUT}

# ===== Negative Keywords: TC3007 =====
Fill PO Quantity TC4007
    [Arguments]    ${qty}
    Wait Until Element Is Visible    ${PO_QUANTITY_INPUT}    ${TIMEOUT}
    Scroll Element Into View         ${PO_QUANTITY_INPUT}
    Clear Element Text               ${PO_QUANTITY_INPUT}
    Input Text                       ${PO_QUANTITY_INPUT}    ${qty}

Submit PO And Verify Error TC3007
    [Arguments]    ${price}    ${supplier}    ${error_message}
    # กรอกราคาเฉพาะถ้าไม่ว่าง
    Run Keyword If    '${price}' != ''    Input Text    ${PO_PRICE_INPUT}    ${price}
    # เลือก supplier
    Run Keyword If    '${supplier}' != ''    Select From List By Label    ${PO_SUPPLIER_SELECT}    ${supplier}
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON}    ${TIMEOUT}
    Click Element                    ${PO_SUBMIT_BUTTON}
    Wait Until Element Contains      xpath=//div[contains(@class,'ant-message-notice-content')]    ${error_message}    ${TIMEOUT}

# ===== Negative Keywords: TC3008 =====
Search And View PO For TC3008
    [Arguments]    ${po_number}    ${po_id}
    Wait Until Element Is Visible    ${PO_SEARCH_INPUT}    30s
    Clear Element Text               ${PO_SEARCH_INPUT}
    Input Text                       ${PO_SEARCH_INPUT}    ${po_number}
    Sleep                             2s
    ${view_btn}=                      Set Variable    xpath=//button[@id='po-view-order-button-${po_id}']
    Wait Until Element Is Visible    ${view_btn}    10s
    Click Element                    ${view_btn}



