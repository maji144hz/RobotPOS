*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           random

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers
Test Setup        Login And Go To Category Page

Resource          ../variables/common_variables.robot
Resource          ../variables/category_variables.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/category_keywords.robot

*** Test Cases ***
เพิ่มหมวดหมู่
    ${RANDOM}=    Generate Random Number
    ${name}=      Set Variable    ${CATEGORY_BASE} ${RANDOM}
    Create Category           ${name}
    Search Category By Name   ${name}
    Screenshot Latest Category Row    ${name}
