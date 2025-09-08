*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/promotion_keywords.robot
Resource   ../variables/promotion_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
เพิ่มโปรโมชั่นโดยตรง
    # Login
    Login Using Resource

    # เข้า Promotion Page
    Go To Promotion Page

    # สร้างโปรโมชั่น
    Click Add Promotion Button
    Input Promotion Name           ${PROMOTION_NAME}
    Select Promotion Date          start    ${PROMOTION_START_DAY}    ${PROMOTION_START_MONTH}    ${PROMOTION_START_YEAR}
    Select Promotion Date          end      ${PROMOTION_END_DAY}      ${PROMOTION_END_MONTH}      ${PROMOTION_END_YEAR}
    Select Promotion Product       ${PROMOTION_PRODUCT}
    Input Original Price           ${PROMOTION_ORIGINAL_PRICE}
    Select Lot For Promotion       ${PROMOTION_LOT_LOCATOR}
    Input Discounted Price         ${PROMOTION_DISCOUNTED_PRICE}
    Click Submit Promotion
