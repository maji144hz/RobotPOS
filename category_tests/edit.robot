*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           random

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers
Test Setup        Login And Go To Category Page

Resource          ../variables/common_variables.robot
Resource          ../variables/category_edit_variables.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/category_edit_keywords.robot

*** Test Cases ***
เพิ่มและแก้ไขหมวดหมู่ (คลิกปุ่มแก้ไขด้วย title)
    ${R1}=        Generate Random Number
    ${name}=      Set Variable    ${CATEGORY_BASE} ${R1}

    Create Category                 ${name}
    Search Category By Name         ${name}
    Click Edit Category Button

    ${R2}=        Generate Random Number
    ${new_name}=  Set Variable    ${name} (แก้ไข ${R2})
    Fill Edit Dialog And Save       ${new_name}

    Search Category By Name         ${new_name}
    Screenshot Row Containing Text  ${new_name}    edited_category.png
