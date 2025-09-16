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




# ===== Negative Keywords: TC4004 =====
Fill PO Quantity And Price TC4004
    [Arguments]    ${qty}    ${price}
    Wait Until Element Is Visible    ${PO_QUANTITY_INPUT}    ${TIMEOUT}
    Scroll Element Into View         ${PO_QUANTITY_INPUT}
    Clear Element Text               ${PO_QUANTITY_INPUT}
    Input Text                       ${PO_QUANTITY_INPUT}    ${qty}
    Wait Until Element Is Visible    ${PO_PRICE_INPUT}       ${TIMEOUT}
    Scroll Element Into View         ${PO_PRICE_INPUT}
    Clear Element Text               ${PO_PRICE_INPUT}
    Input Text                       ${PO_PRICE_INPUT}       ${price}

Submit PO And Verify Error TC4004
    [Arguments]    ${supplier}    ${error_message}
    # ไม่เลือก supplier
    Run Keyword If    '${supplier}' != ''    Select From List By Label    ${PO_SUPPLIER_SELECT}    ${supplier}
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON}    ${TIMEOUT}
    Click Element                    ${PO_SUBMIT_BUTTON}
    Wait Until Page Contains         ${error_message}         ${TIMEOUT}

# ===== Negative Keywords: TC4005 =====
Fill PO Quantity TC4005
    [Arguments]    ${qty}
    Wait Until Element Is Visible    ${PO_QUANTITY_INPUT}    ${TIMEOUT}
    Scroll Element Into View         ${PO_QUANTITY_INPUT}
    Clear Element Text               ${PO_QUANTITY_INPUT}
    Input Text                       ${PO_QUANTITY_INPUT}    ${qty}

Submit PO And Verify Error TC4005
    [Arguments]    ${price}    ${supplier}    ${error_message}
    # กรอกราคาเฉพาะถ้าไม่ว่าง
    Run Keyword If    '${price}' != ''    Input Text    ${PO_PRICE_INPUT}    ${price}
    # เลือก supplier
    Run Keyword If    '${supplier}' != ''    Select From List By Label    ${PO_SUPPLIER_SELECT}    ${supplier}
    Wait Until Element Is Visible    ${PO_SUBMIT_BUTTON}    ${TIMEOUT}
    Click Element                    ${PO_SUBMIT_BUTTON}
    Wait Until Element Contains      xpath=//div[contains(@class,'ant-message-notice-content')]    ${error_message}    ${TIMEOUT}

# ===== Negative Keywords: TC4006 =====
Add Duplicate Product To PO
    # คลิกปุ่มเพิ่มสินค้าเดิมอีกครั้ง
    Wait Until Element Is Visible    id=product-list-add-button-6855aa22c16f3c50f07fc169    20s
    Scroll Element Into View         id=product-list-add-button-6855aa22c16f3c50f07fc169
    Click Element                    id=product-list-add-button-6855aa22c16f3c50f07fc169
    Sleep                             1s    # ให้ toast แสดง

Verify Duplicate Product Error
    [Arguments]    ${error_message}=${TC4006_DUPLICATE_ERROR}
    Wait Until Page Contains         ${error_message}    timeout=30s