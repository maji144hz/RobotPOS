*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/purchase_order_keywords.robot
Resource   ../variables/purchase_order_variables.robot

*** Test Cases ***
TC3001 Verify Add Product To Purchase Order
    [Documentation]    ตรวจสอบว่าสามารถเพิ่มสินค้าใน Purchase Order ได้
    Open Browser To Login Page
    Login Using Resource
    Go To Purchase Order Page
    Open Create Purchase Order Form
    Search And Add Product To PO
    Fill PO Quantity And Unit
    Fill Purchase Price
    Select PO Supplier
    Submit Purchase Order And Verify
