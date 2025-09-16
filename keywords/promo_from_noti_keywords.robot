*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../variables/promo_from_noti_variables.robot

*** Keywords ***
# ===== Browser & Login =====
Open Browser To Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=input[name="username"]    ${TIMEOUT}

Login Using Resource
    Input Text    css=input[name="username"]    ${VALID_USER}
    Input Text    css=input[name="password"]    ${VALID_PASSWORD}
    Click Button  css=button[type="submit"]
    Wait Until Page Contains Element    ${NOTIFICATION_BELL_ICON}    ${TIMEOUT}

# ===== Notification Actions =====
Open Notification Panel
    Wait Until Element Is Visible    ${NOTIFICATION_BELL_ICON}    ${TIMEOUT}
    Scroll Element Into View          ${NOTIFICATION_BELL_ICON}
    Click Element                     ${NOTIFICATION_BELL_ICON}
    Sleep    1s

Filter Expiring Notifications
    Wait Until Element Is Visible    ${FILTER_EXPIRING_BUTTON}    ${TIMEOUT}
    Click Element    ${FILTER_EXPIRING_BUTTON}

Select Promotion Item
    Wait Until Element Is Visible    ${PROMOTION_ITEM}    ${TIMEOUT}
    Click Element    ${PROMOTION_ITEM}

Click Promotion Action Icon
    Wait Until Element Is Visible    ${PROMOTION_ACTION_ICON}    ${TIMEOUT}
    Click Element    ${PROMOTION_ACTION_ICON}

# ===== Helpers =====
Select Promotion Product
    [Arguments]    ${product}
    # พยายามใช้ Select From List (กรณี <select>) ก่อน
    ${ok}=    Run Keyword And Return Status    Select From List By Label    ${PROMOTION_PRODUCT_COMBOBOX}    ${product}
    Run Keyword If    ${ok}    RETURN FROM KEYWORD
    # fallback: คลิก combobox แล้วเลือก option แบบ element (ul/li/div) ที่มีข้อความ
    Wait Until Element Is Visible    ${PROMOTION_PRODUCT_COMBOBOX}    ${TIMEOUT}
    Click Element    ${PROMOTION_PRODUCT_COMBOBOX}
    ${opt_xpath}=    Set Variable    xpath=//li[contains(normalize-space(.),'${product}')]|//div[contains(normalize-space(.),'${product}')]|//span[contains(normalize-space(.),'${product}')]
    Wait Until Element Is Visible    ${opt_xpath}    ${TIMEOUT}
    Click Element    ${opt_xpath}

Wait Until Any Element Is Visible
    [Arguments]    @{locators}    ${timeout}=10s
    FOR    ${locator}    IN    @{locators}
        ${result}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    ${timeout}
        Run Keyword If    ${result}    RETURN FROM KEYWORD
    END
    Fail    ไม่พบ element ความสำเร็จใน timeout ที่กำหนด

# ===== Promotion Form =====
Fill Promotion Form
    [Arguments]    ${name}=${PROMOTION_NAME}    ${start}=${PROMOTION_START_DATE}    ${end}=${PROMOTION_END_DATE}    ${discounted_price}=${PROMOTION_DISCOUNTED_PRICE}    ${product}=${PROMOTION_PRODUCT}
    Wait Until Element Is Visible    ${PROMOTION_NAME_INPUT}    ${TIMEOUT}

    # --- กรอกชื่อโปรโมชั่น ---
    Clear Element Text    ${PROMOTION_NAME_INPUT}
    Input Text    ${PROMOTION_NAME_INPUT}    ${name}
    Sleep    0.2s

    # --- เลือก product (รองรับ <select> และ combobox แบบ custom) ---
    Run Keyword And Ignore Error    Select Promotion Product    ${product}
    Sleep    0.3s

    # --- รอ input วันที่ แล้วตั้งค่า via JS (single-line) พร้อม trigger events ---
    Wait Until Element Is Visible    ${PROMOTION_START_DATE_INPUT}    ${TIMEOUT}
    Wait Until Element Is Visible    ${PROMOTION_END_DATE_INPUT}    ${TIMEOUT}
    Execute Javascript    var start='${start}'; var end='${end}'; var s=document.getElementById('create-promotion-start-date'); var e=document.getElementById('create-promotion-end-date'); if(s){s.value=start; s.dispatchEvent(new Event('input',{bubbles:true})); s.dispatchEvent(new Event('change',{bubbles:true}));} if(e){e.value=end; e.dispatchEvent(new Event('input',{bubbles:true})); e.dispatchEvent(new Event('change',{bubbles:true}));}

    Sleep    0.3s

    # --- เลือกล็อตสินค้า ---
    Wait Until Element Is Visible    ${PROMOTION_LOT_LOCATOR}    ${TIMEOUT}
    Click Element    ${PROMOTION_LOT_LOCATOR}
    Sleep    0.4s

    # --- ใส่ราคาลด ---
    Clear Element Text    ${PROMOTION_DISCOUNTED_PRICE_INPUT}
    Input Text    ${PROMOTION_DISCOUNTED_PRICE_INPUT}    ${discounted_price}
    Sleep    0.2s

Click Submit Promotion
    Wait Until Element Is Visible    id=create-promotion-submit-button    ${TIMEOUT}
    Click Button    id=create-promotion-submit-button
    Sleep    2s    # รอให้ DOM update / popup โผล่

    ${ok1}=    Run Keyword And Return Status    Page Should Contain    สร้างโปรโมชั่นสำเร็จ
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    บันทึกสำเร็จ
    ${ok3}=    Run Keyword And Return Status    Page Should Contain    สำเร็จ
    ${ok4}=    Run Keyword And Return Status    Page Should Contain    Promotion Created Successfully
    ${row_ok}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//td[contains(text(),'${PROMOTION_NAME}')]

    Run Keyword Unless    ${ok1} or ${ok2} or ${ok3} or ${ok4} or ${row_ok}
    ...    Capture Page Screenshot
    Run Keyword Unless    ${ok1} or ${ok2} or ${ok3} or ${ok4} or ${row_ok}
    ...    Fail    ไม่พบหลักฐานว่าสร้างโปรโมชั่นสำเร็จ

