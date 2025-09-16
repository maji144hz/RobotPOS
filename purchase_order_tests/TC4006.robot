*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/purchase_order_variables.robot
Resource   ../keywords/purchase_order_keywords.robot

*** Test Cases ***
TC4006 Verify Add Duplicate Product To PO
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Open Create Purchase Order Form
    Add Duplicate Product To PO
    Verify Duplicate Product Error
