*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/sale_history_keywords.robot
Resource   ../variables/sale_history_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC11001_ดูรายละเอียดประวัติการขาย
    [Documentation]    ตรวจสอบว่าสามารถดูรายละเอียดคำสั่งซื้อได้สำเร็จ
    [Tags]    TC11001    Sales History    View Details

    # Step 1-4: Login
    Input Username    ${TC11001_USERNAME}
    Input Password    ${TC11001_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

    # Step 5: คลิกเมนูประวัติการขาย
    Click Sales History Menu

    # Step 6: ตรวจสอบว่าหน้าเว็บแสดงรายการคำสั่งซื้อในตาราง
    Verify Order Table Is Displayed

    # Step 7: คลิกเลือกรายการที่จะดู
    Click Order To View Details    ${TC11001_ORDER_ID}

    # Step 8: ตรวจสอบว่ามีหน้าต่าง Modal แสดงขึ้นมา
    Verify Order Detail Modal Is Displayed

    # ตรวจสอบข้อมูลพื้นฐานใน Modal (ไม่ตรวจสอบ Order ID เฉพาะ)
    Page Should Contain    รายละเอียดคำสั่งซื้อ
    Page Should Contain Element    ${TC11001_ORDER_DETAIL_MODAL}
    
    # ตรวจสอบว่ามีข้อมูลการชำระเงิน
    Page Should Contain    วิธีชำระ
    Page Should Contain    เงินที่รับ
    Page Should Contain    เงินทอน
    
    # ตรวจสอบว่ามีข้อมูลล็อต
    Page Should Contain    ล็อต
    
    Log    เปิดดูรายละเอียดคำสั่งซื้อสำเร็จ