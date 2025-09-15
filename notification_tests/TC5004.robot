*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/notification_keywords.robot
Resource   ../variables/notification_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC5004_การแจ้งเตือนสินค้าใกล้หมดสต๊อกและสั่งซื้อผ่านการแจ้งเตือน
    [Documentation]    ตรวจสอบการดูการแจ้งเตือนสินค้าใกล้หมดสต๊อกและสร้างใบสั่งซื้อจากแจ้งเตือน ตามสเปกในเอกสาร
    [Tags]    TC5004    Notification    Lowstock    PurchaseOrder

    # Login
    Input Username    ${NOTIFICATION_USERNAME}
    Input Password    ${NOTIFICATION_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

    # เปิดหน้าต่างการแจ้งเตือน
    Click Notification Bell Icon
    Verify Notification Window Is Displayed

    # เลือกแท็บ/กรอง "ใกล้หมดสต๊อก"
    Filter Lowstock Notifications

    # เปิดการสร้าง PO จากรายการแจ้งเตือน และเพิ่มสินค้า
    Open Create PO From Notification
    Search And Add Product To PO    ${PO_SEARCH_KEYWORD}

    # เลือกซัพพลายเออร์ กำหนดจำนวน/หน่วย และส่งคำสั่งซื้อ
    Select PO Supplier              ${PO_SUPPLIER_NAME}
    Fill PO Quantity And Unit       ${PO_QUANTITY}
    Submit Purchase Order And Verify
