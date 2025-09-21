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
    [Arguments]    ${start}=${PROMOTION_START_DATE}    ${end}=${PROMOTION_END_DATE}    ${discounted_price}=${PROMOTION_DISCOUNTED_PRICE}
    
    # --- เลือกวันที่เริ่มต้น ---
    Wait Until Element Is Visible    ${PROMOTION_START_DATE_INPUT}    ${TIMEOUT}
    Click Element    ${PROMOTION_START_DATE_INPUT}
    Sleep    1s
    # ลองหาวันที่ 21 ในรูปแบบต่างๆ
    ${day21_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//td[contains(@class,'day') and text()='21']    5s
    Run Keyword If    ${day21_found}    Click Element    xpath=//td[contains(@class,'day') and text()='21']
    Run Keyword Unless    ${day21_found}    Click Element    xpath=//td[text()='21']
    Sleep    1s

    # --- เลือกวันที่สิ้นสุด ---
    Wait Until Element Is Visible    ${PROMOTION_END_DATE_INPUT}    ${TIMEOUT}
    Click Element    ${PROMOTION_END_DATE_INPUT}
    Sleep    1s
    # ลองหาวันที่ 23 ในรูปแบบต่างๆ
    ${day23_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//td[contains(@class,'day') and text()='23']    5s
    Run Keyword If    ${day23_found}    Click Element    xpath=//td[contains(@class,'day') and text()='23']
    Run Keyword Unless    ${day23_found}    Click Element    xpath=//td[text()='23']
    Sleep    1s

    # --- เลือกล็อตสินค้า ---
    Wait Until Element Is Visible    xpath=//label[contains(@class,'flex items-center gap-2 text-sm')]//input[@type='checkbox']    ${TIMEOUT}
    Click Element    xpath=//label[contains(@class,'flex items-center gap-2 text-sm')]//input[@type='checkbox']
    Sleep    0.5s

    # --- ใส่ราคาลด ---
    Wait Until Element Is Visible    ${PROMOTION_DISCOUNTED_PRICE_INPUT}    ${TIMEOUT}
    Clear Element Text    ${PROMOTION_DISCOUNTED_PRICE_INPUT}
    Input Text    ${PROMOTION_DISCOUNTED_PRICE_INPUT}    ${discounted_price}
    Press Keys    ${PROMOTION_DISCOUNTED_PRICE_INPUT}    TAB
    Sleep    0.5s

Click Submit Promotion
    Wait Until Element Is Visible    ${PROMOTION_SUBMIT_BUTTON}    ${TIMEOUT}
    Click Button    ${PROMOTION_SUBMIT_BUTTON}
    Sleep    2s    # รอให้ DOM update / popup โผล่

    # ตรวจสอบข้อความสำเร็จ
    Wait Until Page Contains    สร้างโปรโมชั่นสำเร็จ    ${TIMEOUT}
    Page Should Contain    สร้างโปรโมชั่นสำเร็จ

