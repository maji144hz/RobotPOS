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
Go To Promotion Page
    Go To    ${BASE_URL}/management/promotions
    Sleep    2s

Click Add Promotion Button
    Wait Until Element Is Visible    id=create-promotion-button    ${TIMEOUT}
    Click Element                   id=create-promotion-button
    Wait Until Element Is Visible   id=create-promotion-name-input    ${TIMEOUT}

Input Promotion Name
    [Arguments]    ${name}
    Input Text    id=create-promotion-name-input    ${name}

Input Promotion Start Date
    [Arguments]    ${start_date}
    Input Text    id=create-promotion-start-date    ${start_date}

Input Promotion End Date
    [Arguments]    ${end_date}
    Input Text    id=create-promotion-end-date    ${end_date}

Select Promotion Product
    [Arguments]    ${product}
    Select From List By Label    id=create-promotion-product-combobox    ${product}

Input Original Price
    [Arguments]    ${price}
    Input Text    id=original-price    ${price}

Select Lot For Promotion
    [Arguments]    ${lot_locator}
    Click Element    ${lot_locator}

Input Discounted Price
    [Arguments]    ${discounted_price}
    Input Text    id=create-promotion-discounted-price-input    ${discounted_price}

Click Submit Promotion
    Wait Until Element Is Visible    id=create-promotion-submit-button    ${TIMEOUT}
    Click Button    id=create-promotion-submit-button
    Wait Until Page Contains    สร้างโปรโมชั่นสำเร็จ    ${TIMEOUT}
