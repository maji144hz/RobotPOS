*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/notification_keywords.robot
Resource   ../variables/notification_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC5005_สั่งซื้อผ่านการแจ้งเตือนล้มเหลวเมื่อไม่กรอกจำนวน
    [Documentation]    Objective: ตรวจสอบว่าระบบไม่อนุญาตให้สร้างใบสั่งซื้อเมื่อไม่กรอกจำนวน
    ...    Input Data: เลือกจากการแจ้งเตือนใกล้หมดสต๊อก, เลือกซัพพลายเออร์ '${PO_SUPPLIER_NAME}', จำนวนเว้นว่าง
    ...    Expected Output: ระบบไม่แสดงข้อความสำเร็จ '${PURCHASE_SUCCESS_TEXT}', ฟอร์มยังอยู่/ปุ่ม Submit ยังเห็น และควรเห็นข้อความ '${PO_ERROR_TEXT}' หากมี
    ...    Actual Output: เก็บจากผลลัพธ์การรันคีย์เวิร์ดด้านล่าง (ถ้าพบ error message จะบันทึกไว้ใน log)
    [Tags]    TC5005   Negative    Notification    Lowstock

    # Login
    Input Username    ${NOTIFICATION_USERNAME}
    Input Password    ${NOTIFICATION_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

    # เปิดหน้าต่างการแจ้งเตือน และไป flow ใกล้หมดสต๊อก
    Click Notification Bell Icon
    Filter Lowstock Notifications
    Open Create PO From Notification
    Search And Add Product To PO    ${PO_SEARCH_KEYWORD}
    Select PO Supplier              ${PO_SUPPLIER_NAME}

    # ไม่กรอกจำนวน แล้วพยายามส่ง
    Clear Quantity And Submit Expect Error    ${PO_ERROR_TEXT}
