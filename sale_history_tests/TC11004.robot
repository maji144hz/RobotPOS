*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/sale_history_keywords.robot
Resource   ../variables/sale_history_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC11004_การแก้ไขสถานะสินค้า_กรณีเปลี่ยนเป็นยกเลิก
    [Documentation]    ตรวจสอบว่าสามารถแก้ไขสถานะสินค้ากรณีเปลี่ยนเป็นยกเลิกในรายการคำสั่งซื้อได้สำเร็จ
    [Tags]    TC11004    Sales History    Change Status

    # Step 1: เปิดเว็บเบราว์เซอร์และไปที่ URL: http://localhost:5173/login
    Go To    ${BASE_URL}/login

    # Step 2: กรอกชื่อผู้ใช้ในช่อง "Username"
    Input Username    ${TC11004_USERNAME}

    # Step 3: กรอกรหัสผ่านในช่อง "Password"
    Input Password    ${TC11004_PASSWORD}

    # Step 4: คลิกปุ่ม "Login"
    Submit Credentials
    Welcome Page Should Be Open

    # Step 5: คลิกเมนู"ประวัติการขาย"
    Click Sales History Menu

    # Step 6: คลิกเลือกรายการที่จะแก้ไขสถานะ | ORD2509146866556 |
    Click Order To Change Status    ${TC11004_ORDER_ID}

    # ตรวจสอบว่า Modal แสดงขึ้นมา
    Page Should Contain Element    ${TC11004_ORDER_DETAIL_MODAL}
    Page Should Contain    รายละเอียดคำสั่งซื้อ

    # Step 7: คลิกdropdownด้านล่างซ้ายและเลือกสถานะที่จะแก้ไขจาก "ขายสำเร็จ" | ยกเลิก |
    Select Status From Dropdown    ${TC11004_NEW_STATUS}

    # Step 8: คลิกปุ่มยืนยัน
    Click Confirm Status Change

    # ตรวจสอบผลลัพธ์ - ควรแสดงข้อความสำเร็จ
    Verify Status Change Success    ${TC11004_SUCCESS_MESSAGE}