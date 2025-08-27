*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../login_tests/resource.robot
Resource          ../variables/variables.robot
Resource          ../keywords/products_keywords.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers
Test Setup        Login Using Resource

*** Test Cases ***
เพิ่มสินค้า TC1004
  Create Directory                     ${SCREEN_DIR}

    Go To                               ${PRODUCT_LIST_URL}
    Wait Until Element Is Visible        ${BTN_ADD_PRODUCT}    ${TIMEOUT}
    Click Element                        ${BTN_ADD_PRODUCT}
    Wait Table Idle

    Ensure On Create Product Page
    Upload Product Image                 ${PRODUCT_IMAGE_PATH}

    Type    ${INPUT_NAME}                     น้ำยาล้างจาน
    Type    ${INPUT_DESC}                     น้ำยาล้างจานของดี


 
    

    

    Click Save Product
    Click If Exists                      ${SWAL_CONFIRM}
    Wait Table Idle


*** Keywords ***
Login Using Resource
    Go To Login Page
    Input Username     ${VALID USER}
    Input Password     ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Sleep    0.2s
