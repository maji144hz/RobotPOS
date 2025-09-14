*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   keywords/sale_history_keywords.robot
Resource   variables/sale_history_variables.robot

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

    # ตรวจสอบข้อมูลใน Modal
    Verify Order Details Content    ${TC11001_ORDER_ID}    ${TC11001_ORDER_DATE}    ${TC11001_ORDER_STATUS}    ${TC11001_ORDER_TOTAL}    ${TC11001_ORDER_ITEMS_COUNT}
    
    # ตรวจสอบข้อมูลการชำระเงิน
    Verify Payment Details    ${TC11001_PAYMENT_METHOD}    ${TC11001_AMOUNT_RECEIVED}    ${TC11001_CHANGE_AMOUNT}
    
    # ตรวจสอบข้อมูลล็อต
    Verify Lot Information    ${TC11001_LOT_ITEMS_COUNT}    ${TC11001_LOT_COUNT}    ${TC11001_PIECES_COUNT}

    # ตรวจสอบข้อความยืนยันระบบ
    Verify System Data Check    ${TC11001_SUCCESS_MESSAGE}
    Verify Modal Display    ${TC11001_ORDER_DETAIL_MODAL}    ${TC11001_MODAL_MESSAGE}

