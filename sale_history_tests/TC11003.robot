*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/sale_history_keywords.robot
Resource   ../variables/sale_history_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC11003_การแก้ไขรายการสินค้าในรายการคำสั่งซื้อไม่สำเร็จ
    [Documentation]    ตรวจสอบว่าสามารถแก้ไขรายการสินค้าในรายการคำสั่งซื้อไม่สำเร็จ
    [Tags]    TC11003    Sales History    Edit Product Invalid

    # Step 1-4: Login
    Input Username    ${TC11003_USERNAME}
    Input Password    ${TC11003_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

    # Step 5: คลิกเมนูประวัติการขาย
    Click Sales History Menu

    # Step 6: ตรวจสอบว่าหน้าเว็บแสดงรายการคำสั่งซื้อในตาราง
    Verify Order Table Is Displayed

    # Step 7: คลิกเลือกรายการที่จะแก้ไข
    Click Order To Edit Invalid    ${TC11003_ORDER_ID}

    # Step 8: คลิกปุ่ม "แก้ไข"
    Click Edit Button Invalid

    # Step 9: คลิกปุ่ม "ดำเนินการต่อ"
    Click Continue Button Invalid

    # Step 10-11: เลือกข้อมูลที่ต้องการแก้ไขและกรอกราคา 0 (ไม่ถูกต้อง)
    Input Invalid Price    ${TC11003_INVALID_PRICE}

    # Step 12: คลิกปุ่ม "บันทึกการเปลี่ยนแปลง"
    Click Save Changes Button Invalid

    # ตรวจสอบผลลัพธ์ - ควรแสดงข้อความ error
    Verify Error Message    ${TC11003_ERROR_MESSAGE}
